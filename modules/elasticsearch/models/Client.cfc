/**
*
* Elasticsearch Client
*
* @singleton
* @package cbElasticsearch.models.Elasticsearch
* @author Jon Clausen <jclausen@ortussolutions.com>
* @license Apache v2.0 <http://www.apache.org/licenses/>
* 
*/
component 
	name="ElasticsearchClient" 
	accessors="true" 
	threadsafe 
	singleton
{
	property name="wirebox" inject="wirebox";

	/**
	* Properties created on init()
	*/
	property name="nativeClient";
	
	/**
	* Constructor
	*/
	public function init(){

		return this;
	}

	/**
	* Pool close method
	**/
	public function close(){
		variables.nativeClient.close();
	}

	/**
	* After init the autowire properties
	*/
	public function onDIComplete(){
		
		//The Elasticsearch driver client
		variables.nativeClient = variables.wirebox.getInstance( getConfig().get( 'client' ) );

		return this;
	}

	public function getConfig() provider="Config@cbElasticsearch"{}


	/**
	* Execute a client search request
	* @searchBuilder 	SearchBuilder 	An instance of the SearchBuilder object
	* 
	* @return 			iNativeClient 	An implementation of the iNativeClient
	* @interfaced
	**/
	SearchResult function executeSearch( required searchBuilder searchBuilder ){

		return variables.nativeClient.executeSearch( argumentCollection=arguments );

	}

	/**
	* Verifies whether an index exists
	* 
	* @indexName 		string 		the name of the index
	**/
	boolean function indexExists( required string indexName ){

		return variables.nativeClient.indexExists( argumentCollection=arguments );
	}

	/**
	* Applies an index item ( create/update )
	* @indexBuilder 	IndexBuilder 	An instance of the IndexBuilder object
	* 
	* @return 			boolean 		Boolean result as to whether the index was created
	**/
	boolean function applyIndex( required IndexBuilder indexBuilder ){

		return variables.nativeClient.applyIndex( argumentCollection=arguments );

	}

	/**
	* Deletes an index
	* 
	* @indexName 		string 		the name of the index to be deleted
	* 
	**/
	struct function deleteIndex( required string indexName ){
		
		return variables.nativeClient.deleteIndex( argumentCollection=arguments );

	}


	/**
	* Applies mappings to an index
	* @indexName 		string 		the index containing the mappings
	* @mappings 		struct 		the struct representation of the mappings
	**/
	struct function applyMappings( required string indexName, required struct mappings ){

		return variables.nativeClient.applyMappings( argumentCollection=arguments );

	}

	/**
	* Deletes a mapping
	* 
	* @indexName 		string 		the name of the index which contains the mapping
	* @mapping 			string 		the mapping ( e.g. type ) to delete
	* @throwOnError 	boolean	  	Whether to throw an error if the mapping could not be deleted ( default=false )
	* 
	* @return 			struct 		the deletion transaction response
	**/
	boolean function deleteMapping( 
		required string indexName, 
		required string mapping, 
		boolean throwOnError=false 
	){

		return variables.nativeClient.deleteMapping( argumentCollection=arguments );

	}

	/**
	* Retrieves a document by ID
	* @id 		any 		The document key
	* @index 	string 		The name of the index
	* @type 	type 		The name of the type
	* @interfaced
	* 
	* @return 	any 		Returns a Document object if found, otherwise returns null
	**/
	any function get( 
		required any id,
		string index,
		string type
	){
		
		return variables.nativeClient.get( argumentCollection=arguments );

	}

	/**
	* @document 		Document@cbElasticSearch 		An instance of the elasticsearch Document object
	* 
	* @return 			Document@cbElasticsearch 		The saved document object
	**/
	Document function save( required Document document ){

		return variables.nativeClient.save( argumentCollection=arguments );

	}

	/**
	* Deletes a single document
	* @document 		Document 		the Document object for the document to be deleted
	* @throwOnError 	boolean			whether to throw an error if the document cannot be deleted ( default: false )
	**/
	boolean function delete( required any document, boolean throwOnError=true ){
		return variables.nativeClient.delete( argumentCollection=arguments );
	}

	/**
	* Persists multiple items to the index
	* @documents 		array 					An array of elasticsearch Document objects to persist
	* 
	* @return 			array					An array of results for the saved items
	**/
	array function saveAll( required array documents ){

		return variables.nativeClient.saveAll( argumentCollection=arguments );

	}

	/**
	* Deletes documents from an array of documents or IDs
	* @documents 	array 		Either an array of Document objects
	* @throwOnError 	boolean			whether to throw an error if the document cannot be deleted ( default: false )
	**/
	any function deleteAll( 
		required array documents, 
		boolean throwOnError=false 
	){

		return variables.nativeClient.deleteAll( documents );

	}



}
/**
*
* Elasticsearch Native Client Interface
* 
* @singleton
* @package cbElasticsearch.models
* @author Jon Clausen <jclausen@ortussolutions.com>
* @license Apache v2.0 <http://www.apache.org/licenses/>
* 
*/
interface{


	/**
	* Closes any connections to the pool and destroys the client singleton
	* @interfaced
	**/
	void function close(){}


	/**
	* Execute a client search request
	* @searchBuilder 	SearchBuilder 	An instance of the SearchBuilder object
	* 
	* @return 			iNativeClient 	An implementation of the iNativeClient
	* @interfaced
	**/
	SearchResult function executeSearch( required searchBuilder searchBuilder ){}

	/**
	* Verifies whether an index exists
	* 
	* @indexName 		string 		the name of the index
	**/
	boolean function indexExists( required string indexName ){}

	/**
	* Applies an index item ( create/update )
	* @indexBuilder 	IndexBuilder 	An instance of the IndexBuilder object
	* 
	* @return 			struct 		A struct representation of the transaction result
	* @interfaced
	**/
	boolean function applyIndex( required IndexBuilder indexBuilder ){}

	/**
	* Deletes an index
	* 
	* @indexName 		string 		the name of the index to be deleted
	* 
	**/
	struct function deleteIndex( required string indexName ){}


	struct function applyMappings( required string indexName, required struct mappings ){}

	/**
	* Deletes a mapping
	* 
	* @indexName 		string 		the name of the index which contains the mapping
	* @mapping 			string 		the mapping ( e.g. type ) to delete
	* @throwOnError 	boolean	  	Whether to throw an error if the mapping could not be deleted ( default=false )
	* 
	* @return 			struct 		the deletion transaction response
	**/
	boolean function deleteMapping( required string indexName, required string mapping, boolean throwOnError=false ){}

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
	){}

	/**
	* @document 		Document@cbElasticSearch 		An instance of the elasticsearch Document object
	* 
	* @return 			iNativeClient 					An implementation of the iNativeClient
	* @interfaced
	**/
	Document function save( required Document document ){}

	/**
	* Deletes a single document
	* @document 		Document 		the Document object for the document to be deleted
	* @throwOnError 	boolean			whether to throw an error if the document cannot be deleted ( default: false )
	**/
	boolean function delete( required any document, boolean throwOnError=true ){}

	/**
	* Persists multiple items to the index
	* @documents 		array 					An array of elasticsearch Document objects to persist
	* 
	* @return 			array					An array of results for the saved items
	* @interfaced
	**/
	array function saveAll( required array documents ){}

	/**
	* Deletes documents from an array of documents or IDs
	* @documents 	array 		Either an array of Document objects
	* @throwOnError 	boolean			whether to throw an error if the document cannot be deleted ( default: false )
	**/
	any function deleteAll( 
		required array documents, 
		boolean throwOnError=false 
	){}


}
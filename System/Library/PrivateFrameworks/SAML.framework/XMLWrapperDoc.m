@interface XMLWrapperDoc
- (BOOL)createDocument:(id *)a3;
- (BOOL)setXMLDoc:(id *)a3;
- (NSData)schemaData;
- (NSData)xmlData;
- (NSDictionary)namespaces;
- (XMLWrapperDoc)initWithData:(id)a3 schema:(id)a4 error:(id *)a5;
- (XMLWrapperDoc)initWithElement:(id)a3 schema:(id)a4 error:(id *)a5;
- (XMLWrapperElement)documentElement;
- (XMLWrapperQuery)query;
- (_xmlDoc)docNode:(id *)a3;
- (_xmlDoc)docPtr;
- (_xmlNode)nodePtr;
- (id)createDocumentElement:(id *)a3;
- (id)firstResultByXpathQuery:(id)a3 error:(id *)a4;
- (id)getResultsByXpathQuery:(id)a3 error:(id *)a4;
- (id)xmlString:(id *)a3;
- (void)dealloc;
- (void)setDocumentElement:(id)a3;
- (void)setNamespace:(id)a3;
- (void)setQuery:(id)a3;
- (void)setSchemaData:(id)a3;
- (void)setXmlData:(id)a3;
@end

@implementation XMLWrapperDoc

- (XMLWrapperDoc)initWithData:(id)a3 schema:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)XMLWrapperDoc;
  v11 = [(XMLWrapperDoc *)&v19 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v11->_xmlData, a3);
  objc_storeStrong((id *)&v12->_schemaData, a4);
  v13 = objc_alloc_init(XMLWrapperQuery);
  query = v12->_query;
  v12->_query = v13;

  if (![(XMLWrapperDoc *)v12 createDocument:a5]) {
    goto LABEL_5;
  }
  uint64_t v15 = [(XMLWrapperDoc *)v12 createDocumentElement:a5];
  documentElement = v12->_documentElement;
  v12->_documentElement = (XMLWrapperElement *)v15;

  if (v12->_documentElement) {
LABEL_4:
  }
    v17 = v12;
  else {
LABEL_5:
  }
    v17 = 0;

  return v17;
}

- (void)dealloc
{
  doc = self->_doc;
  if (doc) {
    xmlFreeDoc(doc);
  }
  v4.receiver = self;
  v4.super_class = (Class)XMLWrapperDoc;
  [(XMLWrapperDoc *)&v4 dealloc];
}

- (XMLWrapperDoc)initWithElement:(id)a3 schema:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)XMLWrapperDoc;
  id v10 = [(XMLWrapperDoc *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_schemaData, a4);
    objc_storeStrong((id *)&v11->_documentElement, a3);
  }

  return v11;
}

- (void)setNamespace:(id)a3
{
  namespaces = self->_namespaces;
  id v5 = a3;
  v6 = [v5 prefix];
  [(NSMutableDictionary *)namespaces setObject:v5 forKey:v6];

  id v7 = [(XMLWrapperDoc *)self query];
  [v7 registerNamespace:v5];
}

- (id)getResultsByXpathQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(XMLWrapperDoc *)self query];
  id v8 = [v7 searchNodeWithXpathQuery:self->_docNode query:v6 error:a4];

  return v8;
}

- (id)firstResultByXpathQuery:(id)a3 error:(id *)a4
{
  objc_super v4 = [(XMLWrapperDoc *)self getResultsByXpathQuery:a3 error:a4];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 firstObject];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (_xmlDoc)docNode:(id *)a3
{
  id v5 = xmlCharStrdup("2.0");
  xmlDocPtr v6 = xmlNewDoc(v5);
  if (!v6)
  {
    if (a3)
    {
      id v7 = 0;
      *a3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"XMLWrapperErrorDomain" code:101 userInfo:0];
      return v7;
    }
    return 0;
  }
  id v7 = v6;
  id v8 = [(XMLWrapperDoc *)self documentElement];
  id v9 = (xmlNode *)[v8 xmlNode:a3];

  if (!v9)
  {
    if (a3) {
      *a3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"XMLWrapperErrorDomain" code:101 userInfo:0];
    }
    xmlFreeDoc(v7);
    return 0;
  }
  xmlDocSetRootElement(v7, v9);
  return v7;
}

- (id)xmlString:(id *)a3
{
  objc_super v4 = -[XMLWrapperDoc docNode:](self, "docNode:");
  if (v4)
  {
    id v5 = v4;
    xmlNodePtr RootElement = xmlDocGetRootElement(v4);
    if (RootElement)
    {
      id v7 = RootElement;
      id v8 = xmlBufferCreate();
      if (v8)
      {
        id v9 = v8;
        if (xmlNodeDump(v8, v5, v7, 0, 1) < 1)
        {
          v12 = 0;
        }
        else
        {
          id v10 = [NSString alloc];
          v11 = xmlBufferContent(v9);
          v12 = (void *)[v10 initWithBytes:v11 length:xmlBufferLength(v9) encoding:4];
        }
        xmlFreeDoc(v5);
        xmlBufferFree(v9);
        goto LABEL_14;
      }
    }
    if (a3) {
      *a3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"XMLWrapperErrorDomain" code:101 userInfo:0];
    }
    xmlFreeDoc(v5);
  }
  else if (a3)
  {
    v12 = 0;
    *a3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"XMLWrapperErrorDomain" code:101 userInfo:0];
    goto LABEL_14;
  }
  v12 = 0;
LABEL_14:
  return v12;
}

- (_xmlNode)nodePtr
{
  return self->_docNode;
}

- (_xmlDoc)docPtr
{
  return self->_doc;
}

- (XMLWrapperQuery)query
{
  return self->_query;
}

- (BOOL)createDocument:(id *)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  if (-[XMLWrapperDoc setXMLDoc:](self, "setXMLDoc:"))
  {
    id v5 = [(XMLWrapperDoc *)self schemaData];

    if (v5)
    {
      xmlDocPtr v6 = [XMLWrapperSchema alloc];
      id v7 = [(XMLWrapperDoc *)self schemaData];
      id v8 = [(XMLWrapperSchema *)v6 initWithSchemaData:v7];

      if (v8)
      {
        LOBYTE(a3) = [(XMLWrapperSchema *)v8 validateDocument:self->_doc error:a3];
      }
      else if (a3)
      {
        id v9 = (void *)MEMORY[0x263F087E8];
        uint64_t v12 = *MEMORY[0x263F08320];
        v13[0] = @"Failed to create schema context";
        id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
        *a3 = [v9 errorWithDomain:@"XMLWrapperErrorDomain" code:100 userInfo:v10];

        LOBYTE(a3) = 0;
      }
    }
    else
    {
      LOBYTE(a3) = 1;
    }
  }
  else
  {
    LOBYTE(a3) = 0;
  }
  return (char)a3;
}

- (BOOL)setXMLDoc:(id *)a3
{
  id v5 = [(XMLWrapperDoc *)self xmlData];
  Memory = xmlReadMemory((const char *)[v5 bytes], objc_msgSend(v5, "length"), "", 0, 1);
  id v7 = Memory;
  self->_doc = Memory;
  if (a3 && !Memory)
  {
    *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"XMLWrapperErrorDomain" code:200 userInfo:0];
  }

  return v7 != 0;
}

- (id)createDocumentElement:(id *)a3
{
  xmlNodePtr RootElement = xmlDocGetRootElement(self->_doc);
  self->_docNode = RootElement;
  if (RootElement)
  {
    xmlDocPtr v6 = +[XMLWrapperElementFactory sharedInstance];
    id v7 = (objc_class *)[v6 classForXMLNode:self->_docNode error:a3];

    xmlNodePtr RootElement = (_xmlNode *)[[v7 alloc] initWithNode:self->_docNode doc:self->_doc query:self->_query error:a3];
  }
  return RootElement;
}

- (NSData)xmlData
{
  return self->_xmlData;
}

- (void)setXmlData:(id)a3
{
}

- (NSData)schemaData
{
  return self->_schemaData;
}

- (void)setSchemaData:(id)a3
{
}

- (XMLWrapperElement)documentElement
{
  return self->_documentElement;
}

- (void)setDocumentElement:(id)a3
{
}

- (NSDictionary)namespaces
{
  return &self->_namespaces->super;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_documentElement, 0);
  objc_storeStrong((id *)&self->_schemaData, 0);
  objc_storeStrong((id *)&self->_xmlData, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
}

@end
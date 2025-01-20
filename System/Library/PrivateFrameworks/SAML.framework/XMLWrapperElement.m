@interface XMLWrapperElement
- (NSArray)childElementSequence;
- (NSArray)elements;
- (NSDictionary)attributes;
- (NSDictionary)namespaces;
- (NSString)tagName;
- (NSString)textContent;
- (XMLWrapperElement)initWithNode:(_xmlNode *)a3 doc:(_xmlDoc *)a4 query:(id)a5 error:(id *)a6;
- (XMLWrapperElement)initWithTagName:(id)a3 error:(id *)a4;
- (XMLWrapperQuery)query;
- (_xmlNode)xmlNode:(id *)a3;
- (id)attributeWithName:(id)a3;
- (id)firstElementByTagName:(id)a3;
- (id)firstResultByXpathQuery:(id)a3;
- (id)getElementsByTagName:(id)a3;
- (id)getResultsByXpathQuery:(id)a3;
- (id)xmlString:(id *)a3;
- (void)addChildElement:(id)a3;
- (void)addChildElement:(id)a3 before:(id)a4;
- (void)dealloc;
- (void)removeChildElement:(id)a3;
- (void)reorderChildElements;
- (void)replaceChildElement:(id)a3 newElement:(id)a4;
- (void)setAttributeWithName:(id)a3 value:(id)a4;
- (void)setChildElementSequence:(id)a3;
- (void)setElements:(id)a3;
- (void)setNamespace:(id)a3;
- (void)setQuery:(id)a3;
- (void)setTagName:(id)a3;
- (void)setTextContent:(id)a3;
@end

@implementation XMLWrapperElement

- (XMLWrapperElement)initWithNode:(_xmlNode *)a3 doc:(_xmlDoc *)a4 query:(id)a5 error:(id *)a6
{
  id v44 = a5;
  v45.receiver = self;
  v45.super_class = (Class)XMLWrapperElement;
  v11 = [(XMLWrapperElement *)&v45 init];
  v12 = v11;
  if (v11)
  {
    v11->_xmlNode = a3;
    objc_storeStrong((id *)&v11->_query, a5);
    uint64_t v13 = [MEMORY[0x263EFF980] array];
    elements = v12->_elements;
    v12->_elements = (NSMutableArray *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    attributes = v12->_attributes;
    v12->_attributes = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    namespaces = v12->_namespaces;
    v12->_namespaces = (NSMutableDictionary *)v17;

    v19 = [NSString stringWithUTF8String:v12->_xmlNode->name];
    [(XMLWrapperElement *)v12 setTagName:v19];

    xmlNode = v12->_xmlNode;
    ns = xmlNode->ns;
    if (ns)
    {
      do
      {
        v22 = [[XMLWrapperNamespace alloc] initWithNsNode:ns error:a6];
        if (v22) {
          [(XMLWrapperElement *)v12 setNamespace:v22];
        }
        ns = ns->next;
      }
      while (ns);
      xmlNode = v12->_xmlNode;
    }
    properties = xmlNode->properties;
    if (properties)
    {
      uint64_t v24 = [MEMORY[0x263EFF9A0] dictionary];
      v25 = v12->_attributes;
      v12->_attributes = (NSMutableDictionary *)v24;

      do
      {
        v26 = [[XMLWrapperAttribute alloc] initWithNode:properties error:a6];
        v27 = v26;
        if (v26)
        {
          v28 = v12->_attributes;
          v29 = [(XMLWrapperAttribute *)v26 name];
          [(NSMutableDictionary *)v28 setObject:v27 forKey:v29];
        }
        properties = properties->next;
      }
      while (properties);
      xmlNode = v12->_xmlNode;
    }
    children = xmlNode->children;
    if (children)
    {
      v31 = [MEMORY[0x263EFF980] array];
      while (1)
      {
        xmlElementType type = children->type;
        if (type != XML_TEXT_NODE) {
          break;
        }
        if (children->content)
        {
          v38 = objc_msgSend(NSString, "stringWithUTF8String:");
          v39 = [MEMORY[0x263F089C0] whitespaceAndNewlineCharacterSet];
          v37 = [v38 stringByTrimmingCharactersInSet:v39];

          if (v37 && ([v37 isEqualToString:&stru_26F2AD000] & 1) == 0)
          {
            textContent = v12->_textContent;
            if (textContent)
            {
              v41 = [(NSString *)textContent stringByAppendingString:v37];
            }
            else
            {
              v41 = v37;
            }
            v42 = v12->_textContent;
            v12->_textContent = v41;
          }
LABEL_26:
        }
LABEL_27:
        children = children->next;
        if (!children)
        {
          if ([v31 count]) {
            [(XMLWrapperElement *)v12 setElements:v31];
          }

          goto LABEL_31;
        }
      }
      if (type != XML_ELEMENT_NODE) {
        goto LABEL_27;
      }
      v33 = +[XMLWrapperElementFactory sharedInstance];
      v34 = (objc_class *)[v33 classForXMLNode:children error:a6];

      id v35 = [v34 alloc];
      v36 = [(XMLWrapperElement *)v12 query];
      v37 = (void *)[v35 initWithNode:children doc:a4 query:v36 error:a6];

      if (!v37) {
        goto LABEL_27;
      }
      [v31 addObject:v37];
      goto LABEL_26;
    }
  }
LABEL_31:

  return v12;
}

- (XMLWrapperElement)initWithTagName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)XMLWrapperElement;
  v6 = [(XMLWrapperElement *)&v15 init];
  v7 = v6;
  if (v6)
  {
    [(XMLWrapperElement *)v6 setTagName:v5];
    v7->_xmlNode = [(XMLWrapperElement *)v7 xmlNode:0];
    v7->_ownsXMLNode = 1;
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    elements = v7->_elements;
    v7->_elements = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    attributes = v7->_attributes;
    v7->_attributes = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    namespaces = v7->_namespaces;
    v7->_namespaces = (NSMutableDictionary *)v12;
  }
  return v7;
}

- (void)dealloc
{
  xmlNode = self->_xmlNode;
  if (xmlNode && self->_ownsXMLNode) {
    xmlFreeNode(xmlNode);
  }
  v4.receiver = self;
  v4.super_class = (Class)XMLWrapperElement;
  [(XMLWrapperElement *)&v4 dealloc];
}

- (NSArray)elements
{
  return (NSArray *)self->_elements;
}

- (void)setElements:(id)a3
{
  self->_elements = [MEMORY[0x263EFF980] arrayWithArray:a3];

  MEMORY[0x270F9A758]();
}

- (NSDictionary)attributes
{
  return (NSDictionary *)self->_attributes;
}

- (void)setNamespace:(id)a3
{
  namespaces = self->_namespaces;
  id v5 = a3;
  v6 = [v5 prefix];
  [(NSMutableDictionary *)namespaces setObject:v5 forKey:v6];

  id v7 = [(XMLWrapperElement *)self query];
  [v7 registerNamespace:v5];
}

- (id)attributeWithName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_attributes objectForKey:a3];
}

- (void)setAttributeWithName:(id)a3 value:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_attributes)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    attributes = self->_attributes;
    self->_attributes = v7;
  }
  v9 = objc_alloc_init(XMLWrapperAttribute);
  [(XMLWrapperAttribute *)v9 setName:v10];
  [(XMLWrapperAttribute *)v9 setValue:v6];
  [(NSMutableDictionary *)self->_attributes setObject:v9 forKey:v10];
}

- (id)firstElementByTagName:(id)a3
{
  v3 = [(XMLWrapperElement *)self getElementsByTagName:a3];
  objc_super v4 = [v3 firstObject];

  return v4;
}

- (id)getElementsByTagName:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(XMLWrapperElement *)self elements];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 tagName];
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)addChildElement:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if ([(NSMutableArray *)self->_elements indexOfObject:v4] == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_elements addObject:v5];
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)addChildElement:(id)a3 before:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    uint64_t v7 = [(NSMutableArray *)self->_elements indexOfObject:v6];
    uint64_t v8 = [(NSMutableArray *)self->_elements indexOfObject:v10];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_elements insertObject:v10 atIndex:v7];
    }
    else {
      [(XMLWrapperElement *)self addChildElement:v10];
    }
  }
}

- (void)removeChildElement:(id)a3
{
}

- (void)replaceChildElement:(id)a3 newElement:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(NSMutableArray *)self->_elements indexOfObject:v10];
    uint64_t v8 = [(NSMutableArray *)self->_elements indexOfObject:v6];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_elements replaceObjectAtIndex:v7 withObject:v6];
    }
  }
}

- (id)firstResultByXpathQuery:(id)a3
{
  v3 = [(XMLWrapperElement *)self getResultsByXpathQuery:a3];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)getResultsByXpathQuery:(id)a3
{
  id v4 = a3;
  id v5 = [(XMLWrapperElement *)self query];
  xmlNode = self->_xmlNode;
  doc = xmlNode->doc;
  id v12 = 0;
  uint64_t v8 = [v5 executeXpathQuery:doc query:v4 ctxNode:xmlNode error:&v12];

  id v9 = v12;
  if (v8) {
    id v10 = v8;
  }
  else {
    NSLog(&stru_26F2AD020.isa, v9);
  }

  return v8;
}

- (void)reorderChildElements
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(XMLWrapperElement *)self childElementSequence];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(XMLWrapperElement *)self getElementsByTagName:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        [(NSMutableArray *)v3 addObjectsFromArray:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  elements = self->_elements;
  self->_elements = v3;
}

- (_xmlNode)xmlNode:(id *)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = [(XMLWrapperElement *)self tagName];
  uint64_t v6 = xmlCharStrdup((const char *)[v5 UTF8String]);

  xmlNodePtr v7 = xmlNewNode(0, v6);
  if (v7)
  {
    uint64_t v8 = [(XMLWrapperElement *)self childElementSequence];

    if (v8) {
      [(XMLWrapperElement *)self reorderChildElements];
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v9 = [(NSMutableDictionary *)self->_attributes objectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v39;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * v13++) xmlAttrNodeForNode:v7 error:a3];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v11);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v14 = [(NSMutableDictionary *)self->_namespaces objectEnumerator];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * v18++) xmlNsForNode:v7 error:a3];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v16);
    }

    nsDef = v7->nsDef;
    if (nsDef) {
      xmlSetNs(v7, nsDef);
    }
    uint64_t v20 = [(XMLWrapperElement *)self textContent];

    if (v20)
    {
      id v21 = [(XMLWrapperElement *)self textContent];
      v22 = xmlCharStrdup((const char *)[v21 UTF8String]);

      v23 = xmlNewText(v22);
      xmlAddChild(v7, v23);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v24 = [(XMLWrapperElement *)self elements];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v31;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(v24);
          }
          xmlAddChild(v7, (xmlNodePtr)[*(id *)(*((void *)&v30 + 1) + 8 * v28++) xmlNode:a3]);
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v26);
    }
  }
  return v7;
}

- (id)xmlString:(id *)a3
{
  id v4 = -[XMLWrapperElement xmlNode:](self, "xmlNode:");
  if (v4)
  {
    id v5 = xmlBufferCreate();
    if (v5)
    {
      uint64_t v6 = v5;
      if (xmlNodeDump(v5, v4->doc, v4, 0, 1) < 1)
      {
        id v4 = 0;
      }
      else
      {
        id v7 = [NSString alloc];
        uint64_t v8 = xmlBufferContent(v6);
        id v4 = (_xmlNode *)[v7 initWithBytes:v8 length:xmlBufferLength(v6) encoding:4];
      }
      xmlBufferFree(v6);
    }
    else
    {
      id v4 = 0;
      if (a3) {
        *a3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"XMLWrapperErrorDomain" code:101 userInfo:0];
      }
    }
  }

  return v4;
}

- (NSString)tagName
{
  return self->_tagName;
}

- (void)setTagName:(id)a3
{
}

- (NSString)textContent
{
  return self->_textContent;
}

- (void)setTextContent:(id)a3
{
}

- (NSDictionary)namespaces
{
  return &self->_namespaces->super;
}

- (NSArray)childElementSequence
{
  return self->_childElementSequence;
}

- (void)setChildElementSequence:(id)a3
{
}

- (XMLWrapperQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_childElementSequence, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_tagName, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
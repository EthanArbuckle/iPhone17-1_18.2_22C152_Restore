@interface XMLWrapperQuery
+ (void)initialize;
- (BOOL)registerXpathNamespacesForCtx:(_xmlXPathContext *)a3 error:(id *)a4;
- (id)elementForNode:(_xmlNode *)a3;
- (id)executeXpathQuery:(_xmlDoc *)a3 query:(id)a4 ctxNode:(_xmlNode *)a5 error:(id *)a6;
- (id)searchNodeWithXpathQuery:(_xmlNode *)a3 query:(id)a4 error:(id *)a5;
- (void)registerNamespace:(id)a3;
@end

@implementation XMLWrapperQuery

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global);
  }
}

uint64_t __29__XMLWrapperQuery_initialize__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v1 = sNamespaceDictionary;
  sNamespaceDictionary = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)elementForNode:(_xmlNode *)a3
{
  if (a3->type == XML_ELEMENT_NODE)
  {
    v5 = +[XMLWrapperElementFactory sharedInstance];
    v6 = (objc_class *)[v5 classForXMLNode:a3 error:0];

    v7 = (void *)[[v6 alloc] initWithNode:a3 doc:a3->doc query:self error:0];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)searchNodeWithXpathQuery:(_xmlNode *)a3 query:(id)a4 error:(id *)a5
{
  doc = a3->doc;
  if (doc)
  {
    v8 = [(XMLWrapperQuery *)self executeXpathQuery:doc query:a4 ctxNode:a3 error:a5];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)registerNamespace:(id)a3
{
  id v6 = a3;
  id v3 = (id)sNamespaceDictionary;
  objc_sync_enter(v3);
  v4 = (void *)sNamespaceDictionary;
  v5 = [v6 prefix];
  [v4 setObject:v6 forKey:v5];

  objc_sync_exit(v3);
}

- (BOOL)registerXpathNamespacesForCtx:(_xmlXPathContext *)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = (id)sNamespaceDictionary;
  objc_sync_enter(v5);
  id v6 = (void *)[(id)sNamespaceDictionary copy];
  objc_sync_exit(v5);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = objc_msgSend(v6, "objectEnumerator", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    char v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = [v12 href];
        v14 = xmlCharStrdup((const char *)[v13 UTF8String]);

        id v15 = [v12 prefix];
        v16 = xmlCharStrdup((const char *)[v15 UTF8String]);

        v10 &= xmlXPathRegisterNs(a3, v16, v14) == 0;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (id)executeXpathQuery:(_xmlDoc *)a3 query:(id)a4 ctxNode:(_xmlNode *)a5 error:(id *)a6
{
  id v10 = a4;
  v11 = xmlXPathNewContext(a3);
  if (!v11)
  {
    if (a6)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"XMLWrapperErrorDomain" code:201 userInfo:0];
      v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v12 = v11;
  if (a5 && xmlXPathSetContextNode(a5, v11)
    || ![(XMLWrapperQuery *)self registerXpathNamespacesForCtx:v12 error:a6])
  {
    if (!a6)
    {
LABEL_16:
      xmlXPathFreeContext(v12);
LABEL_19:
      v17 = 0;
      goto LABEL_20;
    }
    v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = 201;
LABEL_15:
    *a6 = [v24 errorWithDomain:@"XMLWrapperErrorDomain" code:v25 userInfo:0];
    goto LABEL_16;
  }
  id v13 = xmlCharStrdup((const char *)[v10 UTF8String]);
  uint64_t v14 = MEMORY[0x2455C1430](v13, v12);
  if (!v14)
  {
    if (!a6) {
      goto LABEL_16;
    }
    v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = 300;
    goto LABEL_15;
  }
  id v15 = (xmlXPathObject *)v14;
  v16 = *(int **)(v14 + 8);
  if (!v16)
  {
    if (a6)
    {
      *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"XMLWrapperErrorDomain" code:301 userInfo:0];
    }
    xmlXPathFreeObject(v15);
    goto LABEL_16;
  }
  obj = (xmlXPathObject *)v14;
  v17 = [MEMORY[0x263EFF980] array];
  if (*v16 >= 1)
  {
    uint64_t v18 = 0;
    do
    {
      long long v19 = +[XMLWrapperElementFactory sharedInstance];
      long long v20 = (objc_class *)[v19 classForXMLNode:*(void *)(*((void *)v16 + 1) + 8 * v18) error:a6];

      id v21 = [v20 alloc];
      uint64_t v22 = *(void *)(*((void *)v16 + 1) + 8 * v18);
      uint64_t v23 = (void *)[v21 initWithNode:v22 doc:*(void *)(v22 + 64) query:self error:a6];
      if (v23) {
        [v17 addObject:v23];
      }

      ++v18;
    }
    while (v18 < *v16);
  }
  xmlXPathFreeObject(obj);
  xmlXPathFreeContext(v12);
LABEL_20:

  return v17;
}

@end
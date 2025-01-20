@interface POXMLXPathContext
- (BOOL)registerNamespaces:(id)a3;
- (POXMLContext)xmldocContext;
- (POXMLXPathContext)initWithXMLContext:(id)a3;
- (_xmlXPathContext)xpathCtx;
- (id)evaluateXPath:(id)a3;
- (void)dealloc;
- (void)setXmldocContext:(id)a3;
- (void)setXpathCtx:(_xmlXPathContext *)a3;
@end

@implementation POXMLXPathContext

- (POXMLXPathContext)initWithXMLContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)POXMLXPathContext;
  v6 = [(POXMLXPathContext *)&v11 init];
  if (!v6) {
    goto LABEL_4;
  }
  xmlXPathContextPtr v7 = xmlXPathNewContext((xmlDocPtr)[v5 xmldoc]);
  v6->_xpathCtx = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v6->_xmldocContext, a3);
LABEL_4:
    v8 = v6;
    goto LABEL_8;
  }
  v9 = PO_LOG_POXMLHelper();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[POXMLXPathContext initWithXMLContext:]();
  }

  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)registerNamespaces:(id)a3
{
  id v4 = a3;
  if (![(POXMLXPathContext *)self xpathCtx]) {
    -[POXMLXPathContext registerNamespaces:]();
  }
  if (!v4) {
    -[POXMLXPathContext registerNamespaces:]();
  }
  id v5 = v4;
  v6 = xmlStrdup((const xmlChar *)[v5 UTF8String]);
  if (v6)
  {
    xmlXPathContextPtr v7 = v6;
    v8 = v6;
    while (1)
    {
      if (!v8) {
        goto LABEL_16;
      }
      for (i = v8; *i == 32; ++i)
        ;
      if (!*i)
      {
LABEL_16:
        ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v7);
        BOOL v14 = 1;
        goto LABEL_21;
      }
      v10 = xmlStrchr(i, 0x3Du);
      if (!v10) {
        break;
      }
      const xmlChar *v10 = 0;
      objc_super v11 = v10 + 1;
      v12 = xmlStrchr(v10 + 1, 0x20u);
      v8 = v12;
      if (v12)
      {
        const xmlChar *v12 = 0;
        v8 = v12 + 1;
      }
      if (xmlXPathRegisterNs([(POXMLXPathContext *)self xpathCtx], i, v11))
      {
        v13 = PO_LOG_POXMLHelper();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          [(POXMLXPathContext *)(uint64_t)i registerNamespaces:v13];
        }
        goto LABEL_24;
      }
    }
    v13 = PO_LOG_POXMLHelper();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[POXMLXPathContext registerNamespaces:].cold.4();
    }
LABEL_24:

    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v7);
  }
  else
  {
    v15 = PO_LOG_POXMLHelper();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[POXMLXPathContext registerNamespaces:]();
    }
  }
  BOOL v14 = 0;
LABEL_21:

  return v14;
}

- (id)evaluateXPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(POXMLXPathResult);
  id v6 = v4;
  -[POXMLXPathResult setXpathObj:](v5, "setXpathObj:", MEMORY[0x25A2EE1D0]([v6 UTF8String], -[POXMLXPathContext xpathCtx](self, "xpathCtx")));
  [(POXMLXPathResult *)v5 setXpathContext:self];
  if ([(POXMLXPathResult *)v5 xpathObj])
  {
    xmlXPathContextPtr v7 = v5;
  }
  else
  {
    v8 = PO_LOG_POXMLHelper();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[POXMLXPathContext evaluateXPath:](v6, v8);
    }

    xmlXPathContextPtr v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  if ([(POXMLXPathContext *)self xpathCtx]) {
    xmlXPathFreeContext([(POXMLXPathContext *)self xpathCtx]);
  }
  [(POXMLXPathContext *)self setXpathCtx:0];
  v3.receiver = self;
  v3.super_class = (Class)POXMLXPathContext;
  [(POXMLXPathContext *)&v3 dealloc];
}

- (_xmlXPathContext)xpathCtx
{
  return self->_xpathCtx;
}

- (void)setXpathCtx:(_xmlXPathContext *)a3
{
  self->_xpathCtx = a3;
}

- (POXMLContext)xmldocContext
{
  return self->_xmldocContext;
}

- (void)setXmldocContext:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithXMLContext:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_259DFE000, v0, v1, "Error: unable to create new XPath context", v2, v3, v4, v5, v6);
}

- (void)registerNamespaces:.cold.1()
{
}

- (void)registerNamespaces:.cold.2()
{
}

- (void)registerNamespaces:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_259DFE000, v0, v1, "Error: unable to strdup namespaces list\n", v2, v3, v4, v5, v6);
}

- (void)registerNamespaces:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_259DFE000, v0, v1, "Error: invalid namespaces list format\n", v2, v3, v4, v5, v6);
}

- (void)registerNamespaces:(os_log_t)log .cold.5(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_259DFE000, log, OS_LOG_TYPE_ERROR, "Error: unable to register NS with prefix=\"%s\" and href=\"%s\"\n", (uint8_t *)&v3, 0x16u);
}

- (void)evaluateXPath:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = [a1 UTF8String];
  _os_log_error_impl(&dword_259DFE000, a2, OS_LOG_TYPE_ERROR, "Error: unable to evaluate xpath expression \"%s\"\n", (uint8_t *)&v3, 0xCu);
}

@end
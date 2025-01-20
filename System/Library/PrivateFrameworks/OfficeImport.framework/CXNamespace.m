@interface CXNamespace
+ (BOOL)isNamespaceSupported:(const char *)a3;
+ (BOOL)isPrefixSupportedFromNodeContext:(_xmlNode *)a3 prefix:(const char *)a4;
+ (BOOL)isPrefixSupportedFromStream:(_xmlTextReader *)a3 prefix:(const char *)a4;
+ (void)clearRegisteredNamespaces;
+ (void)registerNamespace:(id)a3;
- (BOOL)containsAttribute:(_xmlAttr *)a3;
- (BOOL)containsNode:(_xmlNode *)a3;
- (CXNamespace)fallbackNamespace;
- (CXNamespace)init;
- (CXNamespace)initWithUri:(const char *)a3;
- (CXNamespace)initWithUri:(const char *)a3 fallbackNamespace:(id)a4;
- (const)fallbackUri;
- (const)uri;
- (id)initUnsupportedNsWithUri:(const char *)a3;
- (void)setFallbackNamespace:(id)a3;
@end

@implementation CXNamespace

- (CXNamespace)initWithUri:(const char *)a3
{
  v3 = [(CXNamespace *)self initUnsupportedNsWithUri:a3];
  if (v3) {
    +[CXNamespace registerNamespace:v3];
  }
  return v3;
}

- (id)initUnsupportedNsWithUri:(const char *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CXNamespace;
  id result = [(CXNamespace *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

+ (void)registerNamespace:(id)a3
{
  id v7 = a3;
  id v3 = (id)pSupportedNamespaces;
  objc_sync_enter(v3);
  if (!pSupportedNamespaces)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:0];
    objc_super v5 = (void *)pSupportedNamespaces;
    pSupportedNamespaces = v4;
  }
  v6 = objc_msgSend([NSString alloc], "tc_initWithXmlString:", objc_msgSend(v7, "uri"));
  if (v6 && ([(id)pSupportedNamespaces containsObject:v6] & 1) == 0) {
    [(id)pSupportedNamespaces addObject:v6];
  }

  objc_sync_exit(v3);
}

- (const)uri
{
  return self->mUri;
}

- (BOOL)containsNode:(_xmlNode *)a3
{
  doc = a3->doc;
  if (doc != self->mDocument)
  {
    self->mDocument = doc;
    RootElement = xmlDocGetRootElement(doc);
    self->mDocumentNamespace = xmlSearchNsByHref(doc, RootElement, (const xmlChar *)self->mUri);
  }
  ns = a3->ns;
  if (ns && (ns == self->mDocumentNamespace || xmlStrEqual(ns->href, (const xmlChar *)self->mUri))) {
    return 1;
  }
  mFallbackNamespace = self->mFallbackNamespace;
  return [(CXNamespace *)mFallbackNamespace containsNode:a3];
}

- (BOOL)containsAttribute:(_xmlAttr *)a3
{
  doc = a3->doc;
  if (doc != self->mDocument)
  {
    self->mDocument = doc;
    RootElement = xmlDocGetRootElement(doc);
    self->mDocumentNamespace = xmlSearchNsByHref(doc, RootElement, (const xmlChar *)self->mUri);
  }
  ns = a3->ns;
  if (ns && (ns == self->mDocumentNamespace || xmlStrEqual(ns->href, (const xmlChar *)self->mUri))) {
    return 1;
  }
  mFallbackNamespace = self->mFallbackNamespace;
  return [(CXNamespace *)mFallbackNamespace containsAttribute:a3];
}

+ (BOOL)isPrefixSupportedFromNodeContext:(_xmlNode *)a3 prefix:(const char *)a4
{
  NsList = xmlGetNsList(a3->doc, a3);
  if (!NsList) {
    return 0;
  }
  id v7 = NsList;
  xmlNsPtr v8 = *NsList;
  if (*NsList)
  {
    unsigned int v9 = 1;
    while (!xmlStrEqual(v8->prefix, (const xmlChar *)a4))
    {
      xmlNsPtr v8 = v7[v9++];
      if (!v8) {
        goto LABEL_6;
      }
    }
    char v10 = [a1 isNamespaceSupported:v8->href];
  }
  else
  {
LABEL_6:
    char v10 = 0;
  }
  ((void (*)(xmlNsPtr *))*MEMORY[0x263F8C880])(v7);
  return v10;
}

+ (BOOL)isNamespaceSupported:(const char *)a3
{
  id v3 = objc_msgSend([NSString alloc], "tc_initWithXmlString:", a3);
  id v4 = (id)pSupportedNamespaces;
  objc_sync_enter(v4);
  char v5 = [(id)pSupportedNamespaces containsObject:v3];
  objc_sync_exit(v4);

  return v5;
}

- (CXNamespace)init
{
  v6.receiver = self;
  v6.super_class = (Class)CXNamespace;
  v2 = [(CXNamespace *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    mFallbackNamespace = v2->mFallbackNamespace;
    v2->mFallbackNamespace = 0;
  }
  return v3;
}

- (CXNamespace)initWithUri:(const char *)a3 fallbackNamespace:(id)a4
{
  id v7 = a4;
  xmlNsPtr v8 = [(CXNamespace *)self initWithUri:a3];
  unsigned int v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->mFallbackNamespace, a4);
  }

  return v9;
}

- (const)fallbackUri
{
  return [(CXNamespace *)self->mFallbackNamespace fallbackUri];
}

+ (BOOL)isPrefixSupportedFromStream:(_xmlTextReader *)a3 prefix:(const char *)a4
{
  char v5 = xmlTextReaderLookupNamespace(a3, (const xmlChar *)a4);
  if (v5)
  {
    LOBYTE(v5) = [a1 isNamespaceSupported:v5];
  }
  return (char)v5;
}

+ (void)clearRegisteredNamespaces
{
  id obj = (id)pSupportedNamespaces;
  objc_sync_enter(obj);
  v2 = (void *)pSupportedNamespaces;
  pSupportedNamespaces = 0;

  objc_sync_exit(obj);
}

- (CXNamespace)fallbackNamespace
{
  return self->mFallbackNamespace;
}

- (void)setFallbackNamespace:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
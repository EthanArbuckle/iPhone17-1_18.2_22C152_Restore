id SAMLParserErrorForErrorCode(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  v2 = objc_alloc(MEMORY[0x263F087E8]);
  v3 = SAMLErrorInfoForParserErrorCode(a1);
  v4 = (void *)[v2 initWithDomain:@"SAMLParserErrorDomain" code:a1 userInfo:v3];

  return v4;
}

id SAMLErrorInfoForParserErrorCode(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  v1 = @"An unknown error occurred.";
  if (a1 <= 299)
  {
    v2 = @"The document element was not a Response element.";
    v3 = @"The SAML element could not be created.";
    v4 = @"The SAML element could not be created due to an error upstream.";
    if (a1 != 201) {
      v4 = @"An unknown error occurred.";
    }
    if (a1 != 200) {
      v3 = v4;
    }
    if (a1 != 102) {
      v2 = v3;
    }
    if (a1 == 101) {
      v1 = @"The SAML failed XML Schema validation.";
    }
    if (a1 == 100) {
      v1 = @"The SAML string does not use UTF-8 encoding.";
    }
    if (a1 > 101) {
      v1 = v2;
    }
  }
  else if (a1 > 399)
  {
    if (a1 == 500) {
      v1 = @"The SAML signature was missing or failed validation.";
    }
    if (a1 == 401) {
      v1 = @"The SAML assertion or authN failed validation due to invalid date attributes.";
    }
    if (a1 == 400) {
      v1 = @"The SAML response contains no valid assertion statements.";
    }
  }
  else
  {
    switch(a1)
    {
      case 300:
        v1 = @"The SAML response is invalid.";
        break;
      case 301:
        v1 = @"The SAML response returned a status code indiciating failure.";
        break;
      case 302:
        v1 = @"The SAML response returned a status code indiciating failure from the reqestor.";
        break;
      case 303:
        v1 = @"The SAML response returned a status code indiciating failure from the responder.";
        break;
      case 304:
        v1 = @"The SAML response returned a status code indiciating failure because the version of the request message was incorrect.";
        break;
      default:
        break;
    }
  }
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = v1;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  return v5;
}

id SAMLInvalidDocumentElementErrorForClass(objc_class *a1)
{
  v2 = SAMLErrorInfoForParserErrorCode(102);
  v3 = (void *)[v2 mutableCopy];

  v4 = NSStringFromClass(a1);
  [v3 setObject:v4 forKey:@"recievedClass"];

  v5 = (void *)MEMORY[0x263F087E8];
  v6 = (void *)[v3 copy];
  uint64_t v7 = [v5 errorWithDomain:@"SAMLParserErrorDomain" code:102 userInfo:v6];

  return v7;
}

id SAMLStringFromDate(void *a1)
{
  id v1 = a1;
  v2 = SAMLDateFormatter();
  v3 = [v2 stringFromDate:v1];

  return v3;
}

id SAMLDateFormatter()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  id v1 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v0 setLocale:v1];

  v2 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v0 setTimeZone:v2];

  [v0 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
  return v0;
}

id SAMLDateFromString(void *a1)
{
  id v1 = a1;
  v2 = SAMLDateFormatter();
  v3 = [v2 dateFromString:v1];

  return v3;
}

xmlParserInputPtr XMLWExternalEntityLoader(uint64_t a1, uint64_t a2, xmlParserCtxt *a3)
{
  v4 = NSURL;
  v5 = [NSString stringWithUTF8String:a1];
  v6 = [v4 URLWithString:v5];

  uint64_t v7 = (void *)MEMORY[0x263EFF980];
  v8 = [v6 lastPathComponent];
  v9 = [v8 componentsSeparatedByString:@"."];
  v10 = [v7 arrayWithArray:v9];

  if ((unint64_t)[v10 count] < 2)
  {
    v11 = 0;
  }
  else
  {
    v11 = [v10 lastObject];
    [v10 removeLastObject];
  }
  v12 = [v10 componentsJoinedByString:@"."];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 URLForResource:v12 withExtension:v11];

  if (v14)
  {
    v15 = [NSString stringWithContentsOfURL:v14 encoding:4 error:0];
    v16 = v15;
    if (v15)
    {
      v17 = xmlCharStrdup((const char *)[v15 UTF8String]);
      xmlParserInputPtr v18 = xmlNewStringInputStream(a3, v17);
      v18->free = (xmlParserInputDeallocate)XMLWExternalEntityLoaderInputDeallocator;
    }
    else
    {
      xmlParserInputPtr v18 = 0;
    }
  }
  else
  {
    xmlParserInputPtr v18 = 0;
  }

  return v18;
}

void XMLWSchemaValidityError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = [NSString alloc];
  v11 = [NSString stringWithUTF8String:a2];
  v12 = (void *)[v10 initWithFormat:v11 arguments:&a9];

  NSLog(&cfstr_XmlSchemaValid.isa, v12);
}

void XMLWSchemaValidityWarning(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = [NSString alloc];
  v11 = [NSString stringWithUTF8String:a2];
  v12 = (void *)[v10 initWithFormat:v11 arguments:&a9];

  NSLog(&cfstr_XmlSchemaValid_0.isa, v12);
}

void XMLWSchemaValidityErrorFunc(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2)
  {
    xmlErrorPtr LastError = xmlGetLastError();
    if (LastError)
    {
      v12 = [NSString stringWithCString:LastError->file encoding:4];
      v13 = [NSString stringWithCString:LastError->message encoding:4];
      v14 = [NSString stringWithFormat:@"ERROR %i: %@ line %i: %@\n", LastError->code, v12, LastError->line, v13];
    }
    else
    {
      id v15 = [NSString alloc];
      v12 = [NSString stringWithUTF8String:a2];
      v14 = (void *)[v15 initWithFormat:v12 arguments:&a9];
    }

    [a1 appendString:v14];
  }
}

uint64_t XMLWExternalEntityLoaderInputDeallocator()
{
  return ((uint64_t (*)(void))*MEMORY[0x263F8C880])();
}

XMLWrapperNamespace *SAMLProtocolNamespace()
{
  id v0 = objc_alloc_init(XMLWrapperNamespace);
  [(XMLWrapperNamespace *)v0 setPrefix:@"samlp"];
  [(XMLWrapperNamespace *)v0 setHref:@"urn:oasis:names:tc:SAML:2.0:protocol"];
  return v0;
}

XMLWrapperNamespace *SAMLAssertionNamespace()
{
  id v0 = objc_alloc_init(XMLWrapperNamespace);
  [(XMLWrapperNamespace *)v0 setPrefix:@"saml"];
  [(XMLWrapperNamespace *)v0 setHref:@"urn:oasis:names:tc:SAML:2.0:assertion"];
  return v0;
}

XMLWrapperNamespace *SAMLSignatureNamespace()
{
  id v0 = objc_alloc_init(XMLWrapperNamespace);
  [(XMLWrapperNamespace *)v0 setPrefix:@"ds"];
  [(XMLWrapperNamespace *)v0 setHref:@"http://www.w3.org/2000/09/xmldsig#"];
  return v0;
}

void sub_23EFAC12C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EFAC2E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

xmlNodePtr xmlAddChild(xmlNodePtr parent, xmlNodePtr cur)
{
  return (xmlNodePtr)MEMORY[0x270F9BAF8](parent, cur);
}

const xmlChar *__cdecl xmlBufferContent(const xmlBuffer *buf)
{
  return (const xmlChar *)MEMORY[0x270F9BB40](buf);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x270F9BB48]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
}

int xmlBufferLength(const xmlBuffer *buf)
{
  return MEMORY[0x270F9BB68](buf);
}

xmlChar *__cdecl xmlCharStrdup(const char *cur)
{
  return (xmlChar *)MEMORY[0x270F9BB88](cur);
}

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return (xmlNodePtr)MEMORY[0x270F9BC50](doc);
}

xmlNodePtr xmlDocSetRootElement(xmlDocPtr doc, xmlNodePtr root)
{
  return (xmlNodePtr)MEMORY[0x270F9BC58](doc, root);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeNode(xmlNodePtr cur)
{
}

xmlExternalEntityLoader xmlGetExternalEntityLoader(void)
{
  return (xmlExternalEntityLoader)MEMORY[0x270F9BCE8]();
}

xmlErrorPtr xmlGetLastError(void)
{
  return (xmlErrorPtr)MEMORY[0x270F9BD00]();
}

xmlDocPtr xmlNewDoc(const xmlChar *version)
{
  return (xmlDocPtr)MEMORY[0x270F9BE38](version);
}

xmlNodePtr xmlNewNode(xmlNsPtr ns, const xmlChar *name)
{
  return (xmlNodePtr)MEMORY[0x270F9BE88](ns, name);
}

xmlNsPtr xmlNewNs(xmlNodePtr node, const xmlChar *href, const xmlChar *prefix)
{
  return (xmlNsPtr)MEMORY[0x270F9BE90](node, href, prefix);
}

xmlAttrPtr xmlNewNsProp(xmlNodePtr node, xmlNsPtr ns, const xmlChar *name, const xmlChar *value)
{
  return (xmlAttrPtr)MEMORY[0x270F9BE98](node, ns, name, value);
}

xmlAttrPtr xmlNewProp(xmlNodePtr node, const xmlChar *name, const xmlChar *value)
{
  return (xmlAttrPtr)MEMORY[0x270F9BEA8](node, name, value);
}

xmlParserInputPtr xmlNewStringInputStream(xmlParserCtxtPtr ctxt, const xmlChar *buffer)
{
  return (xmlParserInputPtr)MEMORY[0x270F9BEB0](ctxt, buffer);
}

xmlNodePtr xmlNewText(const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x270F9BEB8](content);
}

int xmlNodeDump(xmlBufferPtr buf, xmlDocPtr doc, xmlNodePtr cur, int level, int format)
{
  return MEMORY[0x270F9BF18](buf, doc, cur, *(void *)&level, *(void *)&format);
}

xmlDocPtr xmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x270F9BFE0](buffer, *(void *)&size, URL, encoding, *(void *)&options);
}

void xmlSchemaFree(xmlSchemaPtr schema)
{
}

void xmlSchemaFreeParserCtxt(xmlSchemaParserCtxtPtr ctxt)
{
}

void xmlSchemaFreeValidCtxt(xmlSchemaValidCtxtPtr ctxt)
{
}

xmlSchemaParserCtxtPtr xmlSchemaNewDocParserCtxt(xmlDocPtr doc)
{
  return (xmlSchemaParserCtxtPtr)MEMORY[0x270F9C070](doc);
}

xmlSchemaValidCtxtPtr xmlSchemaNewValidCtxt(xmlSchemaPtr schema)
{
  return (xmlSchemaValidCtxtPtr)MEMORY[0x270F9C080](schema);
}

xmlSchemaPtr xmlSchemaParse(xmlSchemaParserCtxtPtr ctxt)
{
  return (xmlSchemaPtr)MEMORY[0x270F9C088](ctxt);
}

void xmlSchemaSetParserErrors(xmlSchemaParserCtxtPtr ctxt, xmlSchemaValidityErrorFunc err, xmlSchemaValidityWarningFunc warn, void *ctx)
{
}

void xmlSchemaSetValidErrors(xmlSchemaValidCtxtPtr ctxt, xmlSchemaValidityErrorFunc err, xmlSchemaValidityWarningFunc warn, void *ctx)
{
}

int xmlSchemaValidateDoc(xmlSchemaValidCtxtPtr ctxt, xmlDocPtr instance)
{
  return MEMORY[0x270F9C0A8](ctxt, instance);
}

void xmlSetExternalEntityLoader(xmlExternalEntityLoader f)
{
}

void xmlSetNs(xmlNodePtr node, xmlNsPtr ns)
{
}

xmlXPathObjectPtr xmlXPathEvalExpression(const xmlChar *str, xmlXPathContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C3D8](str, ctxt);
}

void xmlXPathFreeContext(xmlXPathContextPtr ctxt)
{
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
}

xmlXPathContextPtr xmlXPathNewContext(xmlDocPtr doc)
{
  return (xmlXPathContextPtr)MEMORY[0x270F9C458](doc);
}

int xmlXPathRegisterNs(xmlXPathContextPtr ctxt, const xmlChar *prefix, const xmlChar *ns_uri)
{
  return MEMORY[0x270F9C538](ctxt, prefix, ns_uri);
}

int xmlXPathSetContextNode(xmlNodePtr node, xmlXPathContextPtr ctx)
{
  return MEMORY[0x270F9C548](node, ctx);
}
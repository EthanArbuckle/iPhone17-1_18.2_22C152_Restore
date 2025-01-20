@interface OCPPackageProperties
- (NSString)company;
- (NSString)subject;
- (OCPPackageProperties)initWithCoreXml:(_xmlDoc *)a3 appXml:(_xmlDoc *)a4;
- (id)appVersion;
- (id)creator;
- (id)description;
- (id)keywords;
- (id)title;
- (void)readFromAppXml:(_xmlDoc *)a3;
- (void)readFromCoreXml:(_xmlDoc *)a3;
- (void)readFromCoreXml:(_xmlDoc *)a3 appXml:(_xmlDoc *)a4;
- (void)setCompany:(id)a3;
- (void)setSubject:(id)a3;
@end

@implementation OCPPackageProperties

- (id)title
{
  return self->mTitle;
}

- (id)creator
{
  return self->mCreator;
}

- (id)keywords
{
  return self->mKeywords;
}

- (id)description
{
  return self->mDescription;
}

- (id)appVersion
{
  return self->mAppVersion;
}

- (NSString)subject
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubject:(id)a3
{
}

- (NSString)company
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCompany:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCompany, 0);
  objc_storeStrong((id *)&self->mSubject, 0);
  objc_storeStrong((id *)&self->mAppVersion, 0);
  objc_storeStrong((id *)&self->mTitle, 0);
  objc_storeStrong((id *)&self->mKeywords, 0);
  objc_storeStrong((id *)&self->mDescription, 0);
  objc_storeStrong((id *)&self->mCreator, 0);
}

- (OCPPackageProperties)initWithCoreXml:(_xmlDoc *)a3 appXml:(_xmlDoc *)a4
{
  return self;
}

- (void)readFromCoreXml:(_xmlDoc *)a3
{
  xmlNodePtr RootElement = xmlDocGetRootElement(a3);
  xmlNsPtr v6 = xmlSearchNsByHref(a3, RootElement, (const xmlChar *)"http://schemas.openxmlformats.org/package/2006/metadata/core-properties");
  if (!v6) {
    +[OCPException raise:@"OCPPackagePropertiesError" format:@"Could not find XML namespace"];
  }
  xmlNsPtr v7 = xmlSearchNsByHref(a3, RootElement, (const xmlChar *)"http://purl.org/dc/elements/1.1/");
  if (!v7)
  {
    children = RootElement->children;
    if (!children) {
      goto LABEL_10;
    }
    do
    {
      xmlNsPtr v9 = xmlSearchNsByHref(a3, children, (const xmlChar *)"http://purl.org/dc/elements/1.1/");
      children = children->next;
      if (children) {
        BOOL v10 = v9 == 0;
      }
      else {
        BOOL v10 = 0;
      }
    }
    while (v10);
    xmlNsPtr v7 = v9;
    if (!v9)
    {
LABEL_10:
      +[OCPException raise:@"OCPPackagePropertiesError" format:@"Could not find XML namespace"];
      xmlNsPtr v7 = 0;
    }
  }
  if (!RootElement
    || (ns = RootElement->ns, ns != v6)
    && (!v6 || !ns || (href = ns->href) == 0 || (v13 = v6->href) == 0 || !xmlStrEqual(href, v13))
    || !xmlStrEqual(RootElement->name, (const xmlChar *)"coreProperties"))
  {
    +[OCPException raise:@"OCPPackagePropertiesError" format:@"Could not find root node"];
  }
  v14 = RootElement->children;
  if (v14)
  {
    while (v14->type != XML_ELEMENT_NODE)
    {
LABEL_42:
      v14 = v14->next;
      if (!v14) {
        goto LABEL_43;
      }
    }
    v15 = v14->ns;
    if (v15 == v6) {
      goto LABEL_28;
    }
    if (v6)
    {
      if (v15)
      {
        v16 = v15->href;
        if (v16)
        {
          v17 = v6->href;
          if (v17)
          {
            if (xmlStrEqual(v16, v17))
            {
LABEL_28:
              p_mKeywords = &self->mKeywords;
              if (!xmlStrEqual(v14->name, (const xmlChar *)"keywords")) {
                goto LABEL_42;
              }
              goto LABEL_41;
            }
            v15 = v14->ns;
          }
        }
      }
    }
    if (v15 != v7)
    {
      if (!v7) {
        goto LABEL_42;
      }
      if (!v15) {
        goto LABEL_42;
      }
      v19 = v15->href;
      if (!v19) {
        goto LABEL_42;
      }
      v20 = v7->href;
      if (!v20 || !xmlStrEqual(v19, v20)) {
        goto LABEL_42;
      }
    }
    p_mKeywords = &self->mCreator;
    if (!xmlStrEqual(v14->name, (const xmlChar *)"creator"))
    {
      p_mKeywords = &self->mDescription;
      if (!xmlStrEqual(v14->name, (const xmlChar *)"description"))
      {
        p_mKeywords = &self->mTitle;
        if (!xmlStrEqual(v14->name, (const xmlChar *)"title"))
        {
          p_mKeywords = &self->mSubject;
          if (!xmlStrEqual(v14->name, (const xmlChar *)"subject")) {
            goto LABEL_42;
          }
        }
      }
    }
LABEL_41:
    uint64_t v21 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", v14);
    v22 = *p_mKeywords;
    *p_mKeywords = (NSString *)v21;

    goto LABEL_42;
  }
LABEL_43:
  if (!self->mCreator)
  {
    v23 = (NSString *)objc_alloc_init(NSString);
    mCreator = self->mCreator;
    self->mCreator = v23;
  }
  if (!self->mDescription)
  {
    v25 = (NSString *)objc_alloc_init(NSString);
    mDescription = self->mDescription;
    self->mDescription = v25;
  }
  if (!self->mKeywords)
  {
    v27 = (NSString *)objc_alloc_init(NSString);
    mKeywords = self->mKeywords;
    self->mKeywords = v27;
  }
  if (!self->mTitle)
  {
    v29 = (NSString *)objc_alloc_init(NSString);
    mTitle = self->mTitle;
    self->mTitle = v29;
  }
}

- (void)readFromAppXml:(_xmlDoc *)a3
{
  if (!a3) {
    return;
  }
  xmlNodePtr RootElement = xmlDocGetRootElement(a3);
  xmlNsPtr v6 = xmlSearchNsByHref(a3, RootElement, (const xmlChar *)"http://schemas.openxmlformats.org/officeDocument/2006/extended-properties");
  if (v6
    || (xmlNsPtr v6 = xmlSearchNsByHref(a3, RootElement, (const xmlChar *)"http://purl.oclc.org/ooxml/officeDocument/extendedProperties")) != 0)
  {
    if (RootElement) {
      goto LABEL_5;
    }
LABEL_14:
    +[OCPException raise:@"OCPPackagePropertiesError" format:@"Could not find root App node"];
    goto LABEL_15;
  }
  +[OCPException raise:@"OCPPackagePropertiesError" format:@"Could not find XML namespace"];
  if (!RootElement) {
    goto LABEL_14;
  }
LABEL_5:
  ns = RootElement->ns;
  if (ns != v6)
  {
    if (!v6) {
      goto LABEL_14;
    }
    if (!ns) {
      goto LABEL_14;
    }
    href = ns->href;
    if (!href) {
      goto LABEL_14;
    }
    xmlNsPtr v9 = v6->href;
    if (!v9 || !xmlStrEqual(href, v9)) {
      goto LABEL_14;
    }
  }
  if (!xmlStrEqual(RootElement->name, (const xmlChar *)"Properties")) {
    goto LABEL_14;
  }
LABEL_15:
  for (i = RootElement->children; i; i = i->next)
  {
    if (i->type == XML_ELEMENT_NODE)
    {
      v11 = i->ns;
      if (v11 == v6 || v6 && v11 && (v12 = v11->href) != 0 && (v13 = v6->href) != 0 && xmlStrEqual(v12, v13))
      {
        p_mAppVersion = &self->mAppVersion;
        if (xmlStrEqual(i->name, (const xmlChar *)"AppVersion")
          || (p_mAppVersion = &self->mCompany, xmlStrEqual(i->name, (const xmlChar *)"Company")))
        {
          uint64_t v15 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", i);
          v16 = *p_mAppVersion;
          *p_mAppVersion = (NSString *)v15;
        }
      }
    }
  }
}

- (void)readFromCoreXml:(_xmlDoc *)a3 appXml:(_xmlDoc *)a4
{
  [(OCPPackageProperties *)self readFromCoreXml:a3];
  [(OCPPackageProperties *)self readFromAppXml:a4];
}

@end
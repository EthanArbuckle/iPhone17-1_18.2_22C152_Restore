@interface OCPPackage
- (OCPPackage)init;
- (OCPPackage)initWithRelationshipsXml:(_xmlDoc *)a3 corePropertiesXml:(_xmlDoc *)a4 appPropertiesXml:(_xmlDoc *)a5 contentTypesXml:(_xmlDoc *)a6;
- (id)contentTypeForPartLocation:(id)a3;
- (id)mainDocumentPart;
- (id)partByRelationshipType:(id)a3;
- (id)partForLocation:(id)a3;
- (id)properties;
- (id)relationshipForIdentifier:(id)a3;
- (id)relationshipsByType:(id)a3;
- (void)readContentTypeOverrideFromElement:(_xmlNode *)a3;
- (void)readContentTypesXml:(_xmlDoc *)a3;
- (void)readDefaultContentTypeFromElement:(_xmlNode *)a3;
@end

@implementation OCPPackage

- (void)readContentTypesXml:(_xmlDoc *)a3
{
  xmlNodePtr RootElement = xmlDocGetRootElement(a3);
  if (!RootElement) {
    +[OCPException raise:@"OCPPackageError" format:@"No content types root element"];
  }
  xmlNsPtr v6 = xmlSearchNsByHref(a3, RootElement, (const xmlChar *)"http://schemas.openxmlformats.org/package/2006/content-types");
  if (v6)
  {
    if (RootElement) {
      goto LABEL_5;
    }
  }
  else
  {
    +[OCPException raise:@"OCPPackageError" format:@"Could not find content types namespace"];
    if (RootElement)
    {
LABEL_5:
      ns = RootElement->ns;
      if (!ns || !xmlStrEqual(ns->href, v6->href) || !xmlStrEqual(RootElement->name, (const xmlChar *)"Types")) {
        +[OCPException raise:@"OCPPackageError" format:@"Could not find content types root"];
      }
      for (i = RootElement->children; i; i = i->next)
      {
        if (i->type == XML_ELEMENT_NODE && i->ns == v6)
        {
          if (xmlStrEqual(i->name, (const xmlChar *)"Default"))
          {
            [(OCPPackage *)self readDefaultContentTypeFromElement:i];
          }
          else if (xmlStrEqual(i->name, (const xmlChar *)"Override"))
          {
            [(OCPPackage *)self readContentTypeOverrideFromElement:i];
          }
        }
      }
      return;
    }
  }
  +[OCPException raise:@"OCPPackageError" format:@"Could not find content types root"];
}

- (void)readDefaultContentTypeFromElement:(_xmlNode *)a3
{
  properties = a3->properties;
  if (!properties)
  {
    id v9 = 0;
    v5 = 0;
    goto LABEL_14;
  }
  id v9 = 0;
  v5 = 0;
  do
  {
    if (properties->ns) {
      goto LABEL_9;
    }
    if (xmlStrEqual(properties->name, (const xmlChar *)"Extension"))
    {
      uint64_t v6 = objc_msgSend([NSString alloc], "tc_initWithValueOfXmlAttribute:", properties);
      v7 = v9;
      id v9 = (id)v6;
    }
    else
    {
      if (!xmlStrEqual(properties->name, (const xmlChar *)"ContentType")) {
        goto LABEL_9;
      }
      uint64_t v8 = objc_msgSend([NSString alloc], "tc_initWithValueOfXmlAttribute:", properties);
      v7 = v5;
      v5 = (void *)v8;
    }

LABEL_9:
    properties = properties->next;
  }
  while (properties);
  if (v9 && v5)
  {
    [(NSMutableDictionary *)self->mDefaultContentTypes setObject:v5 forKey:v9];
    goto LABEL_15;
  }
LABEL_14:
  +[OCPException raise:@"OCPPackageError" format:@"Could not find required content type attributes"];
LABEL_15:
}

- (id)contentTypeForPartLocation:(id)a3
{
  v4 = [a3 path];
  v5 = [(NSMutableDictionary *)self->mContentTypeOverrides objectForKey:v4];
  if (!v5)
  {
    mDefaultContentTypes = self->mDefaultContentTypes;
    v7 = [v4 pathExtension];
    v5 = [(NSMutableDictionary *)mDefaultContentTypes objectForKey:v7];

    if (!v5)
    {
      uint64_t v8 = self->mDefaultContentTypes;
      id v9 = [v4 pathExtension];
      v10 = [v9 lowercaseString];
      v5 = [(NSMutableDictionary *)v8 objectForKey:v10];

      if (!v5)
      {
        v11 = self->mDefaultContentTypes;
        v12 = [v4 pathExtension];
        v13 = [v12 uppercaseString];
        uint64_t v14 = [(NSMutableDictionary *)v11 objectForKey:v13];

        if (v14) {
          v5 = (__CFString *)v14;
        }
        else {
          v5 = @"application/octet-stream";
        }
      }
    }
  }

  return v5;
}

- (id)properties
{
  return self->mProperties;
}

- (OCPPackage)init
{
  return 0;
}

- (id)partForLocation:(id)a3
{
  return 0;
}

- (id)relationshipForIdentifier:(id)a3
{
  v3 = [(OCPPackageRelationshipCollection *)self->mRelationships relationshipForIdentifier:a3];
  return v3;
}

- (id)relationshipsByType:(id)a3
{
  v3 = [(OCPPackageRelationshipCollection *)self->mRelationships relationshipsByType:a3];
  return v3;
}

- (id)partByRelationshipType:(id)a3
{
  v4 = [(OCPPackageRelationshipCollection *)self->mRelationships relationshipsByType:a3];
  v5 = [v4 objectAtIndex:0];
  uint64_t v6 = [v5 targetLocation];
  v7 = [(OCPPackage *)self partForLocation:v6];

  return v7;
}

- (id)mainDocumentPart
{
  v3 = [(OCPPackage *)self relationshipsByType:@"http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument"];
  uint64_t v4 = [v3 count];

  if (v4) {
    v5 = @"http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument";
  }
  else {
    v5 = @"http://purl.oclc.org/ooxml/officeDocument/relationships/officeDocument";
  }
  uint64_t v6 = [(OCPPackage *)self partByRelationshipType:v5];
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContentTypeOverrides, 0);
  objc_storeStrong((id *)&self->mDefaultContentTypes, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
  objc_storeStrong((id *)&self->mRelationships, 0);
}

- (OCPPackage)initWithRelationshipsXml:(_xmlDoc *)a3 corePropertiesXml:(_xmlDoc *)a4 appPropertiesXml:(_xmlDoc *)a5 contentTypesXml:(_xmlDoc *)a6
{
  v11 = (void *)[objc_alloc(NSURL) initWithString:@"/"];
  v12 = [[OCPPackageRelationshipCollection alloc] initWithRelationshipsXml:a3 baseLocation:v11];
  mRelationships = self->mRelationships;
  self->mRelationships = v12;

  if (a4)
  {
    uint64_t v14 = [[OCPPackageProperties alloc] initWithCoreXml:a4 appXml:a5];
    mProperties = self->mProperties;
    self->mProperties = v14;
  }
  v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  mDefaultContentTypes = self->mDefaultContentTypes;
  self->mDefaultContentTypes = v16;

  v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  mContentTypeOverrides = self->mContentTypeOverrides;
  self->mContentTypeOverrides = v18;

  [(OCPPackage *)self readContentTypesXml:a6];
  return self;
}

- (void)readContentTypeOverrideFromElement:(_xmlNode *)a3
{
  properties = a3->properties;
  if (!properties)
  {
    id v9 = 0;
    v5 = 0;
    goto LABEL_14;
  }
  id v9 = 0;
  v5 = 0;
  do
  {
    if (properties->ns) {
      goto LABEL_9;
    }
    if (xmlStrEqual(properties->name, (const xmlChar *)"PartName"))
    {
      uint64_t v6 = objc_msgSend([NSString alloc], "tc_initWithValueOfXmlAttribute:", properties);
      v7 = v9;
      id v9 = (id)v6;
    }
    else
    {
      if (!xmlStrEqual(properties->name, (const xmlChar *)"ContentType")) {
        goto LABEL_9;
      }
      uint64_t v8 = objc_msgSend([NSString alloc], "tc_initWithValueOfXmlAttribute:", properties);
      v7 = v5;
      v5 = (void *)v8;
    }

LABEL_9:
    properties = properties->next;
  }
  while (properties);
  if (v9 && v5)
  {
    [(NSMutableDictionary *)self->mContentTypeOverrides setObject:v5 forKey:v9];
    goto LABEL_15;
  }
LABEL_14:
  +[OCPException raise:@"OCPPackageError" format:@"Could not find required content type attributes"];
LABEL_15:
}

@end
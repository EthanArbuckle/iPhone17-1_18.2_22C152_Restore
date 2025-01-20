@interface OCPPackageRelationshipCollection
- (OCPPackageRelationshipCollection)initWithRelationshipsXml:(_xmlDoc *)a3 baseLocation:(id)a4;
- (id)relationshipForIdentifier:(id)a3;
- (id)relationshipsByType:(id)a3;
@end

@implementation OCPPackageRelationshipCollection

- (OCPPackageRelationshipCollection)initWithRelationshipsXml:(_xmlDoc *)a3 baseLocation:(id)a4
{
  id v6 = a4;
  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  mIdentifierMap = self->mIdentifierMap;
  self->mIdentifierMap = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  mTypeMap = self->mTypeMap;
  self->mTypeMap = v9;

  if (a3)
  {
    xmlNodePtr RootElement = xmlDocGetRootElement(a3);
    if (!RootElement) {
      +[OCPException raise:@"OCPPackageError" format:@"No relationship root element"];
    }
    xmlNsPtr v12 = xmlSearchNsByHref(a3, RootElement, (const xmlChar *)"http://schemas.openxmlformats.org/package/2006/relationships");
    if (!v12) {
      +[OCPException raise:@"OCPPackageError" format:@"Could not find relationships namespace"];
    }
    if (!RootElement
      || (ns = RootElement->ns) == 0
      || !xmlStrEqual(ns->href, v12->href)
      || !xmlStrEqual(RootElement->name, (const xmlChar *)"Relationships"))
    {
      +[OCPException raise:@"OCPPackageError" format:@"Could not find relationships root"];
    }
    for (i = RootElement->children; i; i = i->next)
    {
      if (i->type == XML_ELEMENT_NODE
        && xmlStrEqual(i->ns->href, v12->href)
        && xmlStrEqual(i->name, (const xmlChar *)"Relationship"))
      {
        v15 = [[OCPPackageRelationship alloc] initWithXmlElement:i baseLocation:v6];
        v16 = [(OCPPackageRelationship *)v15 identifier];
        [(NSMutableDictionary *)self->mIdentifierMap setObject:v15 forKey:v16];
        v17 = [(OCPPackageRelationship *)v15 type];
        id v18 = [(NSMutableDictionary *)self->mTypeMap objectForKey:v17];
        if (!v18)
        {
          id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
          -[NSMutableDictionary setObject:forKey:](self->mTypeMap, "setObject:forKey:");
        }
        [v18 addObject:v15];
      }
    }
  }

  return self;
}

- (id)relationshipsByType:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mTypeMap objectForKey:a3];
  return v3;
}

- (id)relationshipForIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mIdentifierMap objectForKey:a3];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTypeMap, 0);
  objc_storeStrong((id *)&self->mIdentifierMap, 0);
}

@end
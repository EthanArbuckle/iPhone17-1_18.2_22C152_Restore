@interface OCPPackagePart
- (OCPPackage)package;
- (OCPPackagePart)initWithLocation:(id)a3 relationshipsXml:(_xmlDoc *)a4 package:(id)a5;
- (_xmlDoc)xmlDocument;
- (_xmlNode)fallbackNodeForChoiceNode:(_xmlNode *)a3;
- (_xmlTextReader)xmlReader;
- (id)contentType;
- (id)data;
- (id)firstPartWithRelationshipOfType:(id)a3;
- (id)location;
- (id)relationshipForIdentifier:(id)a3;
- (id)relationshipsByType:(id)a3;
- (void)dealloc;
- (void)setFallbackNode:(_xmlNode *)a3 forChoiceNode:(_xmlNode *)a4;
@end

@implementation OCPPackagePart

- (OCPPackagePart)initWithLocation:(id)a3 relationshipsXml:(_xmlDoc *)a4 package:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [(OCPPackagePart *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->mLocation, a3);
    v13 = [[OCPPackageRelationshipCollection alloc] initWithRelationshipsXml:a4 baseLocation:v12->mLocation];
    mRelationships = v12->mRelationships;
    v12->mRelationships = v13;

    objc_storeWeak((id *)&v12->mPackage, v10);
    uint64_t v15 = objc_opt_new();
    mAlternateContentMap = v12->mAlternateContentMap;
    v12->mAlternateContentMap = (NSMutableDictionary *)v15;

    v17 = v12;
  }

  return v12;
}

- (id)firstPartWithRelationshipOfType:(id)a3
{
  v4 = [(OCPPackagePart *)self relationshipsByType:a3];
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectAtIndex:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->mPackage);
    v8 = [v6 targetLocation];
    id v9 = [WeakRetained partForLocation:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)relationshipsByType:(id)a3
{
  v3 = [(OCPPackageRelationshipCollection *)self->mRelationships relationshipsByType:a3];
  return v3;
}

- (id)relationshipForIdentifier:(id)a3
{
  v3 = [(OCPPackageRelationshipCollection *)self->mRelationships relationshipForIdentifier:a3];
  return v3;
}

- (OCPPackage)package
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mPackage);
  return (OCPPackage *)WeakRetained;
}

- (id)location
{
  return self->mLocation;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  mDocument = self->mDocument;
  if (mDocument) {
    xmlFreeDoc(mDocument);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(NSMutableDictionary *)self->mAlternateContentMap allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = (xmlNode *)[*(id *)(*((void *)&v10 + 1) + 8 * v7) pointerValue];
        if (v8) {
          xmlFreeNode(v8);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)OCPPackagePart;
  [(OCPPackagePart *)&v9 dealloc];
}

- (id)contentType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mPackage);
  v4 = [WeakRetained contentTypeForPartLocation:self->mLocation];

  return v4;
}

- (id)data
{
  return 0;
}

- (_xmlDoc)xmlDocument
{
  return 0;
}

- (_xmlTextReader)xmlReader
{
  return 0;
}

- (_xmlNode)fallbackNodeForChoiceNode:(_xmlNode *)a3
{
  mAlternateContentMap = self->mAlternateContentMap;
  v4 = [MEMORY[0x263F08D40] valueWithPointer:a3];
  uint64_t v5 = [(NSMutableDictionary *)mAlternateContentMap objectForKey:v4];
  uint64_t v6 = (_xmlNode *)[v5 pointerValue];

  return v6;
}

- (void)setFallbackNode:(_xmlNode *)a3 forChoiceNode:(_xmlNode *)a4
{
  mAlternateContentMap = self->mAlternateContentMap;
  id v7 = [MEMORY[0x263F08D40] valueWithPointer:a3];
  uint64_t v6 = [MEMORY[0x263F08D40] valueWithPointer:a4];
  [(NSMutableDictionary *)mAlternateContentMap setObject:v7 forKey:v6];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mPackage);
  objc_storeStrong((id *)&self->mAlternateContentMap, 0);
  objc_storeStrong((id *)&self->mRelationships, 0);
  objc_storeStrong((id *)&self->mLocation, 0);
}

@end
@interface PXFeedAssetContainerList
- (BOOL)canEditContainers;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSOrderedSet)sectionInfos;
- (NSString)transientIdentifier;
- (id)containersRelationshipName;
- (id)managedObjectContext;
- (id)photoLibrary;
- (unint64_t)containersCount;
- (unint64_t)hash;
- (void)setSectionInfos:(id)a3;
@end

@implementation PXFeedAssetContainerList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfos, 0);
  objc_storeStrong((id *)&self->_transientIdentifier, 0);
}

- (void)setSectionInfos:(id)a3
{
}

- (NSOrderedSet)sectionInfos
{
  return self->_sectionInfos;
}

- (NSString)transientIdentifier
{
  transientIdentifier = self->_transientIdentifier;
  if (!transientIdentifier)
  {
    v4 = [MEMORY[0x1E4F29128] UUID];
    v5 = [v4 UUIDString];
    v6 = self->_transientIdentifier;
    self->_transientIdentifier = v5;

    transientIdentifier = self->_transientIdentifier;
  }
  return transientIdentifier;
}

- (id)containersRelationshipName
{
  return 0;
}

- (id)photoLibrary
{
  return 0;
}

- (id)managedObjectContext
{
  return 0;
}

- (BOOL)canEditContainers
{
  return 0;
}

- (BOOL)isEmpty
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(PXFeedAssetContainerList *)self containers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) isEmpty])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (unint64_t)containersCount
{
  v2 = [(PXFeedAssetContainerList *)self containers];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(PXFeedAssetContainerList *)self containers];
    BOOL v7 = [v5 containers];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(PXFeedAssetContainerList *)self containers];
  unint64_t v3 = [v2 hash];

  return v3;
}

@end
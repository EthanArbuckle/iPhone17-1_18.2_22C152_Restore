@interface PXDataSection
+ (id)dataSectionForAssetsInAssetContainers:(id)a3;
- (BOOL)containsAnyObjects;
- (NSObject)outlineObject;
- (NSString)debugDescription;
- (NSString)description;
- (PXDataSection)init;
- (PXDataSection)initWithOutlineObject:(id)a3;
- (id)content;
- (id)firstObject;
- (id)objectAtIndex:(int64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (int64_t)count;
- (int64_t)identifier;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation PXDataSection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_content, 0);
  objc_storeStrong((id *)&self->_outlineObject, 0);
}

- (id)content
{
  return self->_content;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (NSObject)outlineObject
{
  return self->_outlineObject;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXDataSection.m", 69, @"Method %s is a responsibility of subclass %@", "-[PXDataSection countByEnumeratingWithState:objects:count:]", v9 object file lineNumber description];

  abort();
}

- (NSString)debugDescription
{
  uint64_t v3 = [(PXDataSection *)self count];
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", CFSTR("<%@: %p; identifier = %ld, count = %ld, items = ("),
    objc_opt_class(),
    self,
    [(PXDataSection *)self identifier],
  v4 = v3);
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      v6 = [(PXDataSection *)self objectAtIndex:i];
      v7 = [v6 description];
      [v4 appendFormat:@"\n\t[%ld]%@", i, v7];
    }
  }
  [v4 appendString:@"\n>"]);
  return (NSString *)v4;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; identifier = %ld, count = %ld>",
                       objc_opt_class(),
                       self,
                       [(PXDataSection *)self identifier],
                       [(PXDataSection *)self count]);
}

- (BOOL)containsAnyObjects
{
  return [(PXDataSection *)self count] > 0;
}

- (id)objectsAtIndexes:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__PXDataSection_objectsAtIndexes___block_invoke;
  v10[3] = &unk_1E5DD1558;
  id v7 = v6;
  id v11 = v7;
  v12 = self;
  [v5 enumerateIndexesUsingBlock:v10];

  id v8 = v7;
  return v8;
}

void __34__PXDataSection_objectsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectAtIndex:a2];
  [v2 addObject:v3];
}

- (id)objectAtIndex:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXDataSection.m", 34, @"Method %s is a responsibility of subclass %@", "-[PXDataSection objectAtIndex:]", v7 object file lineNumber description];

  abort();
}

- (int64_t)count
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXDataSection.m", 30, @"Method %s is a responsibility of subclass %@", "-[PXDataSection count]", v6 object file lineNumber description];

  abort();
}

- (PXDataSection)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDataSection.m", 24, @"%s is not available as initializer", "-[PXDataSection init]");

  abort();
}

- (PXDataSection)initWithOutlineObject:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXDataSection;
  if ([(PXDataSection *)&v6 init]) {
    sub_1AB2347DC();
  }

  return 0;
}

+ (id)dataSectionForAssetsInAssetContainers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[PXStackedDataSection dataSectionForAssetsInCollections:v3];
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [MEMORY[0x1E4F38EB8] fetchAssetsForPersons:v3 options:0];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v3;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "px_fetchContainedAssets", (void)v17);
            v15 = [[PXFetchResultDataSection alloc] initWithFetchResult:v14];
            [v7 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v11);
      }

      id v8 = [[PXStackedDataSection alloc] initWithChildDataSections:v7 outlineObject:0];
      goto LABEL_16;
    }
    uint64_t v6 = [MEMORY[0x1E4F38EB8] fetchExclusiveAssetsForSocialGroup:v4 options:0];
  }
  id v7 = (void *)v6;
  id v8 = [[PXFetchResultDataSection alloc] initWithFetchResult:v6];
LABEL_16:
  id v5 = v8;

LABEL_17:
  return v5;
}

- (id)firstObject
{
  if ([(PXDataSection *)self containsAnyObjects])
  {
    id v3 = [(PXDataSection *)self objectAtIndex:0];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

@end
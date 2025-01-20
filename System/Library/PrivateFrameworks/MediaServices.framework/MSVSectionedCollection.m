@interface MSVSectionedCollection
+ (BOOL)supportsSecureCoding;
+ (Class)msv_immutableClass;
+ (Class)msv_mutableClass;
- (BOOL)hasSameContentAsSectionedCollection:(id)a3;
- (MSVSectionedCollection)init;
- (MSVSectionedCollection)initWithCoder:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)_stateDumpObject;
- (id)allItems;
- (id)allSections;
- (id)firstItem;
- (id)firstSection;
- (id)indexPathForGlobalIndex:(int64_t)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)itemsInSectionAtIndex:(int64_t)a3;
- (id)lastItem;
- (id)lastSection;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)sectionAtIndex:(int64_t)a3;
- (int64_t)globalIndexForIndexPath:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)totalItemCount;
- (void)_initializeAsEmptySectionedCollection;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateItemsInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)enumerateSectionsUsingBlock:(id)a3;
- (void)reverseEnumerateSectionsUsingBlock:(id)a3;
@end

@implementation MSVSectionedCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_sectionedItems, 0);
}

- (void)_initializeAsEmptySectionedCollection
{
  sectionedItems = self->_sectionedItems;
  v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
  self->_sectionedItems = (NSArray *)MEMORY[0x1E4F1CBF0];

  sections = self->_sections;
  self->_sections = v4;
}

- (id)_stateDumpObject
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MSVSectionedCollection *)self numberOfSections];
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[MSVSectionedCollection numberOfSections](self, "numberOfSections"));
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      int64_t v6 = [(MSVSectionedCollection *)self numberOfItemsInSection:i];
      v7 = [(MSVSectionedCollection *)self sectionAtIndex:i];
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __42__MSVSectionedCollection__stateDumpObject__block_invoke;
      v13[3] = &unk_1E5ADA190;
      id v14 = v8;
      id v9 = v8;
      [(MSVSectionedCollection *)self enumerateItemsInSectionAtIndex:i usingBlock:v13];
      v15[0] = @"section";
      v15[1] = @"items";
      v16[0] = v7;
      v16[1] = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", i);
      [v4 setObject:v10 forKey:v11];
    }
  }
  return v4;
}

uint64_t __42__MSVSectionedCollection__stateDumpObject__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (int64_t)totalItemCount
{
  uint64_t v3 = [(MSVSectionedCollection *)self numberOfSections];
  if (v3 < 1) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  int64_t v6 = 0;
  do
    v6 += [(MSVSectionedCollection *)self numberOfItemsInSection:v5++];
  while (v4 != v5);
  return v6;
}

- (id)lastSection
{
  return [(NSArray *)self->_sections lastObject];
}

- (BOOL)hasSameContentAsSectionedCollection:(id)a3
{
  return self == a3;
}

- (id)itemsInSectionAtIndex:(int64_t)a3
{
  return [(NSArray *)self->_sectionedItems objectAtIndex:a3];
}

- (id)indexPathForGlobalIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    uint64_t v22 = v6;
    uint64_t v23 = v5;
    uint64_t v24 = v4;
    uint64_t v25 = v3;
    if (a3 < 0)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"MSVSectionedCollection.m" lineNumber:252 description:@"globalIndex must be greater than or equal to 0"];
    }
    uint64_t v15 = [(MSVSectionedCollection *)self numberOfSections];
    if (v15 < 1)
    {
LABEL_11:
      v11 = 0;
    }
    else
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      while (1)
      {
        int64_t v19 = [(MSVSectionedCollection *)self numberOfItemsInSection:v17];
        if (v19 + v18 > a3) {
          break;
        }
        ++v17;
        v18 += v19;
        if (v16 == v17) {
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(MEMORY[0x1E4F28D58], "msv_indexPathForItem:inSection:", a3 - v18, v17);
    }
  }
  return v11;
}

- (int64_t)globalIndexForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "msv_section");
  uint64_t v6 = objc_msgSend(v4, "msv_item");
  if (v5 < 0)
  {
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    while (v5 != v8)
      v9 += [(MSVSectionedCollection *)self numberOfItemsInSection:v8++];
    if (v7 >= [(MSVSectionedCollection *)self numberOfItemsInSection:v5]) {
      int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      int64_t v10 = v7 + v9;
    }
  }

  return v10;
}

- (id)firstSection
{
  return [(NSArray *)self->_sections firstObject];
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  sectionedItems = self->_sectionedItems;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MSVSectionedCollection_enumerateItemsUsingBlock___block_invoke;
  v7[3] = &unk_1E5ADA168;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = v10;
  [(NSArray *)sectionedItems enumerateObjectsUsingBlock:v7];

  _Block_object_dispose(v10, 8);
}

void __51__MSVSectionedCollection_enumerateItemsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__MSVSectionedCollection_enumerateItemsUsingBlock___block_invoke_2;
  void v10[3] = &unk_1E5ADA140;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = v8;
  uint64_t v12 = v9;
  uint64_t v13 = a3;
  [a2 enumerateObjectsUsingBlock:v10];
  if (a4 && *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

void __51__MSVSectionedCollection_enumerateItemsUsingBlock___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  int64_t v7 = (void *)MEMORY[0x1A6242480]();
  uint64_t v8 = a1[4];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D58], "msv_indexPathForItem:inSection:", a3, a1[6]);
  (*(void (**)(uint64_t, id, void *, uint64_t))(v8 + 16))(v8, v10, v9, *(void *)(a1[5] + 8) + 24);

  if (a4 && *(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    *a4 = 1;
  }
}

- (void)enumerateItemsInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, uint64_t, char *))a4;
  [(NSArray *)self->_sectionedItems objectAtIndex:a3];
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v14;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v7);
      }
      v6[2](v6, *(void *)(*((void *)&v13 + 1) + 8 * v12), v10 + v12, &v17);
      if (v17) {
        break;
      }
      if (v9 == ++v12)
      {
        v10 += v12;
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)reverseEnumerateSectionsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, int64_t, BOOL *))a3;
  int64_t v5 = [(NSArray *)self->_sections count] - 1;
  BOOL v8 = v5 < 0;
  do
  {
    if (v8) {
      break;
    }
    if (v5 < 0) {
      break;
    }
    id v6 = [(MSVSectionedCollection *)self sectionAtIndex:v5];
    v4[2](v4, v6, v5, &v8);
    BOOL v7 = v8;
    --v5;
  }
  while (!v7);
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, uint64_t, char *))a3;
  char v15 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v5 = self->_sections;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v12;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10), v8 + v10, &v15);
      if (v15) {
        break;
      }
      if (v7 == ++v10)
      {
        v8 += v10;
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "msv_section");
  uint64_t v6 = objc_msgSend(v4, "msv_item");

  uint64_t v7 = [(NSArray *)self->_sectionedItems objectAtIndex:v5];
  uint64_t v8 = [v7 objectAtIndex:v6];

  return v8;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_sectionedItems objectAtIndex:a3];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)sectionAtIndex:(int64_t)a3
{
  return [(NSArray *)self->_sections objectAtIndex:a3];
}

- (int64_t)numberOfSections
{
  return [(NSArray *)self->_sections count];
}

- (id)allSections
{
  v2 = (void *)[(NSArray *)self->_sections copy];
  return v2;
}

- (id)allItems
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[MSVSectionedCollection totalItemCount](self, "totalItemCount"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v4 = self->_sectionedItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObjectsFromArray:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = (void *)[v3 copy];
  return v9;
}

- (id)lastItem
{
  v2 = [(NSArray *)self->_sectionedItems lastObject];
  uint64_t v3 = [v2 lastObject];

  return v3;
}

- (id)firstItem
{
  v2 = [(NSArray *)self->_sectionedItems firstObject];
  uint64_t v3 = [v2 firstObject];

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int64_t v4 = objc_alloc_init(MSVMutableSectionedCollection);
  if (v4)
  {
    uint64_t v5 = [(NSArray *)self->_sections mutableCopy];
    sections = v4->super._sections;
    v4->super._sections = (NSArray *)v5;

    uint64_t v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_sectionedItems, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = self->_sectionedItems;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "mutableCopy", (void)v16);
          [(NSArray *)v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    sectionedItems = v4->super._sectionedItems;
    v4->super._sectionedItems = v7;
  }
  return v4;
}

+ (Class)msv_immutableClass
{
  return (Class)objc_opt_class();
}

+ (Class)msv_mutableClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  int64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  int64_t v7 = [(MSVSectionedCollection *)self numberOfSections];
  uint64_t v8 = v7;
  uint64_t v9 = @"sections";
  if (v7 == 1) {
    uint64_t v9 = @"section";
  }
  [v6 appendFormat:@"; %lu %@", v7, v9];
  [v6 appendString:@"; ["];
  if (v8 >= 1)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      int64_t v11 = [(MSVSectionedCollection *)self numberOfItemsInSection:i];
      uint64_t v12 = [(MSVSectionedCollection *)self sectionAtIndex:i];
      uint64_t v13 = [v12 description];
      long long v14 = (void *)v13;
      if (v11 == 1) {
        char v15 = @"item";
      }
      else {
        char v15 = @"items";
      }
      [v6 appendFormat:@"\n    %@ (%lu %@),", v13, v11, v15];
    }
    [v6 appendString:@"\n"];
  }
  [v6 appendString:@"]"];
  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  int64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  int64_t v7 = [(MSVSectionedCollection *)self numberOfSections];
  uint64_t v8 = v7;
  uint64_t v9 = @"sections";
  if (v7 == 1) {
    uint64_t v9 = @"section";
  }
  [v6 appendFormat:@"; %lu %@", v7, v9];
  [v6 appendString:@": ["];
  if (v8 >= 1)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v11 = [(MSVSectionedCollection *)self numberOfItemsInSection:i];
      uint64_t v12 = [(MSVSectionedCollection *)self sectionAtIndex:i];
      uint64_t v13 = [v12 debugDescription];
      long long v14 = (void *)v13;
      char v15 = @"items";
      if (v11 == 1) {
        char v15 = @"item";
      }
      [v6 appendFormat:@"\n    %@ (%lu %@): [", v13, v11, v15];

      if (v11 >= 1)
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          long long v17 = objc_msgSend(MEMORY[0x1E4F28D58], "msv_indexPathForItem:inSection:", j, i);
          long long v18 = [(MSVSectionedCollection *)self itemAtIndexPath:v17];
          long long v19 = [v18 debugDescription];
          [v6 appendFormat:@"\n        %@,", v19];
        }
        [v6 appendString:@"\n    "];
      }
      [v6 appendString:@"],"];
    }
    [v6 appendString:@"\n"];
  }
  [v6 appendString:@"]"];
  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  sectionedItems = self->_sectionedItems;
  id v5 = a3;
  [v5 encodeObject:sectionedItems forKey:@"sectionedItems"];
  [v5 encodeObject:self->_sections forKey:@"sections"];
}

- (MSVSectionedCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSVSectionedCollection;
  id v5 = [(MSVSectionedCollection *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionedItems"];
    sectionedItems = v5->_sectionedItems;
    v5->_sectionedItems = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sections"];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v8;
  }
  return v5;
}

- (MSVSectionedCollection)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSVSectionedCollection;
  v2 = [(MSVSectionedCollection *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(MSVSectionedCollection *)v2 _initializeAsEmptySectionedCollection];
  }
  return v3;
}

@end
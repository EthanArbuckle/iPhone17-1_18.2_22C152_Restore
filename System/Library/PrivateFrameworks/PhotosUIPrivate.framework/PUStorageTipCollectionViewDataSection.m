@interface PUStorageTipCollectionViewDataSection
- (NSArray)allItems;
- (PUStorageTipCollectionViewDataSection)initWithOutlineObject:(id)a3;
- (PUStorageTipCollectionViewDataSection)initWithSizesDictionary:(id)a3 countsDictionary:(id)a4;
- (PUStorageTipCollectionViewDataSection)initWithZerosWithStorageTipCount:(int64_t)a3;
- (id)objectAtIndex:(int64_t)a3;
- (int64_t)count;
- (int64_t)totalStorageSize;
@end

@implementation PUStorageTipCollectionViewDataSection

- (void).cxx_destruct
{
}

- (NSArray)allItems
{
  return self->_allItems;
}

- (int64_t)totalStorageSize
{
  return self->_totalStorageSize;
}

- (id)objectAtIndex:(int64_t)a3
{
  v4 = [(PUStorageTipCollectionViewDataSection *)self allItems];
  v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (int64_t)count
{
  v2 = [(PUStorageTipCollectionViewDataSection *)self allItems];
  int64_t v3 = [v2 count];

  return v3;
}

- (PUStorageTipCollectionViewDataSection)initWithOutlineObject:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUStorageTipCollectionViewDataSection.m", 64, @"%s is not available as initializer", "-[PUStorageTipCollectionViewDataSection initWithOutlineObject:]");

  abort();
}

- (PUStorageTipCollectionViewDataSection)initWithZerosWithStorageTipCount:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PUStorageTipCollectionViewDataSection;
  v4 = [(PXDataSection *)&v10 initWithOutlineObject:0];
  if (v4)
  {
    id v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a3 >= 1)
    {
      uint64_t v6 = 0;
      do
      {
        v7 = [[PUStorageTipListItem alloc] initWithStorageTipType:v6 count:0 totalSizeInBytes:0];
        [(NSArray *)v5 addObject:v7];

        ++v6;
      }
      while (a3 != v6);
    }
    allItems = v4->_allItems;
    v4->_allItems = v5;

    v4->_totalStorageSize = 0;
  }
  return v4;
}

- (PUStorageTipCollectionViewDataSection)initWithSizesDictionary:(id)a3 countsDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PUStorageTipCollectionViewDataSection;
  v9 = [(PXDataSection *)&v28 initWithOutlineObject:0];
  if (v9)
  {
    if ([v7 count])
    {
      objc_super v10 = v7;
      uint64_t v11 = [v7 count];
      if (v11 != [v8 count])
      {
        v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:a2, v9, @"PUStorageTipCollectionViewDataSection.m", 34, @"Invalid parameter not satisfying: %@", @"sizes.count == counts.count" object file lineNumber description];
      }
      v12 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v10 count])
      {
        unint64_t v13 = 0;
        id v27 = v8;
        do
        {
          v14 = [PUStorageTipListItem alloc];
          v15 = [NSNumber numberWithInteger:v13];
          [v8 objectForKeyedSubscript:v15];
          v17 = v16 = v9;
          uint64_t v18 = [v17 longValue];
          v19 = [NSNumber numberWithInteger:v13];
          v20 = [v10 objectForKeyedSubscript:v19];
          v21 = -[PUStorageTipListItem initWithStorageTipType:count:totalSizeInBytes:](v14, "initWithStorageTipType:count:totalSizeInBytes:", v13, v18, [v20 longValue]);

          v9 = v16;
          [(NSArray *)v12 addObject:v21];
          v22 = [NSNumber numberWithInteger:v13];
          v23 = [v10 objectForKeyedSubscript:v22];
          v16->_totalStorageSize += [v23 longValue];

          id v8 = v27;
          ++v13;
        }
        while (v13 < [v10 count]);
      }
      allItems = v9->_allItems;
      v9->_allItems = v12;
      id v7 = v10;
    }
    else
    {
      v9->_totalStorageSize = 0;
      allItems = v9->_allItems;
      v9->_allItems = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v9;
}

@end
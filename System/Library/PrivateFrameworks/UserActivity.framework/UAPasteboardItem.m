@interface UAPasteboardItem
- (NSArray)types;
- (UAPasteboardItem)init;
- (id)description;
- (void)addType:(id)a3;
- (void)setTypes:(id)a3;
@end

@implementation UAPasteboardItem

- (UAPasteboardItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)UAPasteboardItem;
  v2 = [(UAPasteboardItem *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    [(UAPasteboardItem *)v2 setTypes:v3];
  }
  return v2;
}

- (void)addType:(id)a3
{
  id v17 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    v7 = [(UAPasteboardItem *)v4 types];
    unint64_t v8 = [v7 count];

    if (v8 <= i) {
      goto LABEL_6;
    }
    v9 = [(UAPasteboardItem *)v4 types];
    v10 = [v9 objectAtIndexedSubscript:i];

    v11 = [v10 type];
    v12 = [v17 type];
    char v13 = [v11 isEqualToString:v12];

    if (v13) {
      break;
    }
    v5 += 0x100000000;
  }
  if (i == -1)
  {
LABEL_6:
    v14 = [(UAPasteboardItem *)v4 types];
    v15 = [v14 arrayByAddingObject:v17];
    [(UAPasteboardItem *)v4 setTypes:v15];

    goto LABEL_8;
  }
  v16 = [(UAPasteboardItem *)v4 types];
  v14 = (void *)[v16 mutableCopy];

  [v14 removeObjectAtIndex:v5 >> 32];
  [v14 addObject:v17];
  [(UAPasteboardItem *)v4 setTypes:v14];
LABEL_8:

  objc_sync_exit(v4);
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = self;
  objc_sync_enter(v4);
  for (unint64_t i = 0; ; ++i)
  {
    v6 = [(UAPasteboardItem *)v4 types];
    unint64_t v7 = [v6 count];

    if (v7 <= i) {
      break;
    }
    unint64_t v8 = [(UAPasteboardItem *)v4 types];
    v9 = [v8 objectAtIndexedSubscript:i];

    if (i)
    {
      v10 = [(UAPasteboardItem *)v4 types];
      uint64_t v11 = [v10 count] - 1;

      v12 = [v9 type];
      if (i == v11) {
        [v3 appendFormat:@"%@"], v12);
      }
      else {
        [v3 appendFormat:@"%@, ", v12];
      }
    }
    else
    {
      v12 = [v9 type];
      objc_msgSend(v3, "appendFormat:", @"(%@, "), v12;
    }
  }
  objc_sync_exit(v4);

  char v13 = (void *)[v3 copy];

  return v13;
}

- (NSArray)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
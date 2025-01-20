@interface TSTTableDataList
- (BOOL)supportsIDMapForType:(int)a3;
- (TSTIntegerKeyDict)data;
- (TSTTableDataList)initWithType:(int)a3 context:(id)a4;
- (id)allRichTextPayloadStorages;
- (id)packageLocator;
- (unint64_t)flushableSize;
- (unsigned)nextID;
- (void)dealloc;
- (void)p_setupWithType:(int)a3 nextKeyID:(unsigned int)a4;
@end

@implementation TSTTableDataList

- (BOOL)supportsIDMapForType:(int)a3
{
  return (a3 > 0xA) | (0x2CFu >> a3) & 1;
}

- (void)p_setupWithType:(int)a3 nextKeyID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  self->mListType = a3;
  self->mNextID = a4;
  self->mData = objc_alloc_init(TSTIntegerKeyDict);
  if ([(TSTTableDataList *)self supportsIDMapForType:v4]) {
    v6 = objc_alloc_init(TSTTableDataObjectKeyDict);
  }
  else {
    v6 = 0;
  }
  self->mIDs = v6;
}

- (TSTTableDataList)initWithType:(int)a3 context:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)TSTTableDataList;
  v5 = [(TSPObject *)&v8 initWithContext:a4];
  v6 = v5;
  if (v5) {
    [(TSTTableDataList *)v5 p_setupWithType:v4 nextKeyID:1];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataList;
  [(TSTTableDataList *)&v3 dealloc];
}

- (unint64_t)flushableSize
{
  int64_t v2 = [(TSTIntegerKeyDict *)self->mData count];
  objc_super v3 = (objc_class *)objc_opt_class();
  return class_getInstanceSize(v3) * v2;
}

- (id)packageLocator
{
  return @"Tables/DataList";
}

- (id)allRichTextPayloadStorages
{
  id v2 = [(TSTIntegerKeyDict *)self->mData allValues];
  objc_super v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__TSTTableDataList_allRichTextPayloadStorages__block_invoke;
  v5[3] = &unk_2646B0B18;
  v5[4] = v3;
  [v2 enumerateObjectsUsingBlock:v5];
  return v3;
}

uint64_t __46__TSTTableDataList_allRichTextPayloadStorages__block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = TSUDynamicCast();
  if (result)
  {
    objc_super v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(result + 16) storage];
    return [v3 addObject:v4];
  }
  return result;
}

- (TSTIntegerKeyDict)data
{
  return self->mData;
}

- (unsigned)nextID
{
  return self->mNextID;
}

@end
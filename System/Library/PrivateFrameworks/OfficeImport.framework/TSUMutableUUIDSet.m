@interface TSUMutableUUIDSet
- (void)addUuidsFromSet:(id)a3;
- (void)removeAllUuids;
- (void)removeUuidsFromSet:(id)a3;
@end

@implementation TSUMutableUUIDSet

- (void)removeAllUuids
{
  self->super._index = 0;
  std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::clear(&self->super._uuidSet.__table_.__bucket_list_.__ptr_.__value_);
}

- (void)addUuidsFromSet:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__TSUMutableUUIDSet_addUuidsFromSet___block_invoke;
    v6[3] = &unk_264D616D0;
    v6[4] = self;
    [v4 foreachUuid:v6];
  }
}

uint64_t __37__TSUMutableUUIDSet_addUuidsFromSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_addUUID:", a2);
}

- (void)removeUuidsFromSet:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__TSUMutableUUIDSet_removeUuidsFromSet___block_invoke;
    v6[3] = &unk_264D616D0;
    v6[4] = self;
    [v4 foreachUuid:v6];
  }
}

uint64_t __40__TSUMutableUUIDSet_removeUuidsFromSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_removeUUID:", a2);
}

@end
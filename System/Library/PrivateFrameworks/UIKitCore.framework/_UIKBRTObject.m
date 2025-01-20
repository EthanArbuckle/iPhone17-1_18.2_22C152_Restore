@interface _UIKBRTObject
- (id)nextEntry;
- (id)owner;
- (id)previousEntry;
- (void)setOwner:(id)a3;
@end

@implementation _UIKBRTObject

- (id)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = (OS_dispatch_queue *)dispatch_queue_create("_UIKBRTObjectQueue", 0);
    syncQueue = self->_syncQueue;
    self->_syncQueue = v6;

    objc_storeStrong((id *)&self->_owner, a3);
  }
  else if (self->_owner)
  {
    v8 = self->_syncQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26___UIKBRTObject_setOwner___block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    v9 = v8;
    dispatch_sync(v9, block);
  }
}

- (id)previousEntry
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__138;
  v11 = __Block_byref_object_dispose__138;
  id v12 = 0;
  owner = self->_owner;
  if (owner)
  {
    syncQueue = self->_syncQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __30___UIKBRTObject_previousEntry__block_invoke;
    v6[3] = &unk_1E52E4728;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(syncQueue, v6);
    owner = (NSMutableArray *)v8[5];
  }
  v4 = owner;
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)nextEntry
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__138;
  v11 = __Block_byref_object_dispose__138;
  id v12 = 0;
  owner = self->_owner;
  if (owner)
  {
    syncQueue = self->_syncQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __26___UIKBRTObject_nextEntry__block_invoke;
    v6[3] = &unk_1E52E4728;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(syncQueue, v6);
    owner = (NSMutableArray *)v8[5];
  }
  v4 = owner;
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
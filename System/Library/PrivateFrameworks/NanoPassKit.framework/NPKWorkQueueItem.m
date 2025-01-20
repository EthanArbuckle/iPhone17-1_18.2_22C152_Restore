@interface NPKWorkQueueItem
+ (id)itemWithTransaction:(id)a3 work:(id)a4;
- (NPKOSTransaction)transaction;
- (NPKWorkQueueItem)initWithTransaction:(id)a3 work:(id)a4;
- (id)workBlock;
@end

@implementation NPKWorkQueueItem

- (NPKWorkQueueItem)initWithTransaction:(id)a3 work:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NPKWorkQueueItem;
  v9 = [(NPKWorkQueueItem *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transaction, a3);
    uint64_t v11 = MEMORY[0x223C37380](v8);
    id workBlock = v10->_workBlock;
    v10->_id workBlock = (id)v11;
  }
  return v10;
}

+ (id)itemWithTransaction:(id)a3 work:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[NPKWorkQueueItem alloc] initWithTransaction:v6 work:v5];

  return v7;
}

- (NPKOSTransaction)transaction
{
  return self->_transaction;
}

- (id)workBlock
{
  return self->_workBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_workBlock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
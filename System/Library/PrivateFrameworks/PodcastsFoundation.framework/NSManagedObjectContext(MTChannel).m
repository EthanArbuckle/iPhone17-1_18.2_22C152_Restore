@interface NSManagedObjectContext(MTChannel)
- (id)channelForStoreId:()MTChannel;
@end

@implementation NSManagedObjectContext(MTChannel)

- (id)channelForStoreId:()MTChannel
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__NSManagedObjectContext_MTChannel__channelForStoreId___block_invoke;
  v5[3] = &unk_1E5E617A8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = a1;
  [a1 performBlockAndWait:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

@end
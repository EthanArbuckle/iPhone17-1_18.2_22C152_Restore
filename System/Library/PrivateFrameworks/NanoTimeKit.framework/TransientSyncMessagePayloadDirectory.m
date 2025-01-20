@interface TransientSyncMessagePayloadDirectory
@end

@implementation TransientSyncMessagePayloadDirectory

void ___TransientSyncMessagePayloadDirectory_block_invoke()
{
  v0 = NSTemporaryDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"sync.transientpayloads"];
  v2 = (void *)_TransientSyncMessagePayloadDirectory___path;
  _TransientSyncMessagePayloadDirectory___path = v1;

  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v3 createDirectoryAtPath:_TransientSyncMessagePayloadDirectory___path withIntermediateDirectories:1 attributes:0 error:0];
}

@end
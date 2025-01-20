@interface SnapshotCacheQueue
@end

@implementation SnapshotCacheQueue

void ___SnapshotCacheQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.passkit.snapshotcache", 0);
  v1 = (void *)qword_1EB545CD0;
  qword_1EB545CD0 = (uint64_t)v0;
}

@end
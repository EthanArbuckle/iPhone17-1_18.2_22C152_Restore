@interface SWCChatterboxResolver
@end

@implementation SWCChatterboxResolver

void __41___SWCChatterboxResolver_Private___queue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;

  [(id)_MergedGlobals_1 setMaxConcurrentOperationCount:1];
  id v3 = (id)[[NSString alloc] initWithFormat:@"SWC Chatterbox resolution queue"];
  objc_msgSend((id)_MergedGlobals_1, "setName:");

  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("SWC Chatterbox resolution queue (U)", v2);

  if (v4) {
    [(id)_MergedGlobals_1 setUnderlyingQueue:v4];
  }
}

@end
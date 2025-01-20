@interface UISystemReferenceAngleMultiplexer
@end

@implementation UISystemReferenceAngleMultiplexer

void __55___UISystemReferenceAngleMultiplexer_sharedMultiplexer__block_invoke()
{
  v0 = objc_alloc_init(_UISystemReferenceAngleMultiplexer);
  v1 = (void *)qword_1EB262260;
  qword_1EB262260 = (uint64_t)v0;
}

id __84___UISystemReferenceAngleMultiplexer_systemReferenceAngleDidChange_mode_forWindows___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 _contextId];
  if (v2)
  {
    v3 = [NSNumber numberWithUnsignedInt:v2];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
@interface VFXMTLOpenSubdivComputeEvaluator
- (void)dealloc;
@end

@implementation VFXMTLOpenSubdivComputeEvaluator

- (void)dealloc
{
  computeEvaluator = self->_computeEvaluator;
  if (computeEvaluator)
  {
    uint64_t v4 = sub_1B6E1117C(computeEvaluator);
    MEMORY[0x1BA9B6D80](v4, 0x1080C40AA79BA9DLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)VFXMTLOpenSubdivComputeEvaluator;
  [(VFXMTLOpenSubdivComputeEvaluator *)&v5 dealloc];
}

@end
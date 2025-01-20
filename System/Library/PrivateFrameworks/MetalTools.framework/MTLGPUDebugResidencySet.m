@interface MTLGPUDebugResidencySet
- (MTLGPUDebugResidencySet)initWithResidencySet:(id)a3 device:(id)a4 descriptor:(id)a5;
@end

@implementation MTLGPUDebugResidencySet

- (MTLGPUDebugResidencySet)initWithResidencySet:(id)a3 device:(id)a4 descriptor:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MTLGPUDebugResidencySet;
  return -[MTLToolsResidencySet initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3, a4, a5);
}

@end
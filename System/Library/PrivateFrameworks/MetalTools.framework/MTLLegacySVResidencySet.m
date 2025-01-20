@interface MTLLegacySVResidencySet
- (MTLLegacySVResidencySet)initWithResidencySet:(id)a3 device:(id)a4 descriptor:(id)a5;
@end

@implementation MTLLegacySVResidencySet

- (MTLLegacySVResidencySet)initWithResidencySet:(id)a3 device:(id)a4 descriptor:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVResidencySet;
  return -[MTLToolsResidencySet initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3, a4, a5);
}

@end
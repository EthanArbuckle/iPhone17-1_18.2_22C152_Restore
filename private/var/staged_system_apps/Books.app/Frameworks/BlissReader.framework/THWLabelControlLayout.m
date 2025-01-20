@interface THWLabelControlLayout
- (Class)repClassOverride;
@end

@implementation THWLabelControlLayout

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

@end
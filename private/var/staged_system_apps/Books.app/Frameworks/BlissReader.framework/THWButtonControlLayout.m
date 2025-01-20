@interface THWButtonControlLayout
- (Class)repClassOverride;
@end

@implementation THWButtonControlLayout

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

@end
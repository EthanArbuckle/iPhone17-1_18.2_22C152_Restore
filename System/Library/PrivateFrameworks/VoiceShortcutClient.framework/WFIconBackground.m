@interface WFIconBackground
+ (BOOL)supportsSecureCoding;
- (id)_init;
@end

@implementation WFIconBackground

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)WFIconBackground;
  return [(WFIconBackground *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
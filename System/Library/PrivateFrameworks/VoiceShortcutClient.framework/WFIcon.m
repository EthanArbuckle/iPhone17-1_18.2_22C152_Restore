@interface WFIcon
+ (BOOL)supportsSecureCoding;
- (BOOL)hasClearBackground;
- (BOOL)hasTransparentBackground;
- (id)_init;
@end

@implementation WFIcon

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)WFIcon;
  return [(WFIcon *)&v3 init];
}

- (BOOL)hasTransparentBackground
{
  return 0;
}

- (BOOL)hasClearBackground
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
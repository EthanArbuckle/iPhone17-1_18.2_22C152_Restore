@interface WDOleObject
- (id)description;
- (int)runType;
@end

@implementation WDOleObject

- (int)runType
{
  return 5;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDOleObject;
  v2 = [(WDPicture *)&v4 description];
  return v2;
}

@end
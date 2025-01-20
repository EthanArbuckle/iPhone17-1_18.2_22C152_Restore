@interface PDSlideNumberField
- (id)description;
@end

@implementation PDSlideNumberField

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDSlideNumberField;
  v2 = [(OADTextRun *)&v4 description];
  return v2;
}

@end
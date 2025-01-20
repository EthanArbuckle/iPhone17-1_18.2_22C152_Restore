@interface WFWidgetOptions
- (INIntent)intent;
- (NSNumber)cornerRadius;
- (int64_t)family;
- (void)setCornerRadius:(id)a3;
- (void)setFamily:(int64_t)a3;
- (void)setIntent:(id)a3;
@end

@implementation WFWidgetOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (void)setCornerRadius:(id)a3
{
}

- (NSNumber)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setFamily:(int64_t)a3
{
  self->_family = a3;
}

- (int64_t)family
{
  return self->_family;
}

- (void)setIntent:(id)a3
{
}

- (INIntent)intent
{
  return self->_intent;
}

@end
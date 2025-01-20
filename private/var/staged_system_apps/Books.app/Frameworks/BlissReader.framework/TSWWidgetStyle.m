@interface TSWWidgetStyle
+ (id)properties;
@end

@implementation TSWWidgetStyle

+ (id)properties
{
  id result = (id)qword_5731A0;
  if (!qword_5731A0)
  {
    id result = [objc_alloc((Class)TSSPropertySet) initWithProperties:4622];
    qword_5731A0 = (uint64_t)result;
  }
  return result;
}

@end
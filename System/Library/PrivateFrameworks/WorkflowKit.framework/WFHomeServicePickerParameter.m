@interface WFHomeServicePickerParameter
- (BOOL)allowsMultipleValues;
- (Class)singleStateClass;
- (id)localizedLabelForState:(id)a3;
@end

@implementation WFHomeServicePickerParameter

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (id)localizedLabelForState:(id)a3
{
  if (a3)
  {
    v3 = [a3 service];
    v4 = [v3 name];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end
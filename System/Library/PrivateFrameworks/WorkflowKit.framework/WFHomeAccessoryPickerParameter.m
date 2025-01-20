@interface WFHomeAccessoryPickerParameter
- (BOOL)allowsMultipleValues;
- (Class)singleStateClass;
- (id)localizedLabelForState:(id)a3;
@end

@implementation WFHomeAccessoryPickerParameter

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (id)localizedLabelForState:(id)a3
{
  if (a3)
  {
    v3 = [a3 triggerActionSetsBuilder];
    if ([v3 hasActions])
    {
      v4 = [v3 actionSetsSummary];
      v5 = [v4 summaryText];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end
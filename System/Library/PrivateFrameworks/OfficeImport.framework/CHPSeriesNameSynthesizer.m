@interface CHPSeriesNameSynthesizer
- (BOOL)isObjectSupported:(id)a3;
- (void)applyProcessorToObject:(id)a3 sheet:(id)a4;
@end

@implementation CHPSeriesNameSynthesizer

- (BOOL)isObjectSupported:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [v4 name];
    if (v5)
    {
      BOOL v6 = 0;
    }
    else
    {
      v7 = [v4 lastCachedName];
      BOOL v6 = v7 == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v4 = a3;
  objc_msgSend(v4, "defaultSeriesNameForIndex:", objc_msgSend(v4, "styleIndex"));
  v5 = (EDValue *)objc_claimAutoreleasedReturnValue();
  EDValue::makeWithNSString(v5, (uint64_t)&v7);

  BOOL v6 = [[CHDDataValue alloc] initWithIndex:-1 value:&v7];
  [v4 setLastCachedName:v6];

  EDValue::~EDValue(&v7);
}

@end
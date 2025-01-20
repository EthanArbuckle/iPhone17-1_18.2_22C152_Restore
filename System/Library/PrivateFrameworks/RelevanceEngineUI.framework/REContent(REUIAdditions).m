@interface REContent(REUIAdditions)
- (id)circularTempate;
- (id)gaugeProvider;
- (id)summaryImageProvider;
- (id)summaryTextProvider;
- (uint64_t)setSummaryImageProvider:()REUIAdditions;
- (uint64_t)setSummaryTextProvider:()REUIAdditions;
- (void)setCircularTempate:()REUIAdditions;
- (void)setGaugeProvider:()REUIAdditions;
@end

@implementation REContent(REUIAdditions)

- (id)summaryTextProvider
{
  v2 = [a1 objectForKey:@"REUISummaryTextProviderKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [a1 description1TextProvider];
  }
  v4 = v3;

  return v4;
}

- (uint64_t)setSummaryTextProvider:()REUIAdditions
{
  return [a1 setObject:a3 forKey:@"REUISummaryTextProviderKey"];
}

- (id)summaryImageProvider
{
  v1 = [a1 objectForKey:@"REUISummaryImageProviderKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)setSummaryImageProvider:()REUIAdditions
{
  return [a1 setObject:a3 forKey:@"REUISummaryImageProviderKey"];
}

- (id)circularTempate
{
  v1 = [a1 objectForKey:@"REUICircularTemplateKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)setCircularTempate:()REUIAdditions
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a1 setObject:v4 forKey:@"REUICircularTemplateKey"];
  }
}

- (id)gaugeProvider
{
  v1 = [a1 objectForKey:@"REUIGaugeProviderKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)setGaugeProvider:()REUIAdditions
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a1 setObject:v4 forKey:@"REUIGaugeProviderKey"];
  }
}

@end
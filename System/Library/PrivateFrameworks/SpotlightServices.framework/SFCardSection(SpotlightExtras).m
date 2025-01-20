@interface SFCardSection(SpotlightExtras)
- (id)spotlightBackingResult;
- (void)setSpotlightBackingResult:()SpotlightExtras;
@end

@implementation SFCardSection(SpotlightExtras)

- (id)spotlightBackingResult
{
  return objc_getAssociatedObject(a1, &spotlightBackingResultKey);
}

- (void)setSpotlightBackingResult:()SpotlightExtras
{
  id v4 = a3;
  id value = (id)[objc_alloc((Class)objc_opt_class()) initWithResult:v4];

  [value setCard:0];
  [value setInlineCard:0];
  [value setCompactCard:0];
  objc_setAssociatedObject(a1, &spotlightBackingResultKey, value, (void *)1);
}

@end
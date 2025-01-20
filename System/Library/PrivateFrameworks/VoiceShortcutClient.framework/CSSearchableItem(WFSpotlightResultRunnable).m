@interface CSSearchableItem(WFSpotlightResultRunnable)
- (id)wf_shortcutsRunnableData;
@end

@implementation CSSearchableItem(WFSpotlightResultRunnable)

- (id)wf_shortcutsRunnableData
{
  v1 = [a1 attributeSet];
  v2 = WFSpotlightResultRunnableAttributeKey();
  v3 = [v1 valueForCustomKey:v2];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

@end
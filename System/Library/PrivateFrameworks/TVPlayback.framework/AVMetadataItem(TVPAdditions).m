@interface AVMetadataItem(TVPAdditions)
- (id)tvp_numberValue;
@end

@implementation AVMetadataItem(TVPAdditions)

- (id)tvp_numberValue
{
  v1 = [a1 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
LABEL_5:
    v4 = v2;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = NSNumber;
    [v1 doubleValue];
    objc_msgSend(v3, "numberWithDouble:");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

@end
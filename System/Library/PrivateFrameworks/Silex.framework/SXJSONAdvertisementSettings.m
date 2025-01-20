@interface SXJSONAdvertisementSettings
+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4;
- (unint64_t)bannerTypeWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXJSONAdvertisementSettings

- (unint64_t)bannerTypeWithValue:(id)a3 withType:(int)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEqualToString:@"any"])
    {
      unint64_t v5 = 1;
    }
    else if ([v4 isEqualToString:@"standard"])
    {
      unint64_t v5 = 2;
    }
    else if ([v4 isEqualToString:@"double_height"])
    {
      unint64_t v5 = 3;
    }
    else if ([v4 isEqualToString:@"large"])
    {
      unint64_t v5 = 4;
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  if (v5 <= 1) {
    unint64_t v5 = 1;
  }

  return v5;
}

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"layout"])
  {
    uint64_t v8 = objc_opt_class();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXJSONAdvertisementSettings;
    uint64_t v8 = objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
  }
  v9 = (void *)v8;

  return (Class)v9;
}

@end
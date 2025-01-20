@interface FBSSceneSettings(PaperBoard)
- (uint64_t)pb_activeVariant;
- (uint64_t)pb_animationSuspended;
- (uint64_t)pb_significantEventsCounter;
@end

@implementation FBSSceneSettings(PaperBoard)

- (uint64_t)pb_activeVariant
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:303000];

  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 integerValue];
  return v7;
}

- (uint64_t)pb_significantEventsCounter
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20489];

  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 unsignedIntegerValue];
  return v7;
}

- (uint64_t)pb_animationSuspended
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:303001];

  return v2;
}

@end
@interface FBSSceneClientSettings(PosterBoardUI)
- (double)pruis_primaryPosterOffset;
- (double)pruis_primaryPosterScale;
- (uint64_t)pruis_switcherContextID;
- (uint64_t)pruis_switcherLayoutMode;
@end

@implementation FBSSceneClientSettings(PosterBoardUI)

- (uint64_t)pruis_switcherLayoutMode
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:25612];

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

- (uint64_t)pruis_switcherContextID
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:25613];

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

  uint64_t v7 = [v6 unsignedLongLongValue];
  return v7;
}

- (double)pruis_primaryPosterScale
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:25614];

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

  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (double)pruis_primaryPosterOffset
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:25615];

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

  [v6 CGPointValue];
  double v8 = v7;

  return v8;
}

@end
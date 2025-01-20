@interface SPUISearchViewSceneSettings
- (double)revealProgress;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (unint64_t)presentationIntent;
- (unint64_t)presentationSource;
@end

@implementation SPUISearchViewSceneSettings

- (double)revealProgress
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1000];

  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

- (unint64_t)presentationSource
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1002];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = [v3 integerValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)presentationIntent
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1003];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = [v3 integerValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [SPUIMutableSearchViewSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  switch(a3)
  {
    case 0x3E8uLL:
      double v5 = @"revealProgress";
      break;
    case 0x3EBuLL:
      double v5 = @"deactivationReasons";
      break;
    case 0x3EAuLL:
      double v5 = @"presentationSource";
      break;
    default:
      uint64_t v8 = v3;
      uint64_t v9 = v4;
      v7.receiver = self;
      v7.super_class = (Class)SPUISearchViewSceneSettings;
      -[SPUILegibilitySceneSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
      double v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v5;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  if (a5 - 1000 > 3 || a5 == 1001)
  {
    v13.receiver = self;
    v13.super_class = (Class)SPUISearchViewSceneSettings;
    uint64_t v10 = [(SPUILegibilitySceneSettings *)&v13 valueDescriptionForFlag:a3 object:v8 ofSetting:a5];
  }
  else
  {
    uint64_t v10 = SPUISearchViewSceneSettingValueDescription(a5, v8);
  }
  v11 = (void *)v10;

  return v11;
}

@end
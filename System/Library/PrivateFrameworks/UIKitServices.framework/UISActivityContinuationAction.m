@interface UISActivityContinuationAction
+ (void)buildWithUserActivity:(id)a3 completion:(id)a4;
- (BOOL)isKindOfClass:(Class)a3;
- (NSData)userActivityData;
- (NSDate)lastUpdateTime;
- (NSString)activityType;
- (NSString)activityTypeIdentifier;
- (NSString)identifier;
- (NSString)originatingDeviceName;
- (NSString)originatingDeviceType;
- (UISActivityContinuationAction)initWithSettings:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
@end

@implementation UISActivityContinuationAction

+ (void)buildWithUserActivity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 activityType];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__UISActivityContinuationAction_buildWithUserActivity_completion___block_invoke;
  v11[3] = &unk_1E57353A0;
  id v13 = v6;
  id v14 = a1;
  id v12 = v8;
  id v9 = v8;
  id v10 = v6;
  [v7 _createUserActivityDataWithOptions:MEMORY[0x1E4F1CC08] completionHandler:v11];
}

void __66__UISActivityContinuationAction_buildWithUserActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5)
    {
      id v7 = objc_alloc(*(Class *)(a1 + 48));
      v12[0] = &unk_1EE295580;
      v12[1] = &unk_1EE295598;
      uint64_t v8 = *(void *)(a1 + 32);
      v13[0] = v5;
      v13[1] = v8;
      v12[2] = &unk_1EE2955B0;
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      v13[2] = v9;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
      v11 = (void *)[v7 initWithSettings:v10];
    }
    else
    {
      v11 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (UISActivityContinuationAction)initWithSettings:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"UISActivityContinuationAction.m", 45, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F62860]);
  id v7 = [v5 objectForKey:&unk_1EE2955C8];
  [v6 setObject:v7 forSetting:1];

  uint64_t v8 = [v5 objectForKey:&unk_1EE2955E0];
  [v6 setObject:v8 forSetting:2];

  id v9 = [v5 objectForKey:&unk_1EE2955F8];
  [v6 setObject:v9 forSetting:3];

  id v10 = [v5 objectForKey:&unk_1EE295610];
  [v6 setObject:v10 forSetting:4];

  v11 = [v5 objectForKey:&unk_1EE295598];
  [v6 setObject:v11 forSetting:5];

  id v12 = [v5 objectForKey:&unk_1EE2955B0];
  [v6 setObject:v12 forSetting:6];

  id v13 = [v5 objectForKey:&unk_1EE295580];
  [v6 setObject:v13 forSetting:7];

  v17.receiver = self;
  v17.super_class = (Class)UISActivityContinuationAction;
  id v14 = [(UISActivityContinuationAction *)&v17 initWithInfo:v6 responder:0];

  return v14;
}

- (NSString)identifier
{
  v2 = [(UISActivityContinuationAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (NSString *)v3;
}

- (NSString)activityTypeIdentifier
{
  v2 = [(UISActivityContinuationAction *)self info];
  v3 = [v2 objectForSetting:2];

  return (NSString *)v3;
}

- (NSString)originatingDeviceType
{
  v2 = [(UISActivityContinuationAction *)self info];
  v3 = [v2 objectForSetting:3];

  return (NSString *)v3;
}

- (NSString)originatingDeviceName
{
  v2 = [(UISActivityContinuationAction *)self info];
  v3 = [v2 objectForSetting:4];

  return (NSString *)v3;
}

- (NSString)activityType
{
  v2 = [(UISActivityContinuationAction *)self info];
  v3 = [v2 objectForSetting:5];

  return (NSString *)v3;
}

- (NSDate)lastUpdateTime
{
  v2 = [(UISActivityContinuationAction *)self info];
  v3 = [v2 objectForSetting:6];

  return (NSDate *)v3;
}

- (NSData)userActivityData
{
  v2 = [(UISActivityContinuationAction *)self info];
  v3 = [v2 objectForSetting:7];

  return (NSData *)v3;
}

- (int64_t)UIActionType
{
  return 6;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return 0;
  }
  else {
    return off_1E57353C0[a3 - 1];
  }
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISActivityContinuationAction;
  if (-[UISActivityContinuationAction isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  }
}

@end
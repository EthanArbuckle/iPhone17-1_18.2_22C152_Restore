@interface SBSUIInCallDestroySceneAction
- (NSString)analyticsSource;
- (SBSUIInCallDestroySceneAction)initWithDestructionReason:(int64_t)a3 analyticsSource:(id)a4 timeout:(double)a5 withResponseHandler:(id)a6;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)destructionReason;
@end

@implementation SBSUIInCallDestroySceneAction

- (SBSUIInCallDestroySceneAction)initWithDestructionReason:(int64_t)a3 analyticsSource:(id)a4 timeout:(double)a5 withResponseHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v13 = [NSNumber numberWithInteger:a3];
  [v12 setObject:v13 forSetting:1];

  if (v10) {
    [v12 setObject:v10 forSetting:2];
  }
  v16.receiver = self;
  v16.super_class = (Class)SBSUIInCallDestroySceneAction;
  v14 = [(SBSUIInCallDestroySceneAction *)&v16 initWithInfo:v12 timeout:MEMORY[0x1E4F14428] forResponseOnQueue:v11 withHandler:a5];

  return v14;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  v3 = @"analyticsSource";
  if (a3 != 2) {
    v3 = 0;
  }
  if (a3 == 1) {
    return @"destructionReason";
  }
  else {
    return v3;
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6 = a4;
  v7 = v6;
  if (a5 == 2)
  {
    id v8 = v6;
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    SBSUIInCallWindowSceneSessionDestructionReasonDescription([v6 integerValue]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (NSString)analyticsSource
{
  v2 = [(SBSUIInCallDestroySceneAction *)self info];
  v3 = [v2 objectForSetting:2];

  return (NSString *)v3;
}

- (int64_t)destructionReason
{
  v2 = [(SBSUIInCallDestroySceneAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

@end
@interface SBSUIInCallRequestPresentationModeAction
- (BOOL)isUserInitiated;
- (NSString)analyticsSource;
- (SBSUIInCallRequestPresentationModeAction)initWithRequestedPresentationMode:(int64_t)a3 isUserInitiated:(BOOL)a4 analyticsSource:(id)a5 responseHandler:(id)a6;
- (int64_t)requestedPresentationMode;
- (void)sendCompletionResponseWithSuccess:(BOOL)a3;
@end

@implementation SBSUIInCallRequestPresentationModeAction

- (SBSUIInCallRequestPresentationModeAction)initWithRequestedPresentationMode:(int64_t)a3 isUserInitiated:(BOOL)a4 analyticsSource:(id)a5 responseHandler:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v12 = [NSNumber numberWithInteger:a3];
  [v11 setObject:v12 forSetting:1];

  [v11 setFlag:BSSettingFlagForBool() forSetting:2];
  if (v9) {
    [v11 setObject:v9 forSetting:3];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __126__SBSUIInCallRequestPresentationModeAction_initWithRequestedPresentationMode_isUserInitiated_analyticsSource_responseHandler___block_invoke;
  v17[3] = &unk_1E5CCCED8;
  id v18 = v10;
  v16.receiver = self;
  v16.super_class = (Class)SBSUIInCallRequestPresentationModeAction;
  id v13 = v10;
  v14 = [(SBSUIInCallRequestPresentationModeAction *)&v16 initWithInfo:v11 timeout:MEMORY[0x1E4F14428] forResponseOnQueue:v17 withHandler:2.0];

  return v14;
}

void __126__SBSUIInCallRequestPresentationModeAction_initWithRequestedPresentationMode_isUserInitiated_analyticsSource_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 error];
  (*(void (**)(uint64_t, BOOL))(v2 + 16))(v2, v3 == 0);
}

- (void)sendCompletionResponseWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBSUIInCallRequestPresentationModeAction *)self canSendResponse])
  {
    if (v3)
    {
      v5 = [MEMORY[0x1E4F4F678] response];
      v8.receiver = self;
      v8.super_class = (Class)SBSUIInCallRequestPresentationModeAction;
      [(SBSUIInCallRequestPresentationModeAction *)&v8 sendResponse:v5];
    }
    else
    {
      v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBSUIInCallErrorDomain" code:-1003 userInfo:0];
      v6 = [MEMORY[0x1E4F4F678] responseForError:v5];
      v7.receiver = self;
      v7.super_class = (Class)SBSUIInCallRequestPresentationModeAction;
      [(SBSUIInCallRequestPresentationModeAction *)&v7 sendResponse:v6];
    }
  }
}

- (NSString)analyticsSource
{
  uint64_t v2 = [(SBSUIInCallRequestPresentationModeAction *)self info];
  BOOL v3 = [v2 objectForSetting:3];

  return (NSString *)v3;
}

- (int64_t)requestedPresentationMode
{
  uint64_t v2 = [(SBSUIInCallRequestPresentationModeAction *)self info];
  BOOL v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)isUserInitiated
{
  uint64_t v2 = [(SBSUIInCallRequestPresentationModeAction *)self info];
  char v3 = [v2 BOOLForSetting:2];

  return v3;
}

@end
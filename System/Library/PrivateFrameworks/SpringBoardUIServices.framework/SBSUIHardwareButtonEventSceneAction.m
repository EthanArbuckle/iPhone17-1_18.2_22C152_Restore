@interface SBSUIHardwareButtonEventSceneAction
- (SBSUIHardwareButtonEventSceneAction)initWithButtonEventType:(int64_t)a3 timeout:(double)a4 withResponseHandler:(id)a5;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)buttonEventType;
- (void)sendResponse:(id)a3;
@end

@implementation SBSUIHardwareButtonEventSceneAction

- (SBSUIHardwareButtonEventSceneAction)initWithButtonEventType:(int64_t)a3 timeout:(double)a4 withResponseHandler:(id)a5
{
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v10 = [NSNumber numberWithInteger:a3];
  [v9 setObject:v10 forSetting:1];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__SBSUIHardwareButtonEventSceneAction_initWithButtonEventType_timeout_withResponseHandler___block_invoke;
  v15[3] = &unk_1E5CCCED8;
  id v16 = v8;
  v14.receiver = self;
  v14.super_class = (Class)SBSUIHardwareButtonEventSceneAction;
  id v11 = v8;
  v12 = [(SBSUIHardwareButtonEventSceneAction *)&v14 initWithInfo:v9 timeout:MEMORY[0x1E4F14428] forResponseOnQueue:v15 withHandler:a4];

  return v12;
}

void __91__SBSUIHardwareButtonEventSceneAction_initWithButtonEventType_timeout_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = v6;
    if ((isKindOfClass & 1) == 0) {
      id v5 = 0;
    }
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)sendResponse:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSUIHardwareButtonEventSceneAction.m", 40, @"SBSUIHardwareButtonEventSceneActionResponse is the only supported response class.", v5);
  }
  v7.receiver = self;
  v7.super_class = (Class)SBSUIHardwareButtonEventSceneAction;
  [(SBSUIHardwareButtonEventSceneAction *)&v7 sendResponse:v5];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"buttonEventType";
  }
  else {
    return 0;
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 == 1)
  {
    objc_super v7 = SBSUIHardwareButtonEventTypeDescription(objc_msgSend(a4, "integerValue", a3, v5));
  }
  else
  {
    objc_super v7 = 0;
  }
  return v7;
}

- (int64_t)buttonEventType
{
  v2 = [(SBSUIHardwareButtonEventSceneAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

@end
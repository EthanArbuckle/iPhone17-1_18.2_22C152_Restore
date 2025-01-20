@interface UIDestroySceneAction
- (BOOL)destroySceneSession;
- (BOOL)isUserOriginatedRequest;
- (NSSet)persistedIdentifiers;
- (UIDestroySceneAction)initWithPersistedIdentifiers:(id)a3 preferredAnimationType:(unint64_t)a4 callbackQueue:(id)a5 completion:(id)a6;
- (UIDestroySceneAction)initWithPersistedIdentifiers:(id)a3 preferredAnimationType:(unint64_t)a4 forDestroyingSession:(BOOL)a5 callbackQueue:(id)a6 completion:(id)a7;
- (UIDestroySceneAction)initWithPersistedIdentifiers:(id)a3 preferredAnimationType:(unint64_t)a4 forDestroyingSession:(BOOL)a5 userOriginatedRequest:(BOOL)a6 callbackQueue:(id)a7 completion:(id)a8;
- (UIDestroySceneAction)initWithPreferredAnimationType:(unint64_t)a3 callbackQueue:(id)a4 completion:(id)a5;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
- (unint64_t)preferredAnimationType;
@end

@implementation UIDestroySceneAction

- (UIDestroySceneAction)initWithPreferredAnimationType:(unint64_t)a3 callbackQueue:(id)a4 completion:(id)a5
{
  return [(UIDestroySceneAction *)self initWithPersistedIdentifiers:0 preferredAnimationType:a3 forDestroyingSession:1 callbackQueue:a4 completion:a5];
}

- (UIDestroySceneAction)initWithPersistedIdentifiers:(id)a3 preferredAnimationType:(unint64_t)a4 callbackQueue:(id)a5 completion:(id)a6
{
  return [(UIDestroySceneAction *)self initWithPersistedIdentifiers:a3 preferredAnimationType:a4 forDestroyingSession:1 callbackQueue:a5 completion:a6];
}

- (UIDestroySceneAction)initWithPersistedIdentifiers:(id)a3 preferredAnimationType:(unint64_t)a4 forDestroyingSession:(BOOL)a5 callbackQueue:(id)a6 completion:(id)a7
{
  return [(UIDestroySceneAction *)self initWithPersistedIdentifiers:a3 preferredAnimationType:a4 forDestroyingSession:a5 userOriginatedRequest:0 callbackQueue:a6 completion:a7];
}

- (UIDestroySceneAction)initWithPersistedIdentifiers:(id)a3 preferredAnimationType:(unint64_t)a4 forDestroyingSession:(BOOL)a5 userOriginatedRequest:(BOOL)a6 callbackQueue:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a8;
  if (a4 - 4 <= 0xFFFFFFFFFFFFFFFCLL)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"UIDestroySceneAction.m" lineNumber:58 description:@"A valid animation type must be provided."];
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v17 = [NSNumber numberWithUnsignedInteger:a4];
  [v16 setObject:v17 forSetting:1];

  if (v13 && [v13 count]) {
    [v16 setObject:v13 forSetting:2];
  }
  [v16 setFlag:BSSettingFlagForBool() forSetting:3];
  [v16 setFlag:BSSettingFlagForBool() forSetting:4];
  v21.receiver = self;
  v21.super_class = (Class)UIDestroySceneAction;
  v18 = [(UIDestroySceneAction *)&v21 initWithInfo:v16 timeout:v14 forResponseOnQueue:v15 withHandler:5.0];

  return v18;
}

- (unint64_t)preferredAnimationType
{
  v2 = [(UIDestroySceneAction *)self info];
  v3 = [v2 objectForSetting:1];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = [v3 unsignedIntValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (NSSet)persistedIdentifiers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(UIDestroySceneAction *)self info];
  v3 = [v2 objectForSetting:2];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    unint64_t v4 = objc_msgSend(v3, "allObjects", 0, 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v9 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  id v9 = v3;
LABEL_13:

  return (NSSet *)v9;
}

- (BOOL)destroySceneSession
{
  v2 = [(UIDestroySceneAction *)self info];
  char v3 = [v2 BOOLForSetting:3];

  return v3;
}

- (BOOL)isUserOriginatedRequest
{
  v2 = [(UIDestroySceneAction *)self info];
  char v3 = [v2 BOOLForSetting:4];

  return v3;
}

- (int64_t)UIActionType
{
  return 35;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return off_1E52EDC88[a3 - 1];
  }
}

@end
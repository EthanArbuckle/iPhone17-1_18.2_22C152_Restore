@interface UISceneSession
+ (BOOL)supportsSecureCoding;
+ (id)canvasRepresentationForSystemType:(int64_t)a3;
+ (id)defaultCanvasRepresentation;
- (BOOL)_configurationIsDirty;
- (BOOL)_configurationNeedsReevalulation;
- (BOOL)_isInternal;
- (BOOL)_stateRestorationActivityIsDirty;
- (BOOL)_trackingRefreshRequest;
- (BOOL)_userInfoIsDirty;
- (BOOL)isEqual:(id)a3;
- (Class)canvasSubclass;
- (Class)delegateClass;
- (NSDictionary)userInfo;
- (NSString)debugDescription;
- (NSString)persistentIdentifier;
- (NSUserActivity)stateRestorationActivity;
- (UIScene)scene;
- (UISceneConfiguration)configuration;
- (UISceneSession)initWithCoder:(id)a3;
- (UISceneSessionRole)role;
- (id)_copyWithoutUserInfo;
- (id)_init;
- (id)_initWithPersistentIdentifier:(id)a3 sessionRole:(id)a4 configurationName:(id)a5;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)systemType;
- (unint64_t)hash;
- (void)_clearAllDirtyFlags;
- (void)_loadStateRestorationActivityIfNeeded;
- (void)_loadUserInfo;
- (void)_resetStateRestorationToActivity:(id)a3;
- (void)_setConfigurationIsDirty:(BOOL)a3;
- (void)_setScene:(id)a3;
- (void)_setStateRestorationActivityIsDirty:(BOOL)a3;
- (void)_setTrackingRefreshRequest:(BOOL)a3;
- (void)_setUserInfoIsDirty:(BOOL)a3;
- (void)_updateConfiguration:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setStateRestorationActivity:(NSUserActivity *)stateRestorationActivity;
- (void)setUserInfo:(NSDictionary *)userInfo;
@end

@implementation UISceneSession

- (void)_updateConfiguration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(UISceneConfiguration *)self->_configuration isEqual:v4])
  {
    v5 = [v4 role];
    char v6 = [v5 isEqualToString:self->_role];

    if (v6)
    {
LABEL_3:
      v7 = [[UISceneConfiguration alloc] _initWithConfiguration:v4];
      configuration = self->_configuration;
      self->_configuration = v7;

      *(unsigned char *)&self->_sessionFlags |= 0x10u;
      goto LABEL_4;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v10 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        goto LABEL_9;
      }
      v11 = [v4 role];
      v12 = [(UISceneSession *)self role];
      int v13 = 138412546;
      v14 = v11;
      __int16 v15 = 2112;
      v16 = v12;
      _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: Attempting to define a mismatched UISceneSessionRole! This will be an assert in future UIKit releases! Assigning a UISceneConfiguration with role \"%@\" for a UISceneSession with role \"%@\".", (uint8_t *)&v13, 0x16u);
    }
    else
    {
      v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateConfiguration____s_category) + 8);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_3;
      }
      v10 = v9;
      v11 = [v4 role];
      v12 = [(UISceneSession *)self role];
      int v13 = 138412546;
      v14 = v11;
      __int16 v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Attempting to define a mismatched UISceneSessionRole! This will be an assert in future UIKit releases! Assigning a UISceneConfiguration with role \"%@\" for a UISceneSession with role \"%@\".", (uint8_t *)&v13, 0x16u);
    }

LABEL_9:
    goto LABEL_3;
  }
LABEL_4:
}

- (unint64_t)hash
{
  persistentIdentifier = self->_persistentIdentifier;
  if (persistentIdentifier) {
    return [(NSString *)persistentIdentifier hash] + 113569;
  }
  else {
    return 337;
  }
}

- (UISceneSessionRole)role
{
  return self->_role;
}

- (BOOL)_isInternal
{
  return (*(unsigned char *)&self->_sessionFlags >> 6) & 1;
}

- (UISceneConfiguration)configuration
{
  v2 = (void *)[(UISceneConfiguration *)self->_configuration copy];
  return (UISceneConfiguration *)v2;
}

- (void)_setScene:(id)a3
{
  char sessionFlags = (char)self->_sessionFlags;
  id v6 = objc_storeWeak((id *)&self->_scene, a3);
  id v7 = a3;
  if (a3)
  {
    if ((sessionFlags & 0x40) != 0)
    {
      char v8 = [a3 _isInternal];
      id v7 = a3;
      if ((v8 & 1) == 0)
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, self, @"UISceneSession.m", 694, @"Internal session given a non-internal scene: self: %@, scene:", self, a3 object file lineNumber description];

        id v7 = a3;
      }
    }
    int v9 = [v7 _isInternal];
    id v7 = a3;
    if (v9) {
      char v10 = 64;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)&self->_char sessionFlags = *(unsigned char *)&self->_sessionFlags & 0xBF | v10;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([(id)UIApp _appAdoptsUISceneLifecycle] & 1) != 0
    || [(id)UIApp _appAdoptsUICanvasLifecycle])
  {
    [v4 encodeObject:self->_configuration forKey:@"_UISceneSessionSceneConfiguration"];
  }
  [v4 encodeObject:self->_role forKey:@"_UISceneSessionRole"];
  [v4 encodeObject:self->_persistentIdentifier forKey:@"_UISceneSessionPersistentIdentifier"];
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_role withName:@"role"];
  [v3 appendString:self->_persistentIdentifier withName:@"persistentIdentifier"];
  id v4 = objc_loadWeakRetained((id *)&self->_scene);
  if (v4)
  {
    v5 = NSString;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    char v8 = [v5 stringWithFormat:@"<%@: %p>", v7, v4];
  }
  else
  {
    char v8 = @"(nil)";
  }

  id v9 = (id)[v3 appendObject:v8 withName:@"scene"];
  configuration = self->_configuration;
  if (configuration)
  {
    v11 = NSString;
    v12 = configuration;
    int v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    __int16 v15 = [v11 stringWithFormat:@"<%@: %p>", v14, v12];
  }
  else
  {
    __int16 v15 = @"(nil)";
  }
  id v16 = (id)[v3 appendObject:v15 withName:@"configuration"];

  userInfo = self->_userInfo;
  if (userInfo)
  {
    v18 = NSString;
    v19 = userInfo;
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    v22 = [v18 stringWithFormat:@"<%@: %p>", v21, v19];
  }
  else
  {
    v22 = @"(nil)";
  }
  id v23 = (id)[v3 appendObject:v22 withName:@"userInfo"];

  return v3;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (id)_copyWithoutUserInfo
{
  v3 = [[UISceneSession alloc] _init];
  objc_storeStrong(v3 + 3, self->_persistentIdentifier);
  objc_storeStrong(v3 + 2, self->_role);
  objc_storeStrong(v3 + 4, self->_configuration);
  id v4 = v3[6];
  v3[6] = (id)MEMORY[0x1E4F1CC08];

  return v3;
}

- (NSUserActivity)stateRestorationActivity
{
  [(UISceneSession *)self _loadStateRestorationActivityIfNeeded];
  stateRestorationActivity = self->_stateRestorationActivity;
  return stateRestorationActivity;
}

- (void)_loadStateRestorationActivityIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_sessionFlags & 4) == 0)
  {
    v3 = [(UISceneSession *)self persistentIdentifier];
    BOOL v4 = +[_UICanvasUserActivityManager _restorationUserActivityAvailableForSceneIdentifier:v3];

    if (v4)
    {
      v5 = [(UISceneSession *)self persistentIdentifier];
      id v11 = 0;
      id v6 = +[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:v5 error:&v11];
      id v7 = v11;
      stateRestorationActivity = self->_stateRestorationActivity;
      self->_stateRestorationActivity = v6;

      if (v7)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("SceneSession", &_loadStateRestorationActivityIfNeeded___s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          char v10 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v13 = v7;
            _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "failed to load state restoration activity: %{public}@", buf, 0xCu);
          }
        }
      }
      else
      {
        *(unsigned char *)&self->_char sessionFlags = *(unsigned char *)&self->_sessionFlags & 0xF9 | 4;
      }
    }
  }
}

- (BOOL)_userInfoIsDirty
{
  return (*(unsigned char *)&self->_sessionFlags >> 5) & 1;
}

- (BOOL)_configurationIsDirty
{
  return (*(unsigned char *)&self->_sessionFlags >> 4) & 1;
}

- (void)_setConfigurationIsDirty:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char sessionFlags = *(unsigned char *)&self->_sessionFlags & 0xEF | v3;
}

- (void)_setStateRestorationActivityIsDirty:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char sessionFlags = *(unsigned char *)&self->_sessionFlags & 0xFD | v3;
}

- (void)_resetStateRestorationToActivity:(id)a3
{
  *(unsigned char *)&self->_char sessionFlags = *(unsigned char *)&self->_sessionFlags & 0xFB | (4 * (a3 != 0));
  objc_storeStrong((id *)&self->_stateRestorationActivity, a3);
}

- (UISceneSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UISceneSession *)self _init];
  if (v5)
  {
    id v6 = self;
    id v7 = [v4 decodeObjectOfClass:v6 forKey:@"_UICDPersistentIdentifierEncoderKey"];

    if (v7)
    {
      objc_storeStrong((id *)&v5->_persistentIdentifier, v7);
      uint64_t v8 = _UICanvasFrameSystemTypeFromCanvasType([v4 decodeIntegerForKey:@"_UICDSystemTypeEncoderKey"]);
      role = v5->_role;
      v5->_role = (NSString *)v8;

      char v10 = [[UISceneConfiguration alloc] _initWithLoadErrorForSessionRole:v5->_role];
      configuration = v5->_configuration;
      v5->_configuration = v10;
    }
    else
    {
      v12 = self;
      uint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"_UISceneSessionRole"];
      uint64_t v14 = v5->_role;
      v5->_role = (NSString *)v13;

      if (([(id)UIApp _appAdoptsUICanvasLifecycle] & 1) != 0
        || [(id)UIApp _appAdoptsUISceneLifecycle])
      {
        __int16 v15 = self;
        id v16 = [v4 decodeObjectOfClass:v15 forKey:@"_UISceneSessionSceneConfiguration"];
        uint64_t v17 = v16;
        if (v16) {
          v18 = v16;
        }
        else {
          v18 = [[UISceneConfiguration alloc] _initWithLoadErrorForSessionRole:v5->_role];
        }
        v19 = v5->_configuration;
        v5->_configuration = v18;
      }
      else
      {
        uint64_t v20 = +[UISceneConfiguration configurationWithName:0 sessionRole:v5->_role];
        __int16 v15 = v5->_configuration;
        v5->_configuration = (UISceneConfiguration *)v20;
      }

      configuration = self;
      uint64_t v21 = [v4 decodeObjectOfClass:configuration forKey:@"_UISceneSessionPersistentIdentifier"];
      persistentIdentifier = v5->_persistentIdentifier;
      v5->_persistentIdentifier = (NSString *)v21;
    }
    *(unsigned char *)&v5->_sessionFlags &= 0xFAu;
  }
  return v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)UISceneSession;
  return [(UISceneSession *)&v3 init];
}

- (id)_initWithPersistentIdentifier:(id)a3 sessionRole:(id)a4 configurationName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)UISceneSession;
  v12 = [(UISceneSession *)&v18 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_persistentIdentifier, a3);
    objc_storeStrong((id *)&v13->_role, a4);
    userInfo = v13->_userInfo;
    v13->_userInfo = (NSDictionary *)MEMORY[0x1E4F1CC08];

    uint64_t v15 = +[UISceneConfiguration configurationWithName:v11 sessionRole:v10];
    configuration = v13->_configuration;
    v13->_configuration = (UISceneConfiguration *)v15;

    *(unsigned char *)&v13->_char sessionFlags = *(unsigned char *)&v13->_sessionFlags & 0xAA | 0x15;
  }

  return v13;
}

- (UIScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (BOOL)_configurationNeedsReevalulation
{
  return [(UISceneConfiguration *)self->_configuration _hadResolutionErrorsOnLoad];
}

- (NSDictionary)userInfo
{
  [(UISceneSession *)self _loadUserInfo];
  objc_super v3 = (void *)[(NSDictionary *)self->_userInfo copy];
  return (NSDictionary *)v3;
}

- (void)_loadUserInfo
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_sessionFlags & 1) == 0)
  {
    objc_super v3 = [(UISceneSession *)self persistentIdentifier];
    id v9 = 0;
    id v4 = +[_UICanvasUserActivityManager _getUserInfoForPersistentIdentifier:v3 error:&v9];
    id v5 = v9;
    userInfo = self->_userInfo;
    self->_userInfo = v4;

    if (v5)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("SceneSession", &_loadUserInfo___s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v8 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v11 = v5;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "failed to load state user info: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      *(unsigned char *)&self->_sessionFlags |= 1u;
    }
  }
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  id v6 = userInfo;
  if (!-[NSDictionary isEqualToDictionary:](self->_userInfo, "isEqualToDictionary:"))
  {
    [MEMORY[0x1E4F28F98] propertyList:v6 isValidForFormat:100];
    id v4 = (NSDictionary *)[(NSDictionary *)v6 copy];
    id v5 = self->_userInfo;
    self->_userInfo = v4;

    [(UISceneSession *)self _setUserInfoIsDirty:1];
    +[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:self saveRestorationActivity:0];
  }
}

- (void)_setUserInfoIsDirty:(BOOL)a3
{
  if (a3) {
    char v3 = 33;
  }
  else {
    char v3 = 1;
  }
  *(unsigned char *)&self->_char sessionFlags = *(unsigned char *)&self->_sessionFlags & 0xDF | v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_stateRestorationActivity, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_destroyWeak((id *)&self->_scene);
}

- (id)succinctDescription
{
  v2 = [(UISceneSession *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

- (void)setStateRestorationActivity:(NSUserActivity *)stateRestorationActivity
{
  objc_storeStrong((id *)&self->_stateRestorationActivity, stateRestorationActivity);
  id v5 = stateRestorationActivity;
  *(unsigned char *)&self->_sessionFlags |= 6u;
  +[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:self saveRestorationActivity:1];
}

- (NSString)debugDescription
{
  return (NSString *)[(UISceneSession *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(UISceneSession *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(UISceneSession *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  char has_internal_diagnostics = os_variant_has_internal_diagnostics();
  id v6 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v6 setActiveMultilinePrefix:v4];

  [v6 appendString:self->_role withName:@"role"];
  [v6 appendString:self->_persistentIdentifier withName:@"persistentIdentifier"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__UISceneSession_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E52DC3D0;
  id v7 = v6;
  char v14 = has_internal_diagnostics;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = (id)[v7 modifyBody:v11];
  id v9 = v7;

  return v9;
}

void __56__UISceneSession_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  char v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__UISceneSession_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52DC3D0;
  char v9 = *(unsigned char *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

uint64_t __56__UISceneSession_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    char v3 = [v2 activeMultilinePrefix];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__UISceneSession_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v15[3] = &unk_1E52D9F98;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v16 = v4;
    uint64_t v17 = v5;
    [v2 appendBodySectionWithName:@"sessionFlags" multilinePrefix:v3 block:v15];
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  if (v7)
  {
    uint64_t v8 = NSString;
    char v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    id v11 = [v8 stringWithFormat:@"<%@: %p>", v10, v7];
  }
  else
  {
    id v11 = @"(nil)";
  }

  id v12 = (id)[v6 appendObject:v11 withName:@"scene"];
  id v13 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"configuration"];
  return [*(id *)(a1 + 32) appendDictionarySection:*(void *)(*(void *)(a1 + 40) + 48) withName:@"userInfo" skipIfEmpty:1];
}

id __56__UISceneSession_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 56) >> 6) & 1 withName:@"isInternal"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UISceneSession *)a3;
  if (v4 == self) {
    goto LABEL_8;
  }
  uint64_t v5 = objc_opt_class();
  if (![v5 isEqual:objc_opt_class()]) {
    goto LABEL_7;
  }
  unint64_t v6 = [(UISceneSession *)self hash];
  if (v6 != [(UISceneSession *)v4 hash]) {
    goto LABEL_7;
  }
  persistentIdentifier = self->_persistentIdentifier;
  if (persistentIdentifier == v4->_persistentIdentifier)
  {
LABEL_8:
    char v8 = 1;
    goto LABEL_9;
  }
  if (!persistentIdentifier)
  {
LABEL_7:
    char v8 = 0;
    goto LABEL_9;
  }
  char v8 = -[NSString isEqualToString:](persistentIdentifier, "isEqualToString:");
LABEL_9:

  return v8;
}

- (BOOL)_trackingRefreshRequest
{
  return (*(unsigned char *)&self->_sessionFlags >> 3) & 1;
}

- (void)_setTrackingRefreshRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char sessionFlags = *(unsigned char *)&self->_sessionFlags & 0xF7 | v3;
}

- (BOOL)_stateRestorationActivityIsDirty
{
  return (*(unsigned char *)&self->_sessionFlags >> 1) & 1;
}

- (void)_clearAllDirtyFlags
{
  *(unsigned char *)&self->_sessionFlags &= 0xCDu;
}

+ (id)defaultCanvasRepresentation
{
  v2 = objc_alloc_init(_UICanvasDefinition);
  return v2;
}

+ (id)canvasRepresentationForSystemType:(int64_t)a3
{
  char v3 = _UICanvasFrameSystemTypeFromCanvasType(a3);
  id v4 = [[UISceneSession alloc] _initWithPersistentIdentifier:&stru_1ED0E84C0 sessionRole:v3 configurationName:0];

  return v4;
}

- (int64_t)systemType
{
  v2 = [(UISceneSession *)self role];
  int64_t v3 = _UICanvasCanvasSystemTypeFromFrameType(v2);

  return v3;
}

- (Class)canvasSubclass
{
  v2 = [(UISceneSession *)self configuration];
  int64_t v3 = [v2 sceneClass];

  return (Class)v3;
}

- (Class)delegateClass
{
  v2 = [(UISceneSession *)self configuration];
  int64_t v3 = [v2 delegateClass];

  return (Class)v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[_UIMutableCanvasDefinition allocWithZone:a3];
  return [(_UIMutableCanvasDefinition *)v4 initWithRepresentation:self];
}

@end
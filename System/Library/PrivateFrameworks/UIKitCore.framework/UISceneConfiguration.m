@interface UISceneConfiguration
+ (BOOL)supportsSecureCoding;
+ (UISceneConfiguration)configurationWithName:(NSString *)name sessionRole:(UISceneSessionRole)sessionRole;
- (BOOL)_fromPlist;
- (BOOL)_hadResolutionErrorsOnLoad;
- (BOOL)_isDefault;
- (BOOL)isEqual:(id)a3;
- (Class)delegateClass;
- (Class)sceneClass;
- (NSString)debugDescription;
- (NSString)name;
- (UISceneConfiguration)init;
- (UISceneConfiguration)initWithCoder:(id)a3;
- (UISceneConfiguration)initWithName:(NSString *)name sessionRole:(UISceneSessionRole)sessionRole;
- (UISceneSessionRole)role;
- (UIStoryboard)storyboard;
- (id)_initWithConfiguration:(id)a3;
- (id)_initWithLoadErrorForSessionRole:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegateClass:(Class)delegateClass;
- (void)setSceneClass:(Class)sceneClass;
- (void)setStoryboard:(UIStoryboard *)storyboard;
@end

@implementation UISceneConfiguration

- (UISceneSessionRole)role
{
  return self->_role;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UISceneConfiguration *)a3;
  if (v4 == self) {
    goto LABEL_20;
  }
  v5 = objc_opt_class();
  if (![v5 isEqual:objc_opt_class()]) {
    goto LABEL_19;
  }
  unint64_t v6 = [(UISceneConfiguration *)self hash];
  if (v6 != [(UISceneConfiguration *)v4 hash]) {
    goto LABEL_19;
  }
  role = self->_role;
  if (role != v4->_role && (!role || !-[NSString isEqualToString:](role, "isEqualToString:"))) {
    goto LABEL_19;
  }
  name = self->_name;
  if (name != v4->_name && (!name || !-[NSString isEqualToString:](name, "isEqualToString:"))) {
    goto LABEL_19;
  }
  Class sceneClass = self->_sceneClass;
  if (sceneClass != v4->_sceneClass && (!sceneClass || !-[objc_class isEqual:](sceneClass, "isEqual:"))) {
    goto LABEL_19;
  }
  Class delegateClass = self->_delegateClass;
  if (delegateClass != v4->_delegateClass
    && (!delegateClass || !-[objc_class isEqual:](delegateClass, "isEqual:")))
  {
    goto LABEL_19;
  }
  storyboard = self->_storyboard;
  if (storyboard == v4->_storyboard)
  {
LABEL_20:
    char v12 = 1;
    goto LABEL_21;
  }
  if (!storyboard)
  {
LABEL_19:
    char v12 = 0;
    goto LABEL_21;
  }
  char v12 = -[UIStoryboard isEqual:](storyboard, "isEqual:");
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  role = self->_role;
  if (role) {
    unint64_t v4 = [(NSString *)role hash] + 113569;
  }
  else {
    unint64_t v4 = 337;
  }
  name = self->_name;
  if (name) {
    unint64_t v4 = [(NSString *)name hash] + 337 * v4;
  }
  Class sceneClass = self->_sceneClass;
  if (sceneClass) {
    unint64_t v4 = [(objc_class *)sceneClass hash] + 337 * v4;
  }
  Class delegateClass = self->_delegateClass;
  if (delegateClass) {
    unint64_t v4 = [(objc_class *)delegateClass hash] + 337 * v4;
  }
  storyboard = self->_storyboard;
  if (storyboard) {
    return [(UIStoryboard *)storyboard hash] + 337 * v4;
  }
  return v4;
}

- (id)_initWithConfiguration:(id)a3
{
  unint64_t v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)UISceneConfiguration;
  v5 = [(UISceneConfiguration *)&v8 init];
  unint64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_name, v4[2]);
    v6->_hadResolutionErrorsOnLoad = 0;
    objc_storeStrong((id *)&v6->_role, v4[3]);
    v6->_Class sceneClass = (Class)v4[4];
    v6->_Class delegateClass = (Class)v4[5];
    objc_storeStrong((id *)&v6->_storyboard, v4[6]);
    v6->_isDefault = *((unsigned char *)v4 + 9);
    v6->_fromPlist = *((unsigned char *)v4 + 10);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[UISceneConfiguration allocWithZone:a3];
  return [(UISceneConfiguration *)v4 _initWithConfiguration:self];
}

- (Class)sceneClass
{
  return self->_sceneClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_fromPlist
{
  return self->_fromPlist;
}

- (BOOL)_isDefault
{
  return self->_isDefault;
}

- (Class)delegateClass
{
  return self->_delegateClass;
}

- (BOOL)_hadResolutionErrorsOnLoad
{
  return self->_hadResolutionErrorsOnLoad;
}

- (UIStoryboard)storyboard
{
  return self->_storyboard;
}

- (UISceneConfiguration)initWithCoder:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  unint64_t v6 = [v4 decodeObjectOfClass:v5 forKey:@"_UISceneConfigurationName"];

  v7 = self;
  uint64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"_UISceneConfigurationSessionRole"];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = @"UISceneSessionRoleNone";
  }
  v11 = v10;

  if (!v6)
  {
    v13 = [(UISceneConfiguration *)self initWithName:0 sessionRole:v11];
    char v12 = v13;
    if (!v13) {
      goto LABEL_36;
    }
    if (v11 == @"UISceneSessionRoleNone") {
      v13->_hadResolutionErrorsOnLoad = 1;
    }
    v14 = self;
    v15 = [v4 decodeObjectOfClass:v14 forKey:@"_UISceneConfigurationSceneClassName"];

    Class v16 = NSClassFromString(v15);
    Class v17 = v16;
    if (!v15 || v16)
    {
      if (v15)
      {
        v20 = self;
        char v21 = [(objc_class *)v17 isSubclassOfClass:v20];

        if ((v21 & 1) == 0)
        {
          v12->_hadResolutionErrorsOnLoad = 1;
          v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneConfiguration", &qword_1EB25F1A0) + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v42 = v11;
            __int16 v43 = 2112;
            v44 = v15;
            v19 = "Encoded configuration for %@ contained a UIScene class named \"%@\", but it was not actually a subclass of UIScene!";
            goto LABEL_17;
          }
        }
      }
    }
    else
    {
      v12->_hadResolutionErrorsOnLoad = 1;
      v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneConfiguration", &qword_1EB25F198) + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v11;
        __int16 v43 = 2112;
        v44 = v15;
        v19 = "Encoded configuration for %@ contained a UIScene class named \"%@\", but no class with that name could be found.";
LABEL_17:
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0x16u);
      }
    }
    v22 = self;
    v23 = [v4 decodeObjectOfClass:v22 forKey:@"_UISceneConfigurationDelegateClassName"];

    Class v24 = NSClassFromString(v23);
    Class v25 = v24;
    v40 = v17;
    if (!v23 || v24)
    {
      if (!v23
        || ([(objc_class *)v24 conformsToProtocol:&unk_1ED6D0780] & 1) != 0
        || (v12->_hadResolutionErrorsOnLoad = 1,
            v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneConfiguration", &qword_1EB25F1B0) + 8),
            !os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)))
      {
LABEL_27:
        v39 = v15;
        v28 = v25;
        v29 = self;
        v30 = [v4 decodeObjectOfClass:v29 forKey:@"_UISceneConfigurationStoryboardName"];

        v31 = self;
        v32 = [v4 decodeObjectOfClass:v31 forKey:@"_UISceneConfigurationStoryboardBundleID"];

        if (v30)
        {
          if (v32) {
            objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", v32, v39);
          }
          else {
          v33 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", v39);
          }
          uint64_t v34 = +[UIStoryboard storyboardWithName:v30 bundle:v33];

          if (v34) {
            goto LABEL_35;
          }
          v12->_hadResolutionErrorsOnLoad = 1;
          v35 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneConfiguration", &qword_1EB25F1B8) + 8);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v42 = v11;
            __int16 v43 = 2112;
            v44 = v30;
            __int16 v45 = 2112;
            v46 = v32;
            _os_log_impl(&dword_1853B0000, v35, OS_LOG_TYPE_ERROR, "Encoded configuration for %@ contained a storyboard named \"%@\" from bundle \"%@\", but the storyboard could not be found.", buf, 0x20u);
          }
        }
        uint64_t v34 = 0;
LABEL_35:
        v12->_Class sceneClass = v40;
        v12->_Class delegateClass = v28;
        storyboard = v12->_storyboard;
        v12->_storyboard = (UIStoryboard *)v34;

        goto LABEL_36;
      }
      *(_DWORD *)buf = 138412546;
      v42 = v11;
      __int16 v43 = 2112;
      v44 = v15;
      v27 = "Encoded configuration for %@ contained a UISceneDelegate class named \"%@\", but it does not actually confor"
            "m to the UISceneDelegate protocol!";
    }
    else
    {
      v12->_hadResolutionErrorsOnLoad = 1;
      v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneConfiguration", &qword_1EB25F1A8) + 8);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      *(_DWORD *)buf = 138412546;
      v42 = v11;
      __int16 v43 = 2112;
      v44 = v15;
      v27 = "Encoded configuration for %@ contained a UISceneDelegate class named \"%@\", but no class with that name could be found.";
    }
    _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x16u);
    goto LABEL_27;
  }
  char v12 = [(UISceneConfiguration *)self initWithName:v6 sessionRole:v11];
LABEL_36:
  v37 = v12;

  return v37;
}

+ (UISceneConfiguration)configurationWithName:(NSString *)name sessionRole:(UISceneSessionRole)sessionRole
{
  unint64_t v6 = sessionRole;
  v7 = name;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 sessionRole:v6];

  return (UISceneConfiguration *)v8;
}

- (UISceneConfiguration)initWithName:(NSString *)name sessionRole:(UISceneSessionRole)sessionRole
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = name;
  v7 = sessionRole;
  v66.receiver = self;
  v66.super_class = (Class)UISceneConfiguration;
  uint64_t v8 = [(UISceneConfiguration *)&v66 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_role, sessionRole);
    *(_WORD *)&v9->_isDefault = 0;
    v10 = [(id)UIApp _infoPlistSceneConfigurations];
    uint64_t v11 = [(id)UIApp _infoPlistCanvasDefinitions];
    char v12 = (void *)v11;
    if (!v10)
    {
      if (v11)
      {
        uint64_t v21 = _UICanvasCanvasSystemTypeFromFrameType(v7);
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __49__UISceneConfiguration_initWithName_sessionRole___block_invoke_114;
        v63[3] = &__block_descriptor_40_e29_B32__0__NSDictionary_8Q16_B24l;
        v63[4] = v21;
        uint64_t v22 = [v12 indexOfObjectPassingTest:v63];
        v23 = v9->_name;
        v9->_name = 0;

        uint64_t v24 = _UICanvasFrameSystemTypeFromCanvasType(v21);
        role = v9->_role;
        v9->_role = (NSString *)v24;

        if (v22 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v9->_hadResolutionErrorsOnLoad = v6 != 0;
        }
        else
        {
          v54 = [v12 objectAtIndexedSubscript:v22];
          v55 = [v54 objectForKeyedSubscript:@"UICanvasClassName"];
          v9->_Class sceneClass = NSClassFromString(v55);

          v56 = [v54 objectForKeyedSubscript:@"UICanvasDelegateClassName"];
          v9->_Class delegateClass = NSClassFromString(v56);

          v57 = [v54 objectForKeyedSubscript:@"UIMainStoryboardFile"];
          if (v57)
          {
            v58 = [MEMORY[0x1E4F28B50] mainBundle];
            uint64_t v59 = +[UIStoryboard storyboardWithName:v57 bundle:v58];
            storyboard = v9->_storyboard;
            v9->_storyboard = (UIStoryboard *)v59;
          }
        }
      }
      else if (v6)
      {
        v9->_hadResolutionErrorsOnLoad = 1;
        v53 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneConfiguration", &qword_1EB25F190) + 8);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v68 = (__CFString *)v6;
          _os_log_impl(&dword_1853B0000, v53, OS_LOG_TYPE_ERROR, "Info.plist contained no UIScene configuration dictionary (looking for configuration named \"%@\")", buf, 0xCu);
        }
      }
      goto LABEL_53;
    }
    BOOL v13 = [(NSString *)v7 isEqualToString:@"UIWindowSceneSessionRoleExternalDisplayNonInteractive"];
    v14 = [v10 objectForKey:v7];
    v15 = v14;
    if (v13 && (!v14 || ![v14 count]))
    {
      uint64_t v16 = [v10 objectForKey:@"UIWindowSceneSessionRoleExternalDisplay"];

      v15 = (void *)v16;
    }
    if (v6)
    {
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __49__UISceneConfiguration_initWithName_sessionRole___block_invoke;
      v64[3] = &unk_1E52DDDC0;
      Class v17 = v6;
      v65 = v17;
      uint64_t v18 = [v15 indexOfObjectPassingTest:v64];
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = [v15 firstObject];
        v9->_hadResolutionErrorsOnLoad = 1;
        v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneConfiguration", &_MergedGlobals_961) + 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v68 = (__CFString *)v17;
          __int16 v69 = 2112;
          v70 = v7;
          __int16 v71 = 2112;
          v72 = v7;
          _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Info.plist contained no configuration named \"%@\" for %@. Falling back to first defined description for %@", buf, 0x20u);
        }
      }
      else
      {
        v19 = [v15 objectAtIndex:v18];
      }
      v27 = [v15 firstObject];
      char v26 = [v19 isEqualToDictionary:v27];

      if (!v19) {
        goto LABEL_52;
      }
    }
    else
    {
      v19 = [v15 firstObject];
      char v26 = 1;
      if (!v19)
      {
LABEL_52:

LABEL_53:
        goto LABEL_54;
      }
    }
    v62 = v10;
    v9->_isDefault = v26;
    v9->_fromPlist = 1;
    uint64_t v28 = [v19 objectForKeyedSubscript:@"UISceneConfigurationName"];
    v29 = v9->_name;
    v9->_name = (NSString *)v28;

    v9->_hadResolutionErrorsOnLoad = 0;
    v30 = [v19 objectForKeyedSubscript:@"UISceneClassName"];
    Class v31 = NSClassFromString(v30);
    Class v32 = v31;
    v9->_Class sceneClass = v31;
    if (!v30 || v31)
    {
      if (v30)
      {
        v36 = self;
        char v37 = [(objc_class *)v32 isSubclassOfClass:v36];

        if ((v37 & 1) == 0)
        {
          v9->_hadResolutionErrorsOnLoad = 1;
          v33 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneConfiguration", &qword_1EB25F170) + 8);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v38 = @"(no name)";
            *(_DWORD *)buf = 138412802;
            if (v6) {
              v38 = (__CFString *)v6;
            }
            v68 = v38;
            __int16 v69 = 2112;
            v70 = v7;
            __int16 v71 = 2112;
            v72 = v30;
            v35 = "Info.plist configuration \"%@\" for %@ contained UISceneClassName, \"%@\", but it is not a subclass of UIScene.";
            goto LABEL_30;
          }
        }
      }
    }
    else
    {
      v9->_hadResolutionErrorsOnLoad = 1;
      v33 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneConfiguration", &qword_1EB25F168) + 8);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = @"(no name)";
        *(_DWORD *)buf = 138412802;
        if (v6) {
          uint64_t v34 = (__CFString *)v6;
        }
        v68 = v34;
        __int16 v69 = 2112;
        v70 = v7;
        __int16 v71 = 2112;
        v72 = v30;
        v35 = "Info.plist configuration \"%@\" for %@ contained UISceneClassName key, but could not load class with name \"%@\".";
LABEL_30:
        _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, v35, buf, 0x20u);
      }
    }
    objc_msgSend(v19, "objectForKeyedSubscript:", @"UISceneDelegateClassName", v12);
    v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    Class v40 = NSClassFromString(v39);
    v9->_Class delegateClass = v40;
    if (!v39 || v40)
    {
      if (!v39) {
        goto LABEL_44;
      }
      if ([(objc_class *)v40 conformsToProtocol:&unk_1ED6D0780]) {
        goto LABEL_44;
      }
      v9->_hadResolutionErrorsOnLoad = 1;
      v41 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneConfiguration", &qword_1EB25F180) + 8);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      v44 = @"(no name)";
      *(_DWORD *)buf = 138412802;
      if (v6) {
        v44 = (__CFString *)v6;
      }
      v68 = v44;
      __int16 v69 = 2112;
      v70 = v7;
      __int16 v71 = 2112;
      v72 = v39;
      __int16 v43 = "Info.plist configuration \"%@\" for %@ contained UISceneDelegateClassName, \"%@\", but it does not conform t"
            "o the UISceneDelegate protocol.";
    }
    else
    {
      v9->_hadResolutionErrorsOnLoad = 1;
      v41 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneConfiguration", &qword_1EB25F178) + 8);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
LABEL_44:
        __int16 v45 = [v19 objectForKeyedSubscript:@"UISceneStoryboardFile"];
        if (v45)
        {
          v46 = [MEMORY[0x1E4F28B50] mainBundle];
          uint64_t v47 = +[UIStoryboard storyboardWithName:v45 bundle:v46];
          v48 = v9->_storyboard;
          v9->_storyboard = (UIStoryboard *)v47;

          if (!v9->_storyboard)
          {
            v9->_hadResolutionErrorsOnLoad = 1;
            v49 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneConfiguration", &qword_1EB25F188) + 8);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              v50 = @"(no name)";
              *(_DWORD *)buf = 138412802;
              if (v6) {
                v50 = (__CFString *)v6;
              }
              v68 = v50;
              __int16 v69 = 2112;
              v70 = v7;
              __int16 v71 = 2112;
              v72 = v39;
              _os_log_impl(&dword_1853B0000, v49, OS_LOG_TYPE_ERROR, "Info.plist configuration \"%@\" for %@ contained UIMainStoryboardFile key, but could not find storyboard with name %@.", buf, 0x20u);
            }
          }
        }
        else
        {
          v51 = v9->_storyboard;
          v9->_storyboard = 0;
        }
        char v12 = v61;
        v10 = v62;
        goto LABEL_52;
      }
      v42 = @"(no name)";
      *(_DWORD *)buf = 138412802;
      if (v6) {
        v42 = (__CFString *)v6;
      }
      v68 = v42;
      __int16 v69 = 2112;
      v70 = v7;
      __int16 v71 = 2112;
      v72 = v39;
      __int16 v43 = "Info.plist configuration \"%@\" for %@ contained UISceneDelegateClassName key, but could not load class with name \"%@\".";
    }
    _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_ERROR, v43, buf, 0x20u);
    goto LABEL_44;
  }
LABEL_54:

  return v9;
}

uint64_t __49__UISceneConfiguration_initWithName_sessionRole___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:@"UISceneConfigurationName"];
  id v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 isEqualToString:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setDelegateClass:(Class)delegateClass
{
  if (self->_delegateClass != delegateClass)
  {
    name = self->_name;
    self->_name = 0;
    unint64_t v6 = self;

    *(_WORD *)&v6->_isDefault = 0;
    self->_Class delegateClass = delegateClass;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  if (self->_name && self->_fromPlist)
  {
    objc_msgSend(v15, "encodeObject:forKey:");
    [v15 encodeObject:self->_role forKey:@"_UISceneConfigurationSessionRole"];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v5 = [v4 infoDictionary];

    unint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1D020]];
    [v15 encodeObject:v6 forKey:@"_UISceneConfigurationEncodingBundleVersion"];

    v7 = [v5 objectForKeyedSubscript:@"CFBundleShortVersionString"];
    [v15 encodeObject:v7 forKey:@"_UISceneConfigurationEncodingBundleShortVersionString"];

    [v15 encodeObject:self->_role forKey:@"_UISceneConfigurationSessionRole"];
    uint64_t v8 = NSStringFromClass(self->_sceneClass);
    [v15 encodeObject:v8 forKey:@"_UISceneConfigurationSceneClassName"];

    v9 = NSStringFromClass(self->_delegateClass);
    [v15 encodeObject:v9 forKey:@"_UISceneConfigurationDelegateClassName"];

    v10 = [(UIStoryboard *)self->_storyboard name];
    [v15 encodeObject:v10 forKey:@"_UISceneConfigurationStoryboardName"];

    uint64_t v11 = [(UIStoryboard *)self->_storyboard bundle];
    char v12 = [MEMORY[0x1E4F28B50] mainBundle];
    if ([v11 isEqual:v12])
    {
      BOOL v13 = 0;
    }
    else
    {
      v14 = [(UIStoryboard *)self->_storyboard bundle];
      BOOL v13 = [v14 bundleIdentifier];
    }
    [v15 encodeObject:v13 forKey:@"_UISceneConfigurationStoryboardBundleID"];
  }
}

BOOL __49__UISceneConfiguration_initWithName_sessionRole___block_invoke_114(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v6 = [a2 objectForKeyedSubscript:@"UICanvasType"];
  v7 = v6;
  if (v6) {
    unint64_t v6 = (void *)[v6 integerValue];
  }
  BOOL v8 = *(void *)(a1 + 32) == (void)v6;
  *a4 = v8;

  return v8;
}

- (UISceneConfiguration)init
{
  return [(UISceneConfiguration *)self initWithName:0 sessionRole:@"UISceneSessionRoleNone"];
}

- (id)_initWithLoadErrorForSessionRole:(id)a3
{
  id result = [(UISceneConfiguration *)self initWithName:0 sessionRole:a3];
  if (result) {
    *((unsigned char *)result + 8) = 1;
  }
  return result;
}

- (void)setSceneClass:(Class)sceneClass
{
  if (self->_sceneClass != sceneClass)
  {
    name = self->_name;
    self->_name = 0;
    unint64_t v6 = self;

    *(_WORD *)&v6->_isDefault = 0;
    self->_Class sceneClass = sceneClass;
  }
}

- (void)setStoryboard:(UIStoryboard *)storyboard
{
  p_storyboard = &self->_storyboard;
  BOOL v8 = storyboard;
  if (([(UIStoryboard *)v8 isEqual:*p_storyboard] & 1) == 0)
  {
    name = self->_name;
    self->_name = 0;
    v7 = self;

    *(_WORD *)&v7->_isDefault = 0;
    objc_storeStrong((id *)p_storyboard, storyboard);
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(UISceneConfiguration *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(UISceneConfiguration *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_name withName:@"name"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UISceneConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UISceneConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  char has_internal_diagnostics = os_variant_has_internal_diagnostics();
  unint64_t v6 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v6 setActiveMultilinePrefix:v4];

  [v6 appendString:self->_name withName:@"name"];
  [v6 appendString:self->_role withName:@"role"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__UISceneConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E52DC3D0;
  id v7 = v6;
  char v14 = has_internal_diagnostics;
  id v12 = v7;
  BOOL v13 = self;
  id v8 = (id)[v7 modifyBody:v11];
  id v9 = v7;

  return v9;
}

void __62__UISceneConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__UISceneConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52DC3D0;
  char v9 = *(unsigned char *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

id __62__UISceneConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    v3 = [v2 activeMultilinePrefix];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __62__UISceneConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    id v12 = &unk_1E52D9F98;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v13 = v4;
    uint64_t v14 = v5;
    [v2 appendBodySectionWithName:@"flags" multilinePrefix:v3 block:&v9];
  }
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendClass:withName:", *(void *)(*(void *)(a1 + 40) + 32), @"sceneClass", v9, v10, v11, v12);
  id v7 = (id)[*(id *)(a1 + 32) appendClass:*(void *)(*(void *)(a1 + 40) + 40) withName:@"delegateClass"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"storyboard"];
}

id __62__UISceneConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 9) withName:@"isDefault"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 10) withName:@"isFromPlist"];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"hadResolutionErrorsOnLoad"];
}

@end
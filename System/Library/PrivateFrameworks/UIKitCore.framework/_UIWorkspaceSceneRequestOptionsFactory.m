@interface _UIWorkspaceSceneRequestOptionsFactory
+ (id)_createDefaultBuilders;
+ (id)_defaultBuilderProviders;
+ (id)sharedFactory;
- (NSDictionary)defaultBuildersByRole;
- (NSMutableDictionary)buildersByRole;
- (id)_effectiveBuilderForRole:(id)a3;
- (id)_init;
- (id)customEndpointForRequest:(id)a3;
- (void)_registerBuilder:(id)a3 forRole:(id)a4;
- (void)buildWorkspaceRequestOptionsForRequest:(id)a3 withContinuation:(id)a4;
- (void)setBuildersByRole:(id)a3;
- (void)setDefaultBuildersByRole:(id)a3;
@end

@implementation _UIWorkspaceSceneRequestOptionsFactory

+ (id)sharedFactory
{
  if (_MergedGlobals_1190 != -1) {
    dispatch_once(&_MergedGlobals_1190, &__block_literal_global_438);
  }
  v2 = (void *)qword_1EB2622F8;
  return v2;
}

+ (id)_defaultBuilderProviders
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)_createDefaultBuilders
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v20 = @"UIWindowSceneSessionRoleApplication";
  v4 = objc_alloc_init(_UIApplicationSceneRequestBuilder);
  v21[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  v6 = (void *)[v3 initWithDictionary:v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = objc_msgSend(a1, "_defaultBuilderProviders", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) createDefaultBuilders];
        [v6 addEntriesFromDictionary:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  v13 = (void *)[v6 copy];
  return v13;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIWorkspaceSceneRequestOptionsFactory;
  v2 = [(_UIWorkspaceSceneRequestOptionsFactory *)&v8 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    buildersByRole = v2->_buildersByRole;
    v2->_buildersByRole = v3;

    uint64_t v5 = +[_UIWorkspaceSceneRequestOptionsFactory _createDefaultBuilders];
    defaultBuildersByRole = v2->_defaultBuildersByRole;
    v2->_defaultBuildersByRole = (NSDictionary *)v5;
  }
  return v2;
}

- (void)_registerBuilder:(id)a3 forRole:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(_UIWorkspaceSceneRequestOptionsFactory *)self buildersByRole];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("SceneRequestFactory", &qword_1EB262300);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v11 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long v18 = 138412802;
        *(void *)&v18[4] = v7;
        *(_WORD *)&v18[12] = 2112;
        *(void *)&v18[14] = v9;
        *(_WORD *)&v18[22] = 2112;
        id v19 = v6;
        v12 = "Replacing existing builder for role \"%@\". existing=%@, new=%@";
        v13 = v11;
        uint32_t v14 = 32;
LABEL_9:
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, v12, v18, v14);
      }
    }
  }
  else
  {
    unint64_t v15 = __UILogGetCategoryCachedImpl("SceneRequestFactory", &qword_1EB262308);
    if (*(unsigned char *)v15)
    {
      long long v17 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long v18 = 138412546;
        *(void *)&v18[4] = v7;
        *(_WORD *)&v18[12] = 2112;
        *(void *)&v18[14] = v6;
        v12 = "Registering builder for role \"%@\": %@";
        v13 = v17;
        uint32_t v14 = 22;
        goto LABEL_9;
      }
    }
  }
  long long v16 = [(_UIWorkspaceSceneRequestOptionsFactory *)self buildersByRole];
  [v16 setObject:v6 forKeyedSubscript:v7];
}

- (id)_effectiveBuilderForRole:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIWorkspaceSceneRequestOptionsFactory *)self buildersByRole];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v7 = [(_UIWorkspaceSceneRequestOptionsFactory *)self defaultBuildersByRole];
    id v6 = [v7 objectForKeyedSubscript:v4];
  }
  return v6;
}

- (id)customEndpointForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 role];
  id v6 = [(_UIWorkspaceSceneRequestOptionsFactory *)self _effectiveBuilderForRole:v5];

  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = [v6 customEndpointForRequest:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)buildWorkspaceRequestOptionsForRequest:(id)a3 withContinuation:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 role];
  if (v8)
  {
    uint64_t v9 = [(_UIWorkspaceSceneRequestOptionsFactory *)self _effectiveBuilderForRole:v8];
    if (v9)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("SceneRequestFactory", &qword_1EB262320);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v28 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v36 = v9;
          __int16 v37 = 2112;
          id v38 = v6;
          _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "Building workspace request options using builder: %@; clientRequest=%@",
            buf,
            0x16u);
        }
      }
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __98___UIWorkspaceSceneRequestOptionsFactory_buildWorkspaceRequestOptionsForRequest_withContinuation___block_invoke;
      v31[3] = &unk_1E5300FA0;
      id v32 = v9;
      id v34 = v7;
      id v33 = v8;
      [v32 buildWorkspaceRequestOptionsForRequest:v6 withContinuation:v31];

      id v11 = v32;
    }
    else
    {
      unint64_t v20 = __UILogGetCategoryCachedImpl("SceneRequestFactory", &qword_1EB262318);
      if (*(unsigned char *)v20)
      {
        v30 = *(NSObject **)(v20 + 8);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v8;
          _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_ERROR, "Building workspace request options failed because no builder is registered for scene session role \"%@\".", buf, 0xCu);
        }
      }
      _UISceneErrorForActivationRequestOfInvalidRole((uint64_t)v8, v21, v22, v23, v24, v25, v26, v27);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v11);
    }
  }
  else
  {
    unint64_t v12 = __UILogGetCategoryCachedImpl("SceneRequestFactory", &qword_1EB262310);
    if (*(unsigned char *)v12)
    {
      v29 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "Building workspace request options failed because role was nil in client request.", buf, 2u);
      }
    }
    uint64_t v9 = _UISceneErrorForActivationRequestOfInvalidRole(@"<nil>", v13, v14, v15, v16, v17, v18, v19);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

- (NSMutableDictionary)buildersByRole
{
  return self->_buildersByRole;
}

- (void)setBuildersByRole:(id)a3
{
}

- (NSDictionary)defaultBuildersByRole
{
  return self->_defaultBuildersByRole;
}

- (void)setDefaultBuildersByRole:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBuildersByRole, 0);
  objc_storeStrong((id *)&self->_buildersByRole, 0);
}

@end
@interface UIWorkspaceSceneRequestOptionsFactory
@end

@implementation UIWorkspaceSceneRequestOptionsFactory

void __55___UIWorkspaceSceneRequestOptionsFactory_sharedFactory__block_invoke()
{
  id v0 = [[_UIWorkspaceSceneRequestOptionsFactory alloc] _init];
  v1 = (void *)qword_1EB2622F8;
  qword_1EB2622F8 = (uint64_t)v0;
}

void __98___UIWorkspaceSceneRequestOptionsFactory_buildWorkspaceRequestOptionsForRequest_withContinuation___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  uint64_t v6 = a3;
  if (!(v5 | v6))
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("SceneRequestFactory", &qword_1EB262328);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v21 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = a1[4];
        int v29 = 138412290;
        uint64_t v30 = v22;
        _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Neither a result nor an error was produced by builder: %@", (uint8_t *)&v29, 0xCu);
      }
    }
    uint64_t v6 = _UISceneErrorWithCode(1);
  }
  if (!v6)
  {
    v9 = [(id)v5 specification];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 uiSceneSessionRole];
      if (([(id)a1[5] isEqualToString:v11] & 1) == 0)
      {
        unint64_t v16 = __UILogGetCategoryCachedImpl("SceneRequestFactory", &qword_1EB262340);
        if (*(unsigned char *)v16)
        {
          v26 = *(NSObject **)(v16 + 8);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = a1[4];
            unint64_t v28 = a1[5];
            int v29 = 138412802;
            uint64_t v30 = v27;
            __int16 v31 = 2112;
            unint64_t v32 = v28;
            __int16 v33 = 2112;
            v34 = v11;
            _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "Builder produced a workspace request options object with a specification whose role does not match the requested one. builder=%@; expectedRole=%@; builtRole=%@",
              (uint8_t *)&v29,
              0x20u);
          }
        }
        uint64_t v17 = a1[6];
        v18 = _UISceneErrorWithCode(1);
        (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);

        goto LABEL_16;
      }
      unint64_t v12 = __UILogGetCategoryCachedImpl("SceneRequestFactory", &qword_1EB262348);
      if (*(unsigned char *)v12)
      {
        v25 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          int v29 = 138412290;
          uint64_t v30 = v5;
          _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "Successfully built workspace request options: %@", (uint8_t *)&v29, 0xCu);
        }
      }
      v13 = *(void (**)(void))(a1[6] + 16);
    }
    else
    {
      unint64_t v14 = __UILogGetCategoryCachedImpl("SceneRequestFactory", &qword_1EB262338);
      if (*(unsigned char *)v14)
      {
        v23 = *(NSObject **)(v14 + 8);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = a1[4];
          int v29 = 138412546;
          uint64_t v30 = v24;
          __int16 v31 = 2112;
          unint64_t v32 = v5;
          _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Builder produced a workspace request options object with no specification. builder=%@; workspaceOptions=%@",
            (uint8_t *)&v29,
            0x16u);
        }
      }
      uint64_t v15 = a1[6];
      v11 = _UISceneErrorWithCode(1);
      v13 = *(void (**)(void))(v15 + 16);
    }
    v13();
LABEL_16:

    goto LABEL_17;
  }
  unint64_t v8 = __UILogGetCategoryCachedImpl("SceneRequestFactory", &qword_1EB262330);
  if (*(unsigned char *)v8)
  {
    v19 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      unint64_t v20 = a1[4];
      int v29 = 138412546;
      uint64_t v30 = v6;
      __int16 v31 = 2112;
      unint64_t v32 = v20;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Failed to build workspace request options: %@; builder=%@",
        (uint8_t *)&v29,
        0x16u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
LABEL_17:
}

@end
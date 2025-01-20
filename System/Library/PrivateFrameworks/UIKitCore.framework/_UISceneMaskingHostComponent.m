@interface _UISceneMaskingHostComponent
- (_UISceneMaskingDelegate)_sceneMaskingHost;
- (id)handlePrivateActions:(id)a3;
- (void)_handleMaskingAction:(id)a3;
- (void)set_sceneMaskingHost:(id)a3;
@end

@implementation _UISceneMaskingHostComponent

- (void)set_sceneMaskingHost:(id)a3
{
}

- (id)handlePrivateActions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_opt_class();
        id v13 = v11;
        if (v12)
        {
          if (objc_opt_isKindOfClass()) {
            v14 = v13;
          }
          else {
            v14 = 0;
          }
        }
        else
        {
          v14 = 0;
        }
        id v15 = v14;

        if (v15)
        {
          -[_UISceneMaskingHostComponent _handleMaskingAction:](self, "_handleMaskingAction:", v15, (void)v17);
          [v5 addObject:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_handleMaskingAction:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 info];
  id v6 = [v5 objectForSetting:0];
  uint64_t v7 = [v6 integerValue];

  if (v7 == 1)
  {
    v14 = [(_UISceneMaskingHostComponent *)self _sceneMaskingHost];
    id v15 = [(FBSSceneComponent *)self hostScene];
    [v14 invalidateMasking:v15];
  }
  else if (!v7)
  {
    uint64_t v8 = [v5 objectForSetting:1];
    uint64_t v9 = [v8 integerValue];

    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    long long v20 = __53___UISceneMaskingHostComponent__handleMaskingAction___block_invoke;
    v21 = &unk_1E52E3C18;
    id v22 = v4;
    v10 = (void (**)(void *, void *))_Block_copy(&v18);
    v11 = [(_UISceneMaskingHostComponent *)self _sceneMaskingHost];

    if (v11)
    {
      uint64_t v12 = [(_UISceneMaskingHostComponent *)self _sceneMaskingHost];
      id v13 = [(FBSSceneComponent *)self hostScene];
      [v12 beginMaskingForReason:v9 continuation:v10 scene:v13];
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = @"Host does not implement scene masking.";
      long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      uint64_t v12 = [v16 errorWithDomain:@"_UISceneMaskingErrorDomain" code:0 userInfo:v17];

      v10[2](v10, v12);
    }
  }
}

- (_UISceneMaskingDelegate)_sceneMaskingHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneMaskingHost);
  return (_UISceneMaskingDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
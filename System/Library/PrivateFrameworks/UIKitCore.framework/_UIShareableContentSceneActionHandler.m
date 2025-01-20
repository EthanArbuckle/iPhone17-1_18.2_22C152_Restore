@interface _UIShareableContentSceneActionHandler
- (_UISceneBSActionHandler)shareableContentActionHandler;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (void)setShareableContentActionHandler:(id)a3;
@end

@implementation _UIShareableContentSceneActionHandler

- (void).cxx_destruct
{
}

- (_UISceneBSActionHandler)shareableContentActionHandler
{
  shareableContentActionHandler = self->_shareableContentActionHandler;
  if (!shareableContentActionHandler)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v4 = (void *)_MergedGlobals_959;
    uint64_t v13 = _MergedGlobals_959;
    if (!_MergedGlobals_959)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getSWShareableContentBSActionResponderClass_block_invoke;
      v9[3] = &unk_1E52D9900;
      v9[4] = &v10;
      __getSWShareableContentBSActionResponderClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = v4;
    _Block_object_dispose(&v10, 8);
    v6 = (_UISceneBSActionHandler *)objc_alloc_init(v5);
    v7 = self->_shareableContentActionHandler;
    self->_shareableContentActionHandler = v6;

    shareableContentActionHandler = self->_shareableContentActionHandler;
  }
  return shareableContentActionHandler;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v26 != v16) {
        objc_enumerationMutation(v13);
      }
      v18 = [*(id *)(*((void *)&v25 + 1) + 8 * v17) info];
      v19 = [v18 objectForSetting:30295];

      if (v19)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }

      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v15) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }

    v20 = [(_UIShareableContentSceneActionHandler *)self shareableContentActionHandler];

    if (!v20) {
      goto LABEL_13;
    }
    v21 = [(_UIShareableContentSceneActionHandler *)self shareableContentActionHandler];
    v22 = [v21 _respondToActions:v13 forFBSScene:v10 inUIScene:v11 fromTransitionContext:v12];
  }
  else
  {
LABEL_10:

LABEL_13:
    v22 = (void *)[v13 copy];
  }

  return v22;
}

- (void)setShareableContentActionHandler:(id)a3
{
}

@end
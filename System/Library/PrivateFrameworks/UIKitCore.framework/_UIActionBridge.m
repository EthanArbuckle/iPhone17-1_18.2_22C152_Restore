@interface _UIActionBridge
+ (id)actionMenuForMenu:(id)a3 firstTarget:(id)a4 includeHidden:(BOOL)a5;
+ (id)actionMenuForMenu:(id)a3 firstTarget:(id)a4 includeHidden:(BOOL)a5 validation:(id)a6;
+ (id)validatedCommandMenuForMenu:(id)a3 context:(id)a4;
+ (id)validatedCommandMenuForMenu:(id)a3 context:(id)a4 validation:(id)a5;
@end

@implementation _UIActionBridge

+ (id)actionMenuForMenu:(id)a3 firstTarget:(id)a4 includeHidden:(BOOL)a5 validation:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v26 = a4;
  id v25 = a6;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v21 = v9;
  id obj = [v9 children];
  uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v23 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke;
        v34[3] = &unk_1E52EA450;
        id v38 = a1;
        id v15 = v26;
        id v35 = v15;
        BOOL v39 = a5;
        id v16 = v25;
        id v36 = v16;
        id v17 = v10;
        id v37 = v17;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke_2;
        v29[3] = &unk_1E52EA4A0;
        id v30 = v15;
        id v31 = v16;
        BOOL v33 = a5;
        id v32 = v17;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke_5;
        v27[3] = &unk_1E52DB038;
        id v28 = v32;
        [v14 _acceptMenuVisit:v34 commandVisit:v29 actionVisit:v27 deferredElementVisit:0];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v12);
  }

  if ([v10 count])
  {
    v18 = v21;
    v19 = [v21 menuByReplacingChildren:v10];
  }
  else
  {
    v19 = 0;
    v18 = v21;
  }

  return v19;
}

+ (id)actionMenuForMenu:(id)a3 firstTarget:(id)a4 includeHidden:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(_UIMenuLeafValidation);
  uint64_t v11 = [a1 actionMenuForMenu:v9 firstTarget:v8 includeHidden:v5 validation:v10];

  return v11;
}

+ (id)validatedCommandMenuForMenu:(id)a3 context:(id)a4 validation:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v23 = a4;
  id v22 = a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v19 = v7;
  id obj = [v7 children];
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __66___UIActionBridge_validatedCommandMenuForMenu_context_validation___block_invoke;
        v28[3] = &unk_1E52EA4C8;
        id v32 = a1;
        id v14 = v23;
        id v29 = v14;
        id v15 = v22;
        id v30 = v15;
        id v16 = v8;
        id v31 = v16;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __66___UIActionBridge_validatedCommandMenuForMenu_context_validation___block_invoke_2;
        v24[3] = &unk_1E52EA4F0;
        id v25 = v14;
        id v26 = v15;
        id v27 = v16;
        [v13 _acceptMenuVisit:v28 leafVisit:v24];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }

  [v7 _resolveElementSizeWithContext:v23];
  id v17 = [v7 menuByReplacingChildren:v8];

  return v17;
}

+ (id)validatedCommandMenuForMenu:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(_UIMenuLeafValidation);
  uint64_t v9 = [a1 validatedCommandMenuForMenu:v7 context:v6 validation:v8];

  return v9;
}

@end
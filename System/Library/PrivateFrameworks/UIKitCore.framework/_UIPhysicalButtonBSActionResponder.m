@interface _UIPhysicalButtonBSActionResponder
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation _UIPhysicalButtonBSActionResponder

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v8 = objc_msgSend(a5, "_physicalButtonInteractionArbiter", a3, a4);
  if (([a5 _hasInvalidated] & 1) != 0 || !v8)
  {
    id v21 = a3;
LABEL_19:
    v18 = v21;
    v12 = 0;
    goto LABEL_20;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = a3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v10)
  {

    id v21 = v9;
    goto LABEL_19;
  }
  uint64_t v11 = v10;
  v12 = 0;
  uint64_t v13 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      if (objc_msgSend(v15, "UIActionType", (void)v23) == 51)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = v15;
          if (!v12) {
            v12 = objc_opt_new();
          }
          [v12 addObject:v16];
          -[_UIPhysicalButtonInteractionArbiter _handleBSAction:]((uint64_t)v8, v16);
        }
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v11);

  id v17 = v9;
  v18 = v17;
  if (v12)
  {
    v19 = (void *)[v17 mutableCopy];
    [v19 minusSet:v12];
    uint64_t v20 = [v19 copy];

    v18 = (void *)v20;
  }
LABEL_20:

  return v18;
}

@end
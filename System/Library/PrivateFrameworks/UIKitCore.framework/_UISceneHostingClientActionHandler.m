@interface _UISceneHostingClientActionHandler
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation _UISceneHostingClientActionHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 objectsPassingTest:&__block_literal_global_237];
  if ([v10 count])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UISceneHosting", &_respondToActions_forFBSScene_inUIScene_fromTransitionContext____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v20 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = v20;
          v22 = objc_opt_class();
          id v23 = v22;
          *(_DWORD *)buf = 138413058;
          v30 = v22;
          __int16 v31 = 2048;
          v32 = self;
          __int16 v33 = 2048;
          uint64_t v34 = [v10 count];
          __int16 v35 = 2112;
          v36 = v10;
          _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "[<%@;%p>] Received %ld actions: %@", buf, 0x2Au);
        }
      }
      id v12 = v9;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v13 = v10;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "performActionForHostedWindowScene:", v12, (void)v24);
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v15);
      }
    }
  }
  v18 = objc_msgSend(v8, "mutableCopy", (void)v24);
  [v18 minusSet:v10];

  return v18;
}

@end
@interface _UISceneBluetoothTransitionContextHandler
- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation _UISceneBluetoothTransitionContextHandler

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v8 = objc_opt_new();
  if ([a6 isUISubclass])
  {
    uint64_t v9 = [a6 payload];
    if (v9)
    {
      v10 = (void *)v9;
      id v23 = a3;
      v29[0] = @"UIApplicationLaunchOptionsBluetoothCentralsKey";
      v29[1] = @"UIApplicationLaunchOptionsBluetoothPeripheralsKey";
      v30[0] = @"_UISceneConnectionOptionsBluetoothCentralsKey";
      v30[1] = @"_UISceneConnectionOptionsBluetoothPeripheralsKey";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            v17 = [v10 objectForKey:v16];
            if (v17)
            {
              v18 = [v11 objectForKeyedSubscript:v16];
              v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
              [v8 setObject:v19 forKey:v18];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v13);
      }

      a3 = v23;
    }
  }
  v20 = objc_alloc_init(_UISceneConnectionOptionsContext);
  v21 = (void *)[v8 copy];
  [(_UISceneConnectionOptionsContext *)v20 setLaunchOptionsDictionary:v21];

  [(_UISceneConnectionOptionsContext *)v20 setUnprocessedActions:a3];
  return v20;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  return a3;
}

@end
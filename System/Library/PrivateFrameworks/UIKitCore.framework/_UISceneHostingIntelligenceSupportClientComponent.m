@interface _UISceneHostingIntelligenceSupportClientComponent
- (id)scene:(id)a3 handleActions:(id)a4;
- (id)windowHostingSceneForFBSScene:(id)a3;
@end

@implementation _UISceneHostingIntelligenceSupportClientComponent

- (id)windowHostingSceneForFBSScene:(id)a3
{
  v3 = +[UIScene _sceneForFBSScene:a3];
  v4 = [v3 _windowHostingScene];

  return v4;
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v7, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = objc_opt_class();
        id v16 = v14;
        if (v15)
        {
          if (objc_opt_isKindOfClass()) {
            v17 = v16;
          }
          else {
            v17 = 0;
          }
        }
        else
        {
          v17 = 0;
        }
        id v18 = v17;

        if (v18)
        {
          v19 = -[_UISceneHostingIntelligenceSupportClientComponent windowHostingSceneForFBSScene:](self, "windowHostingSceneForFBSScene:", v6, (void)v21);
          if (v19) {
            [v18 executeActionForWindowHostingScene:v19];
          }
          [v8 addObject:v18];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  return v8;
}

@end
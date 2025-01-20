@interface _UIHomeAffordanceClientSceneComponent
- (id)scene:(id)a3 handleActions:(id)a4;
- (void)_cachedHomeAffordanceSceneNotifier;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
@end

@implementation _UIHomeAffordanceClientSceneComponent

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v19 = a4;
  v5 = [v19 settingsDiff];
  int v6 = [v5 containsProperty:sel_homeAffordanceSceneReferenceFrame];

  v7 = v19;
  if (v6)
  {
    v8 = [v19 settings];
    [v8 homeAffordanceSceneReferenceFrame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    uint64_t v17 = -[_UIHomeAffordanceClientSceneComponent _cachedHomeAffordanceSceneNotifier](self);
    v18 = (void *)v17;
    if (v17) {
      -[_UIHomeAffordanceSceneNotifier _homeAffordanceSceneUpdateSource:frameDidChange:](v17, self, v10, v12, v14, v16);
    }

    v7 = v19;
  }
}

- (void)_cachedHomeAffordanceSceneNotifier
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[3];
    if (!v3)
    {
      v4 = [a1 clientScene];
      v5 = +[UIScene _sceneForFBSScene:v4];

      uint64_t v6 = [v5 _homeAffordanceSceneNotifier];
      v7 = (void *)v2[3];
      v2[3] = v6;

      v3 = (void *)v2[3];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        CGFloat v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = objc_opt_class();
        id v14 = v12;
        if (v13)
        {
          if (objc_opt_isKindOfClass()) {
            double v15 = v14;
          }
          else {
            double v15 = 0;
          }
        }
        else
        {
          double v15 = 0;
        }
        id v16 = v15;

        uint64_t v17 = -[_UIHomeAffordanceClientSceneComponent _cachedHomeAffordanceSceneNotifier](self);
        v18 = (id *)v17;
        if (v16 && v17)
        {
          if (!objc_msgSend(v16, "actionType", (void)v20)) {
            -[_UIHomeAffordanceSceneNotifier _homeAffordanceSceneUpdateSource:doubleTapGestureDidSucceed:](v18, self, [v16 didSucceed]);
          }
          [v6 addObject:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end
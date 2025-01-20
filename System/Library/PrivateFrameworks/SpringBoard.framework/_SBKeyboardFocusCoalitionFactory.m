@interface _SBKeyboardFocusCoalitionFactory
- (id)newCoalitionForSceneControllers:(id)a3;
@end

@implementation _SBKeyboardFocusCoalitionFactory

- (id)newCoalitionForSceneControllers:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  id v3 = (id)[obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v3)
  {
    v6 = 0;
    v5 = 0;
    v4 = 0;
    goto LABEL_25;
  }
  v4 = 0;
  v5 = 0;
  v6 = 0;
  uint64_t v7 = *(void *)v19;
  do
  {
    for (i = 0; i != v3; i = (char *)i + 1)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      v10 = [v9 sbWindowScene];
      if ([v10 isEmbeddedScene])
      {
        v11 = v6;
        v12 = v4;
        v6 = v9;
      }
      else if ([v10 isContinuityScene])
      {
        v11 = v5;
        v12 = v4;
        v5 = v9;
      }
      else
      {
        v11 = v4;
        v12 = v9;
        if (![v10 isExternalDisplayScene]) {
          goto LABEL_12;
        }
      }
      id v13 = v9;

      v4 = v12;
LABEL_12:
    }
    id v3 = (id)[obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v3);
  if (v6 && v4)
  {
    v14 = off_1E6AEDF60;
    goto LABEL_24;
  }
  if (v5) {
    BOOL v15 = v6 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  v14 = off_1E6AEDF90;
  if (!v15) {
    v14 = off_1E6AEDF68;
  }
  if (v6) {
LABEL_24:
  }
    id v3 = objc_alloc_init(*v14);
  else {
    id v3 = 0;
  }
LABEL_25:

  return v3;
}

@end
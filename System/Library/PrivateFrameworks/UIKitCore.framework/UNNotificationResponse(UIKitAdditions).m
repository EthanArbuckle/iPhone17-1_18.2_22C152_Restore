@interface UNNotificationResponse(UIKitAdditions)
- (id)targetScene;
@end

@implementation UNNotificationResponse(UIKitAdditions)

- (id)targetScene
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(id)UIApp connectedScenes];
  v3 = [a1 targetSceneIdentifier];
  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v2;
    id v5 = (id)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v9 = objc_msgSend(v8, "session", (void)v13);
          v10 = [v9 persistentIdentifier];
          int v11 = [v10 isEqualToString:v3];

          if (v11)
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
        id v5 = (id)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end
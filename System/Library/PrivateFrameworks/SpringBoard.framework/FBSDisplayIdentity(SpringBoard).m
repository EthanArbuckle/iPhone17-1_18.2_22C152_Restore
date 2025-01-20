@interface FBSDisplayIdentity(SpringBoard)
- (id)UIScreen;
- (id)currentConfiguration;
@end

@implementation FBSDisplayIdentity(SpringBoard)

- (id)currentConfiguration
{
  BSDispatchQueueAssertMain();
  v2 = [a1 UIScreen];
  v3 = [v2 displayConfiguration];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [MEMORY[0x1E4F62420] sharedInstance];
    id v5 = [v6 configurationForIdentity:a1];
  }
  return v5;
}

- (id)UIScreen
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E4F42D90], "screens", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v8 = [v7 displayIdentity];
        char v9 = [a1 isEqual:v8];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

@end
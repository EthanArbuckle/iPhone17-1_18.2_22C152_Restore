@interface MPNowPlayingContentItem(IMAVPlayer)
- (void)updateNowPlayingInfoIfNeeded:()IMAVPlayer;
@end

@implementation MPNowPlayingContentItem(IMAVPlayer)

- (void)updateNowPlayingInfoIfNeeded:()IMAVPlayer
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 allKeys];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [a1 nowPlayingInfo];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v14 = objc_msgSend(v7, "objectForKey:", v13, (void)v17);
          v15 = [v8 objectForKey:v13];
          int v16 = [v15 isEqual:v14];

          if (!v16)
          {

            [a1 setNowPlayingInfo:v8];
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

LABEL_12:
  }
}

@end
@interface AVAsset
- (BOOL)bk_isAudible;
- (BOOL)bk_isAudibleContentAuthorized;
@end

@implementation AVAsset

- (BOOL)bk_isAudible
{
  objc_opt_class();
  v2 = BUDynamicCast();
  v3 = [v2 URL];
  v4 = [v3 pathExtension];

  if ([v4 isEqualToString:@"aa"]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v4 isEqualToString:@"aax"];
  }

  return v5;
}

- (BOOL)bk_isAudibleContentAuthorized
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = -[AVAsset tracksWithMediaType:](self, "tracksWithMediaType:", AVMediaTypeAudio, 0);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 hasAudibleBooksContent]
          && ![v7 isAudibleBooksContentAuthorized])
        {
          BOOL v8 = 0;
          goto LABEL_12;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

@end
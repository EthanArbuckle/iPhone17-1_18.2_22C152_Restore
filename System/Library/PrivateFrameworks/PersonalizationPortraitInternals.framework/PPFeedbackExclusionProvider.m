@interface PPFeedbackExclusionProvider
+ (id)excludedBundleIdsForClientBundleId:(int)a3 domain:;
@end

@implementation PPFeedbackExclusionProvider

+ (id)excludedBundleIdsForClientBundleId:(int)a3 domain:
{
  id v4 = a2;
  self;
  if (v4)
  {
    if (a3)
    {
      if (a3 == 2 || a3 == 1)
      {
        uint64_t v5 = *MEMORY[0x1E4F8A0A0];
        if ([v4 isEqualToString:*MEMORY[0x1E4F8A0A0]])
        {
          v6 = (void *)MEMORY[0x1CB79D060]();
          id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v8 = objc_msgSend(v7, "initWithObjects:", v5, *MEMORY[0x1E4F8A058], *MEMORY[0x1E4F8A040], 0);
LABEL_9:
          v10 = (void *)v8;
          goto LABEL_11;
        }
      }
    }
    else
    {
      uint64_t v9 = *MEMORY[0x1E4F8A0B8];
      if ([v4 isEqualToString:*MEMORY[0x1E4F8A0B8]])
      {
        v6 = (void *)MEMORY[0x1CB79D060]();
        uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v9, 0, v12, v13);
        goto LABEL_9;
      }
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

@end
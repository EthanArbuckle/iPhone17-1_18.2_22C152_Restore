@interface WFContentExfiltrationQuantityInfo
+ (int64_t)deletionItemCountLimitForContentWithContentItemClassName:(id)a3;
+ (int64_t)sharingItemCountLimitForContentWithAttribution:(id)a3;
@end

@implementation WFContentExfiltrationQuantityInfo

+ (int64_t)deletionItemCountLimitForContentWithContentItemClassName:(id)a3
{
  id v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  char v6 = [v3 isEqualToString:v5];

  if (v6) {
    goto LABEL_6;
  }
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  char v9 = [v3 isEqualToString:v8];

  if (v9)
  {
    int64_t v10 = 10;
    goto LABEL_7;
  }
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  char v13 = [v3 isEqualToString:v12];

  if ((v13 & 1) != 0
    || (v14 = (objc_class *)objc_opt_class(),
        NSStringFromClass(v14),
        v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = [v3 isEqualToString:v15],
        v15,
        (v16 & 1) != 0))
  {
LABEL_6:
    int64_t v10 = 50;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"WFHKSampleContentItem"])
  {
    int64_t v10 = 0;
  }
  else
  {
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    [v3 isEqualToString:v19];

    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_7:

  return v10;
}

+ (int64_t)sharingItemCountLimitForContentWithAttribution:(id)a3
{
  id v3 = [a3 origin];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v3 appDescriptor];
      v5 = [v4 bundleIdentifier];

      if (([v5 isEqualToString:*MEMORY[0x1E4FB4AA8]] & 1) == 0)
      {
        if ([v5 isEqualToString:*MEMORY[0x1E4FB4AB8]])
        {
LABEL_5:
          int64_t v6 = 10;
LABEL_9:

          goto LABEL_10;
        }
        if (([v5 isEqualToString:*MEMORY[0x1E4FB4B50]] & 1) == 0)
        {
          if ([v5 isEqualToString:*MEMORY[0x1E4FB4B38]])
          {
            int64_t v6 = 20;
            goto LABEL_9;
          }
          if ([v5 isEqualToString:*MEMORY[0x1E4FB4AD8]])
          {
            int64_t v6 = 100;
            goto LABEL_9;
          }
          if (([v5 isEqualToString:*MEMORY[0x1E4FB4B30]] & 1) == 0)
          {
            if ([v5 isEqualToString:*MEMORY[0x1E4FB4B18]]) {
              int64_t v6 = 100;
            }
            else {
              int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
            }
            goto LABEL_9;
          }
          goto LABEL_5;
        }
      }
      int64_t v6 = 50;
      goto LABEL_9;
    }
  }
  int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:

  return v6;
}

@end
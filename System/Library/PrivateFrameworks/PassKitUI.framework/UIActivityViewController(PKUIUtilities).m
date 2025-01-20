@interface UIActivityViewController(PKUIUtilities)
+ (id)pkui_activityControllerForPass:()PKUIUtilities passView:passLinkedApplication:;
@end

@implementation UIActivityViewController(PKUIUtilities)

+ (id)pkui_activityControllerForPass:()PKUIUtilities passView:passLinkedApplication:
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 passType])
  {
    v10 = 0;
    goto LABEL_11;
  }
  uint64_t v11 = [v7 sharingMethod];
  v12 = [[PKActivityItemProvider alloc] initWithPass:v7 passView:v8 linkedApp:v9 sharingMethod:v11];
  if (v12)
  {
    if (v11 == 1)
    {
      v18 = (void *)MEMORY[0x1E4F1CA48];
      v19 = [v7 sharingURL];
      v17 = objc_msgSend(v18, "arrayWithObjects:", v12, v19, 0);

      v10 = (void *)[objc_alloc(MEMORY[0x1E4F9F2E8]) initWithActivityItems:v17 applicationActivities:0];
      uint64_t v20 = *MEMORY[0x1E4F9F3B0];
      v23[0] = *MEMORY[0x1E4F9F398];
      v23[1] = v20;
      v23[2] = *MEMORY[0x1E4F9F3A0];
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
      [v10 setExcludedActivityTypes:v21];

      goto LABEL_9;
    }
    if (!v11)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F9F2E8]);
      v25[0] = v12;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      v10 = (void *)[v13 initWithActivityItems:v14 applicationActivities:0];

      uint64_t v15 = *MEMORY[0x1E4F9F3B8];
      v24[0] = *MEMORY[0x1E4F9F390];
      v24[1] = v15;
      uint64_t v16 = *MEMORY[0x1E4F9F3B0];
      v24[2] = *MEMORY[0x1E4F9F398];
      v24[3] = v16;
      v24[4] = *MEMORY[0x1E4F9F3A0];
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];
      [v10 setExcludedActivityTypes:v17];
LABEL_9:

      goto LABEL_10;
    }
  }
  v10 = 0;
LABEL_10:

LABEL_11:

  return v10;
}

@end
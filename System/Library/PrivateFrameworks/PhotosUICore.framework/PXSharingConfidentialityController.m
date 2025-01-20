@interface PXSharingConfidentialityController
+ (BOOL)confidentialWarningRequiredForAsset:(id)a3;
+ (BOOL)confidentialWarningRequiredForAssetReferences:(id)a3;
+ (BOOL)confidentialWarningRequiredForAssets:(id)a3;
+ (BOOL)confidentialWarningRequiredForShareableSelection:(id)a3;
+ (BOOL)confidentialityCheckRequired;
+ (NSString)confidentialFeatureWarningMessage;
+ (NSString)confidentialityWarningMessage;
+ (NSString)confidentialityWarningTitle;
+ (id)confidentialityAlertWithActions:(id)a3;
+ (id)confidentialityAlertWithConfirmAction:(id)a3;
+ (id)confidentialityAlertWithConfirmAction:(id)a3 abortAction:(id)a4;
@end

@implementation PXSharingConfidentialityController

+ (NSString)confidentialFeatureWarningMessage
{
  return (NSString *)@"This is an unreleased feature that should not be shared with undisclosed recipients";
}

+ (NSString)confidentialityWarningMessage
{
  return (NSString *)@"These assets contain unreleased features and should NOT be shared to undisclosed recipients";
}

+ (NSString)confidentialityWarningTitle
{
  return (NSString *)@"Warning: Confidential";
}

+ (BOOL)confidentialityCheckRequired
{
  if (!PFOSVariantHasInternalUI()) {
    goto LABEL_4;
  }
  v2 = +[PXSharingSettings sharedInstance];
  int v3 = [v2 showConfidentialityWarnings];

  if (!v3) {
    goto LABEL_4;
  }
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v5 = [v4 BOOLForKey:@"PXDefaultDisableConfidentialityChecks"];

  if ((v5 & 1) == 0)
  {
    v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    int v6 = [v8 launchedToTest] ^ 1;
  }
  else
  {
LABEL_4:
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (BOOL)confidentialWarningRequiredForShareableSelection:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__PXSharingConfidentialityController_confidentialWarningRequiredForShareableSelection___block_invoke;
  v5[3] = &__block_descriptor_48_e35_B24__0___NSObject__NSCopying__8_B16l;
  v5[4] = a2;
  v5[5] = a1;
  if (a3)
  {
    long long v6 = 0u;
    long long v7 = 0u;
    [a3 indexPathOfObjectPassingTest:v5];
    uint64_t v3 = v6;
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3 != *(void *)off_1E5DAAED8;
}

uint64_t __87__PXSharingConfidentialityController_confidentialWarningRequiredForShareableSelection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) confidentialWarningRequiredForAsset:a2];
}

+ (BOOL)confidentialWarningRequiredForAssetReferences:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 confidentialityCheckRequired])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "asset", (void)v13);
          if ([v10 conformsToProtocol:&unk_1F04B3848]
            && ([a1 confidentialWarningRequiredForAsset:v10] & 1) != 0)
          {

            BOOL v11 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 0;
LABEL_14:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)confidentialWarningRequiredForAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (PFOSVariantHasInternalUI())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(a1, "confidentialWarningRequiredForAsset:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
          {
            BOOL v10 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v10 = 0;
LABEL_13:
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)confidentialWarningRequiredForAsset:(id)a3
{
  id v3 = a3;
  if (PFOSVariantHasInternalUI()) {
    char v4 = [v3 requiresConfidentiality];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)confidentialityAlertWithConfirmAction:(id)a3 abortAction:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 confidentialityAlertWithConfirmAction:a3];
  uint64_t v8 = (void *)MEMORY[0x1E4FB1410];
  v9 = PXLocalizedStringFromTable(@"PXAbort", @"PhotosUICore");
  BOOL v10 = [v8 actionWithTitle:v9 style:0 handler:v6];

  [v7 addAction:v10];
  return v7;
}

+ (id)confidentialityAlertWithConfirmAction:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4FB1410];
  id v4 = a3;
  id v5 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
  id v6 = [v3 actionWithTitle:v5 style:0 handler:v4];

  v10[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v8 = +[PXSharingConfidentialityController confidentialityAlertWithActions:v7];

  return v8;
}

+ (id)confidentialityAlertWithActions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PXSharingConfidentialityController confidentialityWarningTitle];
  id v5 = +[PXSharingConfidentialityController confidentialityWarningMessage];
  id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:v5 preferredStyle:1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addAction:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return v6;
}

@end
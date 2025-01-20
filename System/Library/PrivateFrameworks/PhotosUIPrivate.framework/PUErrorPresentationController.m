@interface PUErrorPresentationController
+ (BOOL)assetIsStandardVideo:(id)a3;
+ (BOOL)errorIsAuthenticationRelatedCPLError:(id)a3;
+ (BOOL)errorIsLowDiskSpaceRelatedCPLError:(id)a3;
+ (BOOL)isNetworkRelatedError:(id)a3;
+ (id)alertActionForNavigatingToDestination:(int64_t)a3 withTitle:(id)a4 completion:(id)a5;
- (BOOL)shouldIncludeAssetInRadarDescription:(id)a3;
- (BOOL)shouldShowFileRadarAction;
- (NSArray)additionalAlertActions;
- (NSArray)additionalQuestionsInRadarDescription;
- (NSArray)assets;
- (NSArray)errors;
- (NSString)alertMessage;
- (NSString)alertTitle;
- (NSString)assetsListDescription;
- (NSString)dismissButtonTitle;
- (NSString)radarComponentID;
- (NSString)radarComponentName;
- (NSString)radarComponentVersion;
- (NSString)radarDescription;
- (NSString)radarTitle;
- (PUErrorPresentationController)initWithErrors:(id)a3 forAssets:(id)a4;
- (id)additionalRadarDescriptionLinesForAsset:(id)a3;
- (id)alertControllerWithCompletion:(id)a3;
- (id)assetsDescriptionFromAssets:(id)a3;
- (void)setAdditionalAlertActions:(id)a3;
- (void)setAdditionalQuestionsInRadarDescription:(id)a3;
- (void)setAlertMessage:(id)a3;
- (void)setAlertTitle:(id)a3;
- (void)setAssetsListDescription:(id)a3;
- (void)setDismissButtonTitle:(id)a3;
- (void)setRadarComponentID:(id)a3 name:(id)a4 version:(id)a5;
- (void)setRadarDescription:(id)a3;
- (void)setRadarTitle:(id)a3;
@end

@implementation PUErrorPresentationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsListDescription, 0);
  objc_storeStrong((id *)&self->_additionalQuestionsInRadarDescription, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_dismissButtonTitle, 0);
  objc_storeStrong((id *)&self->_additionalAlertActions, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_radarComponentVersion, 0);
  objc_storeStrong((id *)&self->_radarComponentName, 0);
  objc_storeStrong((id *)&self->_radarComponentID, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_errors, 0);
}

- (void)setAssetsListDescription:(id)a3
{
}

- (NSString)assetsListDescription
{
  return self->_assetsListDescription;
}

- (void)setAdditionalQuestionsInRadarDescription:(id)a3
{
}

- (NSArray)additionalQuestionsInRadarDescription
{
  return self->_additionalQuestionsInRadarDescription;
}

- (void)setRadarTitle:(id)a3
{
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (void)setDismissButtonTitle:(id)a3
{
}

- (NSString)dismissButtonTitle
{
  return self->_dismissButtonTitle;
}

- (void)setAdditionalAlertActions:(id)a3
{
}

- (NSArray)additionalAlertActions
{
  return self->_additionalAlertActions;
}

- (void)setAlertMessage:(id)a3
{
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertTitle:(id)a3
{
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)radarComponentVersion
{
  return self->_radarComponentVersion;
}

- (NSString)radarComponentName
{
  return self->_radarComponentName;
}

- (NSString)radarComponentID
{
  return self->_radarComponentID;
}

- (void)setRadarDescription:(id)a3
{
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSArray)errors
{
  return self->_errors;
}

- (id)alertControllerWithCompletion:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PUErrorPresentationController *)self errors];
  v6 = [v5 firstObject];

  if (!MEMORY[0x1B3E7A510]()) {
    goto LABEL_8;
  }
  v7 = [(PUErrorPresentationController *)self radarComponentID];
  if (![v7 length]) {
    goto LABEL_7;
  }
  v8 = [(PUErrorPresentationController *)self radarComponentName];
  if (![v8 length])
  {

LABEL_7:
    goto LABEL_8;
  }
  v9 = [(PUErrorPresentationController *)self radarComponentVersion];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    BOOL v11 = [(PUErrorPresentationController *)self shouldShowFileRadarAction];
    goto LABEL_9;
  }
LABEL_8:
  BOOL v11 = 0;
LABEL_9:
  v12 = [(PUErrorPresentationController *)self assets];
  [(PUErrorPresentationController *)self configureAlertPropertiesFromError:v6 withAssets:v12 willShowFileRadarButton:v11 alertCompletion:v4];

  v13 = (void *)MEMORY[0x1E4FB1418];
  v14 = [(PUErrorPresentationController *)self alertTitle];
  v15 = [(PUErrorPresentationController *)self alertMessage];
  v16 = [v13 alertControllerWithTitle:v14 message:v15 preferredStyle:1];

  v17 = (void *)MEMORY[0x1E4FB1410];
  v18 = [(PUErrorPresentationController *)self dismissButtonTitle];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __63__PUErrorPresentationController_alertControllerWithCompletion___block_invoke;
  v37[3] = &unk_1E5F2E898;
  id v19 = v4;
  id v38 = v19;
  v20 = [v17 actionWithTitle:v18 style:0 handler:v37];
  [v16 addAction:v20];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v21 = [(PUErrorPresentationController *)self additionalAlertActions];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        [v16 addAction:*(void *)(*((void *)&v33 + 1) + 8 * i)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v23);
  }

  if (v11)
  {
    v26 = [(PUErrorPresentationController *)self assets];
    [(PUErrorPresentationController *)self configureRadarPropertiesFromError:v6 withAssets:v26];

    v27 = (void *)MEMORY[0x1E4FB1410];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __63__PUErrorPresentationController_alertControllerWithCompletion___block_invoke_2;
    v30[3] = &unk_1E5F2BC00;
    v30[4] = self;
    id v31 = v6;
    id v32 = v19;
    v28 = [v27 actionWithTitle:@"File Radar" style:0 handler:v30];
    [v16 addAction:v28];
  }
  return v16;
}

uint64_t __63__PUErrorPresentationController_alertControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __63__PUErrorPresentationController_alertControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28E78] string];
  v3 = [*(id *)(a1 + 32) additionalQuestionsInRadarDescription];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [v2 appendString:@"Additional Questions:\n"];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v5 = [*(id *)(a1 + 32) additionalQuestionsInRadarDescription];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v51 != v8) {
            objc_enumerationMutation(v5);
          }
          [v2 appendFormat:@"%@\n", *(void *)(*((void *)&v50 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v7);
    }

    [v2 appendString:@"\n\n"];
  }
  uint64_t v10 = [*(id *)(a1 + 32) radarDescription];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    v12 = [*(id *)(a1 + 32) radarDescription];
    [v2 appendString:v12];
  }
  v13 = [*(id *)(a1 + 32) assetsListDescription];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    v15 = [*(id *)(a1 + 32) assetsListDescription];
    [v2 appendFormat:@"%@:\n", v15];
  }
  v16 = *(void **)(a1 + 32);
  v17 = [v16 assets];
  uint64_t v18 = [v16 assetsDescriptionFromAssets:v17];

  v43 = (void *)v18;
  [v2 appendFormat:@"%@\n", v18];
  id v19 = [NSString stringWithFormat:@"\n\nError:\n%@", *(void *)(a1 + 40)];
  [v2 appendString:v19];

  [v2 appendString:@"\n\nAlert Shown to User:"];
  v20 = NSString;
  v21 = [*(id *)(a1 + 32) alertTitle];
  uint64_t v22 = [v20 stringWithFormat:@"\nTitle: \"%@\"", v21];
  [v2 appendString:v22];

  uint64_t v23 = NSString;
  uint64_t v24 = [*(id *)(a1 + 32) alertMessage];
  v25 = [v23 stringWithFormat:@"\nMessage: \"%@\"", v24];
  [v2 appendString:v25];

  v26 = (void *)MEMORY[0x1E4F1CA48];
  v27 = [*(id *)(a1 + 32) assets];
  v28 = objc_msgSend(v26, "arrayWithCapacity:", objc_msgSend(v27, "count"));

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v29 = [*(id *)(a1 + 32) assets];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v47 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v46 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [*(id *)(a1 + 32) shouldIncludeAssetInRadarDescription:v34])
        {
          long long v35 = [MEMORY[0x1E4F90200] detailedDebugDescriptionFileForAsset:v34];
          if (v35) {
            [v28 addObject:v35];
          }
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v31);
  }

  long long v36 = (void *)MEMORY[0x1E4F90200];
  v37 = [*(id *)(a1 + 32) radarTitle];
  id v38 = [*(id *)(a1 + 32) radarComponentID];
  v39 = [*(id *)(a1 + 32) radarComponentName];
  uint64_t v40 = [*(id *)(a1 + 32) radarComponentVersion];
  uint64_t v54 = *MEMORY[0x1E4F90EA8];
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __63__PUErrorPresentationController_alertControllerWithCompletion___block_invoke_3;
  v44[3] = &unk_1E5F2D990;
  id v45 = *(id *)(a1 + 48);
  LOWORD(v42) = 1;
  objc_msgSend(v36, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v37, v2, @"Serious Bug", v38, v39, v40, @"1448466", 0, 0, v42, v41, v44);
}

uint64_t __63__PUErrorPresentationController_alertControllerWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)assetsDescriptionFromAssets:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v33 = 1;
    uint64_t v7 = *(void *)v39;
    uint64_t v26 = *(void *)v39;
    do
    {
      uint64_t v8 = 0;
      uint64_t v28 = v6;
      do
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
        if ([(PUErrorPresentationController *)self shouldIncludeAssetInRadarDescription:v9])
        {
          uint64_t v10 = objc_msgSend(MEMORY[0x1E4F38EB8], "descriptionForMediaType:", objc_msgSend(v9, "mediaType"));
          uint64_t v11 = objc_msgSend(MEMORY[0x1E4F38EB8], "descriptionForMediaSubtypes:", objc_msgSend(v9, "mediaSubtypes"));
          uint64_t v12 = objc_msgSend(MEMORY[0x1E4F38EB8], "descriptionForPlaybackStyle:", objc_msgSend(v9, "playbackStyle"));
          uint64_t v30 = (void *)MEMORY[0x1E4F28E78];
          v13 = [v9 uuid];
          int v14 = [v9 isGuestAsset];
          v15 = @"NO";
          if (v14) {
            v15 = @"YES";
          }
          v16 = v15;
          v17 = [v9 creationDate];
          uint64_t v31 = (void *)v12;
          uint64_t v32 = (void *)v10;
          uint64_t v18 = [v30 stringWithFormat:@"#%lu: Asset ID: %@\n\tType: %@ (Subtypes: %@) (Playback Style: %@)\n\tIs Guest/Shared with You: %@\n\tCreation Date: %@", v33, v13, v10, v11, v12, v16, v17];

          id v19 = [(PUErrorPresentationController *)self additionalRadarDescriptionLinesForAsset:v9];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v35 != v22) {
                  objc_enumerationMutation(v19);
                }
                [v18 appendFormat:@"\n\t%@", *(void *)(*((void *)&v34 + 1) + 8 * i)];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v21);
          }
          ++v33;
          [v27 addObject:v18];

          uint64_t v6 = v28;
          uint64_t v7 = v26;
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v6);
  }

  uint64_t v24 = [v27 componentsJoinedByString:@"\n"];

  return v24;
}

- (id)additionalRadarDescriptionLinesForAsset:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)shouldIncludeAssetInRadarDescription:(id)a3
{
  return 1;
}

- (BOOL)shouldShowFileRadarAction
{
  return 0;
}

- (void)setRadarComponentID:(id)a3 name:(id)a4 version:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = (NSString *)[a3 copy];
  radarComponentID = self->_radarComponentID;
  self->_radarComponentID = v10;

  uint64_t v12 = (NSString *)[v9 copy];
  radarComponentName = self->_radarComponentName;
  self->_radarComponentName = v12;

  int v14 = (NSString *)[v8 copy];
  radarComponentVersion = self->_radarComponentVersion;
  self->_radarComponentVersion = v14;
}

- (PUErrorPresentationController)initWithErrors:(id)a3 forAssets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUErrorPresentationController;
  id v8 = [(PUErrorPresentationController *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    errors = v8->_errors;
    v8->_errors = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    assets = v8->_assets;
    v8->_assets = (NSArray *)v11;

    uint64_t v13 = PULocalizedString(@"OK");
    dismissButtonTitle = v8->_dismissButtonTitle;
    v8->_dismissButtonTitle = (NSString *)v13;
  }
  return v8;
}

+ (BOOL)assetIsStandardVideo:(id)a3
{
  return [a3 playbackStyle] == 4;
}

+ (BOOL)errorIsAuthenticationRelatedCPLError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  uint64_t v5 = getCPLErrorDomain();
  if ([v4 isEqualToString:v5]) {
    BOOL v6 = [v3 code] == 1006;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)errorIsLowDiskSpaceRelatedCPLError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  uint64_t v5 = getCPLErrorDomain();
  if ([v4 isEqualToString:v5]) {
    BOOL v6 = [v3 code] == 1005;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)isNetworkRelatedError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F39800]] && objc_msgSend(v3, "code") == 3169)
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v6 = [v3 domain];
    if ([v6 isEqualToString:*MEMORY[0x1E4F289A0]]) {
      BOOL v5 = [v3 code] == -1009;
    }
    else {
      BOOL v5 = 0;
    }
  }
  return v5;
}

+ (id)alertActionForNavigatingToDestination:(int64_t)a3 withTitle:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x1E4FB1410];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__PUErrorPresentationController_alertActionForNavigatingToDestination_withTitle_completion___block_invoke;
  v12[3] = &unk_1E5F22A68;
  id v13 = v7;
  int64_t v14 = a3;
  id v9 = v7;
  uint64_t v10 = [v8 actionWithTitle:a4 style:0 handler:v12];

  return v10;
}

void __92__PUErrorPresentationController_alertActionForNavigatingToDestination_withTitle_completion___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F907F0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __92__PUErrorPresentationController_alertActionForNavigatingToDestination_withTitle_completion___block_invoke_2;
  v3[3] = &unk_1E5F2DB20;
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  [v1 navigateToDestination:v2 completion:v3];
}

uint64_t __92__PUErrorPresentationController_alertActionForNavigatingToDestination_withTitle_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end
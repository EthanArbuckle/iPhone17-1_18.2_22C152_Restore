@interface SSScreenCaptureAbilityCheck
+ (id)abilityCheck;
- (BOOL)isAbleToTakeScreenshots;
- (NSString)reasonForNotBeingAbleToTakeScreenshots;
- (void)setIsAbleToTakeScreenshots:(BOOL)a3;
- (void)setReasonForNotBeingAbleToTakeScreenshots:(id)a3;
@end

@implementation SSScreenCaptureAbilityCheck

+ (id)abilityCheck
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setIsAbleToTakeScreenshots:1];
  [v2 setReasonForNotBeingAbleToTakeScreenshots:0];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v3 = (void *)getMCProfileConnectionClass_softClass;
  v23 = (void *)getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __getMCProfileConnectionClass_block_invoke;
    v18 = &unk_2644ED6B8;
    v19 = &v20;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&v15);
    v3 = (void *)v21[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v20, 8);
  v5 = [v4 sharedConnection];
  char v6 = [v5 isScreenShotAllowed];

  if ((v6 & 1) == 0)
  {
    [v2 setIsAbleToTakeScreenshots:0];
    [v2 setReasonForNotBeingAbleToTakeScreenshots:@"Disallowed from ManagedConfiguration"];
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  v7 = (int (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  v23 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    v18 = &unk_2644ED6B8;
    v19 = &v20;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke((uint64_t)&v15);
    v7 = (int (*)(void))v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v7)
  {
    -[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:]();
    goto LABEL_25;
  }
  if (v7() <= 0)
  {
    [v2 setIsAbleToTakeScreenshots:0];
    [v2 setReasonForNotBeingAbleToTakeScreenshots:@"Device has not done first unlock"];
  }
  v8 = [getUMUserManagerClass() sharedManager];
  if ([v8 isSharedIPad])
  {
    v9 = [getUMUserManagerClass() sharedManager];
    v10 = [v9 currentUser];
    int v11 = [v10 isLoginUser];

    if (v11)
    {
      [v2 setIsAbleToTakeScreenshots:0];
      [v2 setReasonForNotBeingAbleToTakeScreenshots:@"Device is at the login window"];
    }
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  v12 = (unsigned int (*)(void))getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  v23 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke;
    v18 = &unk_2644ED6B8;
    v19 = &v20;
    __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke((uint64_t)&v15);
    v12 = (unsigned int (*)(void))v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v12)
  {
LABEL_25:
    v14 = (_Unwind_Exception *)-[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:]();
    _Block_object_dispose(&v20, 8);
    _Unwind_Resume(v14);
  }
  if (v12())
  {
    [v2 setIsAbleToTakeScreenshots:0];
    [v2 setReasonForNotBeingAbleToTakeScreenshots:@"Device has not gone through Buddy"];
  }
  if (MGGetBoolAnswer() && _SSShouldIgnoreAbilityCheck())
  {
    [v2 setIsAbleToTakeScreenshots:1];
    [v2 setReasonForNotBeingAbleToTakeScreenshots:0];
  }

  return v2;
}

- (BOOL)isAbleToTakeScreenshots
{
  return self->_isAbleToTakeScreenshots;
}

- (void)setIsAbleToTakeScreenshots:(BOOL)a3
{
  self->_isAbleToTakeScreenshots = a3;
}

- (NSString)reasonForNotBeingAbleToTakeScreenshots
{
  return self->_reasonForNotBeingAbleToTakeScreenshots;
}

- (void)setReasonForNotBeingAbleToTakeScreenshots:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
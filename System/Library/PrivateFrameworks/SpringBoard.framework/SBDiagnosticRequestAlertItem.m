@interface SBDiagnosticRequestAlertItem
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowInLockScreen;
- (NSArray)radarAttachments;
- (NSArray)radarKeywordIDs;
- (NSNumber)radarComponentID;
- (NSString)message;
- (NSString)radarComponentName;
- (NSString)radarComponentVersion;
- (NSString)radarDescription;
- (NSString)radarTitle;
- (NSString)title;
- (id)_noButtonTitle;
- (id)_stringFromClassification:(int64_t)a3;
- (id)_stringFromReproducibility:(int64_t)a3;
- (id)_yesButtonTitle;
- (id)completionBlock;
- (int64_t)radarClassification;
- (int64_t)radarReproducibility;
- (void)_fileRadar;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)setCompletionBlock:(id)a3;
- (void)setMessage:(id)a3;
- (void)setRadarAttachments:(id)a3;
- (void)setRadarClassification:(int64_t)a3;
- (void)setRadarComponentID:(id)a3;
- (void)setRadarComponentName:(id)a3;
- (void)setRadarComponentVersion:(id)a3;
- (void)setRadarDescription:(id)a3;
- (void)setRadarKeywordIDs:(id)a3;
- (void)setRadarReproducibility:(int64_t)a3;
- (void)setRadarTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SBDiagnosticRequestAlertItem

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v6 = [(SBAlertItem *)self alertController];
  v7 = [(SBDiagnosticRequestAlertItem *)self title];
  uint64_t v8 = [(SBDiagnosticRequestAlertItem *)self message];
  v9 = (void *)v8;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"SBDiagnosticRequestAlertItem.m" lineNumber:25 description:@"The title for an SBDiagnosticRequestAlertItem cannot be nil."];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SBDiagnosticRequestAlertItem.m" lineNumber:26 description:@"The message for an SBDiagnosticRequestAlertItem cannot be nil."];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  [v6 setTitle:v7];
  [v6 setMessage:v9];
  v10 = (void *)MEMORY[0x1E4F42720];
  v11 = [(SBDiagnosticRequestAlertItem *)self _yesButtonTitle];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__SBDiagnosticRequestAlertItem_configure_requirePasscodeForActions___block_invoke;
  v19[3] = &unk_1E6AF4918;
  v19[4] = self;
  v12 = [v10 actionWithTitle:v11 style:0 handler:v19];

  [v6 addAction:v12];
  v13 = (void *)MEMORY[0x1E4F42720];
  v14 = [(SBDiagnosticRequestAlertItem *)self _noButtonTitle];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__SBDiagnosticRequestAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v18[3] = &unk_1E6AF4918;
  v18[4] = self;
  v15 = [v13 actionWithTitle:v14 style:1 handler:v18];

  [v6 addAction:v15];
}

uint64_t __68__SBDiagnosticRequestAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fileRadar];
}

void __68__SBDiagnosticRequestAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) deactivateForButton];
  v2 = [*(id *)(a1 + 32) completionBlock];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) completionBlock];
    v3[2]();
  }
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)reappearsAfterUnlock
{
  return 1;
}

- (BOOL)reappearsAfterLock
{
  return 1;
}

- (id)_yesButtonTitle
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"RADAR_REQUEST_BUTTON" value:&stru_1F3084718 table:@"SpringBoard"];

  return v3;
}

- (id)_noButtonTitle
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"RADAR_REQUEST_CANCEL" value:&stru_1F3084718 table:@"SpringBoard"];

  return v3;
}

- (void)_fileRadar
{
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 bundleIdentifier];

  v5 = +[SBPlatformController sharedInstance];
  int v6 = [v5 isInternalInstall];

  if (v6)
  {
    v43 = v4;
    v41 = [NSString stringWithFormat:@"tap-to-radar://new"];
    v42 = objc_msgSend(MEMORY[0x1E4F29088], "componentsWithString:");
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = [(SBDiagnosticRequestAlertItem *)self radarTitle];
    v45 = [(SBDiagnosticRequestAlertItem *)self radarDescription];
    v44 = [(SBDiagnosticRequestAlertItem *)self radarAttachments];
    v9 = [(SBDiagnosticRequestAlertItem *)self radarKeywordIDs];
    int64_t v10 = [(SBDiagnosticRequestAlertItem *)self radarClassification];
    int64_t v11 = [(SBDiagnosticRequestAlertItem *)self radarReproducibility];
    v12 = [(SBDiagnosticRequestAlertItem *)self radarComponentName];
    v13 = [(SBDiagnosticRequestAlertItem *)self radarComponentVersion];
    v14 = [(SBDiagnosticRequestAlertItem *)self radarComponentID];
    if (!v14) {
      v14 = &unk_1F334B0F0;
    }
    v15 = (void *)MEMORY[0x1E4F290C8];
    v40 = v14;
    v16 = [v14 stringValue];
    v17 = [v15 queryItemWithName:@"ComponentID" value:v16];
    [v7 addObject:v17];

    if (v12 && v13)
    {
      v18 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentName" value:v12];
      [v7 addObject:v18];

      v19 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentVersion" value:v13];
      [v7 addObject:v19];
    }
    if ([v8 length])
    {
      v20 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Title" value:v8];
      [v7 addObject:v20];
    }
    if ([v45 length])
    {
      v21 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Description" value:v45];
      [v7 addObject:v21];
    }
    if (v10)
    {
      v22 = (void *)MEMORY[0x1E4F290C8];
      v23 = [(SBDiagnosticRequestAlertItem *)self _stringFromClassification:v10];
      v24 = [v22 queryItemWithName:@"Classification" value:v23];
      [v7 addObject:v24];
    }
    if (v11)
    {
      v25 = (void *)MEMORY[0x1E4F290C8];
      v26 = [(SBDiagnosticRequestAlertItem *)self _stringFromReproducibility:v11];
      v27 = [v25 queryItemWithName:@"Reproducibility" value:v26];
      [v7 addObject:v27];
    }
    if ([v44 count])
    {
      v28 = objc_msgSend(v44, "bs_map:", &__block_literal_global_329);
      v29 = [v28 componentsJoinedByString:@","];
      v30 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Attachments" value:v29];
      [v7 addObject:v30];
    }
    if ([v9 count])
    {
      v31 = objc_msgSend(v9, "bs_map:", &__block_literal_global_61_2);
      v32 = [v31 componentsJoinedByString:@","];
      v33 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Keywords" value:v32];
      [v7 addObject:v33];
    }
    [v42 setQueryItems:v7];
    v34 = [v42 URL];
    v35 = [v34 absoluteString];

    v4 = v43;
  }
  else
  {
    v35 = [NSString stringWithFormat:@"applefeedback://new?bundleID=%@", v4];
  }
  v36 = [MEMORY[0x1E4F1CB10] URLWithString:v35];
  [(SBAlertItem *)self deactivateForButton];
  v37 = objc_alloc_init(SBLockScreenUnlockRequest);
  [(SBLockScreenUnlockRequest *)v37 setSource:24];
  [(SBLockScreenUnlockRequest *)v37 setIntent:2];
  [(SBLockScreenUnlockRequest *)v37 setName:@"Diagnostic Request Unlock"];
  [(SBLockScreenUnlockRequest *)v37 setWantsBiometricPresentation:0];
  v38 = +[SBLockScreenManager sharedInstance];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __42__SBDiagnosticRequestAlertItem__fileRadar__block_invoke_3;
  v46[3] = &unk_1E6AF4A98;
  id v47 = v36;
  v48 = self;
  id v39 = v36;
  [v38 unlockWithRequest:v37 completion:v46];
}

uint64_t __42__SBDiagnosticRequestAlertItem__fileRadar__block_invoke(uint64_t a1, void *a2)
{
  return [a2 path];
}

uint64_t __42__SBDiagnosticRequestAlertItem__fileRadar__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

void __42__SBDiagnosticRequestAlertItem__fileRadar__block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    SBWorkspaceActivateApplicationFromURL(*(void **)(a1 + 32), 0, &__block_literal_global_76_2);
    v3 = [*(id *)(a1 + 40) completionBlock];

    if (v3)
    {
      v4 = [*(id *)(a1 + 40) completionBlock];
      v4[2]();
    }
  }
}

uint64_t __42__SBDiagnosticRequestAlertItem__fileRadar__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setSource:13];
}

- (id)_stringFromClassification:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9) {
    return 0;
  }
  else {
    return off_1E6B0A660[a3 - 1];
  }
}

- (id)_stringFromReproducibility:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return off_1E6B0A6B0[a3 - 1];
  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (void)setRadarTitle:(id)a3
{
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
}

- (NSNumber)radarComponentID
{
  return self->_radarComponentID;
}

- (void)setRadarComponentID:(id)a3
{
}

- (NSString)radarComponentName
{
  return self->_radarComponentName;
}

- (void)setRadarComponentName:(id)a3
{
}

- (NSString)radarComponentVersion
{
  return self->_radarComponentVersion;
}

- (void)setRadarComponentVersion:(id)a3
{
}

- (NSArray)radarKeywordIDs
{
  return self->_radarKeywordIDs;
}

- (void)setRadarKeywordIDs:(id)a3
{
}

- (NSArray)radarAttachments
{
  return self->_radarAttachments;
}

- (void)setRadarAttachments:(id)a3
{
}

- (int64_t)radarClassification
{
  return self->_radarClassification;
}

- (void)setRadarClassification:(int64_t)a3
{
  self->_radarClassification = a3;
}

- (int64_t)radarReproducibility
{
  return self->_radarReproducibility;
}

- (void)setRadarReproducibility:(int64_t)a3
{
  self->_radarReproducibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarAttachments, 0);
  objc_storeStrong((id *)&self->_radarKeywordIDs, 0);
  objc_storeStrong((id *)&self->_radarComponentVersion, 0);
  objc_storeStrong((id *)&self->_radarComponentName, 0);
  objc_storeStrong((id *)&self->_radarComponentID, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
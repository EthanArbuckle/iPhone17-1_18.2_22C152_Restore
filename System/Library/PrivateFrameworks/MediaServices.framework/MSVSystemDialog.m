@interface MSVSystemDialog
+ (id)systemDialogWithOptions:(id)a3;
- (MSVSystemDialog)initWithCFUserNotification:(__CFUserNotification *)a3;
- (MSVSystemDialog)initWithOptions:(id)a3;
- (MSVSystemDialogOptions)options;
- (NSArray)textFields;
- (__CFRunLoopSource)activeRunLoopSource;
- (__CFUserNotification)presentedUserNotification;
- (id)pendingCompletion;
- (void)addTextField:(id)a3;
- (void)addTextFieldWithTitle:(id)a3 secure:(BOOL)a4;
- (void)clearTextFields;
- (void)dealloc;
- (void)dismiss;
- (void)presentWithCompletion:(id)a3;
- (void)setActiveRunLoopSource:(__CFRunLoopSource *)a3;
- (void)setPendingCompletion:(id)a3;
- (void)setPresentedUserNotification:(__CFUserNotification *)a3;
@end

@implementation MSVSystemDialog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_pendingCompletion, 0);
  objc_storeStrong((id *)&self->_textFields, 0);
}

- (NSArray)textFields
{
  return &self->_textFields->super;
}

- (MSVSystemDialogOptions)options
{
  return self->_options;
}

- (void)dismiss
{
  presentedUserNotification = self->_presentedUserNotification;
  if (presentedUserNotification) {
    CFUserNotificationCancel(presentedUserNotification);
  }
}

- (void)presentWithCompletion:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 3;
  preparedUserNotification = self->_preparedUserNotification;
  if (preparedUserNotification)
  {
    v6 = (__CFUserNotification *)CFRetain(preparedUserNotification);
    goto LABEL_51;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8 = [(MSVSystemDialogOptions *)self->_options alertHeader];

  if (v8)
  {
    v9 = [(MSVSystemDialogOptions *)self->_options alertHeader];
    [v7 setObject:v9 forKey:*MEMORY[0x1E4F1D990]];
  }
  v10 = [(MSVSystemDialogOptions *)self->_options alertMessage];

  if (v10)
  {
    v11 = [(MSVSystemDialogOptions *)self->_options alertMessage];
    [v7 setObject:v11 forKey:*MEMORY[0x1E4F1D9A8]];
  }
  v12 = [(MSVSystemDialogOptions *)self->_options alertIconURL];

  if (v12)
  {
    v13 = [(MSVSystemDialogOptions *)self->_options alertIconURL];
    [v7 setObject:v13 forKey:*MEMORY[0x1E4F1D9E8]];
  }
  v14 = [(MSVSystemDialogOptions *)self->_options defaultButtonTitle];

  if (v14)
  {
    v15 = [(MSVSystemDialogOptions *)self->_options defaultButtonTitle];
    [v7 setObject:v15 forKey:*MEMORY[0x1E4F1D9E0]];
  }
  v16 = [(MSVSystemDialogOptions *)self->_options alternateButtonTitle];

  if (v16)
  {
    v17 = [(MSVSystemDialogOptions *)self->_options alternateButtonTitle];
    [v7 setObject:v17 forKey:*MEMORY[0x1E4F1D9D0]];
  }
  if ([(MSVSystemDialogOptions *)self->_options showAsTopmost]) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1D9B8]];
  }
  if ([(MSVSystemDialogOptions *)self->_options forceModalAlertAppearance])
  {
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    v18 = (id *)getSBUserNotificationForcesModalAlertAppearanceSymbolLoc_ptr;
    uint64_t v74 = getSBUserNotificationForcesModalAlertAppearanceSymbolLoc_ptr;
    if (!getSBUserNotificationForcesModalAlertAppearanceSymbolLoc_ptr)
    {
      uint64_t v66 = MEMORY[0x1E4F143A8];
      uint64_t v67 = 3221225472;
      v68 = __getSBUserNotificationForcesModalAlertAppearanceSymbolLoc_block_invoke;
      v69 = &unk_1E5ADA318;
      v70 = &v71;
      v19 = SpringBoardServicesLibrary();
      v20 = dlsym(v19, "SBUserNotificationForcesModalAlertAppearance");
      *(void *)(v70[1] + 24) = v20;
      getSBUserNotificationForcesModalAlertAppearanceSymbolLoc_ptr = *(void *)(v70[1] + 24);
      v18 = (id *)v72[3];
    }
    _Block_object_dispose(&v71, 8);
    if (!v18)
    {
      v49 = [MEMORY[0x1E4F28B00] currentHandler];
      v50 = [NSString stringWithUTF8String:"NSString *getSBUserNotificationForcesModalAlertAppearance(void)"];
      objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, @"MSVSystemDialog.m", 19, @"%s", dlerror());

      goto LABEL_60;
    }
    id v21 = *v18;
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:v21];
  }
  if ([(MSVSystemDialogOptions *)self->_options showOnLockscreen])
  {
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    v22 = (id *)getSBUserNotificationDisplayActionButtonOnLockScreenSymbolLoc_ptr;
    uint64_t v74 = getSBUserNotificationDisplayActionButtonOnLockScreenSymbolLoc_ptr;
    if (!getSBUserNotificationDisplayActionButtonOnLockScreenSymbolLoc_ptr)
    {
      uint64_t v66 = MEMORY[0x1E4F143A8];
      uint64_t v67 = 3221225472;
      v68 = __getSBUserNotificationDisplayActionButtonOnLockScreenSymbolLoc_block_invoke;
      v69 = &unk_1E5ADA318;
      v70 = &v71;
      v23 = SpringBoardServicesLibrary();
      v24 = dlsym(v23, "SBUserNotificationDisplayActionButtonOnLockScreen");
      *(void *)(v70[1] + 24) = v24;
      getSBUserNotificationDisplayActionButtonOnLockScreenSymbolLoc_ptr = *(void *)(v70[1] + 24);
      v22 = (id *)v72[3];
    }
    _Block_object_dispose(&v71, 8);
    if (!v22)
    {
      v51 = [MEMORY[0x1E4F28B00] currentHandler];
      v52 = [NSString stringWithUTF8String:"NSString *getSBUserNotificationDisplayActionButtonOnLockScreen(void)"];
      objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, @"MSVSystemDialog.m", 20, @"%s", dlerror());

      goto LABEL_60;
    }
    id v25 = *v22;
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:v25];
  }
  if ([(MSVSystemDialogOptions *)self->_options dismissOverlaysOnLockscreen])
  {
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    v26 = (id *)getSBUserNotificationDismissesOverlaysInLockScreenSymbolLoc_ptr;
    uint64_t v74 = getSBUserNotificationDismissesOverlaysInLockScreenSymbolLoc_ptr;
    if (!getSBUserNotificationDismissesOverlaysInLockScreenSymbolLoc_ptr)
    {
      uint64_t v66 = MEMORY[0x1E4F143A8];
      uint64_t v67 = 3221225472;
      v68 = __getSBUserNotificationDismissesOverlaysInLockScreenSymbolLoc_block_invoke;
      v69 = &unk_1E5ADA318;
      v70 = &v71;
      v27 = SpringBoardServicesLibrary();
      v28 = dlsym(v27, "SBUserNotificationDismissesOverlaysInLockScreen");
      *(void *)(v70[1] + 24) = v28;
      getSBUserNotificationDismissesOverlaysInLockScreenSymbolLoc_ptr = *(void *)(v70[1] + 24);
      v26 = (id *)v72[3];
    }
    _Block_object_dispose(&v71, 8);
    if (!v26)
    {
      v53 = [MEMORY[0x1E4F28B00] currentHandler];
      v54 = [NSString stringWithUTF8String:"NSString *getSBUserNotificationDismissesOverlaysInLockScreen(void)"];
      objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, @"MSVSystemDialog.m", 21, @"%s", dlerror());

      goto LABEL_60;
    }
    id v29 = *v26;
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:v29];
  }
  v30 = [(MSVSystemDialogOptions *)self->_options allowedApplicationBundleIDs];
  if ([v30 count])
  {
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    v31 = (id *)getSBUserNotificationAllowedApplicationsKeySymbolLoc_ptr;
    uint64_t v74 = getSBUserNotificationAllowedApplicationsKeySymbolLoc_ptr;
    if (!getSBUserNotificationAllowedApplicationsKeySymbolLoc_ptr)
    {
      uint64_t v66 = MEMORY[0x1E4F143A8];
      uint64_t v67 = 3221225472;
      v68 = __getSBUserNotificationAllowedApplicationsKeySymbolLoc_block_invoke;
      v69 = &unk_1E5ADA318;
      v70 = &v71;
      v32 = SpringBoardServicesLibrary();
      v33 = dlsym(v32, "SBUserNotificationAllowedApplicationsKey");
      *(void *)(v70[1] + 24) = v33;
      getSBUserNotificationAllowedApplicationsKeySymbolLoc_ptr = *(void *)(v70[1] + 24);
      v31 = (id *)v72[3];
    }
    _Block_object_dispose(&v71, 8);
    if (v31)
    {
      id v34 = *v31;
      [v7 setObject:v30 forKey:v34];

      goto LABEL_35;
    }
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    v48 = [NSString stringWithUTF8String:"NSString *getSBUserNotificationAllowedApplicationsKey(void)"];
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, @"MSVSystemDialog.m", 22, @"%s", dlerror());

LABEL_60:
    __break(1u);
  }
LABEL_35:
  if ([(NSMutableArray *)self->_textFields count])
  {
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_textFields, "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v36 = self->_textFields;
    uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v58 objects:v75 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v59;
      do
      {
        uint64_t v39 = 0;
        do
        {
          if (*(void *)v59 != v38) {
            objc_enumerationMutation(v36);
          }
          v40 = [*(id *)(*((void *)&v58 + 1) + 8 * v39) title];
          if (v40) {
            [v35 addObject:v40];
          }

          ++v39;
        }
        while (v37 != v39);
        uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v58 objects:v75 count:16];
      }
      while (v37);
    }

    if ([v35 count]) {
      [v7 setObject:v35 forKey:*MEMORY[0x1E4F1DA20]];
    }
  }
  if ([(NSMutableArray *)self->_textFields count])
  {
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    textFields = self->_textFields;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __41__MSVSystemDialog_presentWithCompletion___block_invoke;
    v55[3] = &unk_1E5ADA2A0;
    v57 = &v62;
    id v43 = v41;
    id v56 = v43;
    [(NSMutableArray *)textFields enumerateObjectsUsingBlock:v55];
    [v7 setObject:v43 forKey:*MEMORY[0x1E4F1D9F0]];
  }
  v6 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, v63[3], 0, (CFDictionaryRef)v7);

LABEL_51:
  if (v6)
  {
    v44 = +[MSVSystemDialogManager sharedManager];
    [v44 registerSystemDialog:self forUserNotification:v6];
    RunLoopSource = CFUserNotificationCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, (CFUserNotificationCallBack)_MSVSystemDialogUserNotificationCallback, 0);
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
    CFRelease(RunLoopSource);
    [(MSVSystemDialog *)self setPresentedUserNotification:v6];
    [(MSVSystemDialog *)self setPendingCompletion:v4];
    [(MSVSystemDialog *)self setActiveRunLoopSource:RunLoopSource];
    CFRelease(v6);
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }
  _Block_object_dispose(&v62, 8);
}

void __41__MSVSystemDialog_presentWithCompletion___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if ([v5 isSecure]) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 1 << (a3 + 16);
  }
  uint64_t v6 = [v5 keyboardType];

  if (v6 == 2) {
    unsigned int v7 = 7;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v6 == 3) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = v7;
  }
  v9 = *(void **)(a1 + 32);
  id v10 = [NSNumber numberWithUnsignedInt:v8];
  [v9 addObject:v10];
}

- (void)clearTextFields
{
}

- (void)addTextFieldWithTitle:(id)a3 secure:(BOOL)a4
{
  id v5 = +[MSVSystemDialogTextField textFieldWithTitle:a3 secure:a4];
  [(MSVSystemDialog *)self addTextField:v5];
}

- (void)addTextField:(id)a3
{
}

- (void)setPendingCompletion:(id)a3
{
  self->_pendingCompletion = (id)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)pendingCompletion
{
  v2 = (void *)MEMORY[0x1A62426F0](self->_pendingCompletion, a2);
  return v2;
}

- (void)setActiveRunLoopSource:(__CFRunLoopSource *)a3
{
  activeRunLoopSource = self->_activeRunLoopSource;
  if (activeRunLoopSource)
  {
    CFRunLoopSourceInvalidate(activeRunLoopSource);
    CFRelease(self->_activeRunLoopSource);
  }
  self->_activeRunLoopSource = a3;
  if (a3)
  {
    CFRetain(a3);
  }
}

- (__CFRunLoopSource)activeRunLoopSource
{
  return self->_activeRunLoopSource;
}

- (void)setPresentedUserNotification:(__CFUserNotification *)a3
{
  presentedUserNotification = self->_presentedUserNotification;
  if (presentedUserNotification) {
    CFRelease(presentedUserNotification);
  }
  self->_presentedUserNotification = a3;
  if (a3)
  {
    CFRetain(a3);
  }
}

- (__CFUserNotification)presentedUserNotification
{
  return self->_presentedUserNotification;
}

- (void)dealloc
{
  presentedUserNotification = self->_presentedUserNotification;
  if (presentedUserNotification) {
    CFRelease(presentedUserNotification);
  }
  preparedUserNotification = self->_preparedUserNotification;
  if (preparedUserNotification) {
    CFRelease(preparedUserNotification);
  }
  activeRunLoopSource = self->_activeRunLoopSource;
  if (activeRunLoopSource)
  {
    CFRunLoopSourceInvalidate(activeRunLoopSource);
    CFRelease(self->_activeRunLoopSource);
  }
  v6.receiver = self;
  v6.super_class = (Class)MSVSystemDialog;
  [(MSVSystemDialog *)&v6 dealloc];
}

- (MSVSystemDialog)initWithCFUserNotification:(__CFUserNotification *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSVSystemDialog;
  v4 = [(MSVSystemDialog *)&v6 init];
  if (v4) {
    v4->_preparedUserNotification = (__CFUserNotification *)CFRetain(a3);
  }
  return v4;
}

- (MSVSystemDialog)initWithOptions:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSVSystemDialog;
  objc_super v6 = [(MSVSystemDialog *)&v11 init];
  unsigned int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    textFields = v7->_textFields;
    v7->_textFields = v8;
  }
  return v7;
}

+ (id)systemDialogWithOptions:(id)a3
{
  id v3 = a3;
  v4 = [[MSVSystemDialog alloc] initWithOptions:v3];

  return v4;
}

@end
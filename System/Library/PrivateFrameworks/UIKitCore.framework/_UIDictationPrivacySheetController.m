@interface _UIDictationPrivacySheetController
- (BOOL)_canShowWhileLocked;
- (OBPrivacyPresenter)privacyPresenter;
- (VTUIDictationDataSharingOptInPresenter)dataSharingOptInPresenter;
- (_UIDictationPrivacySheetController)initWithType:(int64_t)a3;
- (_UIDictationPrivacySheetControllerDelegate)privacyDelegate;
- (int64_t)sheetType;
- (void)dismiss;
- (void)setDataSharingOptInPresenter:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setPrivacyDelegate:(id)a3;
- (void)setPrivacyPresenter:(id)a3;
- (void)setSheetType:(int64_t)a3;
@end

@implementation _UIDictationPrivacySheetController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIDictationPrivacySheetController)initWithType:(int64_t)a3
{
  v6 = objc_alloc_init(UIViewController);
  if (!v6)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"UIDictationController.m" lineNumber:1331 description:@"Failed to create UIViewController"];
  }
  v23.receiver = self;
  v23.super_class = (Class)_UIDictationPrivacySheetController;
  v7 = [(UINavigationController *)&v23 initWithRootViewController:v6];
  if (v7)
  {
    if (+[UIDictationUtilities _isUsingLargeFormatDictationUI])
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = 2;
    }
    +[UIDictationUtilities _isUsingLargeFormatDictationUI];
    [(UIViewController *)v7 setModalPresentationStyle:v8];
    v7->_sheetType = a3;
    if (a3 == 1)
    {
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x2050000000;
      v9 = (void *)qword_1EB25AA70;
      uint64_t v32 = qword_1EB25AA70;
      if (!qword_1EB25AA70)
      {
        id location = (id)MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        v26 = __getOBPrivacyPresenterClass_block_invoke;
        v27 = &unk_1E52D9900;
        v28 = &v29;
        __getOBPrivacyPresenterClass_block_invoke((uint64_t)&location);
        v9 = (void *)v30[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v29, 8);
      uint64_t v11 = [v10 presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.siri"];
      privacyPresenter = v7->_privacyPresenter;
      v7->_privacyPresenter = (OBPrivacyPresenter *)v11;

      objc_initWeak(&location, v7);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __51___UIDictationPrivacySheetController_initWithType___block_invoke;
      v21[3] = &unk_1E52DC308;
      objc_copyWeak(&v22, &location);
      [(OBPrivacyPresenter *)v7->_privacyPresenter setDismissHandler:v21];
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x2050000000;
      v13 = (void *)qword_1EB25AA80;
      uint64_t v32 = qword_1EB25AA80;
      if (!qword_1EB25AA80)
      {
        id location = (id)MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        v26 = __getVTUIDictationDataSharingOptInPresenterClass_block_invoke;
        v27 = &unk_1E52D9900;
        v28 = &v29;
        __getVTUIDictationDataSharingOptInPresenterClass_block_invoke((uint64_t)&location);
        v13 = (void *)v30[3];
      }
      v14 = v13;
      _Block_object_dispose(&v29, 8);
      v15 = (VTUIDictationDataSharingOptInPresenter *)objc_alloc_init(v14);
      dataSharingOptInPresenter = v7->_dataSharingOptInPresenter;
      v7->_dataSharingOptInPresenter = v15;

      v17 = [(VTUIDictationDataSharingOptInPresenter *)v7->_dataSharingOptInPresenter dataSharingOptInView];
      v18 = [(UIViewController *)v6 view];
      [v18 addSubview:v17];
    }
  }

  return v7;
}

- (void)dismiss
{
  v3 = [(_UIDictationPrivacySheetController *)self privacyDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_UIDictationPrivacySheetController *)self privacyDelegate];
    [v5 dictationPrivacySheetControllerDidFinish:self];
  }
}

- (void)setPresentationDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDictationPrivacySheetController *)self dataSharingOptInPresenter];
  [v5 setPresentationDelegate:v4];
}

- (_UIDictationPrivacySheetControllerDelegate)privacyDelegate
{
  return self->_privacyDelegate;
}

- (void)setPrivacyDelegate:(id)a3
{
  self->_privacyDelegate = (_UIDictationPrivacySheetControllerDelegate *)a3;
}

- (OBPrivacyPresenter)privacyPresenter
{
  return self->_privacyPresenter;
}

- (void)setPrivacyPresenter:(id)a3
{
}

- (int64_t)sheetType
{
  return self->_sheetType;
}

- (void)setSheetType:(int64_t)a3
{
  self->_sheetType = a3;
}

- (VTUIDictationDataSharingOptInPresenter)dataSharingOptInPresenter
{
  return self->_dataSharingOptInPresenter;
}

- (void)setDataSharingOptInPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSharingOptInPresenter, 0);
  objc_storeStrong((id *)&self->_privacyPresenter, 0);
}

@end
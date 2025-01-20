@interface DBSListControllerAppearanceProvider
- (void)listController:(id)a3 updateSectionContentInsetAnimated:(BOOL)a4 isRegularWidth:(BOOL)a5 contentInsetInitialized:(BOOL)a6 contentInsetInitializedApplicator:(id)a7;
@end

@implementation DBSListControllerAppearanceProvider

- (void)listController:(id)a3 updateSectionContentInsetAnimated:(BOOL)a4 isRegularWidth:(BOOL)a5 contentInsetInitialized:(BOOL)a6 contentInsetInitializedApplicator:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  v12 = (void (**)(void))a7;
  v13 = (void *)MEMORY[0x263F82670];
  id v14 = a3;
  v15 = [v13 currentDevice];
  char v16 = objc_msgSend(v15, "sf_isiPad");

  if ((v16 & 1) != 0 || v8)
  {
    v26.receiver = self;
    v26.super_class = (Class)DBSListControllerAppearanceProvider;
    [(PSListControllerDefaultAppearanceProvider *)&v26 listController:v14 updateSectionContentInsetAnimated:v9 isRegularWidth:v8 contentInsetInitialized:v7 contentInsetInitializedApplicator:v12];
  }
  else
  {
    double v17 = *MEMORY[0x263F839B8];
    v18 = [v14 table];

    if (v9 && v7)
    {
      objc_msgSend(v18, "_setSectionContentInset:", v17, v17, v17, v17);
      id v14 = v18;
    }
    else
    {
      v19 = (void *)MEMORY[0x263F82E00];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __161__DBSListControllerAppearanceProvider_listController_updateSectionContentInsetAnimated_isRegularWidth_contentInsetInitialized_contentInsetInitializedApplicator___block_invoke;
      v20[3] = &unk_264C7A6D8;
      id v14 = v18;
      id v21 = v14;
      double v22 = v17;
      double v23 = v17;
      double v24 = v17;
      double v25 = v17;
      [v19 performWithoutAnimation:v20];
      v12[2](v12);
    }
  }
}

uint64_t __161__DBSListControllerAppearanceProvider_listController_updateSectionContentInsetAnimated_isRegularWidth_contentInsetInitialized_contentInsetInitializedApplicator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSectionContentInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end
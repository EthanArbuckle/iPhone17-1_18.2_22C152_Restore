@interface PXRetailExperienceManager
+ (__CFData)generateSVGDataFromURL:(__CFURL *)a3;
- (UIViewController)retailViewController;
- (void)dismissRetailExperienceView;
- (void)presentRetailExperienceView;
- (void)setRetailViewController:(id)a3;
- (void)showRetailExperienceCard;
@end

@implementation PXRetailExperienceManager

+ (__CFData)generateSVGDataFromURL:(__CFURL *)a3
{
  v4 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  char v14 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  v6 = (char *)getACCBakerDataVersion2SymbolLoc_ptr;
  v23 = (void *)getACCBakerDataVersion2SymbolLoc_ptr;
  if (!getACCBakerDataVersion2SymbolLoc_ptr)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __getACCBakerDataVersion2SymbolLoc_block_invoke;
    v18 = &unk_1E5DD2B08;
    v19 = &v20;
    v7 = ACCBakerLibrary();
    v21[3] = (uint64_t)dlsym(v7, "ACCBakerDataVersion2");
    getACCBakerDataVersion2SymbolLoc_ptr = *(void *)(v19[1] + 24);
    v6 = (char *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (v6)
  {
    char v14 = *v6;
    uint64_t v13 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    v8 = (uint64_t (*)(__CFURL *, BOOL, char *, uint64_t *))getACCBakerCreateSymbolLoc_ptr;
    v23 = getACCBakerCreateSymbolLoc_ptr;
    if (!getACCBakerCreateSymbolLoc_ptr)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __getACCBakerCreateSymbolLoc_block_invoke;
      v18 = &unk_1E5DD2B08;
      v19 = &v20;
      v9 = ACCBakerLibrary();
      v21[3] = (uint64_t)dlsym(v9, "ACCBakerCreate");
      getACCBakerCreateSymbolLoc_ptr = *(_UNKNOWN **)(v19[1] + 24);
      v8 = (uint64_t (*)(__CFURL *, BOOL, char *, uint64_t *))v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (v8) {
      return (__CFData *)v8(a3, v5 == 2, &v14, &v13);
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = objc_msgSend(NSString, "stringWithUTF8String:", "CFDataRef softlink_ACCBakerCreate(CFURLRef _Nonnull, const size_t, ACCBakerDataVersion * _Nullable, CFErrorRef  _Nullable * _Nullable)");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXRetailExperienceManager.m", 26, @"%s", dlerror(), v13);
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = [NSString stringWithUTF8String:"ACCBakerDataVersion getACCBakerDataVersion2(void)"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXRetailExperienceManager.m", 27, @"%s", dlerror(), v13);
  }

  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)setRetailViewController:(id)a3
{
}

- (UIViewController)retailViewController
{
  return self->_retailViewController;
}

- (void)dismissRetailExperienceView
{
  id v2 = [(PXRetailExperienceManager *)self retailViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)presentRetailExperienceView
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PXRetailExperienceManager_presentRetailExperienceView__block_invoke;
  v6[3] = &unk_1E5DD36F8;
  v6[4] = self;
  v3 = +[PXRetailExperienceInterface createRetailExperienceViewController:v6];
  [(PXRetailExperienceManager *)self setRetailViewController:v3];
  v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v5 = objc_msgSend(v4, "px_firstKeyWindow");
  objc_msgSend(v5, "pl_presentViewController:animated:", v3, 1);
}

uint64_t __56__PXRetailExperienceManager_presentRetailExperienceView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissRetailExperienceView];
}

- (void)showRetailExperienceCard
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__PXRetailExperienceManager_showRetailExperienceCard__block_invoke;
  v3[3] = &unk_1E5DC6AF0;
  v3[4] = self;
  id v2 = +[PXToast show:v3];
}

void __53__PXRetailExperienceManager_showRetailExperienceCard__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [PXRetailExperienceCardView alloc];
  uint64_t v5 = -[PXRetailExperienceCardView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = PXLocalizedStringFromTable(@"PXRetailExperienceCardTitle", @"PhotosUICore");
  [(PXRetailExperienceCardView *)v5 setTitle:v6];

  v7 = PXLocalizedStringFromTable(@"PXRetailExperienceCardMessage", @"PhotosUICore");
  [(PXRetailExperienceCardView *)v5 setMessage:v7];

  v8 = PXLocalizedStringFromTable(@"PXContinue", @"PhotosUICore");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__PXRetailExperienceManager_showRetailExperienceCard__block_invoke_2;
  v9[3] = &unk_1E5DD36F8;
  v9[4] = *(void *)(a1 + 32);
  [(PXRetailExperienceCardView *)v5 addActionWithTitle:v8 action:v9];

  [v3 setContentView:v5];
  [v3 setAutoDismissalDelay:180.0];
  [v3 setCanSwipeToDismiss:1];
  [v3 setBottomMargin:5.0];
}

uint64_t __53__PXRetailExperienceManager_showRetailExperienceCard__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentRetailExperienceView];
}

@end
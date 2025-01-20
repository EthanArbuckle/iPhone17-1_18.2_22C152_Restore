@interface NTKGreenfieldB640ContentViewController
- (CGSize)cellSize;
- (NTKGreenfieldB640ContentViewControllerDelegate)greenfieldB640delegate;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)_defaultBandNameForCurrentPairedDevice;
- (id)_subtitleForError:(id)a3;
- (id)_titleForError:(id)a3;
- (id)alternateButtonTitle;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)detailString;
- (id)initForAddWatchFacesStateWithGreenfieldB640Model:(id)a3;
- (id)initForErrorStateWithGreenfieldB640Model:(id)a3;
- (id)suggestedButtonTitle;
- (id)titleString;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_didTapShowInternalErrorButton;
- (void)_notifyDelegateOfActionEventWatchFaceSelected:(id)a3;
- (void)_presentErrorAlert;
- (void)_setupContentForAddWathFaceWithBandImagePath:(id)a3 bundle:(id)a4;
- (void)_setupViews;
- (void)_updateSelectedState:(BOOL)a3 forCellAtIndexPath:(id)a4;
- (void)alternateButtonPressed:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)handleWatchFaceSelectedAtIndex:(int64_t)a3;
- (void)handleWatchFaceSelectedWithError:(id)a3;
- (void)setCellSize:(CGSize)a3;
- (void)setGreenfieldB640delegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NTKGreenfieldB640ContentViewController

- (id)initForAddWatchFacesStateWithGreenfieldB640Model:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKGreenfieldB640ContentViewController;
  v6 = [(NTKGreenfieldB640ContentViewController *)&v11 initWithTitle:&stru_1F1635E90 detailText:0 icon:0 contentLayout:3];
  v7 = v6;
  if (v6)
  {
    v6->_state = 0;
    [(BPSWelcomeOptinViewController *)v6 setStyle:10];
    objc_storeStrong((id *)&v7->_greenfieldB640Model, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.NanoTimeKit.NTKGreenfieldB640ContentViewControllerDecodeBandImage.queue", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (id)initForErrorStateWithGreenfieldB640Model:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NTKGreenfieldB640ContentViewController;
  v6 = [(NTKGreenfieldB640ContentViewController *)&v28 initWithTitle:&stru_1F1635E90 detailText:0 icon:0 contentLayout:3];
  v7 = v6;
  if (v6)
  {
    p_greenfieldB640Model = (id *)&v6->_greenfieldB640Model;
    objc_storeStrong((id *)&v6->_greenfieldB640Model, a3);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.NanoTimeKit.NTKGreenfieldB640ContentViewControllerDecodeBandImage.queue", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v9;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    objc_super v11 = objc_msgSend(*p_greenfieldB640Model, "watchFaceModels", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = [*(id *)(*((void *)&v24 + 1) + 8 * i) decodedRecipe];
          v16 = [v15 watchFace];

          if (!v16)
          {
            LOBYTE(v12) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    v17 = [*p_greenfieldB640Model watchFaceModels];
    uint64_t v18 = [v17 count];

    if ((v12 & 1) != 0 || !v18)
    {
      v7->_state = 2;
    }
    else
    {
      v7->_state = 1;
      if (NTKInternalBuild(v19, v20, v21, v22)) {
        [(BPSWelcomeOptinViewController *)v7 setStyle:2];
      }
    }
  }

  return v7;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)NTKGreenfieldB640ContentViewController;
  [(BPSWelcomeOptinViewController *)&v8 viewDidLoad];
  if (self->_state == 2)
  {
    [(NTKGreenfieldB640ContentViewController *)self _presentErrorAlert];
  }
  else
  {
    v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    [(NTKGreenfieldB640ContentViewController *)self _notifyDelegateOfActionEventWatchFaceSelected:v3];
    v4 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model bandImagePath];
    id v5 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model bandImageBundle];
    [(NTKGreenfieldB640ContentViewController *)self _setupContentForAddWathFaceWithBandImagePath:v4 bundle:v5];

    v6 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
    v7 = BPSSetupTintColor();
    [v6 setTitleColor:v7 forState:0];
  }
}

- (void)viewDidLayoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)NTKGreenfieldB640ContentViewController;
  [(OBBaseWelcomeController *)&v36 viewDidLayoutSubviews];
  [(UICollectionView *)self->_facesCollectionView frame];
  v3 = [(NTKGreenfieldB640ContentViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  [(NTKGreenfieldB640ContentViewController *)self cellSize];
  double v7 = v6;
  double v8 = 0.0;
  if (!self->_state)
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    int64x2_t v33 = vdupq_n_s64(0x404A000000000000uLL);
    int64x2_t v34 = v33;
    int64x2_t v35 = v33;
    BPSScreenValueGetRelevantValue();
    double v8 = v9;
  }
  -[UICollectionView setFrame:](self->_facesCollectionView, "setFrame:", 0.0, v8, v5, v7, v31, v32, *(_OWORD *)&v33, *(_OWORD *)&v34, *(_OWORD *)&v35);
  [(NTKGreenfieldB640ContentViewController *)self cellSize];
  -[UICollectionViewFlowLayout setItemSize:](self->_collectionViewFlowLayout, "setItemSize:");
  v10 = [(NTKGreenfieldB640ContentViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [(NTKGreenfieldB640ContentViewController *)self scrollView];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  uint64_t v20 = [(NTKGreenfieldB640ContentViewController *)self scrollView];
  [v20 verticalScrollIndicatorInsets];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  long long v27 = [(NTKGreenfieldB640ContentViewController *)self view];
  [v27 safeAreaInsets];
  double v29 = v28;

  uint64_t v30 = [(NTKGreenfieldB640ContentViewController *)self scrollView];
  objc_msgSend(v30, "setVerticalScrollIndicatorInsets:", v29, v22, v24, v26);
}

- (id)titleString
{
  unint64_t state = self->_state;
  if (state == 1)
  {
    double v13 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model error];
    double v12 = [(NTKGreenfieldB640ContentViewController *)self _titleForError:v13];
  }
  else if (state)
  {
    double v12 = 0;
  }
  else
  {
    double v4 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
    uint64_t v5 = [v4 count];

    if (v5 == 1)
    {
      double v6 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
      double v7 = [v6 firstObject];

      double v8 = [v7 decodedRecipe];
      double v9 = [v8 watchFace];
      v10 = [v9 faceSharingName];

      double v11 = NTKClockFaceLocalizedString(@"GREENFIELD_B640_TITLE_WATCH_FACE_MAIN_SCREEN", @"Add %@ Watch Face");
      double v12 = objc_msgSend(NSString, "stringWithFormat:", v11, v10);
    }
    else
    {
      double v12 = NTKClockFaceLocalizedString(@"GREENFIELD_B640_TITLE_MAIN_SCREEN", @"Add Watch Face");
    }
  }
  return v12;
}

- (id)detailString
{
  if (self->_state == 1)
  {
    v3 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model error];
    double v4 = [(NTKGreenfieldB640ContentViewController *)self _subtitleForError:v3];
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (id)suggestedButtonTitle
{
  unint64_t state = self->_state;
  if (state == 1)
  {
    if (NTKInternalBuild(self, a2)) {
      v3 = @"[INTERNAL ONLY: SHOW ERROR]";
    }
    else {
      v3 = 0;
    }
  }
  else if (state)
  {
    v3 = 0;
  }
  else
  {
    NTKClockFaceLocalizedString(@"GREENFIELD_B640_ADD_TO_MY_FACES_BUTTON_TITLE", @"Add to My Faces");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)alternateButtonTitle
{
  if (self->_state)
  {
    v2 = 0;
  }
  else
  {
    v2 = NTKClockFaceLocalizedString(@"GREENFIELD__B640_SKIP_BUTTON_TITLE", @"Skip");
  }
  return v2;
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  unint64_t state = self->_state;
  if (state == 1)
  {
    id v9 = v4;
    int v8 = NTKInternalBuild(v4, v4);
    uint64_t v5 = v9;
    if (!v8) {
      goto LABEL_7;
    }
    [(NTKGreenfieldB640ContentViewController *)self _didTapShowInternalErrorButton];
  }
  else
  {
    if (state) {
      goto LABEL_7;
    }
    id v9 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldB640delegate);
    [WeakRetained greenfieldB640ContentViewController:self handleButtonActionEvent:0];
  }
  uint64_t v5 = v9;
LABEL_7:
}

- (void)alternateButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldB640delegate);
  [WeakRetained greenfieldB640ContentViewController:self handleButtonActionEvent:1];
}

- (void)handleWatchFaceSelectedAtIndex:(int64_t)a3
{
  uint64_t v5 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
  unint64_t v6 = [v5 count];

  if (v6 > a3)
  {
    double v7 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
    id v9 = [v7 objectAtIndex:a3];

    int v8 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
    -[NTKGreenfieldB640ContentViewController _updateSelectedState:forCellAtIndexPath:](self, "_updateSelectedState:forCellAtIndexPath:", [v9 isSelected], v8);
  }
}

- (void)handleWatchFaceSelectedWithError:(id)a3
{
  id v4 = a3;
  id v10 = [(NTKGreenfieldB640ContentViewController *)self _titleForError:v4];
  uint64_t v5 = [(NTKGreenfieldB640ContentViewController *)self _subtitleForError:v4];

  unint64_t v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v10 message:v5 preferredStyle:1];
  double v7 = (void *)MEMORY[0x1E4FB1410];
  int v8 = NTKClockFaceLocalizedString(@"GREENFIELD_B640_ERROR_ALERT_OK_BUTON_TITLE", @"OK");
  id v9 = [v7 actionWithTitle:v8 style:1 handler:0];

  [v6 addAction:v9];
  [(NTKGreenfieldB640ContentViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)_setupContentForAddWathFaceWithBandImagePath:(id)a3 bundle:(id)a4
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__NTKGreenfieldB640ContentViewController__setupContentForAddWathFaceWithBandImagePath_bundle___block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __94__NTKGreenfieldB640ContentViewController__setupContentForAddWathFaceWithBandImagePath_bundle___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = [*(id *)(*(void *)(a1 + 32) + 1280) bandImagePath];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1280) bandImageBundle];
  [v2 imageNamed:v3 inBundle:v4];
  objc_claimAutoreleasedReturnValue();

  uint64_t v5 = [*(id *)(a1 + 32) _defaultBandNameForCurrentPairedDevice];
  NTKImageNamed(v5);
}

uint64_t __94__NTKGreenfieldB640ContentViewController__setupContentForAddWathFaceWithBandImagePath_bundle___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1304), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  return [v2 _setupViews];
}

- (id)_defaultBandNameForCurrentPairedDevice
{
  v2 = [MEMORY[0x1E4F19A30] currentDevice];
  uint64_t v3 = [v2 deviceCategory];
  if ((unint64_t)(v3 - 3) > 2) {
    id v4 = @"default_band_asset";
  }
  else {
    id v4 = off_1E62C0AC8[v3 - 3];
  }

  return v4;
}

- (void)_setupViews
{
  v31[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (UICollectionViewFlowLayout *)objc_opt_new();
  collectionViewFlowLayout = self->_collectionViewFlowLayout;
  self->_collectionViewFlowLayout = v3;

  [(UICollectionViewFlowLayout *)self->_collectionViewFlowLayout setScrollDirection:1];
  [(UICollectionViewFlowLayout *)self->_collectionViewFlowLayout setMinimumInteritemSpacing:4.0];
  id v5 = objc_alloc(MEMORY[0x1E4FB1568]);
  unint64_t v6 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", self->_collectionViewFlowLayout, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  facesCollectionView = self->_facesCollectionView;
  self->_facesCollectionView = v6;

  int v8 = self->_facesCollectionView;
  uint64_t v9 = objc_opt_class();
  id v10 = +[NTKGreenfieldB640CollectionViewCell reuseIdentifier];
  [(UICollectionView *)v8 registerClass:v9 forCellWithReuseIdentifier:v10];

  double v11 = BPSBackgroundColor();
  [(UICollectionView *)self->_facesCollectionView setBackgroundColor:v11];

  [(UICollectionView *)self->_facesCollectionView setDelegate:self];
  [(UICollectionView *)self->_facesCollectionView setDataSource:self];
  [(UICollectionView *)self->_facesCollectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_facesCollectionView setAlwaysBounceHorizontal:0];
  double v12 = [(NTKGreenfieldB640ContentViewController *)self contentView];
  [v12 addSubview:self->_facesCollectionView];

  double v23 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v30 = [(NTKGreenfieldB640ContentViewController *)self contentView];
  double v29 = [v30 topAnchor];
  double v28 = [(UICollectionView *)self->_facesCollectionView topAnchor];
  long long v27 = [v29 constraintEqualToAnchor:v28];
  v31[0] = v27;
  double v26 = [(NTKGreenfieldB640ContentViewController *)self contentView];
  double v25 = [v26 leadingAnchor];
  double v24 = [(UICollectionView *)self->_facesCollectionView leadingAnchor];
  double v13 = [v25 constraintEqualToAnchor:v24];
  v31[1] = v13;
  double v14 = [(NTKGreenfieldB640ContentViewController *)self contentView];
  double v15 = [v14 trailingAnchor];
  double v16 = [(UICollectionView *)self->_facesCollectionView trailingAnchor];
  double v17 = [v15 constraintEqualToAnchor:v16];
  v31[2] = v17;
  double v18 = [(NTKGreenfieldB640ContentViewController *)self contentView];
  uint64_t v19 = [v18 bottomAnchor];
  uint64_t v20 = [(UICollectionView *)self->_facesCollectionView bottomAnchor];
  double v21 = [v19 constraintEqualToAnchor:v20];
  v31[3] = v21;
  double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  [v23 activateConstraints:v22];
}

- (void)_presentErrorAlert
{
  uint64_t v3 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model error];
  id v4 = [(NTKGreenfieldB640ContentViewController *)self _titleForError:v3];

  id v5 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model error];
  unint64_t v6 = [(NTKGreenfieldB640ContentViewController *)self _subtitleForError:v5];

  if (NTKInternalBuild(v7, v8))
  {
    uint64_t v9 = NSString;
    id v10 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model error];
    double v11 = [v9 stringWithFormat:@"\n \n [INTERNAL ONLY] \n Please file a radar and include a sysdiagnose. Error: reason: %@", v10];

    uint64_t v12 = [NSString stringWithFormat:@"%@ %@", v6, v11];

    unint64_t v6 = (void *)v12;
  }
  double v13 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:v6 preferredStyle:1];
  double v14 = (void *)MEMORY[0x1E4FB1410];
  double v15 = NTKClockFaceLocalizedString(@"GREENFIELD_B640_ERROR_ALERT_OK_BUTON_TITLE", @"OK");
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__NTKGreenfieldB640ContentViewController__presentErrorAlert__block_invoke;
  v17[3] = &unk_1E62C0AA8;
  v17[4] = self;
  double v16 = [v14 actionWithTitle:v15 style:1 handler:v17];

  [v13 addAction:v16];
  [(NTKGreenfieldB640ContentViewController *)self presentViewController:v13 animated:1 completion:0];
}

void __60__NTKGreenfieldB640ContentViewController__presentErrorAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1320));
  [WeakRetained greenfieldB640ContentViewController:*(void *)(a1 + 32) handleButtonActionEvent:2];
}

- (void)_notifyDelegateOfActionEventWatchFaceSelected:(id)a3
{
  id v7 = a3;
  id v4 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
  unint64_t v5 = [v7 row];
  if (v5 < [v4 count] && (objc_msgSend(v7, "row") & 0x8000000000000000) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldB640delegate);
    objc_msgSend(WeakRetained, "greenfieldB640ContentViewController:handleWatchFaceSelectedEventAtIndex:", self, objc_msgSend(v7, "row"));
  }
}

- (CGSize)cellSize
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double width = self->_cellSize.width;
  double height = self->_cellSize.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    unint64_t v5 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      uint64_t v9 = &stru_1F1635E90;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          double v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) decodedRecipe];
          uint64_t v12 = [v11 watchFace];
          double v13 = [v12 faceSharingName];

          unint64_t v14 = [v13 length];
          if (v14 > [(__CFString *)v9 length])
          {
            double v15 = v13;

            uint64_t v9 = v15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
    NTKImageNamed(@"default_band_asset");
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  facesCollectionView = self->_facesCollectionView;
  uint64_t v7 = +[NTKGreenfieldB640CollectionViewCell reuseIdentifier];
  uint64_t v8 = [(UICollectionView *)facesCollectionView dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v5];

  unint64_t state = self->_state;
  if (state)
  {
    BOOL v10 = 0;
  }
  else
  {
    double v11 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
    BOOL v10 = (unint64_t)[v11 count] > 1;

    unint64_t state = self->_state;
  }
  uint64_t v12 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
  double v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v5, "row"));

  uint64_t v14 = [v13 isSelected];
  double v15 = [v13 decodedRecipe];
  if (self->_state <= 1)
  {
    uint64_t v16 = state == 1 || v10;
    [v8 prepareCellWithDecodedRecipe:v15 bandImage:self->_watchBandImage shouldPresentFaceName:v16 shouldPresentCheckmark:v10 isSelected:v14];
  }
  long long v17 = BPSBackgroundColor();
  [v8 setBackgroundColor:v17];

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  if (!self->_state) {
    [(NTKGreenfieldB640ContentViewController *)self _notifyDelegateOfActionEventWatchFaceSelected:a4];
  }
}

- (void)_updateSelectedState:(BOOL)a3 forCellAtIndexPath:(id)a4
{
  BOOL v4 = a3;
  id v5 = [(UICollectionView *)self->_facesCollectionView cellForItemAtIndexPath:a4];
  [v5 updateSeletedState:v4];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  BOOL v4 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
  int64_t v5 = [v4 count];

  return v5;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  [(NTKGreenfieldB640ContentViewController *)self cellSize];
  double v7 = v6;
  uint64_t v8 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    unint64_t v10 = 0;
    double v11 = 0.0;
    do
    {
      uint64_t v12 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
      uint64_t v13 = [v12 count] - 1;

      if (v10 == v13) {
        double v14 = v7;
      }
      else {
        double v14 = v7 + 4.0;
      }
      double v11 = v11 + v14;
      ++v10;
      double v15 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
      unint64_t v16 = [v15 count];
    }
    while (v10 < v16);
  }
  else
  {
    double v11 = 0.0;
  }
  [(UICollectionView *)self->_facesCollectionView bounds];
  double v17 = 15.0;
  if (v11 < v18)
  {
    [(UICollectionView *)self->_facesCollectionView bounds];
    double v17 = (v19 - v11) * 0.5;
  }
  double v20 = 0.0;
  double v21 = 0.0;
  double v22 = v17;
  result.right = v22;
  result.bottom = v21;
  result.left = v17;
  result.top = v20;
  return result;
}

- (id)_subtitleForError:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager"];

  if (v6)
  {
    switch([v4 code])
    {
      case 0:
        goto LABEL_5;
      case 1:
      case 8:
      case 11:
        double v7 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
        unint64_t v8 = [v7 count];

        if (v8 < 2)
        {
          uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_NOT_AVAILABLE_ON_DEVICE_ERROR_ALERT_DESCRIPTION_SINGULAR";
          unint64_t v10 = @"This watch face is not available on your Apple Watch.";
        }
        else
        {
          uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_NOT_AVAILABLE_ON_DEVICE_ERROR_ALERT_DESCRIPTION_PLURAL";
          unint64_t v10 = @"These watch faces are not available on your Apple Watch.";
        }
        goto LABEL_8;
      case 2:
      case 4:
        uint64_t v9 = @"GREENFIELD_ADD_WATCH_FACE_ERROR_TRY_AGAIN_LATER";
        unint64_t v10 = @"Try again later.";
        goto LABEL_8;
      case 3:
        unint64_t v16 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
        unint64_t v17 = [v16 count];

        if (v17 < 2)
        {
          uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_NO_WATCH_PAIRED_ERROR_ALERT_DESCRIPTION_SINGULAR";
          unint64_t v10 = @"Pair your Apple Watch with this iPhone to add this face.";
        }
        else
        {
          uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_NO_WATCH_PAIRED_ERROR_ALERT_DESCRIPTION_PLURAL";
          unint64_t v10 = @"Pair your Apple Watch with this iPhone to add these faces.";
        }
        goto LABEL_8;
      case 5:
        double v18 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
        unint64_t v19 = [v18 count];

        double v20 = NSString;
        if (v19 < 2) {
          double v21 = @"GREENFIELD_B640_WATCH_FACE_LIBRARY_LIMIT_ERROR_ALERT_DESCRIPTION";
        }
        else {
          double v21 = @"GREENFIELD_B640_MULTIPLE_WATCH_FACES_LIBRARY_LIMIT_ERROR_ALERT_DESCRIPTION";
        }
        double v28 = NTKClockFaceLocalizedString(v21, @"too many faces");
        objc_super v36 = [MEMORY[0x1E4F19A30] currentDevice];
        objc_msgSend(v20, "localizedStringWithFormat:", v28, NTKFaceLibraryMaxFaceCountForDevice(v36));
        goto LABEL_38;
      case 6:
        double v22 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
        unint64_t v23 = [v22 count];

        if (v23 < 2)
        {
          uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_CANNOT_ADD_ANOTHER_FACE_ERROR_DESCRIPTION_SINGULAR";
          unint64_t v10 = @"You can switch to this face on your Apple Watch.";
        }
        else
        {
          uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_CANNOT_ADD_ANOTHER_FACE_ERROR_DESCRIPTION_PLURAL";
          unint64_t v10 = @"You can switch to these faces on your Apple Watch.";
        }
        goto LABEL_8;
      case 7:
        double v24 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
        unint64_t v25 = [v24 count];

        if (v25 < 2)
        {
          uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_NO_PHOTOS_INCLUDED_IN_PHOTOS_WATCH_FACE_ERROR_DESCRIPTION_SINGULAR";
          unint64_t v10 = @"This face cannot be added to your Apple Watch because the sender did not include any photos.";
        }
        else
        {
          uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_NO_PHOTOS_INCLUDED_IN_PHOTOS_WATCH_FACE_ERROR_DESCRIPTION_PLURAL";
          unint64_t v10 = @"These faces cannot be added to your Apple Watch because the sender did not include any photos.";
        }
        goto LABEL_8;
      case 9:
        int64x2_t v34 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
        unint64_t v35 = [v34 count];

        if (v35 < 2)
        {
          uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_LIBRARY_NOT_LOADED_ERROR_ALERT_DESCRIPTION_SINGULAR";
          unint64_t v10 = @"Could not add this watch face at this time. Try again later.";
        }
        else
        {
          uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_LIBRARY_NOT_LOADED_ERROR_ALERT_DESCRIPTION_PLURAL";
          unint64_t v10 = @"Could not add these watch faces at this time. Try again later.";
        }
        goto LABEL_8;
      case 10:
        uint64_t v9 = @"GREENFIELD_ADD_WATCH_FACE_ERROR_NO_NETWORK_CONNECTION_OR_INVALID_URL_SUBTITLE";
        unint64_t v10 = @"Check your internet connection and try again.";
        goto LABEL_8;
      case 12:
        uint64_t v9 = @"GREENFIELD_COMPANION_ADD_WATCH_FACE_ERROR_REQURE_WATCH_OS_UPDATE";
        unint64_t v10 = @"Watch face sharing is not available with your current version of watchOS.";
        goto LABEL_8;
      case 13:
        double v26 = [MEMORY[0x1E4F19A30] currentDevice];
        long long v27 = [v26 nrDevice];
        double v28 = [v27 valueForProperty:*MEMORY[0x1E4F79E08]];

        double v29 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
        unint64_t v30 = [v29 count];

        uint64_t v31 = NSString;
        if (v30 < 2)
        {
          uint64_t v32 = @"GREENFIELD_B640_WATCH_FACE_PAIRED_DEVICE_IS_TINKER_ERROR_ALERT_DESCRIPTION";
          int64x2_t v33 = @"This face can be added on Apple Watch. Message it to %@ to get started.";
        }
        else
        {
          uint64_t v32 = @"GREENFIELD_B640_MULTIPLE_WATCH_FACES_PAIRED_DEVICE_IS_TINKER_ERROR_ALERT_DESCRIPTION";
          int64x2_t v33 = @"These faces can be added on Apple Watch. Message them to %@ to get started.";
        }
        objc_super v36 = NTKClockFaceLocalizedString(v32, v33);
        objc_msgSend(v31, "localizedStringWithFormat:", v36, v28);
LABEL_38:
        self = (NTKGreenfieldB640ContentViewController *)objc_claimAutoreleasedReturnValue();

        break;
      case 14:
      case 15:
      case 16:
        double v14 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
        unint64_t v15 = [v14 count];

        if (v15 < 2)
        {
          uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_UNAVAILABLE_ERROR_ALERT_DESCRIPTION_SINGULAR";
          unint64_t v10 = @"This watch face is not available at this time. Try again later.";
        }
        else
        {
          uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_UNAVAILABLE_ERROR_ALERT_DESCRIPTION_PLURAL";
          unint64_t v10 = @"These watch faces are not available at this time. Try again later.";
        }
        goto LABEL_8;
      default:
        break;
    }
  }
  else
  {
LABEL_5:
    double v11 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
    unint64_t v12 = [v11 count];

    if (v12 < 2)
    {
      uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_GENERIC_ERROR_DEFAULT_ALERT_DESCRIPTION_SINGULAR";
      unint64_t v10 = @"This watch face is not available with your current version of watchOS.";
    }
    else
    {
      uint64_t v9 = @"GREENFIELD_B640_WATCH_FACE_GENERIC_ERROR_DEFAULT_ALERT_DESCRIPTION_PLURAL";
      unint64_t v10 = @"These watch faces are not available with your current version of watchOS.";
    }
LABEL_8:
    NTKClockFaceLocalizedString(v9, v10);
    self = (NTKGreenfieldB640ContentViewController *)objc_claimAutoreleasedReturnValue();
  }

  return self;
}

- (id)_titleForError:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager"];

  if (v6)
  {
    switch([v4 code])
    {
      case 0:
      case 1:
      case 7:
      case 8:
      case 10:
      case 11:
      case 12:
      case 13:
        goto LABEL_3;
      case 2:
      case 3:
        double v7 = @"GREENFIELD_B640_WATCH_FACE_NO_WATCH_PAIRED_ERROR_ALERT_TITLE";
        unint64_t v8 = @"No Apple Watch Paired";
        goto LABEL_4;
      case 4:
        double v7 = @"GREENFIELD_ADD_WATCH_FACE_ERROR_FAILED_TO_DOWNLOAD_WATCH_FACE_DATA_TITLE";
        unint64_t v8 = @"This Watch Face is Not Available at This Time";
        goto LABEL_4;
      case 5:
        double v7 = @"GREENFIELD_B640_WATCH_FACE_LIBRARY_FULL_ERROR_ALERT_TITLE";
        unint64_t v8 = @"Limit Reached";
        goto LABEL_4;
      case 6:
        unint64_t v12 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
        unint64_t v13 = [v12 count];

        if (v13 < 2)
        {
          double v7 = @"GREENFIELD_B640_WATCH_FACE_CANNOT_ADD_ANOTHER_FACE_ERROR_TITLE_SINGULAR";
          unint64_t v8 = @"You Already Have This Face";
        }
        else
        {
          double v7 = @"GREENFIELD_B640_WATCH_FACE_CANNOT_ADD_ANOTHER_FACE_ERROR_TITLE_PLURAL";
          unint64_t v8 = @"You Already Have These Faces";
        }
        goto LABEL_4;
      case 9:
      case 14:
      case 15:
      case 16:
        unint64_t v10 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model watchFaceModels];
        unint64_t v11 = [v10 count];

        if (v11 < 2)
        {
          double v7 = @"GREENFIELD_B640_WATCH_FACE_UNAVAILABLE_ERROR_ALERT_TITLE_SINGULAR";
          unint64_t v8 = @"Watch Face Unavailable";
        }
        else
        {
          double v7 = @"GREENFIELD_B640_WATCH_FACE_UNAVAILABLE_ERROR_ALERT_TITLE_PLURAL";
          unint64_t v8 = @"Watch Faces Unavailable";
        }
        goto LABEL_4;
      default:
        break;
    }
  }
  else
  {
LABEL_3:
    double v7 = @"GREENFIELD_B640_WATCH_FACE_GENERIC_ERROR_ALERT_TITLE";
    unint64_t v8 = @"Add Watch Face";
LABEL_4:
    NTKClockFaceLocalizedString(v7, v8);
    self = (NTKGreenfieldB640ContentViewController *)objc_claimAutoreleasedReturnValue();
  }

  return self;
}

- (void)_didTapShowInternalErrorButton
{
  uint64_t v3 = NSString;
  id v4 = [(NTKGreenfieldB640Model *)self->_greenfieldB640Model error];
  id v7 = [v3 stringWithFormat:@"Please file a radar to Watch Faces if you think this is an error.\n %@", v4];

  int64_t v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"[Internal Only]" message:v7 preferredStyle:1];
  int v6 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Ok" style:1 handler:0];
  [v5 addAction:v6];

  [(NTKGreenfieldB640ContentViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (NTKGreenfieldB640ContentViewControllerDelegate)greenfieldB640delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldB640delegate);
  return (NTKGreenfieldB640ContentViewControllerDelegate *)WeakRetained;
}

- (void)setGreenfieldB640delegate:(id)a3
{
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_greenfieldB640delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_watchBandImage, 0);
  objc_storeStrong((id *)&self->_collectionViewFlowLayout, 0);
  objc_storeStrong((id *)&self->_facesCollectionView, 0);
  objc_storeStrong((id *)&self->_greenfieldB640Model, 0);
}

@end
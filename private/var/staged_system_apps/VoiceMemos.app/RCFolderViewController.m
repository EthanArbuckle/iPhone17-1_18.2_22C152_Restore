@interface RCFolderViewController
- (BOOL)_shouldDisplaySiriTipView;
- (BOOL)hideNavigationTitle;
- (BOOL)isInactive;
- (BOOL)isRecordButtonVisible;
- (BOOL)isSetup;
- (BOOL)shouldDisplaySiriTipView;
- (BOOL)supportsRecording;
- (NSString)folderTitle;
- (NSString)folderUUID;
- (RCFolderViewController)initWithBuiltInFolderType:(int64_t)a3 folderUUID:(id)a4;
- (RCFolderViewController)initWithUserFolderNamed:(id)a3 folderUUID:(id)a4;
- (RCLibraryActionHandler)libraryActionHandler;
- (RCRecordingViewController)recordingViewController;
- (RCRecordingViewControllerDelegate)recordingViewControllerDelegate;
- (RCRecordingsCollectionViewController)recordingsCollectionViewController;
- (UIBarButtonItem)eraseRecordingsButton;
- (UIBarButtonItem)flexBarItem;
- (UIBarButtonItem)recoverRecordingsButton;
- (id)_selectedUUIDForPlayback;
- (id)setupBlock;
- (id)teardownBlock;
- (id)undoManager;
- (int64_t)folderType;
- (void)_clearNavigationBarPalette;
- (void)_commonInit;
- (void)_handleEraseAll:(id)a3;
- (void)_handleEraseSelected:(id)a3;
- (void)_handleRecoverAll:(id)a3;
- (void)_handleRecoverSelected:(id)a3;
- (void)_performDeleteItems:(id)a3;
- (void)_performShareRows:(id)a3;
- (void)_setupDeletableToolbarItemsWithCount:(unint64_t)a3;
- (void)_setupNavigationBarPalette;
- (void)_setupRecentlyDeletedToolbarItemsWithCount:(unint64_t)a3;
- (void)_styleView;
- (void)_updateNavigationBarPaletteHeightIfNeeded;
- (void)_updateToolbarItemsWithCount:(unint64_t)a3;
- (void)didDismissSiriTipView;
- (void)finishedTransitionToEditing:(BOOL)a3;
- (void)setEraseRecordingsButton:(id)a3;
- (void)setFlexBarItem:(id)a3;
- (void)setFolderTitle:(id)a3;
- (void)setFolderType:(int64_t)a3;
- (void)setHideNavigationTitle:(BOOL)a3;
- (void)setIsInactive:(BOOL)a3;
- (void)setIsSetup:(BOOL)a3;
- (void)setLibraryActionHandler:(id)a3;
- (void)setRecordingViewController:(id)a3;
- (void)setRecordingViewControllerDelegate:(id)a3;
- (void)setRecordingsCollectionViewController:(id)a3;
- (void)setRecoverRecordingsButton:(id)a3;
- (void)setSetupBlock:(id)a3;
- (void)setShouldDisplaySiriTipView:(BOOL)a3;
- (void)setTeardownBlock:(id)a3;
- (void)setUndoManager:(id)a3;
- (void)updateNavBarTitleAndDeleteButtonForRecordingsCount:(unint64_t)a3 isEditMode:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RCFolderViewController

- (id)undoManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_undoManager);

  return WeakRetained;
}

- (void)_commonInit
{
  id v3 = (id)objc_opt_new();
  [(RCFolderViewController *)self setRecordingViewController:v3];
  [(RCFolderViewController *)self setShouldDisplaySiriTipView:[(RCFolderViewController *)self _shouldDisplaySiriTipView]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCFolderViewController;
  [(RCFolderViewController *)&v6 viewDidAppear:a3];
  v4 = [(RCFolderViewController *)self navigationItem];
  v5 = [v4 _bottomPalette];

  if (v5) {
    [v5 setMinimumHeight:0.0];
  }
}

- (BOOL)_shouldDisplaySiriTipView
{
  id v3 = +[AFPreferences sharedPreferences];
  unsigned __int8 v4 = [v3 assistantIsEnabled];

  v5 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v6 = [v5 BOOLForKey:@"RCSiriTipViewWasDismissed"];

  unsigned int v7 = [(RCFolderViewController *)self supportsRecording];
  if (v7) {
    LOBYTE(v7) = v4 & (v6 ^ 1);
  }
  return v7;
}

- (void)setRecordingViewControllerDelegate:(id)a3
{
  p_recordingViewControllerDelegate = &self->_recordingViewControllerDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_recordingViewControllerDelegate, v5);
  id v6 = [(RCFolderViewController *)self recordingViewController];
  [v6 setRecordingViewControllerDelegate:v5];
}

- (void)setLibraryActionHandler:(id)a3
{
  p_libraryActionHandler = &self->_libraryActionHandler;
  id v5 = a3;
  objc_storeWeak((id *)p_libraryActionHandler, v5);
  id v6 = [(RCFolderViewController *)self recordingsCollectionViewController];
  [v6 setLibraryActionHandler:v5];
}

- (void)setFolderTitle:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  folderTitle = self->_folderTitle;
  self->_folderTitle = v5;

  id v7 = [(RCFolderViewController *)self navigationItem];
  [v7 setTitle:v4];
}

- (void)setRecordingsCollectionViewController:(id)a3
{
  p_recordingsCollectionViewController = &self->_recordingsCollectionViewController;
  objc_storeStrong((id *)&self->_recordingsCollectionViewController, a3);
  id v6 = a3;
  [v6 willMoveToParentViewController:self];
  [(RCFolderViewController *)self addChildViewController:v6];
  [v6 didMoveToParentViewController:self];
  id v7 = [(RCFolderViewController *)self libraryActionHandler];
  [(RCRecordingsCollectionViewController *)*p_recordingsCollectionViewController setLibraryActionHandler:v7];
}

- (void)setRecordingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_recordingViewController, a3);
  id v6 = a3;
  id v5 = [(RCFolderViewController *)self recordingViewControllerDelegate];
  [v6 setRecordingViewControllerDelegate:v5];

  [(RCFolderViewController *)self addChildViewController:v6];
  [v6 didMoveToParentViewController:self];
}

- (RCFolderViewController)initWithBuiltInFolderType:(int64_t)a3 folderUUID:(id)a4
{
  id v6 = a4;
  v36.receiver = self;
  v36.super_class = (Class)RCFolderViewController;
  id v7 = [(RCFolderViewController *)&v36 init];
  v8 = v7;
  if (v7)
  {
    v7->_folderType = a3;
    v9 = (NSString *)[v6 copy];
    folderUUID = v8->_folderUUID;
    v8->_folderUUID = v9;

    [(RCFolderViewController *)v8 _commonInit];
    if (a3 == 3)
    {
      v11 = objc_alloc_init(RCRecentlyDeletedRecordingsCollectionViewController);
      [(RCFolderViewController *)v8 setRecordingsCollectionViewController:v11];

      id v12 = objc_alloc((Class)UIBarButtonItem);
      v13 = +[NSBundle mainBundle];
      v14 = [v13 localizedStringForKey:@"RECOVER_ALL" value:&stru_100228BC8 table:0];
      id v15 = [v12 initWithTitle:v14 style:0 target:v8 action:"_handleRecoverAll:"];
      [(RCFolderViewController *)v8 setRecoverRecordingsButton:v15];

      v16 = +[NSBundle mainBundle];
      v17 = [v16 localizedStringForKey:@"RECOVER_ALL" value:&stru_100228BC8 table:0];
      v18 = +[NSBundle mainBundle];
      v19 = [v18 localizedStringForKey:@"RECOVER" value:&stru_100228BC8 table:0];
      v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v19, 0);
      v21 = [(RCFolderViewController *)v8 recoverRecordingsButton];
      [v21 setPossibleTitles:v20];

      v22 = [(RCFolderViewController *)v8 recoverRecordingsButton];
      [v22 setEnabled:1];

      id v23 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:v8 action:0];
      [(RCFolderViewController *)v8 setFlexBarItem:v23];

      id v24 = objc_alloc((Class)UIBarButtonItem);
      v25 = +[NSBundle mainBundle];
      v26 = [v25 localizedStringForKey:@"DELETE_ALL" value:&stru_100228BC8 table:0];
      id v27 = [v24 initWithTitle:v26 style:0 target:v8 action:"_handleEraseAll:"];
      [(RCFolderViewController *)v8 setEraseRecordingsButton:v27];

      v28 = +[NSBundle mainBundle];
      v29 = [v28 localizedStringForKey:@"DELETE_ALL" value:&stru_100228BC8 table:0];
      v30 = +[NSBundle mainBundle];
      v31 = [v30 localizedStringForKey:@"DELETE" value:&stru_100228BC8 table:0];
      v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v29, v31, 0);
      v33 = [(RCFolderViewController *)v8 eraseRecordingsButton];
      [v33 setPossibleTitles:v32];

      v34 = [(RCFolderViewController *)v8 eraseRecordingsButton];
      [(RCRecordingsCollectionViewController *)v34 setEnabled:1];
    }
    else
    {
      v34 = [[RCRecordingsCollectionViewController alloc] initWithBuiltInFolderType:a3 folderUUID:v6];
      [(RCFolderViewController *)v8 setRecordingsCollectionViewController:v34];
    }
  }
  return v8;
}

- (BOOL)isSetup
{
  return self->_isSetup;
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RCFolderViewController;
  [(RCFolderViewController *)&v10 viewWillAppear:a3];
  id v4 = [(RCFolderViewController *)self setupBlock];

  if (v4)
  {
    id v5 = [(RCFolderViewController *)self setupBlock];
    v5[2]();
  }
  id v6 = [(RCFolderViewController *)self folderTitle];
  uint64_t v7 = [(RCFolderViewController *)self navigationItem];
  [(id)v7 setTitle:v6];

  v8 = +[RCRecorderStyleProvider sharedStyleProvider];
  LOBYTE(v7) = [v8 usesLargeTitles];

  if ((v7 & 1) == 0 && (id)[(RCFolderViewController *)self folderType] == (id)3)
  {
    [(RCFolderViewController *)self _setupRecentlyDeletedToolbarItemsWithCount:0];
    v9 = [(RCFolderViewController *)self navigationController];
    [v9 setToolbarHidden:0 animated:1];
  }
  [(RCFolderViewController *)self setIsInactive:0];
}

- (id)setupBlock
{
  return self->_setupBlock;
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)RCFolderViewController;
  [(RCFolderViewController *)&v18 viewDidLoad];
  id v3 = objc_opt_new();
  [v3 setDelegate:self];
  id v4 = [(RCFolderViewController *)self recordingsCollectionViewController];
  id v5 = [v4 view];
  [v3 setRecordingsCollectionViewControllerWrapperView:v5];

  id v6 = [(RCFolderViewController *)self recordingsCollectionViewController];
  [v6 setEditStateHandler:v3];

  uint64_t v7 = [(RCFolderViewController *)self recordingViewController];
  v8 = [v7 view];
  [v3 setRecordingView:v8];
  [v8 setAllowsNewRecordings:[self supportsRecording]];
  [v8 reset];
  [(RCFolderViewController *)self setView:v3];
  [v3 setNeedsUpdateConstraints];
  v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v10 = [v9 usesLargeTitles];

  if (v10)
  {
    v11 = [(RCFolderViewController *)self recordingsCollectionViewController];
    id v12 = [v11 editButtonItem];
    unsigned int v13 = [v12 isEnabled];

    if (v13)
    {
      v11 = [(RCFolderViewController *)self recordingsCollectionViewController];
      v14 = [v11 editButtonItem];
    }
    else
    {
      v14 = 0;
    }
    id v15 = [(RCFolderViewController *)self navigationItem];
    [v15 setRightBarButtonItem:v14];

    if (v13)
    {
    }
    v16 = [(RCFolderViewController *)self navigationItem];
    [v16 setLargeTitleDisplayMode:1];

    v17 = [(RCFolderViewController *)self navigationItem];
    [v17 _setSupportsTwoLineLargeTitles:1];
  }
  [(RCFolderViewController *)self _setupNavigationBarPalette];
}

- (RCRecordingsCollectionViewController)recordingsCollectionViewController
{
  return self->_recordingsCollectionViewController;
}

- (void)updateNavBarTitleAndDeleteButtonForRecordingsCount:(unint64_t)a3 isEditMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v19 = [(RCFolderViewController *)self navigationItem];
  [v19 _setSupportsTwoLineLargeTitles:1];
  if (v4)
  {
    if (a3)
    {
      uint64_t v7 = +[NSBundle mainBundle];
      v8 = [v7 localizedStringForKey:@"%lu Selected" value:&stru_100228BC8 table:0];
      v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, a3);
      [v19 setTitle:v9];
    }
    else
    {
      uint64_t v7 = [(RCFolderViewController *)self folderTitle];
      [v19 setTitle:v7];
    }

    [(RCFolderViewController *)self _updateToolbarItemsWithCount:a3];
  }
  else if ([(RCFolderViewController *)self hideNavigationTitle])
  {
    [v19 setTitle:&stru_100228BC8];
  }
  else
  {
    unsigned int v10 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v11 = [v10 usesLargeTitles];

    if (v11)
    {
      id v12 = [(RCFolderViewController *)self folderTitle];
      [v19 setTitle:v12];
    }
  }
  unsigned int v13 = [(RCFolderViewController *)self recordingsCollectionViewController];
  v14 = [v13 editButtonItem];
  if ([v14 isEnabled])
  {
    id v15 = [v13 editButtonItem];
  }
  else
  {
    id v15 = 0;
  }

  v16 = [(RCFolderViewController *)self navigationItem];
  v17 = [v16 rightBarButtonItem];

  if (v15 != v17)
  {
    objc_super v18 = [(RCFolderViewController *)self navigationItem];
    [v18 setRightBarButtonItem:v15 animated:1];
  }
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)RCFolderViewController;
  [(RCFolderViewController *)&v10 viewDidLayoutSubviews];
  id v3 = [(RCFolderViewController *)self navigationItem];
  BOOL v4 = [v3 searchController];

  if (!v4)
  {
    id v5 = [(RCFolderViewController *)self recordingsCollectionViewController];
    id v6 = [v5 searchController];

    [v3 setSearchController:v6];
    uint64_t v7 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v8 = [v7 pinsSearchBarInLibrary];

    if (v8)
    {
      v9 = [(RCFolderViewController *)self navigationItem];
      [v9 setHidesSearchBarWhenScrolling:0];
    }
  }
}

- (BOOL)supportsRecording
{
  return ([(RCFolderViewController *)self folderType] & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (int64_t)folderType
{
  return self->_folderType;
}

- (BOOL)shouldDisplaySiriTipView
{
  return self->_shouldDisplaySiriTipView;
}

- (void)setUndoManager:(id)a3
{
}

- (void)setTeardownBlock:(id)a3
{
}

- (void)setShouldDisplaySiriTipView:(BOOL)a3
{
  self->_shouldDisplaySiriTipView = a3;
}

- (void)setSetupBlock:(id)a3
{
}

- (void)setIsSetup:(BOOL)a3
{
  self->_isSetup = a3;
}

- (void)setIsInactive:(BOOL)a3
{
  self->_isInactive = a3;
}

- (RCRecordingViewController)recordingViewController
{
  return self->_recordingViewController;
}

- (RCRecordingViewControllerDelegate)recordingViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingViewControllerDelegate);

  return (RCRecordingViewControllerDelegate *)WeakRetained;
}

- (RCLibraryActionHandler)libraryActionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryActionHandler);

  return (RCLibraryActionHandler *)WeakRetained;
}

- (BOOL)hideNavigationTitle
{
  return self->_hideNavigationTitle;
}

- (NSString)folderTitle
{
  return self->_folderTitle;
}

- (void)_setupNavigationBarPalette
{
  id v16 = [(RCFolderViewController *)self navigationItem];
  if ([(RCFolderViewController *)self shouldDisplaySiriTipView])
  {
    id v3 = [v16 _bottomPalette];

    if (!v3)
    {
      BOOL v4 = [(RCFolderViewController *)self navigationController];
      id v5 = [v4 navigationBar];
      [v5 frame];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;

      v14 = -[RCSiriTipContainerView initWithFrame:]([_TtC10VoiceMemos22RCSiriTipContainerView alloc], "initWithFrame:", v7, v9, v11, v13);
      [(RCSiriTipContainerView *)v14 setDelegate:self];
      id v15 = [objc_alloc((Class)_UINavigationBarPalette) initWithContentView:v14];
      [v16 _setBottomPalette:v15];
      [v15 _setLayoutPriority:2];
      [v15 _setContentViewMarginType:1];
      [(RCFolderViewController *)self _updateNavigationBarPaletteHeightIfNeeded];
    }
  }
}

- (RCFolderViewController)initWithUserFolderNamed:(id)a3 folderUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RCFolderViewController;
  double v8 = [(RCFolderViewController *)&v14 init];
  double v9 = v8;
  if (v8)
  {
    v8->_folderType = 4;
    double v10 = (NSString *)[v7 copy];
    folderUUID = v9->_folderUUID;
    v9->_folderUUID = v10;

    double v12 = [[RCRecordingsCollectionViewController alloc] initWithUserFolderNamed:v6 folderUUID:v7];
    [(RCFolderViewController *)v9 setRecordingsCollectionViewController:v12];

    [(RCFolderViewController *)v9 _commonInit];
  }

  return v9;
}

- (BOOL)isRecordButtonVisible
{
  if ([(RCFolderViewController *)self supportsRecording])
  {
    id v3 = [(RCFolderViewController *)self view];
    unsigned int v4 = [v3 isRecordingViewHidden] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(RCFolderViewController *)self teardownBlock];

  if (v5)
  {
    id v6 = [(RCFolderViewController *)self teardownBlock];
    v6[2]();
  }
  v7.receiver = self;
  v7.super_class = (Class)RCFolderViewController;
  [(RCFolderViewController *)&v7 viewDidDisappear:v3];
  [(RCFolderViewController *)self setIsInactive:1];
}

- (id)_selectedUUIDForPlayback
{
  BOOL v3 = [(RCFolderViewController *)self recordingsCollectionViewController];
  unsigned int v4 = [v3 uuidOfSelectedRecording];

  if (!v4)
  {
    id v5 = [(RCFolderViewController *)self recordingViewController];
    unsigned int v4 = [v5 uuidBeingDisplayed];
  }

  return v4;
}

- (void)_updateToolbarItemsWithCount:(unint64_t)a3
{
  if ((id)[(RCFolderViewController *)self folderType] == (id)3)
  {
    [(RCFolderViewController *)self _setupRecentlyDeletedToolbarItemsWithCount:a3];
  }
  else
  {
    [(RCFolderViewController *)self _setupDeletableToolbarItemsWithCount:a3];
  }
}

- (void)_setupRecentlyDeletedToolbarItemsWithCount:(unint64_t)a3
{
  unsigned int v4 = [(RCFolderViewController *)self recordingsCollectionViewController];
  id v5 = [v4 collectionView];

  if ([v5 isEditing]
    && ([v5 indexPathsForSelectedItems],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        v6,
        v7))
  {
    double v8 = +[NSBundle mainBundle];
    double v9 = [v8 localizedStringForKey:@"RECOVER" value:&stru_100228BC8 table:0];
    double v10 = [(RCFolderViewController *)self recoverRecordingsButton];
    [v10 setTitle:v9];

    double v11 = +[NSBundle mainBundle];
    double v12 = [v11 localizedStringForKey:@"DELETE" value:&stru_100228BC8 table:0];
    double v13 = [(RCFolderViewController *)self eraseRecordingsButton];
    [v13 setTitle:v12];
    objc_super v14 = &selRef__handleEraseSelected_;
    id v15 = &selRef__handleRecoverSelected_;
  }
  else
  {
    id v16 = +[NSBundle mainBundle];
    v17 = [v16 localizedStringForKey:@"RECOVER_ALL" value:&stru_100228BC8 table:0];
    objc_super v18 = [(RCFolderViewController *)self recoverRecordingsButton];
    [v18 setTitle:v17];

    double v11 = +[NSBundle mainBundle];
    double v12 = [v11 localizedStringForKey:@"DELETE_ALL" value:&stru_100228BC8 table:0];
    double v13 = [(RCFolderViewController *)self eraseRecordingsButton];
    [v13 setTitle:v12];
    objc_super v14 = &selRef__handleEraseAll_;
    id v15 = &selRef__handleRecoverAll_;
  }

  id v19 = [(RCFolderViewController *)self recoverRecordingsButton];
  [v19 setAction:*v15];

  v20 = [(RCFolderViewController *)self eraseRecordingsButton];
  [v20 setAction:*v14];

  v21 = [(RCFolderViewController *)self recoverRecordingsButton];
  v22 = [(RCFolderViewController *)self flexBarItem];
  v25[1] = v22;
  id v23 = [(RCFolderViewController *)self eraseRecordingsButton];
  v25[2] = v23;
  id v24 = +[NSArray arrayWithObjects:v25 count:3];
  [(RCFolderViewController *)self setToolbarItems:v24 animated:1];
}

- (void)_setupDeletableToolbarItemsWithCount:(unint64_t)a3
{
  id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v6 = objc_alloc((Class)UIBarButtonItem);
  id v7 = [v5 shareToolbarMenuImage];
  id v8 = [v6 initWithImage:v7 style:0 target:self action:"_performShareRows:"];

  double v9 = +[NSBundle mainBundle];
  double v10 = [v9 localizedStringForKey:@"AX_SHARE_BUTTON" value:&stru_100228BC8 table:0];
  [v8 setAccessibilityLabel:v10];

  BOOL v11 = a3 != 0;
  [v8 setEnabled:v11];
  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:self action:0];
  id v13 = objc_alloc((Class)UIBarButtonItem);
  objc_super v14 = [v5 trashBottomToolbarImage];
  id v15 = [v13 initWithImage:v14 style:0 target:self action:"_performDeleteItems:"];

  id v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"AX_DELETE" value:&stru_100228BC8 table:0];
  [v15 setAccessibilityLabel:v17];

  [v15 setEnabled:v11];
  v19[0] = v8;
  v19[1] = v12;
  v19[2] = v15;
  objc_super v18 = +[NSArray arrayWithObjects:v19 count:3];
  [(RCFolderViewController *)self setToolbarItems:v18 animated:0];
}

- (void)_clearNavigationBarPalette
{
  id v14 = [(RCFolderViewController *)self navigationItem];
  BOOL v3 = [v14 _bottomPalette];
  unsigned int v4 = v3;
  if (v3)
  {
    [v3 frame];
    double v6 = v5;
    id v7 = [(RCFolderViewController *)self recordingsCollectionViewController];
    id v8 = [v7 collectionView];

    [v8 contentOffset];
    double v10 = v9;
    double v12 = v6 + v11;
    [v14 _setBottomPalette:0];
    [v8 setContentOffset:0 animated:v10];
    id v13 = [(RCFolderViewController *)self recordingsCollectionViewController];
    [v13 scrollToTop];
  }
}

- (void)_performShareRows:(id)a3
{
  id v4 = a3;
  id v6 = [(RCFolderViewController *)self libraryActionHandler];
  double v5 = [(RCFolderViewController *)self recordingsCollectionViewController];
  [v6 performAction:30 atPosition:0 forUUID:v5 sourceController:v4 source:0.0];
}

- (void)_performDeleteItems:(id)a3
{
  id v3 = [(RCFolderViewController *)self recordingsCollectionViewController];
  [v3 deleteSelectedItems];
}

- (void)_handleRecoverSelected:(id)a3
{
  id v4 = a3;
  id v6 = [(RCFolderViewController *)self libraryActionHandler];
  double v5 = [(RCFolderViewController *)self recordingsCollectionViewController];
  [v6 performAction:21 atPosition:0 forUUID:v5 sourceController:v4 source:0.0];
}

- (void)_handleRecoverAll:(id)a3
{
  id v4 = a3;
  id v6 = [(RCFolderViewController *)self libraryActionHandler];
  double v5 = [(RCFolderViewController *)self recordingsCollectionViewController];
  [v6 performAction:22 atPosition:0 forUUID:v5 sourceController:v4 source:0.0];
}

- (void)_handleEraseAll:(id)a3
{
  id v4 = a3;
  id v6 = [(RCFolderViewController *)self libraryActionHandler];
  double v5 = [(RCFolderViewController *)self recordingsCollectionViewController];
  [v6 performAction:19 atPosition:0 forUUID:v5 sourceController:v4 source:0.0];
}

- (void)_handleEraseSelected:(id)a3
{
  id v4 = a3;
  id v6 = [(RCFolderViewController *)self libraryActionHandler];
  double v5 = [(RCFolderViewController *)self recordingsCollectionViewController];
  [v6 performAction:18 atPosition:0 forUUID:v5 sourceController:v4 source:0.0];
}

- (void)_styleView
{
  id v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v3 toolbarButtonsShouldHaveNonDefaultColor])
  {
    id v4 = [v3 recentlyDeletedNonDefaultButtonTextColor];
    double v5 = [(RCFolderViewController *)self recoverRecordingsButton];
    NSAttributedStringKey v13 = NSForegroundColorAttributeName;
    id v14 = v4;
    id v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v5 setTitleTextAttributes:v6 forState:0];

    id v7 = [(RCFolderViewController *)self eraseRecordingsButton];
    NSAttributedStringKey v11 = NSForegroundColorAttributeName;
    double v12 = v4;
    id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [v7 setTitleTextAttributes:v8 forState:0];
  }
  else
  {
    double v9 = [(RCFolderViewController *)self recoverRecordingsButton];
    [v9 setTitleTextAttributes:0 forState:0];

    id v4 = [(RCFolderViewController *)self eraseRecordingsButton];
    [v4 setTitleTextAttributes:0 forState:0];
  }

  double v10 = [(RCFolderViewController *)self recordingsCollectionViewController];
  [v10 restyle];
}

- (void)finishedTransitionToEditing:(BOOL)a3
{
  int v3 = a3;
  double v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v6 = [v5 alwaysShowsRecordingsCollectionViewToolbarInRecentlyDeleted];

  if ((v6 & 1) == 0)
  {
    id v8 = [(RCFolderViewController *)self navigationController];
    unsigned int v7 = [v8 isToolbarHidden];
    if (v7 == v3) {
      [v8 setToolbarHidden:v7 & v3 ^ 1 animated:1];
    }
  }
}

- (void)didDismissSiriTipView
{
  int v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setBool:1 forKey:@"RCSiriTipViewWasDismissed"];

  [(RCFolderViewController *)self _clearNavigationBarPalette];
}

- (void)_updateNavigationBarPaletteHeightIfNeeded
{
  v2 = [(RCFolderViewController *)self navigationItem];
  id v10 = [v2 _bottomPalette];

  int v3 = v10;
  if (v10)
  {
    id v4 = [v10 contentView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    int v3 = v10;
    if (isKindOfClass)
    {
      unsigned __int8 v6 = [v10 contentView];
      [v6 preferredHeight];
      double v8 = v7;
      [v10 preferredHeight];
      if (v9 != v8) {
        [v10 setPreferredHeight:v8];
      }

      int v3 = v10;
    }
  }
}

- (id)teardownBlock
{
  return self->_teardownBlock;
}

- (void)setFolderType:(int64_t)a3
{
  self->_folderType = a3;
}

- (NSString)folderUUID
{
  return self->_folderUUID;
}

- (void)setHideNavigationTitle:(BOOL)a3
{
  self->_hideNavigationTitle = a3;
}

- (UIBarButtonItem)recoverRecordingsButton
{
  return self->_recoverRecordingsButton;
}

- (void)setRecoverRecordingsButton:(id)a3
{
}

- (UIBarButtonItem)flexBarItem
{
  return self->_flexBarItem;
}

- (void)setFlexBarItem:(id)a3
{
}

- (UIBarButtonItem)eraseRecordingsButton
{
  return self->_eraseRecordingsButton;
}

- (void)setEraseRecordingsButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eraseRecordingsButton, 0);
  objc_storeStrong((id *)&self->_flexBarItem, 0);
  objc_storeStrong((id *)&self->_recoverRecordingsButton, 0);
  objc_storeStrong((id *)&self->_folderUUID, 0);
  objc_storeStrong((id *)&self->_folderTitle, 0);
  objc_destroyWeak((id *)&self->_libraryActionHandler);
  objc_destroyWeak((id *)&self->_recordingViewControllerDelegate);
  objc_storeStrong((id *)&self->_recordingsCollectionViewController, 0);
  objc_storeStrong((id *)&self->_recordingViewController, 0);
  objc_storeStrong(&self->_teardownBlock, 0);
  objc_storeStrong(&self->_setupBlock, 0);

  objc_destroyWeak((id *)&self->_undoManager);
}

@end
@interface RCPlaybackViewController
- (BOOL)_shouldCollapseToolbarButtons;
- (BOOL)_supportsTimelineGeneration;
- (BOOL)collectionViewEditingShouldDisableActionButtons;
- (BOOL)didSetupToolbarWithButtonItems;
- (BOOL)isFavorite;
- (BOOL)isRecentlyDeleted;
- (BOOL)supportsAppEntityInteraction;
- (Class)_viewClass;
- (UIBarButtonItem)deleteButtonItem;
- (UIBarButtonItem)editButtonItem;
- (UIBarButtonItem)eraseButtonItem;
- (UIBarButtonItem)favoriteButtonItem;
- (UIBarButtonItem)moreOptionsButtonItem;
- (UIBarButtonItem)moveToFolderButtonItem;
- (UIBarButtonItem)playbackSettingsButtonItem;
- (UIBarButtonItem)recoverButtonItem;
- (UIBarButtonItem)shareButtonItem;
- (UIBarButtonItem)transcriptionButtonItem;
- (UISplitViewController)parentSplitViewController;
- (id)_createMoreOptionsMenu:(BOOL)a3 shouldShowTranscriptionOption:(BOOL)a4;
- (id)createNewWaveformViewControllerWithDataSource:(id)a3 isOverview:(BOOL)a4 isCompact:(BOOL)a5 waveformOnly:(BOOL)a6;
- (id)deferredTranscriptMenuElement;
- (id)showTranscriptMenuElement;
- (int64_t)contentUnavailableState;
- (void)_classSpecificLoadView;
- (void)_doDelete:(id)a3;
- (void)_doDisplayPlaybackSettings:(id)a3;
- (void)_doEdit;
- (void)_doErase:(id)a3;
- (void)_doMoveToFolder:(id)a3;
- (void)_doRecover:(id)a3;
- (void)_doShare:(id)a3;
- (void)_doShowTranscriptionView:(id)a3;
- (void)_hideNavigationBarIfNeeded;
- (void)_reset;
- (void)_setupToolbarWithButtonItemsIfNeeded;
- (void)_toggleFavorite;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateMoreOptionsMenu;
- (void)_updatePlaybackSettingsButtonTint:(BOOL)a3;
- (void)_updateToolbarItems;
- (void)_updateTranscriptionButtonTint:(BOOL)a3;
- (void)deviceTranscriptionSupportDidChange:(BOOL)a3;
- (void)didUpdateRecordingCenterContentViewState;
- (void)enablePlaybackWithComposition:(id)a3 displayModel:(id)a4 timeController:(id)a5;
- (void)enableWaveformScrolling:(BOOL)a3;
- (void)enterEditMode;
- (void)handleDarkmodeChange;
- (void)setCollectionViewEditingShouldDisableActionButtons:(BOOL)a3;
- (void)setContentUnavailableState:(int64_t)a3;
- (void)setDeleteButtonItem:(id)a3;
- (void)setDidSetupToolbarWithButtonItems:(BOOL)a3;
- (void)setEditButtonItem:(id)a3;
- (void)setEraseButtonItem:(id)a3;
- (void)setFavoriteButtonItem:(id)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setIsRecentlyDeleted:(BOOL)a3;
- (void)setMoreOptionsButtonItem:(id)a3;
- (void)setMoveToFolderButtonItem:(id)a3;
- (void)setParentSplitViewController:(id)a3;
- (void)setPlaybackSettingsButtonItem:(id)a3;
- (void)setRecoverButtonItem:(id)a3;
- (void)setShareButtonItem:(id)a3;
- (void)setTranscriptionButtonItem:(id)a3;
- (void)updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)updateContentUnavailableViewState:(int64_t)a3;
- (void)updateWithPlaybackSettings:(id)a3;
- (void)updateWithRecordingModel:(id)a3;
- (void)updateWithRecordingModel:(id)a3 requireMatchingUUID:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RCPlaybackViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)RCPlaybackViewController;
  [(RCRecordingViewController *)&v6 viewDidLoad];
  v3 = self;
  v7 = v3;
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  id v5 = [(RCPlaybackViewController *)self registerForTraitChanges:v4 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
}

- (BOOL)supportsAppEntityInteraction
{
  return 0;
}

- (void)setCollectionViewEditingShouldDisableActionButtons:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RCPlaybackViewController *)self view];
  [v4 setDisablesActionButtons:v3];
}

- (BOOL)collectionViewEditingShouldDisableActionButtons
{
  v2 = [(RCPlaybackViewController *)self view];
  unsigned __int8 v3 = [v2 disablesActionButtons];

  return v3;
}

- (Class)_viewClass
{
  return (Class)objc_opt_class();
}

- (void)_classSpecificLoadView
{
  unsigned __int8 v3 = [(RCRecordingViewController *)self waveformContainerViewControllers];
  [v3 setIsPlayback:1];

  id v5 = [(RCRecordingViewController *)self overviewWaveformViewController];
  id v4 = [v5 waveformViewController];
  [v4 setIsPlayback:1];
}

- (void)_reset
{
  v4.receiver = self;
  v4.super_class = (Class)RCPlaybackViewController;
  [(RCRecordingViewController *)&v4 _reset];
  unsigned __int8 v3 = [(RCPlaybackViewController *)self view];
  [v3 reset];

  [(RCRecordingViewController *)self setUUID:0];
}

- (void)updateWithRecordingModel:(id)a3 requireMatchingUUID:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RCPlaybackViewController;
  [(RCRecordingViewController *)&v21 updateWithRecordingModel:v6 requireMatchingUUID:v4];
  if (!v4
    || ([v6 UUID],
        v7 = objc_claimAutoreleasedReturnValue(),
        [(RCRecordingViewController *)self UUID],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v7 isEqualToString:v8],
        v8,
        v7,
        v9))
  {
    if (v6) {
      [(RCPlaybackViewController *)self _setupToolbarWithButtonItemsIfNeeded];
    }
    -[RCPlaybackViewController setIsFavorite:](self, "setIsFavorite:", [v6 isFavorite]);
    unsigned int v10 = [v6 isFavorite];
    v11 = +[RCRecorderStyleProvider sharedStyleProvider];
    v12 = v11;
    if (v10) {
      [v11 favoriteImage];
    }
    else {
    v13 = [v11 notFavoriteImage];
    }
    v14 = [(RCPlaybackViewController *)self favoriteButtonItem];
    [v14 setImage:v13];

    unsigned int v15 = [v6 isFavorite];
    v16 = +[NSBundle mainBundle];
    v17 = v16;
    if (v15) {
      CFStringRef v18 = @"AX_REMOVE_FROM_FAVORITES";
    }
    else {
      CFStringRef v18 = @"AX_ADD_TO_FAVORITES";
    }
    v19 = [v16 localizedStringForKey:v18 value:&stru_100228BC8 table:0];
    v20 = [(RCPlaybackViewController *)self favoriteButtonItem];
    [v20 setAccessibilityLabel:v19];

    [(RCPlaybackViewController *)self _updateMoreOptionsMenu];
  }
}

- (void)updateWithRecordingModel:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RCPlaybackViewController;
  [(RCRecordingViewController *)&v28 updateWithRecordingModel:v4];
  -[RCPlaybackViewController setIsRecentlyDeleted:](self, "setIsRecentlyDeleted:", [v4 recentlyDeleted]);
  -[RCPlaybackViewController setIsFavorite:](self, "setIsFavorite:", [v4 isFavorite]);
  id v5 = [(RCRecordingViewController *)self UUID];

  id v6 = [(RCPlaybackViewController *)self view];
  [v6 setUserInteractionEnabled:v5 != 0];

  unsigned int v7 = [v4 isFavorite];
  v8 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v9 = v8;
  if (v7) {
    [v8 favoriteImage];
  }
  else {
  unsigned int v10 = [v8 notFavoriteImage];
  }
  BOOL v11 = v5 != 0;
  v12 = [(RCPlaybackViewController *)self favoriteButtonItem];
  [v12 setImage:v10];

  v13 = [(RCPlaybackViewController *)self favoriteButtonItem];
  [v13 setEnabled:v5 != 0];

  v14 = [(RCPlaybackViewController *)self shareButtonItem];
  [v14 setEnabled:v5 != 0];

  unsigned int v15 = [(RCPlaybackViewController *)self moveToFolderButtonItem];
  [v15 setEnabled:v5 != 0];

  v16 = [(RCPlaybackViewController *)self moreOptionsButtonItem];
  [v16 setEnabled:v5 != 0];

  v17 = [(RCPlaybackViewController *)self deleteButtonItem];
  [v17 setEnabled:v5 != 0];

  CFStringRef v18 = [(RCPlaybackViewController *)self eraseButtonItem];
  [v18 setEnabled:v5 != 0];

  v19 = [(RCPlaybackViewController *)self recoverButtonItem];
  [v19 setEnabled:v5 != 0];

  uint64_t v20 = v11 & ~[v4 recentlyDeleted];
  objc_super v21 = [(RCPlaybackViewController *)self playbackSettingsButtonItem];
  [v21 setEnabled:v20];

  uint64_t v22 = v11 & ~[v4 recentlyDeleted];
  v23 = [(RCPlaybackViewController *)self transcriptionButtonItem];
  [v23 setEnabled:v22];

  unsigned int v24 = [v4 recentlyDeleted] ^ 1;
  if (v5) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = 0;
  }
  v26 = [(RCPlaybackViewController *)self editButtonItem];
  [v26 setEnabled:v25];

  if (v4) {
    [(RCPlaybackViewController *)self _updateToolbarItems];
  }
  else {
    [(RCPlaybackViewController *)self updateContentUnavailableViewState:0];
  }
  v27 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  [v27 didUpdateWithRecordingModel:v4];
}

- (void)didUpdateRecordingCenterContentViewState
{
  v5.receiver = self;
  v5.super_class = (Class)RCPlaybackViewController;
  [(RCRecordingViewController *)&v5 didUpdateRecordingCenterContentViewState];
  unsigned __int8 v3 = [(RCPlaybackViewController *)self view];
  BOOL v4 = [v3 centerContentViewState] == (id)1;

  [(RCPlaybackViewController *)self _updateTranscriptionButtonTint:v4];
}

- (void)updateWithPlaybackSettings:(id)a3
{
  id v4 = [a3 hasCustomizedPlaybackSettings];

  [(RCPlaybackViewController *)self _updatePlaybackSettingsButtonTint:v4];
}

- (void)_updateToolbarItems
{
  if ([(RCPlaybackViewController *)self didSetupToolbarWithButtonItems])
  {
    if ([(RCPlaybackViewController *)self isRecentlyDeleted])
    {
      unsigned __int8 v3 = [(RCPlaybackViewController *)self view];
      id v4 = [(RCPlaybackViewController *)self recoverButtonItem];
      objc_super v28 = v4;
      objc_super v5 = +[NSArray arrayWithObjects:&v28 count:1];
      id v6 = [(RCPlaybackViewController *)self eraseButtonItem];
      v27 = v6;
      unsigned int v7 = +[NSArray arrayWithObjects:&v27 count:1];
      [v3 updateToolbarWithLeadingItems:v5 trailingItems:v7];
    }
    else
    {
      v8 = [(RCPlaybackViewController *)self shareButtonItem];
      v26[0] = v8;
      unsigned int v9 = [(RCPlaybackViewController *)self favoriteButtonItem];
      v26[1] = v9;
      unsigned int v10 = [(RCPlaybackViewController *)self moveToFolderButtonItem];
      v26[2] = v10;
      BOOL v11 = [(RCPlaybackViewController *)self deleteButtonItem];
      v26[3] = v11;
      unsigned __int8 v3 = +[NSArray arrayWithObjects:v26 count:4];

      if ([(RCPlaybackViewController *)self _shouldCollapseToolbarButtons])
      {
        v12 = [(RCPlaybackViewController *)self moreOptionsButtonItem];
        v25[0] = v12;
        v13 = [(RCPlaybackViewController *)self deleteButtonItem];
        v25[1] = v13;
        uint64_t v14 = +[NSArray arrayWithObjects:v25 count:2];

        unsigned __int8 v3 = (void *)v14;
      }
      unsigned int v15 = [(RCPlaybackViewController *)self playbackSettingsButtonItem];
      v24[0] = v15;
      v16 = [(RCPlaybackViewController *)self editButtonItem];
      v24[1] = v16;
      id v4 = +[NSArray arrayWithObjects:v24 count:2];

      if (![(RCPlaybackViewController *)self _shouldCollapseToolbarButtons])
      {
        v17 = +[TranscriptionAvailabilityProvider shared];
        unsigned int v18 = [v17 deviceIsSupported];

        if (v18)
        {
          v19 = [(RCPlaybackViewController *)self playbackSettingsButtonItem];
          uint64_t v20 = [(RCPlaybackViewController *)self transcriptionButtonItem];
          v23[1] = v20;
          objc_super v21 = [(RCPlaybackViewController *)self editButtonItem];
          v23[2] = v21;
          uint64_t v22 = +[NSArray arrayWithObjects:v23 count:3];

          id v4 = (void *)v22;
        }
      }
      objc_super v5 = [(RCPlaybackViewController *)self view];
      [v5 updateToolbarWithLeadingItems:v3 trailingItems:v4];
    }
  }
}

- (void)_updatePlaybackSettingsButtonTint:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(RCPlaybackViewController *)self playbackSettingsButtonItem];
  id v6 = [v5 customView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [(RCPlaybackViewController *)self playbackSettingsButtonItem];
    id v9 = [v8 customView];

    [v9 setIsToggled:v3];
  }
}

- (void)_updateTranscriptionButtonTint:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(RCPlaybackViewController *)self transcriptionButtonItem];
  id v6 = [v5 customView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [(RCPlaybackViewController *)self transcriptionButtonItem];
    id v9 = [v8 customView];

    [v9 setIsToggled:v3];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCPlaybackViewController;
  [(RCPlaybackViewController *)&v4 viewWillAppear:a3];
  [(RCPlaybackViewController *)self handleDarkmodeChange];
  [(RCPlaybackViewController *)self _hideNavigationBarIfNeeded];
}

- (void)_hideNavigationBarIfNeeded
{
  BOOL v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v4 = [v3 presentsTitleAndAdditionalEditingControlsInPlaybackCard];

  if ((v4 & 1) == 0)
  {
    id v5 = [(RCPlaybackViewController *)self navigationController];
    [v5 setNavigationBarHidden:1];
  }
}

- (void)_setupToolbarWithButtonItemsIfNeeded
{
  id v44 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v3 = [v44 presentsTitleAndAdditionalEditingControlsInPlaybackCard];
  if (![(RCPlaybackViewController *)self didSetupToolbarWithButtonItems] && v3)
  {
    id v4 = [(RCPlaybackViewController *)self favoriteButtonItem];
    if (!v4)
    {
      id v5 = objc_alloc((Class)UIBarButtonItem);
      id v6 = [v44 notFavoriteImage];
      id v4 = [v5 initWithImage:v6 style:0 target:self action:"_toggleFavorite"];

      [(RCPlaybackViewController *)self setFavoriteButtonItem:v4];
    }
    id v7 = [(RCPlaybackViewController *)self shareButtonItem];
    if (!v7)
    {
      id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:9 target:self action:"_doShare:"];
      [(RCPlaybackViewController *)self setShareButtonItem:v7];
    }
    v43 = v7;
    id v8 = [(RCPlaybackViewController *)self deleteButtonItem];
    if (!v8)
    {
      id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:16 target:self action:"_doDelete:"];
      [(RCPlaybackViewController *)self setDeleteButtonItem:v8];
    }
    v42 = v8;
    id v9 = [(RCPlaybackViewController *)self recoverButtonItem];
    if (!v9)
    {
      id v10 = objc_alloc((Class)UIBarButtonItem);
      BOOL v11 = +[NSBundle mainBundle];
      v12 = [v11 localizedStringForKey:@"RECOVER" value:&stru_100228BC8 table:0];
      id v9 = [v10 initWithTitle:v12 style:0 target:self action:"_doRecover:"];

      [(RCPlaybackViewController *)self setRecoverButtonItem:v9];
    }
    v41 = v9;
    id v13 = [(RCPlaybackViewController *)self playbackSettingsButtonItem];
    if (!v13)
    {
      uint64_t v14 = +[RCToggleButton playbackSettingsButton];
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      unsigned int v15 = [v44 playbackViewToolbarImageSymbolConfiguration];
      [v14 setImageSymbolConfiguration:v15];

      [v14 addTarget:self action:"_doDisplayPlaybackSettings:" forControlEvents:64];
      id v13 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v14];
      [(RCPlaybackViewController *)self setPlaybackSettingsButtonItem:v13];
    }
    id v16 = [(RCPlaybackViewController *)self transcriptionButtonItem];
    if (!v16)
    {
      v17 = +[RCToggleButton transcriptionButton];
      [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
      unsigned int v18 = [v44 playbackViewToolbarImageSymbolConfiguration];
      [v17 setImageSymbolConfiguration:v18];

      [v17 addTarget:self action:"_doShowTranscriptionView:" forControlEvents:64];
      id v16 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v17];
      [(RCPlaybackViewController *)self setTranscriptionButtonItem:v16];
    }
    id v19 = [(RCPlaybackViewController *)self editButtonItem];
    if (!v19)
    {
      uint64_t v20 = +[RCEditImageButton buttonWithType:1];
      [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v20 addTarget:self action:"_doEdit" forControlEvents:64];
      id v19 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v20];
      [(RCPlaybackViewController *)self setEditButtonItem:v19];
      objc_super v21 = +[NSBundle mainBundle];
      uint64_t v22 = [v21 localizedStringForKey:@"AX_EDIT" value:&stru_100228BC8 table:0];
      v23 = [(RCPlaybackViewController *)self editButtonItem];
      [v23 setAccessibilityLabel:v22];
    }
    id v24 = [(RCPlaybackViewController *)self eraseButtonItem];
    if (!v24)
    {
      id v25 = objc_alloc((Class)UIBarButtonItem);
      v26 = +[NSBundle mainBundle];
      v27 = [v26 localizedStringForKey:@"DELETE" value:&stru_100228BC8 table:0];
      id v24 = [v25 initWithTitle:v27 style:0 target:self action:"_doErase:"];

      [(RCPlaybackViewController *)self setEraseButtonItem:v24];
    }
    id v28 = [(RCPlaybackViewController *)self moveToFolderButtonItem];
    if (!v28)
    {
      id v29 = objc_alloc((Class)UIBarButtonItem);
      v30 = [v44 moveToFolderImage];
      id v28 = [v29 initWithImage:v30 style:0 target:self action:"_doMoveToFolder:"];

      [(RCPlaybackViewController *)self setMoveToFolderButtonItem:v28];
    }
    v40 = v13;
    v31 = [(RCPlaybackViewController *)self moreOptionsButtonItem];
    if (!v31)
    {
      v32 = +[TranscriptionAvailabilityProvider shared];
      id v33 = [v32 deviceIsSupported];

      v34 = [(RCPlaybackViewController *)self _createMoreOptionsMenu:0 shouldShowTranscriptionOption:v33];
      v35 = +[UIImage systemImageNamed:@"ellipsis.circle"];
      id v36 = v4;
      id v37 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v35 menu:v34];
      [(RCPlaybackViewController *)self setMoreOptionsButtonItem:v37];

      id v4 = v36;
    }
    v38 = [(RCRecordingViewController *)self UUID];
    BOOL v39 = v38 != 0;

    [v43 setEnabled:v39];
    [v42 setEnabled:v39];
    [v19 setEnabled:v39];
    [(RCPlaybackViewController *)self setDidSetupToolbarWithButtonItems:1];
    [(RCPlaybackViewController *)self _updateToolbarItems];
  }
}

- (void)_updateMoreOptionsMenu
{
  unsigned int v3 = +[TranscriptionAvailabilityProvider shared];
  id v4 = [v3 deviceIsSupported];

  id v6 = [(RCPlaybackViewController *)self _createMoreOptionsMenu:[(RCPlaybackViewController *)self isFavorite] shouldShowTranscriptionOption:v4];
  id v5 = [(RCPlaybackViewController *)self moreOptionsButtonItem];
  [v5 setMenu:v6];
}

- (id)_createMoreOptionsMenu:(BOOL)a3 shouldShowTranscriptionOption:(BOOL)a4
{
  BOOL v23 = a4;
  BOOL v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v25 = [v5 shareToolbarMenuImage];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"SHARE_CURRENT_RECORDING_MENU_ITEM" value:&stru_100228BC8 table:0];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100083888;
  v31[3] = &unk_100222508;
  objc_copyWeak(&v32, &location);
  v26 = +[UIAction actionWithTitle:v7 image:v25 identifier:0 handler:v31];

  +[NSBundle mainBundle];
  if (v4) {
    id v8 = {;
  }
    id v24 = [v8 localizedStringForKey:@"REMOVE_FROM_FAVORITES" value:&stru_100228BC8 table:0];

    [v5 favoriteImage];
  }
  else {
    id v9 = {;
  }
    id v24 = [v9 localizedStringForKey:@"ADD_TO_FAVORITES" value:&stru_100228BC8 table:0];

    [v5 notFavoriteImage];
  id v10 = };
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000838FC;
  v29[3] = &unk_100222508;
  objc_copyWeak(&v30, &location);
  BOOL v11 = +[UIAction actionWithTitle:v24 image:v10 identifier:0 handler:v29];
  v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"MOVE_TO_FOLDER" value:&stru_100228BC8 table:0];
  uint64_t v14 = [v5 moveToFolderImage];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10008393C;
  v27[3] = &unk_100222508;
  objc_copyWeak(&v28, &location);
  unsigned int v15 = +[UIAction actionWithTitle:v13 image:v14 identifier:0 handler:v27];

  v35[0] = v26;
  v35[1] = v11;
  v35[2] = v15;
  id v16 = +[NSArray arrayWithObjects:v35 count:3];
  v17 = +[UIMenu menuWithChildren:v16];

  if (v23)
  {
    unsigned int v18 = [(RCPlaybackViewController *)self deferredTranscriptMenuElement];
    v34[0] = v26;
    v34[1] = v11;
    v34[2] = v15;
    v34[3] = v18;
    id v19 = +[NSArray arrayWithObjects:v34 count:4];
    uint64_t v20 = +[UIMenu menuWithChildren:v19];

    v17 = (void *)v20;
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v17;
}

- (id)showTranscriptMenuElement
{
  unsigned int v3 = [(RCPlaybackViewController *)self view];
  BOOL v4 = [v3 centerContentViewState] == (id)1;

  id v5 = +[NSBundle mainBundle];
  id v6 = v5;
  if (v4) {
    CFStringRef v7 = @"SHOW_WAVEFORM";
  }
  else {
    CFStringRef v7 = @"VIEW_TRANSCRIPT";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_100228BC8 table:0];

  id v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v10 = v9;
  if (v4)
  {
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = [v9 transcriptionImage];
  }
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100083BF0;
  v17[3] = &unk_100222508;
  objc_copyWeak(&v18, &location);
  v12 = +[UIAction actionWithTitle:v8 image:v11 identifier:0 handler:v17];
  objc_super v21 = v12;
  id v13 = +[NSArray arrayWithObjects:&v21 count:1];
  uint64_t v14 = +[UIMenu menuWithTitle:&stru_100228BC8 image:v11 identifier:0 options:1 children:v13];

  uint64_t v20 = v14;
  unsigned int v15 = +[NSArray arrayWithObjects:&v20 count:1];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v15;
}

- (id)deferredTranscriptMenuElement
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100083D2C;
  v4[3] = &unk_100222530;
  objc_copyWeak(&v5, &location);
  v2 = +[UIDeferredMenuElement elementWithUncachedProvider:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (BOOL)_shouldCollapseToolbarButtons
{
  unsigned int v3 = [(RCPlaybackViewController *)self view];
  BOOL v4 = [v3 window];

  if (!v4) {
    return 0;
  }
  id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v6 = [(RCPlaybackViewController *)self view];
  [v6 width];
  double v8 = v7;
  [v5 playbackViewWidthToCollapseToolbarButtons];
  double v10 = v9;

  return v8 <= v10;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = a4;
  id v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  double v7 = [(RCPlaybackViewController *)self traitCollection];
  [v6 setCurrentUserInterfaceStyle:[v7 userInterfaceStyle]];

  id v8 = [v5 userInterfaceStyle];
  double v9 = [(RCPlaybackViewController *)self traitCollection];
  id v10 = [v9 userInterfaceStyle];

  if (v8 != v10)
  {
    [(RCPlaybackViewController *)self handleDarkmodeChange];
    id v11 = +[NSNotificationCenter defaultCenter];
    [v11 postNotificationName:@"RCTraitCollectionUserInterfaceStyleChangedNotification" object:0];
  }
}

- (BOOL)_supportsTimelineGeneration
{
  return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RCPlaybackViewController;
  -[RCRecordingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  id v8 = +[UIApplication sharedApplication];
  id v9 = [v8 applicationState];

  if (v9 != (id)2)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100084050;
    v10[3] = &unk_100221960;
    v10[4] = self;
    [v7 animateAlongsideTransition:v10 completion:0];
  }
}

- (void)_toggleFavorite
{
  id v4 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  unsigned int v3 = [(RCRecordingViewController *)self UUID];
  [v4 toggleFavoriteForUUID:v3];
}

- (void)_doShare:(id)a3
{
  id v4 = a3;
  id v6 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  id v5 = [(RCRecordingViewController *)self UUID];
  [v6 performAction:29 atPosition:v5 forUUID:self sourceController:v4 source:0.0];
}

- (void)_doDelete:(id)a3
{
  id v4 = a3;
  id v6 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  id v5 = [(RCRecordingViewController *)self UUID];
  [v6 performAction:14 atPosition:v5 forUUID:self sourceController:v4 source:0.0];
}

- (void)_doRecover:(id)a3
{
  id v4 = a3;
  id v6 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  id v5 = [(RCRecordingViewController *)self UUID];
  [v6 performAction:20 atPosition:v5 forUUID:self sourceController:v4 source:0.0];
}

- (void)_doErase:(id)a3
{
  id v4 = a3;
  id v6 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  id v5 = [(RCRecordingViewController *)self UUID];
  [v6 performAction:17 atPosition:v5 forUUID:self sourceController:v4 source:0.0];
}

- (void)_doDisplayPlaybackSettings:(id)a3
{
  id v4 = a3;
  id v6 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  id v5 = [(RCRecordingViewController *)self UUID];
  [v6 performAction:44 atPosition:v5 forUUID:self sourceController:v4 source:0.0];
}

- (void)_doShowTranscriptionView:(id)a3
{
  id v4 = a3;
  id v6 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  id v5 = [(RCRecordingViewController *)self UUID];
  [v6 performAction:45 atPosition:v5 forUUID:self sourceController:v4 source:0.0];
}

- (void)_doEdit
{
  [(RCRecordingViewController *)self stopScrolling];
  id v4 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  unsigned int v3 = [(RCRecordingViewController *)self UUID];
  [v4 performAction:23 atPosition:v3 forUUID:0 sourceController:0 source:0.0];
}

- (void)_doMoveToFolder:(id)a3
{
  id v4 = a3;
  id v6 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  id v5 = [(RCRecordingViewController *)self UUID];
  [v6 performAction:42 atPosition:v5 forUUID:self sourceController:v4 source:0.0];
}

- (void)enterEditMode
{
}

- (void)enableWaveformScrolling:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RCRecordingViewController *)self waveformContainerViewControllers];
  [v4 enableWaveformScrolling:v3];
}

- (id)createNewWaveformViewControllerWithDataSource:(id)a3 isOverview:(BOOL)a4 isCompact:(BOOL)a5 waveformOnly:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)RCPlaybackViewController;
  id v7 = [(RCRecordingViewController *)&v11 createNewWaveformViewControllerWithDataSource:a3 isOverview:a4 isCompact:a5 waveformOnly:a6];
  id v8 = [v7 waveformViewController];
  [v8 setIsPlayback:1];

  id v9 = [(RCPlaybackViewController *)self view];
  [v9 setDisplayStyle:3];

  return v7;
}

- (void)enablePlaybackWithComposition:(id)a3 displayModel:(id)a4 timeController:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  [(RCRecordingViewController *)self setActiveTimeController:a5];
  [(RCRecordingViewController *)self reloadWaveformsFromComposition:v9];

  [(RCPlaybackViewController *)self updateWithRecordingModel:v8];
  id v10 = [(RCRecordingViewController *)self waveformContainerViewControllers];
  [v10 setIsPlayback:1];

  objc_super v11 = [(RCRecordingViewController *)self waveformContainerViewControllers];
  [v11 resetZoomScale];

  v12 = [(RCRecordingViewController *)self overviewWaveformViewController];
  id v13 = [v12 waveformViewController];
  [v13 setIsPlayback:1];

  id v14 = [(RCPlaybackViewController *)self view];
  [v14 setRecordingViewState:2 * (v8 != 0)];
  [(RCRecordingViewController *)self _beginFileTranscriptionIfNeeded];
}

- (void)updateContentUnavailableViewState:(int64_t)a3
{
  [(RCPlaybackViewController *)self setContentUnavailableState:a3];

  [(RCPlaybackViewController *)self setNeedsUpdateContentUnavailableConfiguration];
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  int64_t v4 = [(RCPlaybackViewController *)self contentUnavailableState];
  if (v4 == -1)
  {
    id v10 = 0;
  }
  else
  {
    id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
    id v12 = +[UIContentUnavailableConfiguration emptyConfiguration];
    id v6 = [v5 playbackContentUnavailableViewBackgroundColor];
    id v7 = [v12 background];
    [v7 setBackgroundColor:v6];

    if ((id)[(RCPlaybackViewController *)self contentUnavailableState] == (id)1)
    {
      id v8 = +[NSBundle mainBundle];
      id v9 = [v8 localizedStringForKey:@"PLAYBACK_CONTENT_NO_SELECTION_TITLE" value:&stru_100228BC8 table:0];
      [v12 setText:v9];
    }
    id v10 = v12;
  }
  id v13 = v10;
  [(RCPlaybackViewController *)self setContentUnavailableConfiguration:v10];
  objc_super v11 = [(RCPlaybackViewController *)self view];
  [v11 updateUIForContentUnavailable:v4 != -1];
}

- (void)handleDarkmodeChange
{
  BOOL v3 = [(RCPlaybackViewController *)self view];
  [v3 updateColors];

  int64_t v4 = [(RCPlaybackViewController *)self view];
  [v4 restyle];

  id v5 = [(RCRecordingViewController *)self waveformContainerViewControllers];
  [v5 updateColors];

  id v7 = [(RCRecordingViewController *)self overviewWaveformViewController];
  id v6 = [v7 waveformViewController];
  [v6 updateColors];
}

- (void)deviceTranscriptionSupportDidChange:(BOOL)a3
{
  [(RCRecordingViewController *)self _setupTranscriptViewDependenciesIfNeeded];
  [(RCPlaybackViewController *)self _updateMoreOptionsMenu];

  [(RCPlaybackViewController *)self _updateToolbarItems];
}

- (UISplitViewController)parentSplitViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSplitViewController);

  return (UISplitViewController *)WeakRetained;
}

- (void)setParentSplitViewController:(id)a3
{
}

- (BOOL)isRecentlyDeleted
{
  return self->_isRecentlyDeleted;
}

- (void)setIsRecentlyDeleted:(BOOL)a3
{
  self->_isRecentlyDeleted = a3;
}

- (UIBarButtonItem)favoriteButtonItem
{
  return self->_favoriteButtonItem;
}

- (void)setFavoriteButtonItem:(id)a3
{
}

- (UIBarButtonItem)shareButtonItem
{
  return self->_shareButtonItem;
}

- (void)setShareButtonItem:(id)a3
{
}

- (UIBarButtonItem)deleteButtonItem
{
  return self->_deleteButtonItem;
}

- (void)setDeleteButtonItem:(id)a3
{
}

- (UIBarButtonItem)editButtonItem
{
  return self->_editButtonItem;
}

- (void)setEditButtonItem:(id)a3
{
}

- (UIBarButtonItem)recoverButtonItem
{
  return self->_recoverButtonItem;
}

- (void)setRecoverButtonItem:(id)a3
{
}

- (UIBarButtonItem)eraseButtonItem
{
  return self->_eraseButtonItem;
}

- (void)setEraseButtonItem:(id)a3
{
}

- (UIBarButtonItem)moveToFolderButtonItem
{
  return self->_moveToFolderButtonItem;
}

- (void)setMoveToFolderButtonItem:(id)a3
{
}

- (UIBarButtonItem)moreOptionsButtonItem
{
  return self->_moreOptionsButtonItem;
}

- (void)setMoreOptionsButtonItem:(id)a3
{
}

- (UIBarButtonItem)transcriptionButtonItem
{
  return self->_transcriptionButtonItem;
}

- (void)setTranscriptionButtonItem:(id)a3
{
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (BOOL)didSetupToolbarWithButtonItems
{
  return self->_didSetupToolbarWithButtonItems;
}

- (void)setDidSetupToolbarWithButtonItems:(BOOL)a3
{
  self->_didSetupToolbarWithButtonItems = a3;
}

- (int64_t)contentUnavailableState
{
  return self->_contentUnavailableState;
}

- (void)setContentUnavailableState:(int64_t)a3
{
  self->_contentUnavailableState = a3;
}

- (UIBarButtonItem)playbackSettingsButtonItem
{
  return self->_playbackSettingsButtonItem;
}

- (void)setPlaybackSettingsButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSettingsButtonItem, 0);
  objc_storeStrong((id *)&self->_transcriptionButtonItem, 0);
  objc_storeStrong((id *)&self->_moreOptionsButtonItem, 0);
  objc_storeStrong((id *)&self->_moveToFolderButtonItem, 0);
  objc_storeStrong((id *)&self->_eraseButtonItem, 0);
  objc_storeStrong((id *)&self->_recoverButtonItem, 0);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteButtonItem, 0);
  objc_storeStrong((id *)&self->_shareButtonItem, 0);
  objc_storeStrong((id *)&self->_favoriteButtonItem, 0);

  objc_destroyWeak((id *)&self->_parentSplitViewController);
}

@end
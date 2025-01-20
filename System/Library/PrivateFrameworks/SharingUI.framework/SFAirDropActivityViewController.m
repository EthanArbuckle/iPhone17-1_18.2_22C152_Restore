@interface SFAirDropActivityViewController
+ (BOOL)airDropActivityCanPerformActivityWithItemClasses:(id)a3;
+ (BOOL)isAirDropAvailable;
- ($115C4C562B26FF47E01F9F4EA65B5887)sendingApplicationAuditToken;
- (BOOL)addAttributedString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (BOOL)addData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8;
- (BOOL)addImage:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (BOOL)addItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6;
- (BOOL)addItemProvider:(id)a3 withDataType:(id)a4 attachmentName:(id)a5 description:(id)a6 previewImage:(id)a7;
- (BOOL)addString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (BOOL)addURL:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)createURLPayloadForData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8 completion:(id)a9;
- (BOOL)darkStyleOnLegacyApp;
- (BOOL)enableModernShareSheeet;
- (BOOL)isBluetoothEnabled;
- (BOOL)isDebugMode;
- (BOOL)isTetheredModeEnabled;
- (BOOL)isValidPayload:(id)a3 toPerson:(id)a4 invalidMessage:(id *)a5;
- (BOOL)isWifiEnabled;
- (BOOL)manuallyManageBrowsing;
- (BOOL)multipleRows;
- (BOOL)otherActivityViewPresented;
- (BOOL)sharedItemsAvailable;
- (CGSize)_cachedPreferredItemSize;
- (CGSize)calculatePreferredContentSize;
- (CGSize)suggestedThumbnailSize;
- (NSArray)photosAssetIDs;
- (NSArray)urlsBeingShared;
- (NSString)overriddenInstructionsText;
- (NSString)overriddenNoAWDLText;
- (NSString)overriddenNoWiFIBTText;
- (NSString)overriddenTitleText;
- (SFAirDropActivityViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SFAirDropActivityViewControllerDelegate)delegate;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)_fontWithStyle:(id)a3 maxSizeCategory:(id)a4 traits:(unsigned int)a5;
- (id)attributedStringWithTitle:(id)a3 content:(id)a4;
- (id)cellForPerson:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)indexSetToIndexPaths:(id)a3 inSection:(int64_t)a4;
- (id)instructionsText;
- (id)noAWDLText;
- (id)noWiFiBTText;
- (id)preferredFocusEnvironments;
- (id)titleText;
- (id)wifiBtHelpTextLocalizedStringKey;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_collectTelemetryForPeople:(id)a3;
- (void)_createiOSLayoutConstraints;
- (void)_createtvOSLayoutConstraints;
- (void)_emitTelemetryForPerson:(id)a3;
- (void)_setIsLoadingActivityItemProviders:(BOOL)a3;
- (void)_startTelemetry;
- (void)_stopTelemetry;
- (void)_updateExclusionPathsForTextViews;
- (void)_updateFontSizes;
- (void)browserDidUpdatePeople:(id)a3;
- (void)cleanupWithSelectedActivityType:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)dealloc;
- (void)didEnterBackground:(id)a3;
- (void)enableAirDropRequiredFeatures;
- (void)generateSpecialPreviewPhotoForRequestID:(int64_t)a3;
- (void)handleImageItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (void)handleLivePhotoItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (void)handleOperationCallback:(__SFOperation *)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)handleOtherItemProvider:(id)a3 withDataType:(id)a4 attachmentName:(id)a5 description:(id)a6 previewImage:(id)a7;
- (void)invalidate;
- (void)personCollectionViewCellDidFinishTransfer:(id)a3;
- (void)personCollectionViewCellDidStartTransfer:(id)a3;
- (void)personCollectionViewCellDidTerminateTransfer:(id)a3;
- (void)setDarkStyleOnLegacyApp:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setManuallyManageBrowsing:(BOOL)a3;
- (void)setMultipleRows:(BOOL)a3;
- (void)setNeedsRequestingSharedItems;
- (void)setOtherActivityViewPresented:(BOOL)a3;
- (void)setOverriddenInstructionsText:(id)a3;
- (void)setOverriddenNoAWDLText:(id)a3;
- (void)setOverriddenNoWiFIBTText:(id)a3;
- (void)setOverriddenTitleText:(id)a3;
- (void)setPhotosAssetIDs:(id)a3;
- (void)setSendingApplicationAuditToken:(id *)a3;
- (void)setSharedItemsAvailable:(BOOL)a3;
- (void)setUrlsBeingShared:(id)a3;
- (void)showMore:(id)a3;
- (void)startBrowsing;
- (void)startTransferForPeople:(id)a3;
- (void)stopBrowsing;
- (void)subscribeToProgresses;
- (void)subscribedProgress:(id)a3 forPersonWithRealName:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)unpublishedProgressForPersonWithRealName:(id)a3;
- (void)unsubscribeToProgresses;
- (void)updatePreferredContentSize;
- (void)updateShowMoreButtonForShowPeople:(BOOL)a3 inactive:(BOOL)a4 active:(BOOL)a5 static:(BOOL)a6;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willEnterForeground:(id)a3;
- (void)wirelessSettingsDidChange:(id)a3;
@end

@implementation SFAirDropActivityViewController

- (SFAirDropActivityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v30.receiver = self;
  v30.super_class = (Class)SFAirDropActivityViewController;
  v4 = [(SFAirDropActivityViewController *)&v30 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = SFLocalizedStringForKey();
    [(SFAirDropActivityViewController *)v4 setTitle:v5];

    v6 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v7 = [v6 bundleIdentifier];
    sendingAppBundleID = v4->_sendingAppBundleID;
    v4->_sendingAppBundleID = (NSString *)v7;

    v4->_attachmentCount = 0;
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    personToProgress = v4->_personToProgress;
    v4->_personToProgress = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    personToStoredTransferFinalState = v4->_personToStoredTransferFinalState;
    v4->_personToStoredTransferFinalState = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    personToSharedItemsRequestID = v4->_personToSharedItemsRequestID;
    v4->_personToSharedItemsRequestID = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    sharedItemsRequestIDToPreviewPhoto = v4->_sharedItemsRequestIDToPreviewPhoto;
    v4->_sharedItemsRequestIDToPreviewPhoto = (NSMutableDictionary *)v15;

    v17 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    cachedSharedItems = v4->_cachedSharedItems;
    v4->_cachedSharedItems = v17;

    v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v4->_operationQueue;
    v4->_operationQueue = v19;

    [(NSOperationQueue *)v4->_operationQueue setMaxConcurrentOperationCount:1];
    v21 = [MEMORY[0x263F08C38] UUID];
    v22 = [v21 UUIDString];
    uint64_t v23 = objc_msgSend(v22, "substringWithRange:", 24, 12);
    sessionID = v4->_sessionID;
    v4->_sessionID = (NSString *)v23;

    v4->_sharedItemsAvailable = 1;
    v4->_logger = 0;
    uint64_t v25 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    realNameToFirstSeenTimestamp = v4->_realNameToFirstSeenTimestamp;
    v4->_realNameToFirstSeenTimestamp = (NSMapTable *)v25;

    v4->_sharedItemsCount = 0;
    uint64_t v27 = [MEMORY[0x263EFF9A0] dictionary];
    sharedItemsMap = v4->_sharedItemsMap;
    v4->_sharedItemsMap = (NSMutableDictionary *)v27;
  }
  return v4;
}

- (void)dealloc
{
  [(SFAirDropActivityViewController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropActivityViewController;
  [(SFAirDropActivityViewController *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = [(UICollectionView *)self->_collectionView visibleCells];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setDelegate:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(UICollectionView *)self->_collectionView setDataSource:0];
  [(UICollectionView *)self->_collectionView setDelegate:0];
  [(SFWirelessSettingsController *)self->_wirelessSettings setDelegate:0];
  [(SFWirelessSettingsController *)self->_wirelessSettings invalidate];
  [(SFAirDropBrowser *)self->_browser setDelegate:0];
  [(SFAirDropBrowser *)self->_browser stop];
  if (self->_logger)
  {
    SFOperationCancel();
    CFRelease(self->_logger);
    self->_logger = 0;
  }
}

- (void)startBrowsing
{
  if (!self->_browserPaused)
  {
    if (self->_browser && ![(SFAirDropActivityViewController *)self manuallyManageBrowsing]) {
      [(SFAirDropActivityViewController *)self stopBrowsing];
    }
    [(SFAirDropActivityViewController *)self _startTelemetry];
    [(SFAirDropActivityViewController *)self subscribeToProgresses];
    objc_super v3 = (SFAirDropBrowser *)objc_alloc_init(MEMORY[0x263F6C1B0]);
    browser = self->_browser;
    self->_browser = v3;

    [(SFAirDropBrowser *)self->_browser setSessionID:self->_sessionID];
    [(SFAirDropBrowser *)self->_browser setBatchDelegate:self];
    [(SFAirDropBrowser *)self->_browser setSendingAppBundleID:self->_sendingAppBundleID];
    [(SFAirDropBrowser *)self->_browser setUrlsBeingShared:self->_urlsBeingShared];
    [(SFAirDropBrowser *)self->_browser setPhotosAssetIDs:self->_photosAssetIDs];
    [(SFAirDropBrowser *)self->_browser start];
    uint64_t v5 = (SFWirelessSettingsController *)objc_alloc_init(MEMORY[0x263F6C2E8]);
    wirelessSettings = self->_wirelessSettings;
    self->_wirelessSettings = v5;

    uint64_t v7 = self->_wirelessSettings;
    [(SFWirelessSettingsController *)v7 setDelegate:self];
  }
}

- (void)stopBrowsing
{
  self->_browserPaused = 0;
  [(SFAirDropActivityViewController *)self unsubscribeToProgresses];
  [(SFWirelessSettingsController *)self->_wirelessSettings setDelegate:0];
  [(SFWirelessSettingsController *)self->_wirelessSettings invalidate];
  wirelessSettings = self->_wirelessSettings;
  self->_wirelessSettings = 0;

  NSUInteger v4 = [(NSArray *)self->_people count];
  [(SFAirDropBrowser *)self->_browser stop];
  [(SFAirDropBrowser *)self->_browser setDelegate:0];
  browser = self->_browser;
  self->_browser = 0;

  people = self->_people;
  self->_people = 0;

  collectionView = self->_collectionView;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__SFAirDropActivityViewController_stopBrowsing__block_invoke;
  v8[3] = &unk_264471E70;
  v8[4] = self;
  v8[5] = v4;
  [(UICollectionView *)collectionView performBatchUpdates:v8 completion:0];
  [(SFAirDropActivityViewController *)self _stopTelemetry];
}

void __47__SFAirDropActivityViewController_stopBrowsing__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 40))
  {
    unint64_t v2 = 0;
    do
    {
      objc_super v3 = *(void **)(*(void *)(a1 + 32) + 1176);
      NSUInteger v4 = [MEMORY[0x263F088C8] indexPathForItem:v2 inSection:0];
      v6[0] = v4;
      uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
      [v3 deleteItemsAtIndexPaths:v5];

      ++v2;
    }
    while (*(void *)(a1 + 40) > v2);
  }
}

- (void)_setIsLoadingActivityItemProviders:(BOOL)a3
{
  if (!self->_didSelectNode && self->_browserPaused != a3)
  {
    if (a3)
    {
      self->_browserPaused = 1;
      [(SFAirDropBrowser *)self->_browser pause];
      if (![(SFAirDropActivityViewController *)self isDebugMode]) {
        return;
      }
      NSUInteger v4 = [MEMORY[0x263F825C8] redColor];
    }
    else
    {
      self->_browserPaused = 0;
      [(SFAirDropBrowser *)self->_browser resume];
      if (![(SFAirDropActivityViewController *)self isDebugMode]) {
        return;
      }
      NSUInteger v4 = [MEMORY[0x263F825C8] greenColor];
    }
    id v5 = v4;
    uint64_t v6 = [v5 CGColor];
    uint64_t v7 = [(SFAirDropActivityViewController *)self view];
    long long v8 = [v7 layer];
    [v8 setBorderColor:v6];

    id v10 = [(SFAirDropActivityViewController *)self view];
    long long v9 = [v10 layer];
    [v9 setBorderWidth:5.0];
  }
}

- (void)didEnterBackground:(id)a3
{
  if (![(SFAirDropActivityViewController *)self manuallyManageBrowsing])
  {
    [(SFAirDropActivityViewController *)self stopBrowsing];
  }
}

- (void)willEnterForeground:(id)a3
{
  if (![(SFAirDropActivityViewController *)self manuallyManageBrowsing])
  {
    [(SFAirDropActivityViewController *)self startBrowsing];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SFAirDropActivityViewController;
  [(SFAirDropActivityViewController *)&v9 viewWillAppear:a3];
  NSUInteger v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_didEnterBackground_ name:*MEMORY[0x263F83330] object:0];
  [v4 addObserver:self selector:sel_willEnterForeground_ name:*MEMORY[0x263F833B8] object:0];
  if (!self->_browser && ![(SFAirDropActivityViewController *)self manuallyManageBrowsing]) {
    [(SFAirDropActivityViewController *)self startBrowsing];
  }
  [(SFAirDropActivityViewController *)self updateContentAreaAnimated:0];
  titleLabel = self->_titleLabel;
  uint64_t v6 = [MEMORY[0x263F825C8] colorWithWhite:dbl_21DBB2210[!self->_darkStyleOnLegacyApp] alpha:1.0];
  [(UILabel *)titleLabel setColor:v6];

  uint64_t v7 = [MEMORY[0x263F825C8] colorWithWhite:dbl_21DBB2220[!self->_darkStyleOnLegacyApp] alpha:1.0];
  [(UITextView *)self->_noWifiTextView setTextColor:v7];
  [(UITextView *)self->_instructionsTextView setTextColor:v7];
  [(UITextView *)self->_noAWDLTextView setTextColor:v7];
  long long v8 = [(SFAirDropActivityViewController *)self view];
  [v8 setNeedsLayout];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F83330] object:0];
  [v5 removeObserver:self name:*MEMORY[0x263F833B8] object:0];
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  if (![(SFAirDropActivityViewController *)self manuallyManageBrowsing]) {
    [(SFAirDropActivityViewController *)self stopBrowsing];
  }
  v6.receiver = self;
  v6.super_class = (Class)SFAirDropActivityViewController;
  [(SFAirDropActivityViewController *)&v6 viewDidDisappear:v3];
}

- (id)wifiBtHelpTextLocalizedStringKey
{
  if ([(SFWirelessSettingsController *)self->_wirelessSettings deviceSupportsWAPI]) {
    unint64_t v2 = @"SENDER_WLAN_BLUETOOTH_HELP_TEXT";
  }
  else {
    unint64_t v2 = @"SENDER_WIFI_BLUETOOTH_HELP_TEXT";
  }
  return v2;
}

- (id)noWiFiBTText
{
  overriddenNoWiFIBTText = self->_overriddenNoWiFIBTText;
  if (overriddenNoWiFIBTText)
  {
    BOOL v3 = overriddenNoWiFIBTText;
  }
  else
  {
    NSUInteger v4 = [(SFAirDropActivityViewController *)self wifiBtHelpTextLocalizedStringKey];
    SFLocalizedStringForKey();
    BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)noAWDLText
{
  overriddenNoAWDLText = self->_overriddenNoAWDLText;
  if (overriddenNoAWDLText)
  {
    BOOL v3 = overriddenNoAWDLText;
  }
  else
  {
    [(SFWirelessSettingsController *)self->_wirelessSettings isWirelessCarPlayEnabled];
    SFLocalizedStringForKey();
    BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)instructionsText
{
  overriddenInstructionsText = self->_overriddenInstructionsText;
  if (overriddenInstructionsText)
  {
    BOOL v3 = overriddenInstructionsText;
  }
  else
  {
    SFLocalizedStringForKey();
    BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)titleText
{
  overriddenTitleText = self->_overriddenTitleText;
  if (overriddenTitleText)
  {
    BOOL v3 = overriddenTitleText;
  }
  else
  {
    SFLocalizedStringForKey();
    BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)viewDidLoad
{
  v70.receiver = self;
  v70.super_class = (Class)SFAirDropActivityViewController;
  [(SFAirDropActivityViewController *)&v70 viewDidLoad];
  if (![(SFAirDropActivityViewController *)self manuallyManageBrowsing]) {
    [(SFAirDropActivityViewController *)self startBrowsing];
  }
  v69 = [(SFAirDropActivityViewController *)self view];
  BOOL v3 = [MEMORY[0x263F825C8] clearColor];
  [v69 setBackgroundColor:v3];

  [v69 setOpaque:0];
  id v4 = objc_alloc(MEMORY[0x263F828E0]);
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  objc_super v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  long long v11 = [MEMORY[0x263F825C8] clearColor];
  [(UILabel *)self->_titleLabel setBackgroundColor:v11];

  v12 = [(SFAirDropActivityViewController *)self titleText];
  [(UILabel *)self->_titleLabel setText:v12];

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setAlpha:1.0];
  [(UILabel *)self->_titleLabel setNumberOfLines:2];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  uint64_t v13 = objc_alloc_init(SFCollectionViewLayout);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v13;

  uint64_t v15 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x263F82528]), "initWithFrame:collectionViewLayout:", self->_collectionViewLayout, v5, v6, v7, v8);
  collectionView = self->_collectionView;
  self->_collectionView = v15;

  [(UICollectionView *)self->_collectionView setClipsToBounds:0];
  v17 = [MEMORY[0x263F825C8] clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v17];

  [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setAlwaysBounceHorizontal:1];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PersonCellID"];
  [(UICollectionView *)self->_collectionView setAllowsMultipleSelection:1];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = -[SFAirDropIconView initWithFrame:]([SFAirDropIconView alloc], "initWithFrame:", v5, v6, v7, v8);
  airDropIconView = self->_airDropIconView;
  self->_airDropIconView = v18;

  [(SFAirDropIconView *)self->_airDropIconView addTarget:self action:sel_enableAirDropRequiredFeatures forControlEvents:64];
  [(SFAirDropIconView *)self->_airDropIconView setAlpha:0.0];
  [(SFAirDropIconView *)self->_airDropIconView setTranslatesAutoresizingMaskIntoConstraints:0];
  v68 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_enableAirDropRequiredFeatures];
  [v68 setNumberOfTapsRequired:1];
  v20 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x263F82D60]), "initReadonlyAndUnselectableWithFrame:textContainer:", 0, v5, v6, v7, v8);
  noWifiTextView = self->_noWifiTextView;
  self->_noWifiTextView = v20;

  [(UITextView *)self->_noWifiTextView setScrollingEnabled:0];
  v22 = [(UITextView *)self->_noWifiTextView textContainer];
  [v22 setLineFragmentPadding:0.0];

  uint64_t v23 = [(UITextView *)self->_noWifiTextView textContainer];
  [v23 setMaximumNumberOfLines:0];

  v24 = [(UITextView *)self->_noWifiTextView textContainer];
  [v24 setLineBreakMode:4];

  double v25 = *MEMORY[0x263F834E8];
  double v26 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v27 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v28 = *(double *)(MEMORY[0x263F834E8] + 24);
  -[UITextView setTextContainerInset:](self->_noWifiTextView, "setTextContainerInset:", *MEMORY[0x263F834E8], v26, v27, v28);
  v29 = [MEMORY[0x263F825C8] clearColor];
  [(UITextView *)self->_noWifiTextView setBackgroundColor:v29];

  [(UITextView *)self->_noWifiTextView setAlpha:0.0];
  [(UITextView *)self->_noWifiTextView setTextAlignment:4];
  objc_super v30 = [(SFAirDropActivityViewController *)self title];
  v31 = [(SFAirDropActivityViewController *)self noWiFiBTText];
  v32 = [(SFAirDropActivityViewController *)self attributedStringWithTitle:v30 content:v31];
  [(UITextView *)self->_noWifiTextView setAttributedText:v32];

  [(UITextView *)self->_noWifiTextView addGestureRecognizer:v68];
  [(UITextView *)self->_noWifiTextView setUserInteractionEnabled:1];
  [(UITextView *)self->_noWifiTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  v33 = -[SFAirDropActiveIconView initWithFrame:grayscale:]([SFAirDropActiveIconView alloc], "initWithFrame:grayscale:", 0, v5, v6, v7, v8);
  airDropActiveIconView = self->_airDropActiveIconView;
  self->_airDropActiveIconView = v33;

  [(SFAirDropActiveIconView *)self->_airDropActiveIconView setAlpha:0.0];
  [(SFAirDropActiveIconView *)self->_airDropActiveIconView setTranslatesAutoresizingMaskIntoConstraints:0];
  v35 = [MEMORY[0x263F825C8] clearColor];
  [(SFAirDropActiveIconView *)self->_airDropActiveIconView setBackgroundColor:v35];

  v36 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x263F82D60]), "initReadonlyAndUnselectableWithFrame:textContainer:", 0, v5, v6, v7, v8);
  instructionsTextView = self->_instructionsTextView;
  self->_instructionsTextView = v36;

  [(UITextView *)self->_instructionsTextView setScrollingEnabled:0];
  v38 = [(UITextView *)self->_instructionsTextView textContainer];
  [v38 setLineFragmentPadding:0.0];

  -[UITextView setTextContainerInset:](self->_instructionsTextView, "setTextContainerInset:", v25, v26, v27, v28);
  v39 = [(UITextView *)self->_instructionsTextView textContainer];
  [v39 setMaximumNumberOfLines:0];

  v40 = [(UITextView *)self->_instructionsTextView textContainer];
  [v40 setLineBreakMode:4];

  v41 = [MEMORY[0x263F825C8] clearColor];
  [(UITextView *)self->_instructionsTextView setBackgroundColor:v41];

  [(UITextView *)self->_instructionsTextView setAlpha:0.0];
  [(UITextView *)self->_instructionsTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  v42 = -[SFAirDropActiveIconView initWithFrame:grayscale:]([SFAirDropActiveIconView alloc], "initWithFrame:grayscale:", 1, v5, v6, v7, v8);
  airDropInactiveIconView = self->_airDropInactiveIconView;
  self->_airDropInactiveIconView = v42;

  [(SFAirDropActiveIconView *)self->_airDropInactiveIconView setAlpha:0.0];
  [(SFAirDropActiveIconView *)self->_airDropInactiveIconView setTranslatesAutoresizingMaskIntoConstraints:0];
  v44 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x263F82D60]), "initReadonlyAndUnselectableWithFrame:textContainer:", 0, v5, v6, v7, v8);
  noAWDLTextView = self->_noAWDLTextView;
  self->_noAWDLTextView = v44;

  [(UITextView *)self->_noAWDLTextView setScrollingEnabled:0];
  v46 = [(UITextView *)self->_noAWDLTextView textContainer];
  [v46 setLineFragmentPadding:0.0];

  -[UITextView setTextContainerInset:](self->_noAWDLTextView, "setTextContainerInset:", v25, v26, v27, v28);
  v47 = [(UITextView *)self->_noAWDLTextView textContainer];
  [v47 setMaximumNumberOfLines:0];

  v48 = [(UITextView *)self->_noAWDLTextView textContainer];
  [v48 setLineBreakMode:4];

  v49 = [MEMORY[0x263F825C8] clearColor];
  [(UITextView *)self->_noAWDLTextView setBackgroundColor:v49];

  [(UITextView *)self->_noAWDLTextView setAlpha:0.0];
  [(UITextView *)self->_noAWDLTextView setTextAlignment:4];
  v50 = [(SFAirDropActivityViewController *)self title];
  v51 = [(SFAirDropActivityViewController *)self noAWDLText];
  v52 = [(SFAirDropActivityViewController *)self attributedStringWithTitle:v50 content:v51];
  [(UITextView *)self->_noAWDLTextView setAttributedText:v52];

  [(UITextView *)self->_noAWDLTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  v53 = (UIButton *)objc_alloc_init(MEMORY[0x263F824E8]);
  showMoreButton = self->_showMoreButton;
  self->_showMoreButton = v53;

  [(UIButton *)self->_showMoreButton setAlpha:0.0];
  v55 = self->_showMoreButton;
  v56 = SFLocalizedStringForKey();
  [(UIButton *)v55 setTitle:v56 forState:0];

  v57 = self->_showMoreButton;
  v58 = [MEMORY[0x263F825C8] systemBlueColor];
  [(UIButton *)v57 setTitleColor:v58 forState:0];

  [(UIButton *)self->_showMoreButton addTarget:self action:sel_showMore_ forEvents:64];
  [(UIButton *)self->_showMoreButton setTranslatesAutoresizingMaskIntoConstraints:0];
  -[UIButton setContentEdgeInsets:](self->_showMoreButton, "setContentEdgeInsets:", 0.0, 1.0, 0.0, 1.0);
  v59 = (void *)MEMORY[0x263F81708];
  v60 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v60 _scaledValueForValue:11.0];
  v61 = objc_msgSend(v59, "systemFontOfSize:");
  [(UILabel *)self->_titleLabel setFont:v61];

  [(UITextView *)self->_instructionsTextView setTextAlignment:4];
  v62 = [(SFAirDropActivityViewController *)self title];
  v63 = [(SFAirDropActivityViewController *)self instructionsText];
  v64 = [(SFAirDropActivityViewController *)self attributedStringWithTitle:v62 content:v63];
  [(UITextView *)self->_instructionsTextView setAttributedText:v64];

  [v69 addSubview:self->_collectionView];
  [v69 addSubview:self->_titleLabel];
  [v69 addSubview:self->_airDropIconView];
  [v69 addSubview:self->_noWifiTextView];
  [v69 addSubview:self->_airDropActiveIconView];
  [v69 addSubview:self->_instructionsTextView];
  [v69 addSubview:self->_airDropInactiveIconView];
  [v69 addSubview:self->_noAWDLTextView];
  [v69 addSubview:self->_showMoreButton];
  v65 = (void *)MEMORY[0x263F08938];
  v66 = _NSDictionaryOfVariableBindings(&cfstr_Collectionview.isa, self->_collectionView, 0);
  v67 = [v65 constraintsWithVisualFormat:@"H:|[_collectionView]|" options:0 metrics:0 views:v66];

  [v69 addConstraints:v67];
  [(SFAirDropActivityViewController *)self _createiOSLayoutConstraints];
  [(SFAirDropActivityViewController *)self _updateFontSizes];
}

- (void)viewDidLayoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)SFAirDropActivityViewController;
  [(SFAirDropActivityViewController *)&v24 viewDidLayoutSubviews];
  BOOL v3 = [(SFAirDropActivityViewController *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {

    double v5 = (NSString *)*MEMORY[0x263F83440];
LABEL_4:
    [(SFAirDropActivityViewController *)self _updateExclusionPathsForTextViews];
    goto LABEL_5;
  }
  double v5 = (NSString *)*MEMORY[0x263F83440];
  double v6 = [(SFAirDropActivityViewController *)self traitCollection];
  double v7 = [v6 preferredContentSizeCategory];
  NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v5, v7);

  if (v8 == NSOrderedAscending) {
    goto LABEL_4;
  }
LABEL_5:
  [(SFAirDropActiveIconView *)self->_airDropActiveIconView bounds];
  CGFloat Width = CGRectGetWidth(v25);
  double v10 = SFRoundToScreen(Width * 0.5);
  long long v11 = [(SFAirDropActivityViewController *)self traitCollection];
  v12 = [v11 preferredContentSizeCategory];

  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);
  NSComparisonResult v14 = UIContentSizeCategoryCompareToCategory(v5, v12);
  if (IsAccessibilityCategory || v14 == NSOrderedAscending)
  {
    char v20 = v14 != NSOrderedAscending || IsAccessibilityCategory;
    double v18 = 16.0;
    if ((v20 & 1) == 0)
    {
      collectionViewLayout = self->_collectionViewLayout;
      v22 = [(SFAirDropActivityViewController *)self view];
      [v22 bounds];
      [(SFCollectionViewLayout *)collectionViewLayout firstItemCenterForContainerWidth:CGRectGetWidth(v27)];
      double v18 = v23 - v10;
    }
    [MEMORY[0x263F08938] deactivateConstraints:self->_textViewConstraints];
    [MEMORY[0x263F08938] deactivateConstraints:self->_airdropViewYConstraints];
    [MEMORY[0x263F08938] activateConstraints:self->_largeTextTextViewConstraints];
    [MEMORY[0x263F08938] activateConstraints:self->_largeTextAirdropViewYConstraints];
    double titleLabelTopConstraintDefaultConstant = self->_titleLabelTopConstraintDefaultConstant + 3.0;
  }
  else
  {
    uint64_t v15 = self->_collectionViewLayout;
    v16 = [(SFAirDropActivityViewController *)self view];
    [v16 bounds];
    [(SFCollectionViewLayout *)v15 firstItemCenterForContainerWidth:CGRectGetWidth(v26)];
    double v18 = v17 - v10;

    [MEMORY[0x263F08938] deactivateConstraints:self->_largeTextTextViewConstraints];
    [MEMORY[0x263F08938] deactivateConstraints:self->_largeTextAirdropViewYConstraints];
    [MEMORY[0x263F08938] activateConstraints:self->_textViewConstraints];
    [MEMORY[0x263F08938] activateConstraints:self->_airdropViewYConstraints];
    double titleLabelTopConstraintDefaultConstant = self->_titleLabelTopConstraintDefaultConstant;
  }
  [(NSLayoutConstraint *)self->_titleLabelTopConstraint setConstant:titleLabelTopConstraintDefaultConstant];
  [(NSLayoutConstraint *)self->_airDropActiveIconLeftConstraint setConstant:v18];
  [(NSLayoutConstraint *)self->_instructionsRightConstraint setConstant:-v18];
  [(NSLayoutConstraint *)self->_airDropInactiveIconLeftConstraint setConstant:v18];
  [(NSLayoutConstraint *)self->_noAWDLRightConstraint setConstant:-v18];
  [(NSLayoutConstraint *)self->_airDropIconLeftConstraint setConstant:v18];
  [(NSLayoutConstraint *)self->_noWifiRightConstraint setConstant:-v18];
  [(SFAirDropActivityViewController *)self updatePreferredContentSize];
}

- (void)_updateExclusionPathsForTextViews
{
  v41[1] = *MEMORY[0x263EF8340];
  [(UIButton *)self->_showMoreButton alpha];
  if (v3 == 0.0)
  {
    uint64_t v15 = [(UITextView *)self->_instructionsTextView textContainer];
    uint64_t v16 = MEMORY[0x263EFFA68];
    [v15 setExclusionPaths:MEMORY[0x263EFFA68]];

    double v17 = [(UITextView *)self->_noWifiTextView textContainer];
    [v17 setExclusionPaths:v16];

    double v18 = [(UITextView *)self->_noAWDLTextView textContainer];
    [v18 setExclusionPaths:v16];

    [(UITextView *)self->_instructionsTextView sizeToFit];
    [(UITextView *)self->_noWifiTextView sizeToFit];
    noAWDLTextView = self->_noAWDLTextView;
    [(UITextView *)noAWDLTextView sizeToFit];
  }
  else
  {
    [(UIButton *)self->_showMoreButton frame];
    double v5 = v4;
    double v7 = v6;
    NSComparisonResult v8 = [(SFAirDropActivityViewController *)self view];
    int v9 = [v8 _shouldReverseLayoutDirection];
    [(UITextView *)self->_instructionsTextView frame];
    if (v9) {
      double MinX = CGRectGetMinX(*(CGRect *)&v10);
    }
    else {
      double MinX = CGRectGetMaxX(*(CGRect *)&v10) - v5;
    }

    [(UITextView *)self->_instructionsTextView frame];
    double v20 = v7 * 0.5 + CGRectGetMaxY(v43) - v7;
    v21 = (void *)MEMORY[0x263F824C0];
    instructionsTextView = self->_instructionsTextView;
    double v23 = [(SFAirDropActivityViewController *)self view];
    -[UITextView convertRect:fromView:](instructionsTextView, "convertRect:fromView:", v23, MinX, v20, v5, v7);
    objc_super v24 = objc_msgSend(v21, "bezierPathWithRect:");
    v41[0] = v24;
    CGRect v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
    CGRect v26 = [(UITextView *)self->_instructionsTextView textContainer];
    [v26 setExclusionPaths:v25];

    CGRect v27 = (void *)MEMORY[0x263F824C0];
    noWifiTextView = self->_noWifiTextView;
    v29 = [(SFAirDropActivityViewController *)self view];
    -[UITextView convertRect:fromView:](noWifiTextView, "convertRect:fromView:", v29, MinX, v20, v5, v7);
    objc_super v30 = objc_msgSend(v27, "bezierPathWithRect:");
    v40 = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
    v32 = [(UITextView *)self->_noWifiTextView textContainer];
    [v32 setExclusionPaths:v31];

    v33 = (void *)MEMORY[0x263F824C0];
    v34 = self->_noAWDLTextView;
    v35 = [(SFAirDropActivityViewController *)self view];
    -[UITextView convertRect:fromView:](v34, "convertRect:fromView:", v35, MinX, v20, v5, v7);
    v36 = objc_msgSend(v33, "bezierPathWithRect:");
    v39 = v36;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
    v38 = [(UITextView *)self->_noAWDLTextView textContainer];
    [v38 setExclusionPaths:v37];
  }
}

- (void)_createiOSLayoutConstraints
{
  v177[2] = *MEMORY[0x263EF8340];
  double v3 = [(SFAirDropActivityViewController *)self view];
  double v4 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFBLL;
  double v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v9 = 10;
  }
  else {
    uint64_t v9 = 6;
  }
  CGFloat v10 = dbl_21DBB2230[(v8 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    unint64_t v11 = 9;
  }
  else {
    unint64_t v11 = 3;
  }
  if (v6 == 1) {
    double v12 = 78.0;
  }
  else {
    double v12 = 62.0;
  }
  self->_minimumPreferredContentSize.width = 0.0;
  self->_minimumPreferredContentSize.height = v10;
  v176[0] = @"topPadding";
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:v11];
  v176[1] = @"middlePadding";
  v177[0] = v13;
  NSComparisonResult v14 = [NSNumber numberWithUnsignedInteger:v9];
  v177[1] = v14;
  v170 = [NSDictionary dictionaryWithObjects:v177 forKeys:v176 count:2];

  uint64_t v15 = [(UILabel *)self->_titleLabel centerXAnchor];
  uint64_t v16 = [v3 safeAreaLayoutGuide];
  double v17 = [v16 centerXAnchor];
  v171 = [v15 constraintEqualToAnchor:v17];

  [v3 addConstraint:v171];
  double v18 = [(UILabel *)self->_titleLabel widthAnchor];
  v19 = v3;
  double v20 = [v3 safeAreaLayoutGuide];
  v21 = [v20 widthAnchor];
  v22 = [v18 constraintEqualToAnchor:v21 constant:-20.0];
  [v19 addConstraint:v22];

  double v23 = (double)v11;
  self->_double titleLabelTopConstraintDefaultConstant = (double)v11;
  objc_super v24 = [(UILabel *)self->_titleLabel topAnchor];
  CGRect v25 = [v19 safeAreaLayoutGuide];
  CGRect v26 = [v25 topAnchor];
  CGRect v27 = [v24 constraintEqualToAnchor:v26 constant:self->_titleLabelTopConstraintDefaultConstant];
  titleLabelTopConstraint = self->_titleLabelTopConstraint;
  self->_titleLabelTopConstraint = v27;

  [v19 addConstraint:self->_titleLabelTopConstraint];
  v29 = (void *)MEMORY[0x263F08938];
  objc_super v30 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelColl.isa, self->_titleLabel, self->_collectionView, 0);
  v31 = [v29 constraintsWithVisualFormat:@"V:[_titleLabel]-middlePadding-[_collectionView]|" options:0 metrics:v170 views:v30];
  [v19 addConstraints:v31];

  airDropActiveIconView = self->_airDropActiveIconView;
  v33 = [(SFAirDropActiveIconView *)airDropActiveIconView widthAnchor];
  v34 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v35 = [v34 userInterfaceIdiom];

  if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v36 = 76.0;
  }
  else {
    double v36 = 60.0;
  }
  v37 = [v33 constraintEqualToConstant:v36];
  [(SFAirDropActiveIconView *)airDropActiveIconView addConstraint:v37];

  v38 = self->_airDropActiveIconView;
  v39 = [(SFAirDropActiveIconView *)v38 heightAnchor];
  v40 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v41 = [v40 userInterfaceIdiom];

  if ((v41 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v42 = 76.0;
  }
  else {
    double v42 = 60.0;
  }
  CGRect v43 = [v39 constraintEqualToConstant:v42];
  [(SFAirDropActiveIconView *)v38 addConstraint:v43];

  v44 = [(SFAirDropActiveIconView *)self->_airDropActiveIconView leadingAnchor];
  v45 = [v19 safeAreaLayoutGuide];
  v46 = [v45 leadingAnchor];
  v47 = [v44 constraintEqualToAnchor:v46];
  airDropActiveIconLeftConstraint = self->_airDropActiveIconLeftConstraint;
  self->_airDropActiveIconLeftConstraint = v47;

  [v19 addConstraint:self->_airDropActiveIconLeftConstraint];
  airDropIconView = self->_airDropIconView;
  v50 = [(SFAirDropIconView *)airDropIconView widthAnchor];
  v51 = [v50 constraintEqualToConstant:v12];
  [(SFAirDropIconView *)airDropIconView addConstraint:v51];

  v52 = self->_airDropIconView;
  v53 = [(SFAirDropIconView *)v52 heightAnchor];
  v54 = [v53 constraintEqualToConstant:v12];
  [(SFAirDropIconView *)v52 addConstraint:v54];

  v55 = [(SFAirDropIconView *)self->_airDropIconView leadingAnchor];
  v56 = [v19 safeAreaLayoutGuide];
  v57 = [v56 leadingAnchor];
  v58 = [v55 constraintEqualToAnchor:v57];
  airDropIconLeftConstraint = self->_airDropIconLeftConstraint;
  self->_airDropIconLeftConstraint = v58;

  [v19 addConstraint:self->_airDropIconLeftConstraint];
  v60 = [(UITextView *)self->_noAWDLTextView leadingAnchor];
  v61 = [(SFAirDropActiveIconView *)self->_airDropInactiveIconView trailingAnchor];
  v62 = [v60 constraintEqualToAnchor:v61 constant:15.0];
  [v19 addConstraint:v62];

  v63 = [(UITextView *)self->_noAWDLTextView trailingAnchor];
  v64 = [v19 safeAreaLayoutGuide];
  v65 = [v64 trailingAnchor];
  v66 = [v63 constraintEqualToAnchor:v65 constant:5.0];
  noAWDLRightConstraint = self->_noAWDLRightConstraint;
  self->_noAWDLRightConstraint = v66;

  [v19 addConstraint:self->_noAWDLRightConstraint];
  airDropInactiveIconView = self->_airDropInactiveIconView;
  v69 = [(SFAirDropActiveIconView *)airDropInactiveIconView widthAnchor];
  objc_super v70 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v71 = [v70 userInterfaceIdiom];

  if ((v71 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v72 = 76.0;
  }
  else {
    double v72 = 60.0;
  }
  v73 = [v69 constraintEqualToConstant:v72];
  [(SFAirDropActiveIconView *)airDropInactiveIconView addConstraint:v73];

  v74 = self->_airDropInactiveIconView;
  v75 = [(SFAirDropActiveIconView *)v74 heightAnchor];
  v76 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v77 = [v76 userInterfaceIdiom];

  if ((v77 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v78 = 76.0;
  }
  else {
    double v78 = 60.0;
  }
  v79 = [v75 constraintEqualToConstant:v78];
  [(SFAirDropActiveIconView *)v74 addConstraint:v79];

  v80 = [(SFAirDropActiveIconView *)self->_airDropInactiveIconView leadingAnchor];
  v81 = [v19 safeAreaLayoutGuide];
  v82 = [v81 leadingAnchor];
  v83 = [v80 constraintEqualToAnchor:v82];
  airDropInactiveIconLeftConstraint = self->_airDropInactiveIconLeftConstraint;
  self->_airDropInactiveIconLeftConstraint = v83;

  [v19 addConstraint:self->_airDropInactiveIconLeftConstraint];
  v85 = [(UITextView *)self->_noWifiTextView leadingAnchor];
  v86 = [(SFAirDropIconView *)self->_airDropIconView trailingAnchor];
  v87 = [v85 constraintEqualToAnchor:v86 constant:15.0];
  [v19 addConstraint:v87];

  v88 = [(UITextView *)self->_noWifiTextView trailingAnchor];
  v89 = [v19 safeAreaLayoutGuide];
  v90 = [v89 trailingAnchor];
  v91 = [v88 constraintEqualToAnchor:v90 constant:-12.0];
  noWifiRightConstraint = self->_noWifiRightConstraint;
  self->_noWifiRightConstraint = v91;

  v93 = v19;
  [v19 addConstraint:self->_noWifiRightConstraint];
  v94 = [(UITextView *)self->_instructionsTextView leadingAnchor];
  v95 = [(SFAirDropActiveIconView *)self->_airDropActiveIconView trailingAnchor];
  v96 = [v94 constraintEqualToAnchor:v95 constant:15.0];
  [v19 addConstraint:v96];

  v97 = [(UITextView *)self->_instructionsTextView trailingAnchor];
  v98 = [v19 safeAreaLayoutGuide];
  v99 = [v98 trailingAnchor];
  v100 = [v97 constraintEqualToAnchor:v99 constant:-5.0];
  instructionsRightConstraint = self->_instructionsRightConstraint;
  self->_instructionsRightConstraint = v100;

  [v19 addConstraint:self->_instructionsRightConstraint];
  v102 = [(UIButton *)self->_showMoreButton trailingAnchor];
  v103 = [(UITextView *)self->_instructionsTextView trailingAnchor];
  v104 = [v102 constraintEqualToAnchor:v103];
  [v19 addConstraint:v104];

  v105 = [(UIButton *)self->_showMoreButton bottomAnchor];
  v106 = [(UITextView *)self->_instructionsTextView bottomAnchor];
  v107 = [v105 constraintEqualToAnchor:v106];
  [v19 addConstraint:v107];

  v108 = [(SFAirDropActiveIconView *)self->_airDropActiveIconView centerYAnchor];
  v166 = v108;
  uint64_t v109 = [(UICollectionView *)self->_collectionView topAnchor];
  v164 = (void *)v109;
  v110 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v111 = [v110 userInterfaceIdiom];

  if ((v111 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v112 = 38.0;
  }
  else {
    double v112 = 30.0;
  }
  v113 = [v108 constraintEqualToAnchor:v109 constant:floor(v112) + -1.0];
  v175[0] = v113;
  v114 = [(SFAirDropIconView *)self->_airDropIconView centerYAnchor];
  v115 = [(UICollectionView *)self->_collectionView topAnchor];
  v116 = [v114 constraintEqualToAnchor:v115 constant:floor(v12 * 0.5) + -2.0];
  v175[1] = v116;
  v117 = [(SFAirDropActiveIconView *)self->_airDropInactiveIconView centerYAnchor];
  v118 = [(UICollectionView *)self->_collectionView topAnchor];
  v119 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v120 = [v119 userInterfaceIdiom];

  if ((v120 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v121 = 38.0;
  }
  else {
    double v121 = 30.0;
  }
  v122 = [v117 constraintEqualToAnchor:v118 constant:floor(v121) + -1.0];
  v175[2] = v122;
  v123 = [MEMORY[0x263EFF8C0] arrayWithObjects:v175 count:3];
  airdropViewYConstraints = self->_airdropViewYConstraints;
  self->_airdropViewYConstraints = v123;

  v125 = [MEMORY[0x263F81708] systemFontOfSize:11.0];
  [v125 lineHeight];
  v126 = [(SFAirDropActivityViewController *)self traitCollection];
  [v126 displayScale];
  UIRoundToScale();
  double v128 = v127;

  v167 = [(SFAirDropActiveIconView *)self->_airDropActiveIconView topAnchor];
  v169 = [v93 safeAreaLayoutGuide];
  v165 = [v169 topAnchor];
  double v129 = v128 + v23;
  v130 = [v167 constraintEqualToAnchor:v165 constant:v129];
  largeTextAirdropViewYConstraint = self->_largeTextAirdropViewYConstraint;
  self->_largeTextAirdropViewYConstraint = v130;

  v174[0] = v130;
  v132 = [(SFAirDropIconView *)self->_airDropIconView topAnchor];
  v168 = v93;
  v133 = [v93 safeAreaLayoutGuide];
  v134 = [v133 topAnchor];
  v135 = [v132 constraintEqualToAnchor:v134 constant:v129];
  v174[1] = v135;
  v136 = [(SFAirDropActiveIconView *)self->_airDropInactiveIconView topAnchor];
  v137 = [v93 safeAreaLayoutGuide];
  v138 = [v137 topAnchor];
  v139 = [v136 constraintEqualToAnchor:v138 constant:v129];
  v174[2] = v139;
  v140 = [MEMORY[0x263EFF8C0] arrayWithObjects:v174 count:3];
  largeTextAirdropViewYConstraints = self->_largeTextAirdropViewYConstraints;
  self->_largeTextAirdropViewYConstraints = v140;

  v142 = [(UITextView *)self->_noAWDLTextView centerYAnchor];
  v143 = [(SFAirDropActiveIconView *)self->_airDropInactiveIconView centerYAnchor];
  v144 = [v142 constraintEqualToAnchor:v143];
  v173[0] = v144;
  v145 = [(UITextView *)self->_noWifiTextView centerYAnchor];
  v146 = [(SFAirDropIconView *)self->_airDropIconView centerYAnchor];
  v147 = [v145 constraintEqualToAnchor:v146];
  v173[1] = v147;
  v148 = [(UITextView *)self->_instructionsTextView centerYAnchor];
  v149 = [(SFAirDropActiveIconView *)self->_airDropActiveIconView centerYAnchor];
  v150 = [v148 constraintEqualToAnchor:v149];
  v173[2] = v150;
  v151 = [MEMORY[0x263EFF8C0] arrayWithObjects:v173 count:3];
  textViewConstraints = self->_textViewConstraints;
  self->_textViewConstraints = v151;

  v153 = [(UITextView *)self->_noAWDLTextView topAnchor];
  v154 = [(SFAirDropActiveIconView *)self->_airDropInactiveIconView topAnchor];
  v155 = [v153 constraintEqualToAnchor:v154];
  v172[0] = v155;
  v156 = [(UITextView *)self->_noWifiTextView topAnchor];
  v157 = [(SFAirDropIconView *)self->_airDropIconView topAnchor];
  v158 = [v156 constraintEqualToAnchor:v157];
  v172[1] = v158;
  v159 = [(UITextView *)self->_instructionsTextView topAnchor];
  v160 = [(SFAirDropActiveIconView *)self->_airDropActiveIconView topAnchor];
  v161 = [v159 constraintEqualToAnchor:v160];
  v172[2] = v161;
  v162 = [MEMORY[0x263EFF8C0] arrayWithObjects:v172 count:3];
  largeTextTextViewConstraints = self->_largeTextTextViewConstraints;
  self->_largeTextTextViewConstraints = v162;
}

- (void)_createtvOSLayoutConstraints
{
  v110 = [(SFAirDropActivityViewController *)self view];
  double v3 = [(UIVisualEffectView *)self->_titleVibrancyView widthAnchor];
  double v4 = [v110 widthAnchor];
  uint64_t v109 = [v3 constraintEqualToAnchor:v4];

  uint64_t v5 = [(UIVisualEffectView *)self->_titleVibrancyView heightAnchor];
  unint64_t v6 = [v110 heightAnchor];
  v108 = [v5 constraintEqualToAnchor:v6 multiplier:0.22];

  double v7 = [(UIVisualEffectView *)self->_titleVibrancyView topAnchor];
  uint64_t v8 = [v110 topAnchor];
  v107 = [v7 constraintEqualToAnchor:v8];

  [v109 setActive:1];
  [v108 setActive:1];
  [v107 setActive:1];
  uint64_t v9 = [(UIVisualEffectView *)self->_iconsVibrancyView widthAnchor];
  CGFloat v10 = [v110 widthAnchor];
  v106 = [v9 constraintEqualToAnchor:v10];

  unint64_t v11 = [(UIVisualEffectView *)self->_iconsVibrancyView heightAnchor];
  double v12 = [v110 heightAnchor];
  v105 = [v11 constraintEqualToAnchor:v12 multiplier:0.45];

  uint64_t v13 = [(UIVisualEffectView *)self->_iconsVibrancyView topAnchor];
  NSComparisonResult v14 = [(UIVisualEffectView *)self->_titleVibrancyView bottomAnchor];
  v104 = [v13 constraintEqualToAnchor:v14];

  [v106 setActive:1];
  [v105 setActive:1];
  [v104 setActive:1];
  uint64_t v15 = [(UICollectionView *)self->_collectionView widthAnchor];
  uint64_t v16 = [v110 widthAnchor];
  v103 = [v15 constraintEqualToAnchor:v16];

  double v17 = [(UICollectionView *)self->_collectionView heightAnchor];
  double v18 = [v110 heightAnchor];
  v102 = [v17 constraintEqualToAnchor:v18 multiplier:0.33];

  v19 = [(UICollectionView *)self->_collectionView topAnchor];
  double v20 = [(UIVisualEffectView *)self->_titleVibrancyView bottomAnchor];
  v101 = [v19 constraintEqualToAnchor:v20 constant:48.0];

  [v103 setActive:1];
  [v102 setActive:1];
  [v101 setActive:1];
  v21 = [(UIVisualEffectView *)self->_instructionsVibrancyView widthAnchor];
  v22 = [v110 widthAnchor];
  v100 = [v21 constraintEqualToAnchor:v22];

  double v23 = [(UIVisualEffectView *)self->_instructionsVibrancyView heightAnchor];
  objc_super v24 = [v110 heightAnchor];
  v99 = [v23 constraintEqualToAnchor:v24 multiplier:0.33];

  CGRect v25 = [(UIVisualEffectView *)self->_instructionsVibrancyView topAnchor];
  CGRect v26 = [(UIVisualEffectView *)self->_iconsVibrancyView bottomAnchor];
  v98 = [v25 constraintEqualToAnchor:v26];

  [v100 setActive:1];
  [v99 setActive:1];
  [v98 setActive:1];
  CGRect v27 = [(UILabel *)self->_titleLabel centerXAnchor];
  double v28 = [v110 centerXAnchor];
  v97 = [v27 constraintEqualToAnchor:v28];

  v29 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  objc_super v30 = [v110 topAnchor];
  v96 = [v29 constraintEqualToAnchor:v30 constant:198.0];

  [v97 setActive:1];
  [v96 setActive:1];
  v31 = [(SFAirDropActiveIconView *)self->_airDropActiveIconView widthAnchor];
  v95 = [v31 constraintEqualToConstant:266.0];

  v32 = [(SFAirDropActiveIconView *)self->_airDropActiveIconView heightAnchor];
  v93 = [v32 constraintEqualToConstant:266.0];

  v33 = [(SFAirDropActiveIconView *)self->_airDropActiveIconView centerXAnchor];
  v34 = [v110 centerXAnchor];
  v94 = [v33 constraintEqualToAnchor:v34];

  uint64_t v35 = [(SFAirDropActiveIconView *)self->_airDropActiveIconView topAnchor];
  double v36 = [(UIVisualEffectView *)self->_iconsVibrancyView topAnchor];
  v92 = [v35 constraintEqualToAnchor:v36 constant:70.0];

  [v94 setActive:1];
  [v95 setActive:1];
  [v93 setActive:1];
  [v92 setActive:1];
  v37 = [(SFAirDropIconView *)self->_airDropIconView widthAnchor];
  v91 = [v37 constraintEqualToConstant:266.0];

  v38 = [(SFAirDropIconView *)self->_airDropIconView heightAnchor];
  v90 = [v38 constraintEqualToConstant:266.0];

  v39 = [(SFAirDropIconView *)self->_airDropIconView centerXAnchor];
  v40 = [v110 centerXAnchor];
  v89 = [v39 constraintEqualToAnchor:v40];

  uint64_t v41 = [(SFAirDropIconView *)self->_airDropIconView topAnchor];
  double v42 = [(UIVisualEffectView *)self->_iconsVibrancyView topAnchor];
  v88 = [v41 constraintEqualToAnchor:v42];

  [v91 setActive:1];
  [v90 setActive:1];
  [v89 setActive:1];
  [v88 setActive:1];
  CGRect v43 = [(SFAirDropActiveIconView *)self->_airDropInactiveIconView widthAnchor];
  v87 = [v43 constraintEqualToConstant:266.0];

  v44 = [(SFAirDropActiveIconView *)self->_airDropInactiveIconView heightAnchor];
  v86 = [v44 constraintEqualToConstant:266.0];

  v45 = [(SFAirDropActiveIconView *)self->_airDropInactiveIconView centerXAnchor];
  v46 = [v110 centerXAnchor];
  v85 = [v45 constraintEqualToAnchor:v46];

  v47 = [(SFAirDropActiveIconView *)self->_airDropInactiveIconView topAnchor];
  v48 = [(UIVisualEffectView *)self->_iconsVibrancyView topAnchor];
  v84 = [v47 constraintEqualToAnchor:v48];

  [v87 setActive:1];
  [v86 setActive:1];
  [v85 setActive:1];
  [v84 setActive:1];
  v49 = [(UITextView *)self->_noAWDLTextView topAnchor];
  v50 = [(UIVisualEffectView *)self->_instructionsVibrancyView topAnchor];
  v83 = [v49 constraintEqualToAnchor:v50];

  [v83 setActive:1];
  v51 = [(UITextView *)self->_noWifiTextView topAnchor];
  v52 = [(UIVisualEffectView *)self->_instructionsVibrancyView topAnchor];
  v82 = [v51 constraintEqualToAnchor:v52];

  [v82 setActive:1];
  v53 = [(UITextView *)self->_instructionsTextView topAnchor];
  v54 = [(UIVisualEffectView *)self->_instructionsVibrancyView topAnchor];
  v81 = [v53 constraintEqualToAnchor:v54 constant:3.0];

  v55 = [(UITextView *)self->_instructionsTextView widthAnchor];
  v56 = [v110 widthAnchor];
  v80 = [v55 constraintEqualToAnchor:v56 multiplier:0.53];

  v57 = [(UITextView *)self->_instructionsTextView centerXAnchor];
  v58 = [v110 centerXAnchor];
  v59 = [v57 constraintEqualToAnchor:v58];

  [v81 setActive:1];
  [v80 setActive:1];
  [v59 setActive:1];
  v60 = [(UIFocusContainerGuide *)self->_fcg topAnchor];
  v61 = [(UICollectionView *)self->_collectionView bottomAnchor];
  v62 = [v60 constraintEqualToAnchor:v61 constant:0.0];

  v63 = [(UIFocusContainerGuide *)self->_fcg bottomAnchor];
  v64 = [v110 bottomAnchor];
  v65 = [v63 constraintEqualToAnchor:v64 constant:0.0];

  v66 = [(UIFocusContainerGuide *)self->_fcg widthAnchor];
  v67 = [v110 widthAnchor];
  v68 = [v66 constraintEqualToAnchor:v67 constant:0.0];

  [v62 setActive:1];
  [v65 setActive:1];
  [v68 setActive:1];
  v69 = [(UIButton *)self->_doneButton topAnchor];
  objc_super v70 = [(UITextView *)self->_instructionsTextView lastBaselineAnchor];
  uint64_t v71 = [v69 constraintEqualToAnchor:v70 constant:40.0];

  double v72 = [(UIButton *)self->_doneButton centerXAnchor];
  v73 = [v110 centerXAnchor];
  v74 = [v72 constraintEqualToAnchor:v73 constant:0.0];

  v75 = [(UIButton *)self->_doneButton widthAnchor];
  v76 = [v75 constraintGreaterThanOrEqualToConstant:200.0];

  uint64_t v77 = [(UIButton *)self->_doneButton heightAnchor];
  double v78 = [v77 constraintEqualToConstant:82.0];

  [v71 setActive:1];
  [v74 setActive:1];
  [v76 setActive:1];
  [v78 setActive:1];
  v79 = [(UIVisualEffectView *)self->_iconsVibrancyView contentView];
  [v79 bringSubviewToFront:self->_airDropActiveIconView];
}

- (id)attributedStringWithTitle:(id)a3 content:(id)a4
{
  v41[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  uint64_t v9 = NSString;
  if (v8)
  {
    CGFloat v10 = SFLocalizedStringForKey();
    objc_msgSend(v9, "stringWithFormat:", v10, v6, v7);
  }
  else
  {
    CGFloat v10 = SFLocalizedStringForKey();
    objc_msgSend(v9, "stringWithFormat:", v10, v7, v37);
  unint64_t v11 = };

  double v12 = [(SFAirDropActivityViewController *)self traitCollection];
  uint64_t v13 = [v12 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v13))
  {
  }
  else
  {
    NSComparisonResult v14 = (NSString *)*MEMORY[0x263F83440];
    uint64_t v15 = [(SFAirDropActivityViewController *)self traitCollection];
    uint64_t v16 = [v15 preferredContentSizeCategory];
    NSComparisonResult v17 = UIContentSizeCategoryCompareToCategory(v14, v16);

    if (v17 != NSOrderedAscending)
    {
      double v18 = (void *)MEMORY[0x263F81708];
      uint64_t v19 = *MEMORY[0x263F83570];
      double v20 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
      [v20 _scaledValueForValue:11.0];
      v21 = objc_msgSend(v18, "boldSystemFontOfSize:");

      v22 = (void *)MEMORY[0x263F81708];
      double v23 = [MEMORY[0x263F81708] preferredFontForTextStyle:v19];
      [v23 _scaledValueForValue:11.0];
      objc_super v24 = objc_msgSend(v22, "systemFontOfSize:");
      goto LABEL_9;
    }
  }
  uint64_t v25 = *MEMORY[0x263F83590];
  CGRect v26 = [(SFAirDropActivityViewController *)self _screen];
  CGRect v27 = _SFPersonCollectionViewMaximumSizeCategory(v26);
  v21 = [(SFAirDropActivityViewController *)self _fontWithStyle:v25 maxSizeCategory:v27 traits:2];

  double v23 = [(SFAirDropActivityViewController *)self _screen];
  double v28 = _SFPersonCollectionViewMaximumSizeCategory(v23);
  objc_super v24 = [(SFAirDropActivityViewController *)self _fontWithStyle:v25 maxSizeCategory:v28 traits:0];

LABEL_9:
  uint64_t v29 = [v11 rangeOfString:v6];
  uint64_t v31 = v30;
  uint64_t v40 = *MEMORY[0x263F814F0];
  uint64_t v32 = v40;
  v41[0] = v21;
  v33 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
  uint64_t v38 = v32;
  v39 = v24;
  v34 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v11 attributes:v34];
  objc_msgSend(v35, "setAttributes:range:", v33, v29, v31);

  return v35;
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFAirDropActivityViewController;
  id v4 = a3;
  [(SFAirDropActivityViewController *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(SFAirDropActivityViewController *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0)
  {
    self->_shouldExpandTextIfNeeded = 0;
    [(SFAirDropActivityViewController *)self _updateFontSizes];
    uint64_t v8 = [(SFAirDropActivityViewController *)self view];
    [v8 setNeedsUpdateConstraints];

    uint64_t v9 = [(SFAirDropActivityViewController *)self view];
    [v9 setNeedsLayout];

    [(SFAirDropActivityViewController *)self updateContentAreaAnimated:1];
  }
}

+ (BOOL)isAirDropAvailable
{
  unint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  if ([v2 isAirDropAllowed])
  {
    char v3 = 1;
  }
  else
  {
    id v4 = [MEMORY[0x263F53C50] sharedConnection];
    char v3 = [v4 isClassroomEnabled];
  }
  return v3;
}

+ (BOOL)airDropActivityCanPerformActivityWithItemClasses:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263EFFA08] setWithArray:a3];
  uint64_t v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[SFAirDropActivityViewController airDropActivityCanPerformActivityWithItemClasses:](a2, v5);
  }

  id v6 = airdrop_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[SFAirDropActivityViewController airDropActivityCanPerformActivityWithItemClasses:]();
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v44;
    *(void *)&long long v9 = 138412290;
    long long v34 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        NSComparisonResult v14 = objc_msgSend(v13, "description", v34);
        if ((unint64_t)[v14 length] >= 0x3D)
        {
          uint64_t v15 = [v13 description];
          uint64_t v16 = [v15 substringToIndex:60];

          NSComparisonResult v14 = (void *)v16;
        }
        NSComparisonResult v17 = airdrop_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v34;
          v50 = v14;
          _os_log_debug_impl(&dword_21DB23000, v17, OS_LOG_TYPE_DEBUG, "Top level values: %@", buf, 0xCu);
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v10);
  }

  sIgnoreStrings = 0;
  if ((unint64_t)[v7 count] >= 2)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v18 = v7;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(v18);
          }
          if ([*(id *)(*((void *)&v39 + 1) + 8 * j) isSubclassOfClass:objc_opt_class()])sIgnoreStrings = 1; {
        }
          }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v20);
    }
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v23 = v7;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    BOOL v26 = 0;
    char v27 = 0;
    char v28 = 0;
    uint64_t v29 = *(void *)v36;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(v23);
        }
        uint64_t v31 = *(void **)(*((void *)&v35 + 1) + 8 * v30);
        BOOL v26 = v26
           || ([v31 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || ([v31 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || ([v31 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || ([v31 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || ([v31 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || [v31 isSubclassOfClass:objc_opt_class()];
        if (([v31 isSubclassOfClass:objc_opt_class()] & 1) != 0
          || ([v31 isSubclassOfClass:objc_opt_class()] & 1) != 0
          || [v31 isSubclassOfClass:objc_opt_class()])
        {
          BOOL v26 = 1;
          char v28 = 1;
        }
        if (([v31 isSubclassOfClass:objc_opt_class()] & 1) != 0
          || [v31 isSubclassOfClass:objc_opt_class()])
        {
          BOOL v26 = 1;
          char v27 = 1;
        }
        ++v30;
      }
      while (v25 != v30);
      uint64_t v32 = [v23 countByEnumeratingWithState:&v35 objects:v47 count:16];
      uint64_t v25 = v32;
    }
    while (v32);
  }
  else
  {
    BOOL v26 = 0;
    char v27 = 0;
    char v28 = 0;
  }

  sIgnoreStrings = v27 & v28 & 1;
  return v26;
}

- (BOOL)enableModernShareSheeet
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableModernShareSheet", @"com.apple.Sharing", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_sendingAppBundleID lowercaseString];
    if ([v5 isEqualToString:@"com.apple.mobileslideshow"])
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      id v7 = [(NSString *)self->_sendingAppBundleID lowercaseString];
      int v6 = [v7 isEqualToString:@"com.apple.camera"] ^ 1;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)isDebugMode
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableBrowserDebugMode", @"com.apple.Sharing", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)isTetheredModeEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableTetheredDisplayPortMode", (CFStringRef)*MEMORY[0x263EFFE48], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)isWifiEnabled
{
  if ([(SFWirelessSettingsController *)self->_wirelessSettings isWifiEnabled]) {
    return 1;
  }
  return [(SFAirDropActivityViewController *)self isTetheredModeEnabled];
}

- (BOOL)isBluetoothEnabled
{
  if ([(SFWirelessSettingsController *)self->_wirelessSettings isBluetoothEnabled]) {
    return 1;
  }
  return [(SFAirDropActivityViewController *)self isTetheredModeEnabled];
}

- (void)enableAirDropRequiredFeatures
{
  [(SFWirelessSettingsController *)self->_wirelessSettings setWifiEnabled:1];
  wirelessSettings = self->_wirelessSettings;
  [(SFWirelessSettingsController *)wirelessSettings setBluetoothEnabled:1];
}

- (void)setOtherActivityViewPresented:(BOOL)a3
{
  if (self->_otherActivityViewPresented != a3) {
    self->_otherActivityViewPresented = a3;
  }
}

- (id)preferredFocusEnvironments
{
  v6[1] = *MEMORY[0x263EF8340];
  if (self->_doneFocused)
  {
    if (self->_doneButton)
    {
      v6[0] = self->_doneButton;
      p_collectionView = (UICollectionView **)v6;
LABEL_6:
      BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:p_collectionView count:1];
      goto LABEL_8;
    }
  }
  else if (self->_collectionView)
  {
    collectionView = self->_collectionView;
    p_collectionView = &collectionView;
    goto LABEL_6;
  }
  BOOL v3 = (void *)MEMORY[0x263EFFA68];
LABEL_8:
  return v3;
}

- (void)updateShowMoreButtonForShowPeople:(BOOL)a3 inactive:(BOOL)a4 active:(BOOL)a5 static:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  if (self->_shouldExpandTextIfNeeded || a4) {
    BOOL v12 = !self->_shouldExpandTextIfNeeded;
  }
  else {
    BOOL v12 = a5 || a6;
  }
  double height = self->_minimumPreferredContentSize.height;
  [(NSLayoutConstraint *)self->_largeTextAirdropViewYConstraint constant];
  double v15 = height - v14;
  if (v12 && !v9)
  {
    int v16 = v8 || v7;
    NSComparisonResult v17 = &OBJC_IVAR___SFAirDropActivityViewController__instructionsTextView;
    if (v8) {
      NSComparisonResult v17 = &OBJC_IVAR___SFAirDropActivityViewController__noAWDLTextView;
    }
    if (!v16) {
      NSComparisonResult v17 = &OBJC_IVAR___SFAirDropActivityViewController__noWifiTextView;
    }
    if ((v16 & 1) != 0 || v6)
    {
      uint64_t v23 = *v17;
      [*(id *)((char *)&self->super.super.super.isa + v23) frame];
      CGFloat v20 = v24;
      CGFloat v19 = v25;
      CGFloat v22 = v26;
      CGFloat v21 = v27;
      id v18 = *(id *)((char *)&self->super.super.super.isa + v23);
    }
    else
    {
      id v18 = 0;
      CGFloat v20 = *MEMORY[0x263F001A8];
      CGFloat v19 = *(double *)(MEMORY[0x263F001A8] + 8);
      CGFloat v22 = *(double *)(MEMORY[0x263F001A8] + 16);
      CGFloat v21 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    char v28 = [(SFAirDropActivityViewController *)self view];
    int v29 = [v28 _shouldReverseLayoutDirection];

    if (v29)
    {
      v51.origin.x = v20;
      v51.origin.y = v19;
      v51.size.width = v22;
      v51.size.double height = v21;
      double v30 = CGRectGetMaxX(v51) + -16.0;
    }
    else
    {
      uint64_t v31 = [(SFAirDropActivityViewController *)self view];
      [v31 frame];
      CGFloat v32 = CGRectGetWidth(v52) + -16.0;
      v53.origin.x = v20;
      v53.origin.y = v19;
      v53.size.width = v22;
      v53.size.double height = v21;
      double v30 = v32 - CGRectGetMinX(v53);
    }
    v33 = [v18 textContainer];
    [v33 setMaximumNumberOfLines:0];

    objc_msgSend(v18, "sizeThatFits:", v30, 0.0);
    BOOL v12 = v34 > v15;
  }
  uint64_t v45 = 0;
  long long v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__0;
  v49 = __Block_byref_object_dispose__0;
  id v50 = 0;
  long long v35 = [(UITextView *)self->_instructionsTextView attributedText];
  uint64_t v36 = [v35 length];
  uint64_t v37 = *MEMORY[0x263F814F0];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __92__SFAirDropActivityViewController_updateShowMoreButtonForShowPeople_inactive_active_static___block_invoke;
  v44[3] = &unk_264472708;
  v44[4] = &v45;
  objc_msgSend(v35, "enumerateAttribute:inRange:options:usingBlock:", v37, 0, v36, 0, v44);
  if (v9 || v12)
  {
    [(id)v46[5] _bodyLeading];
    *(float *)&double v38 = v15 / v38;
    unint64_t v39 = vcvtms_u32_f32(*(float *)&v38);
  }
  else
  {
    unint64_t v39 = 0;
  }
  long long v40 = [(UITextView *)self->_noWifiTextView textContainer];
  [v40 setMaximumNumberOfLines:v39];

  long long v41 = [(UITextView *)self->_noAWDLTextView textContainer];
  [v41 setMaximumNumberOfLines:v39];

  long long v42 = [(UITextView *)self->_instructionsTextView textContainer];
  [v42 setMaximumNumberOfLines:v39];

  double v43 = 0.0;
  if (v12) {
    double v43 = 1.0;
  }
  [(UIButton *)self->_showMoreButton setAlpha:v43];

  _Block_object_dispose(&v45, 8);
}

void __92__SFAirDropActivityViewController_updateShowMoreButtonForShowPeople_inactive_active_static___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a5 = 1;
  }
}

- (void)updatePreferredContentSize
{
  [(SFAirDropActivityViewController *)self calculatePreferredContentSize];
  -[SFAirDropActivityViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_updateFontSizes
{
  BOOL v3 = [(SFAirDropActivityViewController *)self traitCollection];
  BOOL v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);
  BOOL v6 = (uint64_t *)MEMORY[0x263F83590];
  if (IsAccessibilityCategory)
  {
  }
  else
  {
    BOOL v7 = (NSString *)*MEMORY[0x263F83440];
    id v8 = [(SFAirDropActivityViewController *)self traitCollection];
    BOOL v9 = [v8 preferredContentSizeCategory];
    NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v7, v9);

    if (v10 != NSOrderedAscending)
    {
      uint64_t v11 = (void *)MEMORY[0x263F81708];
      BOOL v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
      [v12 _scaledValueForValue:11.0];
      uint64_t v13 = objc_msgSend(v11, "systemFontOfSize:");
      [(UILabel *)self->_titleLabel setFont:v13];
      int v14 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v15 = *v6;
  BOOL v12 = [(SFAirDropActivityViewController *)self _screen];
  uint64_t v13 = _SFPersonCollectionViewMaximumSizeCategory(v12);
  int v16 = [(SFAirDropActivityViewController *)self _fontWithStyle:v15 maxSizeCategory:v13 traits:0];
  [(UILabel *)self->_titleLabel setFont:v16];

  int v14 = 1;
LABEL_6:

  NSComparisonResult v17 = [(SFAirDropActivityViewController *)self title];
  id v18 = [(SFAirDropActivityViewController *)self instructionsText];
  CGFloat v19 = [(SFAirDropActivityViewController *)self attributedStringWithTitle:v17 content:v18];
  [(UITextView *)self->_instructionsTextView setAttributedText:v19];

  CGFloat v20 = [(SFAirDropActivityViewController *)self title];
  CGFloat v21 = [(SFAirDropActivityViewController *)self noWiFiBTText];
  CGFloat v22 = [(SFAirDropActivityViewController *)self attributedStringWithTitle:v20 content:v21];
  [(UITextView *)self->_noWifiTextView setAttributedText:v22];

  uint64_t v23 = [(SFAirDropActivityViewController *)self title];
  double v24 = [(SFAirDropActivityViewController *)self noAWDLText];
  double v25 = [(SFAirDropActivityViewController *)self attributedStringWithTitle:v23 content:v24];
  [(UITextView *)self->_noAWDLTextView setAttributedText:v25];

  if (v14)
  {
    uint64_t v26 = *v6;
    id v30 = [(SFAirDropActivityViewController *)self _screen];
    double v27 = _SFPersonCollectionViewMaximumSizeCategory(v30);
    [(SFAirDropActivityViewController *)self _fontWithStyle:v26 maxSizeCategory:v27 traits:0];
  }
  else
  {
    double v27 = (void *)MEMORY[0x263F81708];
    id v30 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [v30 _scaledValueForValue:11.0];
    objc_msgSend(v27, "systemFontOfSize:");
  char v28 = };
  int v29 = [(UIButton *)self->_showMoreButton titleLabel];
  [v29 setFont:v28];

  if (v14)
  {

    char v28 = v27;
  }
}

- (id)_fontWithStyle:(id)a3 maxSizeCategory:(id)a4 traits:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  NSComparisonResult v10 = [(SFAirDropActivityViewController *)self traitCollection];
  uint64_t v11 = [v10 preferredContentSizeCategory];

  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v11, (UIContentSizeCategory)v9) != NSOrderedAscending)
  {
    id v12 = v9;

    uint64_t v11 = v12;
  }
  uint64_t v13 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:v11];
  if (v5)
  {
    int v14 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v8 compatibleWithTraitCollection:v13];
    uint64_t v15 = [v14 fontDescriptorWithSymbolicTraits:v5];

    int v16 = [MEMORY[0x263F81708] fontWithDescriptor:v15 size:0.0];
  }
  else
  {
    int v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:v8 compatibleWithTraitCollection:v13];
  }

  return v16;
}

- (CGSize)calculatePreferredContentSize
{
  BOOL v3 = [(SFAirDropActivityViewController *)self traitCollection];
  BOOL v4 = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x263F83450]) == NSOrderedAscending)
  {
    CGFloat width = self->_minimumPreferredContentSize.width;
    double height = self->_minimumPreferredContentSize.height;
    goto LABEL_17;
  }
  [(SFAirDropActivityViewController *)self _cachedPreferredItemSize];
  double v6 = v5;
  [(UILabel *)self->_titleLabel frame];
  double v8 = v6 + v7;
  [(UITextView *)self->_noAWDLTextView alpha];
  double v10 = v9;
  [(UITextView *)self->_instructionsTextView alpha];
  double v12 = v11;
  [(UITextView *)self->_noWifiTextView alpha];
  if (self->_shouldExpandTextIfNeeded)
  {
    if (v10 == 0.0)
    {
      if (v12 == 0.0)
      {
        if (v13 == 0.0) {
          goto LABEL_13;
        }
        [(SFAirDropIconView *)self->_airDropIconView frame];
        double v15 = v20;
        noWifiTextView = self->_noWifiTextView;
      }
      else
      {
        [(SFAirDropActiveIconView *)self->_airDropActiveIconView frame];
        double v15 = v19;
        noWifiTextView = self->_instructionsTextView;
      }
    }
    else
    {
      [(SFAirDropActiveIconView *)self->_airDropInactiveIconView frame];
      double v15 = v14;
      noWifiTextView = self->_noAWDLTextView;
    }
    [(UITextView *)noWifiTextView frame];
    -[UITextView sizeThatFits:](noWifiTextView, "sizeThatFits:", v21, 0.0);
    if (v15 >= v22) {
      double v8 = v15;
    }
    else {
      double v8 = v22;
    }
  }
LABEL_13:
  if (v8 + 20.0 >= self->_minimumPreferredContentSize.height) {
    double height = v8 + 20.0;
  }
  else {
    double height = self->_minimumPreferredContentSize.height;
  }
  CGFloat width = 0.0;
LABEL_17:

  double v23 = width;
  double v24 = height;
  result.double height = v24;
  result.CGFloat width = v23;
  return result;
}

- (void)setSendingApplicationAuditToken:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  sendingAppBundleID = self->_sendingAppBundleID;
  self->_sendingAppBundleID = 0;

  long long v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_sendingApplicationAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_sendingApplicationAuditToken.val[4] = v6;
  double v20 = 0;
  long long v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken.val[4] = v7;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    double v8 = self->_sendingAppBundleID;
    self->_sendingAppBundleID = v20;
  }
  if (!self->_sendingAppBundleID)
  {
    pid_t pidp = 0;
    long long v9 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&atoken.val[4] = v9;
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
    if (pidp)
    {
      double v10 = airdrop_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SFAirDropActivityViewController setSendingApplicationAuditToken:](v10);
      }

      objc_msgSend(NSString, "stringWithFormat:", @"%d", pidp);
      double v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      double v12 = self->_sendingAppBundleID;
      self->_sendingAppBundleID = v11;
    }
    if (!self->_sendingAppBundleID)
    {
      double v13 = airdrop_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SFAirDropActivityViewController setSendingApplicationAuditToken:](v13);
      }

      double v14 = [MEMORY[0x263F086E0] mainBundle];
      double v15 = [v14 bundleIdentifier];
      int v16 = self->_sendingAppBundleID;
      self->_sendingAppBundleID = v15;
    }
  }
  NSComparisonResult v17 = airdrop_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = self->_sendingAppBundleID;
    atoken.val[0] = 138412290;
    *(void *)&atoken.val[1] = v18;
    _os_log_impl(&dword_21DB23000, v17, OS_LOG_TYPE_DEFAULT, "Sending app is %@", (uint8_t *)&atoken, 0xCu);
  }
}

- (CGSize)suggestedThumbnailSize
{
  unint64_t v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  SFSuggestedAirDropThumbnailSize();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.CGFloat width = v7;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_people count];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = (UICollectionView *)a3;
  double v8 = [(UICollectionView *)v7 dequeueReusableCellWithReuseIdentifier:@"PersonCellID" forIndexPath:v6];
  long long v9 = [(SFAirDropActivityViewController *)self view];
  [v9 frame];
  [v8 setActivitySheetWidth:v10];

  [v8 setDarkStyleOnLegacyApp:self->_darkStyleOnLegacyApp];
  [v8 setStateBeingRestored:1];
  [v8 setDelegate:self];
  [v8 setSessionID:self->_sessionID];
  double v11 = -[NSArray objectAtIndexedSubscript:](self->_people, "objectAtIndexedSubscript:", [v6 row]);
  detailCollectionView = self->_detailCollectionView;

  if (detailCollectionView == v7)
  {
    uint64_t v13 = -[NSArray objectAtIndexedSubscript:](self->_people, "objectAtIndexedSubscript:", [v6 row] + (-[NSArray count](self->_people, "count") >> 1));

    double v11 = (void *)v13;
  }
  [v8 setPerson:v11];
  personToStoredTransferFinalState = self->_personToStoredTransferFinalState;
  double v15 = [v11 realName];
  int v16 = [(NSMutableDictionary *)personToStoredTransferFinalState objectForKeyedSubscript:v15];

  if (v16) {
    objc_msgSend(v8, "restoreCellStateFromFinalTransferState:", objc_msgSend(v16, "integerValue"));
  }
  personToProgress = self->_personToProgress;
  id v18 = [v11 realName];
  double v19 = [(NSMutableDictionary *)personToProgress objectForKeyedSubscript:v18];

  [v8 setProgress:v19];
  collectionView = self->_collectionView;
  if (v19) {
    [(UICollectionView *)collectionView selectItemAtIndexPath:v6 animated:0 scrollPosition:0];
  }
  else {
    [(UICollectionView *)collectionView deselectItemAtIndexPath:v6 animated:0];
  }
  [v8 setSelected:v19 != 0];
  [v8 setStateBeingRestored:0];

  return v8;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4 = a3;
  double v5 = [v4 indexPathsForSelectedItems];
  id v6 = [v5 lastObject];

  double v7 = [v4 cellForItemAtIndexPath:v6];

  focusedIndexPath = v6;
  if (!v7) {
    focusedIndexPath = self->_focusedIndexPath;
  }
  long long v9 = focusedIndexPath;

  return v9;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v6 = a4;
  double v7 = [v6 nextFocusedIndexPath];
  focusedIndexPath = self->_focusedIndexPath;
  self->_focusedIndexPath = v7;

  long long v9 = [v6 nextFocusedView];

  LOBYTE(v6) = v9 == self->_doneButton;
  self->_doneFocused = (char)v6;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return self->_sharedItemsAvailable;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v63[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = [v6 cellForItemAtIndexPath:a4];
  double v8 = [v7 person];
  long long v9 = [v8 realName];

  [(NSMutableDictionary *)self->_personToStoredTransferFinalState removeObjectForKey:v9];
  double v10 = [v7 person];
  int v11 = [v10 isSuggestion];

  if (!v11)
  {
    self->_didSelectNode = 1;
    [v7 userDidSelect];
    double v24 = [v7 person];
    if (self->_itemsReady)
    {
      double v25 = [NSNumber numberWithInteger:self->_sharedItemsRequestID];
      personToSharedItemsRequestID = self->_personToSharedItemsRequestID;
      double v27 = [v24 realName];
      [(NSMutableDictionary *)personToSharedItemsRequestID setObject:v25 forKeyedSubscript:v27];

      v62 = v24;
      char v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
      [(SFAirDropActivityViewController *)self startTransferForPeople:v28];
    }
    else
    {
      if (!self->_itemsRequested)
      {
        self->_itemsRequested = 1;
        int64_t v40 = self->_sharedItemsRequestID + 1;
        self->_sharedItemsRequestID = v40;
        long long v41 = [NSNumber numberWithInteger:v40];
        long long v42 = self->_personToSharedItemsRequestID;
        double v43 = [v24 realName];
        [(NSMutableDictionary *)v42 setObject:v41 forKeyedSubscript:v43];

        self->_generatedPreviews = 0;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
        aBlock[3] = &unk_264472758;
        aBlock[4] = self;
        int64_t v59 = v40;
        id v58 = v6;
        long long v44 = _Block_copy(aBlock);
        p_delegate = &self->_delegate;
        id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        LODWORD(v43) = [WeakRetained conformsToProtocol:&unk_26CEB3A88];

        id v47 = objc_loadWeakRetained((id *)p_delegate);
        v48 = v47;
        if (v43)
        {
          objc_msgSend(v47, "fmf_airDropActivityRequestingSharedItemsWithCompletionHandler:", v44);
        }
        else
        {
          char v49 = objc_opt_respondsToSelector();

          id v50 = objc_loadWeakRetained((id *)p_delegate);
          if (v49)
          {
            v60 = @"SFAirDropActivityMaxPreviewsKey";
            v61 = &unk_26CE7E330;
            CGRect v51 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
            v55[0] = MEMORY[0x263EF8330];
            v55[1] = 3221225472;
            v55[2] = __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_357;
            v55[3] = &unk_264472440;
            id v56 = v44;
            [v50 airDropActivityRequestingSharedItemsWithOptions:v51 completionHandler:v55];

            v48 = v56;
          }
          else
          {
            v53[0] = MEMORY[0x263EF8330];
            v53[1] = 3221225472;
            v53[2] = __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2_358;
            v53[3] = &unk_264472440;
            id v54 = v44;
            [v50 airDropActivityRequestingSharedItemsWithCompletionHandler:v53];

            v48 = v54;
          }
        }

        goto LABEL_11;
      }
      char v28 = [NSNumber numberWithInteger:self->_sharedItemsRequestID];
      uint64_t v31 = self->_personToSharedItemsRequestID;
      CGFloat v32 = [v24 realName];
      [(NSMutableDictionary *)v31 setObject:v28 forKeyedSubscript:v32];
    }
LABEL_11:

    goto LABEL_14;
  }
  double v12 = [v7 person];
  uint64_t v13 = [v12 transportBundleID];
  int v14 = [v13 isEqualToString:@"com.apple.MobileSMS"];

  if (!v14)
  {
    int v29 = [v7 person];
    id v30 = [v29 transportBundleID];
    if ([v30 isEqualToString:@"com.apple.mobilemail"])
    {
    }
    else
    {
      v33 = [v7 person];
      double v34 = [v33 transportBundleID];
      int v35 = [v34 isEqualToString:@"com.apple.telephonyutilities.callservicesd"];

      if (!v35) {
        goto LABEL_14;
      }
    }
    uint64_t v36 = [(SFAirDropActivityViewController *)self delegate];
    uint64_t v37 = [v7 person];
    double v38 = [v37 displayName];
    v63[0] = v38;
    unint64_t v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:1];
    [v36 nodePressedWithRecipients:v39];

    goto LABEL_14;
  }
  double v15 = [(SFAirDropActivityViewController *)self delegate];
  CGRect v52 = [v7 person];
  int v16 = [v52 realName];
  NSComparisonResult v17 = [v7 person];
  id v18 = [v17 displayName];
  [v7 person];
  double v19 = v9;
  v21 = id v20 = v6;
  uint64_t v22 = [v21 secondaryName];
  double v23 = [v22 componentsSeparatedByString:@", "];
  [v15 nodePressedWithGUID:v16 groupName:v18 recipients:v23];

  id v6 = v20;
  long long v9 = v19;

LABEL_14:
}

void __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    block[3] = &unk_264472730;
    double v5 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    uint64_t v20 = v4;
    id v19 = v5;
    dispatch_async(v3, block);
  }
  else
  {
    [*(id *)(a1 + 32) setNeedsRequestingSharedItems];
    if ([*(id *)(a1 + 40) numberOfItemsInSection:0] >= 1)
    {
      uint64_t v6 = 0;
      do
      {
        double v7 = *(void **)(a1 + 40);
        double v8 = [MEMORY[0x263F088C8] indexPathForRow:v6 inSection:0];
        long long v9 = [v7 cellForItemAtIndexPath:v8];

        if ([v9 isSelected])
        {
          double v10 = [v9 person];
          int v11 = *(void **)(*(void *)(a1 + 32) + 1256);
          double v12 = [v10 realName];
          uint64_t v13 = [v11 objectForKeyedSubscript:v12];
          uint64_t v14 = [v13 integerValue];
          uint64_t v15 = *(void *)(a1 + 48);

          if (v14 == v15)
          {
            [v9 userDidCancel];
            int v16 = *(void **)(*(void *)(a1 + 32) + 1176);
            NSComparisonResult v17 = [v16 indexPathForCell:v9];
            [v16 deselectItemAtIndexPath:v17 animated:0];
          }
        }

        ++v6;
      }
      while ([*(id *)(a1 + 40) numberOfItemsInSection:0] > v6);
    }
  }
}

void __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 1296) waitUntilAllOperationsAreFinished];
  uint64_t v2 = a1[4];
  if (*(int *)(v2 + 1412) >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void **)(v2 + 1280);
      double v5 = *(void **)(v2 + 1416);
      uint64_t v6 = [NSNumber numberWithInt:v3];
      double v7 = [v5 objectForKeyedSubscript:v6];
      [v4 addObject:v7];

      uint64_t v3 = (v3 + 1);
      uint64_t v2 = a1[4];
    }
    while ((int)v3 < *(_DWORD *)(v2 + 1412));
  }
  [(id)v2 generateSpecialPreviewPhotoForRequestID:a1[6]];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
  block[3] = &unk_264472730;
  double v8 = (void *)a1[5];
  block[4] = a1[4];
  id v9 = v8;
  uint64_t v10 = a1[6];
  id v12 = v9;
  uint64_t v13 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1289) = 1;
  id v15 = [MEMORY[0x263EFF980] array];
  if ([*(id *)(a1 + 40) numberOfItemsInSection:0] >= 1)
  {
    uint64_t v2 = 0;
    do
    {
      uint64_t v3 = *(void **)(a1 + 40);
      uint64_t v4 = [MEMORY[0x263F088C8] indexPathForRow:v2 inSection:0];
      double v5 = [v3 cellForItemAtIndexPath:v4];

      if ([v5 isSelected])
      {
        uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 1256);
        double v7 = [v5 person];
        double v8 = [v7 realName];
        id v9 = [v6 objectForKeyedSubscript:v8];

        if (!v9)
        {
          uint64_t v10 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
          int v11 = *(void **)(*(void *)(a1 + 32) + 1256);
          id v12 = [v5 person];
          uint64_t v13 = [v12 realName];
          [v11 setObject:v10 forKeyedSubscript:v13];
        }
        uint64_t v14 = [v5 person];
        [v15 addObject:v14];
      }
      ++v2;
    }
    while ([*(id *)(a1 + 40) numberOfItemsInSection:0] > v2);
  }
  [*(id *)(a1 + 32) startTransferForPeople:v15];
}

uint64_t __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_357(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2_358(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v4 = [a3 cellForItemAtIndexPath:a4];
  [v4 userDidCancel];
}

- (CGSize)_cachedPreferredItemSize
{
  uint64_t v3 = [(SFAirDropActivityViewController *)self view];
  [v3 bounds];
  double Width = CGRectGetWidth(v14);
  double v5 = [(SFAirDropActivityViewController *)self traitCollection];
  uint64_t v6 = [v5 preferredContentSizeCategory];
  +[SFPersonCollectionViewCell _cachedPreferredItemSizeForViewWidth:v6 sizeCategory:Width];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.CGFloat width = v11;
  return result;
}

- (void)subscribeToProgresses
{
  if (!self->_progressToken)
  {
    uint64_t v3 = (void *)MEMORY[0x263F08AB8];
    id v4 = objc_msgSend(MEMORY[0x263F08AB8], "sf_publishingKeyForApp:sessionID:", self->_sendingAppBundleID, self->_sessionID);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__SFAirDropActivityViewController_subscribeToProgresses__block_invoke;
    v7[3] = &unk_264472780;
    v7[4] = self;
    double v5 = [v3 _addSubscriberForCategory:v4 usingPublishingHandler:v7];
    id progressToken = self->_progressToken;
    self->_id progressToken = v5;
  }
}

id __56__SFAirDropActivityViewController_subscribeToProgresses__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "sf_personRealName");
  [*(id *)(a1 + 32) subscribedProgress:v3 forPersonWithRealName:v4];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__SFAirDropActivityViewController_subscribeToProgresses__block_invoke_2;
  v8[3] = &unk_264471F08;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = _Block_copy(v8);

  return v6;
}

uint64_t __56__SFAirDropActivityViewController_subscribeToProgresses__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) unpublishedProgressForPersonWithRealName:*(void *)(a1 + 40)];
}

- (void)unsubscribeToProgresses
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_progressToken)
  {
    objc_msgSend(MEMORY[0x263F08AB8], "_removeSubscriber:");
    id progressToken = self->_progressToken;
    self->_id progressToken = 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(NSMutableDictionary *)self->_personToProgress allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SFAirDropActivityViewController *)self unpublishedProgressForPersonWithRealName:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_personToProgress removeAllObjects];
}

- (void)subscribedProgress:(id)a3 forPersonWithRealName:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  NSComparisonResult v17 = v6;
  [(NSMutableDictionary *)self->_personToProgress setObject:v6 forKeyedSubscript:v7];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [(UICollectionView *)self->_collectionView visibleCells];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [v13 person];
          id v15 = [v14 realName];
          int v16 = [v15 isEqualToString:v7];

          if (v16) {
            [v13 setProgress:v17];
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)unpublishedProgressForPersonWithRealName:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_personToProgress objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(v5, "sf_transferState");
    if ((unint64_t)(v7 - 4) <= 2)
    {
      uint64_t v8 = [NSNumber numberWithInteger:v7];
      [(NSMutableDictionary *)self->_personToStoredTransferFinalState setObject:v8 forKeyedSubscript:v4];
    }
  }
  long long v18 = v6;
  [(NSMutableDictionary *)self->_personToProgress removeObjectForKey:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [(UICollectionView *)self->_collectionView visibleCells];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [v14 person];
          int v16 = [v15 realName];
          int v17 = [v16 isEqualToString:v4];

          if (v17) {
            [v14 setProgress:0];
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void)personCollectionViewCellDidTerminateTransfer:(id)a3
{
  collectionView = self->_collectionView;
  id v4 = [(UICollectionView *)collectionView indexPathForCell:a3];
  [(UICollectionView *)collectionView deselectItemAtIndexPath:v4 animated:0];
}

- (void)personCollectionViewCellDidStartTransfer:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 airDropActivityDidSuccessfullyStartTransfer];
  }
}

- (void)personCollectionViewCellDidFinishTransfer:(id)a3
{
  collectionView = self->_collectionView;
  char v5 = [(UICollectionView *)collectionView indexPathForCell:a3];
  [(UICollectionView *)collectionView deselectItemAtIndexPath:v5 animated:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained airDropActivityDidSuccessfullyCompleteTransfer];
}

- (void)wirelessSettingsDidChange:(id)a3
{
  id v4 = [(SFAirDropActivityViewController *)self title];
  char v5 = [(SFAirDropActivityViewController *)self noWiFiBTText];
  id v6 = [(SFAirDropActivityViewController *)self attributedStringWithTitle:v4 content:v5];
  [(UITextView *)self->_noWifiTextView setAttributedText:v6];

  uint64_t v7 = [(SFAirDropActivityViewController *)self title];
  uint64_t v8 = [(SFAirDropActivityViewController *)self noAWDLText];
  uint64_t v9 = [(SFAirDropActivityViewController *)self attributedStringWithTitle:v7 content:v8];
  [(UITextView *)self->_noAWDLTextView setAttributedText:v9];

  [(SFAirDropActivityViewController *)self updateContentAreaAnimated:1];
}

- (void)showMore:(id)a3
{
  self->_shouldExpandTextIfNeeded = 1;
  [(SFAirDropActivityViewController *)self updateContentAreaAnimated:1];
}

- (id)indexSetToIndexPaths:(id)a3 inSection:(int64_t)a4
{
  char v5 = (objc_class *)MEMORY[0x263EFF980];
  id v6 = a3;
  uint64_t v7 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__SFAirDropActivityViewController_indexSetToIndexPaths_inSection___block_invoke;
  v10[3] = &unk_2644727A8;
  id v8 = v7;
  id v11 = v8;
  int64_t v12 = a4;
  [v6 enumerateIndexesUsingBlock:v10];

  return v8;
}

void __66__SFAirDropActivityViewController_indexSetToIndexPaths_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263F088C8] indexPathForItem:a2 inSection:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

- (void)browserDidUpdatePeople:(id)a3
{
  people = self->_people;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke;
  v5[3] = &unk_264472820;
  v5[4] = self;
  [a3 getChangedIndexesForClientPeopleList:people withCompletion:v5];
}

void __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (![*(id *)(*(void *)(a1 + 32) + 1384) count])
  {
    uint64_t v10 = [MEMORY[0x263F086E0] mainBundle];
    id v11 = [v10 bundleIdentifier];
    int v12 = [v11 isEqualToString:@"com.apple.SharingUI.ShareSheet"];

    if (v12)
    {
      [MEMORY[0x263F82E00] setAnimationsEnabled:0];
      [*(id *)(*(void *)(a1 + 32) + 1176) setAlpha:0.0];
    }
  }
  uint64_t v13 = (void *)MEMORY[0x263F82E00];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_2;
  v18[3] = &unk_2644727D0;
  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = v7;
  id v21 = v8;
  id v22 = v9;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_370;
  v17[3] = &unk_2644727F8;
  v17[4] = v19;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  [v13 _animateUsingDefaultDampedSpringWithDelay:32 initialSpringVelocity:v18 options:v17 animations:0.0 completion:0.0];
}

void __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1176);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_3;
  v5[3] = &unk_2644727D0;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  [v2 performBatchUpdates:v5 completion:0];
}

void __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = airdrop_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) valueForKeyPath:@"displayName"];
    uint64_t v4 = SFCompactStringFromCollection();
    char v5 = SFCompactStringFromCollection();
    id v6 = SFCompactStringFromCollection();
    int v9 = 138412802;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    int v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_21DB23000, v2, OS_LOG_TYPE_DEFAULT, "browserDidUpdatePeople %@ with deleted %@, inserted %@", (uint8_t *)&v9, 0x20u);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 56) + 1384), *(id *)(a1 + 32));
  [*(id *)(a1 + 56) _collectTelemetryForPeople:*(void *)(*(void *)(a1 + 56) + 1384)];
  [*(id *)(a1 + 56) updateContentAreaAnimated:1];
  id v7 = [*(id *)(a1 + 56) indexSetToIndexPaths:*(void *)(a1 + 40) inSection:0];
  if ([v7 count]) {
    [*(id *)(*(void *)(a1 + 56) + 1176) deleteItemsAtIndexPaths:v7];
  }
  id v8 = [*(id *)(a1 + 56) indexSetToIndexPaths:*(void *)(a1 + 48) inSection:0];
  if ([v8 count]) {
    [*(id *)(*(void *)(a1 + 56) + 1176) insertItemsAtIndexPaths:v8];
  }
}

void __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_370(uint64_t a1)
{
  if (([MEMORY[0x263F82E00] areAnimationsEnabled] & 1) == 0)
  {
    uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
    id v3 = [v2 bundleIdentifier];
    int v4 = [v3 isEqualToString:@"com.apple.SharingUI.ShareSheet"];

    if (v4)
    {
      [MEMORY[0x263F82E00] setAnimationsEnabled:1];
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_2_371;
      v5[3] = &unk_264471EE0;
      void v5[4] = *(void *)(a1 + 32);
      [MEMORY[0x263F82E00] animateWithDuration:v5 animations:0.25];
    }
  }
}

uint64_t __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_2_371(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1176) setAlpha:1.0];
}

- (id)cellForPerson:(id)a3
{
  id v4 = a3;
  if ([(SFAirDropActivityViewController *)self collectionView:self->_collectionView numberOfItemsInSection:0] < 1)
  {
LABEL_5:
    id v8 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    while (1)
    {
      collectionView = self->_collectionView;
      id v7 = [MEMORY[0x263F088C8] indexPathForItem:v5 inSection:0];
      id v8 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v7];

      int v9 = [v8 person];
      char v10 = [v9 isEqual:v4];

      if (v10) {
        break;
      }

      if ([(SFAirDropActivityViewController *)self collectionView:self->_collectionView numberOfItemsInSection:0] <= ++v5)goto LABEL_5; {
    }
      }
  }

  return v8;
}

- (void)setSharedItemsAvailable:(BOOL)a3
{
  if (self->_sharedItemsAvailable != a3)
  {
    self->_sharedItemsAvailable = a3;
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __59__SFAirDropActivityViewController_setSharedItemsAvailable___block_invoke;
    v3[3] = &unk_264471EE0;
    v3[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v3 animations:0.35];
  }
}

void __59__SFAirDropActivityViewController_setSharedItemsAvailable___block_invoke(uint64_t a1)
{
  v15[4] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 1432)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.35;
  }
  v15[0] = *(void *)(v1 + 1008);
  v15[1] = *(void *)(v1 + 1176);
  v15[2] = *(void *)(v1 + 1072);
  v15[3] = *(void *)(v1 + 1088);
  [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:4];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "alpha", (void)v10);
        if (v9 != 0.0) {
          [v8 setAlpha:v2];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)setNeedsRequestingSharedItems
{
  self->_itemsReady = 0;
  self->_itemsRequested = 0;
}

- (void)startTransferForPeople:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = a3;
  uint64_t v44 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v56;
    *(void *)&long long v3 = 138412546;
    long long v40 = v3;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v56 != v43) {
          objc_enumerationMutation(obj);
        }
        long long v46 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        [(SFAirDropActivityViewController *)self _emitTelemetryForPerson:v40];
        personToSharedItemsRequestID = self->_personToSharedItemsRequestID;
        uint64_t v5 = [v46 realName];
        uint64_t v6 = [(NSMutableDictionary *)personToSharedItemsRequestID objectForKeyedSubscript:v5];

        if (v6)
        {
          id v7 = [(NSMutableDictionary *)self->_sharedItemsRequestIDToPreviewPhoto objectForKeyedSubscript:v6];
          v48 = [MEMORY[0x263EFF980] array];
          id v8 = self->_cachedSharedItems;
          objc_sync_enter(v8);
          double v9 = (void *)[(NSMutableOrderedSet *)self->_cachedSharedItems copy];
          objc_sync_exit(v8);

          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v49 = v9;
          long long v10 = 0;
          unsigned __int8 v11 = 0;
          unsigned __int8 v12 = 0;
          uint64_t v13 = [v49 countByEnumeratingWithState:&v51 objects:v63 count:16];
          if (!v13) {
            goto LABEL_22;
          }
          uint64_t v14 = *(void *)v52;
          while (1)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v52 != v14) {
                objc_enumerationMutation(v49);
              }
              id v16 = *(void **)(*((void *)&v51 + 1) + 8 * j);
              uint64_t v17 = [v16 identifer];
              if (v17 == [v6 integerValue])
              {
                long long v18 = [v16 URL];
                BOOL v19 = v18 == 0;

                if (!v19)
                {
                  if (v7)
                  {
                    if (!v10)
                    {
LABEL_18:
                      long long v10 = [v16 payloadDescription];
                    }
                  }
                  else
                  {
                    id v7 = [v16 previewImage];
                    if (!v10) {
                      goto LABEL_18;
                    }
                  }
                  char v20 = [v16 wasString];
                  [v48 addObject:v16];
                  v11 |= v20;
                  v12 |= v20 ^ 1;
                  continue;
                }
              }
            }
            uint64_t v13 = [v49 countByEnumeratingWithState:&v51 objects:v63 count:16];
            if (!v13)
            {
LABEL_22:

              id v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v48, "count"));
              if ([v48 count])
              {
                unint64_t v22 = 0;
                do
                {
                  uint64_t v23 = [v48 objectAtIndexedSubscript:v22];
                  uint64_t v24 = v23;
                  if ((v11 & v12 & 1) == 0 || ([v23 wasString] & 1) == 0)
                  {
                    double v25 = [v24 URL];
                    [v21 addObject:v25];
                  }
                  ++v22;
                }
                while ([v48 count] > v22);
              }
              id v50 = 0;
              BOOL v26 = [(SFAirDropActivityViewController *)self isValidPayload:v21 toPerson:v46 invalidMessage:&v50];
              id v27 = v50;
              if (v26)
              {
                sendingAppBundleID = self->_sendingAppBundleID;
                sessionID = self->_sessionID;
                SFScaleAndRotateImage(v7, 540.0);
                id v30 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "startSendForBundleID:sessionID:items:description:previewImage:fromShareSheet:", sendingAppBundleID, sessionID, v21, v10, objc_msgSend(v30, "CGImage"), 0);
              }
              else
              {
                id v30 = (id)objc_opt_new();
                CGFloat v32 = SFLocalizedStringForKey();
                [v30 setTitle:v32];

                [v30 setMessage:v27];
                v33 = SFLocalizedStringForKey();
                [v30 setDefaultButtonTitle:v33];

                [v30 present];
                double v34 = [(SFAirDropActivityViewController *)self cellForPerson:v46];
                [v34 userDidCancel];
                collectionView = self->_collectionView;
                uint64_t v36 = [(UICollectionView *)collectionView indexPathForCell:v34];
                [(UICollectionView *)collectionView deselectItemAtIndexPath:v36 animated:0];

                id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                char v38 = objc_opt_respondsToSelector();

                if (v38)
                {
                  id v39 = objc_loadWeakRetained((id *)&self->_delegate);
                  [v39 airDropActivityDidFailToStartTransfer];
                }
                id v27 = v34;
              }

              goto LABEL_36;
            }
          }
        }
        id v7 = airdrop_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = NSStringFromSelector(a2);
          *(_DWORD *)buf = v40;
          v60 = v31;
          __int16 v61 = 2112;
          v62 = v46;
          _os_log_error_impl(&dword_21DB23000, v7, OS_LOG_TYPE_ERROR, "%@ failed to find request ID for %@", buf, 0x16u);
        }
LABEL_36:
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v44);
  }
}

- (BOOL)isValidPayload:(id)a3 toPerson:(id)a4 invalidMessage:(id *)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  SFFakeFilesAndItemsArrayForURLs();
  id v8 = 0;
  id v9 = 0;
  __int16 v75 = 0;
  uint64_t v74 = 0;
  v62 = SFContentTypes();
  id v60 = 0;
  __int16 v61 = v9;
  if (([v7 supportsPasses] & 1) == 0)
  {
    v63 = v7;
    id v58 = v6;
    id v59 = v8;
    id v21 = [v8 firstObject];
    unint64_t v22 = [v21 objectForKeyedSubscript:*MEMORY[0x263F6C3E0]];
    id v12 = [v22 pathExtension];

    [v62 allKeys];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v71;
      char v26 = 1;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v71 != v25) {
            objc_enumerationMutation(obj);
          }
          if (SFIsPass())
          {
            int v28 = [v63 isUnknown];
            int v29 = @"TRANSFER_TO_PERSON_NO_WALLET_TEXT";
            if (v28) {
              int v29 = @"TRANSFER_TO_DEVICE_NO_WALLET_TEXT";
            }
            id v30 = NSString;
            uint64_t v31 = v29;
            CGFloat v32 = SFLocalizedStringForKey();
            v33 = NSString;
            SFLocalizedStringForKey();
            int v35 = v34 = v12;

            uint64_t v36 = [v63 displayName];
            uint64_t v37 = objc_msgSend(v33, "stringWithFormat:", v35, v36);
            objc_msgSend(v30, "stringWithFormat:", v32, v37);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

            id v12 = v34;
            char v26 = 0;
          }
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
      }
      while (v24);
    }
    else
    {
      char v26 = 1;
    }

    id v6 = v58;
    goto LABEL_27;
  }
  if ([v7 supportsFMF])
  {
    if (![v7 supportsCredentials] || objc_msgSend(v7, "isUnknown"))
    {
      long long v10 = [v9 firstObject];
      unsigned __int8 v11 = [v10 scheme];
      id v12 = [v11 lowercaseString];

      int MyFriendsLink = SFIsCredential();
      if (MyFriendsLink)
      {
        uint64_t v14 = [v61 firstObject];
        SFIsPasskeyCredentialLink();

        uint64_t v15 = NSString;
        id v16 = SFLocalizedStringForKey();
        uint64_t v17 = SFLocalizedStringForKeyInStringsFileNamed();
        objc_msgSend(v15, "stringWithFormat:", v16, v17);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v79[0] = @"supportsCredentials";
        long long v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "supportsCredentials"));
        v79[1] = @"unknownPeer";
        v80[0] = v18;
        BOOL v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isUnknown"));
        v80[1] = v19;
        char v20 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];

        SFMetricsLog();
LABEL_23:

        goto LABEL_24;
      }
      goto LABEL_24;
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v12 = v6;
    uint64_t v50 = [v12 countByEnumeratingWithState:&v66 objects:v78 count:16];
    if (!v50)
    {
      char v26 = 1;
      goto LABEL_28;
    }
    uint64_t v51 = v50;
    id v59 = v8;
    v63 = v7;
    uint64_t v52 = *(void *)v67;
    while (2)
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v67 != v52) {
          objc_enumerationMutation(v12);
        }
        uint64_t v54 = *(void *)(*((void *)&v66 + 1) + 8 * j);
        long long v55 = [MEMORY[0x263F01880] defaultWorkspace];
        if ([v55 isApplicationAvailableToOpenURL:v54 error:0])
        {
        }
        else
        {
          long long v56 = [MEMORY[0x263F01880] defaultWorkspace];
          int v57 = [v56 isApplicationAvailableToOpenURL:v54 includePrivateURLSchemes:1 error:0];

          if (v57)
          {
            [v12 count];
            SFLocalizedStringForKey();
            char v26 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_27;
          }
        }
      }
      uint64_t v51 = [v12 countByEnumeratingWithState:&v66 objects:v78 count:16];
      char v26 = 1;
      if (v51) {
        continue;
      }
      break;
    }
LABEL_27:
    id v7 = v63;
    id v8 = v59;
    goto LABEL_28;
  }
  char v38 = [v9 firstObject];
  id v39 = [v38 scheme];
  id v12 = [v39 lowercaseString];

  int MyFriendsLink = SFIsFindMyFriendsLink();
  if (MyFriendsLink)
  {
    int v40 = [v7 isUnknown];
    long long v41 = @"TRANSFER_TO_PERSON_NO_FMF_TEXT";
    if (v40) {
      long long v41 = @"TRANSFER_TO_DEVICE_NO_FMF_TEXT";
    }
    id v42 = v12;
    uint64_t v43 = NSString;
    uint64_t v44 = v41;
    char v20 = SFLocalizedStringForKey();
    uint64_t v45 = NSString;
    long long v46 = SFLocalizedStringForKey();

    id v47 = [v7 displayName];
    v48 = objc_msgSend(v45, "stringWithFormat:", v46, v47);
    objc_msgSend(v43, "stringWithFormat:", v20, v48);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    id v12 = v42;
    goto LABEL_23;
  }
LABEL_24:
  char v26 = MyFriendsLink ^ 1;
LABEL_28:

  return v26 & 1;
}

- (BOOL)addURL:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = airdrop_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    [v15 size];
    uint64_t v23 = NSStringFromCGSize(v46);
    *(_DWORD *)buf = 138413314;
    id v36 = v12;
    __int16 v37 = 2112;
    id v38 = v13;
    __int16 v39 = 2112;
    id v40 = v14;
    __int16 v41 = 2112;
    id v42 = v15;
    __int16 v43 = 2112;
    uint64_t v44 = v23;
    _os_log_debug_impl(&dword_21DB23000, v16, OS_LOG_TYPE_DEBUG, "addURL:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);
  }
  uint64_t v17 = [v12 scheme];

  if (v17)
  {
    self->_itemsReady = 0;
    if (v15 || (int64_t generatedPreviews = self->_generatedPreviews, generatedPreviews > 2))
    {
      operationQueue = self->_operationQueue;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __96__SFAirDropActivityViewController_addURL_withAttachmentName_description_previewImage_itemIndex___block_invoke_428;
      v24[3] = &unk_264472870;
      uint64_t v25 = v12;
      id v26 = v14;
      id v27 = v15;
      int v28 = self;
      int v29 = a7;
      [(NSOperationQueue *)operationQueue addOperationWithBlock:v24];

      char v20 = v25;
    }
    else
    {
      self->_int64_t generatedPreviews = generatedPreviews + 1;
      BOOL v19 = self->_operationQueue;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __96__SFAirDropActivityViewController_addURL_withAttachmentName_description_previewImage_itemIndex___block_invoke;
      v30[3] = &unk_264472848;
      uint64_t v31 = v12;
      id v32 = v14;
      v33 = self;
      int v34 = a7;
      [(NSOperationQueue *)v19 addOperationWithBlock:v30];

      char v20 = v31;
    }
  }
  else
  {
    char v20 = airdrop_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SFAirDropActivityViewController addURL:withAttachmentName:description:previewImage:itemIndex:]();
    }
  }

  return 1;
}

void __96__SFAirDropActivityViewController_addURL_withAttachmentName_description_previewImage_itemIndex___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isFileURL])
  {
    double v2 = [*(id *)(a1 + 32) path];
    long long v3 = v2;
    if (v2)
    {
      uint64_t v4 = [v2 pathExtension];
      CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x263F01910], v4, 0);
      if (PreferredIdentifierForTag)
      {
        CFStringRef v6 = PreferredIdentifierForTag;
        if (UTTypeConformsTo(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x263F01A68]))
        {
          id v7 = [MEMORY[0x263F827E8] imageWithContentsOfFile:v3];
        }
        else
        {
          id v7 = 0;
        }
        CFRelease(v6);
      }
      else
      {
        id v8 = airdrop_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __96__SFAirDropActivityViewController_addURL_withAttachmentName_description_previewImage_itemIndex___block_invoke_cold_1();
        }

        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v9 = +[SFAirDropPayload newPayloadWithURL:*(void *)(a1 + 32) description:*(void *)(a1 + 40) previewImage:v7 identifier:*(void *)(*(void *)(a1 + 48) + 1000)];
  id v10 = *(id *)(*(void *)(a1 + 48) + 1416);
  objc_sync_enter(v10);
  unsigned __int8 v11 = *(void **)(*(void *)(a1 + 48) + 1416);
  id v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v11 setObject:v9 forKeyedSubscript:v12];

  objc_sync_exit(v10);
}

void __96__SFAirDropActivityViewController_addURL_withAttachmentName_description_previewImage_itemIndex___block_invoke_428(uint64_t a1)
{
  id v5 = +[SFAirDropPayload newPayloadWithURL:*(void *)(a1 + 32) description:*(void *)(a1 + 40) previewImage:*(void *)(a1 + 48) identifier:*(void *)(*(void *)(a1 + 56) + 1000)];
  id v2 = *(id *)(*(void *)(a1 + 56) + 1416);
  objc_sync_enter(v2);
  long long v3 = *(void **)(*(void *)(a1 + 56) + 1416);
  uint64_t v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  [v3 setObject:v5 forKeyedSubscript:v4];

  objc_sync_exit(v2);
}

- (BOOL)addImage:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = airdrop_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    [v12 size];
    id v30 = NSStringFromCGSize(v53);
    [v15 size];
    uint64_t v31 = NSStringFromCGSize(v54);
    *(_DWORD *)buf = 138413570;
    id v41 = v12;
    __int16 v42 = 2112;
    __int16 v43 = v30;
    __int16 v44 = 2112;
    id v45 = v13;
    __int16 v46 = 2112;
    id v47 = v14;
    __int16 v48 = 2112;
    id v49 = v15;
    __int16 v50 = 2112;
    uint64_t v51 = v31;
    _os_log_debug_impl(&dword_21DB23000, v16, OS_LOG_TYPE_DEBUG, "addImage:[%@]-size:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x3Eu);
  }
  id v32 = v13;

  self->_itemsReady = 0;
  if (!v15) {
    id v15 = v12;
  }
  uint64_t v17 = NSString;
  sessionID = self->_sessionID;
  int64_t v19 = self->_attachmentCount + 1;
  self->_attachmentCount = v19;
  char v20 = [v17 stringWithFormat:@"IMG_%@-%ld", sessionID, v19];
  SuggestedFilename = (void *)_UTTypeCreateSuggestedFilename();
  unint64_t v22 = NSTemporaryDirectory();
  uint64_t v23 = [v22 stringByAppendingPathComponent:SuggestedFilename];
  operationQueue = self->_operationQueue;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __98__SFAirDropActivityViewController_addImage_withAttachmentName_description_previewImage_itemIndex___block_invoke;
  v33[3] = &unk_264472898;
  id v34 = v12;
  id v35 = v23;
  id v36 = v14;
  id v37 = v15;
  id v38 = self;
  int v39 = a7;
  id v25 = v15;
  id v26 = v14;
  id v27 = v23;
  id v28 = v12;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v33];

  return 1;
}

void __98__SFAirDropActivityViewController_addImage_withAttachmentName_description_previewImage_itemIndex___block_invoke(uint64_t a1)
{
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 1.0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 writeToFile:*(void *)(a1 + 40) atomically:1];
  id v2 = [NSURL fileURLWithPath:*(void *)(a1 + 40)];
  id v3 = +[SFAirDropPayload newPayloadWithURL:v2 description:*(void *)(a1 + 48) previewImage:*(void *)(a1 + 56) identifier:*(void *)(*(void *)(a1 + 64) + 1000)];

  id v4 = *(id *)(*(void *)(a1 + 64) + 1416);
  objc_sync_enter(v4);
  id v5 = *(void **)(*(void *)(a1 + 64) + 1416);
  CFStringRef v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  [v5 setObject:v3 forKeyedSubscript:v6];

  objc_sync_exit(v4);
}

- (BOOL)addData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = (__CFString *)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  int64_t v19 = airdrop_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = [v14 length];
    [v18 size];
    id v26 = NSStringFromCGSize(v42);
    *(_DWORD *)buf = 134219522;
    id v28 = v14;
    __int16 v29 = 2048;
    uint64_t v30 = v25;
    __int16 v31 = 2112;
    id v32 = v15;
    __int16 v33 = 2112;
    id v34 = v16;
    __int16 v35 = 2112;
    id v36 = v17;
    __int16 v37 = 2112;
    id v38 = v18;
    __int16 v39 = 2112;
    id v40 = v26;
    _os_log_debug_impl(&dword_21DB23000, v19, OS_LOG_TYPE_DEBUG, "addData:[%p]-length:[%lu] ofType:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x48u);
  }
  self->_itemsReady = 0;
  id v20 = v18;
  id v21 = v20;
  if (!v20)
  {
    if (UTTypeConformsTo(v15, (CFStringRef)*MEMORY[0x263F01A68]))
    {
      id v21 = [MEMORY[0x263F827E8] imageWithData:v14];
    }
    else
    {
      id v21 = 0;
    }
  }
  if (v16) {
    id v22 = v16;
  }
  else {
    id v22 = v17;
  }
  BOOL v23 = [(SFAirDropActivityViewController *)self createURLPayloadForData:v14 ofType:v15 withAttachmentName:v22 description:v17 previewImage:v21 itemIndex:v8 completion:0];

  return v23;
}

- (BOOL)createURLPayloadForData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8 completion:(id)a9
{
  id v14 = a3;
  CFStringRef v15 = (const __CFString *)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  __int16 v46 = v17;
  id v45 = (__CFString *)v15;
  if ([v16 length])
  {
    SuggestedFilename = (void *)_UTTypeCreateSuggestedFilename();
    id v21 = (__CFString *)[SuggestedFilename mutableCopy];

    [(__CFString *)v21 replaceOccurrencesOfString:@"/", @"-", 0, 0, [(__CFString *)v21 length] withString options range];
    [(__CFString *)v21 replaceOccurrencesOfString:@":", @"-", 0, 0, [(__CFString *)v21 length] withString options range];
    if (self->_attachmentCount)
    {
      id v22 = v14;
      BOOL v23 = [(__CFString *)v21 pathExtension];
      if ([v23 length])
      {
        uint64_t v24 = [(__CFString *)v21 stringByDeletingPathExtension];
        uint64_t v25 = NSString;
        int64_t v26 = self->_attachmentCount + 1;
        self->_attachmentCount = v26;
        id v27 = [v25 stringWithFormat:@"%@-%ld.%@", v24, v26, v23];
      }
      else
      {
        __int16 v33 = NSString;
        int64_t v34 = self->_attachmentCount + 1;
        self->_attachmentCount = v34;
        id v27 = [v33 stringWithFormat:@"%@-%ld.%@", v21, v34, v23];
      }
    }
    else
    {
      id v22 = v14;
      id v27 = v21;
      ++self->_attachmentCount;
    }
  }
  else
  {
    id v22 = v14;
    CFStringRef v28 = UTTypeCopyPreferredTagWithClass(v15, (CFStringRef)*MEMORY[0x263F01910]);
    if (v28) {
      id v21 = (__CFString *)v28;
    }
    else {
      id v21 = @"data";
    }
    __int16 v29 = (__CFString *)UTTypeCopyDescription(v15);
    uint64_t v30 = NSString;
    sessionID = self->_sessionID;
    int64_t v32 = self->_attachmentCount + 1;
    self->_attachmentCount = v32;
    id v27 = [v30 stringWithFormat:@"%@-%@-%ld.%@", v29, sessionID, v32, v21];
  }
  __int16 v35 = NSTemporaryDirectory();
  id v36 = [v35 stringByAppendingPathComponent:v27];
  operationQueue = self->_operationQueue;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __131__SFAirDropActivityViewController_createURLPayloadForData_ofType_withAttachmentName_description_previewImage_itemIndex_completion___block_invoke;
  v47[3] = &unk_2644728C0;
  id v48 = v22;
  id v49 = v36;
  id v50 = v46;
  id v51 = v18;
  int v54 = a8;
  uint64_t v52 = self;
  id v53 = v19;
  id v38 = v19;
  id v39 = v18;
  id v40 = v46;
  id v41 = v36;
  id v42 = v22;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v47];

  return 1;
}

void __131__SFAirDropActivityViewController_createURLPayloadForData_ofType_withAttachmentName_description_previewImage_itemIndex_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) writeToFile:*(void *)(a1 + 40) atomically:1];
  id v2 = [NSURL fileURLWithPath:*(void *)(a1 + 40)];
  id v7 = +[SFAirDropPayload newPayloadWithURL:v2 description:*(void *)(a1 + 48) previewImage:*(void *)(a1 + 56) identifier:*(void *)(*(void *)(a1 + 64) + 1000)];

  id v3 = *(id *)(*(void *)(a1 + 64) + 1416);
  objc_sync_enter(v3);
  id v4 = *(void **)(*(void *)(a1 + 64) + 1416);
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  [v4 setObject:v7 forKeyedSubscript:v5];

  objc_sync_exit(v3);
  uint64_t v6 = *(void *)(a1 + 72);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

- (BOOL)addString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = airdrop_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    [v16 size];
    BOOL v23 = NSStringFromCGSize(v35);
    *(_DWORD *)buf = 138413314;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v16;
    __int16 v32 = 2112;
    __int16 v33 = v23;
    _os_log_debug_impl(&dword_21DB23000, v17, OS_LOG_TYPE_DEBUG, "addString:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);
  }
  if (sIgnoreStrings)
  {
    BOOL v18 = 1;
  }
  else
  {
    id v19 = [v13 dataUsingEncoding:4];
    if (v15)
    {
      id v20 = airdrop_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        id v25 = v21;
        _os_log_impl(&dword_21DB23000, v20, OS_LOG_TYPE_DEFAULT, "%@ discarding description", buf, 0xCu);
      }
    }
    BOOL v18 = [(SFAirDropActivityViewController *)self createURLPayloadForData:v19 ofType:*MEMORY[0x263F01AF0] withAttachmentName:v14 description:v15 previewImage:v16 itemIndex:v7 completion:&__block_literal_global_6];
  }
  return v18;
}

uint64_t __99__SFAirDropActivityViewController_addString_withAttachmentName_description_previewImage_itemIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWasString:1];
}

- (BOOL)addAttributedString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = airdrop_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    [v15 size];
    __int16 v26 = NSStringFromCGSize(v41);
    *(_DWORD *)buf = 138413314;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2112;
    id v37 = v15;
    __int16 v38 = 2112;
    id v39 = v26;
    _os_log_debug_impl(&dword_21DB23000, v16, OS_LOG_TYPE_DEBUG, "addAttributedString:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);
  }
  if (sIgnoreStrings)
  {
    BOOL v17 = 1;
  }
  else
  {
    uint64_t v18 = [v12 length];
    uint64_t v28 = *MEMORY[0x263F814D0];
    uint64_t v29 = *MEMORY[0x263F81508];
    id v19 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v27 = 0;
    id v20 = objc_msgSend(v12, "dataFromRange:documentAttributes:error:", 0, v18, v19, &v27);
    id v21 = v27;

    if (v21)
    {
      id v22 = airdrop_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[SFAirDropActivityViewController addAttributedString:withAttachmentName:description:previewImage:itemIndex:]();
      }

      uint64_t v23 = [v12 string];
    }
    else
    {
      uint64_t v23 = [[NSString alloc] initWithData:v20 encoding:4];
    }
    uint64_t v24 = (void *)v23;
    BOOL v17 = [(SFAirDropActivityViewController *)self addString:v23 withAttachmentName:v13 description:v14 previewImage:v15 itemIndex:v7];
  }
  return v17;
}

- (void)handleLivePhotoItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  v45[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v28 = a4;
  id v13 = a5;
  id v14 = a6;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  CGSize v41 = __Block_byref_object_copy__0;
  id v42 = __Block_byref_object_dispose__0;
  id v43 = 0;
  uint64_t v44 = *MEMORY[0x263F08198];
  v45[0] = *MEMORY[0x263F08190];
  id v16 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
  uint64_t v17 = *MEMORY[0x263F01A98];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __117__SFAirDropActivityViewController_handleLivePhotoItemProvider_withAttachmentName_description_previewImage_itemIndex___block_invoke;
  v35[3] = &unk_264472908;
  id v37 = &v38;
  uint64_t v18 = v15;
  __int16 v36 = v18;
  [v12 loadItemForTypeIdentifier:v17 options:v16 completionHandler:v35];
  dispatch_time_t v19 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v18, v19);
  id v20 = v14;
  id v21 = v20;
  if (!v20)
  {
    id v22 = (void *)MEMORY[0x263F827E8];
    uint64_t v23 = objc_msgSend((id)v39[5], "imageURL", v28);
    uint64_t v24 = [v23 path];
    id v21 = [v22 imageWithContentsOfFile:v24];
  }
  operationQueue = self->_operationQueue;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __117__SFAirDropActivityViewController_handleLivePhotoItemProvider_withAttachmentName_description_previewImage_itemIndex___block_invoke_2;
  v29[3] = &unk_264472930;
  id v33 = &v38;
  id v26 = v13;
  id v30 = v26;
  id v27 = v21;
  id v31 = v27;
  __int16 v32 = self;
  int v34 = a7;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v29];

  _Block_object_dispose(&v38, 8);
}

void __117__SFAirDropActivityViewController_handleLivePhotoItemProvider_withAttachmentName_description_previewImage_itemIndex___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __117__SFAirDropActivityViewController_handleLivePhotoItemProvider_withAttachmentName_description_previewImage_itemIndex___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = 0;
  dispatch_semaphore_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v2 = (void *)getPLPhotoLibraryClass_softClass;
  uint64_t v17 = getPLPhotoLibraryClass_softClass;
  if (!getPLPhotoLibraryClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getPLPhotoLibraryClass_block_invoke;
    v13[3] = &unk_2644729A8;
    v13[4] = &v14;
    __getPLPhotoLibraryClass_block_invoke((uint64_t)v13);
    id v2 = (void *)v15[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v14, 8);
  id v4 = [v3 photoOutboundSharingTmpDirectoryURL];
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) videoURL];
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) imageURL];
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) uniqueIdentifier];
  uint64_t v8 = SFCreateLivePhotoBundle();

  id v9 = +[SFAirDropPayload newPayloadWithURL:v8 description:*(void *)(a1 + 32) previewImage:*(void *)(a1 + 40) identifier:*(void *)(*(void *)(a1 + 48) + 1000)];
  id v10 = *(id *)(*(void *)(a1 + 48) + 1416);
  objc_sync_enter(v10);
  unsigned __int8 v11 = *(void **)(*(void *)(a1 + 48) + 1416);
  id v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  [v11 setObject:v9 forKeyedSubscript:v12];

  objc_sync_exit(v10);
}

- (void)handleImageItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  v31[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__0;
  id v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  uint64_t v30 = *MEMORY[0x263F08198];
  v31[0] = *MEMORY[0x263F08190];
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  uint64_t v18 = *MEMORY[0x263F01A68];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __113__SFAirDropActivityViewController_handleImageItemProvider_withAttachmentName_description_previewImage_itemIndex___block_invoke;
  v21[3] = &unk_264472958;
  uint64_t v23 = &v24;
  dispatch_time_t v19 = v16;
  id v22 = v19;
  [v12 loadItemForTypeIdentifier:v18 options:v17 completionHandler:v21];
  dispatch_time_t v20 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v19, v20);
  [(SFAirDropActivityViewController *)self addImage:v25[5] withAttachmentName:v13 description:v14 previewImage:v15 itemIndex:v7];

  _Block_object_dispose(&v24, 8);
}

void __113__SFAirDropActivityViewController_handleImageItemProvider_withAttachmentName_description_previewImage_itemIndex___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)handleOtherItemProvider:(id)a3 withDataType:(id)a4 attachmentName:(id)a5 description:(id)a6 previewImage:(id)a7
{
  v64[5] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v45 = a5;
  id v46 = a6;
  id v47 = a7;
  uint64_t v14 = *MEMORY[0x263F01A68];
  v64[0] = *MEMORY[0x263F01B50];
  v64[1] = v14;
  uint64_t v15 = *MEMORY[0x263F01AF0];
  v64[2] = *MEMORY[0x263F01B10];
  v64[3] = v15;
  v64[4] = *MEMORY[0x263F01A08];
  dispatch_semaphore_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:5];
  uint64_t v17 = v16;
  if (v13)
  {
    uint64_t v18 = [v16 arrayByAddingObject:v13];

    uint64_t v17 = (void *)v18;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (!v20) {
    goto LABEL_36;
  }
  uint64_t v21 = *(void *)v58;
  while (2)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v58 != v21) {
        objc_enumerationMutation(v19);
      }
      uint64_t v23 = *(void *)(*((void *)&v57 + 1) + 8 * i);
      if ([v12 hasItemConformingToTypeIdentifier:v23])
      {
        dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
        uint64_t v51 = 0;
        uint64_t v52 = (id *)&v51;
        uint64_t v53 = 0x3032000000;
        int v54 = __Block_byref_object_copy__0;
        long long v55 = __Block_byref_object_dispose__0;
        id v56 = 0;
        uint64_t v61 = *MEMORY[0x263F08198];
        uint64_t v62 = *MEMORY[0x263F08190];
        id v25 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __112__SFAirDropActivityViewController_handleOtherItemProvider_withDataType_attachmentName_description_previewImage___block_invoke;
        v48[3] = &unk_264472980;
        id v50 = &v51;
        uint64_t v26 = v24;
        id v49 = v26;
        [v12 loadItemForTypeIdentifier:v23 options:v25 completionHandler:v48];
        dispatch_time_t v27 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v26, v27);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass)
        {
          id v29 = NSURL;
          id v30 = v52[5];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_22:
            objc_opt_class();
            unsigned __int8 v34 = objc_opt_isKindOfClass();
            id v35 = v52[5];
            if ((v34 & (sIgnoreStrings == 0)) == 1)
            {
              ++self->_sharedItemsCount;
              -[SFAirDropActivityViewController addString:withAttachmentName:description:previewImage:itemIndex:](self, "addString:withAttachmentName:description:previewImage:itemIndex:", v35, v45, v46, v47);
            }
            else
            {
              objc_opt_class();
              unsigned __int8 v36 = objc_opt_isKindOfClass();
              id v37 = v52[5];
              if ((v36 & (sIgnoreStrings == 0)) == 1)
              {
                ++self->_sharedItemsCount;
                -[SFAirDropActivityViewController addAttributedString:withAttachmentName:description:previewImage:itemIndex:](self, "addAttributedString:withAttachmentName:description:previewImage:itemIndex:", v37, v45, v46, v47);
              }
              else
              {
                objc_opt_class();
                char v38 = objc_opt_isKindOfClass();
                id v39 = v52[5];
                if (v38)
                {
                  ++self->_sharedItemsCount;
                  -[SFAirDropActivityViewController addURL:withAttachmentName:description:previewImage:itemIndex:](self, "addURL:withAttachmentName:description:previewImage:itemIndex:", v39, v45, v46, v47);
                }
                else
                {
                  objc_opt_class();
                  char v40 = objc_opt_isKindOfClass();
                  id v41 = v52[5];
                  if (v40)
                  {
                    ++self->_sharedItemsCount;
                    -[SFAirDropActivityViewController addImage:withAttachmentName:description:previewImage:itemIndex:](self, "addImage:withAttachmentName:description:previewImage:itemIndex:", v41, v45, v46, v47);
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      if (v13)
                      {
                        id v42 = v13;
                      }
                      else
                      {
                        id v43 = [v12 registeredTypeIdentifiers];
                        id v42 = [v43 firstObject];
                      }
                      id v44 = v52[5];
                      ++self->_sharedItemsCount;
                      -[SFAirDropActivityViewController addData:ofType:withAttachmentName:description:previewImage:itemIndex:](self, "addData:ofType:withAttachmentName:description:previewImage:itemIndex:", v44, v42, v45, v46, v47);
                    }
                  }
                }
              }
            }

            _Block_object_dispose(&v51, 8);
            goto LABEL_36;
          }
          id v29 = NSURL;
          id v30 = [v52[5] string];
        }
        id v31 = [v29 URLWithString:v30];
        if ((isKindOfClass & 1) == 0) {

        }
        if (v31)
        {
          __int16 v32 = [v31 scheme];
          BOOL v33 = v32 == 0;

          if (!v33) {
            objc_storeStrong(v52 + 5, v31);
          }
        }

        goto LABEL_22;
      }
    }
    uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v63 count:16];
    if (v20) {
      continue;
    }
    break;
  }
LABEL_36:
}

void __112__SFAirDropActivityViewController_handleOtherItemProvider_withDataType_attachmentName_description_previewImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 localizedDescription];
      int v10 = 138412290;
      unsigned __int8 v11 = v9;
      _os_log_impl(&dword_21DB23000, v8, OS_LOG_TYPE_DEFAULT, "Failed to load item for type identifier with error %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)addItemProvider:(id)a3 withDataType:(id)a4 attachmentName:(id)a5 description:(id)a6 previewImage:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a4;
  uint64_t v17 = airdrop_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    [v15 size];
    id v19 = NSStringFromCGSize(v31);
    int v20 = 138413314;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2112;
    id v25 = v14;
    __int16 v26 = 2112;
    id v27 = v15;
    __int16 v28 = 2112;
    id v29 = v19;
    _os_log_debug_impl(&dword_21DB23000, v17, OS_LOG_TYPE_DEBUG, "addItemProvider:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", (uint8_t *)&v20, 0x34u);
  }
  self->_itemsReady = 0;
  [(SFAirDropActivityViewController *)self handleOtherItemProvider:v12 withDataType:v16 attachmentName:v13 description:v14 previewImage:v15];

  return 1;
}

- (BOOL)addItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6
{
  return [(SFAirDropActivityViewController *)self addItemProvider:a3 withDataType:0 attachmentName:a4 description:a5 previewImage:a6];
}

- (void)generateSpecialPreviewPhotoForRequestID:(int64_t)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = self->_cachedSharedItems;
  objc_sync_enter(v6);
  id v7 = (void *)[(NSMutableOrderedSet *)self->_cachedSharedItems copy];
  objc_sync_exit(v6);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v12 identifer] == a3)
        {
          id v13 = [v12 URL];
          if (v13)
          {
            id v14 = [v12 previewImage];
            BOOL v15 = v14 == 0;

            if (!v15)
            {
              id v16 = [v12 previewImage];
              [v4 addObject:v16];

              uint64_t v17 = [v12 URL];
              [v5 addObject:v17];
            }
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v9);
  }

  if ((unint64_t)[v4 count] >= 2)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = v5;
    uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v31;
      CFStringRef v20 = (const __CFString *)*MEMORY[0x263F01910];
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(obj);
          }
          __int16 v22 = [*(id *)(*((void *)&v30 + 1) + 8 * j) pathExtension];
          CFStringRef PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v20, v22, 0);
          if ((SFIsImage() & 1) == 0 && (SFIsVideo() & 1) == 0 && (SFIsLivePhotos() & 1) == 0)
          {

            goto LABEL_25;
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    __int16 v24 = [MEMORY[0x263F82B60] mainScreen];
    [v24 scale];
    BOOL v26 = v25 == 2.0;

    SFImageStackFromImages(v4, dbl_21DBB2240[v26]);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    sharedItemsRequestIDToPreviewPhoto = self->_sharedItemsRequestIDToPreviewPhoto;
    __int16 v22 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)sharedItemsRequestIDToPreviewPhoto setObject:obj forKeyedSubscript:v22];
LABEL_25:
  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  [v7 itemSize];
  double v10 = v9;
  [v7 minimumLineSpacing];
  double v12 = v11;

  uint64_t v13 = [v8 numberOfItemsInSection:a5];
  double v14 = v10 * (double)v13;
  double v15 = v12 * (double)(v13 - 1);
  [v8 bounds];
  double v17 = v16;

  double v18 = 0.0;
  if ((v17 - v14 - v15) * 0.5 >= 0.0) {
    double v18 = (v17 - v14 - v15) * 0.5;
  }
  double v19 = 0.0;
  double v20 = 0.0;
  double v21 = 0.0;
  result.right = v21;
  result.bottom = v20;
  result.left = v18;
  result.top = v19;
  return result;
}

- (void)handleOperationCallback:(__SFOperation *)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v6 = a5;
  id v7 = airdrop_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (a4 == 10)
  {
    if (v8) {
      -[SFAirDropActivityViewController handleOperationCallback:event:withResults:](v6, v7);
    }
  }
  else if (v8)
  {
    -[SFAirDropActivityViewController handleOperationCallback:event:withResults:](a4, (uint64_t)v6, v7);
  }
}

- (void)cleanupWithSelectedActivityType:(id)a3
{
  id v5 = a3;
  id v6 = airdrop_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(SFAirDropActivityViewController *)a2 cleanupWithSelectedActivityType:v6];
  }

  if (!self->_logger)
  {
    self->_logger = (__SFOperation *)SFOperationCreate();
    SFOperationSetClient();
    SFOperationSetDispatchQueue();
    SFOperationSetProperty();
    SFOperationSetProperty();
    SFOperationResume();
  }
}

- (void)_startTelemetry
{
  self->_peopleStartTimestamp = mach_continuous_time();
  id v3 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  realNameToFirstSeenTimestamp = self->_realNameToFirstSeenTimestamp;
  self->_realNameToFirstSeenTimestamp = v3;
}

- (void)_stopTelemetry
{
  realNameToFirstSeenTimestamp = self->_realNameToFirstSeenTimestamp;
  self->_realNameToFirstSeenTimestamp = 0;
}

- (void)_collectTelemetryForPeople:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v14 = mach_continuous_time();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) realName];
        if (v10)
        {
          double v11 = [(NSMapTable *)self->_realNameToFirstSeenTimestamp objectForKey:v10];
          if (!v11)
          {
            realNameToFirstSeenTimestamp = self->_realNameToFirstSeenTimestamp;
            uint64_t v13 = [NSNumber numberWithUnsignedLongLong:v14];
            [(NSMapTable *)realNameToFirstSeenTimestamp setObject:v13 forKey:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)_emitTelemetryForPerson:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 realName];
  if (v5)
  {
    uint64_t v6 = [(NSMapTable *)self->_realNameToFirstSeenTimestamp objectForKey:v5];
    if (v6)
    {
      uint64_t v7 = airdrop_log();
      os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v4);

      double v9 = airdrop_log();
      double v10 = v9;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        unint64_t peopleStartTimestamp = self->_peopleStartTimestamp;
        int v15 = 134349056;
        unint64_t v16 = peopleStartTimestamp;
        _os_signpost_emit_with_name_impl(&dword_21DB23000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "TimeToDiscoverPerson", " enableTelemetry=YES  %{public, signpost.description:begin_time}llu", (uint8_t *)&v15, 0xCu);
      }

      double v12 = airdrop_log();
      uint64_t v13 = v12;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        uint64_t v14 = [v6 unsignedLongLongValue];
        int v15 = 134349056;
        unint64_t v16 = v14;
        _os_signpost_emit_with_name_impl(&dword_21DB23000, v13, OS_SIGNPOST_INTERVAL_END, v8, "TimeToDiscoverPerson", "%{public, signpost.description:end_time}llu", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- ($115C4C562B26FF47E01F9F4EA65B5887)sendingApplicationAuditToken
{
  long long v3 = *(_OWORD *)&self[47].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[46].var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (SFAirDropActivityViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SFAirDropActivityViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)sharedItemsAvailable
{
  return self->_sharedItemsAvailable;
}

- (BOOL)otherActivityViewPresented
{
  return self->_otherActivityViewPresented;
}

- (BOOL)darkStyleOnLegacyApp
{
  return self->_darkStyleOnLegacyApp;
}

- (void)setDarkStyleOnLegacyApp:(BOOL)a3
{
  self->_darkStyleOnLegacyApp = a3;
}

- (BOOL)multipleRows
{
  return self->_multipleRows;
}

- (void)setMultipleRows:(BOOL)a3
{
  self->_multipleRows = a3;
}

- (NSArray)urlsBeingShared
{
  return self->_urlsBeingShared;
}

- (void)setUrlsBeingShared:(id)a3
{
}

- (NSArray)photosAssetIDs
{
  return self->_photosAssetIDs;
}

- (void)setPhotosAssetIDs:(id)a3
{
}

- (NSString)overriddenTitleText
{
  return self->_overriddenTitleText;
}

- (void)setOverriddenTitleText:(id)a3
{
}

- (NSString)overriddenNoWiFIBTText
{
  return self->_overriddenNoWiFIBTText;
}

- (void)setOverriddenNoWiFIBTText:(id)a3
{
}

- (NSString)overriddenNoAWDLText
{
  return self->_overriddenNoAWDLText;
}

- (void)setOverriddenNoAWDLText:(id)a3
{
}

- (NSString)overriddenInstructionsText
{
  return self->_overriddenInstructionsText;
}

- (void)setOverriddenInstructionsText:(id)a3
{
}

- (BOOL)manuallyManageBrowsing
{
  return self->_manuallyManageBrowsing;
}

- (void)setManuallyManageBrowsing:(BOOL)a3
{
  self->_manuallyManageBrowsing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriddenInstructionsText, 0);
  objc_storeStrong((id *)&self->_overriddenNoAWDLText, 0);
  objc_storeStrong((id *)&self->_overriddenNoWiFIBTText, 0);
  objc_storeStrong((id *)&self->_overriddenTitleText, 0);
  objc_storeStrong((id *)&self->_photosAssetIDs, 0);
  objc_storeStrong((id *)&self->_urlsBeingShared, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
  objc_storeStrong((id *)&self->_sharedItemsMap, 0);
  objc_storeStrong((id *)&self->_realNameToFirstSeenTimestamp, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_fcg, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_iconsVibrancyView, 0);
  objc_storeStrong((id *)&self->_instructionsVibrancyView, 0);
  objc_storeStrong((id *)&self->_titleVibrancyView, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_cachedSharedItems, 0);
  objc_storeStrong((id *)&self->_wirelessSettings, 0);
  objc_storeStrong((id *)&self->_sharedItemsRequestIDToPreviewPhoto, 0);
  objc_storeStrong((id *)&self->_personToSharedItemsRequestID, 0);
  objc_storeStrong((id *)&self->_personToStoredTransferFinalState, 0);
  objc_storeStrong((id *)&self->_personToProgress, 0);
  objc_storeStrong(&self->_progressToken, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_detailCollectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_showMoreButton, 0);
  objc_storeStrong((id *)&self->_detailCollectionView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_largeTextAirdropViewYConstraints, 0);
  objc_storeStrong((id *)&self->_airdropViewYConstraints, 0);
  objc_storeStrong((id *)&self->_largeTextTextViewConstraints, 0);
  objc_storeStrong((id *)&self->_textViewConstraints, 0);
  objc_storeStrong((id *)&self->_largeTextAirdropViewYConstraint, 0);
  objc_storeStrong((id *)&self->_noAWDLRightConstraint, 0);
  objc_storeStrong((id *)&self->_noAWDLTextView, 0);
  objc_storeStrong((id *)&self->_airDropInactiveIconLeftConstraint, 0);
  objc_storeStrong((id *)&self->_airDropInactiveIconView, 0);
  objc_storeStrong((id *)&self->_instructionsRightConstraint, 0);
  objc_storeStrong((id *)&self->_instructionsTextView, 0);
  objc_storeStrong((id *)&self->_airDropActiveIconLeftConstraint, 0);
  objc_storeStrong((id *)&self->_airDropActiveIconView, 0);
  objc_storeStrong((id *)&self->_noWifiRightConstraint, 0);
  objc_storeStrong((id *)&self->_noWifiTextView, 0);
  objc_storeStrong((id *)&self->_airDropIconLeftConstraint, 0);
  objc_storeStrong((id *)&self->_airDropIconView, 0);
  objc_storeStrong((id *)&self->_titleLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_reportBugButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_sendingAppBundleID, 0);
}

+ (void)airDropActivityCanPerformActivityWithItemClasses:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_21DB23000, v0, OS_LOG_TYPE_DEBUG, "Classes: %@", v1, 0xCu);
}

+ (void)airDropActivityCanPerformActivityWithItemClasses:(const char *)a1 .cold.2(const char *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  long long v3 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_21DB23000, a2, OS_LOG_TYPE_DEBUG, "%@", v4, 0xCu);
}

- (void)setSendingApplicationAuditToken:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21DB23000, log, OS_LOG_TYPE_ERROR, "Failed to get bundleID and pid from audit token, using mainBundle", v1, 2u);
}

- (void)setSendingApplicationAuditToken:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21DB23000, log, OS_LOG_TYPE_ERROR, "Failed to get bundleID from audit token, using pid", v1, 2u);
}

- (void)addURL:withAttachmentName:description:previewImage:itemIndex:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21DB23000, v0, OS_LOG_TYPE_ERROR, "Invalid URL (no scheme) %@", v1, 0xCu);
}

void __96__SFAirDropActivityViewController_addURL_withAttachmentName_description_previewImage_itemIndex___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21DB23000, v0, OS_LOG_TYPE_ERROR, "UTTypeCreatePreferredIdentifierForTag(%@) returned NULL", v1, 0xCu);
}

- (void)addAttributedString:withAttachmentName:description:previewImage:itemIndex:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_21DB23000, v1, OS_LOG_TYPE_ERROR, "Failed to convert NSAttributedString [%@] to HTML due to: %@", v2, 0x16u);
}

- (void)handleOperationCallback:(void *)a1 event:(NSObject *)a2 withResults:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 objectForKeyedSubscript:*MEMORY[0x263F6C3D0]];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21DB23000, a2, OS_LOG_TYPE_ERROR, "SFAirDropActivityViewController %@", v4, 0xCu);
}

- (void)handleOperationCallback:(uint64_t)a1 event:(uint64_t)a2 withResults:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a1 - 1) > 0xE) {
    uint64_t v3 = @"?";
  }
  else {
    uint64_t v3 = off_264472A00[a1 - 1];
  }
  int v4 = 138412802;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_21DB23000, log, OS_LOG_TYPE_ERROR, "SFAirDropActivityViewController UNHANDLED EVENT %@ [%d] %@", (uint8_t *)&v4, 0x1Cu);
}

- (void)cleanupWithSelectedActivityType:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_21DB23000, a3, OS_LOG_TYPE_DEBUG, "%@ %@", v6, 0x16u);
}

@end
@interface PKBarcodePassDetailViewController
+ (BOOL)isWifiEnabled;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isBluetoothEnabled;
- (BOOL)_linkedAppAvailable;
- (BOOL)_personalizeAvailable;
- (BOOL)_settingsAvailable;
- (BOOL)_updateHeaderHeight;
- (BOOL)handleDeletePassWithUniqueID:(id)a3;
- (BOOL)reloadData;
- (BOOL)shouldAllowRefresh;
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)showDoneButton;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (PKBarcodePassDetailViewController)initWithCoder:(id)a3;
- (PKBarcodePassDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PKBarcodePassDetailViewController)initWithPass:(id)a3;
- (PKBarcodePassDetailViewController)initWithStyle:(int64_t)a3 numberOfSections:(unint64_t)a4;
- (PKPass)pass;
- (PKPassDeleteHandler)deleteOverrider;
- (double)_offscreenHeaderHeight;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_automaticSelectionCell;
- (id)_barcodeCell;
- (id)_deleteCell;
- (id)_fieldCellForRow:(unint64_t)a3;
- (id)_fieldForRow:(unint64_t)a3;
- (id)_locationHelpTextWithLink:(id *)a3 linkRange:(_NSRange *)a4;
- (id)_locationHelpViewForTableView:(id)a3;
- (id)_personalizePassCell;
- (id)_relevantBuckets;
- (id)_settingsCellForRow:(unint64_t)a3;
- (id)linkedApp;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)rowAnimationForReloadingSection:(unint64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_numberOfAvailableSettings;
- (unint64_t)_settingForRow:(unint64_t)a3;
- (unint64_t)suppressedContent;
- (void)_bluetoothPowerChanged:(id)a3;
- (void)_done:(id)a3;
- (void)_passSettingsChanged:(id)a3;
- (void)_refreshFinished:(BOOL)a3;
- (void)_reloadPassAndView;
- (void)_sharePass;
- (void)_updateNavigationItem;
- (void)_updatePassProperties;
- (void)_updateStandardAppearance:(id)a3;
- (void)_wifiChanged:(id)a3;
- (void)appViewContentSizeChanged:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)pushSettingsFromViewToModel;
- (void)refreshControlValueChanged:(id)a3;
- (void)reloadSection:(unint64_t)a3;
- (void)reloadSections:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setDeleteOverrider:(id)a3;
- (void)setShowDoneButton:(BOOL)a3;
- (void)setShowsLinks:(BOOL)a3;
- (void)setSuppressedContent:(unint64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKBarcodePassDetailViewController

+ (BOOL)isWifiEnabled
{
  v2 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  char v3 = [v2 isWiFiEnabled];

  return v3;
}

- (PKBarcodePassDetailViewController)initWithCoder:(id)a3
{
  return 0;
}

- (PKBarcodePassDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (PKBarcodePassDetailViewController)initWithStyle:(int64_t)a3 numberOfSections:(unint64_t)a4
{
  return -[PKBarcodePassDetailViewController initWithPass:](self, "initWithPass:", 0, a4);
}

- (PKBarcodePassDetailViewController)initWithPass:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKBarcodePassDetailViewController;
  v6 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v22, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1), 7);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pass, a3);
    uint64_t v8 = [(PKPass *)v7->_pass displayProfile];
    displayProfile = v7->_displayProfile;
    v7->_displayProfile = (PKPassDisplayProfile *)v8;

    uint64_t v10 = +[PKPassColorProfile profileForDisplayProfile:v7->_displayProfile];
    colorProfile = v7->_colorProfile;
    v7->_colorProfile = (PKPassColorProfile *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fieldCellsByRow = v7->_fieldCellsByRow;
    v7->_fieldCellsByRow = v12;

    v7->_isWifiEnabled = 1;
    v7->_isLocationEnabled = 1;
    v7->_isBluetoothEnabled = 1;
    v14 = [(PKBarcodePassDetailViewController *)v7 navigationItem];
    objc_msgSend(v14, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v14, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v7->_titleOpacity = 0.0;
    id v15 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v15 configureWithDefaultBackground];
    [(PKBarcodePassDetailViewController *)v7 _updateStandardAppearance:v15];
    [v14 setStandardAppearance:v15];
    [(PKBarcodePassDetailViewController *)v7 _updatePassProperties];
    v16 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
    [v16 addWiFiObserver:v7 selector:sel__wifiChanged_];

    uint64_t v17 = [MEMORY[0x1E4F50B70] sharedInstance];
    btManager = v7->_btManager;
    v7->_btManager = (BluetoothManager *)v17;

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v7 selector:sel__bluetoothPowerChanged_ name:*MEMORY[0x1E4F50AE8] object:0];

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v7 selector:sel__bluetoothPowerChanged_ name:*MEMORY[0x1E4F50B58] object:0];

    PKObservePassSettingsChanged();
  }

  return v7;
}

- (void)dealloc
{
  PKUnregisterPassSettingsChangedObserver();
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  [v4 removeWiFiObserver:self];

  refreshTimeout = self->_refreshTimeout;
  if (refreshTimeout)
  {
    dispatch_source_cancel(refreshTimeout);
    v6 = self->_refreshTimeout;
    self->_refreshTimeout = 0;
  }
  if (self->_didRampScreenBrightness)
  {
    v7 = +[PKBacklightController sharedInstance];
    [v7 endRequestingBacklightRamping:self];

    self->_didRampScreenBrightness = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)PKBarcodePassDetailViewController;
  [(PKSectionTableViewController *)&v8 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setShowDoneButton:(BOOL)a3
{
  if (((!self->_showDoneButton ^ a3) & 1) == 0)
  {
    self->_showDoneButton = a3;
    [(PKBarcodePassDetailViewController *)self _updateNavigationItem];
  }
}

- (void)loadView
{
  v14.receiver = self;
  v14.super_class = (Class)PKBarcodePassDetailViewController;
  [(PKBarcodePassDetailViewController *)&v14 loadView];
  char v3 = [(PKBarcodePassDetailViewController *)self tableView];
  if ([(PKBarcodePassDetailViewController *)self shouldAllowRefresh])
  {
    v4 = (UIRefreshControl *)objc_alloc_init(MEMORY[0x1E4FB1B58]);
    refreshControl = self->_refreshControl;
    self->_refreshControl = v4;

    [(PKBarcodePassDetailViewController *)self setRefreshControl:self->_refreshControl];
    [(UIRefreshControl *)self->_refreshControl addTarget:self action:sel_refreshControlValueChanged_ forControlEvents:4096];
  }
  v6 = [[PKPassHeaderView alloc] initWithPass:self->_pass];
  passHeaderView = self->_passHeaderView;
  self->_passHeaderView = v6;

  [(PKPassHeaderView *)self->_passHeaderView setDelegate:self];
  [(PKPassHeaderView *)self->_passHeaderView setSuppressedContent:self->_suppressedContent];
  [(PKPassHeaderView *)self->_passHeaderView setShowModificationDate:[(PKBarcodePassDetailViewController *)self shouldAllowRefresh]];
  objc_super v8 = self->_passHeaderView;
  if ([(PKPass *)self->_pass isExpired]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = [(PKPass *)self->_pass isVoided];
  }
  [(PKPassHeaderView *)v8 setExpiredPass:v9];
  [(PKPassHeaderView *)self->_passHeaderView setSmall:1];
  id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v11 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 0.0, self->_headerHeight);
  headerView = self->_headerView;
  self->_headerView = v11;

  [v3 setTableHeaderView:self->_headerView];
  [(UIView *)self->_headerView addSubview:self->_passHeaderView];
  [v3 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"FirstSectionHeaderReuseIdentifier"];
  v13 = [(PKBarcodePassDetailViewController *)self tableView];
  [v13 setAccessibilityIdentifier:*MEMORY[0x1E4F85770]];

  [(PKBarcodePassDetailViewController *)self _updateHeaderHeight];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKBarcodePassDetailViewController;
  [(PKBarcodePassDetailViewController *)&v7 viewWillAppear:a3];
  int v4 = [MEMORY[0x1E4F1E600] locationServicesEnabled];
  if (((v4 ^ !self->_isLocationEnabled) & 1) == 0)
  {
    self->_isLocationEnabled = v4;
    locationHelpView = self->_locationHelpView;
    self->_locationHelpView = 0;

    [(PKBarcodePassDetailViewController *)self reloadData];
  }
  if ([(PKBarcodePassDetailViewController *)self shouldMapSection:5])
  {
    self->_didRampScreenBrightness = 1;
    v6 = +[PKBacklightController sharedInstance];
    [v6 beginRequestingBacklightRamping:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKBarcodePassDetailViewController;
  [(PKBarcodePassDetailViewController *)&v5 viewWillDisappear:a3];
  if (self->_didRampScreenBrightness)
  {
    int v4 = +[PKBacklightController sharedInstance];
    [v4 endRequestingBacklightRamping:self];

    self->_didRampScreenBrightness = 0;
  }
}

- (void)viewWillLayoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)PKBarcodePassDetailViewController;
  [(PKBarcodePassDetailViewController *)&v46 viewWillLayoutSubviews];
  char v3 = [(PKBarcodePassDetailViewController *)self tableView];
  int v4 = [(PKBarcodePassDetailViewController *)self navigationItem];
  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v3 safeAreaInsets];
  double v12 = v11;
  double v14 = v13;
  [v3 contentSize];
  double v16 = v15;
  if (self->_previousLayoutTableViewBoundsSize.width != v8)
  {
    self->_previousLayoutTableViewBoundsSize.width = v8;
    self->_previousLayoutTableViewBoundsSize.height = v10;
    [(PKBarcodePassDetailViewController *)self _updateHeaderHeight];
  }
  [(PKBarcodePassDetailViewController *)self _offscreenHeaderHeight];
  double v18 = v17;
  [v3 contentInset];
  double v20 = v19;
  double v21 = v10 - (v12 + v14);
  double v22 = v16 - v21;
  BOOL v23 = v16 > v21 && v22 < v18;
  double v24 = v20;
  if (v23) {
    double v24 = v18 - v22;
  }
  if (v20 != v24) {
    objc_msgSend(v3, "setContentInset:");
  }
  [v3 adjustedContentInset];
  double v26 = v25;
  double v27 = v18 + v25 - v12;
  v28 = [(UIRefreshControl *)self->_refreshControl superview];

  if (v6 >= -v26 || v28 == 0) {
    double v30 = 0.0;
  }
  else {
    double v30 = -v26 - v6;
  }
  double v31 = v27 + v30;
  memset(&slice, 0, sizeof(slice));
  [v3 _rectForTableHeaderView];
  double v35 = v26 + v30;
  double v36 = -v35;
  double headerHeight = self->_headerHeight;
  double v38 = v31 - v35;
  double v39 = v6 - v38 + v33;
  if (v6 <= v38) {
    double v39 = v33;
  }
  double v40 = v33 - (v36 - v6);
  if (v6 >= v36) {
    double v40 = v39;
  }
  self->_headerFrame.origin.x = v32;
  self->_headerFrame.origin.y = v40;
  self->_headerFrame.size.width = v34;
  self->_headerFrame.size.height = headerHeight;
  -[UIView setBounds:](self->_headerView, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(PKPassHeaderView *)self->_passHeaderView updateShadow:fmin(fmax((v6 - v38) / (v38 + -20.0 - v38), 0.0), 1.0)];
  [(PKPassHeaderView *)self->_passHeaderView setAlpha:fmin(fmax((v6 - (v38 + 20.0)) / (v38 - (v38 + 20.0)), 0.0), 1.0)];
  double v41 = fmin(fmax((v6 - ((v35 + v38) * 0.25 - v35)) / ((v35 + v38) * 0.25 - v35 + 20.0 - ((v35 + v38) * 0.25 - v35)), 0.0), 1.0);
  [(UIView *)self->_headerView bounds];
  CGRect v44 = v47;
  CGRectDivide(v47, &slice, &v44, self->_headerHeight, CGRectMinYEdge);
  -[PKPassHeaderView setFrame:](self->_passHeaderView, "setFrame:", slice.origin.x + self->_headerContentInset.left, slice.origin.y + self->_headerContentInset.top, slice.size.width - (self->_headerContentInset.left + self->_headerContentInset.right), slice.size.height - (self->_headerContentInset.top + self->_headerContentInset.bottom));
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
  if (self->_titleOpacity != v41)
  {
    self->_titleOpacity = v41;
    v42 = [v4 standardAppearance];
    v43 = (void *)[v42 copy];

    [(PKBarcodePassDetailViewController *)self _updateStandardAppearance:v43];
    [v4 setStandardAppearance:v43];
  }
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKBarcodePassDetailViewController;
  [(PKBarcodePassDetailViewController *)&v4 viewDidLayoutSubviews];
  char v3 = [(PKBarcodePassDetailViewController *)self tableView];
  [v3 layoutIfNeeded];
  [v3 _moveContentSubview:self->_headerView toBack:0];
  -[UIView setFrame:](self->_headerView, "setFrame:", self->_headerFrame.origin.x, self->_headerFrame.origin.y, self->_headerFrame.size.width, self->_headerFrame.size.height);
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      return [(PKBarcodePassDetailViewController *)self _linkedAppAvailable];
    case 1uLL:
      return [(PKBarcodePassDetailViewController *)self _settingsAvailable];
    case 2uLL:
      if (PKValueAddedServicesEnabledForPass()) {
        return 1;
      }
      if (!PKIsPairedWithWatch()
        || ![(PKPass *)self->_pass hasValidNFCPayload])
      {
        return 0;
      }
      pass = self->_pass;
      return [(PKPass *)pass isValid];
    case 3uLL:
      return (self->_suppressedContent & 1) == 0;
    case 4uLL:
      if ((self->_suppressedContent & 0x100) != 0) {
        return 0;
      }
      return [(PKBarcodePassDetailViewController *)self _personalizeAvailable];
    case 5uLL:
      if ((self->_suppressedContent & 0x80) != 0 || !PKValueAddedServicesEnabledForPass()) {
        return 0;
      }
      double v6 = [(PKPass *)self->_pass barcode];
      BOOL v5 = v6 != 0;

      return v5;
    case 6uLL:
      double v7 = [(PKBarcodePassDetailViewController *)self _relevantBuckets];
      BOOL v5 = [v7 count] != 0;

      return v5;
    default:
      return 0;
  }
}

- (void)reloadSection:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      automaticUpdatesCell = self->_automaticUpdatesCell;
      self->_automaticUpdatesCell = 0;

      showNotificationsCell = self->_showNotificationsCell;
      self->_showNotificationsCell = 0;

      showInLockScreenCell = self->_showInLockScreenCell;
      self->_showInLockScreenCell = 0;

      self->_showsLinks = (self->_suppressedContent & 0x10) == 0;
      break;
    case 6uLL:
      [(NSMutableDictionary *)self->_fieldCellsByRow removeAllObjects];
      break;
    case 5uLL:
      barcodeCell = self->_barcodeCell;
      self->_barcodeCell = 0;

      break;
  }
  v9.receiver = self;
  v9.super_class = (Class)PKBarcodePassDetailViewController;
  [(PKSectionTableViewController *)&v9 reloadSection:a3];
}

- (void)reloadSections:(id)a3
{
  id v4 = a3;
  if ([v4 containsObject:&unk_1EF2B8CA0])
  {
    barcodeCell = self->_barcodeCell;
    self->_barcodeCell = 0;
  }
  if ([v4 containsObject:&unk_1EF2B8CB8]) {
    [(NSMutableDictionary *)self->_fieldCellsByRow removeAllObjects];
  }
  if ([v4 containsObject:&unk_1EF2B8CD0])
  {
    automaticUpdatesCell = self->_automaticUpdatesCell;
    self->_automaticUpdatesCell = 0;

    showNotificationsCell = self->_showNotificationsCell;
    self->_showNotificationsCell = 0;

    showInLockScreenCell = self->_showInLockScreenCell;
    self->_showInLockScreenCell = 0;

    self->_showsLinks = (self->_suppressedContent & 0x10) == 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)PKBarcodePassDetailViewController;
  [(PKSectionTableViewController *)&v9 reloadSections:v4];
}

- (BOOL)reloadData
{
  automaticUpdatesCell = self->_automaticUpdatesCell;
  self->_automaticUpdatesCell = 0;

  showNotificationsCell = self->_showNotificationsCell;
  self->_showNotificationsCell = 0;

  showInLockScreenCell = self->_showInLockScreenCell;
  self->_showInLockScreenCell = 0;

  barcodeCell = self->_barcodeCell;
  self->_barcodeCell = 0;

  self->_showsLinks = (self->_suppressedContent & 0x10) == 0;
  [(NSMutableDictionary *)self->_fieldCellsByRow removeAllObjects];
  v8.receiver = self;
  v8.super_class = (Class)PKBarcodePassDetailViewController;
  return [(PKSectionTableViewController *)&v8 reloadData];
}

- (int64_t)rowAnimationForReloadingSection:(unint64_t)a3
{
  if (a3 == 1) {
    return 100;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)PKBarcodePassDetailViewController;
  return -[PKSectionTableViewController rowAnimationForReloadingSection:](&v6, sel_rowAnimationForReloadingSection_);
}

- (BOOL)_updateHeaderHeight
{
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  BOOL v5 = [(PKBarcodePassDetailViewController *)self tableView];
  [v5 separatorInset];
  double v7 = fmax(v6, 10.0);
  [v5 bounds];
  -[PKPassHeaderView sizeThatFits:](self->_passHeaderView, "sizeThatFits:", v8 - v7 - v7, 69.0);
  double v10 = fmax(v9, 0.0);
  double headerHeight = self->_headerHeight;
  double v12 = v4 + v10;
  self->_double headerHeight = v12;
  p_headerContentInset = &self->_headerContentInset;
  if (headerHeight != v12)
  {
    p_headerContentInset->top = v3;
    self->_headerContentInset.left = v7;
    p_right = &self->_headerContentInset.right;
LABEL_11:
    self->_headerContentInset.double bottom = v4;
    CGFloat *p_right = v7;
    goto LABEL_12;
  }
  p_right = &self->_headerContentInset.right;
  if (self->_headerContentInset.left != v7 || p_headerContentInset->top != v3 || self->_headerContentInset.right != v7)
  {
    p_headerContentInset->top = v3;
    self->_headerContentInset.left = v7;
    goto LABEL_11;
  }
  double bottom = self->_headerContentInset.bottom;
  p_headerContentInset->top = v3;
  self->_headerContentInset.left = v7;
  self->_headerContentInset.double bottom = v4;
  self->_headerContentInset.right = v7;
  if (bottom == v4)
  {
    BOOL v17 = 0;
    goto LABEL_13;
  }
LABEL_12:
  [(UIView *)self->_headerView bounds];
  -[UIView setBounds:](self->_headerView, "setBounds:");
  [v5 setTableHeaderView:0];
  [v5 setTableHeaderView:self->_headerView];
  BOOL v17 = 1;
LABEL_13:

  return v17;
}

- (double)_offscreenHeaderHeight
{
  return self->_headerHeight;
}

- (id)linkedApp
{
  linkedApp = self->_linkedApp;
  if (!linkedApp)
  {
    double v4 = [PKLinkedAppView alloc];
    BOOL v5 = [(PKPass *)self->_pass storeIdentifiers];
    double v6 = [(PKPass *)self->_pass systemAppBundleIdentifiers];
    double v7 = [(PKPass *)self->_pass appLaunchURL];
    double v8 = [(PKLinkedAppView *)v4 initWithStoreIDs:v5 systemAppBundleIdentifiers:v6 appLaunchURL:v7 reuseIdentifier:0];
    double v9 = self->_linkedApp;
    self->_linkedApp = v8;

    double v10 = [(PKLinkedAppView *)self->_linkedApp linkedAppView];
    [v10 setDelegate:self];

    double v11 = self->_linkedApp;
    double v12 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [(PKLinkedAppView *)v11 setBackgroundColor:v12];

    linkedApp = self->_linkedApp;
  }

  return linkedApp;
}

- (void)setShowsLinks:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_showsLinks = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = [(NSMutableDictionary *)self->_fieldCellsByRow allValues];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setShowLinks:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_wifiChanged:(id)a3
{
  double v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F4BDB8]];
  int v6 = [v5 BOOLValue];

  if (self->_isWifiEnabled != v6)
  {
    self->_isWifiEnabled = v6;
    locationHelpView = self->_locationHelpView;
    self->_locationHelpView = 0;

    [(PKBarcodePassDetailViewController *)self reloadData];
  }
}

- (BOOL)_isBluetoothEnabled
{
  if (![(BluetoothManager *)self->_btManager available]) {
    return self->_isBluetoothEnabled;
  }
  btManager = self->_btManager;

  return [(BluetoothManager *)btManager enabled];
}

- (void)_bluetoothPowerChanged:(id)a3
{
  int v4 = [(BluetoothManager *)self->_btManager available];
  if (v4) {
    int v4 = [(BluetoothManager *)self->_btManager enabled];
  }
  if (self->_isBluetoothEnabled != v4)
  {
    self->_isBluetoothEnabled = v4;
    locationHelpView = self->_locationHelpView;
    self->_locationHelpView = 0;

    [(PKBarcodePassDetailViewController *)self reloadData];
  }
}

- (id)_locationHelpTextWithLink:(id *)a3 linkRange:(_NSRange *)a4
{
  BOOL showsLinks = self->_showsLinks;
  uint64_t v8 = [(PKPass *)self->_pass embeddedBeacons];
  uint64_t v9 = [v8 count];

  int v10 = [MEMORY[0x1E4F1E600] isRangingAvailable];
  if (!showsLinks)
  {
    if (v9) {
      char v15 = v10;
    }
    else {
      char v15 = 1;
    }
    if ((v15 & 1) == 0)
    {
LABEL_35:
      double v16 = @"SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_BTLE";
      goto LABEL_36;
    }
LABEL_14:
    double v16 = @"SETTINGS_SHOW_ON_LOCKSCREEN_DESC";
LABEL_36:
    PKLocalizedString(&v16->isa);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    double v19 = 0;
    BOOL v23 = v21;
    goto LABEL_37;
  }
  if (self->_isLocationEnabled)
  {
    if (self->_isWifiEnabled)
    {
      if (v9)
      {
        if (self->_isBluetoothEnabled) {
          int v11 = 0;
        }
        else {
          int v11 = v10;
        }
        if (v11 == 1)
        {
          long long v12 = PKLocalizedString(&cfstr_SettingsShowOn_9.isa);
          double v13 = @"prefs:root=Bluetooth";
          uint64_t v14 = @"SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_BLUETOOTH_LINK";
          goto LABEL_28;
        }
        if (!v10) {
          goto LABEL_35;
        }
      }
      goto LABEL_14;
    }
    if (PKUseWLAN()) {
      BOOL v17 = @"SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_WLAN";
    }
    else {
      BOOL v17 = @"SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_WIFI";
    }
    long long v12 = PKLocalizedString(&v17->isa);
    if (PKUseWLAN()) {
      uint64_t v14 = @"SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_WLAN_LINK";
    }
    else {
      uint64_t v14 = @"SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_WIFI_LINK";
    }
    double v13 = @"prefs:root=WIFI";
  }
  else if (self->_isWifiEnabled)
  {
    long long v12 = PKLocalizedString(&cfstr_SettingsShowOn_3.isa);
    double v13 = @"prefs:root=Privacy&path=LOCATION";
    uint64_t v14 = @"SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_LOCATION_SERVICES_LINK";
  }
  else
  {
    if (PKUseWLAN()) {
      double v18 = @"SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_WLAN_RELEVANCY";
    }
    else {
      double v18 = @"SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_RELEVANCY";
    }
    long long v12 = PKLocalizedString(&v18->isa);
    double v13 = @"prefs:root=ROOT";
    uint64_t v14 = @"SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_RELEVANCY_LINK";
  }
LABEL_28:
  double v19 = PKLocalizedString(&v14->isa);
  id v20 = v12;
  id v21 = v20;
  if (v19)
  {
    double v22 = [v20 stringByAppendingString:@" "];
    BOOL v23 = [v22 stringByAppendingString:v19];

    if (a3) {
      *a3 = v13;
    }
    if (a4)
    {
      uint64_t v24 = [v23 length];
      NSUInteger v25 = v24 - [v19 length];
      NSUInteger v26 = [v19 length];
      a4->location = v25;
      a4->length = v26;
    }
  }
  else
  {
    BOOL v23 = v20;
  }
LABEL_37:

  return v23;
}

- (id)_locationHelpViewForTableView:(id)a3
{
  locationHelpView = self->_locationHelpView;
  if (!locationHelpView)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    id v14 = 0;
    uint64_t v5 = [(PKBarcodePassDetailViewController *)self _locationHelpTextWithLink:&v14 linkRange:&v15];
    id v6 = v14;
    uint64_t v7 = objc_alloc_init(PKFooterHyperlinkView);
    if (v6)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
      uint64_t v9 = PKAttributedStringByAddingLinkToRange(v5, v15, v16, v8);
      [(PKFooterHyperlinkView *)v7 setAttributedText:v9];

      int v10 = &__block_literal_global_47;
      id v11 = &__block_literal_global_47;
      [(PKFooterHyperlinkView *)v7 setAction:&__block_literal_global_47];
    }
    else
    {
      int v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
      [(PKFooterHyperlinkView *)v7 setAttributedText:v10];
    }

    long long v12 = self->_locationHelpView;
    self->_locationHelpView = &v7->super.super;

    locationHelpView = self->_locationHelpView;
  }

  return locationHelpView;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v6 = (void *)MEMORY[0x1E4F223E0];
  id v7 = a4;
  uint64_t v8 = [v6 defaultWorkspace];
  [v8 openSensitiveURL:v7 withOptions:0];

  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  switch([(PKSectionTableViewController *)self sectionForIndex:a4])
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      int64_t result = 1;
      break;
    case 1uLL:
      int64_t result = [(PKBarcodePassDetailViewController *)self _numberOfAvailableSettings];
      break;
    case 6uLL:
      id v6 = [(PKBarcodePassDetailViewController *)self _relevantBuckets];
      id v7 = [v6 firstObject];
      int64_t v8 = [v7 count];

      int64_t result = v8;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v5 section]))
  {
    case 0uLL:
      uint64_t v6 = [(PKBarcodePassDetailViewController *)self linkedApp];
      goto LABEL_10;
    case 1uLL:
      uint64_t v6 = -[PKBarcodePassDetailViewController _settingsCellForRow:](self, "_settingsCellForRow:", [v5 row]);
      goto LABEL_10;
    case 2uLL:
      uint64_t v6 = [(PKBarcodePassDetailViewController *)self _automaticSelectionCell];
      goto LABEL_10;
    case 3uLL:
      uint64_t v6 = [(PKBarcodePassDetailViewController *)self _deleteCell];
      goto LABEL_10;
    case 4uLL:
      uint64_t v6 = [(PKBarcodePassDetailViewController *)self _personalizePassCell];
      goto LABEL_10;
    case 5uLL:
      uint64_t v6 = [(PKBarcodePassDetailViewController *)self _barcodeCell];
      goto LABEL_10;
    case 6uLL:
      uint64_t v6 = -[PKBarcodePassDetailViewController _fieldCellForRow:](self, "_fieldCellForRow:", [v5 row]);
LABEL_10:
      id v7 = (void *)v6;
      break;
    default:
      id v7 = 0;
      break;
  }

  return v7;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  [v7 adjustedContentInset];
  double v9 = v8;
  double v11 = v10;
  [v7 contentSize];
  double v13 = v12;
  [v7 bounds];
  double v15 = v14;

  [(PKBarcodePassDetailViewController *)self _offscreenHeaderHeight];
  if (v11 + v9 + v13 >= v16 + v15)
  {
    double v17 = v16 - v9;
    double y = a5->y;
    if (y > -v9 && y < v17)
    {
      if ((v9 + y) / (v9 + v17) <= 0.5) {
        double v17 = -v9;
      }
      a5->double y = v17;
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKBarcodePassDetailViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]);
  if (v8 == 4)
  {
    double v11 = self->_pass;
    double v12 = [(PKPass *)v11 passTypeIdentifier];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __71__PKBarcodePassDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    double v17 = &unk_1E59CFC90;
    double v13 = v11;
    PKPassPersonalizationRequestToken();
  }
  else if (v8 == 3)
  {
    pass = self->_pass;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);
    +[PKPassDeleteHelper presentDeleteBarcodePassAlertForPass:pass withHandler:WeakRetained presentingViewController:self];
  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1, v14, v15, v16, v17);
}

void __71__PKBarcodePassDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKBarcodePassDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  id v8 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __71__PKBarcodePassDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v10 = [[PKPassPersonalizationViewController alloc] initWithPass:*(void *)(a1 + 40) personalizationToken:*(void *)(a1 + 32) personalizationSource:3];
    v2 = [*(id *)(a1 + 48) presentingViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PKPassPersonalizationViewController *)v10 setDelegate:v2];
      id v3 = [*(id *)(a1 + 48) navigationController];
      [v3 pushViewController:v10 animated:1];
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v5 = PKLocalizedString(&cfstr_Personalizatio_8.isa);
    id v6 = PKLocalizedString(&cfstr_Personalizatio_9.isa);
    uint64_t v10 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

    id v7 = (void *)MEMORY[0x1E4FB1410];
    id v8 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    id v9 = [v7 actionWithTitle:v8 style:1 handler:0];
    [(PKPassPersonalizationViewController *)v10 addAction:v9];

    [*(id *)(a1 + 48) presentViewController:v10 animated:1 completion:0];
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v5 == 4)
  {
    id v6 = [(PKPass *)self->_pass personalization];
    uint64_t v7 = [v6 localizedDescription];
    goto LABEL_5;
  }
  if (v5 == 2)
  {
    id v6 = [(PKPass *)self->_pass organizationName];
    uint64_t v7 = PKLocalizedString(&cfstr_SettingsAutoma.isa, &stru_1EF1B4C70.isa, v6);
LABEL_5:
    id v8 = (void *)v7;

    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 > 0
    || (-[PKBarcodePassDetailViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v6, a4), v7 = objc_claimAutoreleasedReturnValue(), uint64_t v8 = [v7 length], v7, v8))
  {
    [v6 sectionHeaderHeight];
    double v10 = v9;
  }
  else
  {
    double v10 = 36.0;
  }

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 > 0
    || (-[PKBarcodePassDetailViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v6, a4), v7 = objc_claimAutoreleasedReturnValue(), uint64_t v8 = [v7 length], v7, v8))
  {
    double v9 = 0;
  }
  else
  {
    double v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"FirstSectionHeaderReuseIdentifier"];
  }

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(PKSectionTableViewController *)self sectionForIndex:a4] == 1
    && [(PKPass *)self->_pass hasTimeOrLocationRelevancyInfo])
  {
    double v7 = *MEMORY[0x1E4FB2F28];
  }
  else
  {
    [v6 sectionFooterHeight];
    double v7 = v8;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(PKSectionTableViewController *)self sectionForIndex:a4] == 1
    && [(PKPass *)self->_pass hasTimeOrLocationRelevancyInfo])
  {
    double v7 = [(PKBarcodePassDetailViewController *)self _locationHelpViewForTableView:v6];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  unint64_t v7 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [a4 section]);
  if (v7 && v7 - 5 > 1)
  {
    [v6 rowHeight];
    double v8 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x1E4FB2F28];
  }

  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  unint64_t v7 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [a4 section]);
  if (v7 && v7 - 5 > 1)
  {
    [v6 rowHeight];
    double v8 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x1E4FB2F28];
  }

  return v8;
}

- (void)_reloadPassAndView
{
  id v3 = [(PKPassHeaderView *)self->_passHeaderView pass];
  pass = self->_pass;
  self->_pass = v3;

  [(PKBarcodePassDetailViewController *)self _updatePassProperties];
}

- (BOOL)handleDeletePassWithUniqueID:(id)a3
{
  pass = self->_pass;
  id v5 = a3;
  id v6 = [(PKPass *)pass uniqueID];
  int v7 = PKEqualObjects();

  if (v7)
  {
    double v8 = self->_pass;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);
    +[PKPassDeleteHelper presentDeleteBarcodePassAlertForPass:v8 withHandler:WeakRetained presentingViewController:self];
  }
  return v7;
}

- (void)setSuppressedContent:(unint64_t)a3
{
  if (self->_suppressedContent != a3)
  {
    self->_suppressedContent = a3;
    -[PKPassHeaderView setSuppressedContent:](self->_passHeaderView, "setSuppressedContent:");
    [(PKBarcodePassDetailViewController *)self _updateNavigationItem];
    [(PKBarcodePassDetailViewController *)self reloadData];
  }
}

- (void)_done:(id)a3
{
}

- (void)_sharePass
{
  [(PKBarcodePassDetailViewController *)self loadViewIfNeeded];
  id v3 = (void *)MEMORY[0x1E4F9F2E8];
  pass = self->_pass;
  id v5 = [(PKPassHeaderView *)self->_passHeaderView passView];
  id v6 = [(PKLinkedAppView *)self->_linkedApp linkedAppView];
  int v7 = [v6 linkedApplication];
  double v8 = objc_msgSend(v3, "pkui_activityControllerForPass:passView:passLinkedApplication:", pass, v5, v7);

  if (v8)
  {
    double v9 = self->_pass;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__PKBarcodePassDetailViewController__sharePass__block_invoke;
    v11[3] = &unk_1E59CBF28;
    double v12 = v9;
    double v10 = v9;
    [v8 setCompletionWithItemsHandler:v11];
    [(PKBarcodePassDetailViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

void __47__PKBarcodePassDetailViewController__sharePass__block_invoke(uint64_t a1, void *a2, int a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) noteShared];
    uint64_t v6 = *MEMORY[0x1E4F85C78];
    double v8 = @"activity";
    v9[0] = v5;
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    MEMORY[0x1A6220EC0](v6, v7);
  }
  else
  {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C80], 0);
  }
}

- (unint64_t)_numberOfAvailableSettings
{
  if ([(PKPass *)self->_pass isUpdatable])
  {
    if (([(PKPass *)self->_pass settings] & 2) != 0) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3 + [(PKPass *)self->_pass hasTimeOrLocationRelevancyInfo];
}

- (void)_updatePassProperties
{
  [(PKBarcodePassDetailViewController *)self reloadData];
  [(PKBarcodePassDetailViewController *)self _updateNavigationItem];
  [(PKBarcodePassDetailViewController *)self _updateHeaderHeight];
  id v3 = [(PKBarcodePassDetailViewController *)self viewIfLoaded];
  [v3 setNeedsLayout];
}

- (void)_updateNavigationItem
{
  id v8 = [(PKBarcodePassDetailViewController *)self navigationItem];
  if (self->_showDoneButton)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v4 = PKLocalizedString(&cfstr_Done.isa);
    id v5 = (void *)[v3 initWithTitle:v4 style:2 target:self action:sel__done_];
  }
  else
  {
    id v5 = 0;
  }
  if ((self->_suppressedContent & 2) != 0
    || ![(PKPass *)self->_pass supportsSharing]
    || [(PKPass *)self->_pass sharingMethod] == -1)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel__sharePass];
    [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F859E0]];
  }
  int v7 = [(PKPass *)self->_pass localizedDescription];
  [v8 setTitle:v7];

  [v8 setRightBarButtonItem:v6];
  [v8 setLeftBarButtonItem:v5];
}

- (void)_updateStandardAppearance:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4FB0700];
  id v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  uint64_t v6 = [v4 labelColor];
  int v7 = [v6 colorWithAlphaComponent:self->_titleOpacity];
  v10[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 setTitleTextAttributes:v8];
}

- (BOOL)_linkedAppAvailable
{
  id v3 = [(PKPass *)self->_pass storeIdentifiers];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(PKPass *)self->_pass systemAppBundleIdentifiers];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (BOOL)_settingsAvailable
{
  if ([(PKPass *)self->_pass isUpdatable]) {
    return 1;
  }
  pass = self->_pass;

  return [(PKPass *)pass hasTimeOrLocationRelevancyInfo];
}

- (BOOL)_personalizeAvailable
{
  return [(PKPass *)self->_pass isPersonalizable];
}

- (id)_automaticSelectionCell
{
  automaticSelectionCell = self->_automaticSelectionCell;
  if (!automaticSelectionCell)
  {
    BOOL v4 = [PKSettingTableCell alloc];
    id v5 = PKLocalizedString(&cfstr_SettingsAutoma_0.isa);
    uint64_t v6 = [(PKSettingTableCell *)v4 initWithTitle:v5 target:0 action:0];
    int v7 = self->_automaticSelectionCell;
    self->_automaticSelectionCell = v6;

    [(PKSettingTableCell *)self->_automaticSelectionCell setOn:((unint64_t)[(PKPass *)self->_pass settings] >> 4) & 1];
    [(PKSettingTableCell *)self->_automaticSelectionCell setTarget:self action:sel_pushSettingsFromViewToModel];
    automaticSelectionCell = self->_automaticSelectionCell;
  }
  [(PKSettingTableCell *)automaticSelectionCell setAccessibilityIdentifier:*MEMORY[0x1E4F85278]];
  id v8 = self->_automaticSelectionCell;

  return v8;
}

- (id)_deleteCell
{
  deleteCell = self->_deleteCell;
  if (!deleteCell)
  {
    BOOL v4 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_deleteCell;
    self->_deleteCell = v4;

    uint64_t v6 = [(UITableViewCell *)self->_deleteCell textLabel];
    int v7 = PKLocalizedString(&cfstr_RemovePass.isa);
    [v6 setText:v7];

    id v8 = [MEMORY[0x1E4FB1618] systemRedColor];
    [v6 setTextColor:v8];

    [v6 setTextAlignment:4];
    deleteCell = self->_deleteCell;
  }
  [(UITableViewCell *)deleteCell setAccessibilityIdentifier:*MEMORY[0x1E4F858F0]];
  uint64_t v9 = self->_deleteCell;

  return v9;
}

- (id)_barcodeCell
{
  barcodeCell = self->_barcodeCell;
  if (!barcodeCell)
  {
    BOOL v4 = [[PKBarcodeTableViewCell alloc] initWithStyle:[(PKPass *)self->_pass style] == 4 reuseIdentifier:@"PKBarcodeTableViewCellReuseIdentifier"];
    id v5 = self->_barcodeCell;
    self->_barcodeCell = v4;

    [(PKBarcodeTableViewCell *)self->_barcodeCell setPass:self->_pass];
    barcodeCell = self->_barcodeCell;
  }
  [(PKBarcodeTableViewCell *)barcodeCell setAccessibilityIdentifier:*MEMORY[0x1E4F852B8]];
  uint64_t v6 = self->_barcodeCell;

  return v6;
}

- (id)_personalizePassCell
{
  personalizePassCell = self->_personalizePassCell;
  if (!personalizePassCell)
  {
    BOOL v4 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_personalizePassCell;
    self->_personalizePassCell = v4;

    uint64_t v6 = [(UITableViewCell *)self->_personalizePassCell textLabel];
    int v7 = PKLocalizedString(&cfstr_Personalizatio_10.isa);
    [v6 setText:v7];

    id v8 = [(UITableViewCell *)self->_personalizePassCell textLabel];
    uint64_t v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v8 setTextColor:v9];

    double v10 = [(UITableViewCell *)self->_personalizePassCell textLabel];
    [v10 setTextAlignment:4];

    personalizePassCell = self->_personalizePassCell;
  }
  [(UITableViewCell *)personalizePassCell setAccessibilityIdentifier:*MEMORY[0x1E4F851E0]];
  double v11 = self->_personalizePassCell;

  return v11;
}

- (unint64_t)_settingForRow:(unint64_t)a3
{
  if ([(PKPass *)self->_pass isUpdatable])
  {
    char v5 = [(PKPass *)self->_pass settings];
    uint64_t v6 = 0;
    if ((v5 & 2) != 0) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if ((v5 & 2) != 0) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int v9 = [(PKPass *)self->_pass hasTimeOrLocationRelevancyInfo];
  if (v9) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v8 + (unint64_t)v9 <= a3) {
    return 0;
  }
  if (v6 == a3) {
    return 2;
  }
  if (v7 == a3) {
    return 128;
  }
  return v10 == a3;
}

- (id)_settingsCellForRow:(unint64_t)a3
{
  unint64_t v4 = [(PKBarcodePassDetailViewController *)self _settingForRow:a3];
  unint64_t v5 = [(PKPass *)self->_pass settings];
  if (v4 == 1)
  {
    p_showInLockScreenCell = (id *)&self->_showInLockScreenCell;
    showInLockScreenCell = self->_showInLockScreenCell;
    if (!showInLockScreenCell)
    {
      uint64_t v14 = [PKSettingTableCell alloc];
      uint64_t v15 = PKLocalizedString(&cfstr_SettingsShowOn.isa);
      uint64_t v16 = [(PKSettingTableCell *)v14 initWithTitle:v15 target:0 action:0];
      id v17 = *p_showInLockScreenCell;
      id *p_showInLockScreenCell = (id)v16;

      [*p_showInLockScreenCell setAccessibilityIdentifier:*MEMORY[0x1E4F85A68]];
      id v12 = *p_showInLockScreenCell;
      uint64_t v13 = v5 & 1;
      goto LABEL_12;
    }
LABEL_9:
    double v18 = showInLockScreenCell;
    goto LABEL_13;
  }
  if (v4 == 128)
  {
    p_showInLockScreenCell = (id *)&self->_showNotificationsCell;
    showInLockScreenCell = self->_showNotificationsCell;
    if (!showInLockScreenCell)
    {
      double v19 = [PKSettingTableCell alloc];
      id v20 = PKLocalizedString(&cfstr_SettingsShowNo.isa);
      uint64_t v21 = [(PKSettingTableCell *)v19 initWithTitle:v20 target:0 action:0];
      id v22 = *p_showInLockScreenCell;
      id *p_showInLockScreenCell = (id)v21;

      [*p_showInLockScreenCell setAccessibilityIdentifier:*MEMORY[0x1E4F85218]];
      id v12 = *p_showInLockScreenCell;
      uint64_t v13 = (v5 & 0x80) == 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (v4 != 2)
  {
    double v18 = 0;
    goto LABEL_13;
  }
  p_showInLockScreenCell = (id *)&self->_automaticUpdatesCell;
  showInLockScreenCell = self->_automaticUpdatesCell;
  if (showInLockScreenCell) {
    goto LABEL_9;
  }
  uint64_t v8 = [PKSettingTableCell alloc];
  unsigned int v9 = PKLocalizedString(&cfstr_SettingsNotify.isa);
  uint64_t v10 = [(PKSettingTableCell *)v8 initWithTitle:v9 target:0 action:0];
  id v11 = *p_showInLockScreenCell;
  id *p_showInLockScreenCell = (id)v10;

  [*p_showInLockScreenCell setAccessibilityIdentifier:*MEMORY[0x1E4F85280]];
  id v12 = *p_showInLockScreenCell;
  uint64_t v13 = (v5 >> 1) & 1;
LABEL_12:
  [v12 setOn:v13];
  double v18 = (PKSettingTableCell *)*p_showInLockScreenCell;
  [(PKSettingTableCell *)v18 setTarget:self action:sel_pushSettingsFromViewToModel];
LABEL_13:

  return v18;
}

- (id)_fieldCellForRow:(unint64_t)a3
{
  fieldCellsByRow = self->_fieldCellsByRow;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v7 = [(NSMutableDictionary *)fieldCellsByRow objectForKey:v6];

  if (!v7)
  {
    uint64_t v7 = [[PKBackFieldTableCell alloc] initWithBridgeStyle:0 reuseIdentifier:@"PKBackFieldTableCell"];
    [(PKBackFieldTableCell *)v7 setShowLinks:self->_showsLinks];
    uint64_t v8 = [(PKBarcodePassDetailViewController *)self _fieldForRow:a3];
    [(PKBackFieldTableCell *)v7 setField:v8];

    unsigned int v9 = self->_fieldCellsByRow;
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v9 setObject:v7 forKey:v10];
  }

  return v7;
}

- (id)_fieldForRow:(unint64_t)a3
{
  unint64_t v4 = [(PKBarcodePassDetailViewController *)self _relevantBuckets];
  unint64_t v5 = [v4 firstObject];

  if ([v5 count] <= a3)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [v5 objectAtIndex:a3];
  }

  return v6;
}

- (void)refreshControlValueChanged:(id)a3
{
  id v4 = a3;
  if ([v4 isRefreshing])
  {
    objc_initWeak(&location, self);
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    char v16 = 0;
    unint64_t v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    refreshTimeout = self->_refreshTimeout;
    self->_refreshTimeout = v5;

    uint64_t v7 = self->_refreshTimeout;
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    unsigned int v9 = self->_refreshTimeout;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __64__PKBarcodePassDetailViewController_refreshControlValueChanged___block_invoke;
    handler[3] = &unk_1E59CFCB8;
    handler[4] = v15;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v9, handler);
    pass = self->_pass;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__PKBarcodePassDetailViewController_refreshControlValueChanged___block_invoke_2;
    v11[3] = &unk_1E59CFD08;
    void v11[4] = v15;
    objc_copyWeak(&v12, &location);
    [(PKPass *)pass requestUpdateWithCompletion:v11];
    dispatch_resume((dispatch_object_t)self->_refreshTimeout);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    _Block_object_dispose(v15, 8);
    objc_destroyWeak(&location);
  }
}

void __64__PKBarcodePassDetailViewController_refreshControlValueChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _refreshFinished:1];
  }
}

void __64__PKBarcodePassDetailViewController_refreshControlValueChanged___block_invoke_2(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKBarcodePassDetailViewController_refreshControlValueChanged___block_invoke_3;
  block[3] = &unk_1E59CFCE0;
  void block[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v4, (id *)(a1 + 40));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __64__PKBarcodePassDetailViewController_refreshControlValueChanged___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (!WeakRetained) {
      goto LABEL_6;
    }
    id v4 = WeakRetained;
    [WeakRetained[165] updateModifiedDate];
  }
  else
  {
    *(unsigned char *)(v2 + 24) = 1;
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    [v4 _refreshFinished:*(unsigned char *)(a1 + 48) == 0];
  }
  id WeakRetained = (id *)v4;
LABEL_6:
}

- (void)_refreshFinished:(BOOL)a3
{
  refreshTimeout = self->_refreshTimeout;
  if (refreshTimeout)
  {
    dispatch_source_cancel(refreshTimeout);
    char v5 = self->_refreshTimeout;
    self->_refreshTimeout = 0;
  }
  [(UIRefreshControl *)self->_refreshControl endRefreshing];
  passHeaderView = self->_passHeaderView;

  [(PKPassHeaderView *)passHeaderView updateModifiedDate];
}

- (BOOL)shouldAllowRefresh
{
  id v3 = [(PKPass *)self->_pass webServiceURL];
  if (v3)
  {
    id v4 = [(PKPass *)self->_pass dataAccessor];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)_relevantBuckets
{
  return (id)[(PKPass *)self->_pass backFieldBuckets];
}

- (void)pushSettingsFromViewToModel
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKPass *)self->_pass settings];
  automaticUpdatesCell = self->_automaticUpdatesCell;
  if (automaticUpdatesCell)
  {
    if ([(PKSettingTableCell *)automaticUpdatesCell isOn]) {
      unint64_t v5 = v3 | 2;
    }
    else {
      unint64_t v5 = v3 & 0xFFFFFFFFFFFFFFFDLL;
    }
  }
  else
  {
    unint64_t v5 = v3;
  }
  showNotificationsCell = self->_showNotificationsCell;
  if (showNotificationsCell)
  {
    if ([(PKSettingTableCell *)showNotificationsCell isOn]) {
      v5 &= ~0x80uLL;
    }
    else {
      v5 |= 0x80uLL;
    }
  }
  showInLockScreenCell = self->_showInLockScreenCell;
  if (showInLockScreenCell)
  {
    if ([(PKSettingTableCell *)showInLockScreenCell isOn]) {
      v5 |= 1uLL;
    }
    else {
      v5 &= ~1uLL;
    }
  }
  automaticSelectionCell = self->_automaticSelectionCell;
  if (automaticSelectionCell)
  {
    if ([(PKSettingTableCell *)automaticSelectionCell isOn]) {
      v5 |= 0x10uLL;
    }
    else {
      v5 &= ~0x10uLL;
    }
  }
  int v9 = v5 ^ v3;
  if (((v5 ^ v3) & 2) != 0)
  {
    uint64_t v10 = *MEMORY[0x1E4F85C90];
    double v18 = @"on";
    id v11 = [NSNumber numberWithBool:(v5 >> 1) & 1];
    v19[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    MEMORY[0x1A6220EC0](v10, v12);
  }
  if (v9)
  {
    uint64_t v13 = *MEMORY[0x1E4F85C88];
    char v16 = @"on";
    id v14 = [NSNumber numberWithBool:v5 & 1];
    id v17 = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    MEMORY[0x1A6220EC0](v13, v15);
  }
  [(PKPass *)self->_pass setSettings:(2 * v9) & 0x20 | v5];
  if ((v9 & 2) != 0) {
    [(PKBarcodePassDetailViewController *)self reloadSection:1];
  }
}

- (void)_passSettingsChanged:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F875C0]];
  uint64_t v7 = [(PKPass *)self->_pass uniqueID];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    int v9 = [v4 userInfo];
    uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F875B8]];

    if (v10)
    {
      uint64_t v11 = [v10 unsignedIntegerValue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __58__PKBarcodePassDetailViewController__passSettingsChanged___block_invoke;
      v12[3] = &unk_1E59CB460;
      v12[4] = self;
      v12[5] = v11;
      dispatch_async(MEMORY[0x1E4F14428], v12);
    }
  }
}

uint64_t __58__PKBarcodePassDetailViewController__passSettingsChanged___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1336) setSettingsWithoutUpdatingDataAccessor:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1128);
  if (v2)
  {
    int v3 = [v2 isOn];
    uint64_t v4 = *(void *)(a1 + 40) & 2;
    int v5 = v3 ^ (*(void *)(a1 + 40) >> 1) & 1;
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1128);
  }
  else
  {
    int v5 = 0;
    uint64_t v4 = *(void *)(a1 + 40) & 2;
  }
  [v2 setOn:v4 != 0 notify:0];
  [*(id *)(*(void *)(a1 + 32) + 1136) setOn:(*(void *)(a1 + 40) & 0x80) == 0 notify:0];
  [*(id *)(*(void *)(a1 + 32) + 1144) setOn:*(_DWORD *)(a1 + 40) & 1 notify:0];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1152) setOn:(*(void *)(a1 + 40) >> 4) & 1 notify:0];
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 reloadSection:1];
  }
  return result;
}

- (void)appViewContentSizeChanged:(id)a3
{
  uint64_t v4 = [(PKBarcodePassDetailViewController *)self tableView];
  [v4 beginUpdates];

  id v5 = [(PKBarcodePassDetailViewController *)self tableView];
  [v5 endUpdates];
}

- (PKPass)pass
{
  return self->_pass;
}

- (unint64_t)suppressedContent
{
  return self->_suppressedContent;
}

- (PKPassDeleteHandler)deleteOverrider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);

  return (PKPassDeleteHandler *)WeakRetained;
}

- (void)setDeleteOverrider:(id)a3
{
}

- (BOOL)showDoneButton
{
  return self->_showDoneButton;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deleteOverrider);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_passHeaderView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_btManager, 0);
  objc_storeStrong((id *)&self->_refreshTimeout, 0);
  objc_storeStrong((id *)&self->_fieldCellsByRow, 0);
  objc_storeStrong((id *)&self->_barcodeCell, 0);
  objc_storeStrong((id *)&self->_deleteCell, 0);
  objc_storeStrong((id *)&self->_personalizePassCell, 0);
  objc_storeStrong((id *)&self->_automaticSelectionCell, 0);
  objc_storeStrong((id *)&self->_showInLockScreenCell, 0);
  objc_storeStrong((id *)&self->_showNotificationsCell, 0);
  objc_storeStrong((id *)&self->_automaticUpdatesCell, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_locationHelpView, 0);
  objc_storeStrong((id *)&self->_linkedApp, 0);
  objc_storeStrong((id *)&self->_colorProfile, 0);

  objc_storeStrong((id *)&self->_displayProfile, 0);
}

@end
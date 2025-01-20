@interface PKExpiredPassesViewController
+ (id)detailTextStringForPass:(id)a3;
- (BOOL)passExistsWithUniqueIdentifier:(id)a3;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (PKExpiredPassesViewController)initWithExistingGroupsController:(id)a3 delegate:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)_buildDetailText:(id)a3 pass:(id)a4;
- (id)_hyperlinkFooterView;
- (id)_selectedExpiredPassesString;
- (id)indexPathOfExpiredPassWithUniqueID:(id)a3;
- (id)pass;
- (id)passAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)viewControllerForRowAtIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_applyDeletionOrRecovery;
- (void)_cancel;
- (void)_deletePassPressed;
- (void)_done;
- (void)_edit;
- (void)_finishedEditingExpiredPassAtIndexPath:(id)a3;
- (void)_presentConfirmationAlertWithTitle:(id)a3 confirmationMessage:(id)a4;
- (void)_processGeocodeRequestsIfNecessary;
- (void)_recoverPassPressed;
- (void)_select;
- (void)_updateSelectedPassesText;
- (void)_updateTitles;
- (void)configureCell:(id)a3 atIndexPath:(id)a4 withPass:(id)a5;
- (void)deletePass:(id)a3 atIndexPath:(id)a4;
- (void)prefetchItemsAtIndexPaths:(id)a3;
- (void)recoverPass:(id)a3 atIndexPath:(id)a4;
- (void)removeExpiredSectionPassWithUniqueID:(id)a3 isDeletion:(BOOL)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableViewDidUpdateSelection:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKExpiredPassesViewController

- (PKExpiredPassesViewController)initWithExistingGroupsController:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)PKExpiredPassesViewController;
  v8 = -[PKExpiredTableViewController initWithStyle:](&v54, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1));
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = (CLGeocoder *)objc_alloc_init(MEMORY[0x1E4F1E5C8]);
    geocoder = v9->_geocoder;
    v9->_geocoder = v10;

    v9->_itemsLock._os_unfair_lock_opaque = 0;
    [(PKExpiredTableViewController *)v9 setExistingGroupsController:v6];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F84740]) initWithPassTypeMask:0 passFilters:0 allowedPassUniqueIDs:0];
    groupsController = v9->_groupsController;
    v9->_groupsController = (PKGroupsController *)v12;

    [(PKGroupsController *)v9->_groupsController loadGroupsSynchronously];
    v14 = [(PKGroupsController *)v9->_groupsController expiredSectionPasses];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __75__PKExpiredPassesViewController_initWithExistingGroupsController_delegate___block_invoke;
    v52[3] = &unk_1E59D2830;
    v15 = v9;
    v53 = v15;
    uint64_t v16 = [v14 sortedArrayUsingComparator:v52];
    expiredSectionPasses = v15->_expiredSectionPasses;
    v15->_expiredSectionPasses = (NSArray *)v16;

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v15->_expiredSectionPasses, "count"));
    geocodeRequests = v15->_geocodeRequests;
    v15->_geocodeRequests = (NSMutableArray *)v18;

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](v15->_expiredSectionPasses, "count"));
    locationStringsForPassUniqueIDs = v15->_locationStringsForPassUniqueIDs;
    v15->_locationStringsForPassUniqueIDs = (NSMutableDictionary *)v20;

    viewingPass = v15->_viewingPass;
    v15->_viewingPass = 0;

    uint64_t v23 = [(PKExpiredPassesViewController *)v15 _hyperlinkFooterView];
    footerView = v15->_footerView;
    v15->_footerView = (UIView *)v23;

    v25 = [(PKExpiredPassesViewController *)v15 navigationItem];
    [v25 setLeftItemsSupplementBackButton:0];
    v26 = PKLocalizedString(&cfstr_ExpiredPassesT.isa);
    [v25 setBackButtonTitle:v26];

    id v27 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v28 = PKLocalizedString(&cfstr_ExpiredPassesD_1.isa);
    uint64_t v29 = [v27 initWithTitle:v28 style:2 target:v15 action:sel__done];
    doneButton = v15->_doneButton;
    v15->_doneButton = (UIBarButtonItem *)v29;

    [(UIBarButtonItem *)v15->_doneButton setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
    id v31 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v32 = PKLocalizedString(&cfstr_ExpiredPassesE.isa);
    uint64_t v33 = [v31 initWithTitle:v32 style:0 target:v15 action:sel__edit];
    editButton = v15->_editButton;
    v15->_editButton = (UIBarButtonItem *)v33;

    [(UIBarButtonItem *)v15->_editButton setAccessibilityIdentifier:*MEMORY[0x1E4F854C0]];
    uint64_t v35 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:0 style:0 target:v15 action:sel__select];
    selectButton = v15->_selectButton;
    v15->_selectButton = (UIBarButtonItem *)v35;

    [(UIBarButtonItem *)v15->_selectButton setAccessibilityIdentifier:*MEMORY[0x1E4F85990]];
    id v37 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v38 = PKLocalizedString(&cfstr_ExpiredPassesC.isa);
    uint64_t v39 = [v37 initWithTitle:v38 style:0 target:v15 action:sel__cancel];
    cancelButton = v15->_cancelButton;
    v15->_cancelButton = (UIBarButtonItem *)v39;

    [(UIBarButtonItem *)v15->_cancelButton setAccessibilityIdentifier:*MEMORY[0x1E4F85340]];
    id v41 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v42 = PKLocalizedString(&cfstr_ExpiredPassesD.isa);
    uint64_t v43 = [v41 initWithTitle:v42 style:0 target:v15 action:sel__deletePassPressed];
    deleteButton = v15->_deleteButton;
    v15->_deleteButton = (UIBarButtonItem *)v43;

    v45 = v15->_deleteButton;
    v46 = [MEMORY[0x1E4FB1618] systemRedColor];
    [(UIBarButtonItem *)v45 setTintColor:v46];

    [(UIBarButtonItem *)v15->_deleteButton setAccessibilityIdentifier:*MEMORY[0x1E4F858F0]];
    id v47 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v48 = PKLocalizedString(&cfstr_ExpiredPassesU.isa);
    uint64_t v49 = [v47 initWithTitle:v48 style:0 target:v15 action:sel__recoverPassPressed];
    unhideButton = v15->_unhideButton;
    v15->_unhideButton = (UIBarButtonItem *)v49;

    [(UIBarButtonItem *)v15->_unhideButton setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
    [(PKExpiredPassesViewController *)v15 _updateTitles];
  }
  return v9;
}

BOOL __75__PKExpiredPassesViewController_initWithExistingGroupsController_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 1056) passAnnotationsByUniqueId];
  v8 = [v5 uniqueID];
  v9 = [v7 objectForKey:v8];

  v10 = [*(id *)(*(void *)(a1 + 32) + 1056) passAnnotationsByUniqueId];
  v11 = [v6 uniqueID];
  uint64_t v12 = [v10 objectForKey:v11];

  v13 = [v9 archivedTimestamp];
  v14 = [v12 archivedTimestamp];
  uint64_t v15 = [v13 compare:v14];

  if (!v15)
  {
    uint64_t v16 = [v5 localizedDescription];
    v17 = [v6 localizedDescription];
    uint64_t v15 = [v16 compare:v17];
  }
  return v15 == -1;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKExpiredPassesViewController;
  [(PKExpiredTableViewController *)&v6 viewDidLoad];
  [(PKExpiredPassesViewController *)self setEditing:0 animated:0];
  v3 = [(PKExpiredPassesViewController *)self tableView];
  tableView = self->_tableView;
  self->_tableView = v3;

  [(PKExpiredTableViewController *)self setCachingDelegate:self];
  [(UITableView *)self->_tableView reloadData];
  id v5 = [(PKExpiredPassesViewController *)self view];
  [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85528]];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKExpiredPassesViewController;
  [(PKExpiredPassesViewController *)&v5 viewWillAppear:a3];
  viewingPass = self->_viewingPass;
  self->_viewingPass = 0;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v18[5] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PKExpiredPassesViewController;
  [(PKExpiredPassesViewController *)&v17 setEditing:a3 animated:a4];
  [(PKExpiredPassesViewController *)self _updateTitles];
  objc_super v6 = [(PKExpiredPassesViewController *)self navigationController];
  id v7 = v6;
  if (v4)
  {
    [v6 setToolbarHidden:0 animated:1];

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    self->_selectedPassesCount = 0;
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    selectedPassesLabel = self->_selectedPassesLabel;
    self->_selectedPassesLabel = v9;

    v11 = self->_selectedPassesLabel;
    uint64_t v12 = [(PKExpiredPassesViewController *)self _selectedExpiredPassesString];
    [(UILabel *)v11 setText:v12];

    v13 = self->_selectedPassesLabel;
    v14 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v13 setTintColor:v14];

    [(UILabel *)self->_selectedPassesLabel setNumberOfLines:1];
    [(UILabel *)self->_selectedPassesLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_selectedPassesLabel setLineBreakMode:4];
    [(UILabel *)self->_selectedPassesLabel setTextAlignment:1];
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_selectedPassesLabel];
    [v15 setTarget:self];
    [v15 setAccessibilityIdentifier:*MEMORY[0x1E4F85998]];
    v18[0] = self->_deleteButton;
    v18[1] = v7;
    v18[2] = v15;
    v18[3] = v8;
    v18[4] = self->_unhideButton;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
    [(PKExpiredPassesViewController *)self setToolbarItems:v16];
  }
  else
  {
    [v6 setToolbarHidden:1 animated:1];
  }
}

- (id)indexPathOfExpiredPassWithUniqueID:(id)a3
{
  id v4 = a3;
  expiredSectionPasses = self->_expiredSectionPasses;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PKExpiredPassesViewController_indexPathOfExpiredPassWithUniqueID___block_invoke;
  v10[3] = &unk_1E59D2858;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [(NSArray *)expiredSectionPasses indexOfObjectPassingTest:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v8 = [MEMORY[0x1E4F28D58] indexPathForRow:v7 inSection:0];
  }

  return v8;
}

uint64_t __68__PKExpiredPassesViewController_indexPathOfExpiredPassWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueID];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_expiredSectionPasses count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PKExpiredTableViewController *)self tableView:a3 cellWithReuseIdentifier:@"cellPassExpiredIdentifier"];
  uint64_t v8 = -[NSArray objectAtIndex:](self->_expiredSectionPasses, "objectAtIndex:", [v6 row]);
  [(PKExpiredPassesViewController *)self configureCell:v7 atIndexPath:v6 withPass:v8];

  return v7;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withPass:(id)a5
{
  id v19 = a3;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v19 setPass:v7];
    uint64_t v8 = [v7 localizedDescription];
    [v19 setPrimaryText:v8];

    v9 = PKDateStringForExpiredPass();
    [v19 setSecondaryDetailText:v9];
    v10 = [v7 uniqueID];
    id v11 = [(NSMutableDictionary *)self->_locationStringsForPassUniqueIDs objectForKeyedSubscript:v10];
    if (v11)
    {
      uint64_t v12 = 0;
    }
    else
    {
      v13 = [v7 embeddedLocationsArray];
      uint64_t v12 = [v13 firstObject];
    }
    v14 = [(PKExpiredPassesViewController *)self _buildDetailText:v11 pass:v7];
    [v19 setDetailText:v14];

    if (v12)
    {
      [v12 coordinate];
      objc_super v17 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v15 longitude:v16];
      uint64_t v18 = [[PKExpiredPassesGeocodeRequestItem alloc] initWithCell:v19 location:v17];
      os_unfair_lock_lock(&self->_itemsLock);
      [(NSMutableArray *)self->_geocodeRequests addObject:v18];
      os_unfair_lock_unlock(&self->_itemsLock);
      [(PKExpiredPassesViewController *)self _processGeocodeRequestsIfNecessary];
    }
  }
}

- (id)_buildDetailText:(id)a3 pass:(id)a4
{
  id v5 = a3;
  id v6 = +[PKExpiredPassesViewController detailTextStringForPass:a4];
  id v7 = v6;
  if (v5) {
    id v8 = (id)[[NSString alloc] initWithFormat:@"%@, %@", v6, v5];
  }
  else {
    id v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (void)_processGeocodeRequestsIfNecessary
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  uint64_t v4 = [(NSMutableArray *)self->_geocodeRequests count];
  os_unfair_lock_unlock(p_itemsLock);
  if (v4)
  {
    if ([(CLGeocoder *)self->_geocoder isGeocoding])
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Reverse geocode in progress - skipping", buf, 2u);
      }
    }
    else
    {
      os_unfair_lock_lock(p_itemsLock);
      *(void *)buf = 0;
      v14 = buf;
      uint64_t v15 = 0x3032000000;
      double v16 = __Block_byref_object_copy__18;
      objc_super v17 = __Block_byref_object_dispose__18;
      id v18 = [(NSMutableArray *)self->_geocodeRequests firstObject];
      v11[0] = 0;
      v11[1] = v11;
      v11[2] = 0x3032000000;
      v11[3] = __Block_byref_object_copy__18;
      v11[4] = __Block_byref_object_dispose__18;
      id v12 = [*((id *)v14 + 5) uniqueID];
      id v6 = [*((id *)v14 + 5) location];
      os_unfair_lock_unlock(p_itemsLock);
      objc_initWeak(&location, self);
      geocoder = self->_geocoder;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __67__PKExpiredPassesViewController__processGeocodeRequestsIfNecessary__block_invoke;
      v8[3] = &unk_1E59D28D0;
      objc_copyWeak(&v9, &location);
      v8[4] = self;
      v8[5] = v11;
      v8[6] = buf;
      [(CLGeocoder *)geocoder reverseGeocodeLocation:v6 completionHandler:v8];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);

      _Block_object_dispose(v11, 8);
      _Block_object_dispose(buf, 8);
    }
  }
}

void __67__PKExpiredPassesViewController__processGeocodeRequestsIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKExpiredPassesViewController__processGeocodeRequestsIfNecessary__block_invoke_2;
    aBlock[3] = &unk_1E59D28A8;
    uint64_t v8 = *(void *)(a1 + 40);
    aBlock[4] = *(void *)(a1 + 32);
    aBlock[5] = WeakRetained;
    aBlock[6] = v8;
    id v9 = (void (**)(void))_Block_copy(aBlock);
    v10 = v9;
    if (a3)
    {
      v9[2](v9);
LABEL_22:

      goto LABEL_23;
    }
    id v11 = [v5 firstObject];
    if (!v11)
    {
      v10[2](v10);
LABEL_21:

      goto LABEL_22;
    }
    id v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) cell];
    v13 = [v11 locality];
    v14 = [v11 administrativeArea];
    if (![v13 length] || !objc_msgSend(v14, "length"))
    {
LABEL_20:
      v10[2](v10);

      goto LABEL_21;
    }
    v24 = (void *)[[NSString alloc] initWithFormat:@"%@, %@", v13, v14];
    objc_msgSend(v7[134], "setObject:forKeyedSubscript:");
    uint64_t v23 = v12;
    uint64_t v15 = [v12 pass];
    double v16 = [v15 uniqueID];
    objc_super v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v18 = v16;
    id v19 = v17;
    if (v18 == v19)
    {

      id v12 = v23;
    }
    else
    {
      uint64_t v20 = v19;
      if (v18) {
        BOOL v21 = v19 == 0;
      }
      else {
        BOOL v21 = 1;
      }
      if (v21)
      {

        id v12 = v23;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      char v22 = [v18 isEqualToString:v19];

      id v12 = v23;
      if ((v22 & 1) == 0) {
        goto LABEL_19;
      }
    }
    uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) pass];
    id v18 = [v7 _buildDetailText:v24 pass:v15];
    [v12 setDetailText:v18];
    goto LABEL_18;
  }
LABEL_23:
}

uint64_t __67__PKExpiredPassesViewController__processGeocodeRequestsIfNecessary__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 1104));
  v2 = *(void **)(*(void *)(a1 + 40) + 1096);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__PKExpiredPassesViewController__processGeocodeRequestsIfNecessary__block_invoke_3;
  v4[3] = &unk_1E59D2880;
  v4[4] = *(void *)(a1 + 48);
  objc_msgSend(v2, "pk_removeObjectsPassingTest:", v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 1104));
  return [*(id *)(a1 + 40) _processGeocodeRequestsIfNecessary];
}

BOOL __67__PKExpiredPassesViewController__processGeocodeRequestsIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueID];
  BOOL v4 = v3 == *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return v4;
}

+ (id)detailTextStringForPass:(id)a3
{
  id v3 = a3;
  switch([v3 style])
  {
    case 0:
      BOOL v4 = @"EXPIRED_PASSES_PASS_STYLE_COUPON";
      goto LABEL_6;
    case 2:
    case 9:
      BOOL v4 = @"EXPIRED_PASSES_PASS_STYLE_EVENT_TICKET";
      goto LABEL_6;
    case 4:
      BOOL v4 = @"EXPIRED_PASSES_PASS_STYLE_BOARDING_PASS";
      goto LABEL_6;
    case 7:
      id v7 = [v3 secureElementPass];
      [v7 accessType];
      id v5 = PKSecureElementAccessPassTypeToAccessKeyString();

      goto LABEL_7;
    default:
      BOOL v4 = @"EXPIRED_PASSES_PASS_STYLE_PASS";
LABEL_6:
      id v5 = PKLocalizedString(&v4->isa);
LABEL_7:

      return v5;
  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKExpiredPassesViewController;
  id v5 = [(PKExpiredTableViewController *)&v7 tableView:a3 willSelectRowAtIndexPath:a4];
  if (v5 && [(UITableView *)self->_tableView isEditing])
  {
    ++self->_selectedPassesCount;
    [(PKExpiredPassesViewController *)self _updateSelectedPassesText];
  }

  return v5;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKExpiredPassesViewController;
  id v5 = [(PKExpiredTableViewController *)&v7 tableView:a3 willDeselectRowAtIndexPath:a4];
  if (v5 && [(UITableView *)self->_tableView isEditing])
  {
    --self->_selectedPassesCount;
    [(PKExpiredPassesViewController *)self _updateSelectedPassesText];
  }

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (![(UITableView *)self->_tableView isEditing])
  {
    [v11 deselectRowAtIndexPath:v6 animated:1];
    if (!self->_viewingPass)
    {
      objc_super v7 = [(PKExpiredPassesViewController *)self viewControllerForRowAtIndexPath:v6];
      uint64_t v8 = [v7 pass];
      viewingPass = self->_viewingPass;
      self->_viewingPass = v8;

      v10 = [(PKExpiredPassesViewController *)self navigationController];
      [v10 pushViewController:v7 animated:1];
    }
  }
}

- (void)recoverPass:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v9 = [a3 uniqueID];
  objc_super v7 = [MEMORY[0x1E4F84898] sharedInstance];
  [v7 recoverPassWithUniqueID:v9];

  uint64_t v8 = [(PKExpiredTableViewController *)self existingGroupsController];
  [v8 handleUserPassRecover:v9];

  [(PKExpiredPassesViewController *)self _finishedEditingExpiredPassAtIndexPath:v6];
}

- (void)deletePass:(id)a3 atIndexPath:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F84898];
  id v11 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 sharedInstance];
  [v8 removePass:v7];

  id v9 = [(PKExpiredTableViewController *)self existingGroupsController];
  v10 = [v7 uniqueID];

  [v9 handleUserPassDelete:v10];
  [(PKExpiredPassesViewController *)self _finishedEditingExpiredPassAtIndexPath:v11];
}

- (void)_finishedEditingExpiredPassAtIndexPath:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  tableView = self->_tableView;
  id v10 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  id v7 = [v5 arrayWithObjects:&v10 count:1];
  -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v7, 100, v10, v11);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained finishedEditingExpiredPass];

  NSUInteger v9 = [(NSArray *)self->_expiredSectionPasses count];
  if (!v9) {
    [(PKExpiredPassesViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  -[NSArray objectAtIndex:](self->_expiredSectionPasses, "objectAtIndex:", [v7 row]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray pk_arrayByRemovingObject:](self->_expiredSectionPasses, "pk_arrayByRemovingObject:");
  uint64_t v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  expiredSectionPasses = self->_expiredSectionPasses;
  self->_expiredSectionPasses = v8;

  if (a4 == 1) {
    [(PKExpiredPassesViewController *)self deletePass:v10 atIndexPath:v7];
  }
  else {
    [(PKExpiredPassesViewController *)self recoverPass:v10 atIndexPath:v7];
  }
}

- (void)removeExpiredSectionPassWithUniqueID:(id)a3 isDeletion:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  expiredSectionPasses = self->_expiredSectionPasses;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__PKExpiredPassesViewController_removeExpiredSectionPassWithUniqueID_isDeletion___block_invoke;
  v15[3] = &unk_1E59D2858;
  id v8 = v6;
  id v16 = v8;
  uint64_t v9 = [(NSArray *)expiredSectionPasses indexOfObjectPassingTest:v15];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = v9;
    uint64_t v11 = [(NSArray *)self->_expiredSectionPasses objectAtIndex:v9];
    id v12 = [(NSArray *)self->_expiredSectionPasses pk_arrayByRemovingObject:v11];
    v13 = self->_expiredSectionPasses;
    self->_expiredSectionPasses = v12;

    v14 = [MEMORY[0x1E4F28D58] indexPathForRow:v10 inSection:0];
    if (v4) {
      [(PKExpiredPassesViewController *)self deletePass:v11 atIndexPath:v14];
    }
    else {
      [(PKExpiredPassesViewController *)self recoverPass:v11 atIndexPath:v14];
    }
  }
}

uint64_t __81__PKExpiredPassesViewController_removeExpiredSectionPassWithUniqueID_isDeletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 uniqueID];
  uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7) {
    *a4 = 1;
  }
  return v7;
}

- (id)_hyperlinkFooterView
{
  v2 = PKLocalizedString(&cfstr_ExpiredPassesF.isa);
  id v3 = PKLocalizedString(&cfstr_ExpiredPassesF_0.isa);
  BOOL v4 = PKStringWithValidatedFormat();
  uint64_t v5 = objc_msgSend(v4, "rangeOfString:", v3, v3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = v5;
    uint64_t v9 = v6;
    uint64_t v7 = objc_alloc_init(PKFooterHyperlinkView);
    uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=PASSBOOK&path="];
    uint64_t v11 = PKAttributedStringByAddingLinkToRange(v4, v8, v9, v10);
    [(PKFooterHyperlinkView *)v7 setAttributedText:v11];

    id v12 = &__block_literal_global_47;
    [(PKFooterHyperlinkView *)v7 setAction:&__block_literal_global_47];
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  footerView = self->_footerView;
  if (footerView)
  {
    uint64_t v5 = footerView;
  }
  else
  {
    uint64_t v5 = [(PKExpiredPassesViewController *)self _hyperlinkFooterView];
  }

  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (void)_updateTitles
{
  id v13 = [(PKExpiredPassesViewController *)self navigationItem];
  BOOL v3 = self->_selectedPassesCount > 0;
  [(UIBarButtonItem *)self->_deleteButton setEnabled:v3];
  [(UIBarButtonItem *)self->_unhideButton setEnabled:v3];
  int64_t selectedPassesCount = self->_selectedPassesCount;
  NSUInteger v5 = [(NSArray *)self->_expiredSectionPasses count];
  uint64_t v6 = 1152;
  selectButton = self->_selectButton;
  if (selectedPassesCount == v5) {
    uint64_t v8 = @"EXPIRED_PASSES_DESELECT_ALL";
  }
  else {
    uint64_t v8 = @"EXPIRED_PASSES_SELECT_ALL";
  }
  uint64_t v9 = PKLocalizedString(&v8->isa);
  [(UIBarButtonItem *)selectButton setTitle:v9];

  if ([(PKExpiredPassesViewController *)self isEditing])
  {
    uint64_t v10 = PKLocalizedString(&cfstr_ExpiredPassesE.isa);
    [v13 setTitle:v10];

    uint64_t v11 = &OBJC_IVAR___PKExpiredPassesViewController__cancelButton;
  }
  else
  {
    id v12 = PKLocalizedString(&cfstr_ExpiredPassesT.isa);
    [v13 setTitle:v12];

    uint64_t v11 = &OBJC_IVAR___PKExpiredPassesViewController__editButton;
    uint64_t v6 = 1136;
  }
  [v13 setLeftBarButtonItem:*(Class *)((char *)&self->super.super.super.super.super.isa + v6) animated:1];
  [v13 setRightBarButtonItem:*(Class *)((char *)&self->super.super.super.super.super.isa + *v11) animated:1];
}

- (void)_done
{
  id v2 = [(PKExpiredPassesViewController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)_select
{
  int64_t selectedPassesCount = self->_selectedPassesCount;
  NSUInteger v4 = [(NSArray *)self->_expiredSectionPasses count];
  uint64_t v5 = [(UITableView *)self->_tableView numberOfRowsInSection:0];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:0];
      tableView = self->_tableView;
      if (selectedPassesCount == v4) {
        [(UITableView *)tableView deselectRowAtIndexPath:v8 animated:1];
      }
      else {
        [(UITableView *)tableView selectRowAtIndexPath:v8 animated:1 scrollPosition:0];
      }
    }
  }
  uint64_t v10 = self->_tableView;

  [(PKExpiredPassesViewController *)self tableViewDidUpdateSelection:v10];
}

- (void)_edit
{
}

- (void)_cancel
{
}

- (id)_selectedExpiredPassesString
{
  return (id)PKLocalizedString(&cfstr_ExpiredPassesS_0.isa, &cfstr_Lu.isa, self->_selectedPassesCount);
}

- (void)_applyDeletionOrRecovery
{
  tableView = self->_tableView;
  v3[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PKExpiredPassesViewController__applyDeletionOrRecovery__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__PKExpiredPassesViewController__applyDeletionOrRecovery__block_invoke_2;
  v3[3] = &unk_1E59CB6D8;
  [(UITableView *)tableView performBatchUpdates:v4 completion:v3];
}

void __57__PKExpiredPassesViewController__applyDeletionOrRecovery__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1112) indexPathsForSelectedRows];
  BOOL v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  NSUInteger v4 = objc_msgSend(v3, "reverseObjectEnumerator", 0);
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
        [*(id *)(a1 + 32) tableView:*(void *)(*(void *)(a1 + 32) + 1112) commitEditingStyle:*(void *)(*(void *)(a1 + 32) + 1184) forRowAtIndexPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

uint64_t __57__PKExpiredPassesViewController__applyDeletionOrRecovery__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEditing:0 animated:1];
}

- (void)_presentConfirmationAlertWithTitle:(id)a3 confirmationMessage:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4FB1410];
  id v7 = a4;
  id v8 = a3;
  long long v9 = PKLocalizedString(&cfstr_ExpiredPassesC.isa);
  long long v10 = [v6 actionWithTitle:v9 style:1 handler:0];

  [v10 setAccessibilityIdentifier:*MEMORY[0x1E4F85340]];
  long long v11 = (void *)MEMORY[0x1E4FB1410];
  long long v12 = PKLocalizedString(&cfstr_ExpiredPassesC_0.isa);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__PKExpiredPassesViewController__presentConfirmationAlertWithTitle_confirmationMessage___block_invoke;
  v15[3] = &unk_1E59CB1F0;
  void v15[4] = self;
  id v13 = [v11 actionWithTitle:v12 style:0 handler:v15];

  [v13 setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
  uint64_t v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v8 message:v7 preferredStyle:1];

  [v14 addAction:v10];
  [v14 addAction:v13];
  [(PKExpiredPassesViewController *)self presentViewController:v14 animated:1 completion:0];
}

uint64_t __88__PKExpiredPassesViewController__presentConfirmationAlertWithTitle_confirmationMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyDeletionOrRecovery];
}

- (void)_deletePassPressed
{
  self->_currentEditingStyle = 1;
  PKLocalizedString(&cfstr_ExpiredPassesD_0.isa, &cfstr_Lu.isa, self->_selectedPassesCount);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PKExpiredPassesViewController *)self _presentConfirmationAlertWithTitle:0 confirmationMessage:v3];
}

- (void)_recoverPassPressed
{
  self->_currentEditingStyle = 0;
  PKLocalizedString(&cfstr_ExpiredPassesU_0.isa, &cfstr_Lu.isa, self->_selectedPassesCount);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PKExpiredPassesViewController *)self _presentConfirmationAlertWithTitle:0 confirmationMessage:v3];
}

- (void)tableViewDidUpdateSelection:(id)a3
{
  NSUInteger v4 = [(UITableView *)self->_tableView indexPathsForSelectedRows];
  self->_int64_t selectedPassesCount = [v4 count];

  [(PKExpiredPassesViewController *)self _updateSelectedPassesText];
}

- (void)_updateSelectedPassesText
{
  selectedPassesLabel = self->_selectedPassesLabel;
  NSUInteger v4 = [(PKExpiredPassesViewController *)self _selectedExpiredPassesString];
  [(UILabel *)selectedPassesLabel setText:v4];

  [(UILabel *)self->_selectedPassesLabel sizeToFit];
  uint64_t v5 = [(PKExpiredPassesViewController *)self navigationController];
  uint64_t v6 = [v5 toolbar];
  [v6 sizeToFit];

  [(PKExpiredPassesViewController *)self _updateTitles];
}

- (id)viewControllerForRowAtIndexPath:(id)a3
{
  if (a3)
  {
    id v3 = -[NSArray objectAtIndex:](self->_expiredSectionPasses, "objectAtIndex:", [a3 row]);
    NSUInteger v4 = [[PKExpiredSinglePassViewController alloc] initWithPass:v3];
  }
  else
  {
    NSUInteger v4 = 0;
  }

  return v4;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v5 = -[PKExpiredPassesViewController viewControllerForRowAtIndexPath:](self, "viewControllerForRowAtIndexPath:", a4, a5.x, a5.y);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1E4FB1678];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91__PKExpiredPassesViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
    v10[3] = &unk_1E59D28F8;
    id v11 = v5;
    id v8 = [v7 configurationWithIdentifier:0 previewProvider:v10 actionProvider:&__block_literal_global_71];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id __91__PKExpiredPassesViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __91__PKExpiredPassesViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2()
{
  return 0;
}

- (id)passAtIndexPath:(id)a3
{
  id v4 = a3;
  expiredSectionPasses = self->_expiredSectionPasses;
  if (expiredSectionPasses && (unint64_t v6 = -[NSArray count](expiredSectionPasses, "count"), v6 > [v4 row]))
  {
    id v7 = -[NSArray objectAtIndex:](self->_expiredSectionPasses, "objectAtIndex:", [v4 row]);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)prefetchItemsAtIndexPaths:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 count];
  if (v4 - 1 >= 0)
  {
    uint64_t v5 = v4;
    do
    {
      unint64_t v6 = [v9 objectAtIndex:--v5];
      unint64_t v7 = [v6 row];
      if ([(NSArray *)self->_expiredSectionPasses count] > v7)
      {
        id v8 = [(NSArray *)self->_expiredSectionPasses objectAtIndex:v7];
        [v8 loadImageSetAsync:0 preheat:0 withCompletion:0];
      }
    }
    while (v5 > 0);
  }
}

- (BOOL)passExistsWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  expiredSectionPasses = self->_expiredSectionPasses;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PKExpiredPassesViewController_passExistsWithUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E59D2940;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(expiredSectionPasses) = [(NSArray *)expiredSectionPasses pk_containsObjectPassingTest:v8];

  return (char)expiredSectionPasses;
}

uint64_t __64__PKExpiredPassesViewController_passExistsWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)pass
{
  return self->_viewingPass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPassesLabel, 0);
  objc_storeStrong((id *)&self->_unhideButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_selectButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_geocodeRequests, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_viewingPass, 0);
  objc_storeStrong((id *)&self->_locationStringsForPassUniqueIDs, 0);
  objc_storeStrong((id *)&self->_expiredSectionPasses, 0);

  objc_storeStrong((id *)&self->_groupsController, 0);
}

@end
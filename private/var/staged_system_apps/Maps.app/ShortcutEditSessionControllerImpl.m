@interface ShortcutEditSessionControllerImpl
- (BOOL)shortcutsContainItem:(id)a3;
- (CNContact)meCardContact;
- (ContainerViewController)containerViewController;
- (ShortcutEditSessionControllerDelegate)delegate;
- (id)requestInitiator;
- (void)_closeLocationRefinement;
- (void)_createNewContactCard;
- (void)_doneLocationRefinement;
- (void)_presentContactVC:(id)a3;
- (void)_presentViewController:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
- (void)_showContactCard:(id)a3;
- (void)_showContactPicker;
- (void)addFavoriteButtonShortcut:(id)a3;
- (void)capturePresenter;
- (void)closeViewController:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)createOrUpdateMeCardWithFavorite:(id)a3 completion:(id)a4;
- (void)editShortcut:(id)a3;
- (void)editShortcut:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
- (void)endSession;
- (void)presentChoicePickerFrom:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)presentedViewControllerWasDismissedBySwiping:(id)a3;
- (void)refinementCoordinator:(id)a3 finishedRefiningCoordinate:(CLLocationCoordinate2D)a4 withShortcut:(id)a5;
- (void)refinementCoordinator:(id)a3 presentViewController:(id)a4;
- (void)refinementCoordinatorDidComplete:(id)a3;
- (void)refinementCoordinatorRequestsChangeAddress:(id)a3 withShortcut:(id)a4;
- (void)removeShortcut:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRequestInitiator:(id)a3;
- (void)showAddContact:(id)a3;
- (void)showAddShortcut:(id)a3;
- (void)showMeCard;
- (void)showMeCardWithAddress:(id)a3 from:(id)a4;
- (void)showRefineLocation:(id)a3;
- (void)viewController:(id)a3 didEditMapItemInSession:(id)a4;
@end

@implementation ShortcutEditSessionControllerImpl

- (BOOL)shortcutsContainItem:(id)a3
{
  return [(ShortcutEditSession *)self->_shortcutEditSession shortcutsContainItem:a3];
}

- (void)capturePresenter
{
  if (!self->_presentingViewController)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v3 = [WeakRetained currentViewController];
    presentingViewController = self->_presentingViewController;
    self->_presentingViewController = v3;
  }
}

- (void)refinementCoordinatorRequestsChangeAddress:(id)a3 withShortcut:(id)a4
{
  shortcutEditSession = self->_shortcutEditSession;
  id v6 = a4;
  [(ShortcutEditSessionControllerImpl *)self showAddShortcut:shortcutEditSession];
  v7 = (char *)[v6 type];

  if ((unint64_t)(v7 - 2) > 3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = dword_100F728B0[(void)(v7 - 2)];
  }

  +[GEOAPPortal captureUserAction:v8 target:253 value:0];
}

- (void)refinementCoordinator:(id)a3 finishedRefiningCoordinate:(CLLocationCoordinate2D)a4 withShortcut:(id)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v8 = a5;
  -[ShortcutEditSession setAdjustedCoordinate:](self->_shortcutEditSession, "setAdjustedCoordinate:", latitude, longitude);
  if ([(ShortcutEditSession *)self->_shortcutEditSession editOnlyLocation])
  {
    shortcutEditSession = self->_shortcutEditSession;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1008DA418;
    v10[3] = &unk_1012E7D28;
    id v11 = v8;
    [(ShortcutEditSession *)shortcutEditSession saveWithCompletion:v10];
    if (!self->_editShortcutViewController) {
      [(ShortcutEditSessionControllerImpl *)self endSession];
    }
  }
}

- (void)refinementCoordinator:(id)a3 presentViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1008DA648;
  v14[3] = &unk_1012E6690;
  objc_copyWeak(&v16, &location);
  id v8 = v7;
  id v15 = v8;
  v9 = objc_retainBlock(v14);
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  uint64_t v12 = sub_1000BBB44(WeakRetained);

  if (v12 == 5)
  {
    id v13 = objc_loadWeakRetained((id *)p_containerViewController);
    [v13 dismissViewControllerAnimated:1 completion:v9];
  }
  else
  {
    ((void (*)(void *))v9[2])(v9);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)refinementCoordinatorDidComplete:(id)a3
{
  id v5 = a3;
  editShortcutViewController = self->_editShortcutViewController;
  if (editShortcutViewController)
  {
    if (sub_1000BBB44(editShortcutViewController) == 5 && self->_popoverPresentationController) {
      [(ShortcutEditSessionControllerImpl *)self closeViewController:self->_editShortcutViewController];
    }
  }
  else
  {
    [(ShortcutEditSessionControllerImpl *)self endSession];
  }
}

- (void)showRefineLocation:(id)a3
{
  id v10 = a3;
  v4 = [v10 shortcut];

  if (v4)
  {
    id v5 = [RAPPersonalPlaceRefinementCoordinator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v7 = [v10 shortcut];
    id v8 = [(RAPPersonalPlaceRefinementCoordinator *)v5 initWithPresentingViewController:WeakRetained delegate:self shortcut:v7];
    homeWorkCoordinator = self->_homeWorkCoordinator;
    self->_homeWorkCoordinator = v8;

    [v10 setEditingModeType:3];
    [(RAPPersonalPlaceRefinementCoordinator *)self->_homeWorkCoordinator beginShortcutRefinement];
  }
}

- (void)_closeLocationRefinement
{
  objc_initWeak(&location, self);
  v3 = [(EditLocationViewController *)self->_refineCoordinateViewController presentingViewController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008DA8D4;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  [v3 dismissViewControllerAnimated:1 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_doneLocationRefinement
{
  [(EditLocationViewController *)self->_refineCoordinateViewController selectedCoordinate];
  -[ShortcutEditSession setAdjustedCoordinate:](self->_shortcutEditSession, "setAdjustedCoordinate:");
  objc_initWeak(&location, self);
  if ([(ShortcutEditSession *)self->_shortcutEditSession editOnlyLocation])
  {
    shortcutEditSession = self->_shortcutEditSession;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1008DAA2C;
    v4[3] = &unk_1012E6998;
    objc_copyWeak(&v5, &location);
    [(ShortcutEditSession *)shortcutEditSession saveWithCompletion:v4];
    objc_destroyWeak(&v5);
  }
  else
  {
    [(ShortcutEditSessionControllerImpl *)self _closeLocationRefinement];
  }
  objc_destroyWeak(&location);
}

- (void)showAddShortcut:(id)a3
{
  id v4 = a3;
  [(ShortcutEditSessionControllerImpl *)self capturePresenter];
  id v5 = [v4 shortcut];
  unint64_t v6 = (unint64_t)[v5 type];

  if (v6 <= 6)
  {
    if (((1 << v6) & 0x2C) != 0)
    {
      id v11 = [[AddShortcutViewController alloc] initWithShortcutEditSession:v4];
      [(AddShortcutViewController *)v11 setSessionController:self];
      objc_storeStrong((id *)&self->_addShortcutSetupViewController, v11);
      objc_initWeak(&location, self);
      id v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      id v15 = sub_1008DAC54;
      id v16 = &unk_1012E6708;
      objc_copyWeak(&v17, &location);
      [(AddShortcutViewController *)self->_addShortcutSetupViewController setDismissActionHandler:&v13];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      [WeakRetained presentController:self->_addShortcutSetupViewController animated:1 v13, v14, v15, v16];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else if (((1 << v6) & 0x43) != 0)
    {
      id v7 = [[AddShortcutViewController alloc] initWithShortcutEditSession:v4];
      [(AddShortcutViewController *)v7 setSessionController:self];
      addShortcutViewController = self->_addShortcutViewController;
      self->_addShortcutViewController = v7;
      v9 = v7;

      [(AddShortcutViewController *)v9 setAccessibilityIdentifier:@"AddShortcutView"];
      id v10 = objc_loadWeakRetained((id *)&self->_containerViewController);
      [v10 presentController:self->_addShortcutViewController animated:1];
    }
  }
}

- (void)showAddContact:(id)a3
{
  id v4 = a3;
  [(ShortcutEditSessionControllerImpl *)self capturePresenter];
  id v7 = [[ContactSearchViewController alloc] initWithShortcutEditSession:v4];

  id v5 = [(ShortcutEditSessionControllerImpl *)self delegate];
  [(ContaineeViewController *)v7 setContaineeDelegate:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v7 animated:1];
}

- (void)addFavoriteButtonShortcut:(id)a3
{
  id v4 = a3;
  [v4 setEditingModeType:1];
  -[ShortcutEditSessionControllerImpl editShortcut:sourceView:sourceRect:](self, "editShortcut:sourceView:sourceRect:", v4, 0, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  id v7 = [v4 shortcut];

  if ([v7 type] == (id)6)
  {
    id v5 = [v7 identifier];
    unsigned int v6 = [v5 isEqualToString:@"NearbyTransit"];

    if (v6)
    {
      +[GEOAPPortal captureUserAction:211 target:254 value:0];
    }
  }
  else
  {
  }
}

- (void)viewController:(id)a3 didEditMapItemInSession:(id)a4
{
  unsigned int v6 = (AddShortcutViewController *)a3;
  id v7 = (ShortcutEditSession *)a4;
  id v8 = v7;
  if (self->_shortcutEditSession == v7 && [(ShortcutEditSession *)v7 editOnlyLocation])
  {
    self->_didReplaceShortcut = 1;
    [(ShortcutEditSession *)v8 setEditingModeType:1];
  }
  if (sub_1000BBB44(v6) == 5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_addShortcutSetupViewController == v6)
    {
      objc_initWeak(&location, self);
      shortcutEditSession = self->_shortcutEditSession;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1008DB060;
      v14[3] = &unk_1012E6998;
      v9 = &v15;
      objc_copyWeak(&v15, &location);
      [(ShortcutEditSession *)shortcutEditSession saveWithCompletion:v14];
    }
    else
    {
      objc_initWeak(&location, self);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1008DB120;
      v11[3] = &unk_1012E5D30;
      v9 = &v13;
      objc_copyWeak(&v13, &location);
      uint64_t v12 = v6;
      [(ShortcutEditSession *)v8 saveWithCompletion:v11];
    }
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
  else
  {
    [(ShortcutEditSessionControllerImpl *)self editShortcut:v8];
  }
}

- (void)editShortcut:(id)a3
{
}

- (void)editShortcut:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v12 = a3;
  id v13 = a4;
  objc_storeStrong((id *)&self->_shortcutEditSession, a3);
  [(ShortcutEditSessionControllerImpl *)self capturePresenter];
  if ([v12 editOnlyLocation])
  {
    [(ShortcutEditSessionControllerImpl *)self showRefineLocation:v12];
  }
  else
  {
    if (([v12 editOnlyAddress] & 1) != 0 || objc_msgSend(v12, "editingModeType") == (id)1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      id v15 = [WeakRetained currentViewController];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_initWeak(&location, self);
        shortcutEditSession = self->_shortcutEditSession;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1008DB424;
        v20[3] = &unk_1012E5D30;
        objc_copyWeak(&v22, &location);
        v21 = v15;
        [(ShortcutEditSession *)shortcutEditSession saveWithCompletion:v20];

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
      else
      {
        [(ShortcutEditSessionControllerImpl *)self showAddShortcut:v12];
      }
    }
    else
    {
      if ([v12 isSetupPlaceholder]
        && !+[LibraryUIUtilities isMyPlacesEnabled]
        || +[LibraryUIUtilities isMyPlacesEnabled]
        && ([v12 shortcut],
            id v17 = objc_claimAutoreleasedReturnValue(),
            [v17 geoMapItem],
            v18 = objc_claimAutoreleasedReturnValue(),
            v18,
            v17,
            !v18))
      {
        [(ShortcutEditSessionControllerImpl *)self showAddShortcut:v12];
        goto LABEL_9;
      }
      id v15 = [[EditShortcutViewController alloc] initWithShortcutEditSession:v12];
      [(EditShortcutViewController *)v15 setSessionController:self];
      objc_storeStrong((id *)&self->_editShortcutViewController, v15);
      if (v13)
      {
        if (!self->_popoverPresentationController) {
          -[ShortcutEditSessionControllerImpl _presentViewController:sourceView:sourceRect:](self, "_presentViewController:sourceView:sourceRect:", self->_editShortcutViewController, v13, x, y, width, height);
        }
      }
      else
      {
        id v19 = objc_loadWeakRetained((id *)&self->_containerViewController);
        [v19 presentController:self->_editShortcutViewController animated:1];
      }
    }
  }
LABEL_9:
}

- (void)_presentViewController:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  if (v12)
  {
    [v11 setModalPresentationStyle:7];
    id v13 = [v11 popoverPresentationController];
    popoverPresentationController = self->_popoverPresentationController;
    self->_popoverPresentationController = v13;

    [(UIPopoverPresentationController *)self->_popoverPresentationController setDelegate:self];
    [(UIPopoverPresentationController *)self->_popoverPresentationController setSourceView:v12];
    -[UIPopoverPresentationController setSourceRect:](self->_popoverPresentationController, "setSourceRect:", x, y, width, height);
    [(UIPopoverPresentationController *)self->_popoverPresentationController setPermittedArrowDirections:4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  uint64_t v16 = sub_1000BBB44(WeakRetained);

  if (v16 == 5)
  {
    objc_initWeak(&location, self);
    id v17 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1008DB650;
    v19[3] = &unk_1012E6690;
    objc_copyWeak(&v21, &location);
    id v20 = v11;
    [v17 dismissViewControllerAnimated:1 completion:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    id v18 = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v18 _maps_topMostPresentViewController:v11 animated:1 completion:0];
  }
}

- (void)removeShortcut:(id)a3
{
  [a3 removeFromShortcutsWithCompletion:&stru_1012FFCF8];
  if (self->_popoverPresentationController)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v5 = [WeakRetained presentedViewController];
    editShortcutViewController = self->_editShortcutViewController;

    if (v5 == editShortcutViewController)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_containerViewController);
      [v7 dismissViewControllerAnimated:1 completion:0];
    }
  }
  if (self->_editShortcutViewController)
  {
    -[ShortcutEditSessionControllerImpl closeViewController:](self, "closeViewController:");
  }
}

- (void)presentedViewControllerWasDismissedBySwiping:(id)a3
{
  id v4 = a3;
  [(ShortcutEditSessionControllerImpl *)self endSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ContaineeProtocol *)self->_presentingViewController handleDismissAction:self];
    }
  }
}

- (void)endSession
{
  if (self->_didReplaceShortcut)
  {
    v3 = [(ShortcutEditSession *)self->_shortcutEditSession shortcut];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(ShortcutEditSession *)self->_shortcutEditSession shortcut];
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
  self->_didReplaceShortcut = 0;
  id v4 = [(ShortcutEditSessionControllerImpl *)self delegate];
  [v4 shortcutEditSessionControllerFinished:self shortcutWasReplacedBy:v7];

  id v5 = [(ShortcutEditSession *)self->_shortcutEditSession completionHandler];

  if (v5)
  {
    unsigned int v6 = [(ShortcutEditSession *)self->_shortcutEditSession completionHandler];
    v6[2]();
  }
}

- (void)closeViewController:(id)a3
{
  id v11 = (MeCardShortcutViewController *)a3;
  if (self->_meCardSetupViewController == v11 && self->_editShortcutViewController)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v7 = WeakRetained;
    editShortcutViewController = self->_editShortcutViewController;
LABEL_18:
    [WeakRetained presentController:editShortcutViewController animated:1];

    goto LABEL_19;
  }
  [(ShortcutEditSessionControllerImpl *)self endSession];
  popoverPresentationController = self->_popoverPresentationController;
  if (popoverPresentationController)
  {
    self->_popoverPresentationController = 0;

LABEL_4:
    id v5 = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v5 dismissViewControllerAnimated:1 completion:0];

    goto LABEL_19;
  }
  if (self->_presentingViewController)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      id v7 = WeakRetained;
      editShortcutViewController = self->_presentingViewController;
      goto LABEL_18;
    }
    uint64_t v9 = sub_1000BBB44(v11);
    presentingViewController = self->_presentingViewController;
    if (v9 == 5 && presentingViewController == (ContaineeProtocol *)v11)
    {
      if ([(MeCardShortcutViewController *)v11 modalPresentationStyle] == (id)2) {
        goto LABEL_4;
      }
      presentingViewController = self->_presentingViewController;
    }
    [(ContaineeProtocol *)presentingViewController handleDismissAction:self];
    goto LABEL_19;
  }
  if (sub_1000BBB44(v11) == 5
    && [(MeCardShortcutViewController *)v11 modalPresentationStyle] == (id)2)
  {
    goto LABEL_4;
  }
LABEL_19:
}

- (CNContact)meCardContact
{
  meCardContact = self->_meCardContact;
  if (!meCardContact)
  {
    id v4 = +[AddressBookManager sharedManager];
    id v5 = [v4 meCard];
    unsigned int v6 = self->_meCardContact;
    self->_meCardContact = v5;

    meCardContact = self->_meCardContact;
  }

  return meCardContact;
}

- (void)showMeCard
{
  v3 = [(ShortcutEditSessionControllerImpl *)self meCardContact];
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1008DBC64;
  v12[3] = &unk_1012E6690;
  objc_copyWeak(&v14, &location);
  id v4 = v3;
  id v13 = v4;
  id v5 = objc_retainBlock(v12);
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  uint64_t v8 = sub_1000BBB44(WeakRetained);

  if (v8 == 5)
  {
    id v9 = objc_loadWeakRetained((id *)p_containerViewController);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1008DBCF4;
    v10[3] = &unk_1012E6EA8;
    id v11 = v5;
    [v9 dismissViewControllerAnimated:1 completion:v10];
  }
  else
  {
    ((void (*)(void *))v5[2])(v5);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)showMeCardWithAddress:(id)a3 from:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(ShortcutEditSessionControllerImpl *)self meCardContact];

  if (v9)
  {
    if (v7)
    {
      id v10 = objc_alloc_init((Class)CNMutableContact);
      id v15 = v7;
      id v11 = +[NSArray arrayWithObjects:&v15 count:1];
      [v10 setPostalAddresses:v11];

      id v12 = [(ShortcutEditSessionControllerImpl *)self meCardContact];
      id v13 = +[CNContactViewController viewControllerForUpdatingContact:v12 withPropertiesFromContact:v10];

      objc_storeStrong((id *)&self->_addressToAdd, a3);
    }
    else
    {
      id v14 = [(ShortcutEditSessionControllerImpl *)self meCardContact];
      id v13 = +[CNContactViewController viewControllerForContact:v14];

      [v13 setActions:[v13 actions] | 0x100];
    }
    [v13 setEditMode:2];
    [(ShortcutEditSessionControllerImpl *)self _showContactCard:v13];
  }
  else if (v8)
  {
    objc_storeStrong((id *)&self->_addressToAdd, a3);
    [(ShortcutEditSessionControllerImpl *)self presentChoicePickerFrom:v8];
  }
}

- (void)createOrUpdateMeCardWithFavorite:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [v6 cnLabledAddress];
  if (v8 && ([v6 isMeCardWritebackEnabled] & 1) != 0)
  {
    id v9 = +[AddressBookManager sharedManager];
    id v10 = [v9 meCard];

    if (v10)
    {
      id v11 = [v8 value];
      id v12 = [v10 postalAddresses];
      id v13 = +[CNLabeledValue firstLabeledValueWithValue:v11 inArray:v12];

      if (v13)
      {
        v7[2](v7);
LABEL_14:

        goto LABEL_15;
      }
      id v15 = [v10 mutableCopy];
      v24 = [v15 postalAddresses];
      id v17 = [v24 mutableCopy];

      [v17 addObject:v8];
      [v15 setPostalAddresses:v17];
      v25 = +[AddressBookManager sharedManager];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1008DC298;
      v31[3] = &unk_1012F3B90;
      v32 = v7;
      [v25 updateContact:v15 completion:v31];
    }
    else
    {
      id v14 = +[GEOUserAccountInfo primaryICloudAccount];
      [v14 aa_firstName];
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v16 = +[GEOUserAccountInfo primaryICloudAccount];
      [v16 aa_lastName];
      id v17 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 && v17)
      {
        id v18 = objc_alloc_init((Class)CNMutableContact);
        v34 = v8;
        id v19 = +[NSArray arrayWithObjects:&v34 count:1];
        [v18 setPostalAddresses:v19];

        [v18 setGivenName:v15];
        id v20 = +[GEOUserAccountInfo primaryICloudAccount];
        id v21 = [v20 aa_middleName];
        [v18 setMiddleName:v21];

        [v18 setFamilyName:v17];
        id v22 = +[AddressBookManager sharedManager];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1008DC2A8;
        v29[3] = &unk_1012F3B90;
        v30 = v7;
        [v22 createMeCardWithContact:v18 completion:v29];

        v23 = v30;
      }
      else
      {
        v26 = objc_retainBlock(v7);
        id contactsSaveHandler = self->contactsSaveHandler;
        self->id contactsSaveHandler = v26;

        id v18 = objc_alloc_init((Class)CNMutableContact);
        v33 = v8;
        v28 = +[NSArray arrayWithObjects:&v33 count:1];
        [v18 setPostalAddresses:v28];

        v23 = +[CNContactViewController viewControllerForNewContact:v18];
        [(ShortcutEditSessionControllerImpl *)self _showContactCard:v23];
      }
    }
    goto LABEL_14;
  }
  v7[2](v7);
LABEL_15:
}

- (void)_createNewContactCard
{
  if (self->_addressToAdd)
  {
    id v3 = objc_alloc_init((Class)CNMutableContact);
    addressToAdd = self->_addressToAdd;
    id v4 = +[NSArray arrayWithObjects:&addressToAdd count:1];
    [v3 setPostalAddresses:v4];
  }
  else
  {
    id v3 = 0;
  }
  id v5 = +[CNContactViewController viewControllerForNewContact:v3];
  [(ShortcutEditSessionControllerImpl *)self _showContactCard:v5];
}

- (void)_showContactCard:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:self];
  [v4 setDisplayMode:1];
  id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];

  if (sub_1000BBB44(v6) == 5) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = -2;
  }
  [v6 setModalPresentationStyle:v5];
  [(ShortcutEditSessionControllerImpl *)self _presentContactVC:v6];
}

- (void)_showContactPicker
{
  id v4 = objc_alloc_init((Class)CNContactPickerViewController);
  [v4 setDelegate:self];
  if (sub_1000BBB44(v4) == 5) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = -2;
  }
  [v4 setModalPresentationStyle:v3];
  [(ShortcutEditSessionControllerImpl *)self _presentContactVC:v4];
}

- (void)_presentContactVC:(id)a3
{
  id v4 = a3;
  if (sub_1000BBB44(v4) == 5)
  {
    [(EditShortcutViewController *)self->_editShortcutViewController setOpeningContactController:1];
    objc_initWeak(&location, self);
    uint64_t v5 = [(ShortcutEditSessionControllerImpl *)self containerViewController];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1008DC5F0;
    v7[3] = &unk_1012E6690;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    [v5 dismissViewControllerAnimated:1 completion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = [(ShortcutEditSessionControllerImpl *)self containerViewController];
    [v6 _maps_topMostPresentViewController:v4 animated:1 completion:0];
  }
}

- (void)presentChoicePickerFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"[Shortcut] No Existing Contact Card" value:@"localized string not found" table:0];
  id v7 = +[UIAlertController alertControllerWithTitle:v6 message:0 preferredStyle:0];

  id v8 = [v7 popoverPresentationController];
  [v8 setSourceView:v4];

  objc_initWeak(location, self);
  id v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"[Shortcut] Create a new one" value:@"localized string not found" table:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1008DC9D8;
  v22[3] = &unk_1012E8EB8;
  objc_copyWeak(&v23, location);
  id v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v22];
  [v7 addAction:v11];

  id v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"[Shortcut] Choose an existing one" value:@"localized string not found" table:0];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1008DCA18;
  v20[3] = &unk_1012E8EB8;
  objc_copyWeak(&v21, location);
  id v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v20];
  [v7 addAction:v14];

  id v15 = +[NSBundle mainBundle];
  uint64_t v16 = [v15 localizedStringForKey:@"[Collection] Alert's cancel button title" value:@"localized string not found" table:0];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1008DCA58;
  v19[3] = &unk_1012E6DE0;
  void v19[4] = self;
  id v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:v19];
  [v7 addAction:v17];

  id v18 = [(ShortcutEditSessionControllerImpl *)self containerViewController];
  [v18 _maps_topMostPresentViewController:v7 animated:1 completion:0];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_meCardSetupViewController;
  if (v7)
  {
    id v9 = +[AddressBookManager sharedManager];
    unsigned __int8 v10 = [v9 meCardExists];

    if ((v10 & 1) == 0)
    {
      id v11 = +[AddressBookManager sharedManager];
      id v12 = [v11 contactStore];
      [v12 setMeContact:v7 error:0];
    }
    if (self->_addressToAdd)
    {
      [v7 postalAddresses];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = (uint64_t)[v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v14)
      {
        id v26 = a4;
        v27 = v8;
        uint64_t v15 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v34 != v15) {
              objc_enumerationMutation(v13);
            }
            id v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            id v18 = [(CNLabeledValue *)self->_addressToAdd identifier];
            id v19 = [v17 identifier];
            unsigned __int8 v20 = [v18 isEqualToString:v19];

            if (v20)
            {
              uint64_t v14 = 1;
              goto LABEL_17;
            }
          }
          uint64_t v14 = (uint64_t)[v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v14) {
            continue;
          }
          break;
        }
LABEL_17:
        a4 = v26;
        id v8 = v27;
      }

      [(EditShortcutViewController *)self->_editShortcutViewController didEditContactWithAddressAdded:v14];
      addressToAdd = self->_addressToAdd;
      self->_addressToAdd = 0;
    }
    objc_storeStrong((id *)&self->_meCardContact, a4);
    [(MeCardShortcutViewController *)v8 updateContact];
  }
  else if (self->_addressToAdd)
  {
    [(EditShortcutViewController *)self->_editShortcutViewController resetToMapItemType];
  }
  id v22 = [v6 presentingViewController];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1008DCD30;
  v28[3] = &unk_1012E85E0;
  id v29 = v7;
  v30 = v8;
  v31 = self;
  id v32 = v6;
  id v23 = v6;
  v24 = v8;
  id v25 = v7;
  [v22 dismissViewControllerAnimated:1 completion:v28];
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = [a3 presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  if (self->_addressToAdd)
  {
    editShortcutViewController = self->_editShortcutViewController;
    [(EditShortcutViewController *)editShortcutViewController resetToMapItemType];
  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v7 = a4;
  id v8 = self->_meCardSetupViewController;
  objc_storeStrong((id *)&self->_meCardContact, a4);
  id v9 = a3;
  [(MeCardShortcutViewController *)self->_meCardSetupViewController updateContact];
  unsigned __int8 v10 = +[AddressBookManager sharedManager];
  id v11 = [v10 contactStore];
  [v11 setMeContact:v7 error:0];

  id v12 = [v9 presentingViewController];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1008DCF6C;
  v15[3] = &unk_1012E66E0;
  id v16 = v7;
  id v17 = v8;
  id v18 = self;
  id v13 = v8;
  id v14 = v7;
  [v12 dismissViewControllerAnimated:1 completion:v15];
}

- (void)presentationControllerWillDismiss:(id)a3
{
  if (self->_popoverPresentationController == a3) {
    [(ShortcutEditSessionControllerImpl *)self closeViewController:self->_editShortcutViewController];
  }
}

- (ShortcutEditSessionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ShortcutEditSessionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (ContainerViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (id)requestInitiator
{
  id WeakRetained = objc_loadWeakRetained(&self->_requestInitiator);

  return WeakRetained;
}

- (void)setRequestInitiator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_requestInitiator);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->contactsSaveHandler, 0);
  objc_storeStrong((id *)&self->_popoverPresentationController, 0);
  objc_storeStrong((id *)&self->_addressToAdd, 0);
  objc_storeStrong((id *)&self->_meCardContact, 0);
  objc_storeStrong((id *)&self->_homeWorkCoordinator, 0);
  objc_storeStrong((id *)&self->_shortcutEditSession, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_addShortcutSetupViewController, 0);
  objc_storeStrong((id *)&self->_meCardSetupViewController, 0);
  objc_storeStrong((id *)&self->_refineCoordinateViewController, 0);
  objc_storeStrong((id *)&self->_editShortcutViewController, 0);

  objc_storeStrong((id *)&self->_addShortcutViewController, 0);
}

@end
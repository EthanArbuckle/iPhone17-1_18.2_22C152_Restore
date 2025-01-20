@interface SUUIGiftComposeViewController
- (BOOL)popoverControllerShouldDismissPopover:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (SUUIGiftComposeViewController)initWithGift:(id)a3 configuration:(id)a4;
- (UIBarButtonItem)nextButton;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_headerView;
- (id)_itemImage;
- (id)_itemView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_amountControlAction:(id)a3;
- (void)_cancelAction:(id)a3;
- (void)_finishValidationWithResponse:(id)a3 error:(id)a4;
- (void)_keyboardChangeNotification:(id)a3;
- (void)_nextAction:(id)a3;
- (void)_pushThemePickerOrShowInvalidAlert;
- (void)_recipientsDidChangeNotification:(id)a3;
- (void)_reloadSections;
- (void)_setItemImage:(id)a3 error:(id)a4;
- (void)_textFieldChangeNotification:(id)a3;
- (void)_textViewChangeNotification:(id)a3;
- (void)_textViewDidEndEditingNotification:(id)a3;
- (void)_validateGift;
- (void)_validateGiftThrottled:(BOOL)a3;
- (void)dealloc;
- (void)giftSendDateSection:(id)a3 didChangeDate:(id)a4;
- (void)loadView;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)setNextButton:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 giftRecipientCell:(id)a4 didUpdateSearchController:(id)a5;
- (void)tableView:(id)a3 giftRecipientCell:(id)a4 dismissContactPicker:(id)a5;
- (void)tableView:(id)a3 giftRecipientCell:(id)a4 presentContactPicker:(id)a5;
- (void)tableView:(id)a3 giftRecipientCellDidChangeRecipients:(id)a4;
- (void)tableView:(id)a3 giftRecipientCellDidChangeSize:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUIGiftComposeViewController

- (SUUIGiftComposeViewController)initWithGift:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SUUIGiftComposeViewController;
  v8 = [(SUUIGiftStepViewController *)&v20 initWithGift:v6 configuration:v7];
  if (v8)
  {
    v9 = [v7 clientContext];
    v10 = v9;
    if (v9) {
      [v9 localizedStringForKey:@"GIFTING_FLOW_TITLE" inTable:@"Gifting"];
    }
    else {
    v12 = +[SUUIClientContext localizedStringForKey:@"GIFTING_FLOW_TITLE" inBundles:0 inTable:@"Gifting"];
    }
    [(SUUIGiftComposeViewController *)v8 setTitle:v12];

    v11 = [(SUUIGiftStepViewController *)v8 gift];

    v13 = [v11 senderName];

    if (!v13)
    {
      v14 = [v7 senderName];
      [v11 setSenderName:v14];
    }
    v15 = [v11 senderEmailAddress];

    if (!v15)
    {
      v16 = [v7 senderEmailAddress];
      [v11 setSenderEmailAddress:v16];
    }
    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v8 selector:sel__keyboardChangeNotification_ name:*MEMORY[0x263F837A0] object:0];
    [v17 addObserver:v8 selector:sel__keyboardChangeNotification_ name:*MEMORY[0x263F837A8] object:0];
    v18 = getCNComposeRecipientViewDidChangeNotification();
    [v17 addObserver:v8 selector:sel__recipientsDidChangeNotification_ name:v18 object:0];

    [v17 addObserver:v8 selector:sel__textFieldChangeNotification_ name:*MEMORY[0x263F83AC8] object:0];
    [v17 addObserver:v8 selector:sel__textFieldChangeNotification_ name:*MEMORY[0x263F83AD0] object:0];
    [v17 addObserver:v8 selector:sel__textViewChangeNotification_ name:*MEMORY[0x263F83BE8] object:0];
    [v17 addObserver:v8 selector:sel__textViewDidEndEditingNotification_ name:*MEMORY[0x263F83BF0] object:0];
  }
  else
  {
    v11 = v6;
  }

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = getCNComposeRecipientViewDidChangeNotification();
  [v3 removeObserver:self name:v4 object:0];

  [v3 removeObserver:self name:*MEMORY[0x263F837A0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F837A8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83AC8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83AD0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83BE8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83BF0] object:0];
  validationTimer = self->_validationTimer;
  if (validationTimer) {
    dispatch_source_cancel(validationTimer);
  }
  [(SUUIGiftAddressingSection *)self->_addressingSection setTextFieldDelegate:0];
  id v6 = [(SUUIGiftAmountSection *)self->_amountSection amountControl];
  [v6 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(UIPopoverController *)self->_peoplePickerPopover setDelegate:0];
  [(UIPopoverController *)self->_searchResultsPopover setDelegate:0];

  v7.receiver = self;
  v7.super_class = (Class)SUUIGiftComposeViewController;
  [(SUUIGiftComposeViewController *)&v7 dealloc];
}

- (void)loadView
{
  id v23 = objc_alloc_init(MEMORY[0x263F82E00]);
  -[SUUIGiftComposeViewController setView:](self, "setView:");
  if (!self->_sections) {
    [(SUUIGiftComposeViewController *)self _reloadSections];
  }
  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
    v5 = [(SUUIGiftStepViewController *)self gift];
    id v6 = [v5 item];
    double v7 = 30.0;
    if (!v6)
    {
      v8 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v9 = [v8 userInterfaceIdiom];

      if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v7 = 30.0;
      }
      else {
        double v7 = 35.0;
      }
    }

    v10 = (UITableView *)objc_alloc_init(MEMORY[0x263F82C78]);
    v11 = self->_tableView;
    self->_tableView = v10;

    [(UITableView *)self->_tableView setAutoresizingMask:18];
    [(UITableView *)self->_tableView setBackgroundColor:v4];
    -[UITableView setContentInset:](self->_tableView, "setContentInset:", v7, 0.0, 20.0, 0.0);
    [(UITableView *)self->_tableView setDataSource:self];
    [(UITableView *)self->_tableView setDelegate:self];
    [(UITableView *)self->_tableView setSeparatorStyle:0];
    v12 = [(SUUIGiftComposeViewController *)self _headerView];
    [v12 setBackgroundColor:v4];
    [(UITableView *)self->_tableView setTableHeaderView:v12];

    tableView = self->_tableView;
  }
  [v23 addSubview:tableView];
  v13 = [(SUUIGiftStepViewController *)self giftConfiguration];
  v14 = [v13 clientContext];

  v15 = [(SUUIGiftComposeViewController *)self navigationItem];
  if (v14) {
    [v14 localizedStringForKey:@"GIFTING_BACK_BUTTON" inTable:@"Gifting"];
  }
  else {
  v16 = +[SUUIClientContext localizedStringForKey:@"GIFTING_BACK_BUTTON" inBundles:0 inTable:@"Gifting"];
  }
  [v15 setBackButtonTitle:v16];

  [v15 setHidesBackButton:1];
  id v17 = objc_alloc_init(MEMORY[0x263F824A8]);
  [v17 setAction:sel__cancelAction_];
  [v17 setTarget:self];
  if (v14) {
    [v14 localizedStringForKey:@"GIFTING_CANCEL_BUTTON" inTable:@"Gifting"];
  }
  else {
  v18 = +[SUUIClientContext localizedStringForKey:@"GIFTING_CANCEL_BUTTON" inBundles:0 inTable:@"Gifting"];
  }
  [v17 setTitle:v18];

  [v15 setLeftBarButtonItem:v17];
  v19 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x263F824A8]);
  nextButton = self->_nextButton;
  self->_nextButton = v19;

  [(UIBarButtonItem *)self->_nextButton setAction:sel__nextAction_];
  [(UIBarButtonItem *)self->_nextButton setEnabled:0];
  [(UIBarButtonItem *)self->_nextButton setTarget:self];
  v21 = self->_nextButton;
  if (v14) {
    [v14 localizedStringForKey:@"GIFTING_NEXT_BUTTON" inTable:@"Gifting"];
  }
  else {
  v22 = +[SUUIClientContext localizedStringForKey:@"GIFTING_NEXT_BUTTON" inBundles:0 inTable:@"Gifting"];
  }
  [(UIBarButtonItem *)v21 setTitle:v22];

  [v15 setRightBarButtonItem:self->_nextButton];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUUIGiftComposeViewController *)self _itemView];
  id v6 = [v5 artworkContext];

  if (self->_itemImage) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 == 0;
  }
  if (!v7)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__SUUIGiftComposeViewController_viewWillAppear___block_invoke;
    v9[3] = &unk_265400BC0;
    objc_copyWeak(&v10, &location);
    [(SUUIGiftStepViewController *)self loadItemArtworkWithArtworkContext:v6 completionBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  v8.receiver = self;
  v8.super_class = (Class)SUUIGiftComposeViewController;
  [(SUUIGiftComposeViewController *)&v8 viewWillAppear:v3];
}

void __48__SUUIGiftComposeViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _setItemImage:v6 error:v5];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v14 = a4;
  if ([(NSMutableArray *)self->_sections count])
  {
    unint64_t v7 = 0;
    do
    {
      objc_super v8 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
        if ([(UITableView *)self->_tableView numberOfRowsInSection:v7])
        {
          unint64_t v10 = 0;
          do
          {
            tableView = self->_tableView;
            v12 = [MEMORY[0x263F088C8] indexPathForRow:v10 inSection:v7];
            v13 = [(UITableView *)tableView cellForRowAtIndexPath:v12];

            objc_msgSend(v9, "updateCell:forTransitionToSize:", v13, width, height);
            ++v10;
          }
          while (v10 < [(UITableView *)self->_tableView numberOfRowsInSection:v7]);
        }
      }
      ++v7;
    }
    while (v7 < [(NSMutableArray *)self->_sections count]);
  }
  v15.receiver = self;
  v15.super_class = (Class)SUUIGiftComposeViewController;
  -[SUUIGiftComposeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, v14, width, height);
}

- (void)tableView:(id)a3 giftRecipientCellDidChangeRecipients:(id)a4
{
  id v5 = a4;
  id v6 = [(SUUIGiftStepViewController *)self gift];
  unint64_t v7 = [v5 recipientAddresses];

  [v6 setRecipientAddresses:v7];
  [(SUUIGiftComposeViewController *)self _validateGiftThrottled:0];
}

- (void)tableView:(id)a3 giftRecipientCellDidChangeSize:(id)a4
{
  v4 = (void *)MEMORY[0x263F82E00];
  id v5 = a3;
  uint64_t v6 = [v4 areAnimationsEnabled];
  [MEMORY[0x263F82E00] setAnimationsEnabled:0];
  [v5 beginUpdates];
  [v5 endUpdates];

  unint64_t v7 = (void *)MEMORY[0x263F82E00];
  [v7 setAnimationsEnabled:v6];
}

- (void)tableView:(id)a3 giftRecipientCell:(id)a4 didUpdateSearchController:(id)a5
{
  id v49 = a4;
  id v7 = a5;
  if ([v7 numberOfResults])
  {
    objc_super v8 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 == 1)
    {
      if (!self->_searchResultsPopover)
      {
        id v10 = objc_alloc(MEMORY[0x263F82AA0]);
        v11 = [v7 searchResultsViewController];
        v12 = (UIPopoverController *)[v10 initWithContentViewController:v11];
        searchResultsPopover = self->_searchResultsPopover;
        self->_searchResultsPopover = v12;

        [(UIPopoverController *)self->_searchResultsPopover setDelegate:self];
        [v49 presentSearchResultsPopover:self->_searchResultsPopover animated:1];
      }
    }
    else if (!self->_searchResultsView)
    {
      v16 = [(UITableView *)self->_tableView indexPathForCell:v49];
      [(UITableView *)self->_tableView scrollToRowAtIndexPath:v16 atScrollPosition:1 animated:0];
      id v17 = [v7 searchResultsView];
      searchResultsView = self->_searchResultsView;
      self->_searchResultsView = v17;

      [(UIView *)self->_searchResultsView setAutoresizingMask:18];
      v19 = [(SUUIGiftComposeViewController *)self view];
      [v49 frame];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      v28 = [v49 superview];
      objc_msgSend(v19, "convertRect:fromView:", v28, v21, v23, v25, v27);
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;

      v37 = [MEMORY[0x263F828A0] activeKeyboard];
      [v37 frame];
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      v46 = [v37 superview];
      objc_msgSend(v19, "convertRect:fromView:", v46, v39, v41, v43, v45);

      double v47 = *MEMORY[0x263F001A8];
      v51.origin.x = v30;
      v51.origin.y = v32;
      v51.size.double width = v34;
      v51.size.double height = v36;
      CGFloat v48 = CGRectGetMaxY(v51) + -1.0;
      [v19 bounds];
      -[UIView setFrame:](self->_searchResultsView, "setFrame:", v47, v48);
      [v19 addSubview:self->_searchResultsView];
      [(UITableView *)self->_tableView setScrollEnabled:0];
    }
  }
  else
  {
    if (self->_searchResultsView)
    {
      [(UITableView *)self->_tableView setScrollEnabled:1];
      [(UIView *)self->_searchResultsView removeFromSuperview];
      id v14 = self->_searchResultsView;
      self->_searchResultsView = 0;
    }
    [(UIPopoverController *)self->_searchResultsPopover dismissPopoverAnimated:1];
    [(UIPopoverController *)self->_searchResultsPopover setDelegate:0];
    objc_super v15 = self->_searchResultsPopover;
    self->_searchResultsPopover = 0;
  }
}

- (void)tableView:(id)a3 giftRecipientCell:(id)a4 dismissContactPicker:(id)a5
{
  peoplePickerPopover = self->_peoplePickerPopover;
  if (peoplePickerPopover)
  {
    -[UIPopoverController dismissPopoverAnimated:](peoplePickerPopover, "dismissPopoverAnimated:", 1, a4, a5);
    [(UIPopoverController *)self->_peoplePickerPopover setDelegate:0];
    id v7 = self->_peoplePickerPopover;
    self->_peoplePickerPopover = 0;
  }
  else
  {
    [a5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)tableView:(id)a3 giftRecipientCell:(id)a4 presentContactPicker:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  objc_super v8 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v9)
  {
    if (!self->_peoplePickerPopover)
    {
      id v10 = (UIPopoverController *)[objc_alloc(MEMORY[0x263F82AA0]) initWithContentViewController:v7];
      peoplePickerPopover = self->_peoplePickerPopover;
      self->_peoplePickerPopover = v10;

      [(UIPopoverController *)self->_peoplePickerPopover setDelegate:self];
      [v12 presentPeoplePickerPopover:self->_peoplePickerPopover animated:1];
    }
  }
  else
  {
    [(SUUIGiftComposeViewController *)self presentViewController:v7 animated:1 completion:0];
  }
}

- (void)giftSendDateSection:(id)a3 didChangeDate:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SUUIGiftStepViewController *)self gift];
  [v6 setDeliveryDate:v5];

  [(SUUIGiftComposeViewController *)self _validateGiftThrottled:1];
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  v4 = (UIPopoverController *)a3;
  p_peoplePickerPopover = &self->_peoplePickerPopover;
  if (self->_peoplePickerPopover == v4
    || (p_peoplePickerPopover = &self->_searchResultsPopover, self->_searchResultsPopover == v4))
  {
    id v7 = v4;
    [(UIPopoverController *)v4 setDelegate:0];
    uint64_t v6 = *p_peoplePickerPopover;
    *p_peoplePickerPopover = 0;

    v4 = v7;
  }
}

- (BOOL)popoverControllerShouldDismissPopover:(id)a3
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_sections count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [v6 section]);
  uint64_t v9 = [v8 tableViewCellForTableView:v7 indexPath:v6];

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(NSMutableArray *)self->_sections objectAtIndex:a4];
  int64_t v5 = [v4 numberOfRowsInSection];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v5 = [v6 section];
  if (v5 == [(SUUITableViewSection *)self->_addressingSection sectionIndex]
    && [v6 row] == 2)
  {
    [(SUUIGiftAddressingSection *)self->_addressingSection beginEditingMessageForTableView:self->_tableView indexPath:v6];
  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  sections = self->_sections;
  id v6 = a3;
  id v7 = [(NSMutableArray *)sections objectAtIndex:a4];
  objc_super v8 = [v7 headerViewForTableView:v6];

  if (v8)
  {
    [v8 frame];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [v6 section]);
  [v8 heightForCellInTableView:v7 indexPath:v6];
  double v10 = v9;

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  sections = self->_sections;
  id v6 = a3;
  id v7 = [(NSMutableArray *)sections objectAtIndex:a4];
  objc_super v8 = [v7 headerViewForTableView:v6];
  double v9 = [v6 backgroundColor];

  [v8 setBackgroundColor:v9];
  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  sections = self->_sections;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [v8 section]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 tableView:v10 willDisplayCell:v9 forIndexPath:v8];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  tableView = self->_tableView;
  [v4 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [v4 superview];
  -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", v14, v7, v9, v11, v13);
  double v16 = v15;

  id v17 = [(UITableView *)self->_tableView subviews];
  v18 = (void *)[v17 mutableCopy];

  uint64_t v19 = [v18 count];
  if (v19 < 1)
  {
    id v21 = 0;
  }
  else
  {
    uint64_t v20 = v19;
    id v21 = 0;
    uint64_t v22 = 0;
    double v23 = *(double *)(MEMORY[0x263F001A8] + 8);
    do
    {
      id v24 = [v18 objectAtIndex:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        if (v24 != v4)
        {
          if ([v24 canBecomeFirstResponder])
          {
            double v25 = self->_tableView;
            [v24 frame];
            double v27 = v26;
            double v29 = v28;
            double v31 = v30;
            double v33 = v32;
            CGFloat v34 = [v24 superview];
            -[UITableView convertRect:fromView:](v25, "convertRect:fromView:", v34, v27, v29, v31, v33);
            double v36 = v35;

            if (v36 > v16)
            {
              if (v21)
              {
                if (v36 - v16 < v23 - v16)
                {
                  id v37 = v24;

                  double v23 = v36;
                  id v21 = v37;
                }
              }
              else
              {
                id v21 = v24;
                double v23 = v36;
              }
            }
          }
        }
      }
      else
      {
        double v38 = [v24 subviews];
        if (v38)
        {
          [v18 addObjectsFromArray:v38];
          uint64_t v20 = [v18 count];
        }
      }
      ++v22;
    }
    while (v22 < v20);
    if (v21) {
      [v21 becomeFirstResponder];
    }
  }

  return 1;
}

- (void)_amountControlAction:(id)a3
{
  id v5 = [(SUUIGiftStepViewController *)self gift];
  objc_msgSend(v5, "setGiftAmount:", -[SUUIGiftAmountSection selectedAmount](self->_amountSection, "selectedAmount"));
  id v4 = [(SUUIGiftAmountSection *)self->_amountSection selectedAmountString];
  [v5 setGiftAmountString:v4];

  [(SUUIGiftComposeViewController *)self _validateGiftThrottled:0];
}

- (void)_cancelAction:(id)a3
{
}

- (void)_nextAction:(id)a3
{
  id v6 = a3;
  id v4 = [(SUUIGiftComposeViewController *)self view];
  id v5 = [v4 firstResponder];
  [v5 resignFirstResponder];

  UIKeyboardOrderOutAutomatic();
  if (self->_validationTimer || [(SUUIGiftValidator *)self->_validator isValidating])
  {
    self->_tappedNextWhileValidating = 1;
    [v6 setEnabled:0];
    [(UITableView *)self->_tableView setEnabled:0];
    if (self->_validationTimer) {
      [(SUUIGiftComposeViewController *)self _validateGift];
    }
  }
  else
  {
    [(SUUIGiftComposeViewController *)self _pushThemePickerOrShowInvalidAlert];
  }
}

- (void)_keyboardChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v35 = [v4 objectForKey:*MEMORY[0x263F837B8]];

  id v5 = v35;
  if (v35)
  {
    id v6 = [(UITableView *)self->_tableView superview];
    [v35 CGRectValue];
    objc_msgSend(v6, "convertRect:fromView:", 0);
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    [(UITableView *)self->_tableView frame];
    v39.origin.x = v8;
    v39.origin.y = v10;
    v39.size.double width = v12;
    v39.size.double height = v14;
    CGRect v38 = CGRectIntersection(v37, v39);
    [(UITableView *)self->_tableView contentInset];
    -[UITableView setContentInset:](self->_tableView, "setContentInset:");
    [(UITableView *)self->_tableView scrollIndicatorInsets];
    -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:");
    double v15 = [(SUUIGiftComposeViewController *)self view];
    double v16 = [v15 window];
    id v17 = [v16 firstResponder];

    v18 = [v17 _SUUIView];
    uint64_t v19 = v18;
    if (v18 && [v18 isDescendantOfView:self->_tableView])
    {
      tableView = self->_tableView;
      [v19 frame];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v29 = [v19 superview];
      -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", v29, v22, v24, v26, v28);
      double v31 = v30;
      double v33 = v32;

      CGFloat v34 = -[UITableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:", v31, v33);
      if (v34) {
        [(UITableView *)self->_tableView scrollToRowAtIndexPath:v34 atScrollPosition:1 animated:1];
      }
    }
    id v5 = v35;
  }
}

- (void)_recipientsDidChangeNotification:(id)a3
{
  id v27 = [a3 object];
  id v4 = [(SUUIGiftComposeViewController *)self view];
  int v5 = [v27 isDescendantOfView:v4];

  id v6 = v27;
  if (v5)
  {
    tableView = self->_tableView;
    [v27 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [v27 superview];
    -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", v16, v9, v11, v13, v15);
    double v18 = v17;
    double v20 = v19;

    double v21 = -[UITableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:", v18, v20);
    double v22 = v21;
    if (v21)
    {
      uint64_t v23 = [v21 section];
      if (v23 == [(SUUITableViewSection *)self->_addressingSection sectionIndex])
      {
        double v24 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v22];
        double v25 = [(SUUIGiftStepViewController *)self gift];
        double v26 = [v24 recipientAddresses];
        [v25 setRecipientAddresses:v26];

        [(SUUIGiftComposeViewController *)self _validateGiftThrottled:0];
      }
    }

    id v6 = v27;
  }
}

- (void)_textFieldChangeNotification:(id)a3
{
  id v27 = a3;
  id v4 = [v27 object];
  int v5 = [(SUUIGiftComposeViewController *)self view];
  int v6 = [v4 isDescendantOfView:v5];

  if (v6)
  {
    tableView = self->_tableView;
    [v4 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [v4 superview];
    -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", v16, v9, v11, v13, v15);
    double v18 = v17;
    double v20 = v19;

    double v21 = -[UITableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:", v18, v20);
    double v22 = v21;
    if (v21)
    {
      uint64_t v23 = [v21 section];
      if (v23 == [(SUUITableViewSection *)self->_addressingSection sectionIndex])
      {
        double v24 = [v4 text];
        if (![v24 length])
        {

          double v24 = 0;
        }
        if ([v22 row] == 1)
        {
          double v25 = [(SUUIGiftStepViewController *)self gift];
          [v25 setSenderName:v24];
        }
        double v26 = [v27 name];
        -[SUUIGiftComposeViewController _validateGiftThrottled:](self, "_validateGiftThrottled:", [v26 isEqualToString:*MEMORY[0x263F83AC8]]);
      }
    }
  }
}

- (void)_textViewChangeNotification:(id)a3
{
  id v9 = [a3 object];
  id v4 = [(SUUIGiftAddressingSection *)self->_addressingSection messagingTextView];

  int v5 = v9;
  if (v9 == v4)
  {
    int v6 = [v9 text];
    double v7 = [(SUUIGiftStepViewController *)self gift];
    if ([v6 length]) {
      double v8 = v6;
    }
    else {
      double v8 = 0;
    }
    [v7 setMessage:v8];

    int v5 = v9;
  }
}

- (void)_textViewDidEndEditingNotification:(id)a3
{
  id v20 = [a3 object];
  id v4 = [(SUUIGiftAddressingSection *)self->_addressingSection messagingTextView];

  int v5 = v20;
  if (v20 == v4)
  {
    int v6 = [v20 text];
    double v7 = [(SUUIGiftStepViewController *)self gift];
    if ([v6 length]) {
      double v8 = v6;
    }
    else {
      double v8 = 0;
    }
    [v7 setMessage:v8];

    tableView = self->_tableView;
    [v20 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v18 = [v20 superview];
    -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", v18, v11, v13, v15, v17);
    double v19 = -[UITableView indexPathForRowAtPoint:](tableView, "indexPathForRowAtPoint:");

    [(SUUIGiftAddressingSection *)self->_addressingSection endEditingMessageForTableView:self->_tableView indexPath:v19];
    int v5 = v20;
  }
}

- (void)_finishValidationWithResponse:(id)a3 error:(id)a4
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_lastValidationResponse, a3);
  int v6 = [(SUUIGiftStepViewController *)self gift];
  double v7 = [(SUUIGiftValidationResponse *)self->_lastValidationResponse totalGiftAmountString];
  [v6 setTotalGiftAmountString:v7];

  if (self->_tappedNextWhileValidating)
  {
    self->_tappedNextWhileValidating = 0;
    [(SUUIGiftComposeViewController *)self _pushThemePickerOrShowInvalidAlert];
  }
  [(UITableView *)self->_tableView setEnabled:1];
}

- (id)_headerView
{
  BOOL v3 = [(SUUIGiftStepViewController *)self gift];
  id v4 = [v3 item];

  if (v4)
  {
    int v5 = [(SUUIGiftComposeViewController *)self _itemView];
  }
  else
  {
    int v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = objc_alloc(MEMORY[0x263F82828]);
    id v8 = [MEMORY[0x263F827E8] imageNamed:@"GiftCardGraphic" inBundle:v6];
    int v5 = (void *)[v7 initWithImage:v8];

    [v5 setContentMode:4];
  }

  return v5;
}

- (id)_itemImage
{
  BOOL v3 = self->_itemImage;
  if (!v3)
  {
    id v4 = [(SUUIGiftItemView *)self->_itemView artworkContext];
    int v5 = [(SUUIGiftStepViewController *)self gift];
    int v6 = [v5 item];
    BOOL v3 = [v4 placeholderImageForItem:v6];
  }
  return v3;
}

- (id)_itemView
{
  BOOL v3 = [(SUUIGiftStepViewController *)self gift];
  id v4 = [v3 item];

  itemView = self->_itemView;
  if (itemView) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    id v7 = [SUUIGiftItemView alloc];
    id v8 = [(SUUIGiftStepViewController *)self giftConfiguration];
    id v9 = [v8 clientContext];
    double v10 = [(SUUIGiftItemView *)v7 initWithStyle:0 item:v4 clientContext:v9];
    double v11 = self->_itemView;
    self->_itemView = v10;

    [(SUUIGiftItemView *)self->_itemView setAutoresizingMask:2];
    double v12 = self->_itemView;
    double v13 = [v4 artistName];
    [(SUUIGiftItemView *)v12 setArtistName:v13];

    double v14 = self->_itemView;
    double v15 = [v4 categoryName];
    [(SUUIGiftItemView *)v14 setCategoryName:v15];

    double v16 = self->_itemView;
    double v17 = [(SUUIGiftComposeViewController *)self _itemImage];
    [(SUUIGiftItemView *)v16 setItemImage:v17];

    -[SUUIGiftItemView setNumberOfUserRatings:](self->_itemView, "setNumberOfUserRatings:", [v4 numberOfUserRatings]);
    double v18 = self->_itemView;
    double v19 = [v4 primaryItemOffer];
    id v20 = [v19 buttonText];
    [(SUUIGiftItemView *)v18 setPrice:v20];

    double v21 = self->_itemView;
    double v22 = [v4 title];
    [(SUUIGiftItemView *)v21 setTitle:v22];

    uint64_t v23 = self->_itemView;
    [v4 userRating];
    *(float *)&double v25 = v24 / 5.0;
    [(SUUIGiftItemView *)v23 setUserRating:v25];
    [(SUUIGiftItemView *)self->_itemView sizeToFit];
    itemView = self->_itemView;
  }
  double v26 = itemView;

  return v26;
}

- (void)_pushThemePickerOrShowInvalidAlert
{
  if ([(SUUIGiftValidationResponse *)self->_lastValidationResponse isValid])
  {
    id v15 = [(SUUIGiftStepViewController *)self gift];
    BOOL v3 = [SUUIGiftThemePickerViewController alloc];
    id v4 = [(SUUIGiftStepViewController *)self giftConfiguration];
    int v5 = [(SUUIGiftThemePickerViewController *)v3 initWithGift:v15 configuration:v4];

    BOOL v6 = [(SUUIGiftStepViewController *)self operationQueue];
    [(SUUIGiftStepViewController *)v5 setOperationQueue:v6];

    id v7 = [(SUUIGiftComposeViewController *)self navigationController];
    [v7 pushViewController:v5 animated:1];
  }
  else
  {
    id v8 = [(SUUIGiftStepViewController *)self giftConfiguration];
    id v15 = [v8 clientContext];

    id v9 = (void *)MEMORY[0x263F82418];
    if (v15) {
      [v15 localizedStringForKey:@"GIFTING_INVALID_GIFT" inTable:@"Gifting"];
    }
    else {
    double v10 = +[SUUIClientContext localizedStringForKey:@"GIFTING_INVALID_GIFT" inBundles:0 inTable:@"Gifting"];
    }
    double v11 = [(SUUIGiftValidationResponse *)self->_lastValidationResponse errorString];
    int v5 = [v9 alertControllerWithTitle:v10 message:v11 preferredStyle:1];

    double v12 = (void *)MEMORY[0x263F82400];
    if (v15) {
      [v15 localizedStringForKey:@"GIFTING_OK_BUTTON" inTable:@"Gifting"];
    }
    else {
    double v13 = +[SUUIClientContext localizedStringForKey:@"GIFTING_OK_BUTTON" inBundles:0 inTable:@"Gifting"];
    }
    double v14 = [v12 actionWithTitle:v13 style:0 handler:0];
    [(SUUIGiftThemePickerViewController *)v5 addAction:v14];

    [(SUUIGiftComposeViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)_reloadSections
{
  id v24 = [(SUUIGiftStepViewController *)self gift];
  BOOL v3 = [(SUUIGiftStepViewController *)self giftConfiguration];
  id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  sections = self->_sections;
  self->_sections = v4;

  addressingSection = self->_addressingSection;
  if (!addressingSection)
  {
    id v7 = [[SUUIGiftAddressingSection alloc] initWithGiftConfiguration:v3];
    id v8 = self->_addressingSection;
    self->_addressingSection = v7;

    [(SUUIGiftAddressingSection *)self->_addressingSection setGift:v24];
    [(SUUIGiftAddressingSection *)self->_addressingSection setTextFieldDelegate:self];
    addressingSection = self->_addressingSection;
  }
  [(SUUITableViewSection *)addressingSection setSectionIndex:[(NSMutableArray *)self->_sections count]];
  [(NSMutableArray *)self->_sections addObject:self->_addressingSection];
  id v9 = [v24 item];

  if (!v9)
  {
    amountSection = self->_amountSection;
    if (!amountSection)
    {
      double v11 = [(SUUIGiftTableViewSection *)[SUUIGiftAmountSection alloc] initWithGiftConfiguration:v3];
      double v12 = self->_amountSection;
      self->_amountSection = v11;

      double v13 = [(SUUIGiftAmountSection *)self->_amountSection amountControl];
      [v13 addTarget:self action:sel__amountControlAction_ forControlEvents:4096];

      amountSection = self->_amountSection;
    }
    [(SUUITableViewSection *)amountSection setSectionIndex:[(NSMutableArray *)self->_sections count]];
    [(NSMutableArray *)self->_sections addObject:self->_amountSection];
  }
  sendDateSection = self->_sendDateSection;
  if (!sendDateSection)
  {
    id v15 = [(SUUIGiftTableViewSection *)[SUUIGiftSendDateSection alloc] initWithGiftConfiguration:v3];
    double v16 = self->_sendDateSection;
    self->_sendDateSection = v15;

    double v17 = self->_sendDateSection;
    double v18 = [MEMORY[0x263EFF910] now];
    [(SUUIGiftSendDateSection *)v17 setSendDate:v18];

    double v19 = self->_sendDateSection;
    id v20 = [v24 item];
    [(SUUIGiftSendDateSection *)v19 setGiftItem:v20];

    [(SUUIGiftSendDateSection *)self->_sendDateSection setDelegate:self];
    sendDateSection = self->_sendDateSection;
  }
  [(SUUITableViewSection *)sendDateSection setSectionIndex:[(NSMutableArray *)self->_sections count]];
  [(NSMutableArray *)self->_sections addObject:self->_sendDateSection];
  termsSection = self->_termsSection;
  if (!termsSection)
  {
    double v22 = [(SUUIGiftTableViewSection *)[SUUIGiftTermsAndConditionsSection alloc] initWithGiftConfiguration:v3];
    uint64_t v23 = self->_termsSection;
    self->_termsSection = v22;

    termsSection = self->_termsSection;
  }
  [(NSMutableArray *)self->_sections addObject:termsSection];
}

- (void)_setItemImage:(id)a3 error:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)&self->_itemImage, a3);
    [(SUUIGiftItemView *)self->_itemView setItemImage:self->_itemImage];
    id v6 = v7;
  }
}

- (void)_validateGift
{
  validationTimer = self->_validationTimer;
  if (validationTimer)
  {
    dispatch_source_cancel(validationTimer);
    id v4 = self->_validationTimer;
    self->_validationTimer = 0;
  }
  if (!self->_validator)
  {
    int v5 = [(SUUIGiftStepViewController *)self giftConfiguration];
    id v6 = [SUUIGiftValidator alloc];
    id v7 = [v5 giftValidationURL];
    id v8 = [v5 clientContext];
    id v9 = [(SUUIGiftValidator *)v6 initWithValidationURL:v7 clientContext:v8];
    validator = self->_validator;
    self->_validator = v9;

    double v11 = self->_validator;
    double v12 = [(SUUIGiftStepViewController *)self operationQueue];
    [(SUUIGiftValidator *)v11 setOperationQueue:v12];
  }
  objc_initWeak(&location, self);
  double v13 = self->_validator;
  double v14 = [(SUUIGiftStepViewController *)self gift];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__SUUIGiftComposeViewController__validateGift__block_invoke;
  v15[3] = &unk_265403A68;
  objc_copyWeak(&v16, &location);
  [(SUUIGiftValidator *)v13 validateGift:v14 withCompletionBlock:v15];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __46__SUUIGiftComposeViewController__validateGift__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUUIGiftComposeViewController__validateGift__block_invoke_2;
  block[3] = &unk_2654012C8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __46__SUUIGiftComposeViewController__validateGift__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishValidationWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_validateGiftThrottled:(BOOL)a3
{
  id v5 = [(SUUIGiftStepViewController *)self gift];
  id v6 = v5;
  if ((!self->_amountSection || [v5 giftAmount])
    && ([v6 recipientAddresses],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8))
  {
    id v9 = [v6 senderName];
    BOOL v10 = [v9 length] != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  id v11 = [(SUUIGiftComposeViewController *)self nextButton];
  [v11 setEnabled:v10];

  [(SUUIGiftValidator *)self->_validator cancelValidation];
  if (!v10 || !a3)
  {
    validationTimer = self->_validationTimer;
    if (validationTimer)
    {
      dispatch_source_cancel(validationTimer);
      double v13 = self->_validationTimer;
      self->_validationTimer = 0;
    }
  }
  if (v10)
  {
    if (a3)
    {
      double v14 = self->_validationTimer;
      if (v14)
      {
        dispatch_time_t v15 = dispatch_time(0, 1000000000);
        dispatch_source_set_timer(v14, v15, 0, 0);
      }
      else
      {
        id v16 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
        double v17 = self->_validationTimer;
        self->_validationTimer = v16;

        double v18 = self->_validationTimer;
        dispatch_time_t v19 = dispatch_time(0, 1000000000);
        dispatch_source_set_timer(v18, v19, 0, 0);
        objc_initWeak(&location, self);
        id v20 = self->_validationTimer;
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __56__SUUIGiftComposeViewController__validateGiftThrottled___block_invoke;
        v21[3] = &unk_265401538;
        objc_copyWeak(&v22, &location);
        dispatch_source_set_event_handler(v20, v21);
        dispatch_resume((dispatch_object_t)self->_validationTimer);
        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      [(SUUIGiftComposeViewController *)self _validateGift];
    }
  }
}

void __56__SUUIGiftComposeViewController__validateGiftThrottled___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _validateGift];
}

- (UIBarButtonItem)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_searchResultsPopover, 0);
  objc_storeStrong((id *)&self->_peoplePickerPopover, 0);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_validationTimer, 0);
  objc_storeStrong((id *)&self->_termsSection, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_showDatePickerIndexPathAfterKeyboardDismiss, 0);
  objc_storeStrong((id *)&self->_sendDateSection, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_searchResultsView, 0);
  objc_storeStrong((id *)&self->_lastValidationResponse, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_itemImage, 0);
  objc_storeStrong((id *)&self->_amountSection, 0);
  objc_storeStrong((id *)&self->_addressingSection, 0);
}

@end
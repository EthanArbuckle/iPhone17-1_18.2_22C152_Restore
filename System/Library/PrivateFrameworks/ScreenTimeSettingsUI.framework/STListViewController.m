@interface STListViewController
- (BOOL)shouldReloadSpecifiersOnResume;
- (NSArray)specifierProviders;
- (NSMutableDictionary)cellHeightBySpecifierIdentifier;
- (STListViewController)init;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)visibleSpecifierProviders;
- (void)addObserversForSpecifierProvider:(id)a3;
- (void)dealloc;
- (void)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserversForSpecifierProvider:(id)a3;
- (void)setCellHeightBySpecifierIdentifier:(id)a3;
- (void)setSpecifierProviders:(id)a3;
- (void)specifierProvider:(id)a3 dismissViewControllerAnimated:(BOOL)a4;
- (void)specifierProvider:(id)a3 lazyLoadBundle:(id)a4;
- (void)specifierProvider:(id)a3 popToViewControllerAnimated:(BOOL)a4;
- (void)specifierProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5;
- (void)specifierProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)specifierProvider:(id)a3 reloadSectionHeaderFootersWithAnimation:(int64_t)a4;
- (void)specifierProvider:(id)a3 reloadSpecifier:(id)a4 animated:(BOOL)a5;
- (void)specifierProvider:(id)a3 showConfirmationViewForSpecifier:(id)a4;
- (void)specifierProvider:(id)a3 showController:(id)a4 animated:(BOOL)a5;
- (void)specifierProvider:(id)a3 showPINSheet:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation STListViewController

- (STListViewController)init
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v8.receiver = self;
    v8.super_class = (Class)STListViewController;
    v3 = [(STListViewController *)&v8 init];
    if (v3)
    {
      uint64_t v4 = objc_opt_new();
      cellHeightBySpecifierIdentifier = v3->_cellHeightBySpecifierIdentifier;
      v3->_cellHeightBySpecifierIdentifier = (NSMutableDictionary *)v4;
    }
    self = v3;
    v6 = self;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[STListViewController init]();
    }
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(STListViewController *)self specifierProviders];
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
        objc_super v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [(STListViewController *)self removeObserversForSpecifierProvider:v8];
        [v8 invalidate];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)STListViewController;
  [(STListViewController *)&v9 dealloc];
}

- (void)setSpecifierProviders:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [(STListViewController *)self addObserversForSpecifierProvider:v9];
        [v9 setDelegate:self];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  long long v10 = (NSArray *)[v4 copy];
  specifierProviders = self->_specifierProviders;
  self->_specifierProviders = v10;
}

- (id)visibleSpecifierProviders
{
  v2 = [(STListViewController *)self specifierProviders];
  v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"isHidden", MEMORY[0x263EFFA80]];
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [(STListViewController *)self specifierProviders];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (([v11 isHidden] & 1) == 0)
          {
            long long v12 = [v11 groupSpecifier];
            [v5 addObject:v12];

            long long v13 = [v11 specifiers];
            [v5 addObjectsFromArray:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    long long v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)addObserversForSpecifierProvider:(id)a3
{
  id v4 = a3;
  [v4 addObserver:self forKeyPath:@"isHidden" options:0 context:"STListViewControllerObservationContext"];
  [v4 addObserver:self forKeyPath:@"specifiers" options:3 context:"STListViewControllerObservationContext"];
}

- (void)removeObserversForSpecifierProvider:(id)a3
{
  id v4 = a3;
  [v4 removeObserver:self forKeyPath:@"specifiers" context:"STListViewControllerObservationContext"];
  [v4 removeObserver:self forKeyPath:@"isHidden" context:"STListViewControllerObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v63[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6 != "STListViewControllerObservationContext")
  {
    v61.receiver = self;
    v61.super_class = (Class)STListViewController;
    [(STListViewController *)&v61 observeValueForKeyPath:v11 ofObject:v12 change:v13 context:a6];
    goto LABEL_37;
  }
  if ([v11 isEqualToString:@"isHidden"])
  {
    id v14 = v12;
    long long v15 = [v14 groupSpecifier];
    v63[0] = v15;
    long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:1];
    long long v17 = [v14 specifiers];
    long long v18 = [v16 arrayByAddingObjectsFromArray:v17];

    if ([v14 isHidden])
    {
      [(STListViewController *)self beginUpdates];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v50 objects:v62 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v51 != v21) {
              objc_enumerationMutation(v19);
            }
            [(STListViewController *)self removeSpecifier:*(void *)(*((void *)&v50 + 1) + 8 * i) animated:1];
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v50 objects:v62 count:16];
        }
        while (v20);
      }

      [(STListViewController *)self endUpdates];
    }
    else
    {
      v30 = [(STListViewController *)self specifierProviders];
      uint64_t v31 = [v30 indexOfObject:v14];
      uint64_t v32 = v31;
      uint64_t v55 = 0;
      v56 = &v55;
      uint64_t v57 = 0x3032000000;
      v58 = __Block_byref_object_copy__3;
      v59 = __Block_byref_object_dispose__3;
      id v60 = 0;
      if (!v31) {
        goto LABEL_27;
      }
      if (v31 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v38 = [MEMORY[0x263F08690] currentHandler];
        [v38 handleFailureInMethod:a2, self, @"STListViewController.m", 115, @"Unknown specifierProvider: %@ is not in: %@", v14, v30 object file lineNumber description];
      }
      v33 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", 0, v32);
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __71__STListViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v54[3] = &unk_264767E10;
      v54[4] = &v55;
      [v30 enumerateObjectsAtIndexes:v33 options:2 usingBlock:v54];

      uint64_t v34 = v56[5];
      if (v34) {
        [(STListViewController *)self insertContiguousSpecifiers:v18 afterSpecifier:v34 animated:1];
      }
      else {
LABEL_27:
      }
        [(STListViewController *)self insertContiguousSpecifiers:v18 atIndex:0 animated:1];
      _Block_object_dispose(&v55, 8);
    }
    goto LABEL_37;
  }
  if (![v11 isEqualToString:@"specifiers"]) {
    goto LABEL_37;
  }
  id v23 = v12;
  if ([v23 isHidden])
  {
LABEL_31:

    goto LABEL_37;
  }
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]))
  {
    id v35 = [(STListViewController *)self specifiers];
    goto LABEL_31;
  }
  v24 = [v23 specifiers];
  v25 = [v23 groupSpecifier];
  uint64_t v26 = [(STListViewController *)self indexOfSpecifier:v25];

  v27 = [v13 objectForKeyedSubscript:*MEMORY[0x263F081B0]];
  uint64_t v28 = [v27 unsignedIntegerValue];

  v29 = [v13 objectForKeyedSubscript:*MEMORY[0x263F081A8]];
  switch(v28)
  {
    case 4:
      v36 = [v13 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      v37 = [v13 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      [(STListViewController *)self replaceContiguousSpecifiers:v36 withSpecifiers:v37 animated:1];

      break;
    case 3:
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v44 = [MEMORY[0x263F08690] currentHandler];
        v42 = [v23 groupSpecifier];
        v40 = [(STListViewController *)self specifiers];
        [v44 handleFailureInMethod:a2, self, @"STListViewController.m", 173, @"Unknown removed provider: %@ whose group specifier: %@ is not in: %@", v23, v42, v40 object file lineNumber description];
      }
      [(STListViewController *)self beginUpdates];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __71__STListViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
      v45[3] = &unk_264767E60;
      v45[4] = self;
      v45[5] = v26 + 1;
      [v29 enumerateRangesWithOptions:2 usingBlock:v45];
      [(STListViewController *)self endUpdates];
      break;
    case 2:
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v43 = [MEMORY[0x263F08690] currentHandler];
        v41 = [v23 groupSpecifier];
        v39 = [(STListViewController *)self specifiers];
        [v43 handleFailureInMethod:a2, self, @"STListViewController.m", 160, @"Unknown added provider: %@ whose group specifier: %@ is not in: %@", v23, v41, v39 object file lineNumber description];
      }
      [(STListViewController *)self beginUpdates];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __71__STListViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v46[3] = &unk_264767E38;
      id v47 = v24;
      v48 = self;
      uint64_t v49 = v26 + 1;
      [v29 enumerateRangesUsingBlock:v46];
      [(STListViewController *)self endUpdates];

      break;
  }

LABEL_37:
}

uint64_t __71__STListViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v6 = [v12 isHidden];
  id v7 = v12;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = [v12 specifiers];
    uint64_t v9 = [v8 lastObject];
    long long v10 = v9;
    if (!v9)
    {
      long long v10 = [v12 groupSpecifier];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v10);
    if (!v9) {

    }
    *a4 = 1;
    id v7 = v12;
  }

  return MEMORY[0x270F9A758](v6, v7);
}

void __71__STListViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", a2, a3);
  uint64_t v5 = [*(id *)(a1 + 32) objectsAtIndexes:v6];
  [*(id *)(a1 + 40) insertContiguousSpecifiers:v5 atIndex:*(void *)(a1 + 48) + a2 animated:1];
}

void __71__STListViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", *(void *)(a1 + 40) + a2, a3);
  id v4 = [*(id *)(a1 + 32) specifiers];
  uint64_t v5 = [v4 objectsAtIndexes:v6];

  [*(id *)(a1 + 32) removeContiguousSpecifiers:v5 animated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)STListViewController;
  uint64_t v5 = [(STListViewController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setParentViewController:self];
  }

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  id v20 = [(STListViewController *)self specifierAtIndexPath:a5];
  uint64_t v8 = NSNumber;
  [v7 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v22.origin.x = v10;
  v22.origin.y = v12;
  v22.size.width = v14;
  v22.size.height = v16;
  long long v17 = [v8 numberWithDouble:CGRectGetHeight(v22)];
  long long v18 = [(STListViewController *)self cellHeightBySpecifierIdentifier];
  id v19 = [v20 identifier];
  [v18 setObject:v17 forKeyedSubscript:v19];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)STListViewController;
  [(STListViewController *)&v17 tableView:a3 estimatedHeightForRowAtIndexPath:v6];
  double v8 = v7;
  double v9 = *MEMORY[0x263F839B8];
  if (v7 == *MEMORY[0x263F839B8])
  {
    CGFloat v10 = [(STListViewController *)self specifierAtIndexPath:v6];
    double v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F602B0]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CGFloat v12 = [(STListViewController *)self cellHeightBySpecifierIdentifier];
      double v13 = [v10 identifier];
      CGFloat v14 = [v12 objectForKeyedSubscript:v13];

      if (v14)
      {
        [v14 doubleValue];
        double v9 = v15;
      }
    }
    double v8 = v9;
  }

  return v8;
}

- (void)specifierProvider:(id)a3 showController:(id)a4 animated:(BOOL)a5
{
}

- (void)specifierProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)specifierProvider:(id)a3 dismissViewControllerAnimated:(BOOL)a4
{
}

- (void)specifierProvider:(id)a3 reloadSpecifier:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  double v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F602B0]];
  double v9 = [v8 contentView];
  [v9 frame];
  double v11 = ceil(v10);
  double v13 = ceil(v12);

  [(STListViewController *)self reloadSpecifier:v7 animated:v5];
  CGFloat v14 = [v8 contentView];
  objc_msgSend(v14, "systemLayoutSizeFittingSize:", v11, *(double *)(MEMORY[0x263F83810] + 8));
  double v16 = ceil(v15);

  if (v8) {
    BOOL v17 = v13 == v16;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    long long v18 = [NSNumber numberWithDouble:v16];
    id v19 = [(STListViewController *)self cellHeightBySpecifierIdentifier];
    id v20 = [v7 identifier];
    [v19 setObject:v18 forKeyedSubscript:v20];

    if (v5)
    {
      [(STListViewController *)self beginUpdates];
      [(STListViewController *)self endUpdates];
    }
    else
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __67__STListViewController_specifierProvider_reloadSpecifier_animated___block_invoke;
      v21[3] = &unk_264766F30;
      v21[4] = self;
      [MEMORY[0x263F82E00] performWithoutAnimation:v21];
    }
  }
}

uint64_t __67__STListViewController_specifierProvider_reloadSpecifier_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) beginUpdates];
  v2 = *(void **)(a1 + 32);

  return [v2 endUpdates];
}

- (void)specifierProvider:(id)a3 reloadSectionHeaderFootersWithAnimation:(int64_t)a4
{
  uint64_t v11 = 0;
  id v6 = [a3 groupSpecifier];
  int v7 = [(STListViewController *)self getGroup:&v11 row:0 ofSpecifier:v6];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F088D0]);
    double v9 = (void *)[v8 initWithIndex:v11];
    double v10 = [(STListViewController *)self table];
    [v10 _reloadSectionHeaderFooters:v9 withRowAnimation:a4];
  }
}

- (void)specifierProvider:(id)a3 showConfirmationViewForSpecifier:(id)a4
{
}

- (void)specifierProvider:(id)a3 popToViewControllerAnimated:(BOOL)a4
{
}

- (void)specifierProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
}

- (void)specifierProvider:(id)a3 lazyLoadBundle:(id)a4
{
}

- (void)specifierProvider:(id)a3 showPINSheet:(id)a4
{
}

- (NSArray)specifierProviders
{
  return self->_specifierProviders;
}

- (NSMutableDictionary)cellHeightBySpecifierIdentifier
{
  return self->_cellHeightBySpecifierIdentifier;
}

- (void)setCellHeightBySpecifierIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellHeightBySpecifierIdentifier, 0);

  objc_storeStrong((id *)&self->_specifierProviders, 0);
}

- (void)init
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "You shouldn't instantiate this STListViewController from a background thread", v0, 2u);
}

@end
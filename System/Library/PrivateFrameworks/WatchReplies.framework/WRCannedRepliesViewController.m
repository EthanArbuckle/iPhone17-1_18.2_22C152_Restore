@interface WRCannedRepliesViewController
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (WRCannedRepliesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)cannedReplies;
- (id)cannedRepliesFromSpecifiers;
- (id)customReply:(id)a3;
- (id)includeSmartReplies;
- (id)newCannedReplySpecifier;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (unint64_t)category;
- (unint64_t)numberOfDefaultReplySpecifiers;
- (void)addNewReply:(id)a3;
- (void)configureCellAccessoryImage:(id)a3;
- (void)loadRepliesStoreIfNeeded;
- (void)returnPressedAtEnd;
- (void)saveReplies;
- (void)setCustomReply:(id)a3 specifier:(id)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setIncludeSmartReplies:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)updateEditDoneButton;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WRCannedRepliesViewController

- (WRCannedRepliesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)WRCannedRepliesViewController;
  v4 = [(WRCannedRepliesViewController *)&v6 initWithNibName:a3 bundle:a4];
  if (v4) {
    v4->_supportedEnhancedEditing = +[WRCannedRepliesStore supportsEnhancedEditing];
  }
  return v4;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)WRCannedRepliesViewController;
  [(WRCannedRepliesViewController *)&v4 viewDidLoad];
  if (![(WRCannedRepliesViewController *)self category])
  {
    v3 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Set the category before accessing the view. WRCategoryQuickboard is an invalid category." userInfo:0];
    [v3 raise];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WRCannedRepliesViewController;
  [(WRCannedRepliesViewController *)&v4 viewWillAppear:a3];
  [(WRCannedRepliesViewController *)self updateEditDoneButton];
}

- (void)updateEditDoneButton
{
  if (self->_supportedEnhancedEditing
    && ([(WRCannedRepliesViewController *)self cannedReplies],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        v4))
  {
    id v6 = [(WRCannedRepliesViewController *)self editButtonItem];
    v5 = [(WRCannedRepliesViewController *)self navigationItem];
    [v5 setRightBarButtonItem:v6];
  }
  else
  {
    id v6 = [(WRCannedRepliesViewController *)self navigationItem];
    [v6 setRightBarButtonItem:0];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3) {
    int v7 = 0;
  }
  else {
    int v7 = [(WRCannedRepliesViewController *)self isEditing];
  }
  v11.receiver = self;
  v11.super_class = (Class)WRCannedRepliesViewController;
  [(WRCannedRepliesViewController *)&v11 setEditing:v5 animated:v4];
  [(WRCannedRepliesViewController *)self returnPressedAtEnd];
  if (self->_supportedEnhancedEditing)
  {
    v8 = [(WRCannedRepliesViewController *)self table];
    [v8 setEditing:v5 animated:1];

    addNewSpecifier = self->_addNewSpecifier;
    if (addNewSpecifier)
    {
      if (!v5)
      {
        v10 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) lastObject];
        [(WRCannedRepliesViewController *)self insertSpecifier:addNewSpecifier afterSpecifier:v10 animated:v4];

        if (!v7) {
          return;
        }
LABEL_9:
        [(WRCannedRepliesViewController *)self saveReplies];
        return;
      }
      [(WRCannedRepliesViewController *)self removeSpecifier:self->_addNewSpecifier animated:v4];
    }
    if (!v7) {
      return;
    }
    goto LABEL_9;
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v6 = (void *)MEMORY[0x263F5FC40];
    int v7 = WRBundle();
    v8 = [v7 localizedStringForKey:@"DEFAULT_REPLIES" value:&stru_26DE2D188 table:@"WRCannedRepliesViewController"];
    v9 = [v6 groupSpecifierWithName:v8];

    v10 = WRBundle();
    objc_super v11 = [v10 localizedStringForKey:@"DEFAULT_REPLIES_HELP" value:&stru_26DE2D188 table:@"WRCannedRepliesViewController"];
    [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x263F600F8]];

    [v5 addObject:v9];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0;
    uint64_t v32 = [v5 indexOfObject:v9];
    uint64_t v12 = v30[3];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v30[3] = v12 + 1;
      v13 = [(WRCannedRepliesViewController *)self cannedReplies];
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      v24 = __43__WRCannedRepliesViewController_specifiers__block_invoke;
      v25 = &unk_2648810D0;
      v26 = self;
      id v14 = v5;
      id v27 = v14;
      v28 = &v29;
      [v13 enumerateObjectsUsingBlock:&v22];
      if (self->_supportedEnhancedEditing)
      {
        v15 = (void *)MEMORY[0x263F5FC40];
        v16 = WRBundle();
        v17 = [v16 localizedStringForKey:@"ADD_NEW_REPLY" value:&stru_26DE2D188 table:@"WRCannedRepliesViewController"];
        objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, 0, 0, 13, 0, v22, v23, v24, v25, v26);
        v18 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
        addNewSpecifier = self->_addNewSpecifier;
        self->_addNewSpecifier = v18;

        [(PSSpecifier *)self->_addNewSpecifier setButtonAction:sel_addNewReply_];
        [(PSSpecifier *)self->_addNewSpecifier setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
        [v14 addObject:self->_addNewSpecifier];
      }
    }
    v20 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    _Block_object_dispose(&v29, 8);
    BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

void __43__WRCannedRepliesViewController_specifiers__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (unsigned char *)a1[4];
  id v16 = v3;
  if (v4[1424])
  {
    id v5 = [v3 defaultReplyText];
    char v6 = [v5 isEqualToString:@"SMART_REPLIES_MARKER"];

    if (v6)
    {
      int v7 = (void *)MEMORY[0x263F5FC40];
      v8 = WRBundle();
      v9 = [v8 localizedStringForKey:@"SMART_REPLIES" value:&stru_26DE2D188 table:@"WRCannedRepliesViewController"];
      uint64_t v10 = [v7 preferenceSpecifierNamed:v9 target:a1[4] set:sel_setIncludeSmartReplies_specifier_ get:sel_includeSmartReplies detail:0 cell:6 edit:0];
      uint64_t v11 = a1[4];
      uint64_t v12 = *(void **)(v11 + 1400);
      *(void *)(v11 + 1400) = v10;

      id v13 = *(id *)(a1[4] + 1400);
      goto LABEL_6;
    }
    BOOL v4 = (unsigned char *)a1[4];
  }
  id v13 = (id)[v4 newCannedReplySpecifier];
  id v14 = [v16 defaultReplyText];
  [v13 setPlaceholder:v14];

LABEL_6:
  [v13 setProperty:v16 forKey:@"WRCannedReplyKey"];
  v15 = (void *)a1[5];
  ++*(void *)(*(void *)(a1[6] + 8) + 24);
  objc_msgSend(v15, "insertObject:atIndex:", v13);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)WRCannedRepliesViewController;
  id v5 = [(WRCannedRepliesViewController *)&v12 tableView:a3 cellForRowAtIndexPath:a4];
  uint64_t v6 = [v5 tag];
  if (v6 == 6)
  {
    v9 = BPSBridgeTintColor();
    uint64_t v10 = [v5 textLabel];
    [v10 setTextColor:v9];

    [v5 setSelectionStyle:3];
  }
  else if (v6 == 8)
  {
    int v7 = [v5 editableTextField];
    [v7 setClearButtonMode:1];

    v8 = [v5 editableTextField];
    [v8 setReturnKeyType:9];

    objc_msgSend(v5, "setShowsReorderControl:", -[WRCannedRepliesViewController isEditing](self, "isEditing"));
    [(WRCannedRepliesViewController *)self configureCellAccessoryImage:v5];
  }

  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v10 = 0;
  if (self->_supportedEnhancedEditing)
  {
    v8 = [(WRCannedRepliesViewController *)self specifierAtIndexPath:v7];
    uint64_t v9 = [v8 cellType];

    if (v9 == 8) {
      int64_t v10 = 1;
    }
  }

  return v10;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1 && self->_supportedEnhancedEditing)
  {
    id v6 = [(WRCannedRepliesViewController *)self specifierAtIndexPath:a5];
    -[WRCannedRepliesViewController removeSpecifier:animated:](self, "removeSpecifier:animated:");
    if (([(WRCannedRepliesViewController *)self isEditing] & 1) == 0) {
      [(WRCannedRepliesViewController *)self saveReplies];
    }
  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_supportedEnhancedEditing && [(WRCannedRepliesViewController *)self isEditing])
  {
    v8 = [(WRCannedRepliesViewController *)self specifierAtIndexPath:v7];
    uint64_t v9 = [v8 cellType];

    BOOL v10 = ((v9 - 6) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self->_supportedEnhancedEditing)
  {
    uint64_t v10 = (int)*MEMORY[0x263F5FDB8];
    if ([*(id *)((char *)&self->super.super.super.super.super.isa + v10) count])
    {
      unint64_t v11 = [(WRCannedRepliesViewController *)self indexForIndexPath:v8];
      unint64_t v12 = [(WRCannedRepliesViewController *)self indexForIndexPath:v9];
      if (v11 >= [*(id *)((char *)&self->super.super.super.super.super.isa + v10) count]) {
        -[WRCannedRepliesViewController tableView:moveRowAtIndexPath:toIndexPath:]();
      }
      if (v11 < [*(id *)((char *)&self->super.super.super.super.super.isa + v10) count])
      {
        id v13 = [(WRCannedRepliesViewController *)self specifierAtIndex:v11];
        if (v13)
        {
          id v14 = (void *)[*(id *)((char *)&self->super.super.super.super.super.isa + v10) mutableCopy];
          if (v12 >= [v14 count]) {
            -[WRCannedRepliesViewController tableView:moveRowAtIndexPath:toIndexPath:]();
          }
          if (v12 < [v14 count])
          {
            [v14 removeObjectAtIndex:v11];
            [v14 insertObject:v13 atIndex:v12];
          }
          v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v10);
          *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)v14;
        }
      }
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WRCannedRepliesViewController;
  if (objc_msgSend(-[WRCannedRepliesViewController class](&v11, sel_class), "instancesRespondToSelector:", sel_tableView_didSelectRowAtIndexPath_))
  {
    v10.receiver = self;
    v10.super_class = (Class)WRCannedRepliesViewController;
    [(WRCannedRepliesViewController *)&v10 tableView:v6 didSelectRowAtIndexPath:v7];
  }
  id v8 = [v6 cellForRowAtIndexPath:v7];
  if ([v8 tag] == 6)
  {
    id v9 = [v8 control];
    objc_msgSend(v9, "setOn:animated:", objc_msgSend(v9, "isOn") ^ 1, 1);
  }
}

- (void)returnPressedAtEnd
{
  id v3 = [(id)*MEMORY[0x263F1D020] keyWindow];
  v2 = [v3 firstResponder];
  [v2 resignFirstResponder];
}

- (id)newCannedReplySpecifier
{
  id result = [MEMORY[0x263F5FCA8] preferenceSpecifierNamed:0 target:self set:sel_setCustomReply_specifier_ get:sel_customReply_ detail:0 cell:8 edit:0];
  *(void *)((char *)result + (int)*MEMORY[0x263F5FE00]) = 2;
  return result;
}

- (void)setCustomReply:(id)a3 specifier:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [v6 propertyForKey:@"WRCannedReplyKey"];
  id v8 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v9 = [v13 stringByTrimmingCharactersInSet:v8];

  if (([v13 isEqualToString:&stru_26DE2D188] & 1) != 0
    || ([v9 isEqualToString:&stru_26DE2D188] & 1) == 0)
  {
    [v7 setText:v13];
    [(WRCannedRepliesViewController *)self saveReplies];
  }
  else
  {
    [(WRCannedRepliesViewController *)self reloadSpecifier:v6];
  }
  objc_super v10 = [v7 text];
  if ([v10 length])
  {
  }
  else
  {
    objc_super v11 = [v7 defaultReplyText];
    uint64_t v12 = [v11 length];

    if (!v12)
    {
      [(WRCannedRepliesViewController *)self removeSpecifier:v6 animated:0];
      [(WRCannedRepliesViewController *)self saveReplies];
    }
  }
}

- (id)customReply:(id)a3
{
  id v3 = [a3 propertyForKey:@"WRCannedReplyKey"];
  BOOL v4 = [v3 text];

  return v4;
}

- (void)setIncludeSmartReplies:(id)a3 specifier:(id)a4
{
  repliesStore = self->_repliesStore;
  uint64_t v5 = [a3 BOOLValue];

  [(WRCannedRepliesStore *)repliesStore setIncludeSmartReplies:v5];
}

- (id)includeSmartReplies
{
  v2 = NSNumber;
  BOOL v3 = [(WRCannedRepliesStore *)self->_repliesStore includeSmartReplies];

  return (id)[v2 numberWithBool:v3];
}

- (unint64_t)numberOfDefaultReplySpecifiers
{
  return [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) count]
       - 1;
}

- (void)configureCellAccessoryImage:(id)a3
{
  BOOL v4 = [a3 editableTextField];
  id v15 = v4;
  if (!self->_accessoryImage || !self->_highlightedAccessoryImage)
  {
    uint64_t v5 = [v4 _clearButton];
    id v6 = [v5 imageForState:0];

    id v7 = BPSAccessoryHighlightColor();
    id v8 = [v6 _flatImageWithColor:v7];
    accessoryImage = self->_accessoryImage;
    self->_accessoryImage = v8;

    objc_super v10 = BPSAccessoryColor();
    objc_super v11 = [v6 _flatImageWithColor:v10];
    highlightedAccessoryImage = self->_highlightedAccessoryImage;
    self->_highlightedAccessoryImage = v11;

    BOOL v4 = v15;
  }
  id v13 = [v4 _clearButton];
  [v13 setImage:self->_accessoryImage forState:0];

  id v14 = [v15 _clearButton];
  [v14 setImage:self->_highlightedAccessoryImage forState:1];
}

- (void)addNewReply:(id)a3
{
  uint64_t v4 = [(WRCannedRepliesViewController *)self indexOfSpecifier:self->_addNewSpecifier];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    id v14 = [(WRCannedRepliesViewController *)self newCannedReplySpecifier];
    id v6 = objc_alloc_init(WRCannedReply);
    [v14 setProperty:v6 forKey:@"WRCannedReplyKey"];

    [(WRCannedRepliesViewController *)self insertSpecifier:v14 atIndex:v5 animated:1];
    [(WRCannedRepliesViewController *)self saveReplies];
    id v7 = [(WRCannedRepliesViewController *)self table];
    id v8 = [(WRCannedRepliesViewController *)self indexPathForSpecifier:v14];
    id v9 = [v7 cellForRowAtIndexPath:v8];

    objc_super v10 = [v9 editableTextField];
    [v10 becomeFirstResponder];

    objc_super v11 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v12 = *MEMORY[0x263F1D778];
    id v13 = [v9 editableTextField];
    [v11 postNotificationName:v12 object:v13];
  }
}

- (id)cannedRepliesFromSpecifiers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v4 = (int)*MEMORY[0x263F5FDB8];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = *(id *)((char *)&self->super.super.super.super.super.isa + v4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "propertyForKey:", @"WRCannedReplyKey", (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)cannedReplies
{
  [(WRCannedRepliesViewController *)self loadRepliesStoreIfNeeded];
  repliesStore = self->_repliesStore;

  return [(WRCannedRepliesStore *)repliesStore cannedReplies];
}

- (void)loadRepliesStoreIfNeeded
{
  if (!self->_repliesStore)
  {
    self->_repliesStore = [[WRCannedRepliesStore alloc] initWithCategory:[(WRCannedRepliesViewController *)self category]];
    MEMORY[0x270F9A758]();
  }
}

- (void)saveReplies
{
  [(WRCannedRepliesViewController *)self loadRepliesStoreIfNeeded];
  id v3 = [(WRCannedRepliesViewController *)self cannedRepliesFromSpecifiers];
  [(WRCannedRepliesStore *)self->_repliesStore setCannedReplies:v3];
}

- (unint64_t)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedAccessoryImage, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_smartRepliesSpecifier, 0);
  objc_storeStrong((id *)&self->_addNewSpecifier, 0);

  objc_storeStrong((id *)&self->_repliesStore, 0);
}

- (void)tableView:moveRowAtIndexPath:toIndexPath:.cold.1()
{
}

- (void)tableView:moveRowAtIndexPath:toIndexPath:.cold.2()
{
}

@end
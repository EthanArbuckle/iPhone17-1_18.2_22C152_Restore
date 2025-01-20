@interface ICNoteEditorUserTitleView
+ (BOOL)shouldShowUserTitleViewForNote:(id)a3;
+ (id)newUserTitleView;
+ (id)noteKeyPathsAffectingUserTitleView;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (ICNote)note;
- (ICNoteEditorUserTitleView)initWithCoder:(id)a3;
- (ICNoteEditorUserTitleView)initWithFrame:(CGRect)a3;
- (ICNoteEditorUserTitleViewDelegate)delegate;
- (NSArray)alternateConstraintsForAXLargerTextSizes;
- (NSArray)defaultConstraints;
- (UIAlertController)alertController;
- (UIButton)editButton;
- (UILabel)label;
- (double)preferredHeight;
- (id)accessibilityContainer;
- (id)accessibilityHint;
- (id)accessibilityValue;
- (void)accessibilityElementDidBecomeFocused;
- (void)awakeFromNib;
- (void)dealloc;
- (void)editButtonPressed:(id)a3;
- (void)noteWillBeDeleted:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerForTraitChanges;
- (void)setAlertController:(id)a3;
- (void)setAlternateConstraintsForAXLargerTextSizes:(id)a3;
- (void)setDefaultConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditButton:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setNote:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)updateConstraints;
- (void)updateContentToCurrentNote;
- (void)updateFonts;
@end

@implementation ICNoteEditorUserTitleView

+ (id)noteKeyPathsAffectingUserTitleView
{
  return &unk_26C139150;
}

+ (BOOL)shouldShowUserTitleViewForNote:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isSharedAndEmpty];
  if (v3)
  {
    v5 = [v3 titleSourceAttachment];
    if ([v5 attachmentType] == 10)
    {
      BOOL v6 = 0;
    }
    else
    {
      v8 = [v3 titleSourceAttachment];
      BOOL v6 = [v8 attachmentType] != 13;
    }
    v9 = [v3 titleSourceAttachment];
    LOBYTE(v7) = 1;
    if (v9 && !v6) {
      int v7 = [v3 isEditable] ^ 1;
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v4 | v7 ^ 1;
}

- (ICNoteEditorUserTitleView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoteEditorUserTitleView;
  id v3 = [(ICNoteEditorUserTitleView *)&v6 initWithCoder:a3];
  char v4 = v3;
  if (v3) {
    [(ICNoteEditorUserTitleView *)v3 commonInit];
  }
  return v4;
}

- (ICNoteEditorUserTitleView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoteEditorUserTitleView;
  id v3 = -[ICNoteEditorUserTitleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  char v4 = v3;
  if (v3) {
    [(ICNoteEditorUserTitleView *)v3 commonInit];
  }
  return v4;
}

- (void)dealloc
{
  [(ICNote *)self->_note ic_removeObserver:self forKeyPath:@"title" context:&compoundliteral_3];
  [(ICNote *)self->_note ic_removeObserver:self forKeyPath:@"titleSourceAttachment" context:&compoundliteral_3];
  [(ICNote *)self->_note ic_removeObserver:self forKeyPath:@"folder" context:&compoundliteral_3];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorUserTitleView;
  [(ICNoteEditorUserTitleView *)&v4 dealloc];
}

- (void)awakeFromNib
{
  v16.receiver = self;
  v16.super_class = (Class)ICNoteEditorUserTitleView;
  [(ICNoteEditorUserTitleView *)&v16 awakeFromNib];
  uint64_t v3 = ICAccessibilityAccessibilityLargerTextSizesEnabled() ^ 1;
  objc_super v4 = [(ICNoteEditorUserTitleView *)self label];
  [v4 setNumberOfLines:v3];

  [(ICNoteEditorUserTitleView *)self updateFonts];
  v5 = [(ICNoteEditorUserTitleView *)self label];
  objc_super v6 = [v5 font];
  char v7 = objc_msgSend(v6, "ic_fontHasSingleLineA");

  if ((v7 & 1) == 0) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[self.label.font ic_fontHasSingleLineA]" functionName:"-[ICNoteEditorUserTitleView awakeFromNib]" simulateCrash:1 showAlert:0 format:@"font should have a single-line a attribute"];
  }
  v8 = objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorSecondaryLabelColor");
  uint64_t v9 = [(ICNoteEditorUserTitleView *)self label];
  [(id)v9 setTextColor:v8];

  v10 = [(ICNoteEditorUserTitleView *)self label];
  [v10 setTextAlignment:1];

  v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:self selector:sel_noteWillBeDeleted_ name:*MEMORY[0x263F5AAA0] object:0];

  v12 = [(ICNoteEditorUserTitleView *)self note];
  LOBYTE(v9) = [v12 isSharedAndEmpty];

  if ((v9 & 1) == 0)
  {
    [(ICNoteEditorUserTitleView *)self updateContentToCurrentNote];
    v13 = [(ICNoteEditorUserTitleView *)self editButton];
    v14 = [MEMORY[0x263F086E0] mainBundle];
    v15 = [v14 localizedStringForKey:@"Edit" value:&stru_26C10E100 table:0];
    [v13 setTitle:v15 forState:0];
  }
}

- (void)updateConstraints
{
  v9.receiver = self;
  v9.super_class = (Class)ICNoteEditorUserTitleView;
  [(ICNoteEditorUserTitleView *)&v9 updateConstraints];
  int v3 = ICAccessibilityAccessibilityLargerTextSizesEnabled();
  objc_super v4 = (void *)MEMORY[0x263F08938];
  if (v3)
  {
    v5 = [(ICNoteEditorUserTitleView *)self defaultConstraints];
    [v4 deactivateConstraints:v5];

    objc_super v6 = (void *)MEMORY[0x263F08938];
    [(ICNoteEditorUserTitleView *)self alternateConstraintsForAXLargerTextSizes];
  }
  else
  {
    char v7 = [(ICNoteEditorUserTitleView *)self alternateConstraintsForAXLargerTextSizes];
    [v4 deactivateConstraints:v7];

    objc_super v6 = (void *)MEMORY[0x263F08938];
    [(ICNoteEditorUserTitleView *)self defaultConstraints];
  v8 = };
  [v6 activateConstraints:v8];
}

- (double)preferredHeight
{
  double v3 = 0.0;
  if (([(ICNoteEditorUserTitleView *)self isHidden] & 1) == 0)
  {
    objc_super v4 = [(ICNoteEditorUserTitleView *)self label];
    uint64_t v5 = [v4 numberOfLines];
    objc_super v6 = [(ICNoteEditorUserTitleView *)self label];
    char v7 = v6;
    if (v5 == 1)
    {
      v8 = [v6 font];
      [v8 lineHeight];
      *(float *)&double v9 = v9;
      double v10 = ceilf(*(float *)&v9);
    }
    else
    {
      [v6 intrinsicContentSize];
      double v10 = v11;
    }

    double v3 = v10 + 12.0;
    if (ICAccessibilityAccessibilityLargerTextSizesEnabled())
    {
      v12 = [(ICNoteEditorUserTitleView *)self editButton];
      [v12 intrinsicContentSize];
      double v3 = v3 + v13;
    }
  }
  return v3;
}

- (void)setNote:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v5 = (ICNote *)a3;
  p_note = &self->_note;
  if (self->_note != v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    char v7 = [(id)objc_opt_class() noteKeyPathsAffectingUserTitleView];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [(ICNote *)*p_note ic_removeObserver:self forKeyPath:*(void *)(*((void *)&v21 + 1) + 8 * v11++) context:&compoundliteral_3];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_note, a3);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v12 = objc_msgSend((id)objc_opt_class(), "noteKeyPathsAffectingUserTitleView", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [(ICNote *)*p_note ic_addObserver:self forKeyPath:*(void *)(*((void *)&v17 + 1) + 8 * v16++) context:&compoundliteral_3];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }

    [(ICNoteEditorUserTitleView *)self updateContentToCurrentNote];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(ICNoteEditorUserTitleView *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/Editor/ICNoteEditorUserTitleView.m"])
  {
    char v13 = [(ICNoteEditorUserTitleView *)self ic_shouldIgnoreObserveValue:v10 ofObject:v11 forKeyPath:v12];

    if (a6 == &compoundliteral_3 && (v13 & 1) == 0)
    {
      [(ICNoteEditorUserTitleView *)self updateContentToCurrentNote];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICNoteEditorUserTitleView;
    [(ICNoteEditorUserTitleView *)&v14 observeValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
  }
}

- (void)noteWillBeDeleted:(id)a3
{
  objc_super v4 = [a3 object];
  uint64_t v5 = [(ICNoteEditorUserTitleView *)self note];

  if (v4 == v5)
  {
    id v6 = [(ICNoteEditorUserTitleView *)self alertController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICNoteEditorUserTitleView *)self isHidden] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)ICNoteEditorUserTitleView;
    [(ICNoteEditorUserTitleView *)&v6 setHidden:v3];
    uint64_t v5 = [(ICNoteEditorUserTitleView *)self delegate];
    [v5 userTitleHiddenStateDidChange:self];
  }
}

- (void)updateContentToCurrentNote
{
  BOOL v3 = [(ICNoteEditorUserTitleView *)self note];
  char v4 = [v3 isSharedAndEmpty];

  if (v4) {
    return;
  }
  uint64_t v5 = objc_opt_class();
  objc_super v6 = [(ICNoteEditorUserTitleView *)self note];
  -[ICNoteEditorUserTitleView setHidden:](self, "setHidden:", [v5 shouldShowUserTitleViewForNote:v6] ^ 1);

  if ([(ICNoteEditorUserTitleView *)self isHidden]) {
    return;
  }
  char v7 = [(ICNoteEditorUserTitleView *)self note];
  uint64_t v8 = [v7 titleSourceAttachment];
  uint64_t v9 = [v8 userTitle];

  if (v9)
  {
    id v10 = NSString;
    id v11 = [MEMORY[0x263F086E0] mainBundle];
    id v12 = [v11 localizedStringForKey:@"Note Title: %@" value:&stru_26C10E100 table:0];
    objc_msgSend(v10, "localizedStringWithFormat:", v12, v9);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v14 = [(ICNoteEditorUserTitleView *)self note];
    uint64_t v15 = [v14 attributedTitle];

    if (v15)
    {
      uint64_t v16 = [MEMORY[0x263F086E0] mainBundle];
      long long v17 = [v16 localizedStringForKey:@"Suggested Title: " value:&stru_26C10E100 table:0];
      long long v18 = [(ICNoteEditorUserTitleView *)self note];
      long long v19 = [v18 attributedTitle];
      char v13 = objc_msgSend(v17, "ic_attributedStringByAppendingAttributedString:", v19);
    }
    else
    {
      char v13 = 0;
    }
    long long v20 = NSString;
    long long v21 = [MEMORY[0x263F086E0] mainBundle];
    long long v22 = [v21 localizedStringForKey:@"Suggested Title: %@" value:&stru_26C10E100 table:0];
    long long v23 = [(ICNoteEditorUserTitleView *)self note];
    long long v24 = [v23 title];
    objc_msgSend(v20, "localizedStringWithFormat:", v22, v24);
    id v26 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v25 = [(ICNoteEditorUserTitleView *)self label];
      [v25 setAttributedText:v13];

      goto LABEL_12;
    }
  }
  char v13 = [(ICNoteEditorUserTitleView *)self label];
  [v13 setText:v26];
LABEL_12:
}

- (void)editButtonPressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
  objc_super v6 = [v5 localizedStringForKey:@"Note Title" value:&stru_26C10E100 table:0];

  char v7 = [(ICNoteEditorUserTitleView *)self note];
  uint64_t v8 = [v7 titleSourceAttachment];

  if (v8)
  {
    objc_initWeak(location, self);
    uint64_t v9 = [MEMORY[0x263F82418] alertControllerWithTitle:v6 message:&stru_26C10E100 preferredStyle:1];
    id v10 = [v8 note];
    id v11 = [v10 attributedTitle];
    v35 = v6;
    id v36 = v4;

    id v12 = [v8 note];
    char v13 = [v12 title];

    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __47__ICNoteEditorUserTitleView_editButtonPressed___block_invoke;
    v44[3] = &unk_2640BA068;
    id v14 = v8;
    id v45 = v14;
    BOOL v37 = v11 != 0;
    BOOL v49 = v11 != 0;
    id v15 = v11;
    id v46 = v15;
    id v16 = v13;
    id v47 = v16;
    objc_copyWeak(&v48, location);
    [v9 addTextFieldWithConfigurationHandler:v44];
    long long v17 = (void *)MEMORY[0x263F82400];
    long long v18 = [MEMORY[0x263F086E0] mainBundle];
    long long v19 = [v18 localizedStringForKey:@"Cancel" value:&stru_26C10E100 table:0];
    long long v20 = [v17 actionWithTitle:v19 style:1 handler:&__block_literal_global_15];
    [v9 addAction:v20];

    long long v21 = (void *)MEMORY[0x263F82400];
    long long v22 = [MEMORY[0x263F086E0] mainBundle];
    long long v23 = [v22 localizedStringForKey:@"Done" value:&stru_26C10E100 table:0];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __47__ICNoteEditorUserTitleView_editButtonPressed___block_invoke_3;
    v38[3] = &unk_2640BA090;
    id v24 = v9;
    id v39 = v24;
    BOOL v43 = v37;
    id v25 = v15;
    id v40 = v25;
    id v26 = v16;
    id v41 = v26;
    id v42 = v14;
    uint64_t v27 = [v21 actionWithTitle:v23 style:0 handler:v38];
    [v24 addAction:v27];

    [(ICNoteEditorUserTitleView *)self setAlertController:v24];
    v28 = [(ICNoteEditorUserTitleView *)self window];
    v29 = [v28 rootViewController];

    uint64_t v30 = [v29 presentedViewController];
    v31 = (void *)v30;
    if (v30) {
      v32 = (void *)v30;
    }
    else {
      v32 = v29;
    }
    id v33 = v32;

    [v33 presentViewController:v24 animated:1 completion:0];
    v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 postNotificationName:@"ICNoteEditorTitleEditingViewDidShowNotification" object:0];

    objc_destroyWeak(&v48);
    objc_destroyWeak(location);
    objc_super v6 = v35;
    id v4 = v36;
  }
}

void __47__ICNoteEditorUserTitleView_editButtonPressed___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 setAutocapitalizationType:2];
  [v7 setClearButtonMode:3];
  BOOL v3 = [*(id *)(a1 + 32) title];
  if (v3)
  {
    [v7 setPlaceholder:v3];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) note];
    uint64_t v5 = [v4 title];
    [v7 setPlaceholder:v5];
  }
  if (*(unsigned char *)(a1 + 64)) {
    [v7 setAttributedText:*(void *)(a1 + 40)];
  }
  else {
    [v7 setText:*(void *)(a1 + 48)];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [v7 setDelegate:WeakRetained];
}

void __47__ICNoteEditorUserTitleView_editButtonPressed___block_invoke_3(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) textFields];
  BOOL v3 = [v2 firstObject];
  ICDynamicCast();
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [v15 text];
  uint64_t v5 = [v15 attributedText];
  objc_super v6 = v5;
  if (*(unsigned char *)(a1 + 64))
  {
    if ([v5 isEqualToAttributedString:*(void *)(a1 + 40)]) {
      goto LABEL_12;
    }
  }
  else if ([v4 isEqualToString:*(void *)(a1 + 48)])
  {
    goto LABEL_12;
  }
  id v7 = [*(id *)(a1 + 56) note];
  int v8 = [v7 isEditable];

  if (v8)
  {
    if ([v4 length]) {
      uint64_t v9 = v4;
    }
    else {
      uint64_t v9 = 0;
    }
    [*(id *)(a1 + 56) setUserTitle:v9];
    [*(id *)(a1 + 56) updateChangeCountWithReason:@"Edited user title"];
    id v10 = [*(id *)(a1 + 56) note];
    int v11 = [v10 regenerateTitle:1 snippet:1];

    if (v11)
    {
      id v12 = [*(id *)(a1 + 56) note];
      [v12 markShareDirtyIfNeededWithReason:@"Edited attachment user title"];

      char v13 = [*(id *)(a1 + 56) note];
      [v13 updateChangeCountWithReason:@"Edited attachment user title"];
    }
    id v14 = [*(id *)(a1 + 56) note];
    [v14 updateModificationDateAndChangeCountAndSaveImmediately];
  }
LABEL_12:
}

- (void)textFieldDidBeginEditing:(id)a3
{
}

+ (id)newUserTitleView
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:a1];
  id v4 = NSStringFromClass((Class)a1);
  uint64_t v5 = [v3 loadNibNamed:v4 owner:a1 options:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      int v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v11;

    if (v12) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result != ((void *)0)", "+[ICNoteEditorUserTitleView newUserTitleView]", 1, 0, @"Unable to load user title view", (void)v14);
  id v12 = 0;
LABEL_12:
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 1, (void)v14);

  return v12;
}

- (void)updateFonts
{
  BOOL v3 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForDateText");
  id v4 = [(ICNoteEditorUserTitleView *)self label];
  [v4 setFont:v3];

  id v8 = [(ICNoteEditorUserTitleView *)self label];
  uint64_t v5 = [v8 font];
  id v6 = [(ICNoteEditorUserTitleView *)self editButton];
  uint64_t v7 = [v6 titleLabel];
  [v7 setFont:v5];
}

- (void)registerForTraitChanges
{
  v8[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v8[0] = objc_opt_class();
  BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__ICNoteEditorUserTitleView_registerForTraitChanges__block_invoke;
  v5[3] = &unk_2640B9130;
  objc_copyWeak(&v6, &location);
  id v4 = (id)[(ICNoteEditorUserTitleView *)self registerForTraitChanges:v3 withHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __52__ICNoteEditorUserTitleView_registerForTraitChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = ICAccessibilityAccessibilityLargerTextSizesEnabled() ^ 1;
    v2 = [WeakRetained label];
    [v2 setNumberOfLines:v1];

    [WeakRetained updateFonts];
    [WeakRetained setNeedsUpdateConstraints];
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  v2 = [(ICNoteEditorUserTitleView *)self label];
  BOOL v3 = [v2 text];

  return v3;
}

- (id)accessibilityHint
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Double tap to edit the title of this note." value:&stru_26C10E100 table:0];

  return v3;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (id)accessibilityContainer
{
  v7.receiver = self;
  v7.super_class = (Class)ICNoteEditorUserTitleView;
  id v2 = [(ICNoteEditorUserTitleView *)&v7 accessibilityContainer];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
    while (![v4 conformsToProtocol:&unk_26C1E88C8])
    {
      uint64_t v5 = [v4 accessibilityContainer];

      id v4 = (id)v5;
      if (!v5) {
        goto LABEL_8;
      }
    }
    id v4 = v4;

    BOOL v3 = v4;
  }
  else
  {
    id v4 = 0;
  }
LABEL_8:

  return v3;
}

- (void)accessibilityElementDidBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)ICNoteEditorUserTitleView;
  [(ICNoteEditorUserTitleView *)&v5 accessibilityElementDidBecomeFocused];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v3 = [(ICNoteEditorUserTitleView *)self nextResponder];
    if (v3)
    {
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v4 = [v3 nextResponder];

        id v3 = (id)v4;
        if (!v4) {
          goto LABEL_7;
        }
      }
      id v3 = v3;
    }
LABEL_7:
    [v3 showOverscrollContentAndScrollToTop];
  }
}

- (ICNoteEditorUserTitleViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICNoteEditorUserTitleViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICNote)note
{
  return self->_note;
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);

  return (UILabel *)WeakRetained;
}

- (void)setLabel:(id)a3
{
}

- (UIButton)editButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editButton);

  return (UIButton *)WeakRetained;
}

- (void)setEditButton:(id)a3
{
}

- (UIAlertController)alertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);

  return (UIAlertController *)WeakRetained;
}

- (void)setAlertController:(id)a3
{
}

- (NSArray)defaultConstraints
{
  return self->_defaultConstraints;
}

- (void)setDefaultConstraints:(id)a3
{
}

- (NSArray)alternateConstraintsForAXLargerTextSizes
{
  return self->_alternateConstraintsForAXLargerTextSizes;
}

- (void)setAlternateConstraintsForAXLargerTextSizes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateConstraintsForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_destroyWeak((id *)&self->_alertController);
  objc_destroyWeak((id *)&self->_editButton);
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_note, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
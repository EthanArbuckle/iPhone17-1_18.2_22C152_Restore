@interface SearchUIButtonItemViewController
+ (id)buttonItemViewControllerForButtonItem:(id)a3;
- (BOOL)isCompact;
- (BOOL)supportsContextMenuConfiguration;
- (NUIContainerBoxView)view;
- (SearchUIButtonItem)buttonItem;
- (SearchUIButtonItemView)buttonItemView;
- (SearchUIButtonItemViewController)init;
- (SearchUIButtonItemViewControllerDelegate)buttonDelegate;
- (SearchUIFeedbackDelegate)feedbackDelegate;
- (SearchUIRowModel)rowModel;
- (UIFont)buttonFont;
- (id)customPreviewMenu;
- (id)previewCommandHandler;
- (unint64_t)buttonItemViewStyle;
- (void)buttonPressed;
- (void)setButtonDelegate:(id)a3;
- (void)setButtonFont:(id)a3;
- (void)setButtonItem:(id)a3;
- (void)setButtonItemView:(id)a3;
- (void)setButtonItemViewStyle:(unint64_t)a3;
- (void)setFeedbackDelegate:(id)a3;
- (void)setIsCompact:(BOOL)a3;
- (void)setRowModel:(id)a3;
- (void)setView:(id)a3;
- (void)setbuttonItemViewStyle:(unint64_t)a3;
- (void)stateDidChangeForButtonItem:(id)a3;
- (void)updateImageForStatusUpdate:(BOOL)a3;
- (void)updateWithButtonItem:(id)a3 buttonItemViewType:(unint64_t)a4;
- (void)updateWithButtonItem:(id)a3 buttonItemViewType:(unint64_t)a4 isStatusUpdate:(BOOL)a5;
@end

@implementation SearchUIButtonItemViewController

+ (id)buttonItemViewControllerForButtonItem:(id)a3
{
  objc_msgSend(a3, "searchUI_viewControllerClass");
  v3 = objc_opt_new();
  return v3;
}

- (SearchUIButtonItemViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUIButtonItemViewController;
  v2 = [(SearchUIButtonItemViewController *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SearchUIButtonItemViewController *)v2 setView:v3];
  }
  return v2;
}

- (SearchUIButtonItemView)buttonItemView
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(SearchUIButtonItemViewController *)self buttonItemViewStyle] > 4) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = objc_opt_class();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(SearchUIButtonItemViewController *)self view];
  objc_super v5 = [v4 arrangedSubviews];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v6)
  {

    v8 = 0;
LABEL_17:
    v15 = objc_opt_new();

    [v15 setDelegate:self];
    [v15 addTarget:self action:sel_buttonPressed];
    v16 = [(SearchUIButtonItemViewController *)self view];
    [v16 addArrangedSubview:v15];

    v8 = v15;
    goto LABEL_18;
  }
  uint64_t v7 = v6;
  v8 = 0;
  uint64_t v9 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      char isKindOfClass = objc_opt_isKindOfClass();
      char v13 = ~isKindOfClass;
      [v11 setHidden:(isKindOfClass & 1) == 0];
      if ((v13 & 1) == 0)
      {
        id v14 = v11;

        v8 = v14;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v7);

  if (!v8 || ([v8 isMemberOfClass:v3] & 1) == 0) {
    goto LABEL_17;
  }
LABEL_18:
  [(SearchUIButtonItemViewController *)self setButtonItemView:v8];
  return (SearchUIButtonItemView *)v8;
}

- (void)updateWithButtonItem:(id)a3 buttonItemViewType:(unint64_t)a4
{
}

- (void)updateWithButtonItem:(id)a3 buttonItemViewType:(unint64_t)a4 isStatusUpdate:(BOOL)a5
{
  id v9 = a3;
  v10 = [(SearchUIButtonItemViewController *)self buttonItem];
  if ([v9 isEqual:v10]
    && [(SearchUIButtonItemViewController *)self buttonItemViewStyle] == a4)
  {

    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->_buttonItem, a3);
  self->_buttonItemViewStyle = a4;
  [v9 setDelegate:self];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__SearchUIButtonItemViewController_updateWithButtonItem_buttonItemViewType_isStatusUpdate___block_invoke;
  v11[3] = &unk_1E6E72A00;
  v11[4] = self;
  id v12 = v9;
  unint64_t v13 = a4;
  BOOL v14 = a5;
  +[SearchUIUtilities dispatchMainIfNecessary:v11];

LABEL_7:
}

void __91__SearchUIButtonItemViewController_updateWithButtonItem_buttonItemViewType_isStatusUpdate___block_invoke(uint64_t a1)
{
  id v21 = [*(id *)(a1 + 32) buttonItem];
  if ([v21 isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v2 = [*(id *)(a1 + 32) buttonItemViewStyle];
    uint64_t v3 = *(void *)(a1 + 48);

    if (v2 != v3) {
      return;
    }
    id v21 = [*(id *)(a1 + 32) buttonItemView];
    [v21 setDelegate:*(void *)(a1 + 32)];
    v4 = [*(id *)(a1 + 32) buttonItem];
    objc_super v5 = [v4 previewButtonItems];
    uint64_t v6 = [v5 count];

    uint64_t v7 = [*(id *)(a1 + 40) showsMenuAsPrimaryAction];
    if ((v7 & 1) != 0 || !v6)
    {
      [v21 setShowsMenuAsPrimaryAction:v7];
    }
    else
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "buttonItem", v7);
      id v9 = [v8 command];
      [v21 setShowsMenuAsPrimaryAction:v9 == 0];
    }
    objc_msgSend(v21, "setContextMenuInteractionEnabled:", objc_msgSend(v21, "showsMenuAsPrimaryAction"));
    v10 = [*(id *)(a1 + 40) title];
    v11 = [v21 buttonTitle];
    char v12 = [v11 isEqual:v10];

    if ((v12 & 1) == 0) {
      [v21 setButtonTitle:v10];
    }
    [*(id *)(a1 + 32) updateImageForStatusUpdate:*(unsigned __int8 *)(a1 + 56)];
    unint64_t v13 = [*(id *)(a1 + 40) buttonAppearance];
    [v21 setButtonAppearance:v13];

    objc_msgSend(v21, "setIsCompact:", objc_msgSend(*(id *)(a1 + 32), "isCompact"));
    BOOL v14 = [*(id *)(a1 + 32) buttonFont];
    [v21 setButtonFont:v14];

    v15 = [*(id *)(a1 + 40) command];
    v16 = [*(id *)(a1 + 32) rowModel];
    v17 = [*(id *)(a1 + 32) feedbackDelegate];
    long long v18 = +[SearchUIUtilities environmentForDelegate:v17];
    if (+[SearchUICommandHandler hasValidHandlerForCommand:v15 rowModel:v16 environment:v18])
    {
    }
    else
    {
      char v19 = [*(id *)(a1 + 40) isMemberOfClass:objc_opt_class()];

      if (v19)
      {
        long long v20 = [*(id *)(a1 + 40) previewButtonItems];
        objc_msgSend(v21, "setEnabled:", objc_msgSend(v20, "count") != 0);

LABEL_15:
        [v21 invalidateIntrinsicContentSize];

        goto LABEL_16;
      }
    }
    [v21 setEnabled:1];
    goto LABEL_15;
  }
LABEL_16:
}

- (void)updateImageForStatusUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  id v17 = [(SearchUIButtonItemViewController *)self buttonItem];
  objc_super v5 = [(SearchUIButtonItemViewController *)self buttonItemView];
  if ([(SearchUIButtonItemViewController *)self buttonItemViewStyle] == 3
    && [(SearchUIButtonItemViewController *)self isCompact]
    && ![v17 isMemberOfClass:objc_opt_class()])
  {
    int v7 = 1;
  }
  else
  {
    uint64_t v6 = [v17 buttonAppearance];
    int v7 = [v6 preferNoFallbackImage];
  }
  v8 = [v17 image];
  if (!v8)
  {
    if ([v5 drawsBackgroundPlatter])
    {
      if ((v7 & 1) == 0)
      {
LABEL_8:
        v8 = [v17 fallbackImage];
        goto LABEL_11;
      }
    }
    else if ((([v5 drawsIconBackgroundPlatter] ^ 1 | v7) & 1) == 0)
    {
      goto LABEL_8;
    }
    v8 = 0;
  }
LABEL_11:
  id v9 = +[SearchUIImage imageWithSFImage:v8];
  v10 = [v5 sfImage];
  char v11 = [v10 isEqual:v8];

  if (v11)
  {
    char v12 = v9;
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v12 = +[SearchUIImage imageWithSFImage:v8];
    unint64_t v13 = [(SearchUIButtonItemViewController *)self buttonItem];
    int v14 = [v13 useDefaultSymbolFillStyle];

    if (v14) {
      [v12 setPreferredFill:1];
    }

    if (!v3) {
      goto LABEL_17;
    }
LABEL_19:
    v16 = [v5 buttonTitle];
    if ([v16 length]) {
      uint64_t v15 = [v5 drawsTitle] ^ 1;
    }
    else {
      uint64_t v15 = 1;
    }

    goto LABEL_24;
  }
  char v12 = v9;
  if (v3) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v15 = 0;
LABEL_24:
  [v5 setSfImage:v12 animateTransition:v15];
LABEL_25:
}

- (void)setbuttonItemViewStyle:(unint64_t)a3
{
  id v5 = [(SearchUIButtonItemViewController *)self buttonItem];
  [(SearchUIButtonItemViewController *)self updateWithButtonItem:v5 buttonItemViewType:a3];
}

- (void)setIsCompact:(BOOL)a3
{
  if (self->_isCompact != a3)
  {
    BOOL v3 = a3;
    self->_isCompact = a3;
    id v5 = [(SearchUIButtonItemViewController *)self buttonItemView];
    [v5 setIsCompact:v3];

    [(SearchUIButtonItemViewController *)self updateImageForStatusUpdate:0];
  }
}

- (void)buttonPressed
{
  BOOL v3 = [(SearchUIButtonItemViewController *)self feedbackDelegate];
  id v13 = +[SearchUIUtilities environmentForDelegate:v3];

  v4 = [(SearchUIButtonItemViewController *)self view];
  [v13 setSourceView:v4];

  if ([MEMORY[0x1E4FAE198] isMacOS]) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  uint64_t v6 = [(SearchUIButtonItemViewController *)self buttonItem];
  int v7 = [(SearchUIButtonItemViewController *)self rowModel];
  v8 = +[SearchUICommandHandler handlerForButton:v6 rowModel:v7 environment:v13];

  [v8 executeWithTriggerEvent:v5];
  id v9 = [(SearchUIButtonItemViewController *)self buttonDelegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    v10 = [(SearchUIButtonItemViewController *)self buttonDelegate];
    char v11 = [(SearchUIButtonItemViewController *)self buttonItem];
    [v10 buttonItemPressed:v11];
  }
  char v12 = [(SearchUIButtonItemViewController *)self buttonItem];
  [v12 buttonPressed];
}

- (id)previewCommandHandler
{
  BOOL v3 = [(SearchUIButtonItemViewController *)self feedbackDelegate];
  v4 = +[SearchUIUtilities environmentForDelegate:v3];

  uint64_t v5 = [(SearchUIButtonItemViewController *)self buttonItem];
  uint64_t v6 = [(SearchUIButtonItemViewController *)self rowModel];
  int v7 = +[SearchUICommandHandler handlerForButton:v5 rowModel:v6 environment:v4];

  return v7;
}

- (id)customPreviewMenu
{
  uint64_t v2 = [(SearchUIButtonItemViewController *)self buttonItem];
  BOOL v3 = [v2 previewMenu];

  return v3;
}

- (void)stateDidChangeForButtonItem:(id)a3
{
  id v9 = a3;
  v4 = [(SearchUIButtonItemViewController *)self buttonItem];
  int v5 = [v9 isEqual:v4];

  if (v5)
  {
    uint64_t v6 = [(SearchUIButtonItemViewController *)self buttonDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(SearchUIButtonItemViewController *)self buttonDelegate];
      [v8 stateDidChangeForButtonItem:v9];
    }
    [(SearchUIButtonItemViewController *)self updateWithButtonItem:v9 buttonItemViewType:[(SearchUIButtonItemViewController *)self buttonItemViewStyle] isStatusUpdate:1];
  }
}

- (BOOL)supportsContextMenuConfiguration
{
  BOOL v3 = [(SearchUIButtonItemViewController *)self buttonItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(SearchUIButtonItemViewController *)self buttonItemView];
    int v5 = [v4 drawsTitle];

    int v6 = v5 ^ 1;
  }
  else
  {
    int v6 = 1;
  }

  char v7 = [(SearchUIButtonItemViewController *)self buttonItem];
  if ([v7 allowsContextMenu])
  {
    v8 = [(SearchUIButtonItemViewController *)self view];
    int v9 = +[SearchUIUtilities deviceIsAuthenticatedForView:v8];
    if (((v9 ^ 1 | v6) & 1) == 0)
    {
      v10 = [(SearchUIButtonItemViewController *)self buttonItemView];
      LOBYTE(v9) = [v10 showsMenuAsPrimaryAction];
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (NUIContainerBoxView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (SearchUIButtonItem)buttonItem
{
  return self->_buttonItem;
}

- (void)setButtonItem:(id)a3
{
}

- (unint64_t)buttonItemViewStyle
{
  return self->_buttonItemViewStyle;
}

- (void)setButtonItemViewStyle:(unint64_t)a3
{
  self->_buttonItemViewStyle = a3;
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return (SearchUIFeedbackDelegate *)WeakRetained;
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (SearchUIRowModel)rowModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rowModel);
  return (SearchUIRowModel *)WeakRetained;
}

- (void)setRowModel:(id)a3
{
}

- (SearchUIButtonItemViewControllerDelegate)buttonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonDelegate);
  return (SearchUIButtonItemViewControllerDelegate *)WeakRetained;
}

- (void)setButtonDelegate:(id)a3
{
}

- (UIFont)buttonFont
{
  return self->_buttonFont;
}

- (void)setButtonFont:(id)a3
{
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (void)setButtonItemView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonItemView, 0);
  objc_storeStrong((id *)&self->_buttonFont, 0);
  objc_destroyWeak((id *)&self->_buttonDelegate);
  objc_destroyWeak((id *)&self->_rowModel);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_storeStrong((id *)&self->_buttonItem, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
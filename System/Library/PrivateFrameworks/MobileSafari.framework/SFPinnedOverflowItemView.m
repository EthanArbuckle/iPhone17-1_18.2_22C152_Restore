@interface SFPinnedOverflowItemView
- (SFPinnedOverflowItemView)initWithFrame:(CGRect)a3;
- (SFPinnedOverflowMenuVisibilityDelegate)delegate;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation SFPinnedOverflowItemView

- (SFPinnedOverflowItemView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SFPinnedOverflowItemView;
  v3 = -[SFUnifiedBarItemView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SFUnifiedBarItemView *)v3 contentView];
    id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
    v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward.2"];
    v8 = (void *)[v6 initWithImage:v7];

    [v8 setAutoresizingMask:18];
    [v8 setContentMode:4];
    [v5 bounds];
    objc_msgSend(v8, "setFrame:");
    v9 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:2];
    [v8 setPreferredSymbolConfiguration:v9];

    [v5 addSubview:v8];
    [(SFPinnedOverflowItemView *)v4 setShowsMenuAsPrimaryAction:1];
    v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(SFPinnedOverflowItemView *)v4 setTintColor:v10];

    [(UIView *)v4 sf_applyContentSizeCategoryLimitsForToolbarButton];
    v11 = v4;
  }
  return v4;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SFPinnedOverflowItemView;
  [(SFPinnedOverflowItemView *)&v7 contextMenuInteraction:a3 willDisplayMenuForConfiguration:a4 animator:a5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained pinnedOverflowItemViewWillShowMenu:self];
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)SFPinnedOverflowItemView;
  id v8 = a5;
  [(SFPinnedOverflowItemView *)&v14 contextMenuInteraction:a3 willEndForConfiguration:a4 animator:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__SFPinnedOverflowItemView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v11[3] = &unk_1E54E9A60;
  id v12 = WeakRetained;
  objc_super v13 = self;
  id v10 = WeakRetained;
  [v8 addCompletion:v11];
}

uint64_t __84__SFPinnedOverflowItemView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 pinnedOverflowItemViewDidHideMenu:v4];
  }
  return result;
}

- (SFPinnedOverflowMenuVisibilityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFPinnedOverflowMenuVisibilityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
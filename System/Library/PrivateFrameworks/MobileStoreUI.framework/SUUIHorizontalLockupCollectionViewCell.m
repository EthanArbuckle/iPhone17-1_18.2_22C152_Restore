@interface SUUIHorizontalLockupCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)_isActionsScrollViewEnabled;
- (BOOL)isDeleteButtonHidden;
- (BOOL)isScrollingCellToHideActionButton;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIHorizontalLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInset;
- (id)_attributedStringForActionButton:(id)a3 context:(id)a4;
- (id)_editControlImage;
- (id)_highlightBackgroundColor;
- (id)viewForElementIdentifier:(id)a3;
- (void)_actionButtonAction:(id)a3;
- (void)_addEditControlAnimated:(BOOL)a3;
- (void)_reloadActionsScrollViewWithViewElement:(id)a3 context:(id)a4;
- (void)_reloadHighlightBackgroundView;
- (void)_reloadLockupViewBackgroundColor;
- (void)_removeEditControlAnimated:(BOOL)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)hideDeleteButton;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setPerspectiveTargetView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setVanishingPoint:(CGPoint)a3;
- (void)updateForChangedDistanceFromVanishingPoint;
@end

@implementation SUUIHorizontalLockupCollectionViewCell

- (SUUIHorizontalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUIHorizontalLockupView alloc];
    [(SUUIHorizontalLockupCollectionViewCell *)v3 bounds];
    uint64_t v5 = -[SUUIHorizontalLockupView initWithFrame:](v4, "initWithFrame:");
    lockupView = v3->_lockupView;
    v3->_lockupView = (SUUIHorizontalLockupView *)v5;

    v7 = [(SUUIHorizontalLockupCollectionViewCell *)v3 contentView];
    [v7 addSubview:v3->_lockupView];
  }
  return v3;
}

- (void)dealloc
{
  [(UIButton *)self->_actionButton removeTarget:self action:0 forControlEvents:4095];
  [(SUUICellScrollView *)self->_actionsScrollView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  [(SUUIHorizontalLockupCollectionViewCell *)&v3 dealloc];
}

- (void)hideDeleteButton
{
}

- (BOOL)isDeleteButtonHidden
{
  actionsScrollView = self->_actionsScrollView;
  BOOL result = 1;
  if (actionsScrollView)
  {
    [(SUUICellScrollView *)actionsScrollView contentOffset];
    if (v3 > 0.0) {
      return 0;
    }
  }
  return result;
}

- (BOOL)isScrollingCellToHideActionButton
{
  actionsScrollView = self->_actionsScrollView;
  BOOL result = 0;
  if (actionsScrollView)
  {
    [(SUUICellScrollView *)actionsScrollView contentOffset];
    if (v4 != 0.0)
    {
      [(SUUICellScrollView *)self->_actionsScrollView contentOffset];
      double v6 = v5;
      [(UIButton *)self->_actionButton frame];
      if (v6 < v7) {
        return 1;
      }
    }
  }
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    [(SUUIHorizontalLockupCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if ((((self->_editModeControl == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      [(SUUIHorizontalLockupCollectionViewCell *)self _addEditControlAnimated:a4];
    }
    else {
      [(SUUIHorizontalLockupCollectionViewCell *)self _removeEditControlAnimated:a4];
    }
    -[SUUICellScrollView setContentOffset:animated:](self->_actionsScrollView, "setContentOffset:animated:", 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    actionsScrollView = self->_actionsScrollView;
    BOOL v6 = [(SUUIHorizontalLockupCollectionViewCell *)self _isActionsScrollViewEnabled];
    [(SUUICellScrollView *)actionsScrollView setScrollEnabled:v6];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  double v5 = [v4 backgroundColor];
  lockupViewBackgroundColor = self->_lockupViewBackgroundColor;
  self->_lockupViewBackgroundColor = v5;

  if (self->_lockupViewBackgroundColor) {
    -[SUUIHorizontalLockupView setBackgroundColor:](self->_lockupView, "setBackgroundColor:");
  }
  v7.receiver = self;
  v7.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  [(SUUICollectionViewCell *)&v7 applyLayoutAttributes:v4];
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  +[SUUIHorizontalLockupView maximumPerspectiveHeightForSize:](SUUIHorizontalLockupView, "maximumPerspectiveHeightForSize:", a3.width, a3.height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  lockupView = self->_lockupView;
  id v4 = a3;
  [(SUUIHorizontalLockupView *)lockupView setPerspectiveTargetView:v4];
}

- (void)setVanishingPoint:(CGPoint)a3
{
}

- (void)updateForChangedDistanceFromVanishingPoint
{
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIHorizontalLockupView prefetchResourcesForViewElement:a3 reason:a4 context:a5];
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  +[SUUIHorizontalLockupView sizeThatFitsWidth:a4 viewElement:a5 context:a3];
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v19 = a3;
  id v8 = a5;
  [(SUUIHorizontalLockupCollectionViewCell *)self _reloadActionsScrollViewWithViewElement:v19 context:v8];
  double v9 = [v8 aggregateValueForKey:@"SUUIHorizontalLockupShowsEditModeKey"];
  int v10 = [v9 BOOLValue];

  double v11 = [v19 firstChildForElementType:18];
  editModeCheckboxElement = self->_editModeCheckboxElement;
  self->_editModeCheckboxElement = v11;

  if (v10) {
    BOOL v13 = self->_editModeCheckboxElement != 0;
  }
  else {
    BOOL v13 = 0;
  }
  [(SUUIHorizontalLockupCollectionViewCell *)self setEditing:v13 animated:0];
  editModeControl = self->_editModeControl;
  if (editModeControl)
  {
    v15 = [(SUUIHorizontalLockupCollectionViewCell *)self _editControlImage];
    [(UIImageView *)editModeControl setImage:v15];
  }
  -[SUUICellScrollView setContentOffset:animated:](self->_actionsScrollView, "setContentOffset:animated:", 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(SUUICellScrollView *)self->_actionsScrollView setScrollEnabled:[(SUUIHorizontalLockupCollectionViewCell *)self _isActionsScrollViewEnabled]];
  [(SUUIHorizontalLockupView *)self->_lockupView reloadWithViewElement:v19 width:v8 context:a4];
  if (!self->_lockupViewBackgroundColor)
  {
    v16 = [(SUUIHorizontalLockupView *)self->_lockupView preferredBackgroundColor];

    if (v16)
    {
      v17 = [(SUUIHorizontalLockupView *)self->_lockupView preferredBackgroundColor];
      lockupViewBackgroundColor = self->_lockupViewBackgroundColor;
      self->_lockupViewBackgroundColor = v17;
    }
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SUUIHorizontalLockupView *)self->_lockupView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SUUIHorizontalLockupView *)self->_lockupView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SUUIHorizontalLockupView *)self->_lockupView viewForElementIdentifier:a3];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  [(SUUICollectionViewCell *)&v4 setHighlighted:a3];
  if (!self->_editModeControl) {
    [(SUUIHorizontalLockupCollectionViewCell *)self _reloadHighlightBackgroundView];
  }
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  [(SUUICollectionViewCell *)&v4 setSelected:a3];
  if (!self->_editModeControl) {
    [(SUUIHorizontalLockupCollectionViewCell *)self _reloadHighlightBackgroundView];
  }
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  [(SUUICollectionViewCell *)&v29 layoutSubviews];
  double v3 = [(SUUIHorizontalLockupCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  editModeControl = self->_editModeControl;
  CGFloat v28 = v5;
  if (editModeControl)
  {
    [(UIImageView *)editModeControl frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v17 = v5 + 15.0;
    float v18 = v7 + (v11 - v15) * 0.5;
    CGFloat v19 = floorf(v18);
    -[UIImageView setFrame:](self->_editModeControl, "setFrame:", v17, v19);
    v30.origin.x = v17;
    v30.origin.y = v19;
    v30.size.width = v14;
    v30.size.height = v16;
    double v5 = CGRectGetMaxX(v30) + 15.0 - self->_contentInset.left;
  }
  -[SUUIHorizontalLockupView setContentInset:](self->_lockupView, "setContentInset:", self->_contentInset.top, self->_contentInset.left, self->_contentInset.bottom, self->_contentInset.right);
  actionsScrollView = self->_actionsScrollView;
  if (actionsScrollView)
  {
    -[SUUICellScrollView setFrame:](actionsScrollView, "setFrame:", v5, v7, v9, v11);
    -[SUUIHorizontalLockupView setFrame:](self->_lockupView, "setFrame:", 0.0, v7, v9, v11);
    [(UIButton *)self->_actionButton frame];
    CGFloat v22 = v21;
    v31.origin.x = 0.0;
    v31.origin.y = v7;
    v31.size.width = v9;
    v31.size.height = v11;
    CGFloat MaxX = CGRectGetMaxX(v31);
    -[UIButton sizeThatFits:](self->_actionButton, "sizeThatFits:", 1.79769313e308, v11);
    double v25 = v24;
    [(UIButton *)self->_actionButton setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(MaxX, v22, v24, v11, v28, v7, v9, v11)];
    actionButton = self->_actionButton;
    [(SUUICellScrollView *)self->_actionsScrollView contentOffset];
    [(UIButton *)actionButton setHidden:v27 < 0.00000011920929];
    -[SUUICellScrollView setContentSize:](self->_actionsScrollView, "setContentSize:", v9 + v25, v11);
  }
  else
  {
    [(SUUIHorizontalLockupView *)self->_lockupView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v5, v7, v9, v11, v28, v7, v9, v11)];
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  -[SUUIHorizontalLockupCollectionViewCell setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(SUUIHorizontalLockupView *)self->_lockupView setSemanticContentAttribute:a3];
  [(SUUICellScrollView *)self->_actionsScrollView setSemanticContentAttribute:a3];
  [(UIButton *)self->_actionButton setSemanticContentAttribute:a3];
}

- (void)setBackgroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  [(SUUICollectionViewCell *)&v4 setBackgroundColor:a3];
  [(SUUIHorizontalLockupCollectionViewCell *)self _reloadLockupViewBackgroundColor];
}

- (void)_actionButtonAction:(id)a3
{
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  SUUICollectionViewForView(self);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v5 = [v9 delegate];
  [v4 contentOffset];
  double v7 = v6;

  if (v7 == 0.0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v8 = [v9 indexPathForCell:self];
    [v5 collectionView:v9 didEndEditingItemAtIndexPath:v8];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v19 = a3;
  [v19 contentOffset];
  double v5 = v4;
  double v6 = SUUICollectionViewForView(self);
  double v7 = [v6 delegate];
  if (v5 <= 0.0
    || (objc_opt_respondsToSelector() & 1) != 0
    && ([v6 indexPathForCell:self],
        double v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v7 collectionView:v6 canScrollCellAtIndexPath:v8],
        v8,
        (v9 & 1) == 0))
  {
    objc_msgSend(v19, "setContentOffset:animated:", 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  }
  else
  {
    [(UIButton *)self->_actionButton frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(SUUIHorizontalLockupView *)self->_lockupView frame];
    double MaxX = CGRectGetMaxX(v21);
    double v17 = v5 - v13;
    if (v5 < v13) {
      double v17 = -0.0;
    }
    -[UIButton setFrame:](self->_actionButton, "setFrame:", MaxX + v17, v11, v13, v15);
    [(UIButton *)self->_actionButton setHidden:v5 < 0.00000011920929];
    if (objc_opt_respondsToSelector())
    {
      float v18 = [v6 indexPathForCell:self];
      [v7 collectionView:v6 willBeginEditingItemAtIndexPath:v18];
    }
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v9 = a3;
  [(UIButton *)self->_actionButton frame];
  double y = a5->y;
  if (v7 * 0.5 <= a5->x)
  {
    objc_msgSend(v9, "setContentOffset:animated:", 1, v7, y);
  }
  else
  {
    objc_msgSend(v9, "setContentOffset:animated:", 1, 0.0, y);
    [(SUUIHorizontalLockupCollectionViewCell *)self scrollViewDidEndScrollingAnimation:v9];
  }
}

- (void)_addEditControlAnimated:(BOOL)a3
{
  id v5 = objc_alloc(MEMORY[0x263F82828]);
  double v6 = [(SUUIHorizontalLockupCollectionViewCell *)self _editControlImage];
  double v7 = (UIImageView *)[v5 initWithImage:v6];
  editModeControl = self->_editModeControl;
  self->_editModeControl = v7;

  id v9 = [(SUUIHorizontalLockupCollectionViewCell *)self contentView];
  [v9 addSubview:self->_editModeControl];
  if (a3)
  {
    [v9 bounds];
    double v11 = v10;
    uint64_t v18 = 0;
    id v19 = (double *)&v18;
    uint64_t v20 = 0x4010000000;
    CGRect v21 = "";
    long long v22 = 0u;
    long long v23 = 0u;
    [(UIImageView *)self->_editModeControl frame];
    *(void *)&long long v22 = v12;
    *((void *)&v22 + 1) = v13;
    *(void *)&long long v23 = v14;
    *((void *)&v23 + 1) = v15;
    CGFloat v16 = v19;
    *(float *)&uint64_t v13 = (v11 - v19[7]) * 0.5;
    v19[4] = -v19[6];
    v16[5] = floorf(*(float *)&v13);
    -[UIImageView setFrame:](self->_editModeControl, "setFrame:");
    [(SUUIHorizontalLockupCollectionViewCell *)self layoutIfNeeded];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __66__SUUIHorizontalLockupCollectionViewCell__addEditControlAnimated___block_invoke;
    v17[3] = &unk_2654008E0;
    v17[4] = self;
    v17[5] = &v18;
    [MEMORY[0x263F82E00] animateWithDuration:v17 animations:0.3];
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    [(SUUIHorizontalLockupCollectionViewCell *)self setNeedsLayout];
  }
}

void __66__SUUIHorizontalLockupCollectionViewCell__addEditControlAnimated___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = 0x402E000000000000;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 824), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 776);
  if (!v3) {
    double v3 = *(void **)(v2 + 840);
  }
  id v7 = v3;
  [v7 frame];
  objc_msgSend(v7, "setFrame:", CGRectGetMaxX(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32))+ 15.0- *(double *)(*(void *)(a1 + 32) + 792), v4, v5, v6);
}

- (id)_attributedStringForActionButton:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 buttonTitleStyle];
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 style];
  }
  double v10 = v9;

  double v11 = SUUIViewElementFontWithStyle(v10);
  if (!v11)
  {
    double v11 = SUUIFontPreferredFontForTextStyle(1);
  }
  uint64_t v12 = [v6 tintColor];
  uint64_t v13 = SUUIViewElementPlainColorWithStyle(v10, v12);

  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x263F825C8] whiteColor];
  }
  uint64_t v14 = [v5 buttonText];
  uint64_t v15 = [v14 attributedStringWithDefaultFont:v11 foregroundColor:v13 style:v10];

  return v15;
}

- (id)_editControlImage
{
  editModeCheckboxElement = self->_editModeCheckboxElement;
  if (editModeCheckboxElement)
  {
    if ([(SUUICheckboxInputViewElement *)editModeCheckboxElement isSelected])
    {
      double v4 = [MEMORY[0x263F827E8] _kitImageNamed:@"UITintedCircularButtonCheckmark" withTrait:0];
      id v5 = [(SUUICheckboxInputViewElement *)self->_editModeCheckboxElement style];
      id v6 = SUUIViewElementPlainColorWithStyle(v5, 0);

      if (v6) {
        [v4 _flatImageWithColor:v6];
      }
      else {
      id v9 = [v4 imageWithRenderingMode:2];
      }

      uint64_t v10 = [v9 _imageThatSuppressesAccessibilityHairlineThickening];
    }
    else
    {
      double v8 = [(SUUIHorizontalLockupCollectionViewCell *)self backgroundColor];
      id v6 = SUUIBorderColorWithBackgroundColor(v8);

      id v9 = [MEMORY[0x263F827E8] _kitImageNamed:@"UIRemoveControlMultiNotCheckedImage" withTrait:0];
      uint64_t v10 = [v9 _flatImageWithColor:v6];
    }
    id v7 = (void *)v10;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)_highlightBackgroundColor
{
  uint64_t v2 = [(SUUIHorizontalLockupCollectionViewCell *)self backgroundColor];
  double v3 = v2;
  if (v2)
  {
    switch(SUUIColorSchemeStyleForColor(v2))
    {
      case 0:
      case 2:
        float v4 = -0.1;
        goto LABEL_6;
      case 1:
      case 3:
        float v4 = 0.2;
LABEL_6:
        uint64_t v5 = SUUIColorByAdjustingBrightness(v3, v4);
        goto LABEL_7;
      default:
        id v6 = 0;
        goto LABEL_8;
    }
  }
  uint64_t v5 = [MEMORY[0x263F825C8] colorWithWhite:0.9 alpha:1.0];
LABEL_7:
  id v6 = (void *)v5;
LABEL_8:

  return v6;
}

- (BOOL)_isActionsScrollViewEnabled
{
  return !self->_editModeControl && self->_actionButtonViewElement != 0;
}

- (void)_reloadActionsScrollViewWithViewElement:(id)a3 context:(id)a4
{
  id v24 = a4;
  id v6 = [a3 firstChildForElementType:3];
  id v7 = [v6 firstChildForElementType:12];
  actionButtonViewElement = self->_actionButtonViewElement;
  self->_actionButtonViewElement = v7;

  if (self->_actionButtonViewElement)
  {
    if (!self->_actionsScrollView)
    {
      id v9 = [SUUICellScrollView alloc];
      [(SUUIHorizontalLockupView *)self->_lockupView frame];
      uint64_t v10 = -[SUUICellScrollView initWithFrame:](v9, "initWithFrame:");
      actionsScrollView = self->_actionsScrollView;
      self->_actionsScrollView = v10;

      uint64_t v12 = self->_actionsScrollView;
      uint64_t v13 = [(SUUIHorizontalLockupView *)self->_lockupView backgroundColor];
      [(SUUICellScrollView *)v12 setBackgroundColor:v13];

      [(SUUICellScrollView *)self->_actionsScrollView setDelegate:self];
      [(SUUICellScrollView *)self->_actionsScrollView setScrollsToTop:0];
      [(SUUICellScrollView *)self->_actionsScrollView setShowsHorizontalScrollIndicator:0];
      lockupView = self->_lockupView;
      [(SUUICellScrollView *)self->_actionsScrollView bounds];
      -[SUUIHorizontalLockupView setFrame:](lockupView, "setFrame:");
      [(SUUICellScrollView *)self->_actionsScrollView addSubview:self->_lockupView];
      uint64_t v15 = [(SUUIHorizontalLockupCollectionViewCell *)self contentView];
      [v15 addSubview:self->_actionsScrollView];
    }
    if (!self->_actionButton)
    {
      CGFloat v16 = (UIButton *)objc_alloc_init(MEMORY[0x263F824E8]);
      actionButton = self->_actionButton;
      self->_actionButton = v16;

      [(UIButton *)self->_actionButton addTarget:self action:sel__actionButtonAction_ forControlEvents:64];
      -[UIButton setContentEdgeInsets:](self->_actionButton, "setContentEdgeInsets:", 0.0, 15.0, 0.0, 15.0);
      [(UIButton *)self->_actionButton setHidden:1];
      uint64_t v18 = [(UIButton *)self->_actionButton titleLabel];
      [v18 setTextAlignment:1];
    }
    id v19 = [(SUUIButtonViewElement *)self->_actionButtonViewElement style];
    uint64_t v20 = [v19 ikBackgroundColor];
    CGRect v21 = [v20 color];

    if (!v21)
    {
      CGRect v21 = [MEMORY[0x263F825C8] systemRedColor];
    }
    long long v22 = self->_actionButton;
    long long v23 = [(SUUIHorizontalLockupCollectionViewCell *)self _attributedStringForActionButton:self->_actionButtonViewElement context:v24];
    [(UIButton *)v22 setAttributedTitle:v23 forState:0];

    [(UIButton *)self->_actionButton setBackgroundColor:v21];
    [(SUUICellScrollView *)self->_actionsScrollView addSubview:self->_actionButton];
  }
  else
  {
    [(UIButton *)self->_actionButton setHidden:1];
  }
}

- (void)_reloadHighlightBackgroundView
{
  if (([(SUUIHorizontalLockupCollectionViewCell *)self isHighlighted] & 1) != 0
    || [(SUUIHorizontalLockupCollectionViewCell *)self isSelected])
  {
    highlightBackgroundView = self->_highlightBackgroundView;
    if (!highlightBackgroundView)
    {
      [(SUUIHorizontalLockupCollectionViewCell *)self bounds];
      double v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v4, v5, v6, v7);
      id v9 = self->_highlightBackgroundView;
      self->_highlightBackgroundView = v8;

      uint64_t v10 = self->_highlightBackgroundView;
      double v11 = [(SUUIHorizontalLockupCollectionViewCell *)self _highlightBackgroundColor];
      [(UIView *)v10 setBackgroundColor:v11];

      highlightBackgroundView = self->_highlightBackgroundView;
    }
    [(SUUIHorizontalLockupCollectionViewCell *)self insertSubview:highlightBackgroundView atIndex:0];
    [(SUUIHorizontalLockupCollectionViewCell *)self _reloadLockupViewBackgroundColor];
  }
  else
  {
    uint64_t v12 = self->_highlightBackgroundView;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = self->_highlightBackgroundView;
      self->_highlightBackgroundView = 0;

      objc_initWeak(&location, self);
      [MEMORY[0x263F158F8] begin];
      uint64_t v15 = (void *)MEMORY[0x263F158F8];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __72__SUUIHorizontalLockupCollectionViewCell__reloadHighlightBackgroundView__block_invoke;
      v17[3] = &unk_265402A38;
      CGFloat v16 = v13;
      uint64_t v18 = v16;
      objc_copyWeak(&v19, &location);
      [v15 setCompletionBlock:v17];
      [(UIView *)v16 setAlpha:0.0];
      [MEMORY[0x263F158F8] commit];
      objc_destroyWeak(&v19);

      objc_destroyWeak(&location);
    }
  }
}

void __72__SUUIHorizontalLockupCollectionViewCell__reloadHighlightBackgroundView__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _reloadLockupViewBackgroundColor];
}

- (void)_reloadLockupViewBackgroundColor
{
  id v8 = [(SUUIHorizontalLockupView *)self->_lockupView metadataBackgroundView];
  if (([(SUUIHorizontalLockupCollectionViewCell *)self isHighlighted] & 1) != 0
    || ([(SUUIHorizontalLockupCollectionViewCell *)self isSelected] & 1) != 0
    || self->_highlightBackgroundView)
  {
    lockupView = self->_lockupView;
    double v4 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIHorizontalLockupView *)lockupView setBackgroundColor:v4];

    if (v8)
    {
      double v5 = [MEMORY[0x263F825C8] clearColor];
      [v8 setBackgroundColor:v5];
    }
  }
  else if (self->_lockupViewBackgroundColor)
  {
    -[SUUIHorizontalLockupView setBackgroundColor:](self->_lockupView, "setBackgroundColor:");
    if (v8) {
      [v8 setBackgroundColor:self->_lockupViewBackgroundColor];
    }
  }
  actionsScrollView = self->_actionsScrollView;
  double v7 = [(SUUIHorizontalLockupView *)self->_lockupView backgroundColor];
  [(SUUICellScrollView *)actionsScrollView setBackgroundColor:v7];
}

- (void)_removeEditControlAnimated:(BOOL)a3
{
  double v5 = self->_editModeControl;
  editModeControl = self->_editModeControl;
  self->_editModeControl = 0;

  if (a3)
  {
    double v7 = [(SUUIHorizontalLockupCollectionViewCell *)self contentView];
    [v7 bounds];
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;

    CGFloat v16 = (void *)MEMORY[0x263F82E00];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __69__SUUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke;
    v19[3] = &unk_265403B48;
    uint64_t v20 = v5;
    CGRect v21 = self;
    uint64_t v22 = v9;
    uint64_t v23 = v11;
    uint64_t v24 = v13;
    uint64_t v25 = v15;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __69__SUUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke_2;
    v17[3] = &unk_265400AC8;
    uint64_t v18 = v20;
    [v16 animateWithDuration:v19 animations:v17 completion:0.3];
  }
  else
  {
    [(UIImageView *)v5 removeFromSuperview];
    [(SUUIHorizontalLockupCollectionViewCell *)self setNeedsLayout];
  }
}

uint64_t __69__SUUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  [*(id *)(a1 + 32) setFrame:-v2];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 776), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v3 = *(void **)(*(void *)(a1 + 40) + 840);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  return objc_msgSend(v3, "setFrame:", v4, v5, v6, v7);
}

uint64_t __69__SUUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundView, 0);
  objc_storeStrong((id *)&self->_editModeControl, 0);
  objc_storeStrong((id *)&self->_editModeCheckboxElement, 0);
  objc_storeStrong((id *)&self->_actionsScrollView, 0);
  objc_storeStrong((id *)&self->_actionButtonViewElement, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end
@interface SKUIHorizontalLockupCollectionViewCell
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
- (SKUIHorizontalLockupCollectionViewCell)initWithFrame:(CGRect)a3;
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

@implementation SKUIHorizontalLockupCollectionViewCell

- (SKUIHorizontalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v8) {
        -[SKUIHorizontalLockupCollectionViewCell initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  v16 = -[SKUICollectionViewCell initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = [SKUIHorizontalLockupView alloc];
    [(SKUIHorizontalLockupCollectionViewCell *)v16 bounds];
    uint64_t v18 = -[SKUIHorizontalLockupView initWithFrame:](v17, "initWithFrame:");
    lockupView = v16->_lockupView;
    v16->_lockupView = (SKUIHorizontalLockupView *)v18;

    v20 = [(SKUIHorizontalLockupCollectionViewCell *)v16 contentView];
    [v20 addSubview:v16->_lockupView];
  }
  return v16;
}

- (void)dealloc
{
  [(UIButton *)self->_actionButton removeTarget:self action:0 forControlEvents:4095];
  [(SKUICellScrollView *)self->_actionsScrollView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  [(SKUIHorizontalLockupCollectionViewCell *)&v3 dealloc];
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
    [(SKUICellScrollView *)actionsScrollView contentOffset];
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
    [(SKUICellScrollView *)actionsScrollView contentOffset];
    if (v4 != 0.0)
    {
      [(SKUICellScrollView *)self->_actionsScrollView contentOffset];
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
    [(SKUIHorizontalLockupCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if ((((self->_editModeControl == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      [(SKUIHorizontalLockupCollectionViewCell *)self _addEditControlAnimated:a4];
    }
    else {
      [(SKUIHorizontalLockupCollectionViewCell *)self _removeEditControlAnimated:a4];
    }
    -[SKUICellScrollView setContentOffset:animated:](self->_actionsScrollView, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    actionsScrollView = self->_actionsScrollView;
    BOOL v6 = [(SKUIHorizontalLockupCollectionViewCell *)self _isActionsScrollViewEnabled];
    [(SKUICellScrollView *)actionsScrollView setScrollEnabled:v6];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  double v5 = [v4 backgroundColor];
  lockupViewBackgroundColor = self->_lockupViewBackgroundColor;
  self->_lockupViewBackgroundColor = v5;

  if (self->_lockupViewBackgroundColor) {
    -[SKUIHorizontalLockupView setBackgroundColor:](self->_lockupView, "setBackgroundColor:");
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  [(SKUICollectionViewCell *)&v7 applyLayoutAttributes:v4];
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  +[SKUIHorizontalLockupView maximumPerspectiveHeightForSize:](SKUIHorizontalLockupView, "maximumPerspectiveHeightForSize:", a3.width, a3.height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  lockupView = self->_lockupView;
  id v4 = a3;
  [(SKUIHorizontalLockupView *)lockupView setPerspectiveTargetView:v4];
}

- (void)setVanishingPoint:(CGPoint)a3
{
}

- (void)updateForChangedDistanceFromVanishingPoint
{
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIHorizontalLockupCollectionViewCell prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  BOOL v17 = +[SKUIHorizontalLockupView prefetchResourcesForViewElement:v7 reason:a4 context:v8];

  return v17;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIHorizontalLockupCollectionViewCell preferredSizeForViewElement:context:]();
  }
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIHorizontalLockupCollectionViewCell requestLayoutForViewElement:width:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  +[SKUIHorizontalLockupView requestLayoutForViewElement:v7 width:v8 context:a4];
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIHorizontalLockupCollectionViewCell sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  +[SKUIHorizontalLockupView sizeThatFitsWidth:v7 viewElement:v8 context:a3];
  double v18 = v17;
  double v20 = v19;

  double v21 = v18;
  double v22 = v20;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v19 = a3;
  id v8 = a5;
  [(SKUIHorizontalLockupCollectionViewCell *)self _reloadActionsScrollViewWithViewElement:v19 context:v8];
  BOOL v9 = [v8 aggregateValueForKey:@"SKUIHorizontalLockupShowsEditModeKey"];
  int v10 = [v9 BOOLValue];

  uint64_t v11 = [v19 firstChildForElementType:18];
  editModeCheckboxElement = self->_editModeCheckboxElement;
  self->_editModeCheckboxElement = v11;

  if (v10) {
    BOOL v13 = self->_editModeCheckboxElement != 0;
  }
  else {
    BOOL v13 = 0;
  }
  [(SKUIHorizontalLockupCollectionViewCell *)self setEditing:v13 animated:0];
  editModeControl = self->_editModeControl;
  if (editModeControl)
  {
    uint64_t v15 = [(SKUIHorizontalLockupCollectionViewCell *)self _editControlImage];
    [(UIImageView *)editModeControl setImage:v15];
  }
  -[SKUICellScrollView setContentOffset:animated:](self->_actionsScrollView, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(SKUICellScrollView *)self->_actionsScrollView setScrollEnabled:[(SKUIHorizontalLockupCollectionViewCell *)self _isActionsScrollViewEnabled]];
  [(SKUIHorizontalLockupView *)self->_lockupView reloadWithViewElement:v19 width:v8 context:a4];
  if (!self->_lockupViewBackgroundColor)
  {
    uint64_t v16 = [(SKUIHorizontalLockupView *)self->_lockupView preferredBackgroundColor];

    if (v16)
    {
      double v17 = [(SKUIHorizontalLockupView *)self->_lockupView preferredBackgroundColor];
      lockupViewBackgroundColor = self->_lockupViewBackgroundColor;
      self->_lockupViewBackgroundColor = v17;
    }
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SKUIHorizontalLockupView *)self->_lockupView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SKUIHorizontalLockupView *)self->_lockupView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SKUIHorizontalLockupView *)self->_lockupView viewForElementIdentifier:a3];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  [(SKUICollectionViewCell *)&v4 setHighlighted:a3];
  if (!self->_editModeControl) {
    [(SKUIHorizontalLockupCollectionViewCell *)self _reloadHighlightBackgroundView];
  }
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  [(SKUICollectionViewCell *)&v4 setSelected:a3];
  if (!self->_editModeControl) {
    [(SKUIHorizontalLockupCollectionViewCell *)self _reloadHighlightBackgroundView];
  }
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  [(SKUICollectionViewCell *)&v31 layoutSubviews];
  double v3 = [(SKUIHorizontalLockupCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  editModeControl = self->_editModeControl;
  CGFloat v30 = v5;
  if (editModeControl)
  {
    [(UIImageView *)editModeControl frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v17 = v5 + 15.0;
    float v18 = v7 + (v11 - v15) * 0.5;
    CGFloat v19 = floorf(v18);
    -[UIImageView setFrame:](self->_editModeControl, "setFrame:", v17, v19);
    v32.origin.double x = v17;
    v32.origin.double y = v19;
    v32.size.double width = v14;
    v32.size.double height = v16;
    double v5 = CGRectGetMaxX(v32) + 15.0 - self->_contentInset.left;
  }
  -[SKUIHorizontalLockupView setContentInset:](self->_lockupView, "setContentInset:", self->_contentInset.top, self->_contentInset.left, self->_contentInset.bottom, self->_contentInset.right);
  actionsScrollView = self->_actionsScrollView;
  if (actionsScrollView)
  {
    -[SKUICellScrollView setFrame:](actionsScrollView, "setFrame:", v5, v7, v9, v11);
    -[SKUIHorizontalLockupView setFrame:](self->_lockupView, "setFrame:", 0.0, v7, v9, v11);
    [(UIButton *)self->_actionButton frame];
    CGFloat v22 = v21;
    v33.origin.double x = 0.0;
    v33.origin.double y = v7;
    v33.size.double width = v9;
    v33.size.double height = v11;
    CGFloat MaxX = CGRectGetMaxX(v33);
    -[UIButton sizeThatFits:](self->_actionButton, "sizeThatFits:", 1.79769313e308, v11);
    double v25 = v24;
    actionButton = self->_actionButton;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(MaxX, v22, v24, v11, v30, v7, v9, v11);
    -[UIButton setFrame:](actionButton, "setFrame:");
    v27 = self->_actionButton;
    [(SKUICellScrollView *)self->_actionsScrollView contentOffset];
    [(UIButton *)v27 setHidden:v28 < 0.00000011920929];
    -[SKUICellScrollView setContentSize:](self->_actionsScrollView, "setContentSize:", v9 + v25, v11);
  }
  else
  {
    lockupView = self->_lockupView;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v5, v7, v9, v11, v30, v7, v9, v11);
    -[SKUIHorizontalLockupView setFrame:](lockupView, "setFrame:");
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  -[SKUIHorizontalLockupCollectionViewCell setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(SKUIHorizontalLockupView *)self->_lockupView setSemanticContentAttribute:a3];
  [(SKUICellScrollView *)self->_actionsScrollView setSemanticContentAttribute:a3];
  [(UIButton *)self->_actionButton setSemanticContentAttribute:a3];
}

- (void)setBackgroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  [(SKUICollectionViewCell *)&v4 setBackgroundColor:a3];
  [(SKUIHorizontalLockupCollectionViewCell *)self _reloadLockupViewBackgroundColor];
}

- (void)_actionButtonAction:(id)a3
{
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  SKUICollectionViewForView(self);
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
  double v6 = SKUICollectionViewForView(self);
  double v7 = [v6 delegate];
  if (v5 <= 0.0
    || (objc_opt_respondsToSelector() & 1) != 0
    && ([v6 indexPathForCell:self],
        double v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v7 collectionView:v6 canScrollCellAtIndexPath:v8],
        v8,
        (v9 & 1) == 0))
  {
    objc_msgSend(v19, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  else
  {
    [(UIButton *)self->_actionButton frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(SKUIHorizontalLockupView *)self->_lockupView frame];
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
    [(SKUIHorizontalLockupCollectionViewCell *)self scrollViewDidEndScrollingAnimation:v9];
  }
}

- (void)_addEditControlAnimated:(BOOL)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v6 = [(SKUIHorizontalLockupCollectionViewCell *)self _editControlImage];
  double v7 = (UIImageView *)[v5 initWithImage:v6];
  editModeControl = self->_editModeControl;
  self->_editModeControl = v7;

  id v9 = [(SKUIHorizontalLockupCollectionViewCell *)self contentView];
  [v9 addSubview:self->_editModeControl];
  if (a3)
  {
    [v9 bounds];
    double v11 = v10;
    uint64_t v18 = 0;
    id v19 = (double *)&v18;
    uint64_t v20 = 0x4010000000;
    CGRect v21 = &unk_1C1D0F257;
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
    [(SKUIHorizontalLockupCollectionViewCell *)self layoutIfNeeded];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__SKUIHorizontalLockupCollectionViewCell__addEditControlAnimated___block_invoke;
    v17[3] = &unk_1E6422538;
    v17[4] = self;
    v17[5] = &v18;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v17 animations:0.3];
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    [(SKUIHorizontalLockupCollectionViewCell *)self setNeedsLayout];
  }
}

void __66__SKUIHorizontalLockupCollectionViewCell__addEditControlAnimated___block_invoke(uint64_t a1)
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

  double v11 = SKUIViewElementFontWithStyle(v10);
  if (!v11)
  {
    double v11 = SKUIFontPreferredFontForTextStyle(1);
  }
  uint64_t v12 = [v6 tintColor];
  uint64_t v13 = SKUIViewElementPlainColorWithStyle(v10, v12);

  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4FB1618] whiteColor];
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
    if ([(SKUICheckboxInputViewElement *)editModeCheckboxElement isSelected])
    {
      double v4 = [MEMORY[0x1E4FB1818] _kitImageNamed:@"UITintedCircularButtonCheckmark" withTrait:0];
      id v5 = [(SKUICheckboxInputViewElement *)self->_editModeCheckboxElement style];
      id v6 = SKUIViewElementPlainColorWithStyle(v5, 0);

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
      double v8 = [(SKUIHorizontalLockupCollectionViewCell *)self backgroundColor];
      id v6 = SKUIBorderColorWithBackgroundColor(v8);

      id v9 = [MEMORY[0x1E4FB1818] _kitImageNamed:@"UIRemoveControlMultiNotCheckedImage" withTrait:0];
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
  uint64_t v2 = [(SKUIHorizontalLockupCollectionViewCell *)self backgroundColor];
  double v3 = v2;
  if (v2)
  {
    switch(SKUIColorSchemeStyleForColor(v2))
    {
      case 0:
      case 2:
        float v4 = -0.1;
        goto LABEL_6;
      case 1:
      case 3:
        float v4 = 0.2;
LABEL_6:
        uint64_t v5 = SKUIColorByAdjustingBrightness(v3, v4);
        goto LABEL_7;
      default:
        id v6 = 0;
        goto LABEL_8;
    }
  }
  uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:1.0];
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
      id v9 = [SKUICellScrollView alloc];
      [(SKUIHorizontalLockupView *)self->_lockupView frame];
      uint64_t v10 = -[SKUICellScrollView initWithFrame:](v9, "initWithFrame:");
      actionsScrollView = self->_actionsScrollView;
      self->_actionsScrollView = v10;

      uint64_t v12 = self->_actionsScrollView;
      uint64_t v13 = [(SKUIHorizontalLockupView *)self->_lockupView backgroundColor];
      [(SKUICellScrollView *)v12 setBackgroundColor:v13];

      [(SKUICellScrollView *)self->_actionsScrollView setDelegate:self];
      [(SKUICellScrollView *)self->_actionsScrollView setScrollsToTop:0];
      [(SKUICellScrollView *)self->_actionsScrollView setShowsHorizontalScrollIndicator:0];
      lockupView = self->_lockupView;
      [(SKUICellScrollView *)self->_actionsScrollView bounds];
      -[SKUIHorizontalLockupView setFrame:](lockupView, "setFrame:");
      [(SKUICellScrollView *)self->_actionsScrollView addSubview:self->_lockupView];
      uint64_t v15 = [(SKUIHorizontalLockupCollectionViewCell *)self contentView];
      [v15 addSubview:self->_actionsScrollView];
    }
    if (!self->_actionButton)
    {
      CGFloat v16 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
      actionButton = self->_actionButton;
      self->_actionButton = v16;

      [(UIButton *)self->_actionButton addTarget:self action:sel__actionButtonAction_ forControlEvents:64];
      -[UIButton setContentEdgeInsets:](self->_actionButton, "setContentEdgeInsets:", 0.0, 15.0, 0.0, 15.0);
      [(UIButton *)self->_actionButton setHidden:1];
      uint64_t v18 = [(UIButton *)self->_actionButton titleLabel];
      [v18 setTextAlignment:1];
    }
    id v19 = [(SKUIButtonViewElement *)self->_actionButtonViewElement style];
    uint64_t v20 = [v19 ikBackgroundColor];
    CGRect v21 = [v20 color];

    if (!v21)
    {
      CGRect v21 = [MEMORY[0x1E4FB1618] systemRedColor];
    }
    long long v22 = self->_actionButton;
    long long v23 = [(SKUIHorizontalLockupCollectionViewCell *)self _attributedStringForActionButton:self->_actionButtonViewElement context:v24];
    [(UIButton *)v22 setAttributedTitle:v23 forState:0];

    [(UIButton *)self->_actionButton setBackgroundColor:v21];
    [(SKUICellScrollView *)self->_actionsScrollView addSubview:self->_actionButton];
  }
  else
  {
    [(UIButton *)self->_actionButton setHidden:1];
  }
}

- (void)_reloadHighlightBackgroundView
{
  if (([(SKUIHorizontalLockupCollectionViewCell *)self isHighlighted] & 1) != 0
    || [(SKUIHorizontalLockupCollectionViewCell *)self isSelected])
  {
    highlightBackgroundView = self->_highlightBackgroundView;
    if (!highlightBackgroundView)
    {
      [(SKUIHorizontalLockupCollectionViewCell *)self bounds];
      double v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v5, v6, v7);
      id v9 = self->_highlightBackgroundView;
      self->_highlightBackgroundView = v8;

      uint64_t v10 = self->_highlightBackgroundView;
      double v11 = [(SKUIHorizontalLockupCollectionViewCell *)self _highlightBackgroundColor];
      [(UIView *)v10 setBackgroundColor:v11];

      highlightBackgroundView = self->_highlightBackgroundView;
    }
    [(SKUIHorizontalLockupCollectionViewCell *)self insertSubview:highlightBackgroundView atIndex:0];
    [(SKUIHorizontalLockupCollectionViewCell *)self _reloadLockupViewBackgroundColor];
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
      [MEMORY[0x1E4F39CF8] begin];
      uint64_t v15 = (void *)MEMORY[0x1E4F39CF8];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __72__SKUIHorizontalLockupCollectionViewCell__reloadHighlightBackgroundView__block_invoke;
      v17[3] = &unk_1E6422160;
      CGFloat v16 = v13;
      uint64_t v18 = v16;
      objc_copyWeak(&v19, &location);
      [v15 setCompletionBlock:v17];
      [(UIView *)v16 setAlpha:0.0];
      [MEMORY[0x1E4F39CF8] commit];
      objc_destroyWeak(&v19);

      objc_destroyWeak(&location);
    }
  }
}

void __72__SKUIHorizontalLockupCollectionViewCell__reloadHighlightBackgroundView__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _reloadLockupViewBackgroundColor];
}

- (void)_reloadLockupViewBackgroundColor
{
  id v8 = [(SKUIHorizontalLockupView *)self->_lockupView metadataBackgroundView];
  if (([(SKUIHorizontalLockupCollectionViewCell *)self isHighlighted] & 1) != 0
    || ([(SKUIHorizontalLockupCollectionViewCell *)self isSelected] & 1) != 0
    || self->_highlightBackgroundView)
  {
    lockupView = self->_lockupView;
    double v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIHorizontalLockupView *)lockupView setBackgroundColor:v4];

    if (v8)
    {
      double v5 = [MEMORY[0x1E4FB1618] clearColor];
      [v8 setBackgroundColor:v5];
    }
  }
  else if (self->_lockupViewBackgroundColor)
  {
    -[SKUIHorizontalLockupView setBackgroundColor:](self->_lockupView, "setBackgroundColor:");
    if (v8) {
      [v8 setBackgroundColor:self->_lockupViewBackgroundColor];
    }
  }
  actionsScrollView = self->_actionsScrollView;
  double v7 = [(SKUIHorizontalLockupView *)self->_lockupView backgroundColor];
  [(SKUICellScrollView *)actionsScrollView setBackgroundColor:v7];
}

- (void)_removeEditControlAnimated:(BOOL)a3
{
  double v5 = self->_editModeControl;
  editModeControl = self->_editModeControl;
  self->_editModeControl = 0;

  if (a3)
  {
    double v7 = [(SKUIHorizontalLockupCollectionViewCell *)self contentView];
    [v7 bounds];
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;

    CGFloat v16 = (void *)MEMORY[0x1E4FB1EB0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__SKUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke;
    v19[3] = &unk_1E6427D90;
    uint64_t v20 = v5;
    CGRect v21 = self;
    uint64_t v22 = v9;
    uint64_t v23 = v11;
    uint64_t v24 = v13;
    uint64_t v25 = v15;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__SKUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke_2;
    v17[3] = &unk_1E64223D0;
    uint64_t v18 = v20;
    [v16 animateWithDuration:v19 animations:v17 completion:0.3];
  }
  else
  {
    [(UIImageView *)v5 removeFromSuperview];
    [(SKUIHorizontalLockupCollectionViewCell *)self setNeedsLayout];
  }
}

uint64_t __69__SKUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke(uint64_t a1)
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

uint64_t __69__SKUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke_2(uint64_t a1)
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

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIHorizontalLockupCollectionViewCell preferredSizeForViewElement:context:]";
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
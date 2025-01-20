@interface MTCollectionViewCell
+ (Class)_contentViewClass;
+ (double)estimatedHeight;
+ (double)maximumContentWidth;
+ (id)_multiSelectCheckmarkImage;
+ (id)_multiSelectNotSelectedImage;
- (BOOL)exposedActions;
- (BOOL)isEditing;
- (BOOL)isSwipeEnabled;
- (BOOL)showsMoreButton;
- (BOOL)userSwiping;
- (CGRect)contentRectForEditControlWidth:(double)a3;
- (CGRect)editingControlRectInBounds:(CGRect)a3;
- (MTActionButtonContainerView)actionButtonsContainer;
- (MTCollectionView)collectionView;
- (MTCollectionViewCell)initWithFrame:(CGRect)a3;
- (MTCollectionViewCellDelegate)delegate;
- (MTUIFocusedTouchGestureRecognizer)dismissOnTouchRecognizer;
- (UIButton)deleteButton;
- (UIButton)moreButton;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (double)defaultActionButtonsXOriginForScrollFrame:(CGRect)a3 andActionContainerSize:(CGSize)a4;
- (double)targetXOffsetForExposedActions;
- (id)contentView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)mt_collectionView;
- (id)scrollView;
- (unint64_t)swipeState;
- (void)addDismissRecognizer;
- (void)applyLayoutAttributes:(id)a3;
- (void)configureSubviews;
- (void)deleteButtonTapped:(id)a3;
- (void)dismissDelete:(id)a3;
- (void)exposeActionsAnimated:(BOOL)a3;
- (void)hideActionsAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)moreButtonTapCancelled:(id)a3;
- (void)moreButtonTapped:(id)a3;
- (void)prepareForReuse;
- (void)removeDismissRecognizer;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewExposedDelete;
- (void)scrollViewHidDelete;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActionButtonsContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setDismissOnTouchRecognizer:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setMoreButton:(id)a3;
- (void)setOpen:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3;
- (void)setShowsMoreButton:(BOOL)a3;
- (void)setSwipeEnabled:(BOOL)a3;
- (void)setSwipeState:(unint64_t)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setUserSwiping:(BOOL)a3;
@end

@implementation MTCollectionViewCell

+ (double)estimatedHeight
{
  return 100.0;
}

+ (double)maximumContentWidth
{
  return 1.79769313e308;
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

+ (id)_multiSelectCheckmarkImage
{
  v2 = (void *)qword_10060A830;
  if (!qword_10060A830)
  {
    v3 = +[UIImage imageNamed:@"UITintedCircularButtonCheckmark.png"];
    v4 = [v3 imageWithRenderingMode:2];
    uint64_t v5 = [v4 _imageThatSuppressesAccessibilityHairlineThickening];
    v6 = (void *)qword_10060A830;
    qword_10060A830 = v5;

    v2 = (void *)qword_10060A830;
  }

  return v2;
}

+ (id)_multiSelectNotSelectedImage
{
  v2 = (void *)qword_10060A838;
  if (!qword_10060A838)
  {
    v3 = +[UIImage imageNamed:@"UIRemoveControlMultiNotCheckedImage.png"];
    [v3 size];
    double v5 = v4;
    double v7 = v6;
    v8 = +[UIColor colorWithRed:0.780392157 green:0.780392157 blue:0.8 alpha:1.0];
    uint64_t v9 = +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v8, 0, v3, 0, v5, v7);
    v10 = (void *)qword_10060A838;
    qword_10060A838 = v9;

    v2 = (void *)qword_10060A838;
  }

  return v2;
}

- (MTCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTCollectionViewCell;
  v3 = -[MTCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(MTCollectionViewCell *)v3 configureSubviews];
    [(MTCollectionViewCell *)v4 setPreservesSuperviewLayoutMargins:1];
  }
  return v4;
}

- (void)configureSubviews
{
  v3 = [(MTCollectionViewCell *)self scrollView];
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setAlwaysBounceHorizontal:1];
  [(UIScrollView *)self->_scrollView setClipsToBounds:1];
  [(UIScrollView *)self->_scrollView setDelegate:self];
  [(UIScrollView *)self->_scrollView setScrollsToTop:0];
  [(UIScrollView *)self->_scrollView setPreservesSuperviewLayoutMargins:1];
  [(UIScrollView *)self->_scrollView setAutoresizingMask:16];
  double v5 = self->_scrollView;
  objc_super v6 = [(MTCollectionViewCell *)self contentView];
  [(UIScrollView *)v5 addSubview:v6];

  double v7 = self->_scrollView;
  v8 = [(MTCollectionViewCell *)self actionButtonsContainer];
  uint64_t v9 = [(MTCollectionViewCell *)self contentView];
  [(UIScrollView *)v7 insertSubview:v8 below:v9];

  id v10 = objc_alloc((Class)UIImageView);
  v11 = [(id)objc_opt_class() _multiSelectNotSelectedImage];
  v12 = (UIImageView *)[v10 initWithImage:v11];
  editingControl = self->_editingControl;
  self->_editingControl = v12;

  [(UIImageView *)self->_editingControl sizeToFit];
  [(UIScrollView *)self->_scrollView addSubview:self->_editingControl];

  [(MTCollectionViewCell *)self setShowsMoreButton:1];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MTCollectionViewCell;
  -[MTCollectionViewCell hitTest:withEvent:](&v11, "hitTest:withEvent:", a4, a3.x, a3.y);
  objc_super v6 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    double v4 = [(MTCollectionViewCell *)self scrollView];
    double v7 = [v4 panGestureRecognizer];
  }
  else
  {
    double v7 = 0;
  }
  v8 = [(MTCollectionViewCell *)self mt_collectionView];
  [v8 setSwipeGesture:v7];

  if (v6)
  {
  }
  if (v6 == self->_editingControl || v6 == (UIImageView *)self->_scrollView)
  {
    uint64_t v9 = self;

    objc_super v6 = (UIImageView *)v9;
  }

  return v6;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)MTCollectionViewCell;
  [(MTCollectionViewCell *)&v5 prepareForReuse];
  [(MTCollectionViewCell *)self removeDismissRecognizer];
  double y = CGPointZero.y;
  double v4 = [(MTCollectionViewCell *)self scrollView];
  [v4 setContentOffset:CGPointZero.x, y];
}

- (void)setEditing:(BOOL)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(MTCollectionViewCell *)self isEditing] != a3)
  {
    self->_editing = v5;
    if ([(MTCollectionViewCell *)self exposedActions])
    {
      if (!v5) {
        [(MTCollectionViewCell *)self hideActionsAnimated:v4];
      }
    }
    else
    {
      [(MTCollectionViewCell *)self setSwipeEnabled:!v5];
    }
    [(MTCollectionViewCell *)self setNeedsLayout];
    double v7 = 0.3;
    if (!v4) {
      double v7 = 0.0;
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000F6980;
    v8[3] = &unk_10054D570;
    v8[4] = self;
    +[UIView animateWithDuration:v8 animations:v7];
  }
}

- (void)setSelected:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MTCollectionViewCell;
  -[MTCollectionViewCell setSelected:](&v8, "setSelected:");
  editingControl = self->_editingControl;
  objc_super v6 = objc_opt_class();
  if (a3) {
    [v6 _multiSelectCheckmarkImage];
  }
  else {
  double v7 = [v6 _multiSelectNotSelectedImage];
  }
  [(UIImageView *)editingControl setImage:v7];
}

- (BOOL)isSwipeEnabled
{
  v2 = [(MTCollectionViewCell *)self scrollView];
  unsigned __int8 v3 = [v2 isScrollEnabled];

  return v3;
}

- (void)setSwipeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTCollectionViewCell *)self scrollView];
  [v4 setScrollEnabled:v3];
}

- (BOOL)userSwiping
{
  return (id)[(MTCollectionViewCell *)self swipeState] == (id)3
      || (id)[(MTCollectionViewCell *)self swipeState] == (id)1;
}

- (BOOL)exposedActions
{
  return (id)[(MTCollectionViewCell *)self swipeState] == (id)2
      || (id)[(MTCollectionViewCell *)self swipeState] == (id)1;
}

- (void)setShowsMoreButton:(BOOL)a3
{
  if (self->_showsMoreButton != a3)
  {
    self->_showsMoreButton = a3;
    if (a3)
    {
      id v4 = [(MTCollectionViewCell *)self moreButton];
      v9[0] = v4;
      BOOL v5 = [(MTCollectionViewCell *)self deleteButton];
      v9[1] = v5;
      objc_super v6 = +[NSArray arrayWithObjects:v9 count:2];
    }
    else
    {
      id v4 = [(MTCollectionViewCell *)self deleteButton];
      objc_super v8 = v4;
      objc_super v6 = +[NSArray arrayWithObjects:&v8 count:1];
    }

    double v7 = [(MTCollectionViewCell *)self actionButtonsContainer];
    [v7 setActionButtons:v6];

    [(MTCollectionViewCell *)self setNeedsLayout];
  }
}

- (CGRect)contentRectForEditControlWidth:(double)a3
{
  [(MTCollectionViewCell *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ([(MTCollectionViewCell *)self isEditing]
    && ![(MTCollectionViewCell *)self exposedActions])
  {
    double v10 = v10 - a3;
    unsigned int v13 = [(MTCollectionViewCell *)self mt_isRTL];
    double v14 = -0.0;
    if (!v13) {
      double v14 = a3;
    }
    double v6 = v6 + v14;
  }
  double v15 = v6;
  double v16 = v8;
  double v17 = v10;
  double v18 = v12;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.double y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)editingControlRectInBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = +[UIScreen mainScreen];
  [v8 bounds];
  double v10 = v9;

  +[UIView mt_layoutMarginsForWidth:v10];
  double MaxX = v11;
  [(UIImageView *)self->_editingControl frame];
  double v14 = v13;
  double v16 = v15;
  [(MTCollectionViewCell *)self bounds];
  IMRoundToPixel();
  double v18 = v17;
  LODWORD(v8) = [(MTCollectionViewCell *)self mt_isRTL];
  unsigned int v19 = [(MTCollectionViewCell *)self isEditing];
  if (v8)
  {
    if (v19 && ![(MTCollectionViewCell *)self exposedActions])
    {
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v25) - MaxX - v14;
    }
    else
    {
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v24);
    }
  }
  else if (!v19 || [(MTCollectionViewCell *)self exposedActions])
  {
    double MaxX = -v14;
  }
  double v20 = MaxX;
  double v21 = v18;
  double v22 = v14;
  double v23 = v16;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)layoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)MTCollectionViewCell;
  [(MTCollectionViewCell *)&v48 layoutSubviews];
  [(MTCollectionViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[MTCollectionViewCell editingControlRectInBounds:](self, "editingControlRectInBounds:");
  double v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  -[UIImageView setFrame:](self->_editingControl, "setFrame:");
  if ([(MTCollectionViewCell *)self mt_isRTL])
  {
    v49.origin.CGFloat x = v4;
    v49.origin.CGFloat y = v6;
    v49.size.CGFloat width = v8;
    v49.size.CGFloat height = v10;
    double MaxX = CGRectGetMaxX(v49) - v12;
  }
  else
  {
    v50.origin.CGFloat x = v12;
    v50.origin.CGFloat y = v14;
    v50.size.CGFloat width = v16;
    v50.size.CGFloat height = v18;
    double MaxX = CGRectGetMaxX(v50);
  }
  [(MTCollectionViewCell *)self contentRectForEditControlWidth:MaxX];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = [(MTCollectionViewCell *)self contentView];
  [v28 setFrame:v21, v23, v25, v27];

  v29 = [(MTCollectionViewCell *)self scrollView];
  [v29 setFrame:v4, v6, v8, v10];

  v30 = [(MTCollectionViewCell *)self actionButtonsContainer];
  [v30 frame];
  double v32 = v31;

  v33 = [(MTCollectionViewCell *)self actionButtonsContainer];
  [v33 sizeThatFits:v8, v10];
  double v35 = v34;
  double v37 = v36;

  -[MTCollectionViewCell defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:](self, "defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:", v4, v6, v8, v10, v35, v37);
  double v39 = v38;
  v40 = [(MTCollectionViewCell *)self actionButtonsContainer];
  [v40 setFrame:v39, v32, v35, v37];

  v41 = [(MTCollectionViewCell *)self scrollView];
  [v41 contentOffset];
  double v43 = v42;

  if ([(MTCollectionViewCell *)self mt_isRTL]) {
    double v43 = -v43;
  }
  if ((id)[(MTCollectionViewCell *)self swipeState] == (id)2 && v43 < v35)
  {
    if ([(MTCollectionViewCell *)self mt_isRTL]) {
      double v44 = -v35;
    }
    else {
      double v44 = v35;
    }
    v45 = [(MTCollectionViewCell *)self scrollView];
    [v45 setContentOffset:0 animated:v44];
  }
  v51.origin.CGFloat x = v39;
  v51.origin.CGFloat y = v32;
  v51.size.CGFloat width = v35;
  v51.size.CGFloat height = v37;
  double v46 = v8 + CGRectGetWidth(v51);
  v47 = [(MTCollectionViewCell *)self scrollView];
  [v47 setContentSize:v46, v10];
}

- (id)scrollView
{
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    v7.receiver = self;
    v7.super_class = (Class)MTCollectionViewCell;
    double v4 = [(MTCollectionViewCell *)&v7 contentView];
    double v5 = self->_scrollView;
    self->_scrollView = v4;

    scrollView = self->_scrollView;
  }

  return scrollView;
}

- (id)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    double v4 = (UIView *)objc_opt_new();
    double v5 = self->_contentView;
    self->_contentView = v4;

    contentView = self->_contentView;
  }

  return contentView;
}

- (MTActionButtonContainerView)actionButtonsContainer
{
  actionButtonsContainer = self->_actionButtonsContainer;
  if (!actionButtonsContainer)
  {
    double v4 = (MTActionButtonContainerView *)objc_opt_new();
    double v5 = self->_actionButtonsContainer;
    self->_actionButtonsContainer = v4;

    actionButtonsContainer = self->_actionButtonsContainer;
  }

  return actionButtonsContainer;
}

- (MTCollectionView)collectionView
{
  double v3 = [(MTCollectionViewCell *)self superview];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(MTCollectionViewCell *)self superview];
  }
  else
  {
    double v5 = 0;
  }

  return (MTCollectionView *)v5;
}

- (id)mt_collectionView
{
  double v3 = [(MTCollectionViewCell *)self superview];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(MTCollectionViewCell *)self superview];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (UIButton)deleteButton
{
  if (!self->_deleteButton)
  {
    double v3 = +[UIButton buttonWithType:1];
    deleteButton = self->_deleteButton;
    self->_deleteButton = v3;

    double v5 = +[UIColor whiteColor];
    [(UIButton *)self->_deleteButton setTintColor:v5];

    double v6 = +[UIColor systemRedColor];
    [(UIButton *)self->_deleteButton setBackgroundColor:v6];

    objc_super v7 = +[UIFont systemFontOfSize:18.0];
    double v8 = [(UIButton *)self->_deleteButton titleLabel];
    [v8 setFont:v7];

    [(UIButton *)self->_deleteButton addTarget:self action:"deleteButtonTapped:" forControlEvents:64];
    double v9 = self->_deleteButton;
    double v10 = +[NSBundle mainBundle];
    double v11 = [v10 localizedStringForKey:@"Delete" value:&stru_10056A8A0 table:0];
    [(UIButton *)v9 setTitle:v11 forState:0];

    if ([(MTCollectionViewCell *)self mt_isRTL]) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = 1;
    }
    [(UIButton *)self->_deleteButton setAutoresizingMask:v12];
  }
  double v13 = self->_deleteButton;

  return v13;
}

- (UIButton)moreButton
{
  if (!self->_moreButton)
  {
    double v3 = +[UIButton buttonWithType:1];
    moreButton = self->_moreButton;
    self->_moreButton = v3;

    double v5 = +[UIColor whiteColor];
    [(UIButton *)self->_moreButton setTintColor:v5];

    double v6 = +[UIColor _systemMidGrayTintColor];
    [(UIButton *)self->_moreButton setBackgroundColor:v6];

    objc_super v7 = +[UIFont systemFontOfSize:18.0];
    double v8 = [(UIButton *)self->_moreButton titleLabel];
    [v8 setFont:v7];

    [(UIButton *)self->_moreButton addTarget:self action:"moreButtonTapped:" forControlEvents:64];
    [(UIButton *)self->_moreButton addTarget:self action:"moreButtonTapCancelled:" forControlEvents:256];
    double v9 = self->_moreButton;
    double v10 = +[NSBundle mainBundle];
    double v11 = [v10 localizedStringForKey:@"More" value:&stru_10056A8A0 table:0];
    [(UIButton *)v9 setTitle:v11 forState:0];

    if ([(MTCollectionViewCell *)self mt_isRTL]) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = 1;
    }
    [(UIButton *)self->_moreButton setAutoresizingMask:v12];
  }
  double v13 = self->_moreButton;

  return v13;
}

- (void)deleteButtonTapped:(id)a3
{
  double v4 = [(MTCollectionViewCell *)self mt_collectionView];
  [v4 swipeEnded:self];

  id v5 = [(MTCollectionViewCell *)self delegate];
  [v5 cellDidPressDelete:self];
}

- (void)moreButtonTapped:(id)a3
{
  double v4 = [(MTCollectionViewCell *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MTCollectionViewCell *)self delegate];
    [v6 cellDidPressMore:self];
  }
}

- (void)moreButtonTapCancelled:(id)a3
{
  id v6 = a3;
  double v4 = [(MTCollectionViewCell *)self scrollView];
  unsigned int v5 = [v4 isDragging];

  if (v5) {
    [(MTCollectionViewCell *)self moreButtonTapped:v6];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTCollectionViewCell;
  [(MTCollectionViewCell *)&v8 applyLayoutAttributes:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isOpen])
    {
      id v6 = [(MTCollectionViewCell *)self mt_collectionView];
      objc_super v7 = [v6 swipedCellIndexPath];

      if (!v7) {
        [v5 setOpen:0];
      }
    }
    -[MTCollectionViewCell setOpen:animated:](self, "setOpen:animated:", [v5 isOpen], 0);
  }
}

- (void)setOpen:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    [(MTCollectionViewCell *)self exposeActionsAnimated:a4];
    [(MTCollectionViewCell *)self addDismissRecognizer];
  }
  else
  {
    [(MTCollectionViewCell *)self hideActionsAnimated:a4];
    [(MTCollectionViewCell *)self removeDismissRecognizer];
  }
}

- (void)dismissDelete:(id)a3
{
  [(MTCollectionViewCell *)self setOpen:0 animated:1];

  [(MTCollectionViewCell *)self removeDismissRecognizer];
}

- (void)addDismissRecognizer
{
  id v4 = [(MTCollectionViewCell *)self superview];
  double v3 = [(MTCollectionViewCell *)self dismissOnTouchRecognizer];
  [v4 addGestureRecognizer:v3];
}

- (void)removeDismissRecognizer
{
  double v3 = [(MTCollectionViewCell *)self superview];
  id v4 = [(MTCollectionViewCell *)self dismissOnTouchRecognizer];
  [v3 removeGestureRecognizer:v4];

  [(MTCollectionViewCell *)self setDismissOnTouchRecognizer:0];
}

- (MTUIFocusedTouchGestureRecognizer)dismissOnTouchRecognizer
{
  dismissOnTouchRecognizer = self->_dismissOnTouchRecognizer;
  if (!dismissOnTouchRecognizer)
  {
    id v4 = objc_alloc((Class)MTUIFocusedTouchGestureRecognizer);
    id v5 = [(MTCollectionViewCell *)self actionButtonsContainer];
    id v6 = [v4 initWithFocusedView:v5 touchAllowance:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
    objc_super v7 = self->_dismissOnTouchRecognizer;
    self->_dismissOnTouchRecognizer = v6;

    [(MTUIFocusedTouchGestureRecognizer *)self->_dismissOnTouchRecognizer addTarget:self action:"dismissDelete:"];
    dismissOnTouchRecognizer = self->_dismissOnTouchRecognizer;
  }

  return dismissOnTouchRecognizer;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v42 = a3;
  [v42 contentOffset];
  if (v4 == 0.0
    || ([v42 contentOffset],
        (([(MTCollectionViewCell *)self mt_isRTL] ^ (v5 >= 0.0)) & 1) == 0))
  {
    [v42 setContentOffset:0.0, 0.0];
    double v32 = [(MTCollectionViewCell *)self actionButtonsContainer];
    [v32 frame];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;

    [v42 frame];
    -[MTCollectionViewCell defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:](self, "defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:");
    double v40 = v39;
    v41 = [(MTCollectionViewCell *)self actionButtonsContainer];
    [v41 setFrame:v40, v34, v36, v38];

    uint64_t v31 = 0;
LABEL_16:
    [(MTCollectionViewCell *)self setSwipeState:v31];
    goto LABEL_17;
  }
  id v6 = [(MTCollectionViewCell *)self actionButtonsContainer];
  [v6 frame];
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  [v42 frame];
  -[MTCollectionViewCell defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:](self, "defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:");
  double v16 = v15;
  LODWORD(v6) = [(MTCollectionViewCell *)self mt_isRTL];
  v44.origin.CGFloat x = v8;
  v44.origin.CGFloat y = v10;
  v44.size.CGFloat width = v12;
  v44.size.CGFloat height = v14;
  double Width = CGRectGetWidth(v44);
  if (!v6) {
    double Width = -Width;
  }
  double v18 = v16 + Width;
  [v42 contentOffset];
  double v20 = v18 + v19;
  double v21 = [(MTCollectionViewCell *)self actionButtonsContainer];
  [v21 setFrame:v20, v10, v12, v14];

  if ((id)[(MTCollectionViewCell *)self swipeState] != (id)3)
  {
    double v22 = [(MTCollectionViewCell *)self scrollView];
    [v22 contentOffset];
    double v24 = v23;

    if ([(MTCollectionViewCell *)self mt_isRTL]) {
      double v25 = -v24;
    }
    else {
      double v25 = v24;
    }
    if ([(MTCollectionViewCell *)self mt_isRTL])
    {
      double v26 = [(MTCollectionViewCell *)self scrollView];
      [v26 _contentScrollInset];
      double v28 = v27;

      if (v28 == 0.0)
      {
        v29 = [(MTCollectionViewCell *)self scrollView];
        [v29 _setContentScrollInset:0.0 v12:0.0 0.0];
      }
    }
    [(MTCollectionViewCell *)self targetXOffsetForExposedActions];
    if (v25 < fabs(v30)) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = 2;
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double v7 = [(MTCollectionViewCell *)self deleteButton];
  [v7 frame];
  double v8 = CGRectGetWidth(v14) * 0.899999976;

  double x = a5->x;
  unsigned int v10 = [(MTCollectionViewCell *)self mt_isRTL];
  double v11 = -x;
  if (!v10) {
    double v11 = x;
  }
  if (v11 >= v8)
  {
    [(MTCollectionViewCell *)self setSwipeState:1];
    [(MTCollectionViewCell *)self targetXOffsetForExposedActions];
    a5->double x = v12;
    [(MTCollectionViewCell *)self addDismissRecognizer];
  }
  else
  {
    [(MTCollectionViewCell *)self setSwipeState:3];
    a5->double x = 0.0;
    [(MTCollectionViewCell *)self removeDismissRecognizer];
  }
}

- (void)exposeActionsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(MTCollectionViewCell *)self setSwipeState:1];
  [(MTCollectionViewCell *)self targetXOffsetForExposedActions];
  double v6 = v5;
  id v7 = [(MTCollectionViewCell *)self scrollView];
  [v7 setContentOffset:v3 animated:v6];
}

- (void)hideActionsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTCollectionViewCell *)self swipeState])
  {
    [(MTCollectionViewCell *)self setSwipeState:3];
    double v5 = [(MTCollectionViewCell *)self scrollView];
    [v5 setContentOffset:CGPointZero animated:NO];

    if ([(MTCollectionViewCell *)self mt_isRTL])
    {
      double v6 = [(MTCollectionViewCell *)self scrollView];
      [v6 _contentScrollInset];
      double v8 = v7;

      if (v8 != 0.0)
      {
        double v9 = [(MTCollectionViewCell *)self scrollView];
        [v9 _setContentScrollInset:0.0, 0.0, 0.0, 0.0];
      }
    }
  }

  [(MTCollectionViewCell *)self removeDismissRecognizer];
}

- (double)targetXOffsetForExposedActions
{
  unsigned int v3 = [(MTCollectionViewCell *)self mt_isRTL];
  double v4 = [(MTCollectionViewCell *)self actionButtonsContainer];
  [v4 frame];
  double Width = CGRectGetWidth(v8);
  if (v3) {
    double v6 = -Width;
  }
  else {
    double v6 = Width;
  }

  return v6;
}

- (void)setSwipeState:(unint64_t)a3
{
  unint64_t swipeState = self->_swipeState;
  if (swipeState != a3)
  {
    self->_unint64_t swipeState = a3;
    [(MTCollectionViewCell *)self setEditing:[(MTCollectionViewCell *)self exposedActions]];
    if (![(MTCollectionViewCell *)self exposedActions] || a3 == 2 && swipeState == 1)
    {
      if (![(MTCollectionViewCell *)self exposedActions] && (a3 || swipeState != 3))
      {
        [(MTCollectionViewCell *)self scrollViewHidDelete];
      }
    }
    else
    {
      [(MTCollectionViewCell *)self scrollViewExposedDelete];
    }
  }
}

- (void)scrollViewHidDelete
{
  id v3 = [(MTCollectionViewCell *)self mt_collectionView];
  [v3 swipeEnded:self];
}

- (void)scrollViewExposedDelete
{
  id v3 = [(MTCollectionViewCell *)self mt_collectionView];
  [v3 swipeBegan:self];
}

- (double)defaultActionButtonsXOriginForScrollFrame:(CGRect)a3 andActionContainerSize:(CGSize)a4
{
  double width = a4.width;
  CGFloat height = a3.size.height;
  CGFloat v6 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  unsigned int v9 = [(MTCollectionViewCell *)self mt_isRTL];
  CGFloat v10 = x;
  CGFloat v11 = y;
  CGFloat v12 = v6;
  CGFloat v13 = height;
  if (v9) {
    return CGRectGetMinX(*(CGRect *)&v10) - width;
  }

  return CGRectGetMaxX(*(CGRect *)&v10);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (MTCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)swipeState
{
  return self->_swipeState;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void)setDismissOnTouchRecognizer:(id)a3
{
}

- (void)setActionButtonsContainer:(id)a3
{
}

- (void)setDeleteButton:(id)a3
{
}

- (void)setMoreButton:(id)a3
{
}

- (void)setUserSwiping:(BOOL)a3
{
  self->_userSwiping = a3;
}

- (BOOL)showsMoreButton
{
  return self->_showsMoreButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_actionButtonsContainer, 0);
  objc_storeStrong((id *)&self->_dismissOnTouchRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editingControl, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
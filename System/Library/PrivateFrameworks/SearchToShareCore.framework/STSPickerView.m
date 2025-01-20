@interface STSPickerView
- (BOOL)showActivityIndicator;
- (STSPickerView)init;
- (STSSearchNoticeView)overlayView;
- (UICollectionView)collectionView;
- (UIEdgeInsets)_updateContentInset;
- (UIView)headerView;
- (double)bottomInset;
- (double)topInset;
- (void)layoutSubviews;
- (void)scrollToTopWithAnimation:(BOOL)a3;
- (void)setBottomInset:(double)a3;
- (void)setHeaderView:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setShowActivityIndicator:(BOOL)a3;
- (void)setTopInset:(double)a3;
- (void)updateContentOffset:(double)a3;
- (void)updateHeaderPositionOnDecelerationEnded;
- (void)updateHeaderPositionOnDraggingBegan;
- (void)updateHeaderPositionOnDraggingEndedWithVelocity:(CGPoint)a3;
- (void)updateHeaderPositionOnScroll;
@end

@implementation STSPickerView

- (STSPickerView)init
{
  v14.receiver = self;
  v14.super_class = (Class)STSPickerView;
  v2 = [(STSPickerView *)&v14 init];
  v3 = v2;
  if (v2)
  {
    [(STSPickerView *)v2 setClipsToBounds:1];
    [(STSPickerView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v4 = objc_alloc_init(STSGridLayout);
    gridLayout = v3->_gridLayout;
    v3->_gridLayout = v4;

    id v6 = objc_alloc(MEMORY[0x263F82528]);
    [(STSPickerView *)v3 frame];
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v3->_gridLayout);
    collectionView = v3->_collectionView;
    v3->_collectionView = (UICollectionView *)v7;

    [(UICollectionView *)v3->_collectionView setAlwaysBounceVertical:1];
    v9 = v3->_collectionView;
    v10 = [MEMORY[0x263F825C8] clearColor];
    [(UICollectionView *)v9 setBackgroundColor:v10];

    [(UICollectionView *)v3->_collectionView setPrefetchingEnabled:0];
    [(UICollectionView *)v3->_collectionView setAllowsMultipleSelection:0];
    [(UICollectionView *)v3->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(STSPickerView *)v3 addSubview:v3->_collectionView];
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    constraints = v3->_constraints;
    v3->_constraints = (NSMutableArray *)v11;
  }
  return v3;
}

- (void)layoutSubviews
{
  v59[1] = *MEMORY[0x263EF8340];
  v3 = [(STSPickerView *)self layoutMarginsGuide];
  [MEMORY[0x263F08938] deactivateConstraints:self->_constraints];
  [(NSMutableArray *)self->_constraints removeAllObjects];
  overlayView = self->_overlayView;
  if (overlayView)
  {
    constraints = self->_constraints;
    id v6 = [(STSSearchNoticeView *)overlayView topAnchor];
    uint64_t v7 = [v3 topAnchor];
    v8 = [v6 constraintEqualToAnchor:v7];
    [(NSMutableArray *)constraints addObject:v8];

    v9 = self->_constraints;
    v10 = [(STSSearchNoticeView *)self->_overlayView bottomAnchor];
    uint64_t v11 = [v3 bottomAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [(NSMutableArray *)v9 addObject:v12];

    v13 = self->_constraints;
    objc_super v14 = [(STSSearchNoticeView *)self->_overlayView leadingAnchor];
    v15 = [(STSPickerView *)self leadingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [(NSMutableArray *)v13 addObject:v16];

    v17 = self->_constraints;
    v18 = [(STSSearchNoticeView *)self->_overlayView trailingAnchor];
    v19 = [(STSPickerView *)self trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [(NSMutableArray *)v17 addObject:v20];

    [MEMORY[0x263F08938] activateConstraints:self->_constraints];
  }
  headerView = self->_headerView;
  if (headerView)
  {
    if (self->_headerTopConstraint)
    {
      [(NSLayoutConstraint *)self->_headerTopConstraint constant];
      double v23 = v22;
      v24 = (void *)MEMORY[0x263F08938];
      v59[0] = self->_headerTopConstraint;
      v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];
      [v24 deactivateConstraints:v25];

      headerTopConstraint = self->_headerTopConstraint;
      self->_headerTopConstraint = 0;

      headerView = self->_headerView;
    }
    else
    {
      double v23 = 0.0;
    }
    v27 = [(UIView *)headerView topAnchor];
    v28 = [v3 topAnchor];
    v29 = [v27 constraintEqualToAnchor:v28 constant:v23];
    v30 = self->_headerTopConstraint;
    self->_headerTopConstraint = v29;

    v31 = self->_constraints;
    v32 = [(UIView *)self->_headerView leadingAnchor];
    v33 = [(STSPickerView *)self leadingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [(NSMutableArray *)v31 addObject:v34];

    v35 = self->_constraints;
    v36 = [(UIView *)self->_headerView trailingAnchor];
    v37 = [(STSPickerView *)self trailingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    [(NSMutableArray *)v35 addObject:v38];

    v39 = (void *)MEMORY[0x263F08938];
    v58 = self->_headerTopConstraint;
    v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
    [v39 activateConstraints:v40];
  }
  collectionView = self->_collectionView;
  if (collectionView)
  {
    v42 = self->_constraints;
    v43 = [(UICollectionView *)collectionView topAnchor];
    v44 = [v3 topAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    [(NSMutableArray *)v42 addObject:v45];

    v46 = self->_constraints;
    v47 = [(UICollectionView *)self->_collectionView bottomAnchor];
    v48 = [v3 bottomAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    [(NSMutableArray *)v46 addObject:v49];

    v50 = self->_constraints;
    v51 = [(UICollectionView *)self->_collectionView leadingAnchor];
    v52 = [(STSPickerView *)self leadingAnchor];
    v53 = [v51 constraintEqualToAnchor:v52];
    [(NSMutableArray *)v50 addObject:v53];

    v54 = self->_constraints;
    v55 = [(UICollectionView *)self->_collectionView trailingAnchor];
    v56 = [(STSPickerView *)self trailingAnchor];
    v57 = [v55 constraintEqualToAnchor:v56];
    [(NSMutableArray *)v54 addObject:v57];

    [MEMORY[0x263F08938] activateConstraints:self->_constraints];
  }
}

- (void)scrollToTopWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  [(UICollectionView *)self->_collectionView contentInset];
  -[UICollectionView setContentOffset:animated:](self->_collectionView, "setContentOffset:animated:", v3, -v5, -v6);

  [(STSPickerView *)self updateHeaderPositionOnScroll];
}

- (void)updateHeaderPositionOnScroll
{
  if (self->_headerView)
  {
    [(UICollectionView *)self->_collectionView contentOffset];
    double v4 = v3;
    [(UICollectionView *)self->_collectionView contentInset];
    double v6 = v4 + v5;
    if (v6 >= 0.0) {
      double v7 = v6;
    }
    else {
      double v7 = 0.0;
    }
    double v8 = self->_lastContentOffsetY - v7;
    [(NSLayoutConstraint *)self->_headerTopConstraint constant];
    [(STSPickerView *)self layoutMargins];
    double v10 = v9;
    if (self->_isDeceleratingQuickly
      || v8 < 0.0 && ([(UIView *)self->_headerView frame], v8 > -CGRectGetHeight(v23))
      || v8 > 0.0 && ([(UIView *)self->_headerView frame], v7 < CGRectGetHeight(v24))
      || (([(UIView *)self->_headerView frame], double MaxY = CGRectGetMaxY(v25), v8 > 0.0)
        ? (BOOL v17 = MaxY <= v10)
        : (BOOL v17 = 1),
          !v17))
    {
      [(UIView *)self->_headerView frame];
      [(UIView *)self->_headerView frame];
      [(UIView *)self->_headerView frame];
      [(UIView *)self->_headerView frame];
      double v12 = v11 - v10;
      v13 = [(STSPickerView *)self layoutMarginsGuide];
      double v14 = fmin(v8 + v12, 0.0);
      [(UIView *)self->_headerView frame];
      double v15 = -CGRectGetHeight(v21);
      if (v14 < v15) {
        double v14 = v15;
      }
      [(UIView *)self->_headerView frame];
      CGRectGetHeight(v22);
      [(NSLayoutConstraint *)self->_headerTopConstraint setConstant:v14];
      [(STSPickerView *)self layoutIfNeeded];
    }
    self->_lastContentOffsetY = v7;
  }
}

- (void)updateHeaderPositionOnDraggingBegan
{
  self->_isDeceleratingQuickly = 0;
}

- (void)updateHeaderPositionOnDraggingEndedWithVelocity:(CGPoint)a3
{
  if (a3.y < -1.15) {
    self->_isDeceleratingQuickly = 1;
  }
}

- (void)updateHeaderPositionOnDecelerationEnded
{
  self->_isDeceleratingQuickly = 0;
}

- (void)setOverlayView:(id)a3
{
  double v5 = (STSSearchNoticeView *)a3;
  overlayView = self->_overlayView;
  if (overlayView != v5)
  {
    double v8 = v5;
    [(STSSearchNoticeView *)overlayView removeFromSuperview];
    objc_storeStrong((id *)&self->_overlayView, a3);
    activityIndicator = self->_activityIndicator;
    if (!activityIndicator) {
      activityIndicator = self->_collectionView;
    }
    [(STSPickerView *)self insertSubview:self->_overlayView aboveSubview:activityIndicator];
    overlayView = (STSSearchNoticeView *)[(STSPickerView *)self setNeedsLayout];
    double v5 = v8;
  }

  MEMORY[0x270F9A758](overlayView, v5);
}

- (void)setHeaderView:(id)a3
{
  double v5 = (UIView *)a3;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    double v7 = v5;
    [(UIView *)headerView removeFromSuperview];
    objc_storeStrong((id *)&self->_headerView, a3);
    [(STSPickerView *)self addSubview:self->_headerView];
    headerView = (UIView *)[(STSPickerView *)self setNeedsLayout];
    double v5 = v7;
  }

  MEMORY[0x270F9A758](headerView, v5);
}

- (void)setTopInset:(double)a3
{
  [(UIView *)self->_headerView frame];
  CGFloat MinY = CGRectGetMinY(v8);
  self->_topInset = a3;
  [(UICollectionView *)self->_collectionView contentOffset];
  [(UICollectionView *)self->_collectionView contentInset];
  [(STSPickerView *)self _updateContentInset];
  [(UICollectionView *)self->_collectionView contentOffset];
  collectionView = self->_collectionView;

  -[UICollectionView setContentOffset:](collectionView, "setContentOffset:");
}

- (void)setBottomInset:(double)a3
{
  self->_bottomInset = a3;
  [(STSPickerView *)self _updateContentInset];
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  if (self->_showActivityIndicator != a3)
  {
    self->_showActivityIndicator = a3;
    activityIndicator = self->_activityIndicator;
    if (a3)
    {
      if (!activityIndicator)
      {
        double v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:2];
        double v6 = self->_activityIndicator;
        self->_activityIndicator = v5;

        [(UIActivityIndicatorView *)self->_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
        activityIndicator = self->_activityIndicator;
      }
      [(STSPickerView *)self insertSubview:activityIndicator aboveSubview:self->_collectionView];
      double v7 = (void *)MEMORY[0x263F08938];
      CGRect v8 = [(UIActivityIndicatorView *)self->_activityIndicator centerXAnchor];
      double v9 = [(UICollectionView *)self->_collectionView centerXAnchor];
      double v10 = [v8 constraintEqualToAnchor:v9];
      v16[0] = v10;
      double v11 = [(UIActivityIndicatorView *)self->_activityIndicator centerYAnchor];
      double v12 = [(UICollectionView *)self->_collectionView centerYAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      v16[1] = v13;
      double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
      [v7 activateConstraints:v14];

      [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
      [(STSPickerView *)self setNeedsLayout];
    }
    else
    {
      [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
      double v15 = self->_activityIndicator;
      [(UIActivityIndicatorView *)v15 removeFromSuperview];
    }
  }
}

- (void)updateContentOffset:(double)a3
{
  id v7 = [(STSPickerView *)self collectionView];
  double v5 = [(STSPickerView *)self collectionView];
  [v5 contentInset];
  objc_msgSend(v7, "setContentOffset:", -v6, a3);
}

- (UIEdgeInsets)_updateContentInset
{
  [(UIView *)self->_headerView frame];
  CGFloat v3 = CGRectGetHeight(v9) + self->_topInset;
  double v4 = self->_bottomInset + 0.0;
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v3 + 0.0, 6.0, v4, 6.0);
  -[UICollectionView setScrollIndicatorInsets:](self->_collectionView, "setScrollIndicatorInsets:", v3 + 0.0, 0.0, v4, 0.0);
  -[STSSearchNoticeView setContentInsets:](self->_overlayView, "setContentInsets:", v3 + 20.0, 20.0, self->_bottomInset + 20.0, 20.0);
  [(STSPickerView *)self bounds];
  [(UIActivityIndicatorView *)self->_activityIndicator bounds];
  UIRectCenteredIntegralRectScale();
  [(UIActivityIndicatorView *)self->_activityIndicator setFrame:0];
  double v5 = 6.0;
  double v6 = 6.0;
  double v7 = v3 + 0.0;
  double v8 = v4;
  result.right = v6;
  result.bottom = v8;
  result.left = v5;
  result.top = v7;
  return result;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (STSSearchNoticeView)overlayView
{
  return self->_overlayView;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (double)topInset
{
  return self->_topInset;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_headerTopConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_gridLayout, 0);
}

@end
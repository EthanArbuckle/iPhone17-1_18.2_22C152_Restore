@interface _UICollectionViewListCellReorderControl
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGSize)_minimumSizeForHitTesting;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)accessoryTintColor;
- (UITableConstants)constants;
- (_UICollectionViewListCellReorderControl)initWithDelegate:(id)a3 constants:(id)a4;
- (_UICollectionViewListCellReorderControlDelegate)delegate;
- (void)_setNeedsImageViewUpdate;
- (void)_setTracking:(BOOL)a3;
- (void)_updateImageViewIfNeeded;
- (void)beginReordering;
- (void)cancelReorderingGesture;
- (void)endReordering:(BOOL)a3;
- (void)gestureMovedToPoint:(CGPoint)a3;
- (void)layoutSubviews;
- (void)pan:(id)a3;
- (void)setAccessoryTintColor:(id)a3;
- (void)setConstants:(id)a3;
- (void)setDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation _UICollectionViewListCellReorderControl

- (void)setConstants:(id)a3
{
  v5 = (UITableConstants *)a3;
  if (self->_constants != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_constants, a3);
    [(_UICollectionViewListCellReorderControl *)self _setNeedsImageViewUpdate];
    v5 = v6;
  }
}

- (void)setAccessoryTintColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_accessoryTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    [(_UICollectionViewListCellReorderControl *)self _setNeedsImageViewUpdate];
    v5 = v6;
  }
}

- (_UICollectionViewListCellReorderControl)initWithDelegate:(id)a3 constants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UICollectionViewListCellReorderControl;
  v8 = -[UIControl initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_constants, a4);
    v10 = objc_alloc_init(UIImageView);
    [(UIView *)v9 addSubview:v10];
    imageView = v9->_imageView;
    v9->_imageView = v10;
    v12 = v10;

    v9->_needsImageViewUpdate = 1;
    v13 = +[UITraitCollection systemTraitsAffectingColorAppearance];
    v14 = +[UITraitCollection systemTraitsAffectingImageLookup];
    v15 = [v13 arrayByAddingObjectsFromArray:v14];

    id v16 = [(UIView *)v9 registerForTraitChanges:v15 withAction:sel__setNeedsImageViewUpdate];
    v17 = [[UILongPressGestureRecognizer alloc] initWithTarget:v9 action:sel_pan_];
    [(UIGestureRecognizer *)v17 setDelegate:v9];
    [(UILongPressGestureRecognizer *)v17 setMinimumPressDuration:0.0];
    [(UIView *)v9 addGestureRecognizer:v17];
    reorderRecognizer = v9->_reorderRecognizer;
    v9->_reorderRecognizer = v17;
  }
  return v9;
}

- (void)_setTracking:(BOOL)a3
{
  if (self->_tracking != a3)
  {
    self->_tracking = a3;
    [(_UICollectionViewListCellReorderControl *)self _setNeedsImageViewUpdate];
  }
}

- (void)_setNeedsImageViewUpdate
{
  self->_needsImageViewUpdate = 1;
  [(UIView *)self setNeedsLayout];
}

- (void)_updateImageViewIfNeeded
{
  if (self->_needsImageViewUpdate)
  {
    self->_needsImageViewUpdate = 0;
    constants = self->_constants;
    id v5 = [(UIView *)self traitCollection];
    v4 = [(UITableConstants *)constants defaultReorderControlImageForTraitCollection:v5 withAccessoryBaseColor:self->_accessoryTintColor isTracking:self->_tracking];
    [(UIImageView *)self->_imageView setImage:v4];
  }
}

- (CGSize)_minimumSizeForHitTesting
{
  BOOL v2 = [(UIView *)self isUserInteractionEnabled];
  double v3 = 44.0;
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v2) {
    double v4 = 44.0;
  }
  else {
    double v3 = *MEMORY[0x1E4F1DB30];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_UICollectionViewListCellReorderControl *)self _updateImageViewIfNeeded];
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;
  [(_UICollectionViewListCellReorderControl *)self _minimumSizeForHitTesting];
  if (v9 >= v10) {
    double v11 = v9;
  }
  else {
    double v11 = v10;
  }
  if (height >= v11) {
    double v12 = v11;
  }
  else {
    double v12 = height;
  }
  double v13 = v7;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)_UICollectionViewListCellReorderControl;
  [(UIView *)&v12 layoutSubviews];
  [(_UICollectionViewListCellReorderControl *)self _updateImageViewIfNeeded];
  double v3 = [(UIImageView *)self->_imageView _currentImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  -[UIImageView setBounds:](self->_imageView, "setBounds:", 0.0, 0.0, v5, v7);
  [(UIView *)self bounds];
  -[UIImageView setCenter:](self->_imageView, "setCenter:", v9 + v8 * 0.5, v11 + v10 * 0.5);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewListCellReorderControl;
  id v6 = a3;
  [(UIControl *)&v8 touchesBegan:v6 withEvent:a4];
  double v7 = [(_UICollectionViewListCellReorderControl *)self delegate];
  [v7 _reorderControl:self didReceiveTouchesBegan:v6];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_reorderRecognizer == a3)
  {
    double v5 = [(_UICollectionViewListCellReorderControl *)self delegate];
    char v6 = [v5 _reorderControlShouldBeginReordering:self];

    return v6;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UICollectionViewListCellReorderControl;
    return -[UIView gestureRecognizerShouldBegin:](&v7, sel_gestureRecognizerShouldBegin_);
  }
}

- (void)pan:(id)a3
{
  id v21 = a3;
  switch([v21 state])
  {
    case 0:
    case 5:
      if (self->_tracking)
      {
        double v5 = [MEMORY[0x1E4F28B00] currentHandler];
        [v5 handleFailureInMethod:a2, self, @"_UICollectionViewListCellReorderControl.m", 201, @"Invalid parameter not satisfying: %@", @"!_tracking" object file lineNumber description];
      }
      break;
    case 1:
      if (self->_tracking)
      {
        v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2, self, @"_UICollectionViewListCellReorderControl.m", 172, @"Invalid parameter not satisfying: %@", @"!_tracking" object file lineNumber description];
      }
      [(_UICollectionViewListCellReorderControl *)self _setTracking:1];
      [v21 locationInView:self];
      double v7 = v6;
      double v9 = v8;
      [(_UICollectionViewListCellReorderControl *)self beginReordering];
      double v10 = self;
      double v11 = v7;
      double v12 = v9;
      goto LABEL_10;
    case 2:
      if (!self->_tracking)
      {
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2, self, @"_UICollectionViewListCellReorderControl.m", 180, @"Invalid parameter not satisfying: %@", @"_tracking" object file lineNumber description];
      }
      [v21 locationInView:self];
      double v10 = self;
LABEL_10:
      -[_UICollectionViewListCellReorderControl gestureMovedToPoint:](v10, "gestureMovedToPoint:", v11, v12);
      break;
    case 3:
      if (!self->_tracking)
      {
        objc_super v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, self, @"_UICollectionViewListCellReorderControl.m", 186, @"Invalid parameter not satisfying: %@", @"_tracking" object file lineNumber description];
      }
      [v21 locationInView:self];
      double v14 = v13;
      double v16 = v15;
      [(_UICollectionViewListCellReorderControl *)self endReordering:0];
      -[_UICollectionViewListCellReorderControl gestureMovedToPoint:](self, "gestureMovedToPoint:", v14, v16);
      goto LABEL_17;
    case 4:
      if (!self->_tracking)
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:a2, self, @"_UICollectionViewListCellReorderControl.m", 194, @"Invalid parameter not satisfying: %@", @"_tracking" object file lineNumber description];
      }
      [(_UICollectionViewListCellReorderControl *)self endReordering:1];
LABEL_17:
      [(_UICollectionViewListCellReorderControl *)self _setTracking:0];
      break;
    default:
      break;
  }
}

- (void)beginReordering
{
  id v3 = [(_UICollectionViewListCellReorderControl *)self delegate];
  [v3 _reorderControlDidBeginReordering:self];
}

- (void)gestureMovedToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self bounds];
  CGFloat v6 = v14.origin.x;
  CGFloat v7 = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.double x = v6;
  v15.origin.double y = v7;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v11 = y - CGRectGetMidY(v15);
  id v12 = [(_UICollectionViewListCellReorderControl *)self delegate];
  objc_msgSend(v12, "_reorderControl:didUpdateWithOffset:", self, x - MidX, v11);
}

- (void)endReordering:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UICollectionViewListCellReorderControl *)self delegate];
  [v5 _reorderControlDidEndReordering:self cancelled:v3];
}

- (void)cancelReorderingGesture
{
  BOOL v2 = self->_reorderRecognizer;
  [(UIGestureRecognizer *)v2 setEnabled:0];
  [(UIGestureRecognizer *)v2 setEnabled:1];
}

- (_UICollectionViewListCellReorderControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UICollectionViewListCellReorderControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITableConstants)constants
{
  return self->_constants;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reorderRecognizer, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
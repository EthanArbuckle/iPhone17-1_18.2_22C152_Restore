@interface BKLibraryBookshelfCollectionViewCell
- (BKLibraryBookshelfCellSelectionAccessibilityDelegate)delegate;
- (BKLibraryBookshelfCollectionViewCell)initWithFrame:(CGRect)a3;
- (BKLibraryBookshelfCoverLayer)coverLayer;
- (BKLibraryBookshelfCoverView)coverView;
- (BOOL)isInEditMode;
- (BOOL)pendingAnimationCompletion;
- (BOOL)pendingTouchUp;
- (BOOL)shouldHandleTapIfPossible;
- (BSUIAudiobookControl)audiobookControl;
- (CGRect)coverFrame;
- (UIColor)highlightBackgroundColor;
- (UIInteraction)booksLinkEntityInteraction;
- (id)dragPreview;
- (id)dragPreviewParametersForDrop:(BOOL)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)addBooksLinkEntityInteraction:(id)a3;
- (void)animateCoverPressed:(BOOL)a3 completion:(id)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)dragStateDidChange:(int64_t)a3;
- (void)handleTapIfPossible;
- (void)handleTapWithCompletion:(id)a3;
- (void)i_minifiedAssetPresentersChangedNotification:(id)a3;
- (void)nightModeChanged;
- (void)prepareForDragPreview;
- (void)prepareForReuse;
- (void)removeBooksLinkEntityInteraction;
- (void)setAlpha:(double)a3;
- (void)setBooksLinkEntityInteraction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlightBackgroundColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 completion:(id)a4;
- (void)setPendingAnimationCompletion:(BOOL)a3;
- (void)setPendingTouchUp:(BOOL)a3;
- (void)updateAudiobookControlWithStatus:(id)a3 diameter:(double)a4;
@end

@implementation BKLibraryBookshelfCollectionViewCell

- (BKLibraryBookshelfCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
  v3 = -[BKLibraryBookshelfCollectionViewCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"i_minifiedAssetPresentersChangedNotification:" name:@"BKMnifiedPresentersUpdatedNotification" object:0];

    v5 = +[UITraitCollection bc_allAPITraits];
    id v6 = [(BKLibraryBookshelfCollectionViewCell *)v3 registerForTraitChanges:v5 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"BKMnifiedPresentersUpdatedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
  [(BKLibraryBookshelfCollectionViewCell *)&v4 dealloc];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
  [(BKLibraryBookshelfCollectionViewCell *)&v3 prepareForReuse];
  [(BKLibraryBookshelfCollectionViewCell *)self updateAudiobookControlWithStatus:0 diameter:0.0];
}

- (void)i_minifiedAssetPresentersChangedNotification:(id)a3
{
  objc_opt_class();
  objc_super v4 = BUClassAndProtocolCast();
  if (v4)
  {
    id v17 = v4;
    v5 = [v4 libraryAsset:&OBJC_PROTOCOL___BKLibraryBookshelfBookCell:&OBJC_PROTOCOL___BKLibraryBookshelfAudiobookCell];
    unsigned int v6 = [v5 isAudiobook];

    if (v6)
    {
      objc_opt_class();
      v7 = [(BKLibraryBookshelfCollectionViewCell *)self superview];
      objc_super v8 = BUDynamicCast();

      objc_opt_class();
      v9 = [v8 delegate];
      v10 = BUDynamicCast();

      v11 = [v10 im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKMinifiedPresenting];
      v12 = [v17 libraryAsset];
      v13 = [v12 assetID];
      v14 = [v11 minifiedPresenterAssetCurrentPresenterForAssetID:v13];

      v15 = [v14 minifiedAssetStatus];
      objc_opt_class();
      v16 = BUClassAndProtocolCast();
      [v17 setAudiobookStatus:v16 &OBJC_PROTOCOL___AEAssetAudiobookStatus];
    }
    else
    {
      [v17 setAudiobookStatus:0];
    }
    objc_super v4 = v17;
  }
}

- (void)updateAudiobookControlWithStatus:(id)a3 diameter:(double)a4
{
  id v13 = a3;
  unsigned int v6 = [(BKLibraryBookshelfCollectionViewCell *)self audiobookControl];
  if (v13)
  {

    if (!v6)
    {
      v7 = [objc_alloc((Class)BSUIAudiobookControl) initWithFrame:0.0, 0.0, a4, a4];
      audiobookControl = self->_audiobookControl;
      self->_audiobookControl = v7;

      v9 = BUProtocolCast();
      [(BSUIAudiobookControl *)self->_audiobookControl setDelegate:v9];

      -[BSUIAudiobookControl setPlaying:](self->_audiobookControl, "setPlaying:", [v13 assetAudiobookStatusIsPlaying]);
      [v13 assetAudiobookStatusTrackProgress];
      -[BSUIAudiobookControl setProgress:](self->_audiobookControl, "setProgress:");
      v10 = [(BKLibraryBookshelfCollectionViewCell *)self contentView];
      [v10 addSubview:self->_audiobookControl];

      [(BKLibraryBookshelfCollectionViewCell *)self setNeedsLayout];
    }
  }
  else
  {

    if (v6)
    {
      v11 = [(BKLibraryBookshelfCollectionViewCell *)self audiobookControl];
      [v11 removeFromSuperview];

      v12 = self->_audiobookControl;
      self->_audiobookControl = 0;
    }
  }
}

- (id)dragPreview
{
  return 0;
}

- (id)dragPreviewParametersForDrop:(BOOL)a3
{
  return 0;
}

- (void)dragStateDidChange:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
  -[BKLibraryBookshelfCollectionViewCell dragStateDidChange:](&v6, "dragStateDidChange:");
  if (a3 == 1)
  {
    v5 = [(BKLibraryBookshelfCollectionViewCell *)self window];
    [v5 setUserInteractionEnabled:1];
  }
}

- (BKLibraryBookshelfCoverLayer)coverLayer
{
  v2 = NSStringFromSelector(a2);
  objc_super v3 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v3);
  BCReportAssertionFailureWithMessage();

  return 0;
}

- (BKLibraryBookshelfCoverView)coverView
{
  v2 = NSStringFromSelector(a2);
  objc_super v3 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v3);
  BCReportAssertionFailureWithMessage();

  return 0;
}

- (CGRect)coverFrame
{
  v2 = NSStringFromSelector(a2);
  objc_super v3 = (objc_class *)objc_opt_class();
  objc_super v8 = NSStringFromClass(v3);
  BCReportAssertionFailureWithMessage();

  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)shouldHandleTapIfPossible
{
  if ([(BKLibraryBookshelfCollectionViewCell *)self pendingTouchUp]) {
    return 0;
  }
  else {
    return ![(BKLibraryBookshelfCollectionViewCell *)self pendingAnimationCompletion];
  }
}

- (void)handleTapWithCompletion:(id)a3
{
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = (objc_class *)objc_opt_class();
  objc_super v4 = NSStringFromClass(v3);
  BCReportAssertionFailureWithMessage();
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BKLibraryBookshelfCollectionViewCell *)self isHighlighted] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
    [(BKLibraryBookshelfCollectionViewCell *)&v6 setHighlighted:v3];
    if (v3) {
      [(BKLibraryBookshelfCollectionViewCell *)self highlightBackgroundColor];
    }
    else {
    id v5 = +[UIColor clearColor];
    }
    [(BKLibraryBookshelfCollectionViewCell *)self setBackgroundColor:v5];
  }
}

- (void)setHighlighted:(BOOL)a3 completion:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  if ([(BKLibraryBookshelfCollectionViewCell *)self isHighlighted] == v4)
  {
    id v7 = objc_retainBlock(v6);
    objc_super v8 = v7;
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001C030C;
    v11[3] = &unk_100A44E60;
    v11[4] = self;
    char v12 = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001C0318;
    v9[3] = &unk_100A44638;
    id v10 = v6;
    +[UIView animateWithDuration:v11 animations:v9 completion:0.1];
  }
}

- (void)animateCoverPressed:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.95;
  }
  if (v4) {
    double v8 = 0.95;
  }
  else {
    double v8 = 1.0;
  }
  v9 = [(BKLibraryBookshelfCollectionViewCell *)self coverLayer];
  id v10 = v9;
  if (v9) {
    [v9 transform];
  }
  else {
    memset(&a, 0, sizeof(a));
  }
  CATransform3DMakeScale(&b, v8, v8, 1.0);
  BOOL v11 = CATransform3DEqualToTransform(&a, &b);

  if (v11)
  {
    id v12 = objc_retainBlock(v6);
    id v13 = v12;
    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
  else
  {
    id v13 = +[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    v14 = +[NSNumber numberWithDouble:v7];
    [v13 setFromValue:v14];

    v15 = +[NSNumber numberWithDouble:v8];
    [v13 setToValue:v15];

    [v13 setDuration:0.15];
    v16 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [v13 setTimingFunction:v16];

    id v17 = objc_alloc_init(_BKLibraryBookshelfBookCellAnimationDelegate);
    [(_BKLibraryBookshelfBookCellAnimationDelegate *)v17 setCompletionBlock:v6];
    [v13 setDelegate:v17];
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    v18 = [(BKLibraryBookshelfCollectionViewCell *)self coverLayer];
    [v18 addAnimation:v13 forKey:@"press"];

    CATransform3DMakeScale(&v21, v8, v8, 1.0);
    v19 = [(BKLibraryBookshelfCollectionViewCell *)self coverLayer];
    CATransform3D v20 = v21;
    [v19 setTransform:&v20];

    +[CATransaction commit];
  }
}

- (void)handleTapIfPossible
{
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C0740;
  v10[3] = &unk_100A4A2F8;
  objc_copyWeak(&v11, &location);
  BOOL v3 = objc_retainBlock(v10);
  BOOL v4 = [(BKLibraryBookshelfCollectionViewCell *)self window];
  [v4 setUserInteractionEnabled:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C0854;
  v7[3] = &unk_100A4A320;
  v7[4] = self;
  id v5 = v3;
  id v9 = v5;
  id v6 = v4;
  id v8 = v6;
  [(BKLibraryBookshelfCollectionViewCell *)self animateCoverPressed:1 completion:v7];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = a4;
  id v6 = [(BKLibraryBookshelfCollectionViewCell *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];
  id v8 = [v5 userInterfaceStyle];

  if (v7 != v8)
  {
    [(BKLibraryBookshelfCollectionViewCell *)self nightModeChanged];
  }
}

- (void)nightModeChanged
{
  id v2 = [(BKLibraryBookshelfCollectionViewCell *)self coverLayer];
  [v2 nightModeChanged];
}

- (void)applyLayoutAttributes:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
  id v4 = a3;
  [(BKLibraryBookshelfCollectionViewCell *)&v12 applyLayoutAttributes:v4];
  objc_opt_class();
  id v5 = BUDynamicCast();

  self->_isInEditMode = [v5 editMode];
  [(BKLibraryBookshelfCollectionViewCell *)self setAutomaticallyUpdatesBackgroundConfiguration:0];
  id v6 = [v5 cellMetrics];
  id v7 = [(BKLibraryBookshelfCollectionViewCell *)self configurationState];
  id v8 = [v6 backgroundConfigurationForState:v7 isInEditMode:[self isInEditMode]];
  [(BKLibraryBookshelfCollectionViewCell *)self setBackgroundConfiguration:v8];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C0B74;
  v10[3] = &unk_100A4A348;
  id v11 = v6;
  id v9 = v6;
  [(BKLibraryBookshelfCollectionViewCell *)self setConfigurationUpdateHandler:v10];
}

- (void)addBooksLinkEntityInteraction:(id)a3
{
  id v5 = a3;
  id v4 = [(BKLibraryBookshelfCollectionViewCell *)self booksLinkEntityInteraction];

  if (v4 != v5)
  {
    [(BKLibraryBookshelfCollectionViewCell *)self removeBooksLinkEntityInteraction];
    if (v5)
    {
      [(BKLibraryBookshelfCollectionViewCell *)self addInteraction:v5];
      [(BKLibraryBookshelfCollectionViewCell *)self setBooksLinkEntityInteraction:v5];
    }
  }
}

- (void)removeBooksLinkEntityInteraction
{
  BOOL v3 = [(BKLibraryBookshelfCollectionViewCell *)self booksLinkEntityInteraction];

  if (v3)
  {
    id v4 = [(BKLibraryBookshelfCollectionViewCell *)self booksLinkEntityInteraction];
    [(BKLibraryBookshelfCollectionViewCell *)self removeInteraction:v4];

    [(BKLibraryBookshelfCollectionViewCell *)self setBooksLinkEntityInteraction:0];
  }
}

- (void)prepareForDragPreview
{
  if (![(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    BOOL v3 = [(BKLibraryBookshelfCollectionViewCell *)self coverLayer];
    [v3 removeAllAnimations];

    id v4 = [(BKLibraryBookshelfCollectionViewCell *)self coverLayer];
    long long v5 = *(_OWORD *)&CATransform3DIdentity.m33;
    void v9[4] = *(_OWORD *)&CATransform3DIdentity.m31;
    v9[5] = v5;
    long long v6 = *(_OWORD *)&CATransform3DIdentity.m43;
    v9[6] = *(_OWORD *)&CATransform3DIdentity.m41;
    v9[7] = v6;
    long long v7 = *(_OWORD *)&CATransform3DIdentity.m13;
    v9[0] = *(_OWORD *)&CATransform3DIdentity.m11;
    v9[1] = v7;
    long long v8 = *(_OWORD *)&CATransform3DIdentity.m23;
    v9[2] = *(_OWORD *)&CATransform3DIdentity.m21;
    v9[3] = v8;
    [v4 setTransform:v9];

    +[CATransaction commit];
  }
}

- (void)setAlpha:(double)a3
{
  [(BKLibraryBookshelfCollectionViewCell *)self _desiredAlphaFromRawAlpha:a3];
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
  -[BKLibraryBookshelfCollectionViewCell setAlpha:](&v4, "setAlpha:");
}

- (BKLibraryBookshelfCellSelectionAccessibilityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKLibraryBookshelfCellSelectionAccessibilityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BSUIAudiobookControl)audiobookControl
{
  return self->_audiobookControl;
}

- (BOOL)isInEditMode
{
  return self->_isInEditMode;
}

- (UIColor)highlightBackgroundColor
{
  return self->_highlightBackgroundColor;
}

- (void)setHighlightBackgroundColor:(id)a3
{
}

- (BOOL)pendingTouchUp
{
  return self->_pendingTouchUp;
}

- (void)setPendingTouchUp:(BOOL)a3
{
  self->_pendingTouchUp = a3;
}

- (BOOL)pendingAnimationCompletion
{
  return self->_pendingAnimationCompletion;
}

- (void)setPendingAnimationCompletion:(BOOL)a3
{
  self->_pendingAnimationCompletion = a3;
}

- (UIInteraction)booksLinkEntityInteraction
{
  return self->_booksLinkEntityInteraction;
}

- (void)setBooksLinkEntityInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_booksLinkEntityInteraction, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_audiobookControl, 0);
}

@end
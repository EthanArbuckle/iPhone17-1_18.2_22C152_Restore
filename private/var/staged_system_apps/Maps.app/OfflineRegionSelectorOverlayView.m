@interface OfflineRegionSelectorOverlayView
- (CGRect)_clampedRectFromRect:(CGRect)a3;
- (CGRect)_selectedRectFromHandle:(id)a3 withTranslation:(CGPoint)a4;
- (CGRect)selectedRectFrame;
- (OfflineRegionSelectorActionCoordination)regionSelectorDelegate;
- (OfflineRegionSelectorOverlayView)init;
- (OfflineRegionSelectorOverlayView)initWithCoder:(id)a3;
- (OfflineRegionSelectorOverlayView)initWithFrame:(CGRect)a3;
- (UILayoutGuide)viewportLayoutGuide;
- (id)offlineRegionSelectorCropHandleToString:(unint64_t)a3;
- (void)_commonInit;
- (void)_handlePanGesture:(id)a3;
- (void)_setSelectedRect:(CGRect)a3;
- (void)_setSelectedRect:(CGRect)a3 animated:(BOOL)a4;
- (void)animateForDownloadWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setInitialSelectedRect:(CGRect)a3 animated:(BOOL)a4;
- (void)setRegionSelectorDelegate:(id)a3;
- (void)setViewportLayoutGuide:(id)a3;
@end

@implementation OfflineRegionSelectorOverlayView

- (OfflineRegionSelectorOverlayView)init
{
  v5.receiver = self;
  v5.super_class = (Class)OfflineRegionSelectorOverlayView;
  v2 = [(OfflineRegionSelectorOverlayView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(OfflineRegionSelectorOverlayView *)v2 _commonInit];
  }
  return v3;
}

- (OfflineRegionSelectorOverlayView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OfflineRegionSelectorOverlayView;
  v3 = -[OfflineRegionSelectorOverlayView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(OfflineRegionSelectorOverlayView *)v3 _commonInit];
  }
  return v4;
}

- (OfflineRegionSelectorOverlayView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OfflineRegionSelectorOverlayView;
  v3 = [(OfflineRegionSelectorOverlayView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(OfflineRegionSelectorOverlayView *)v3 _commonInit];
  }
  return v4;
}

- (id)offlineRegionSelectorCropHandleToString:(unint64_t)a3
{
  if (a3 > 7) {
    return @"Unknown";
  }
  else {
    return *(&off_1012EB750 + a3);
  }
}

- (void)_commonInit
{
  v3 = +[UIImage imageNamed:@"OfflineRegionSelectorCheckerboard"];
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  v7 = [v3 resizableImageWithCapInsets:UIEdgeInsetsZero.top, left, bottom, right];

  v8 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v7];
  checkerboardImageView = self->_checkerboardImageView;
  self->_checkerboardImageView = v8;

  [(UIImageView *)self->_checkerboardImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_checkerboardImageView setAccessibilityIdentifier:@"Checkerboard"];
  [(OfflineRegionSelectorOverlayView *)self addSubview:self->_checkerboardImageView];
  LODWORD(v10) = 1148846080;
  v11 = -[UIImageView _maps_constraintsEqualToEdgesOfView:insets:priority:](self->_checkerboardImageView, "_maps_constraintsEqualToEdgesOfView:insets:priority:", self, UIEdgeInsetsZero.top, left, bottom, right, v10);
  v12 = [v11 allConstraints];
  +[NSLayoutConstraint activateConstraints:v12];

  id v13 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double obja = CGRectZero.size.height;
  v16 = [v13 initWithFrame:CGRectZero.origin.x, y, width];
  downloadCameraSnapshotView = self->_downloadCameraSnapshotView;
  self->_downloadCameraSnapshotView = v16;

  [(UIView *)self->_downloadCameraSnapshotView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_downloadCameraSnapshotView setUserInteractionEnabled:0];
  v18 = +[UIColor colorWithWhite:0.0 alpha:0.300000012];
  [(UIView *)self->_downloadCameraSnapshotView setBackgroundColor:v18];

  [(UIView *)self->_downloadCameraSnapshotView setAlpha:0.0];
  [(OfflineRegionSelectorOverlayView *)self addSubview:self->_downloadCameraSnapshotView];
  LODWORD(v19) = 1148846080;
  v20 = -[UIView _maps_constraintsEqualToEdgesOfView:insets:priority:](self->_downloadCameraSnapshotView, "_maps_constraintsEqualToEdgesOfView:insets:priority:", self, UIEdgeInsetsZero.top, left, bottom, right, v19);
  v21 = [v20 allConstraints];
  +[NSLayoutConstraint activateConstraints:v21];

  v22 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, obja];
  outlineView = self->_outlineView;
  self->_outlineView = v22;

  [(UIView *)self->_outlineView setUserInteractionEnabled:0];
  v24 = [(UIView *)self->_outlineView layer];
  [v24 setCornerRadius:16.0];

  id v25 = +[UIColor blackColor];
  id v26 = [v25 CGColor];
  v27 = [(UIView *)self->_outlineView layer];
  [v27 setShadowColor:v26];

  v28 = [(UIView *)self->_outlineView layer];
  [v28 setShadowRadius:6.0];

  v29 = [(UIView *)self->_outlineView layer];
  LODWORD(v30) = 1051931443;
  [v29 setShadowOpacity:v30];

  double height = CGSizeZero.height;
  v32 = [(UIView *)self->_outlineView layer];
  [v32 setShadowOffset:CGSizeZero.width, height];

  id v33 = +[UIColor whiteColor];
  id v34 = [v33 CGColor];
  v35 = [(UIView *)self->_outlineView layer];
  [v35 setBorderColor:v34];

  v36 = [(UIView *)self->_outlineView layer];
  [v36 setBorderWidth:3.0];

  [(UIView *)self->_outlineView setAccessibilityIdentifier:@"OfflineRegionOutline"];
  [(OfflineRegionSelectorOverlayView *)self addSubview:self->_outlineView];
  v37 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, obja];
  checkerboardKnockoutMask = self->_checkerboardKnockoutMask;
  self->_checkerboardKnockoutMask = v37;

  v39 = [(UIView *)self->_checkerboardKnockoutMask layer];
  [v39 setCornerRadius:16.0];

  v40 = +[UIColor blackColor];
  [(UIView *)self->_checkerboardKnockoutMask setBackgroundColor:v40];

  v41 = [(UIView *)self->_checkerboardKnockoutMask layer];
  v42 = [(UIImageView *)self->_checkerboardImageView layer];
  [v42 setMask:v41];

  v43 = [(UIImageView *)self->_checkerboardImageView layer];
  [v43 setInvertsMask:1];

  v44 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, obja];
  downloadCameraSnapshotKnockoutMask = self->_downloadCameraSnapshotKnockoutMask;
  self->_downloadCameraSnapshotKnockoutMask = v44;

  v46 = [(UIView *)self->_downloadCameraSnapshotKnockoutMask layer];
  [v46 setCornerRadius:16.0];

  v47 = +[UIColor blackColor];
  [(UIView *)self->_downloadCameraSnapshotKnockoutMask setBackgroundColor:v47];

  v48 = [(UIView *)self->_downloadCameraSnapshotKnockoutMask layer];
  v49 = [(UIView *)self->_downloadCameraSnapshotView layer];
  [v49 setMask:v48];

  v50 = [(UIView *)self->_downloadCameraSnapshotView layer];
  [v50 setInvertsMask:1];

  v51 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  handleViews = self->_handleViews;
  self->_handleViews = v51;

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = +[OfflineRegionSelectorCropHandleView allHandles];
  id v53 = [obj countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (v53)
  {
    id v54 = v53;
    uint64_t v55 = *(void *)v69;
    do
    {
      for (i = 0; i != v54; i = (char *)i + 1)
      {
        if (*(void *)v69 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v57 = [*(id *)(*((void *)&v68 + 1) + 8 * i) unsignedIntValue];
        v58 = [[OfflineRegionSelectorCropHandleView alloc] initWithHandle:v57];
        [(OfflineRegionSelectorCropHandleView *)v58 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(OfflineRegionSelectorCropHandleView *)v58 setAccessibilityIdentifier:@"OfflineRegionSelectorCropHandle"];
        v59 = [(OfflineRegionSelectorOverlayView *)self offlineRegionSelectorCropHandleToString:v57];
        [(OfflineRegionSelectorCropHandleView *)v58 setAccessibilityLabel:v59];

        id v60 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"_handlePanGesture:"];
        [(OfflineRegionSelectorCropHandleView *)v58 addGestureRecognizer:v60];

        [(OfflineRegionSelectorOverlayView *)self addSubview:v58];
        v61 = [(OfflineRegionSelectorCropHandleView *)v58 constraintsForHandlePinnedToView:self->_outlineView];
        +[NSLayoutConstraint activateConstraints:v61];

        v62 = self->_handleViews;
        v63 = +[NSNumber numberWithUnsignedInteger:v57];
        [(NSMutableDictionary *)v62 setObject:v58 forKeyedSubscript:v63];
      }
      id v54 = [obj countByEnumeratingWithState:&v68 objects:v72 count:16];
    }
    while (v54);
  }

  v64 = (UIImpactFeedbackGenerator *)[objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:3];
  hapticGenerator = self->_hapticGenerator;
  self->_hapticGenerator = v64;
}

- (void)animateForDownloadWithCompletion:(id)a3
{
  id v4 = a3;
  [(UIView *)self->_downloadCameraSnapshotView setAlpha:0.0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10047A874;
  v8[3] = &unk_1012E5D08;
  v8[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10047A88C;
  v6[3] = &unk_1012EB2E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[UIView animateWithDuration:v8 animations:v6 completion:0.3];
}

- (CGRect)selectedRectFrame
{
  [(UIView *)self->_outlineView frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setInitialSelectedRect:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_initialSelectedRect = &self->_initialSelectedRect;
  self->_initialSelectedRect = a3;
  [(OfflineRegionSelectorOverlayView *)self bounds];
  if (CGRectIsEmpty(v12))
  {
    self->_needsInitialLayout = 1;
  }
  else
  {
    self->_needsInitialLayout = 0;
    -[OfflineRegionSelectorOverlayView _clampedRectFromRect:](self, "_clampedRectFromRect:", p_initialSelectedRect->origin.x, p_initialSelectedRect->origin.y, p_initialSelectedRect->size.width, p_initialSelectedRect->size.height);
    double x = v13.origin.x;
    double y = v13.origin.y;
    double width = v13.size.width;
    double height = v13.size.height;
    if (!CGRectEqualToRect(v13, *p_initialSelectedRect))
    {
      double x = CGRectGetMidX(*p_initialSelectedRect) - width * 0.5;
      double y = CGRectGetMidY(*p_initialSelectedRect) - height * 0.5;
    }
    -[OfflineRegionSelectorOverlayView _setSelectedRect:animated:](self, "_setSelectedRect:animated:", v4, x, y, width, height);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)OfflineRegionSelectorOverlayView;
  [(OfflineRegionSelectorOverlayView *)&v3 layoutSubviews];
  if (self->_needsInitialLayout && !CGRectIsEmpty(self->_initialSelectedRect)) {
    -[OfflineRegionSelectorOverlayView setInitialSelectedRect:animated:](self, "setInitialSelectedRect:animated:", 1, self->_initialSelectedRect.origin.x, self->_initialSelectedRect.origin.y, self->_initialSelectedRect.size.width, self->_initialSelectedRect.size.height);
  }
}

- (void)_setSelectedRect:(CGRect)a3
{
}

- (void)_setSelectedRect:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  -[OfflineRegionSelectorOverlayView _clampedRectFromRect:](self, "_clampedRectFromRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10047AC00;
  v12[3] = &unk_1012E9418;
  v12[4] = self;
  v12[5] = v6;
  v12[6] = v7;
  v12[7] = v8;
  v12[8] = v9;
  double v10 = objc_retainBlock(v12);
  v11 = v10;
  if (v4)
  {
    [(OfflineRegionSelectorOverlayView *)self frame];
    -[UIView setFrame:](self->_outlineView, "setFrame:");
    [(OfflineRegionSelectorOverlayView *)self frame];
    -[UIView setFrame:](self->_checkerboardKnockoutMask, "setFrame:");
    [(OfflineRegionSelectorOverlayView *)self frame];
    -[UIView setFrame:](self->_downloadCameraSnapshotKnockoutMask, "setFrame:");
    [(OfflineRegionSelectorOverlayView *)self layoutIfNeeded];
    +[UIView animateWithDuration:0 delay:v11 usingSpringWithDamping:0 initialSpringVelocity:0.3 options:0.0 animations:0.666666687 completion:0.0];
  }
  else
  {
    ((void (*)(void *))v10[2])(v10);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(OfflineRegionSelectorOverlayView *)self bounds];
  v33.origin.double x = v8;
  v33.origin.double y = v9;
  v33.size.double width = v10;
  v33.size.double height = v11;
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  if (!CGRectEqualToRect(v25, v33))
  {
    [(UIView *)self->_outlineView frame];
    double MidX = CGRectGetMidX(v26);
    [(OfflineRegionSelectorOverlayView *)self bounds];
    double v13 = MidX - CGRectGetMidX(v27);
    [(UIView *)self->_outlineView frame];
    double MidY = CGRectGetMidY(v28);
    [(OfflineRegionSelectorOverlayView *)self bounds];
    double v15 = MidY - CGRectGetMidY(v29);
    v24.receiver = self;
    v24.super_class = (Class)OfflineRegionSelectorOverlayView;
    -[OfflineRegionSelectorOverlayView setBounds:](&v24, "setBounds:", x, y, width, height);
    [(UIView *)self->_outlineView frame];
    double v17 = v16;
    double v19 = v18;
    [(OfflineRegionSelectorOverlayView *)self bounds];
    double v20 = v13 + CGRectGetMidX(v30) - v17 * 0.5;
    [(OfflineRegionSelectorOverlayView *)self bounds];
    double v21 = v15 + CGRectGetMidY(v31) - v19 * 0.5;
    v32.origin.double x = v20;
    v32.origin.double y = v21;
    v32.size.double width = v17;
    v32.size.double height = v19;
    if (!CGRectIsEmpty(v32))
    {
      v22 = [(OfflineRegionSelectorOverlayView *)self regionSelectorDelegate];
      [v22 willAdjustSelectedRegion];

      -[OfflineRegionSelectorOverlayView _setSelectedRect:](self, "_setSelectedRect:", v20, v21, v17, v19);
      v23 = [(OfflineRegionSelectorOverlayView *)self regionSelectorDelegate];
      [v23 didAdjustSelectedRegion];
    }
  }
}

- (CGRect)_clampedRectFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = [(OfflineRegionSelectorOverlayView *)self viewportLayoutGuide];
  [v7 layoutFrame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v38.origin.double x = x;
  double rect = y;
  v38.origin.CGFloat y = y;
  v38.size.double width = width;
  v38.size.double height = height;
  double MinX = CGRectGetMinX(v38);
  v39.origin.double x = v9;
  v39.origin.CGFloat y = v11;
  v39.size.double width = v13;
  v39.size.double height = v15;
  if (MinX - CGRectGetMinX(v39) < 35.0)
  {
    v40.origin.double x = x;
    v40.size.double height = height;
    v40.origin.CGFloat y = rect;
    v40.size.double width = width;
    double v17 = CGRectGetMinX(v40);
    v41.origin.double x = v9;
    v41.origin.CGFloat y = v11;
    v41.size.double width = v13;
    v41.size.double height = v15;
    double width = width - (CGRectGetMinX(v41) - v17 + 35.0);
    v42.origin.double x = v9;
    v42.origin.CGFloat y = v11;
    v42.size.double width = v13;
    v42.size.double height = v15;
    double x = CGRectGetMinX(v42) + 35.0;
  }
  v43.origin.double x = x;
  v43.size.double height = height;
  v43.origin.CGFloat y = rect;
  v43.size.double width = width;
  double MinY = CGRectGetMinY(v43);
  v44.origin.double x = v9;
  v44.origin.CGFloat y = v11;
  v44.size.double width = v13;
  v44.size.double height = v15;
  CGFloat v34 = width;
  double v35 = x;
  if (MinY - CGRectGetMinY(v44) >= 35.0)
  {
    CGFloat v21 = v11;
    CGFloat v22 = v13;
    double v20 = height;
  }
  else
  {
    v45.origin.double x = x;
    v45.size.double width = width;
    v45.origin.CGFloat y = rect;
    v45.size.double height = height;
    double v19 = CGRectGetMinY(v45);
    v46.origin.double x = v9;
    v46.origin.CGFloat y = v11;
    v46.size.double width = v13;
    v46.size.double height = v15;
    double v20 = height - (CGRectGetMinY(v46) - v19 + 35.0);
    v47.origin.double x = v9;
    v47.origin.CGFloat y = v11;
    v47.size.double width = v13;
    v47.size.double height = v15;
    double rect = CGRectGetMinY(v47) + 35.0;
    CGFloat v21 = v11;
    CGFloat v22 = v13;
  }
  v48.origin.double x = v9;
  v48.origin.CGFloat y = v21;
  v48.size.double width = v22;
  v48.size.double height = v15;
  double MaxX = CGRectGetMaxX(v48);
  v49.origin.double x = v35;
  v49.origin.CGFloat y = rect;
  double v24 = v34;
  v49.size.double width = v34;
  CGFloat v36 = v20;
  v49.size.double height = v20;
  CGFloat v25 = v15;
  CGFloat v26 = v9;
  if (MaxX - CGRectGetMaxX(v49) < 35.0)
  {
    v50.origin.double x = v9;
    v50.origin.CGFloat y = v21;
    v50.size.double width = v22;
    v50.size.double height = v25;
    double v24 = CGRectGetMaxX(v50) + -35.0 - v35;
  }
  v51.origin.double x = v9;
  v51.origin.CGFloat y = v21;
  v51.size.double width = v22;
  v51.size.double height = v25;
  double MaxY = CGRectGetMaxY(v51);
  CGFloat v28 = v21;
  v52.size.double width = v24;
  v52.origin.double x = v35;
  double v29 = v36;
  v52.origin.CGFloat y = rect;
  v52.size.double height = v36;
  if (MaxY - CGRectGetMaxY(v52) < 35.0)
  {
    v53.origin.double x = v26;
    v53.origin.CGFloat y = v28;
    v53.size.double width = v22;
    v53.size.double height = v25;
    double v29 = CGRectGetMaxY(v53) + -35.0 - rect;
  }
  if (v24 >= 78.0) {
    double v30 = v24;
  }
  else {
    double v30 = 78.0;
  }
  if (v29 >= 78.0) {
    double v31 = v29;
  }
  else {
    double v31 = 78.0;
  }
  double v32 = v35;
  double v33 = rect;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.CGFloat y = v33;
  result.origin.double x = v32;
  return result;
}

- (CGRect)_selectedRectFromHandle:(id)a3 withTranslation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  [(UIView *)self->_outlineView frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  unint64_t v16 = (unint64_t)[v7 handle];
  if (v16 <= 5 && ((1 << v16) & 0x31) != 0)
  {
    double v17 = v15 - y;
    if (v15 - y >= 78.0)
    {
      double v11 = y + v11;
      double v15 = v15 - y;
    }
  }
  unint64_t v18 = [v7 handle:v17];
  if (v18 <= 6 && ((1 << v18) & 0x52) != 0)
  {
    double v19 = v13 - x;
    if (v13 - x >= 78.0)
    {
      double v9 = x + v9;
      double v13 = v13 - x;
    }
  }
  unint64_t v20 = [v7 handle:v19];
  double v21 = -0.0;
  if (((1 << v20) & 0xA8) != 0) {
    double v22 = x;
  }
  else {
    double v22 = -0.0;
  }
  if (v20 <= 7) {
    double v21 = v22;
  }
  double v23 = v13 + v21;
  unint64_t v24 = (unint64_t)[v7 handle];
  BOOL v25 = (v24 & 0xFFFFFFFFFFFFFFFBLL) == 2 || v24 == 7;
  double v26 = -0.0;
  if (v25) {
    double v26 = y;
  }
  double v27 = v15 + v26;

  double v28 = v9;
  double v29 = v11;
  double v30 = v23;
  double v31 = v27;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (void)_handlePanGesture:(id)a3
{
  id v17 = a3;
  BOOL v4 = [v17 view];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;

  [v17 translationInView:self];
  -[OfflineRegionSelectorOverlayView _selectedRectFromHandle:withTranslation:](self, "_selectedRectFromHandle:withTranslation:", v6);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  -[OfflineRegionSelectorOverlayView _setSelectedRect:](self, "_setSelectedRect:", v8, v10, v12, v14);
  [v17 setTranslation:self inView:CGPointZero.x, CGPointZero.y];
  if ([v17 state] == (id)1)
  {
    [(UIImpactFeedbackGenerator *)self->_hapticGenerator impactOccurred];
    double v15 = [(OfflineRegionSelectorOverlayView *)self regionSelectorDelegate];
    [v15 willAdjustSelectedRegion];
LABEL_9:

    goto LABEL_10;
  }
  if ([v17 state] == (id)3 || objc_msgSend(v17, "state") == (id)4)
  {
    unint64_t v16 = [(OfflineRegionSelectorOverlayView *)self regionSelectorDelegate];
    [v16 didAdjustSelectedRegion];

    double v15 = [(OfflineRegionSelectorOverlayView *)self regionSelectorDelegate];
    [v15 didAdjustSelectorCropHandle];
    goto LABEL_9;
  }
LABEL_10:
}

- (OfflineRegionSelectorActionCoordination)regionSelectorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_regionSelectorDelegate);

  return (OfflineRegionSelectorActionCoordination *)WeakRetained;
}

- (void)setRegionSelectorDelegate:(id)a3
{
}

- (UILayoutGuide)viewportLayoutGuide
{
  return self->_viewportLayoutGuide;
}

- (void)setViewportLayoutGuide:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_regionSelectorDelegate);
  objc_storeStrong((id *)&self->_hapticGenerator, 0);
  objc_storeStrong((id *)&self->_handleViews, 0);
  objc_storeStrong((id *)&self->_downloadCameraSnapshotKnockoutMask, 0);
  objc_storeStrong((id *)&self->_checkerboardKnockoutMask, 0);
  objc_storeStrong((id *)&self->_outlineView, 0);
  objc_storeStrong((id *)&self->_downloadCameraSnapshotView, 0);

  objc_storeStrong((id *)&self->_checkerboardImageView, 0);
}

@end
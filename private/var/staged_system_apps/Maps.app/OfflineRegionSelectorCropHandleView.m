@interface OfflineRegionSelectorCropHandleView
+ (id)allHandles;
- (CAShapeLayer)handleLayer;
- (CGSize)intrinsicContentSize;
- (OfflineRegionSelectorCropHandleView)initWithHandle:(unint64_t)a3;
- (id)constraintsForHandlePinnedToView:(id)a3;
- (unint64_t)handle;
- (void)_commonInit;
- (void)_setupCornerHandle;
- (void)_setupEdgeHandle;
- (void)setHandleLayer:(id)a3;
@end

@implementation OfflineRegionSelectorCropHandleView

+ (id)allHandles
{
  if (qword_10160E978 != -1) {
    dispatch_once(&qword_10160E978, &stru_1012E5D78);
  }
  v2 = (void *)qword_10160E970;

  return v2;
}

- (OfflineRegionSelectorCropHandleView)initWithHandle:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OfflineRegionSelectorCropHandleView;
  v4 = -[OfflineRegionSelectorCropHandleView initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_handle = a3;
    [(OfflineRegionSelectorCropHandleView *)v4 _commonInit];
  }
  return v5;
}

- (void)_commonInit
{
  v3 = +[CAShapeLayer layer];
  handleLayer = self->_handleLayer;
  self->_handleLayer = v3;

  -[CAShapeLayer setAnchorPoint:](self->_handleLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  v5 = +[UIColor whiteColor];
  id v6 = [v5 colorWithAlphaComponent:0.850000024];
  -[CAShapeLayer setFillColor:](self->_handleLayer, "setFillColor:", [v6 CGColor]);

  objc_super v7 = [(OfflineRegionSelectorCropHandleView *)self layer];
  [v7 addSublayer:self->_handleLayer];

  unint64_t handle = self->_handle;
  if (handle > 3)
  {
    if ((handle & 0xFFFFFFFFFFFFFFFCLL) == 4) {
      [(OfflineRegionSelectorCropHandleView *)self _setupCornerHandle];
    }
  }
  else
  {
    [(OfflineRegionSelectorCropHandleView *)self _setupEdgeHandle];
  }
  CGRect PathBoundingBox = CGPathGetPathBoundingBox([(CAShapeLayer *)self->_handleLayer path]);
  v9 = self->_handleLayer;

  -[CAShapeLayer setBounds:](v9, "setBounds:", PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);
}

- (void)_setupEdgeHandle
{
  unint64_t v3 = [(OfflineRegionSelectorCropHandleView *)self handle];
  if (v3 > 3)
  {
    uint64_t v6 = 0;
    double v4 = 0.0;
    double v5 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
  }
  else
  {
    double v4 = dbl_100F6EDD8[v3];
    double v5 = dbl_100F6EDF8[v3];
    uint64_t v6 = qword_100F6EE18[v3];
    double v7 = dbl_100F6EE38[v3];
    double v8 = dbl_100F6EE58[v3];
  }
  +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v6, 0.0, 0.0, v4, v5, 1.0, 1.0);
  id v9 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_handleLayer, "setPath:", [v9 CGPath]);
  -[OfflineRegionSelectorCropHandleView _setTouchInsets:](self, "_setTouchInsets:", v7, v8, v7, v8);
}

- (void)_setupCornerHandle
{
  unint64_t v3 = +[UIBezierPath bezierPath];
  [v3 moveToPoint:20.0, 0.0];
  [v3 addLineToPoint:23.0, 0.0];
  [v3 _addRoundedCornerWithTrueCorner:2 radius:0 corner:0 clockwise:0 leadInIsContinuous:24.0 leadOutIsContinuous:1.0];
  [v3 addLineToPoint:24.0, 4.0];
  [v3 addLineToPoint:22.0, 4.0];
  [v3 _addRoundedCornerWithTrueCorner:1 radius:1 corner:0 clockwise:0 leadInIsContinuous:4.0 leadOutIsContinuous:4.0];
  [v3 addLineToPoint:4.0, 24.0];
  [v3 _addRoundedCornerWithTrueCorner:4 radius:0 corner:0 clockwise:0 leadInIsContinuous:0 leadOutIsContinuous:24.0];
  [v3 addLineToPoint:0.0, 20.0];
  [v3 _addRoundedCornerWithTrueCorner:1 radius:0 corner:0 clockwise:0 leadInIsContinuous:0 leadOutIsContinuous:20.0];
  [v3 addLineToPoint:20.0, 0.0];
  [v3 closePath];
  id v4 = v3;
  -[CAShapeLayer setPath:](self->_handleLayer, "setPath:", [v4 CGPath]);
  CGRect PathBoundingBox = CGPathGetPathBoundingBox([(CAShapeLayer *)self->_handleLayer path]);
  double width = PathBoundingBox.size.width;
  CGFloat height = PathBoundingBox.size.height;
  long long v17 = *(_OWORD *)&CATransform3DIdentity.m31;
  long long v18 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v28.m31 = v17;
  *(_OWORD *)&v28.m33 = v18;
  long long v19 = *(_OWORD *)&CATransform3DIdentity.m41;
  long long v20 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v28.m41 = v19;
  *(_OWORD *)&v28.m43 = v20;
  long long v21 = *(_OWORD *)&CATransform3DIdentity.m11;
  long long v22 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v28.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v28.m13 = v22;
  long long v23 = *(_OWORD *)&CATransform3DIdentity.m21;
  long long v24 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v28.m21 = v23;
  *(_OWORD *)&v28.m23 = v24;
  if ((id)[(OfflineRegionSelectorCropHandleView *)self handle] == (id)5)
  {
    *(_OWORD *)&v27.m31 = v17;
    *(_OWORD *)&v27.m33 = v18;
    *(_OWORD *)&v27.m41 = v19;
    *(_OWORD *)&v27.m43 = v20;
    *(_OWORD *)&v27.m11 = v21;
    *(_OWORD *)&v27.m13 = v22;
    *(_OWORD *)&v27.m21 = v23;
    *(_OWORD *)&v27.m23 = v24;
    CATransform3DTranslate(&v28, &v27, 0.0, height, 0.0);
    CATransform3DMakeRotation(&v27, 1.57079633, 0.0, 0.0, 1.0);
    CATransform3D v28 = v27;
    double v7 = -width;
    CATransform3D v26 = v27;
    double v8 = 0.0;
LABEL_5:
    CATransform3DTranslate(&v27, &v26, v8, v7, 0.0);
    CATransform3D v28 = v27;
    goto LABEL_6;
  }
  if ((id)[(OfflineRegionSelectorCropHandleView *)self handle] == (id)7)
  {
    *(_OWORD *)&v27.m31 = v17;
    *(_OWORD *)&v27.m33 = v18;
    *(_OWORD *)&v27.m41 = v19;
    *(_OWORD *)&v27.m43 = v20;
    *(_OWORD *)&v27.m11 = v21;
    *(_OWORD *)&v27.m13 = v22;
    *(_OWORD *)&v27.m21 = v23;
    *(_OWORD *)&v27.m23 = v24;
    CATransform3DTranslate(&v28, &v27, width, height, 0.0);
    CATransform3DMakeRotation(&v27, 3.14159265, 0.0, 0.0, 1.0);
    CATransform3D v28 = v27;
    double v8 = -width;
    CATransform3D v26 = v27;
    double v7 = -width;
    goto LABEL_5;
  }
  if ((id)[(OfflineRegionSelectorCropHandleView *)self handle] != (id)6)
  {
    double v12 = -24.0;
    double v16 = 0.0;
    double v14 = 0.0;
    double v10 = -24.0;
    goto LABEL_7;
  }
  *(_OWORD *)&v27.m31 = v17;
  *(_OWORD *)&v27.m33 = v18;
  *(_OWORD *)&v27.m41 = v19;
  *(_OWORD *)&v27.m43 = v20;
  *(_OWORD *)&v27.m11 = v21;
  *(_OWORD *)&v27.m13 = v22;
  *(_OWORD *)&v27.m21 = v23;
  *(_OWORD *)&v27.m23 = v24;
  CATransform3DTranslate(&v28, &v27, width, 0.0, 0.0);
  CATransform3DMakeRotation(&v27, 4.71238898, 0.0, 0.0, 1.0);
  CATransform3D v28 = v27;
  CATransform3D v26 = v27;
  CATransform3DTranslate(&v27, &v26, -width, 0.0, 0.0);
  CATransform3D v28 = v27;
LABEL_6:
  UIEdgeInsetsRotate();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
LABEL_7:
  CATransform3D v25 = v28;
  [(CAShapeLayer *)self->_handleLayer setTransform:&v25];
  -[OfflineRegionSelectorCropHandleView _setTouchInsets:](self, "_setTouchInsets:", v10, v12, v14, v16);
}

- (CGSize)intrinsicContentSize
{
  [(CAShapeLayer *)self->_handleLayer bounds];
  double v3 = v2;
  double v5 = v4;
  result.CGFloat height = v5;
  result.double width = v3;
  return result;
}

- (id)constraintsForHandlePinnedToView:(id)a3
{
  id v4 = a3;
  switch([(OfflineRegionSelectorCropHandleView *)self handle])
  {
    case 0uLL:
      double v5 = [(OfflineRegionSelectorCropHandleView *)self centerXAnchor];
      uint64_t v6 = [v4 centerXAnchor];
      double v7 = [v5 constraintEqualToAnchor:v6];
      v21[0] = v7;
      double v8 = [(OfflineRegionSelectorCropHandleView *)self bottomAnchor];
      double v9 = [v4 topAnchor];
      double v10 = [v8 constraintEqualToAnchor:v9];
      v21[1] = v10;
      double v11 = v21;
      goto LABEL_11;
    case 1uLL:
      double v5 = [(OfflineRegionSelectorCropHandleView *)self rightAnchor];
      uint64_t v6 = [v4 leftAnchor];
      double v7 = [v5 constraintEqualToAnchor:v6];
      v20[0] = v7;
      double v8 = [(OfflineRegionSelectorCropHandleView *)self centerYAnchor];
      double v9 = [v4 centerYAnchor];
      double v10 = [v8 constraintEqualToAnchor:v9];
      v20[1] = v10;
      double v11 = v20;
      goto LABEL_11;
    case 2uLL:
      double v5 = [(OfflineRegionSelectorCropHandleView *)self centerXAnchor];
      uint64_t v6 = [v4 centerXAnchor];
      double v7 = [v5 constraintEqualToAnchor:v6];
      v19[0] = v7;
      double v8 = [(OfflineRegionSelectorCropHandleView *)self topAnchor];
      double v9 = [v4 bottomAnchor];
      double v10 = [v8 constraintEqualToAnchor:v9];
      v19[1] = v10;
      double v11 = v19;
      goto LABEL_11;
    case 3uLL:
      double v5 = [(OfflineRegionSelectorCropHandleView *)self leftAnchor];
      uint64_t v6 = [v4 rightAnchor];
      double v7 = [v5 constraintEqualToAnchor:v6];
      v18[0] = v7;
      double v8 = [(OfflineRegionSelectorCropHandleView *)self centerYAnchor];
      double v9 = [v4 centerYAnchor];
      double v10 = [v8 constraintEqualToAnchor:v9];
      v18[1] = v10;
      double v11 = v18;
      goto LABEL_11;
    case 4uLL:
      double v5 = [(OfflineRegionSelectorCropHandleView *)self leftAnchor];
      uint64_t v6 = [v4 leftAnchor];
      double v7 = [v5 constraintEqualToAnchor:v6 constant:-4.0];
      v17[0] = v7;
      double v8 = [(OfflineRegionSelectorCropHandleView *)self topAnchor];
      double v9 = [v4 topAnchor];
      double v10 = [v8 constraintEqualToAnchor:v9 constant:-4.0];
      v17[1] = v10;
      double v11 = v17;
      goto LABEL_11;
    case 5uLL:
      double v5 = [(OfflineRegionSelectorCropHandleView *)self rightAnchor];
      uint64_t v6 = [v4 rightAnchor];
      double v7 = [v5 constraintEqualToAnchor:v6 constant:4.0];
      v16[0] = v7;
      double v8 = [(OfflineRegionSelectorCropHandleView *)self topAnchor];
      double v9 = [v4 topAnchor];
      double v10 = [v8 constraintEqualToAnchor:v9 constant:-4.0];
      v16[1] = v10;
      double v11 = v16;
      goto LABEL_11;
    case 6uLL:
      double v5 = [(OfflineRegionSelectorCropHandleView *)self leftAnchor];
      uint64_t v6 = [v4 leftAnchor];
      double v7 = [v5 constraintEqualToAnchor:v6 constant:-4.0];
      v15[0] = v7;
      double v8 = [(OfflineRegionSelectorCropHandleView *)self bottomAnchor];
      double v9 = [v4 bottomAnchor];
      double v10 = [v8 constraintEqualToAnchor:v9 constant:4.0];
      v15[1] = v10;
      double v11 = v15;
      goto LABEL_11;
    case 7uLL:
      double v5 = [(OfflineRegionSelectorCropHandleView *)self rightAnchor];
      uint64_t v6 = [v4 rightAnchor];
      double v7 = [v5 constraintEqualToAnchor:v6 constant:4.0];
      v14[0] = v7;
      double v8 = [(OfflineRegionSelectorCropHandleView *)self bottomAnchor];
      double v9 = [v4 bottomAnchor];
      double v10 = [v8 constraintEqualToAnchor:v9 constant:4.0];
      v14[1] = v10;
      double v11 = v14;
LABEL_11:
      double v12 = +[NSArray arrayWithObjects:v11 count:2];

      break;
    default:
      double v12 = &__NSArray0__struct;
      break;
  }

  return v12;
}

- (unint64_t)handle
{
  return self->_handle;
}

- (CAShapeLayer)handleLayer
{
  return self->_handleLayer;
}

- (void)setHandleLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
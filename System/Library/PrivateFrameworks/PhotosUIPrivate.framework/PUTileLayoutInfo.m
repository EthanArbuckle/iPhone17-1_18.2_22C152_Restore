@interface PUTileLayoutInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isGeometryEqualToLayoutInfo:(id)a3;
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGPoint)parallaxOffset;
- (CGRect)contentsRect;
- (CGRect)frame;
- (CGSize)size;
- (NSIndexPath)indexPath;
- (NSString)cornerCurve;
- (NSString)dataSourceIdentifier;
- (NSString)tileKind;
- (PUTileIdentifier)tileIdentifier;
- (PUTileLayoutInfo)init;
- (PUTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 cornerRadius:(double)a7 cornerCurve:(id)a8 cornerMask:(unint64_t)a9 transform:(CGAffineTransform *)a10 zPosition:(double)a11 contentsRect:(CGRect)a12 coordinateSystem:(id)a13;
- (PUTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 contentsRect:(CGRect)a9 coordinateSystem:(id)a10;
- (PUTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9;
- (PUTileLayoutInfo)layoutInfoWithAlpha:(double)a3;
- (PUTileLayoutInfo)layoutInfoWithCenter:(CGPoint)a3 size:(CGSize)a4 alpha:(double)a5 transform:(CGAffineTransform *)a6 zPosition:(double)a7 coordinateSystem:(id)a8;
- (PUTileLayoutInfo)layoutInfoWithCenter:(CGPoint)a3 size:(CGSize)a4 transform:(CGAffineTransform *)a5;
- (PUTileLayoutInfo)layoutInfoWithCoordinateSystem:(id)a3;
- (PUTileLayoutInfo)layoutInfoWithIndexPath:(id)a3 tileKind:(id)a4 dataSourceIdentifier:(id)a5;
- (PUTileLayoutInfo)layoutInfoWithZPosition:(double)a3;
- (PUTilingCoordinateSystem)coordinateSystem;
- (UIColor)borderColor;
- (UIEdgeInsets)cropInsets;
- (UIEdgeInsets)expandedRectInsets;
- (UIEdgeInsets)hitTestOutset;
- (char)initWithTileIdentifier:(void *)a3 center:(void *)a4 size:(uint64_t)a5 alpha:(void *)a6 cornerRadius:(long long *)a7 cornerCurve:(void *)a8 cornerMask:(double)a9 borderWidth:(double)a10 borderColor:(double)a11 transform:(double)a12 zPosition:(double)a13 contentsRect:(double)a14 hitTestOutset:(double)a15 coordinateSystem:(double)a16 cropInsets:(uint64_t)a17 verticalLegibilityFraction:(uint64_t)a18;
- (double)alpha;
- (double)borderWidth;
- (double)cornerRadius;
- (double)verticalLegibilityFraction;
- (double)zPosition;
- (id)clone;
- (id)description;
- (id)layoutInfoByInterpolatingWithLayoutInfo:(id)a3 mixFactor:(double)a4 coordinateSystem:(id)a5;
- (uint64_t)initWithTileIdentifier:(double)a3 center:(double)a4 size:(double)a5 alpha:(double)a6 transform:(double)a7 zPosition:(uint64_t)a8 contentsRect:(uint64_t)a9 hitTestOutset:(_OWORD *)a10 coordinateSystem:(uint64_t)a11;
- (unint64_t)cornerMask;
- (unint64_t)hash;
- (void)_setAlpha:(double)a3;
- (void)_setCenter:(CGPoint)a3;
- (void)_setCoordinateSystem:(id)a3;
- (void)_setCornerCurve:(id)a3;
- (void)_setCornerMask:(unint64_t)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_setSize:(CGSize)a3;
- (void)_setTileIdentifier:(id)a3;
- (void)_setTransform:(CGAffineTransform *)a3;
- (void)_setZPosition:(double)a3;
- (void)setCropInsets:(UIEdgeInsets)a3;
- (void)setExpandedRectInsets:(UIEdgeInsets)a3;
- (void)setVerticalLegibilityFraction:(double)a3;
@end

@implementation PUTileLayoutInfo

- (CGPoint)parallaxOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSystem, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_cornerCurve, 0);
  objc_storeStrong((id *)&self->_tileIdentifier, 0);
}

- (void)setExpandedRectInsets:(UIEdgeInsets)a3
{
  self->_expandedRectInsets = a3;
}

- (UIEdgeInsets)expandedRectInsets
{
  double top = self->_expandedRectInsets.top;
  double left = self->_expandedRectInsets.left;
  double bottom = self->_expandedRectInsets.bottom;
  double right = self->_expandedRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setVerticalLegibilityFraction:(double)a3
{
  self->_verticalLegibilityFraction = a3;
}

- (double)verticalLegibilityFraction
{
  return self->_verticalLegibilityFraction;
}

- (void)setCropInsets:(UIEdgeInsets)a3
{
  self->_cropInsets = a3;
}

- (UIEdgeInsets)cropInsets
{
  double top = self->_cropInsets.top;
  double left = self->_cropInsets.left;
  double bottom = self->_cropInsets.bottom;
  double right = self->_cropInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setCoordinateSystem:(id)a3
{
}

- (PUTilingCoordinateSystem)coordinateSystem
{
  return self->_coordinateSystem;
}

- (UIEdgeInsets)hitTestOutset
{
  double top = self->_hitTestOutset.top;
  double left = self->_hitTestOutset.left;
  double bottom = self->_hitTestOutset.bottom;
  double right = self->_hitTestOutset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setZPosition:(double)a3
{
  self->_zPosition = a3;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (void)_setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tdouble x = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[5].d;
  long long v4 = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = v4;
  return self;
}

- (void)_setCornerMask:(unint64_t)a3
{
  self->_cornerMask = a3;
}

- (unint64_t)cornerMask
{
  return self->_cornerMask;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)_setCornerCurve:(id)a3
{
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (void)_setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)_setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)_setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setTileIdentifier:(id)a3
{
}

- (PUTileIdentifier)tileIdentifier
{
  return self->_tileIdentifier;
}

- (id)description
{
  v24 = NSString;
  long long v3 = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(v3);
  long long v4 = [(PUTileLayoutInfo *)self tileIdentifier];
  [(PUTileLayoutInfo *)self center];
  v5 = NSStringFromCGPoint(v27);
  [(PUTileLayoutInfo *)self size];
  v6 = NSStringFromCGSize(v28);
  [(PUTileLayoutInfo *)self alpha];
  uint64_t v8 = v7;
  [(PUTileLayoutInfo *)self cornerRadius];
  uint64_t v10 = v9;
  v11 = [(PUTileLayoutInfo *)self cornerCurve];
  unint64_t v12 = [(PUTileLayoutInfo *)self cornerMask];
  [(PUTileLayoutInfo *)self borderWidth];
  uint64_t v14 = v13;
  v15 = [(PUTileLayoutInfo *)self borderColor];
  [(PUTileLayoutInfo *)self transform];
  v16 = NSStringFromCGAffineTransform(&transform);
  [(PUTileLayoutInfo *)self zPosition];
  uint64_t v18 = v17;
  [(PUTileLayoutInfo *)self contentsRect];
  v19 = NSStringFromCGRect(v29);
  [(PUTileLayoutInfo *)self hitTestOutset];
  v20 = NSStringFromUIEdgeInsets(v30);
  objc_msgSend(v24, "stringWithFormat:", @"<%@: %p; tileIdentifier: %@; center: %@; size: %@; alpha: %f; cornerRadius: %f, cornerCurve: %@, cornerMask: %lu, borderWidth:%f, borderColor:%@, transform: %@; zPosition: %f; contentsRect: %@ hitExtensionInsets: %@>",
    v23,
    self,
    v4,
    v5,
    v6,
    v8,
    v10,
    v11,
    v12,
    v14,
    v15,
    v16,
    v18,
    v19,
  v21 = v20);

  return v21;
}

- (CGRect)frame
{
  [(PUTileLayoutInfo *)self size];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v7 = *MEMORY[0x1E4F1DAD8] - v3 * 0.5;
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8) - v5 * 0.5;
  [(PUTileLayoutInfo *)self transform];
  v20.origin.double x = v7;
  v20.origin.double y = v8;
  v20.size.CGFloat width = v4;
  v20.size.CGFloat height = v6;
  CGRect v21 = CGRectApplyAffineTransform(v20, &v19);
  double x = v21.origin.x;
  double y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  [(PUTileLayoutInfo *)self center];
  double v14 = x + v13;
  double v16 = y + v15;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.double y = v16;
  result.origin.double x = v14;
  return result;
}

- (id)layoutInfoByInterpolatingWithLayoutInfo:(id)a3 mixFactor:(double)a4 coordinateSystem:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [(PUTileLayoutInfo *)self center];
  double v10 = v9;
  double v12 = v11;
  double v13 = [(PUTileLayoutInfo *)self coordinateSystem];
  double v77 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v13, v8, v10, v12);
  double v79 = v14;

  [v7 center];
  double v16 = v15;
  double v18 = v17;
  CGAffineTransform v19 = [v7 coordinateSystem];
  double v72 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v19, v8, v16, v18);
  double v74 = v20;

  [(PUTileLayoutInfo *)self size];
  double v22 = v21;
  double v24 = v23;
  [v7 size];
  double v26 = v25;
  double v28 = v27;
  [(PUTileLayoutInfo *)self alpha];
  double v30 = v29;
  [v7 alpha];
  double v32 = v31;
  [(PUTileLayoutInfo *)self cornerRadius];
  double v34 = v33;
  [v7 cornerRadius];
  double v36 = v35;
  v37 = [v7 cornerCurve];
  uint64_t v38 = [v7 cornerMask];
  [(PUTileLayoutInfo *)self transform];
  if (v7)
  {
    [v7 transform];
    float64x2_t v40 = v83;
    float64x2_t v39 = v84;
    float64x2_t v41 = v85;
  }
  else
  {
    float64x2_t v41 = 0uLL;
    float64x2_t v84 = 0u;
    float64x2_t v85 = 0u;
    float64x2_t v83 = 0u;
    float64x2_t v39 = 0uLL;
    float64x2_t v40 = 0uLL;
  }
  double v76 = v36 * a4 + (1.0 - a4) * v34;
  double v70 = v26 * a4 + (1.0 - a4) * v22;
  double v71 = v32 * a4 + (1.0 - a4) * v30;
  double v42 = v28 * a4 + (1.0 - a4) * v24;
  double v43 = v72 * a4 + (1.0 - a4) * v77;
  double v44 = v74 * a4 + (1.0 - a4) * v79;
  float64x2_t v78 = vmlaq_n_f64(vmulq_n_f64(v39, a4), v87, 1.0 - a4);
  float64x2_t v80 = vmlaq_n_f64(vmulq_n_f64(v40, a4), v86, 1.0 - a4);
  float64x2_t v75 = vmlaq_n_f64(vmulq_n_f64(v41, a4), v88, 1.0 - a4);
  [(PUTileLayoutInfo *)self zPosition];
  double v46 = v45;
  [v7 zPosition];
  double v73 = v47 * a4 + (1.0 - a4) * v46;
  [(PUTileLayoutInfo *)self cropInsets];
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  [v7 cropInsets];
  double v57 = v56 * a4 + (1.0 - a4) * v49;
  double v59 = v58 * a4 + (1.0 - a4) * v51;
  double v61 = v60 * a4 + (1.0 - a4) * v53;
  double v63 = v62 * a4 + (1.0 - a4) * v55;
  [(PUTileLayoutInfo *)self verticalLegibilityFraction];
  double v65 = v64;
  [v7 verticalLegibilityFraction];
  double v67 = v66 * a4 + (1.0 - a4) * v65;
  v68 = [(PUTileLayoutInfo *)self clone];
  objc_msgSend(v68, "_setCenter:", v43, v44);
  objc_msgSend(v68, "_setSize:", v70, v42);
  [v68 _setAlpha:v71];
  [v68 _setCornerRadius:v76];
  [v68 _setCornerCurve:v37];
  [v68 _setCornerMask:v38];
  v82[0] = v80;
  v82[1] = v78;
  v82[2] = v75;
  [v68 _setTransform:v82];
  [v68 _setZPosition:v73];
  [v68 _setCoordinateSystem:v8];
  objc_msgSend(v68, "setCropInsets:", v57, v59, v61, v63);
  [v68 setVerticalLegibilityFraction:v67];

  return v68;
}

- (PUTileLayoutInfo)layoutInfoWithCenter:(CGPoint)a3 size:(CGSize)a4 alpha:(double)a5 transform:(CGAffineTransform *)a6 zPosition:(double)a7 coordinateSystem:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  id v16 = a8;
  double v17 = [(PUTileLayoutInfo *)self clone];
  objc_msgSend(v17, "_setCenter:", x, y);
  objc_msgSend(v17, "_setSize:", width, height);
  [v17 _setAlpha:a5];
  long long v18 = *(_OWORD *)&a6->c;
  v20[0] = *(_OWORD *)&a6->a;
  v20[1] = v18;
  v20[2] = *(_OWORD *)&a6->tx;
  [v17 _setTransform:v20];
  [v17 _setZPosition:a7];
  [v17 _setCoordinateSystem:v16];

  return (PUTileLayoutInfo *)v17;
}

- (PUTileLayoutInfo)layoutInfoWithCenter:(CGPoint)a3 size:(CGSize)a4 transform:(CGAffineTransform *)a5
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  double v10 = [(PUTileLayoutInfo *)self clone];
  objc_msgSend(v10, "_setCenter:", x, y);
  objc_msgSend(v10, "_setSize:", width, height);
  long long v11 = *(_OWORD *)&a5->c;
  v13[0] = *(_OWORD *)&a5->a;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&a5->tx;
  [v10 _setTransform:v13];
  return (PUTileLayoutInfo *)v10;
}

- (PUTileLayoutInfo)layoutInfoWithZPosition:(double)a3
{
  CGFloat v4 = [(PUTileLayoutInfo *)self clone];
  [v4 _setZPosition:a3];
  return (PUTileLayoutInfo *)v4;
}

- (PUTileLayoutInfo)layoutInfoWithAlpha:(double)a3
{
  CGFloat v4 = [(PUTileLayoutInfo *)self clone];
  [v4 _setAlpha:a3];
  return (PUTileLayoutInfo *)v4;
}

- (PUTileLayoutInfo)layoutInfoWithIndexPath:(id)a3 tileKind:(id)a4 dataSourceIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [(PUTileLayoutInfo *)self clone];
  double v12 = [[PUTileIdentifier alloc] initWithIndexPath:v10 tileKind:v9 dataSourceIdentifier:v8];

  [v11 _setTileIdentifier:v12];
  return (PUTileLayoutInfo *)v11;
}

- (PUTileLayoutInfo)layoutInfoWithCoordinateSystem:(id)a3
{
  id v4 = a3;
  double v5 = [(PUTileLayoutInfo *)self clone];
  [(PUTileLayoutInfo *)self center];
  double v7 = v6;
  double v9 = v8;
  id v10 = [(PUTileLayoutInfo *)self coordinateSystem];
  double v11 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v10, v4, v7, v9);
  double v13 = v12;

  objc_msgSend(v5, "_setCenter:", v11, v13);
  [v5 _setCoordinateSystem:v4];

  return (PUTileLayoutInfo *)v5;
}

- (BOOL)isGeometryEqualToLayoutInfo:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_33;
  }
  [(PUTileLayoutInfo *)self size];
  double v6 = v5;
  double v8 = v7;
  [v4 size];
  if (v6 != v10 || v8 != v9) {
    goto LABEL_33;
  }
  [(PUTileLayoutInfo *)self alpha];
  double v13 = v12;
  [v4 alpha];
  if (v13 != v14) {
    goto LABEL_33;
  }
  [(PUTileLayoutInfo *)self cornerRadius];
  double v16 = v15;
  [v4 cornerRadius];
  if (v16 != v17) {
    goto LABEL_33;
  }
  id v18 = [(PUTileLayoutInfo *)self cornerCurve];
  id v19 = [v4 cornerCurve];
  if (v18 == v19)
  {
  }
  else
  {
    double v20 = v19;
    char v21 = [v18 isEqualToString:v19];

    if ((v21 & 1) == 0)
    {
LABEL_33:
      BOOL v59 = 0;
      goto LABEL_34;
    }
  }
  unint64_t v22 = [(PUTileLayoutInfo *)self cornerMask];
  if (v22 != [v4 cornerMask]) {
    goto LABEL_33;
  }
  [(PUTileLayoutInfo *)self borderWidth];
  double v24 = v23;
  [v4 borderWidth];
  if (v24 != v25) {
    goto LABEL_33;
  }
  id v26 = [(PUTileLayoutInfo *)self borderColor];
  id v27 = [v4 borderColor];
  if (v26 == v27)
  {
  }
  else
  {
    double v28 = v27;
    char v29 = [v26 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_33;
    }
  }
  [(PUTileLayoutInfo *)self transform];
  [v4 transform];
  if (!CGAffineTransformEqualToTransform(&t1, &v76)) {
    goto LABEL_33;
  }
  [(PUTileLayoutInfo *)self zPosition];
  double v31 = v30;
  [v4 zPosition];
  if (v31 != v32) {
    goto LABEL_33;
  }
  double v33 = [v4 coordinateSystem];
  double v34 = [(PUTileLayoutInfo *)self coordinateSystem];
  int v35 = PUCanConvertFromCoordinateSystemToCoordinateSystem(v33, v34);

  if (!v35) {
    goto LABEL_33;
  }
  [(PUTileLayoutInfo *)self contentsRect];
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  [v4 contentsRect];
  v79.origin.double x = v44;
  v79.origin.double y = v45;
  v79.size.double width = v46;
  v79.size.double height = v47;
  v78.origin.double x = v37;
  v78.origin.double y = v39;
  v78.size.double width = v41;
  v78.size.double height = v43;
  if (!CGRectEqualToRect(v78, v79)) {
    goto LABEL_33;
  }
  [(PUTileLayoutInfo *)self hitTestOutset];
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  [v4 hitTestOutset];
  BOOL v59 = 0;
  if (v51 == v60 && v49 == v56 && v55 == v58 && v53 == v57)
  {
    [(PUTileLayoutInfo *)self expandedRectInsets];
    [v4 expandedRectInsets];
    if (!PXEdgeInsetsEqualToEdgeInsets()) {
      goto LABEL_33;
    }
    [(PUTileLayoutInfo *)self cropInsets];
    [v4 cropInsets];
    if (!PXEdgeInsetsEqualToEdgeInsets()) {
      goto LABEL_33;
    }
    [(PUTileLayoutInfo *)self verticalLegibilityFraction];
    double v62 = v61;
    [v4 verticalLegibilityFraction];
    if (v62 != v63) {
      goto LABEL_33;
    }
    [v4 center];
    double v65 = v64;
    double v67 = v66;
    v68 = [v4 coordinateSystem];
    v69 = [(PUTileLayoutInfo *)self coordinateSystem];
    double v70 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v68, v69, v65, v67);
    double v72 = v71;

    [(PUTileLayoutInfo *)self center];
    BOOL v59 = v74 == v72 && v73 == v70;
  }
LABEL_34:

  return v59;
}

- (id)clone
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(PUTileLayoutInfo *)self tileIdentifier];
  [(PUTileLayoutInfo *)self center];
  double v51 = v5;
  double v50 = v6;
  [(PUTileLayoutInfo *)self size];
  double v48 = v8;
  double v49 = v7;
  [(PUTileLayoutInfo *)self alpha];
  double v47 = v9;
  [(PUTileLayoutInfo *)self cornerRadius];
  double v46 = v10;
  double v11 = [(PUTileLayoutInfo *)self cornerCurve];
  unint64_t v12 = [(PUTileLayoutInfo *)self cornerMask];
  [(PUTileLayoutInfo *)self borderWidth];
  double v45 = v13;
  double v14 = [(PUTileLayoutInfo *)self borderColor];
  [(PUTileLayoutInfo *)self transform];
  [(PUTileLayoutInfo *)self zPosition];
  double v44 = v15;
  [(PUTileLayoutInfo *)self contentsRect];
  uint64_t v42 = v17;
  uint64_t v43 = v16;
  uint64_t v40 = v19;
  uint64_t v41 = v18;
  [(PUTileLayoutInfo *)self hitTestOutset];
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  double v28 = [(PUTileLayoutInfo *)self coordinateSystem];
  [(PUTileLayoutInfo *)self cropInsets];
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  [(PUTileLayoutInfo *)self verticalLegibilityFraction];
  double v38 = objc_msgSend(v3, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:cropInsets:verticalLegibilityFraction:", v4, v11, v12, v14, v52, v28, v51, v50, v49, v48, v47, v46, v45, v44, v43, v42,
                  v41,
                  v40,
                  v21,
                  v23,
                  v25,
                  v27,
                  v30,
                  v32,
                  v34,
                  v36,
                  v37);

  [(PUTileLayoutInfo *)self expandedRectInsets];
  objc_msgSend(v38, "setExpandedRectInsets:");
  return v38;
}

- (NSIndexPath)indexPath
{
  double v2 = [(PUTileLayoutInfo *)self tileIdentifier];
  id v3 = [v2 indexPath];

  return (NSIndexPath *)v3;
}

- (NSString)tileKind
{
  double v2 = [(PUTileLayoutInfo *)self tileIdentifier];
  id v3 = [v2 tileKind];

  return (NSString *)v3;
}

- (NSString)dataSourceIdentifier
{
  double v2 = [(PUTileLayoutInfo *)self tileIdentifier];
  id v3 = [v2 dataSourceIdentifier];

  return (NSString *)v3;
}

- (unint64_t)hash
{
  double v2 = [(PUTileLayoutInfo *)self tileIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PUTileIdentifier *)self->_tileIdentifier isEqual:v4[1]];

  return v5;
}

- (char)initWithTileIdentifier:(void *)a3 center:(void *)a4 size:(uint64_t)a5 alpha:(void *)a6 cornerRadius:(long long *)a7 cornerCurve:(void *)a8 cornerMask:(double)a9 borderWidth:(double)a10 borderColor:(double)a11 transform:(double)a12 zPosition:(double)a13 contentsRect:(double)a14 hitTestOutset:(double)a15 coordinateSystem:(double)a16 cropInsets:(uint64_t)a17 verticalLegibilityFraction:(uint64_t)a18
{
  id v44 = a3;
  id v45 = a4;
  id v46 = a6;
  id v47 = a8;
  v57.receiver = a1;
  v57.super_class = (Class)PUTileLayoutInfo;
  double v48 = (char *)objc_msgSendSuper2(&v57, sel_init);
  if (v48)
  {
    if (!v44)
    {
      double v56 = [MEMORY[0x1E4F28B00] currentHandler];
      [v56 handleFailureInMethod:a2, v48, @"PUTileLayoutInfo.m", 110, @"Invalid parameter not satisfying: %@", @"tileIdentifier != nil" object file lineNumber description];
    }
    if (!v47)
    {
      double v54 = [MEMORY[0x1E4F28B00] currentHandler];
      [v54 handleFailureInMethod:a2, v48, @"PUTileLayoutInfo.m", 111, @"Invalid parameter not satisfying: %@", @"coordinateSystem != nil" object file lineNumber description];
    }
    objc_storeStrong((id *)v48 + 1, a3);
    *((double *)v48 + 11) = a9;
    *((double *)v48 + 12) = a10;
    *((double *)v48 + 13) = a11;
    *((double *)v48 + 14) = a12;
    *((double *)v48 + 2) = a13;
    *((double *)v48 + 3) = a14;
    uint64_t v49 = [v45 copy];
    double v50 = (void *)*((void *)v48 + 4);
    *((void *)v48 + 4) = v49;

    *((void *)v48 + 7) = a5;
    *((double *)v48 + 5) = a15;
    objc_storeStrong((id *)v48 + 6, a6);
    long long v51 = *a7;
    long long v52 = a7[2];
    *(_OWORD *)(v48 + 264) = a7[1];
    *(_OWORD *)(v48 + 280) = v52;
    *(_OWORD *)(v48 + 248) = v51;
    *((double *)v48 + 8) = a16;
    *((void *)v48 + 15) = a17;
    *((void *)v48 + 16) = a18;
    *((void *)v48 + 17) = a19;
    *((void *)v48 + 18) = a20;
    *((void *)v48 + 19) = a21;
    *((void *)v48 + 20) = a22;
    *((void *)v48 + 21) = a23;
    *((void *)v48 + 22) = a24;
    objc_storeStrong((id *)v48 + 9, a8);
    *((void *)v48 + 23) = a25;
    *((void *)v48 + 24) = a26;
    *((void *)v48 + 25) = a27;
    *((void *)v48 + 26) = a28;
    *((void *)v48 + 10) = a29;
  }

  return v48;
}

- (PUTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 cornerRadius:(double)a7 cornerCurve:(id)a8 cornerMask:(unint64_t)a9 transform:(CGAffineTransform *)a10 zPosition:(double)a11 contentsRect:(CGRect)a12 coordinateSystem:(id)a13
{
  long long v13 = *(_OWORD *)&a10->c;
  v15[0] = *(_OWORD *)&a10->a;
  v15[1] = v13;
  v15[2] = *(_OWORD *)&a10->tx;
  return -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:cropInsets:verticalLegibilityFraction:](self, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:cropInsets:verticalLegibilityFraction:", a3, a8, a9, 0, v15, a13, a4.x, a4.y, a5.width, a5.height, a6, a7, 0.0, a11, *(void *)&a12.origin.x, *(void *)&a12.origin.y,
           *(void *)&a12.size.width,
           *(void *)&a12.size.height,
           *MEMORY[0x1E4FB2848],
           *(void *)(MEMORY[0x1E4FB2848] + 8),
           *(void *)(MEMORY[0x1E4FB2848] + 16),
           *(void *)(MEMORY[0x1E4FB2848] + 24),
           *MEMORY[0x1E4F91320],
           *(void *)(MEMORY[0x1E4F91320] + 8),
           *(void *)(MEMORY[0x1E4F91320] + 16),
           *(void *)(MEMORY[0x1E4F91320] + 24),
           0);
}

- (uint64_t)initWithTileIdentifier:(double)a3 center:(double)a4 size:(double)a5 alpha:(double)a6 transform:(double)a7 zPosition:(uint64_t)a8 contentsRect:(uint64_t)a9 hitTestOutset:(_OWORD *)a10 coordinateSystem:(uint64_t)a11
{
  long long v20 = a10[1];
  v22[0] = *a10;
  v22[1] = v20;
  v22[2] = a10[2];
  return objc_msgSend(a1, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:cropInsets:verticalLegibilityFraction:", a9, 0, 0, 0, v22, a11, a2, a3, a4, a5, a6, 0.0, 0.0, a7, a15, a16,
           a17,
           a18,
           a19,
           a20,
           *MEMORY[0x1E4F91320],
           *(void *)(MEMORY[0x1E4F91320] + 8),
           *(void *)(MEMORY[0x1E4F91320] + 16),
           *(void *)(MEMORY[0x1E4F91320] + 24),
           0);
}

- (PUTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 contentsRect:(CGRect)a9 coordinateSystem:(id)a10
{
  long long v10 = *(_OWORD *)&a7->c;
  v12[0] = *(_OWORD *)&a7->a;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a7->tx;
  return -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:cropInsets:verticalLegibilityFraction:](self, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:cropInsets:verticalLegibilityFraction:", a3, 0, 0, 0, v12, a10, a4.x, a4.y, a5.width, a5.height, a6, 0.0, 0.0, a8, *(void *)&a9.origin.x, *(void *)&a9.origin.y,
           *(void *)&a9.size.width,
           *(void *)&a9.size.height,
           *MEMORY[0x1E4FB2848],
           *(void *)(MEMORY[0x1E4FB2848] + 8),
           *(void *)(MEMORY[0x1E4FB2848] + 16),
           *(void *)(MEMORY[0x1E4FB2848] + 24),
           *MEMORY[0x1E4F91320],
           *(void *)(MEMORY[0x1E4F91320] + 8),
           *(void *)(MEMORY[0x1E4F91320] + 16),
           *(void *)(MEMORY[0x1E4F91320] + 24),
           0);
}

- (PUTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9
{
  long long v9 = *(_OWORD *)&a7->c;
  v11[0] = *(_OWORD *)&a7->a;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a7->tx;
  return -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:", a3, v11, a9, a4.x, a4.y, a5.width, a5.height, a6, a8, 0, 0, 0x3FF0000000000000, 0x3FF0000000000000, *MEMORY[0x1E4FB2848], *(void *)(MEMORY[0x1E4FB2848] + 8), *(void *)(MEMORY[0x1E4FB2848] + 16), *(void *)(MEMORY[0x1E4FB2848] + 24));
}

- (PUTileLayoutInfo)init
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", 0, v8, 0, v2, v3, v4, v5, 0.0, 0.0);
}

@end
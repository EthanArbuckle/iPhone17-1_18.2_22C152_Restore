@interface NUViewGeometry
- (BOOL)isFlipped;
- (CGPoint)origin;
- (CGRect)boundingCropRect;
- (CGRect)cropRect;
- (CGRect)imageBounds;
- (CGRect)proposedBoundsForBounds:(CGRect)a3 inFrame:(CGRect)a4;
- (CGSize)imageSize;
- (CGSize)viewImageSize;
- (NUViewGeometry)init;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)contentInsetsWithScale:(double)a3;
- (double)angle;
- (double)backingScale;
- (double)maximumScale;
- (uint64_t)insetBoundsForCrop:(CGFloat)a3 inBounds:(CGFloat)a4 inFrame:(CGFloat)a5;
- (void)setAngle:(double)a3;
- (void)setBackingScale:(double)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setFlipped:(BOOL)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setMaximumScale:(double)a3;
- (void)setOrigin:(CGPoint)a3;
@end

@implementation NUViewGeometry

- (void)setMaximumScale:(double)a3
{
  self->_maximumScale = a3;
}

- (double)maximumScale
{
  return self->_maximumScale;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (CGPoint)origin
{
  double x = self->_origin.x;
  double y = self->_origin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAngle:(double)a3
{
  self->_angle = a3;
}

- (double)angle
{
  return self->_angle;
}

- (void)setFlipped:(BOOL)a3
{
  self->_flipped = a3;
}

- (BOOL)isFlipped
{
  return self->_flipped;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBackingScale:(double)a3
{
  self->_backingScale = a3;
}

- (double)backingScale
{
  return self->_backingScale;
}

- (CGRect)boundingCropRect
{
  [(NUViewGeometry *)self cropRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGAffineTransformMakeScale(&v20, 1.0 / self->_backingScale, 1.0 / self->_backingScale);
  v21.origin.CGFloat x = v4;
  v21.origin.CGFloat y = v6;
  v21.size.CGFloat width = v8;
  v21.size.CGFloat height = v10;
  CGRect v22 = CGRectApplyAffineTransform(v21, &v20);
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  [(NUViewGeometry *)self angle];
  double v16 = NUBoundingRectForRotatedRect(x, y, width, height, v15);
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (UIEdgeInsets)contentInsetsWithScale:(double)a3
{
  [(NUViewGeometry *)self contentInsets];
  double v5 = v4 * a3;
  double v7 = v6 * a3;
  double v9 = v8 * a3;
  double v11 = v10 * a3;
  result.double right = v11;
  result.double bottom = v9;
  result.double left = v7;
  result.double top = v5;
  return result;
}

- (uint64_t)insetBoundsForCrop:(CGFloat)a3 inBounds:(CGFloat)a4 inFrame:(CGFloat)a5
{
  v24.origin.CGFloat x = a10;
  v24.origin.CGFloat y = a11;
  v24.size.CGFloat width = a12;
  v24.size.CGFloat height = a13;
  CGFloat Width = CGRectGetWidth(v24);
  v25.origin.CGFloat x = a2;
  v25.origin.CGFloat y = a3;
  v25.size.CGFloat width = a4;
  v25.size.CGFloat height = a5;
  CGRectGetWidth(v25);
  v26.origin.CGFloat x = a10;
  v26.origin.CGFloat y = a11;
  v26.size.CGFloat width = a12;
  v26.size.CGFloat height = a13;
  CGRectGetHeight(v26);
  v27.origin.CGFloat x = a2;
  v27.origin.CGFloat y = a3;
  v27.size.CGFloat width = a4;
  v27.size.CGFloat height = a5;
  CGRectGetHeight(v27);
  return objc_msgSend(a1, "contentInsets", *(void *)&Width);
}

- (CGRect)proposedBoundsForBounds:(CGRect)a3 inFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    double v13 = *MEMORY[0x263F001A8];
    double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v87 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    double v73 = *MEMORY[0x263F00148];
    double v74 = *(double *)(MEMORY[0x263F00148] + 8);
    v88.origin.CGFloat x = x;
    v88.origin.CGFloat y = y;
    v88.size.CGFloat width = width;
    v88.size.CGFloat height = height;
    CGFloat recta = height;
    double v16 = CGRectGetWidth(v88);
    v89.origin.CGFloat x = v11;
    v89.origin.CGFloat y = v10;
    v89.size.CGFloat width = v9;
    v89.size.CGFloat height = v8;
    CGFloat v17 = CGRectGetWidth(v89);
    CGFloat v86 = v9;
    double v87 = v8;
    v90.size.CGFloat width = width;
    CGFloat v18 = v8;
    double v19 = v16 / v17;
    v90.origin.CGFloat x = x;
    v90.origin.CGFloat y = y;
    v90.size.CGFloat height = recta;
    double v20 = CGRectGetHeight(v90);
    CGFloat v80 = v11;
    v91.origin.CGFloat x = v11;
    CGFloat v69 = v10;
    v91.origin.CGFloat y = v10;
    v91.size.CGFloat width = v9;
    v91.size.CGFloat height = v18;
    double v21 = v20 / CGRectGetHeight(v91);
    if (v19 >= v21) {
      double v22 = v21;
    }
    else {
      double v22 = v19;
    }
    [(NUViewGeometry *)self viewImageSize];
    CGFloat v25 = NUBoundingRectForRotatedRect(v73, v74, v23, v24, self->_angle);
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v82 = v28;
    CGFloat rect = v30;
    CGFloat v31 = v30;
    [(NUViewGeometry *)self contentInsetsWithScale:1.0 / v22];
    double v70 = v33;
    double v71 = v32;
    double v35 = v34;
    double v37 = v36;
    double v38 = NURectCenterRectInRect(v25, v27, v29, v31, v73, v74, v86, v87);
    CGFloat v78 = v39;
    CGFloat v79 = v38;
    CGFloat v76 = v41;
    CGFloat v77 = v40;
    CGFloat v42 = v25;
    if ([(NUViewGeometry *)self isFlipped]) {
      double v43 = v71;
    }
    else {
      double v43 = v37;
    }
    double v44 = v74 + v43;
    double v45 = v86 - (v70 + v35);
    double v46 = v87 - (v71 + v37);
    double v47 = v45 * 0.5;
    if (v45 > 0.0) {
      double v47 = -0.0;
    }
    double v48 = v73 + v35 + v47;
    if (v45 <= 0.0) {
      double v49 = 0.0;
    }
    else {
      double v49 = v86 - (v70 + v35);
    }
    double v50 = v46 * 0.5;
    if (v46 > 0.0) {
      double v50 = -0.0;
    }
    double v51 = v44 + v50;
    if (v46 <= 0.0) {
      double v52 = 0.0;
    }
    else {
      double v52 = v46;
    }
    v92.origin.CGFloat x = v25;
    CGFloat v75 = v27;
    v92.origin.CGFloat y = v27;
    v92.size.CGFloat width = v82;
    v92.size.CGFloat height = rect;
    CGFloat v53 = v79;
    double v54 = round(CGRectGetWidth(v92));
    v93.origin.CGFloat x = v48;
    v93.origin.CGFloat y = v51;
    v93.size.CGFloat width = v49;
    v93.size.CGFloat height = v52;
    if (v54 <= round(CGRectGetWidth(v93)))
    {
      v94.origin.CGFloat x = v48;
      v94.origin.CGFloat y = v51;
      v94.size.CGFloat width = v49;
      v94.size.CGFloat height = v52;
      double MaxX = CGRectGetMaxX(v94);
      v95.origin.CGFloat x = v79;
      v95.origin.CGFloat y = v78;
      v95.size.CGFloat width = v77;
      v95.size.CGFloat height = v76;
      double v68 = CGRectGetMaxX(v95);
      double v72 = v48;
      v96.origin.CGFloat x = v48;
      v96.origin.CGFloat y = v51;
      v96.size.CGFloat width = v49;
      v96.size.CGFloat height = v52;
      double MinX = CGRectGetMinX(v96);
      v97.origin.CGFloat x = v79;
      v97.origin.CGFloat y = v78;
      v97.size.CGFloat width = v77;
      v97.size.CGFloat height = v76;
      double v56 = CGRectGetMinX(v97);
      if (v68 >= MaxX)
      {
        double v57 = 0.0;
        if (v68 > MaxX) {
          double v57 = -(v56 - (v68 - MaxX));
        }
      }
      else
      {
        double v57 = -v56;
      }
      if (v56 >= MinX) {
        double v58 = v57;
      }
      else {
        double v58 = -MinX;
      }
      CGFloat v80 = v58;
      CGFloat v53 = v79;
      double v48 = v72;
    }
    v98.origin.CGFloat x = v42;
    v98.origin.CGFloat y = v75;
    v98.size.CGFloat width = v82;
    v98.size.CGFloat height = rect;
    double v59 = round(CGRectGetHeight(v98));
    v99.origin.CGFloat x = v48;
    v99.origin.CGFloat y = v51;
    v99.size.CGFloat width = v49;
    v99.size.CGFloat height = v52;
    if (v59 <= round(CGRectGetHeight(v99)))
    {
      v100.origin.CGFloat x = v48;
      v100.origin.CGFloat y = v51;
      v100.size.CGFloat width = v49;
      v100.size.CGFloat height = v52;
      double rectb = CGRectGetMaxY(v100);
      v101.origin.CGFloat x = v53;
      v101.origin.CGFloat y = v78;
      v101.size.CGFloat width = v77;
      v101.size.CGFloat height = v76;
      CGFloat MaxY = CGRectGetMaxY(v101);
      v102.size.CGFloat width = v49;
      double v61 = MaxY;
      v102.origin.CGFloat x = v48;
      v102.origin.CGFloat y = v51;
      v102.size.CGFloat height = v52;
      double MinY = CGRectGetMinY(v102);
      v103.origin.CGFloat x = v53;
      v103.origin.CGFloat y = v78;
      v103.size.CGFloat width = v77;
      v103.size.CGFloat height = v76;
      double v63 = CGRectGetMinY(v103);
      double v64 = v61 - rectb;
      if (v61 < rectb) {
        double v64 = 0.0;
      }
      double v65 = v63 - v64;
      if (v63 >= MinY) {
        double v66 = v65;
      }
      else {
        double v66 = MinY;
      }
      double v14 = -v66;
      double v15 = v86;
    }
    else
    {
      double v15 = v86;
      double v14 = v69;
    }
    double v13 = v80;
  }
  double v67 = v87;
  result.size.CGFloat height = v67;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)imageBounds
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGSize)viewImageSize
{
  double backingScale = self->_backingScale;
  double v3 = self->_imageSize.width / backingScale;
  double v4 = self->_imageSize.height / backingScale;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (NUViewGeometry)init
{
  v3.receiver = self;
  v3.super_class = (Class)NUViewGeometry;
  CGSize result = [(NUViewGeometry *)&v3 init];
  result->_maximumScale = 1.0;
  result->_double backingScale = 1.0;
  return result;
}

@end
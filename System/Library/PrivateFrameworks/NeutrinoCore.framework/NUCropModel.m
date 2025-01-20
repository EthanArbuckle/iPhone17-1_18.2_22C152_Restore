@interface NUCropModel
+ ($0AC6E346AE4835514AAA8AC86D8F4844)freeFormAspectRatio;
+ (CGRect)adjustCropRect:(CGRect)a3 inputExtent:(CGRect)a4 geometryTransform:(id)a5;
+ (double)defaultFocalLength;
+ (void)_imageTransformFromPitch:(double)a3@<D1> yaw:(double)a4@<D2> roll:(CGFloat)a5@<D3> imageRect:(CGFloat)a6@<D4>;
- ($0AC6E346AE4835514AAA8AC86D8F4844)_currentAspectRatio:(CGRect)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)aspectRatio;
- ($0AC6E346AE4835514AAA8AC86D8F4844)originalAspectRatio;
- (BOOL)_hasDefaultValues;
- (BOOL)aspectRatioIsFreeForm;
- (BOOL)aspectRatioIsOriginal;
- (BOOL)canGrowCropRect:(CGRect)a3 constrainWithAnchorPoint:(CGPoint)a4 strict:(BOOL)a5 withTol:(double)a6;
- (BOOL)hasCrop;
- (BOOL)imageContainsRect:(CGRect)a3 withTol:(double)a4;
- (BOOL)isAutoCrop;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCropModel:(id)a3;
- (CGRect)_anchorAlignedRectFromCandidate:(CGRect)a3 withAnchor:(CGPoint)a4;
- (CGRect)_defaultCropRect;
- (CGRect)_expandedCropRectForZoom:(CGRect)a3 candidateRect:(CGRect)a4;
- (CGRect)_integralCropRect:(CGRect)a3 straightenAngle:(double)a4 anchorPoint:(CGPoint)a5;
- (CGRect)_widestCropRect;
- (CGRect)cropRect;
- (CGRect)getCropRect:(CGRect)a3 newCropRect:(CGRect)a4 pitch:(double)a5 yaw:(double)a6 roll:(double)a7 constrainWithAnchorPoint:(CGPoint)a8 strict:(BOOL)a9 aspectRatioIsFreeForm:(BOOL)a10 hitVertexId:(unint64_t *)a11;
- (CGRect)getCropRectThatCompletelyContainsMasterImageForPitch:(double)a3 yaw:(double)a4 roll:(double)a5;
- (CGRect)integralCropRect:(CGRect)a3;
- (CGRect)masterImageRect;
- (CGSize)masterImageSize;
- (NUCropModel)init;
- (NUCropModel)initWithMasterImageRect:(CGRect)a3;
- (NUCropModel)initWithMasterImageRect:(CGRect)a3 stitchedImageRect:(CGRect)a4;
- (NUCropModel)initWithMasterImageSize:(CGSize)a3;
- (NUCropModel)initWithMasterImageSize:(CGSize)a3 fovRadians:(double)a4;
- (NUCropModel)initWithMasterImageSize:(CGSize)a3 stitchedImageSize:(CGSize)a4;
- (double)_currentAspectAsDouble:(CGRect)a3;
- (double)_defaultImageCenter;
- (double)_getBoundingQuadFromPitch:(double)a3 yaw:(double)a4 roll:(CGFloat)a5 withExpansionTol:(CGFloat)a6 imageRect:(CGFloat)a7;
- (double)fovRadians;
- (double)pitchDegreeUI;
- (double)pitchRadians;
- (double)rollDegreeUI;
- (double)rollRadians;
- (double)yawDegreeUI;
- (double)yawRadians;
- (id)copyWithMasterImageSize:(CGSize)a3 fovRadians:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_getBoundingQuad;
- (uint64_t)_getBoundingQuadFromPitch:(double)a3 yaw:(double)a4 roll:(double)a5;
- (uint64_t)_getBoundingQuadFromPitch:(double)a3 yaw:(double)a4 roll:(double)a5 imageRect:(double)a6;
- (uint64_t)_getBoundingQuadFromPitch:(double)a3 yaw:(double)a4 roll:(double)a5 withExpansionTol:;
- (unint64_t)_hitMaskFromRect:(CGRect)a3;
- (unint64_t)_hitMaskFromRect:(CGRect)a3 withTol:(double)a4;
- (unint64_t)constrainedMoveCropRectBy:(CGVector)a3;
- (unint64_t)constrainedMoveCropRectBy:(CGVector)a3 strict:(BOOL)a4;
- (unint64_t)constrainedMoveCropRectBy:(CGVector)a3 strict:(BOOL)a4 startRect:(CGRect)a5;
- (unint64_t)hash;
- (unint64_t)hitVertexID;
- (unint64_t)setAspectRatio:(id)a3 constrainCropRect:(CGRect)a4 withTargetArea:(double)a5;
- (unint64_t)setCropRect:(CGRect)a3 constrainWithAnchorPoint:(CGPoint)a4;
- (unint64_t)setCropRect:(CGRect)a3 newCropRect:(CGRect)a4 constrainWithAnchorPoint:(CGPoint)a5;
- (unint64_t)setCropRect:(CGRect)a3 newCropRect:(CGRect)a4 constrainWithAnchorPoint:(CGPoint)a5 strict:(BOOL)a6;
- (unint64_t)setForZoomCropRect:(CGRect)a3 newCropRect:(CGRect)a4;
- (unint64_t)setPitchAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4;
- (unint64_t)setPitchAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4 startRect:(CGRect)a5 startAngle:(double)a6;
- (unint64_t)setRollAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4;
- (unint64_t)setRollAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4 startRect:(CGRect)a5 startAngle:(double)a6;
- (unint64_t)setYawAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4;
- (unint64_t)setYawAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4 startRect:(CGRect)a5 startAngle:(double)a6;
- (void)_debugPrintHitMask;
- (void)_debugPrintHitMask:(unint64_t)a3;
- (void)_setCropRect:(CGRect)a3;
- (void)_setCropRect:(CGRect)a3 anchor:(CGPoint)a4;
- (void)_setCropRectWithConstantSize:(CGRect)a3;
- (void)_setToDefaultValues;
- (void)makeCurrentAspectRatioFreeForm;
- (void)makeCurrentFreeFormAspectFixed;
- (void)setAspectRatio:(id)a3;
- (void)setIsAutoCrop:(BOOL)a3;
- (void)setPitchRadians:(double)a3;
- (void)setRollRadians:(double)a3;
- (void)setYawRadians:(double)a3;
@end

@implementation NUCropModel

- (void)setIsAutoCrop:(BOOL)a3
{
  self->_isAutoCrop = a3;
}

- (BOOL)isAutoCrop
{
  return self->_isAutoCrop;
}

- (unint64_t)hitVertexID
{
  return self->_hitVertexID;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)aspectRatio
{
  int64_t height = self->_aspectRatio.height;
  int64_t width = self->_aspectRatio.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (double)fovRadians
{
  return self->_fovRadians;
}

- (CGRect)masterImageRect
{
  double x = self->_masterImageRect.origin.x;
  double y = self->_masterImageRect.origin.y;
  double width = self->_masterImageRect.size.width;
  double height = self->_masterImageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)rollDegreeUI
{
  return self->_rollRadians * 180.0 / 3.14159265;
}

- (double)yawDegreeUI
{
  return self->_yawRadians * 180.0 / 3.14159265;
}

- (double)pitchDegreeUI
{
  return self->_pitchRadians * 180.0 / 3.14159265;
}

- (void)setRollRadians:(double)a3
{
  self->_rollRadians = a3;
}

- (void)setYawRadians:(double)a3
{
  self->_yawRadians = a3;
}

- (void)setPitchRadians:(double)a3
{
  self->_pitchRadians = a3;
}

- (double)rollRadians
{
  return self->_rollRadians;
}

- (double)yawRadians
{
  return self->_yawRadians;
}

- (double)pitchRadians
{
  return self->_pitchRadians;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)originalAspectRatio
{
  double height = self->_masterImageRect.size.height;
  int64_t width = (uint64_t)self->_masterImageRect.size.width;
  int64_t v4 = (uint64_t)height;
  result.var1 = v4;
  result.var0 = width;
  return result;
}

- (BOOL)aspectRatioIsFreeForm
{
  return !self->_aspectRatio.width || self->_aspectRatio.height == 0;
}

- (BOOL)aspectRatioIsOriginal
{
  return self->_masterImageRect.size.width == (double)self->_aspectRatio.width
      && self->_masterImageRect.size.height == (double)self->_aspectRatio.height;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_currentAspectRatio:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  if ([(NUCropModel *)self aspectRatioIsFreeForm])
  {
    uint64_t v6 = (uint64_t)width;
    uint64_t v7 = (uint64_t)height;
  }
  else
  {
    uint64_t v6 = self->_aspectRatio.width;
    uint64_t v7 = self->_aspectRatio.height;
  }
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (double)_currentAspectAsDouble:(CGRect)a3
{
  uint64_t v3 = -[NUCropModel _currentAspectRatio:](self, "_currentAspectRatio:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return (double)v3 / (double)v4;
}

- (void)makeCurrentFreeFormAspectFixed
{
  self->_aspectRatio = ($5BB7312FFE32F1AB3F1F5957C99A58B3)vcvtq_s64_f64((float64x2_t)self->_cropRect.size);
  self->_isAutoCrop = 0;
}

- (void)makeCurrentAspectRatioFreeForm
{
  self->_aspectRatio.double width = +[NUCropModel freeFormAspectRatio];
  self->_aspectRatio.double height = v3;
  self->_isAutoCrop = 0;
}

- (unint64_t)setAspectRatio:(id)a3 constrainCropRect:(CGRect)a4 withTargetArea:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (!a3.var0 && a3.var1 || !a3.var1 && a3.var0)
  {
    a3.var0 = [(id)objc_opt_class() freeFormAspectRatio];
    a3.var1 = v11;
  }
  -[NUCropModel setAspectRatio:](self, "setAspectRatio:", a3.var0, a3.var1);
  if (![(NUCropModel *)self aspectRatioIsFreeForm])
  {
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    double MidX = CGRectGetMidX(v21);
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v22);
    uint64_t v14 = [(NUCropModel *)self aspectRatio];
    double v16 = aspectRatioConstrainedFromRect(v14, v15, x, y, width, height, MidX, MidY, a5);
    -[NUCropModel setCropRect:newCropRect:constrainWithAnchorPoint:](self, "setCropRect:newCropRect:constrainWithAnchorPoint:", v16, v17, v18, v19, v16, v17, v18, v19, *(void *)&MidX, *(void *)&MidY);
  }
  return self->_hitVertexID;
}

- (unint64_t)setYawAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4 startRect:(CGRect)a5 startAngle:(double)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  long double v13 = a3 - a6;
  [(NUCropModel *)self _getBoundingQuadFromPitch:self->_pitchRadians yaw:a3 roll:self->_rollRadians];
  v43[0] = v14;
  v43[1] = v15;
  v43[2] = v16;
  v43[3] = v17;
  v14.f64[0] = x;
  v15.f64[0] = y;
  v16.f64[0] = width;
  v17.f64[0] = height;
  double MidX = CGRectGetMidX(*(CGRect *)v14.f64);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.double width = width;
  v44.size.double height = height;
  CGFloat MidY = CGRectGetMidY(v44);
  long long v40 = *(_OWORD *)self->_imageCenter;
  double v37 = *(double *)&self->_imageCenter[8] + MidY - *((double *)&v40 + 1) + (MidX - *(double *)&v40) * 0.0;
  double v38 = *(double *)&v40 + (MidY - *((double *)&v40 + 1)) * 0.0 + cos(v13) * (MidX - *(double *)&v40);
  v20.f64[0] = v38 - width * 0.5;
  double v21 = v37 - height * 0.5;
  if (width * height < a4)
  {
    uint64_t v22 = -[NUCropModel _currentAspectRatio:](self, "_currentAspectRatio:");
    v20.f64[0] = _rectWithAspectRatio(v22, v23, v38 - width * 0.5, v37 - height * 0.5, width, height, a4 / (width * height));
    double width = v24;
    double height = v25;
  }
  v20.f64[1] = v21;
  v26.f64[0] = width + v20.f64[0];
  double v27 = v21;
  v28.f64[1] = v21;
  v28.f64[0] = width + v20.f64[0];
  v42[0] = v20;
  v42[1] = v28;
  double v41 = v20.f64[0];
  v29.f64[0] = v20.f64[0];
  v29.f64[1] = height + v28.f64[1];
  v26.f64[1] = height + v28.f64[1];
  v42[2] = v29;
  v42[3] = v26;
  if ((NU::Quad2d::contains(v43, v42) & 1) == 0)
  {
    v30.f64[0] = v38;
    v30.f64[1] = v37;
    __n128 v39 = (__n128)v30;
    if (NU::Quad2d::contains(v43, v30))
    {
      -[NUCropModel _currentAspectAsDouble:](self, "_currentAspectAsDouble:", v41, v27, width, height);
      NU::Quad2d::findInscribedAxisAlignedAspectFitRect(v43, v39, v31);
      double v41 = v32;
      double v27 = v33;
      double width = v34;
      double height = v35;
    }
  }
  [(NUCropModel *)self setYawRadians:a3];
  -[NUCropModel _setCropRect:](self, "_setCropRect:", v41, v27, width, height);
  return self->_hitVertexID;
}

- (unint64_t)setPitchAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4 startRect:(CGRect)a5 startAngle:(double)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  long double v11 = a3 - a6;
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:](self, "_getBoundingQuadFromPitch:yaw:roll:");
  v47[0] = v12;
  v47[1] = v13;
  v47[2] = v14;
  v47[3] = v15;
  v12.f64[0] = x;
  v13.f64[0] = y;
  v14.f64[0] = width;
  v15.f64[0] = height;
  double MidX = CGRectGetMidX(*(CGRect *)v12.f64);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.double width = width;
  v48.size.double height = height;
  CGFloat MidY = CGRectGetMidY(v48);
  long long v44 = *(_OWORD *)self->_imageCenter;
  double v18 = *(double *)&self->_imageCenter[8];
  double v19 = MidX - *(double *)&v44 + (MidY - *((double *)&v44 + 1)) * 0.0;
  double v20 = v18 + cos(v11) * (MidY - *((double *)&v44 + 1)) + (MidX - *(double *)&v44) * 0.0;
  double v42 = *(double *)&v44 + v19;
  v21.f64[0] = *(double *)&v44 + v19 - width * 0.5;
  double v39 = v20;
  double v22 = v20 - height * 0.5;
  if (width * height < a4)
  {
    double v38 = v20 - height * 0.5;
    uint64_t v23 = -[NUCropModel _currentAspectRatio:](self, "_currentAspectRatio:");
    v21.f64[0] = _rectWithAspectRatio(v23, v24, *(double *)&v44 + v19 - width * 0.5, v38, width, height, a4 / (width * height));
    double width = v25;
    double height = v26;
  }
  v21.f64[1] = v22;
  double v45 = v21.f64[0];
  v46[0] = v21;
  v27.f64[0] = width + v21.f64[0];
  double v28 = v22;
  v29.f64[1] = v22;
  v29.f64[0] = width + v21.f64[0];
  v46[1] = v29;
  v30.f64[0] = v21.f64[0];
  v30.f64[1] = height + v28;
  v27.f64[1] = height + v28;
  v46[2] = v30;
  v46[3] = v27;
  if ((NU::Quad2d::contains(v47, v46) & 1) == 0)
  {
    v31.n128_f64[0] = v42;
    v31.n128_f64[1] = v39;
    __n128 v43 = v31;
    -[NUCropModel _currentAspectAsDouble:](self, "_currentAspectAsDouble:", v45, v28, width, height);
    NU::Quad2d::findInscribedAxisAlignedAspectFitRect(v47, v43, v32);
    double v45 = v33;
    double v28 = v34;
    double width = v35;
    double height = v36;
  }
  [(NUCropModel *)self setPitchRadians:a3];
  -[NUCropModel _setCropRect:](self, "_setCropRect:", v45, v28, width, height);
  return self->_hitVertexID;
}

- (unint64_t)setRollAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4 startRect:(CGRect)a5 startAngle:(double)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v11 = a3 - a6;
  [(NUCropModel *)self _getBoundingQuadFromPitch:self->_pitchRadians yaw:self->_yawRadians roll:a3];
  v65[0] = v12;
  v65[1] = v13;
  v65[2] = v14;
  v65[3] = v15;
  v12.f64[0] = x;
  v13.f64[0] = y;
  v15.f64[0] = height;
  v14.f64[0] = width;
  CGFloat MidX = CGRectGetMidX(*(CGRect *)v12.f64);
  v66.origin.CGFloat x = x;
  v66.origin.CGFloat y = y;
  v66.size.double height = height;
  v66.size.double width = width;
  CGFloat MidY = CGRectGetMidY(v66);
  v17.f64[0] = MidX;
  v17.f64[1] = MidY;
  float64x2_t v57 = v17;
  [(NUCropModel *)self masterImageRect];
  CGFloat v18 = v67.origin.x;
  CGFloat v19 = v67.origin.y;
  CGFloat v20 = v67.size.width;
  CGFloat v21 = v67.size.height;
  CGFloat v53 = CGRectGetMidX(v67);
  v68.origin.CGFloat x = v18;
  v68.origin.CGFloat y = v19;
  v68.size.double width = v20;
  v68.size.double height = v21;
  CGFloat v22 = CGRectGetMidY(v68);
  v23.f64[0] = v53;
  v23.f64[1] = v22;
  float64x2_t v54 = v23;
  __double2 v25 = __sincos_stret(v11);
  v24.f64[0] = v25.__cosval;
  v26.f64[0] = -v25.__sinval;
  v26.f64[1] = v25.__cosval;
  v24.f64[1] = v25.__sinval;
  double v27 = height;
  float64x2_t v28 = vsubq_f64(v57, v54);
  float64x2_t v29 = vmlaq_laneq_f64(vmulq_n_f64(v24, v28.f64[0]), v26, v28, 1);
  double v30 = width;
  v31.f64[0] = width;
  v31.f64[1] = height;
  float64x2_t v32 = vaddq_f64(v54, v29);
  __asm { FMOV            V1.2D, #-0.5 }
  __n128 v55 = (__n128)v32;
  float64x2_t v38 = vmlaq_f64(v32, _Q1, v31);
  if (width * height < a4)
  {
    double v39 = v38.f64[1];
    double v58 = v38.f64[0];
    uint64_t v40 = [(NUCropModel *)self _currentAspectRatio:*(_OWORD *)&v55];
    v38.f64[0] = _rectWithAspectRatio(v40, v41, v58, v39, width, height, a4 / (width * height));
    v38.f64[1] = v42;
  }
  double v59 = v38.f64[0];
  double v61 = v27;
  double v63 = v30;
  v64[0] = v38;
  v43.f64[0] = v30 + v38.f64[0];
  double v44 = v38.f64[1];
  v45.f64[1] = v38.f64[1];
  v45.f64[0] = v30 + v38.f64[0];
  v64[1] = v45;
  v46.f64[0] = v38.f64[0];
  v46.f64[1] = v27 + v38.f64[1];
  v43.f64[1] = v27 + v38.f64[1];
  v64[2] = v46;
  v64[3] = v43;
  if ((NU::Quad2d::simpleContains(v65, v64) & 1) == 0)
  {
    -[NUCropModel _currentAspectAsDouble:](self, "_currentAspectAsDouble:", v59, v44, v63, v61);
    NU::Quad2d::findInscribedAxisAlignedAspectFitRect(v65, v55, v47);
    double v59 = v48;
    double v61 = v49;
    double v44 = v50;
    double v63 = v51;
  }
  -[NUCropModel setRollRadians:](self, "setRollRadians:", a3, v55.n128_u64[0]);
  -[NUCropModel _setCropRect:](self, "_setCropRect:", v59, v44, v63, v61);
  return self->_hitVertexID;
}

- (unint64_t)setYawAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4
{
  return -[NUCropModel setYawAngle:constrainCropRectWithTargetArea:startRect:startAngle:](self, "setYawAngle:constrainCropRectWithTargetArea:startRect:startAngle:", a3, a4, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height, self->_yawRadians);
}

- (unint64_t)setPitchAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4
{
  return -[NUCropModel setPitchAngle:constrainCropRectWithTargetArea:startRect:startAngle:](self, "setPitchAngle:constrainCropRectWithTargetArea:startRect:startAngle:", a3, a4, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height, self->_pitchRadians);
}

- (unint64_t)setRollAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4
{
  return -[NUCropModel setRollAngle:constrainCropRectWithTargetArea:startRect:startAngle:](self, "setRollAngle:constrainCropRectWithTargetArea:startRect:startAngle:", a3, a4, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height, self->_rollRadians);
}

- (unint64_t)constrainedMoveCropRectBy:(CGVector)a3 strict:(BOOL)a4 startRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  dCGFloat y = a3.dy;
  dCGFloat x = a3.dx;
  [(NUCropModel *)self _getBoundingQuadFromPitch:self->_pitchRadians yaw:self->_yawRadians roll:self->_rollRadians];
  __n128 v76 = (__n128)v14;
  __n128 v77 = (__n128)v13;
  v84[0] = v13;
  v84[1] = v14;
  __n128 v74 = (__n128)v16;
  __n128 v75 = (__n128)v15;
  v84[2] = v15;
  v84[3] = v16;
  v13.f64[0] = x;
  v14.f64[0] = y;
  v15.f64[0] = width;
  v16.f64[0] = height;
  CGRect v96 = CGRectOffset(*(CGRect *)((char *)&v14 - 8), dx, dy);
  double v17 = v96.size.height;
  v96.size.double height = v96.origin.x;
  CGFloat v18 = v96.origin.y;
  p_cropRect = &self->_cropRect;
  CGPoint origin = self->_cropRect.origin;
  CGPoint v72 = v96.origin;
  float64x2_t v78 = *(float64x2_t *)&v96.size.height;
  CGFloat rect2 = v96.size.width;
  v96.origin.CGFloat x = v96.origin.x + v96.size.width;
  v96.size.double width = v96.origin.x;
  CGFloat v20 = v96.origin.y;
  float64x2_t v91 = *(float64x2_t *)&v96.size.height;
  CGSize size = v96.size;
  double v73 = v96.origin.y;
  v96.size.double width = v96.size.height;
  CGFloat v21 = v96.origin.y + v17;
  CGFloat v22 = v96.origin.y + v17;
  CGSize v93 = v96.size;
  CGPoint v94 = v96.origin;
  if ((NU::Quad2d::contains(v84, &v91) & 1) == 0)
  {
    double v83 = width / height;
    float64x2_t v25 = (float64x2_t)self->_cropRect.size;
    v95.CGPoint origin = p_cropRect->origin;
    v95.CGSize size = (CGSize)v25;
    CGSize rect2a = (CGSize)v25;
    float64x2_t v26 = vaddq_f64(v25, (float64x2_t)v95.origin);
    v27.double width = v26.f64[0];
    v27.double height = v95.origin.y;
    float64x2_t v91 = (float64x2_t)v95.origin;
    CGSize size = v27;
    CGSize v68 = v27;
    v27.double width = v95.origin.x;
    v27.double height = v26.f64[1];
    CGSize v67 = v27;
    CGSize v93 = v27;
    CGPoint v94 = (CGPoint)v26;
    float64x2_t v69 = v26;
    float64x2_t v70 = (float64x2_t)v95.origin;
    uint64_t v28 = NU::Quad2d::equivalentWithTolerance(v84, &v91, 0.000244140625);
    v36.f64[0] = v70.f64[0];
    double v17 = rect2a.height;
    double v24 = rect2a.width;
    double v37 = v70.f64[1];
    if ((v28 & 1) == 0)
    {
      float64x2_t v87 = v70;
      CGSize v88 = v68;
      CGSize v89 = v67;
      float64x2_t v90 = v69;
      if (NU::Quad2d::contains(v84, &v87))
      {
        float64x2_t v41 = vsubq_f64(v78, (float64x2_t)origin);
        float64x2_t v87 = (float64x2_t)v95.origin;
        CGSize v88 = v95.size;
        float64x2_t rect2b = vmulq_n_f64(v41, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v41, v41))));
        NU::Quad2d::boundingRect(v84);
        v43.f64[1] = v42;
        double v44 = sqrt(vaddvq_f64(vmulq_f64(v43, v43)));
        CGSize v45 = self->_cropRect.size;
        v86[0] = (float64x2_t)p_cropRect->origin;
        v86[1] = (float64x2_t)v45;
        v86[0] = vmlaq_n_f64(v86[0], rect2b, v44);
        v85 = &unk_1F000FFD0;
        double v46 = NU::Quad2d::computeLimitRect(v84, (uint64_t)&v87, (uint64_t)v86, (uint64_t)&v85, 0.000244140625);
      }
      else
      {
        v97.origin.CGFloat x = NU::Quad2d::findInscribedUnscaledFitRect((NU::Quad2d *)v84, &v95, 0.000000953674316, v38, v39, v40);
        CGFloat v49 = v97.origin.x;
        CGFloat v50 = v97.origin.y;
        CGFloat v51 = v97.size.width;
        CGFloat v52 = v97.size.height;
        v98.CGPoint origin = (CGPoint)v70;
        v98.CGSize size = rect2a;
        uint64_t v28 = CGRectEqualToRect(v97, v98);
        if (!v28)
        {
          double v17 = v52;
          double v24 = v51;
          double v37 = v50;
          v36.f64[0] = v49;
          if (a4) {
            goto LABEL_10;
          }
          goto LABEL_12;
        }
        CGFloat rect2c = CGRectGetMidX(self->_cropRect);
        CGFloat MidY = CGRectGetMidY(self->_cropRect);
        v54.f64[0] = rect2c;
        v54.f64[1] = MidY;
        float64x2_t v87 = v54;
        NU::Quad2d::findInscribedAxisAlignedAspectFitRectWithAnchor(v84, v87.f64, (uint64_t)&v95, (uint64_t)&v95, (uint64_t *)&v83, 0.000000953674316);
      }
      v36.f64[0] = v46;
      double v37 = v47;
      double v17 = v48;
    }
    if (a4)
    {
LABEL_10:
      v36.f64[1] = v37;
LABEL_13:
      __asm
      {
        FMOV            V0.2D, #8.0
        FMOV            V1.2D, #0.125
      }
      float64x2_t v23 = vmulq_f64(vrndaq_f64(vmulq_f64(v36, _Q0)), _Q1);
      goto LABEL_14;
    }
LABEL_12:
    v55.f64[1] = v72.y;
    v66.f64[0] = v72.x - v36.f64[0];
    v66.f64[1] = v73 - v37;
    v55.f64[0] = v36.f64[0];
    deriveTranslatedRectFromConstrainedRect(v28, v29, v30, v31, v32, v33, v34, v35, v55, v37, v24, v17, v77, v76, v75, v74, v66);
    v36.f64[0] = v56;
    double v17 = v57;
    v36.f64[1] = v58;
    goto LABEL_13;
  }
  float64x2_t v23 = v78;
  double v24 = rect2;
LABEL_14:
  -[NUCropModel _setCropRect:](self, "_setCropRect:", *(_OWORD *)&v23, v24, v17);
  return self->_hitVertexID;
}

- (unint64_t)constrainedMoveCropRectBy:(CGVector)a3 strict:(BOOL)a4
{
  return -[NUCropModel constrainedMoveCropRectBy:strict:startRect:](self, "constrainedMoveCropRectBy:strict:startRect:", a4, a3.dx, a3.dy, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
}

- (unint64_t)constrainedMoveCropRectBy:(CGVector)a3
{
  return -[NUCropModel constrainedMoveCropRectBy:strict:](self, "constrainedMoveCropRectBy:strict:", 1, a3.dx, a3.dy);
}

- (CGRect)getCropRectThatCompletelyContainsMasterImageForPitch:(double)a3 yaw:(double)a4 roll:(double)a5
{
  [(NUCropModel *)self masterImageRect];
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:imageRect:](self, "_getBoundingQuadFromPitch:yaw:roll:imageRect:", a3, a4, a5, v9, v10, v11, v12);
  v66[0] = v13;
  v66[1] = v14;
  v66[2] = v15;
  v66[3] = v16;
  double v17 = NU::Quad2d::boundingRect(v66);
  CGFloat v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(NUCropModel *)self cropRect];
  v73.origin.CGFloat x = v17;
  v73.origin.CGFloat y = v19;
  v73.size.double width = v21;
  v73.size.double height = v23;
  if (CGRectContainsRect(v67, v73))
  {
    [(NUCropModel *)self cropRect];
LABEL_13:
    double v40 = v26;
    double v31 = v27;
    goto LABEL_14;
  }
  v68.origin.CGFloat x = v17;
  v68.origin.CGFloat y = v19;
  v68.size.double width = v21;
  v68.size.double height = v23;
  double v28 = round(CGRectGetMidX(v68));
  v69.origin.CGFloat x = v17;
  v69.origin.CGFloat y = v19;
  v69.size.double width = v21;
  v69.size.double height = v23;
  double v29 = round(CGRectGetMidY(v69));
  double v30 = round(v21);
  double v31 = round(v23);
  double v32 = v30 / v31;
  [(NUCropModel *)self cropRect];
  uint64_t v33 = -[NUCropModel _currentAspectRatio:](self, "_currentAspectRatio:");
  double v35 = (double)v33 / (double)v34;
  double v36 = INFINITY;
  if (!v33) {
    double v36 = NAN;
  }
  if (!v34) {
    double v35 = v36;
  }
  BOOL v37 = v32 < v35;
  double v38 = round(v31 * v32 / v35);
  double v39 = round(v30 * v35 / v32);
  if (v37)
  {
    double v40 = v39;
  }
  else
  {
    double v31 = v38;
    double v40 = v30;
  }
  v41.f64[0] = v28 - v40 * 0.5;
  double v62 = v41.f64[0];
  double v63 = v29 - v31 * 0.5;
  v41.f64[1] = v63;
  float64x2_t v60 = v41;
  [(NUCropModel *)self masterImageRect];
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:imageRect:](self, "_getBoundingQuadFromPitch:yaw:roll:imageRect:", a3, a4, a5, v42, v43, v44, v45);
  v65[0] = v46;
  v65[1] = v47;
  v65[2] = v48;
  v65[3] = v49;
  v46.f64[0] = v40 + v62;
  v47.f64[0] = v40 + v62;
  v47.f64[1] = v63;
  v48.f64[0] = v60.f64[0];
  v64[0] = v60;
  v64[1] = v47;
  v48.f64[1] = v31 + v63;
  v46.f64[1] = v31 + v63;
  v64[2] = v48;
  v64[3] = v46;
  if ((NU::Quad2d::contains(v65, v64) & 1) == 0)
  {
    [(NUCropModel *)self cropRect];
    double v59 = v51;
    double v61 = v50;
    double v53 = v52;
    double v58 = v54;
    [(NUCropModel *)self cropRect];
    CGFloat MidX = CGRectGetMidX(v70);
    [(NUCropModel *)self cropRect];
    -[NUCropModel getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:](self, "getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:", 1, [(NUCropModel *)self aspectRatioIsFreeForm], 0, v61, v59, v53, v58, v62, v63, v40, v31, *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&MidX, CGRectGetMidY(v71));
    goto LABEL_13;
  }
  double v24 = v28 - v40 * 0.5;
  double v25 = v29 - v31 * 0.5;
LABEL_14:
  double v56 = v40;
  double v57 = v31;
  result.size.double height = v57;
  result.size.double width = v56;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (CGRect)getCropRect:(CGRect)a3 newCropRect:(CGRect)a4 pitch:(double)a5 yaw:(double)a6 roll:(double)a7 constrainWithAnchorPoint:(CGPoint)a8 strict:(BOOL)a9 aspectRatioIsFreeForm:(BOOL)a10 hitVertexId:(unint64_t *)a11
{
  double v11 = (void *)a9;
  int y_low = LODWORD(a8.y);
  char x_low = LOBYTE(a8.x);
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  v183.f64[0] = a3.origin.x;
  v183.f64[1] = a3.origin.y;
  double v169 = a3.size.width;
  double v170 = a3.size.height;
  CGFloat v184 = a3.size.width;
  CGFloat v185 = a3.size.height;
  double v19 = 0.0;
  _ZF = a4.size.width == 0.0;
  double v20 = 0.0;
  if (!_ZF) {
    double v20 = (v198.f64[0] - a4.origin.x) / width;
  }
  if (a4.size.height != 0.0) {
    double v19 = (v198.f64[1] - y) / a4.size.height;
  }
  double v172 = v20;
  double v173 = v19;
  double v21 = a4.origin.x + v20 * (width + -2.0);
  double v22 = y + v19 * (a4.size.height + -2.0);
  double v23 = fmin(x, v21);
  double v24 = fmin(y, v22);
  double v25 = fmax(x + width, v21 + 2.0) - v23;
  double v26 = fmax(y + a4.size.height, v22 + 2.0) - v24;
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:](self, "_getBoundingQuadFromPitch:yaw:roll:", *(void *)&a8.x, *(void *)&a8.y, a9, a10, a11, a5, a6, a7);
  long long v167 = (__int128)v28;
  CGVector v168 = (CGVector)v27;
  v182[0] = v27;
  v182[1] = v28;
  long long v165 = (__int128)v30;
  long long v166 = (__int128)v29;
  v182[2] = v29;
  v182[3] = v30;
  -[NUCropModel _anchorAlignedRectFromCandidate:withAnchor:](self, "_anchorAlignedRectFromCandidate:withAnchor:", v23, v24, v25, v26, *(_OWORD *)&v198);
  v186.origin.double x = v33;
  v186.origin.double y = v34;
  v186.size.double width = v31;
  v186.size.double height = v32;
  if (self->_aspectRatio.width) {
    _ZF = self->_aspectRatio.height == 0;
  }
  else {
    _ZF = 1;
  }
  if (_ZF) {
    int64_t v36 = (uint64_t)v169;
  }
  else {
    int64_t v36 = self->_aspectRatio.width;
  }
  if (_ZF) {
    int64_t v37 = (uint64_t)v170;
  }
  else {
    int64_t v37 = self->_aspectRatio.height;
  }
  if (y_low)
  {
    double v38 = v31;
    double v39 = v32;
  }
  else
  {
    double v40 = aspectRatioConstrainedFromRect(v36, v37, x, y, width, height, v198.f64[0], v198.f64[1], width * height);
    double v38 = v41;
    double v39 = v42;
    v186.origin.double x = v40;
    v186.origin.double y = v43;
    v186.size.double width = v41;
    v186.size.double height = v42;
  }
  float64x2_t v181 = v198;
  v44.f64[0] = v186.origin.x;
  v45.f64[0] = v38 + v186.origin.x;
  double v46 = v186.origin.y;
  v47.f64[1] = v186.origin.y;
  v47.f64[0] = v38 + v186.origin.x;
  float64x2_t origin = (float64x2_t)v186.origin;
  float64x2_t v190 = v47;
  CGFloat v171 = v186.origin.x;
  v44.f64[1] = v186.origin.y + v39;
  v45.f64[1] = v186.origin.y + v39;
  float64x2_t v191 = v44;
  float64x2_t v192 = v45;
  if ((NU::Quad2d::simpleContains(v182, &origin) & 1) == 0)
  {
    if (!y_low)
    {
      double v64 = (double)v36 / (double)v37;
      double v65 = INFINITY;
      if (!v36) {
        double v65 = NAN;
      }
      if (!v37) {
        double v64 = v65;
      }
      origin.f64[0] = v64;
      NU::Quad2d::findInscribedAxisAlignedAspectFitRectWithAnchor(v182, v181.f64, (uint64_t)&v183, (uint64_t)&v186, (uint64_t *)&origin, 0.000244140625);
      goto LABEL_116;
    }
    if (fabs(v172 + -0.5) < 0.01 && (fabs(v173 + -1.0) < 0.01 || fabs(v173) < 0.01))
    {
      NU::RectT<double>::RectT(v193.f64, &v186);
      int v66 = 100;
      float64x2_t v67 = v193;
      while (1)
      {
        float64x2_t v174 = v194;
        float64x2_t v68 = vaddq_f64(v67, v194);
        v69.f64[0] = v68.f64[0];
        v69.f64[1] = v67.f64[1];
        float64x2_t origin = v67;
        float64x2_t v190 = v69;
        v67.f64[1] = v68.f64[1];
        float64x2_t v191 = v67;
        float64x2_t v192 = v68;
        if ((NU::Quad2d::simpleContains(v182, &origin) & 1) != 0 || !v66) {
          break;
        }
        float64x2_t v193 = vsubq_f64(v193, v198);
        NU::RectT<double>::scale(v193.f64, 1.0, 0.5);
        float64x2_t v67 = vaddq_f64(v198, v193);
        float64x2_t v193 = v67;
        --v66;
      }
      v70.f64[0] = v193.f64[0];
      float64x2_t v71 = vaddq_f64(v193, v174);
      v72.f64[0] = v71.f64[0];
      float64x2_t origin = v193;
      v72.f64[1] = v193.f64[1];
      float64x2_t v190 = v72;
      v70.f64[1] = v71.f64[1];
      float64x2_t v191 = v70;
      float64x2_t v192 = v71;
      if (NU::Quad2d::simpleContains(v182, &origin))
      {
        NU::RectT<double>::RectT((double *)buf, &v186);
        int v73 = 100;
        for (float64x2_t i = *(float64x2_t *)buf; ; *(float64x2_t *)buf = i)
        {
          float64x2_t v175 = *(float64x2_t *)&buf[16];
          float64x2_t v75 = vaddq_f64(i, *(float64x2_t *)&buf[16]);
          v76.f64[0] = v75.f64[0];
          v76.f64[1] = i.f64[1];
          float64x2_t origin = i;
          float64x2_t v190 = v76;
          i.f64[1] = v75.f64[1];
          float64x2_t v191 = i;
          float64x2_t v192 = v75;
          int v77 = NU::Quad2d::simpleContains(v182, &origin);
          _CF = v73-- != 0;
          BOOL v78 = _CF;
          if (!v77 || !v78) {
            break;
          }
          *(float64x2_t *)buf = vsubq_f64(*(float64x2_t *)buf, v198);
          NU::RectT<double>::scale((double *)buf, 1.0, 2.0);
          float64x2_t i = vaddq_f64(v198, *(float64x2_t *)buf);
        }
        float64x2_t v98 = vaddq_f64(*(float64x2_t *)buf, v175);
        v99.f64[0] = *(float64_t *)buf;
        v99.f64[1] = v98.f64[1];
        float64x2_t v191 = v99;
        float64x2_t v192 = v98;
        v98.f64[1] = *(float64_t *)&buf[8];
        long long v177 = *(_OWORD *)buf;
        float64x2_t origin = *(float64x2_t *)buf;
        float64x2_t v190 = v98;
        if (!NU::Quad2d::simpleContains(v182, &origin))
        {
          *(void *)&origin.f64[0] = &unk_1F0010060;
          float64x2_t v190 = v198;
          *(float64x2_t *)v195 = v193;
          *(float64x2_t *)&v195[16] = v194;
          long long v187 = v177;
          long long v188 = *(_OWORD *)&buf[16];
          double v60 = NU::Quad2d::computeLimitRect(v182, (uint64_t)v195, (uint64_t)&v187, (uint64_t)&origin, 0.000000953674316);
          goto LABEL_116;
        }
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
        }
        v100 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
        {
          v101 = [NSString stringWithFormat:@"findInscribedAxisAlignedFitRectWithAnchorVert : Cannot find a valid initial seed for solver"];
          *(_DWORD *)v195 = 138543362;
          *(void *)&v195[4] = v101;
          _os_log_impl(&dword_1A9892000, v100, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v195, 0xCu);
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
          }
          v102 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            v103 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v104 = [MEMORY[0x1E4F29060] callStackSymbols];
            v105 = [v104 componentsJoinedByString:@"\n"];
            *(_DWORD *)v195 = 138543618;
            *(void *)&v195[4] = v103;
            *(_WORD *)&v195[12] = 2114;
            *(void *)&v195[14] = v105;
            _os_log_error_impl(&dword_1A9892000, v102, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v195, 0x16u);
          }
        }
        else
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
          }
          v102 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            v160 = [MEMORY[0x1E4F29060] callStackSymbols];
            v161 = [v160 componentsJoinedByString:@"\n"];
            *(_DWORD *)v195 = 138543362;
            *(void *)&v195[4] = v161;
            _os_log_error_impl(&dword_1A9892000, v102, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v195, 0xCu);
          }
        }

        _NUAssertContinueHandler((uint64_t)"const CGRect NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchorVert(const simd_double2 &, const CGRect &, const double) const", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUQuad2.h", 719, @"findInscribedAxisAlignedFitRectWithAnchorVert : Cannot find a valid initial seed for solver", v128, v129, v130, v131, v164);
      }
      else
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
        }
        v92 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          CGSize v93 = [NSString stringWithFormat:@"findInscribedAxisAlignedFitRectWithAnchorVert : Cannot find a valid initial seed for solver"];
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v93;
          _os_log_impl(&dword_1A9892000, v92, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
          }
          CGPoint v94 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
          {
            CGRect v95 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            CGRect v96 = [MEMORY[0x1E4F29060] callStackSymbols];
            CGRect v97 = [v96 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v95;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v97;
            _os_log_error_impl(&dword_1A9892000, v94, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
          }
          CGPoint v94 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
          {
            v156 = [MEMORY[0x1E4F29060] callStackSymbols];
            v157 = [v156 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v157;
            _os_log_error_impl(&dword_1A9892000, v94, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
          }
        }

        _NUAssertContinueHandler((uint64_t)"const CGRect NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchorVert(const simd_double2 &, const CGRect &, const double) const", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUQuad2.h", 705, @"findInscribedAxisAlignedFitRectWithAnchorVert : Cannot find a valid initial seed for solver", v120, v121, v122, v123, v164);
      }
    }
    else
    {
      if (fabs(v173 + -0.5) >= 0.01 || fabs(v172 + -1.0) >= 0.01 && fabs(v172) >= 0.01)
      {
        __asm { FMOV            V1.2D, #1.0 }
        float64x2_t origin = v183;
        float64x2_t v190 = _Q1;
        NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchor(v182, &v181, (uint64_t)&origin, (uint64_t)&v186);
LABEL_116:
        if ((x_low & 1) == 0) {
          deriveScaledRectFromConstrainedRect(v60, v61, v62, v63, v171, v46, v38, v39, v52, v53, v54, v55, v56, v57, v58, v59, v168, v167, v166,
        }
            v165);
        v186.origin.double x = v60;
        double v38 = v62;
        double v46 = v61;
        double v39 = v63;
        goto LABEL_119;
      }
      NU::RectT<double>::RectT(v193.f64, &v186);
      int v79 = 100;
      float64x2_t v80 = v193;
      while (1)
      {
        float64x2_t v176 = v194;
        float64x2_t v81 = vaddq_f64(v80, v194);
        v82.f64[0] = v81.f64[0];
        v82.f64[1] = v80.f64[1];
        float64x2_t origin = v80;
        float64x2_t v190 = v82;
        v80.f64[1] = v81.f64[1];
        float64x2_t v191 = v80;
        float64x2_t v192 = v81;
        if ((NU::Quad2d::simpleContains(v182, &origin) & 1) != 0 || !v79) {
          break;
        }
        float64x2_t v193 = vsubq_f64(v193, v198);
        NU::RectT<double>::scale(v193.f64, 0.5, 1.0);
        float64x2_t v80 = vaddq_f64(v198, v193);
        float64x2_t v193 = v80;
        --v79;
      }
      v83.f64[0] = v193.f64[0];
      float64x2_t v84 = vaddq_f64(v193, v176);
      v85.f64[0] = v84.f64[0];
      float64x2_t origin = v193;
      v85.f64[1] = v193.f64[1];
      float64x2_t v190 = v85;
      v83.f64[1] = v84.f64[1];
      float64x2_t v191 = v83;
      float64x2_t v192 = v84;
      if (NU::Quad2d::simpleContains(v182, &origin))
      {
        NU::RectT<double>::RectT((double *)buf, &v186);
        int v86 = 100;
        for (float64x2_t j = *(float64x2_t *)buf; ; *(float64x2_t *)buf = j)
        {
          float64x2_t v88 = vaddq_f64(j, *(float64x2_t *)&buf[16]);
          v89.f64[0] = v88.f64[0];
          v89.f64[1] = j.f64[1];
          float64x2_t origin = j;
          float64x2_t v190 = v89;
          j.f64[1] = v88.f64[1];
          float64x2_t v191 = j;
          float64x2_t v192 = v88;
          int v90 = NU::Quad2d::contains(v182, &origin);
          _CF = v86-- != 0;
          BOOL v91 = _CF;
          if (!v90 || !v91) {
            break;
          }
          *(float64x2_t *)buf = vsubq_f64(*(float64x2_t *)buf, v198);
          NU::RectT<double>::scale((double *)buf, 2.0, 1.0);
          float64x2_t j = vaddq_f64(v198, *(float64x2_t *)buf);
        }
        float64x2_t v112 = vaddq_f64(*(float64x2_t *)buf, *(float64x2_t *)&buf[16]);
        v113.f64[0] = *(float64_t *)buf;
        v113.f64[1] = v112.f64[1];
        float64x2_t v191 = v113;
        float64x2_t v192 = v112;
        v112.f64[1] = *(float64_t *)&buf[8];
        long long v178 = *(_OWORD *)buf;
        float64x2_t origin = *(float64x2_t *)buf;
        float64x2_t v190 = v112;
        if (!NU::Quad2d::simpleContains(v182, &origin))
        {
          *(void *)&origin.f64[0] = &unk_1F0010090;
          float64x2_t v190 = v198;
          *(float64x2_t *)v195 = v193;
          *(float64x2_t *)&v195[16] = v194;
          long long v187 = v178;
          long long v188 = *(_OWORD *)&buf[16];
          double v60 = NU::Quad2d::computeLimitRect(v182, (uint64_t)v195, (uint64_t)&v187, (uint64_t)&origin, 0.000000953674316);
          goto LABEL_116;
        }
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
        }
        v114 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          v115 = [NSString stringWithFormat:@"findInscribedAxisAlignedFitRectWithAnchorVert : Cannot find a valid initial seed for solver"];
          *(_DWORD *)v195 = 138543362;
          *(void *)&v195[4] = v115;
          _os_log_impl(&dword_1A9892000, v114, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v195, 0xCu);
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
          }
          v116 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          {
            v117 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v118 = [MEMORY[0x1E4F29060] callStackSymbols];
            v119 = [v118 componentsJoinedByString:@"\n"];
            *(_DWORD *)v195 = 138543618;
            *(void *)&v195[4] = v117;
            *(_WORD *)&v195[12] = 2114;
            *(void *)&v195[14] = v119;
            _os_log_error_impl(&dword_1A9892000, v116, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v195, 0x16u);
          }
        }
        else
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
          }
          v116 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          {
            v162 = [MEMORY[0x1E4F29060] callStackSymbols];
            v163 = [v162 componentsJoinedByString:@"\n"];
            *(_DWORD *)v195 = 138543362;
            *(void *)&v195[4] = v163;
            _os_log_error_impl(&dword_1A9892000, v116, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v195, 0xCu);
          }
        }

        _NUAssertContinueHandler((uint64_t)"const CGRect NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchorHorz(const simd_double2 &, const CGRect &, const double) const", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUQuad2.h", 758, @"findInscribedAxisAlignedFitRectWithAnchorVert : Cannot find a valid initial seed for solver", v132, v133, v134, v135, v164);
      }
      else
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
        }
        v106 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          v107 = [NSString stringWithFormat:@"findInscribedAxisAlignedFitRectWithAnchorHorz : Cannot find a valid initial seed for solver"];
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v107;
          _os_log_impl(&dword_1A9892000, v106, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
          }
          v108 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            v109 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v110 = [MEMORY[0x1E4F29060] callStackSymbols];
            v111 = [v110 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v109;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v111;
            _os_log_error_impl(&dword_1A9892000, v108, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
          }
          v108 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            v158 = [MEMORY[0x1E4F29060] callStackSymbols];
            v159 = [v158 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v159;
            _os_log_error_impl(&dword_1A9892000, v108, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
          }
        }

        _NUAssertContinueHandler((uint64_t)"const CGRect NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchorHorz(const simd_double2 &, const CGRect &, const double) const", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUQuad2.h", 745, @"findInscribedAxisAlignedFitRectWithAnchorHorz : Cannot find a valid initial seed for solver", v124, v125, v126, v127, v164);
      }
    }
    double v63 = v39;
    double v62 = v38;
    double v61 = v46;
    double v60 = v171;
    goto LABEL_116;
  }
LABEL_119:
  if (self->_rollRadians == 0.0 && self->_pitchRadians == 0.0 && self->_yawRadians == 0.0)
  {
    [(NUCropModel *)self _widestCropRect];
    if (v136 >= v186.origin.x) {
      double v137 = v136;
    }
    else {
      double v137 = v186.origin.x;
    }
    v186.origin.double x = v137;
    [(NUCropModel *)self _widestCropRect];
    if (v138 >= v46) {
      double v46 = v138;
    }
    [(NUCropModel *)self _widestCropRect];
    if (v139 - v137 < v38) {
      double v38 = v139 - v137;
    }
    [(NUCropModel *)self _widestCropRect];
    if (v140 - v46 < v39) {
      double v39 = v140 - v46;
    }
  }
  double v141 = v186.origin.x;
  if (v11) {
    *double v11 = -[NUCropModel _hitMaskFromRect:](self, "_hitMaskFromRect:", v186.origin.x, v46, v38, v39);
  }
  double v142 = v141 + v172 * (v38 + -2.0);
  double v143 = v46 + v173 * (v39 + -2.0);
  double v144 = fmin(v141, v142);
  double v145 = fmin(v46, v143);
  double v146 = fmax(v141 + v38, v142 + 2.0);
  double v147 = v146 - v144;
  double v148 = fmax(v46 + v39, v143 + 2.0) - v145;
  v149.f64[0] = v144;
  v149.f64[1] = v145;
  double v179 = v144;
  double v180 = v145;
  v150.f64[0] = v144 + v146 - v144;
  v151.f64[0] = v150.f64[0];
  v151.f64[1] = v145;
  float64x2_t origin = v149;
  float64x2_t v190 = v151;
  v149.f64[1] = v145 + v148;
  v150.f64[1] = v145 + v148;
  float64x2_t v191 = v149;
  float64x2_t v192 = v150;
  if ((NU::Quad2d::simpleContains(v182, &origin) & 1) == 0)
  {
    double v148 = v39;
    double v147 = v38;
    double v180 = v46;
    double v179 = v141;
  }
  double v152 = v179;
  double v153 = v180;
  double v154 = v147;
  double v155 = v148;
  result.size.double height = v155;
  result.size.double width = v154;
  result.origin.double y = v153;
  result.origin.double x = v152;
  return result;
}

- (CGRect)_expandedCropRectForZoom:(CGRect)a3 candidateRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  CGRect v39 = a3;
  uint64_t v13 = -[NUCropModel _hitMaskFromRect:](self, "_hitMaskFromRect:");
  [(NUCropModel *)self _getBoundingQuadFromPitch:self->_pitchRadians yaw:self->_yawRadians roll:self->_rollRadians];
  v38[0] = v14;
  v38[1] = v15;
  v38[2] = v16;
  v38[3] = v17;
  v37.CGFloat x = 0.0;
  v37.CGFloat y = 0.0;
  if (canExpandWithAbsoluteAnchor(v13, v38, &v39, (float64x2_t *)&v37))
  {
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    CGFloat rect = height;
    double v18 = CGRectGetHeight(v40);
    v41.origin.CGFloat x = v11;
    v41.origin.CGFloat y = v10;
    v41.size.CGFloat width = v9;
    v41.size.CGFloat height = v8;
    CGFloat v19 = CGRectGetHeight(v41);
    v42.size.CGFloat width = width;
    double v20 = v18 / v19;
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat height = rect;
    double v21 = CGRectGetWidth(v42);
    v43.origin.CGFloat x = v11;
    v43.origin.CGFloat y = v10;
    v43.size.CGFloat width = v9;
    v43.size.CGFloat height = v8;
    double v22 = v21 / CGRectGetWidth(v43);
    if (v20 < v22) {
      double v22 = v20;
    }
    double v23 = 0.0;
    double v24 = 0.0;
    if (v9 != 0.0) {
      double v24 = (v37.x - v11) / v9;
    }
    if (v8 != 0.0) {
      double v23 = (v37.y - v10) / v8;
    }
    double v25 = v11 + v24 * v9 - v24 * (v9 * v22);
    double v26 = v10 + v23 * v8 - v23 * (v8 * v22);
    -[NUCropModel getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:](self, "getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:", 1, 0, 0, v25, v26, v9 * v22, v8 * v22, v25, v26, v9 * v22, v8 * v22, *(void *)&self->_pitchRadians, *(void *)&self->_yawRadians, *(void *)&self->_rollRadians, *(void *)&v37.x, *(void *)&v37.y);
    if (v29 >= v9 && v30 >= v8)
    {
      double v10 = v28;
      double v11 = v27;
      double v8 = v30;
      double v9 = v29;
    }
  }
  double v32 = v11;
  double v33 = v10;
  double v34 = v9;
  double v35 = v8;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (unint64_t)setForZoomCropRect:(CGRect)a3 newCropRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  [(NUCropModel *)self _widestCropRect];
  if (v9 >= v13)
  {
    [(NUCropModel *)self _widestCropRect];
    if (v8 >= v14)
    {
      v27.origin.double x = x;
      v27.origin.double y = y;
      v27.size.double width = width;
      v27.size.double height = height;
      v30.origin.double x = v11;
      v30.origin.double y = v10;
      v30.size.double width = v9;
      v30.size.double height = v8;
      if (CGRectContainsRect(v27, v30)) {
        return self->_hitVertexID;
      }
    }
  }
  if (width < 2.0 || height < 2.0)
  {
    if (width >= height) {
      double v16 = height;
    }
    else {
      double v16 = width;
    }
    if (v16 < 0.01) {
      return self->_hitVertexID;
    }
    double v17 = (width + width) / v16;
    double v18 = (height + height) / v16;
    double x = x - (v17 - width) * 0.5;
    double v26 = y - (v18 - height) * 0.5;
    double width = v17;
    double height = v18;
  }
  else
  {
    double v26 = y;
  }
  v28.origin.double x = v11;
  v28.origin.double y = v10;
  v28.size.double width = v9;
  v28.size.double height = v8;
  CGFloat MidX = CGRectGetMidX(v28);
  v29.origin.double x = v11;
  v29.origin.double y = v10;
  v29.size.double width = v9;
  v29.size.double height = v8;
  -[NUCropModel getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:](self, "getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:", 1, 0, 0, v11, v10, v9, v8, x, v26, width, height, *(void *)&self->_pitchRadians, *(void *)&self->_yawRadians, *(void *)&self->_rollRadians, *(void *)&MidX, CGRectGetMidY(v29));
  double v24 = vabdd_f64(v20, x);
  if (v24 >= 0.01 || vabdd_f64(v21, v26) >= 0.01 || vabdd_f64(v22, width) >= 0.01 || vabdd_f64(v23, height) >= 0.01)
  {
    -[NUCropModel _expandedCropRectForZoom:candidateRect:](self, "_expandedCropRectForZoom:candidateRect:");
    double v24 = vabdd_f64(v20, x);
  }
  if (v24 >= 0.01 || vabdd_f64(v21, v26) >= 0.01 || vabdd_f64(v22, width) >= 0.01 || vabdd_f64(v23, height) >= 0.01) {
    -[NUCropModel _expandedCropRectForZoom:candidateRect:](self, "_expandedCropRectForZoom:candidateRect:", v20, v21, v22, v23, x, v26, width, height);
  }
  -[NUCropModel _setCropRect:anchor:](self, "_setCropRect:anchor:");
  return self->_hitVertexID;
}

- (unint64_t)setCropRect:(CGRect)a3 newCropRect:(CGRect)a4 constrainWithAnchorPoint:(CGPoint)a5 strict:(BOOL)a6
{
  -[NUCropModel getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:](self, "getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:", *(void *)&a5.x, [(NUCropModel *)self aspectRatioIsFreeForm], 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(void *)&self->_pitchRadians, *(void *)&self->_yawRadians, *(void *)&self->_rollRadians, v8, v9);
  -[NUCropModel _setCropRect:anchor:](self, "_setCropRect:anchor:");
  return self->_hitVertexID;
}

- (unint64_t)setCropRect:(CGRect)a3 newCropRect:(CGRect)a4 constrainWithAnchorPoint:(CGPoint)a5
{
  return -[NUCropModel setCropRect:newCropRect:constrainWithAnchorPoint:strict:](self, "setCropRect:newCropRect:constrainWithAnchorPoint:strict:", 1, *(void *)&a5.y, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (unint64_t)setCropRect:(CGRect)a3 constrainWithAnchorPoint:(CGPoint)a4
{
  return -[NUCropModel setCropRect:newCropRect:constrainWithAnchorPoint:](self, "setCropRect:newCropRect:constrainWithAnchorPoint:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *(void *)&a4.x, *(void *)&a4.y);
}

- (BOOL)imageContainsRect:(CGRect)a3 withTol:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double x = a3.origin.x;
  double y = a3.origin.y;
  v6.f64[0] = a3.origin.x;
  v6.f64[1] = a3.origin.y;
  float64x2_t v14 = v6;
  [(NUCropModel *)self _getBoundingQuadFromPitch:self->_pitchRadians yaw:self->_yawRadians roll:self->_rollRadians withExpansionTol:a4];
  v16[0] = v7;
  v16[1] = v8;
  v16[2] = v9;
  v16[3] = v10;
  v7.f64[0] = x + width;
  v8.f64[0] = x + width;
  v8.f64[1] = y;
  v9.f64[0] = v14.f64[0];
  v15[0] = v14;
  v15[1] = v8;
  v9.f64[1] = y + height;
  v7.f64[1] = y + height;
  v15[2] = v9;
  v15[3] = v7;
  return NU::Quad2d::simpleContains(v16, v15);
}

- (BOOL)canGrowCropRect:(CGRect)a3 constrainWithAnchorPoint:(CGPoint)a4 strict:(BOOL)a5 withTol:(double)a6
{
  -[NUCropModel _anchorAlignedRectFromCandidate:withAnchor:](self, "_anchorAlignedRectFromCandidate:withAnchor:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.x, a4.y);
  double v20 = v8.f64[0];
  double v21 = v9;
  double v11 = v10;
  double v13 = v12;
  v8.f64[1] = v9;
  float64x2_t v19 = v8;
  [(NUCropModel *)self _getBoundingQuadFromPitch:self->_pitchRadians yaw:self->_yawRadians roll:self->_rollRadians withExpansionTol:a6];
  v23[0] = v14;
  v23[1] = v15;
  v23[2] = v16;
  v23[3] = v17;
  v14.f64[0] = v20 + v11;
  v15.f64[0] = v20 + v11;
  v15.f64[1] = v21;
  v16.f64[0] = v19.f64[0];
  v16.f64[1] = v21 + v13;
  v14.f64[1] = v21 + v13;
  v22[0] = v19;
  v22[1] = v15;
  v22[2] = v16;
  v22[3] = v14;
  return NU::Quad2d::simpleContains(v23, v22);
}

- (void)setAspectRatio:(id)a3
{
  self->_aspectRatio = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
  self->_isAutoCrop = 0;
}

- (CGRect)_anchorAlignedRectFromCandidate:(CGRect)a3 withAnchor:(CGPoint)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v8 = 0;
  double v22 = a4.x;
  double v23 = a4.y;
  CGFloat v9 = a4.y;
  CGRect v25 = a3;
  if (a3.size.width >= a3.size.height) {
    double v10 = a3.size.height;
  }
  else {
    double v10 = a3.size.width;
  }
  double v11 = v10 * 0.1;
  while (1)
  {
    v12.f64[0] = pointFromVertexID(&v25, v8);
    v12.f64[1] = v13;
    float64x2_t v14 = vsubq_f64((float64x2_t)a4, v12);
    if (sqrt(vaddvq_f64(vmulq_f64(v14, v14))) < v11) {
      break;
    }
    if (++v8 == 8) {
      goto LABEL_9;
    }
  }
  CGFloat v16 = -(pointFromVertexID(&v25, v8) - v22);
  CGFloat v17 = -(v15 - v23);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGRect v27 = CGRectOffset(v26, v16, v17);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
LABEL_9:
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)_debugPrintHitMask:(unint64_t)a3
{
  char v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] stringWithString:@"Current crop rect intersect the image at : "];
  if (v3) {
    [v4 appendFormat:@" BL"];
  }
  if ((v3 & 2) != 0) {
    [v4 appendFormat:@" BR"];
  }
  if ((v3 & 4) != 0) {
    [v4 appendFormat:@" TL"];
  }
  if ((v3 & 8) != 0) {
    [v4 appendFormat:@" TR"];
  }
  if ((v3 & 0x10) != 0) {
    [v4 appendFormat:@" B"];
  }
  if ((v3 & 0x20) != 0) {
    [v4 appendFormat:@" R"];
  }
  if ((v3 & 0x40) != 0) {
    [v4 appendFormat:@" L"];
  }
  if (v3 < 0) {
    [v4 appendFormat:@" T"];
  }
}

- (void)_debugPrintHitMask
{
}

- (unint64_t)_hitMaskFromRect:(CGRect)a3 withTol:(double)a4
{
  CGRect v21 = CGRectInset(a3, -a4, -a4);
  v21.size.CGFloat width = v21.origin.x + v21.size.width;
  *(CGFloat *)&long long v5 = v21.origin.x;
  *((void *)&v5 + 1) = *(void *)&v21.origin.y;
  v21.origin.CGFloat x = v21.size.width;
  CGFloat y = v21.origin.y;
  float64x2_t v16 = (float64x2_t)v5;
  CGPoint origin = v21.origin;
  v21.origin.CGFloat x = v21.origin.y + v21.size.height;
  *(void *)&v21.origin.CGFloat y = v5;
  CGFloat x = v21.origin.x;
  CGFloat v8 = v21.origin.x;
  float64x2_t v18 = *(float64x2_t *)&v21.origin.y;
  CGSize size = v21.size;
  [(NUCropModel *)self _getBoundingQuad];
  v20[0] = v9;
  v20[1] = v10;
  v20[2] = v11;
  v20[3] = v12;
  unint64_t v13 = NU::Quad2d::contains(v20, v16) ^ 1;
  if (!NU::Quad2d::contains(v20, (float64x2_t)origin)) {
    v13 |= 2uLL;
  }
  if (!NU::Quad2d::contains(v20, v18)) {
    v13 |= 4uLL;
  }
  if (NU::Quad2d::contains(v20, (float64x2_t)size)) {
    unint64_t result = v13;
  }
  else {
    unint64_t result = v13 | 8;
  }
  if (self->_rollRadians == 0.0 && self->_pitchRadians == 0.0 && self->_yawRadians == 0.0)
  {
    if ((~(_BYTE)result & 3) != 0) {
      unint64_t v15 = result;
    }
    else {
      unint64_t v15 = result | 0x10;
    }
    if ((~(_BYTE)v15 & 5) == 0) {
      v15 |= 0x40uLL;
    }
    if ((~(_BYTE)v15 & 0xA) == 0) {
      v15 |= 0x20uLL;
    }
    if ((~(_BYTE)v15 & 0xC) != 0) {
      return v15;
    }
    else {
      return v15 | 0x80;
    }
  }
  return result;
}

- (unint64_t)_hitMaskFromRect:(CGRect)a3
{
  return -[NUCropModel _hitMaskFromRect:withTol:](self, "_hitMaskFromRect:withTol:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 2.0);
}

- (void)_setCropRectWithConstantSize:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(NUCropModel *)self _getBoundingQuadFromPitch:self->_pitchRadians yaw:self->_yawRadians roll:self->_rollRadians];
  v42[0] = v8;
  v42[1] = v9;
  v42[2] = v10;
  v42[3] = v11;
  double v12 = floor(width);
  double v13 = floor(height);
  v11.f64[0] = nearbyint(x);
  v11.f64[1] = nearbyint(y);
  v8.f64[0] = v11.f64[0] + v12;
  v10.f64[0] = v11.f64[0] + v12;
  v8.f64[1] = v11.f64[1];
  float64x2_t v38 = v11;
  float64x2_t v39 = v8;
  CGPoint v36 = (CGPoint)v11;
  v9.f64[0] = v11.f64[0];
  v9.f64[1] = v11.f64[1] + v13;
  v10.f64[1] = v11.f64[1] + v13;
  float64x2_t v40 = v9;
  float64x2_t v41 = v10;
  if (!NU::Quad2d::simpleContains(v42, &v38))
  {
    v15.f64[0] = floor(x);
    v15.f64[1] = floor(y);
    float64_t v33 = v15.f64[1];
    float64_t v37 = v15.f64[0];
    v16.f64[0] = v15.f64[0] + v12;
    v16.f64[1] = v15.f64[1];
    v17.f64[0] = v15.f64[0];
    v17.f64[1] = v15.f64[1] + v13;
    double v28 = v15.f64[0] + v12;
    CGPoint v29 = (CGPoint)v15;
    float64x2_t v38 = v15;
    float64x2_t v39 = v16;
    double v31 = v15.f64[1] + v13;
    v16.f64[1] = v15.f64[1] + v13;
    float64x2_t v40 = v17;
    float64x2_t v41 = v16;
    if (!NU::Quad2d::simpleContains(v42, &v38))
    {
      v18.f64[0] = ceil(x);
      v18.f64[1] = v33;
      float64_t v30 = v18.f64[0];
      v19.f64[0] = v18.f64[0] + v12;
      v19.f64[1] = v33;
      v20.f64[0] = v18.f64[0];
      v20.f64[1] = v31;
      CGPoint v34 = (CGPoint)v18;
      float64x2_t v38 = v18;
      float64x2_t v39 = v19;
      double v27 = v18.f64[0] + v12;
      v19.f64[1] = v31;
      float64x2_t v40 = v20;
      float64x2_t v41 = v19;
      if (NU::Quad2d::simpleContains(v42, &v38))
      {
        CGPoint v14 = v34;
        goto LABEL_7;
      }
      v21.f64[0] = v37;
      v21.f64[1] = ceil(y);
      v22.f64[0] = v28;
      v23.f64[0] = v28;
      v23.f64[1] = v21.f64[1];
      float64x2_t v38 = v21;
      float64x2_t v39 = v23;
      float64_t v35 = v21.f64[1];
      CGPoint v36 = (CGPoint)v21;
      v23.f64[0] = v21.f64[0];
      v23.f64[1] = v21.f64[1] + v13;
      double v32 = v21.f64[1] + v13;
      v22.f64[1] = v21.f64[1] + v13;
      float64x2_t v40 = v23;
      float64x2_t v41 = v22;
      if (NU::Quad2d::simpleContains(v42, &v38)) {
        goto LABEL_2;
      }
      v24.f64[0] = v30;
      v24.f64[1] = v35;
      v25.f64[0] = v27;
      v26.f64[0] = v27;
      v26.f64[1] = v35;
      float64x2_t v38 = v24;
      float64x2_t v39 = v26;
      CGPoint v29 = (CGPoint)v24;
      v26.f64[0] = v24.f64[0];
      v26.f64[1] = v32;
      v25.f64[1] = v32;
      float64x2_t v40 = v26;
      float64x2_t v41 = v25;
      if (!NU::Quad2d::simpleContains(v42, &v38))
      {
        -[NUCropModel setCropRect:](self, "setCropRect:", x, y, v12, v13);
        goto LABEL_8;
      }
    }
    CGPoint v14 = v29;
    goto LABEL_7;
  }
LABEL_2:
  CGPoint v14 = v36;
LABEL_7:
  self->_cropRect.CGPoint origin = v14;
  self->_cropRect.size.double width = v12;
  self->_cropRect.size.double height = v13;
LABEL_8:
  self->_isAutoCrop = 0;
}

- (void)_setCropRect:(CGRect)a3 anchor:(CGPoint)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  CGRect v59 = a3;
  if (a3.size.width < 1.0)
  {
    float64x2_t v24 = NUAssertLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      float64x2_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "cropRect.size.width >= 1");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v27 = NUAssertLogger();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        float64x2_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        float64x2_t v39 = [MEMORY[0x1E4F29060] callStackSymbols];
        float64x2_t v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v40;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      CGPoint v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      float64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCropModel _setCropRect:anchor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", 538, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"cropRect.size.width >= 1");
  }
  if (a3.size.height < 1.0)
  {
    double v31 = NUAssertLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      double v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "cropRect.size.height >= 1");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    float64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    CGPoint v34 = NUAssertLogger();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        float64x2_t v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        double v46 = [MEMORY[0x1E4F29060] callStackSymbols];
        float64x2_t v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v47;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      CGPoint v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      float64_t v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCropModel _setCropRect:anchor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", 539, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"cropRect.size.height >= 1");
  }
  CGFloat x = a4.x;
  CGFloat y = a4.y;
  double width = a3.size.width;
  double rect2 = a3.size.height;
  [(NUCropModel *)self _getBoundingQuad];
  *(float64x2_t *)buf = v5;
  *(float64x2_t *)&buf[16] = v6;
  long long v61 = v7;
  long long v62 = v8;
  v5.f64[0] = width;
  v5.f64[1] = rect2;
  CGPoint origin = v59.origin;
  float64x2_t v9 = vaddq_f64(v5, (float64x2_t)v59.origin);
  v6.f64[0] = v59.origin.x;
  v6.f64[1] = v9.f64[1];
  v58[2] = v6;
  v58[3] = v9;
  v9.f64[1] = v59.origin.y;
  v58[0] = (float64x2_t)v59.origin;
  v58[1] = v9;
  double v13 = v59.origin.y;
  if (NU::Quad2d::simpleContains((float64x2_t *)buf, v58))
  {
    double v14 = width;
    double v15 = rect2;
  }
  else
  {
    v64.origin.CGFloat x = NU::Quad2d::findInscribedUnscaledFitRect((NU::Quad2d *)buf, &v59, 1.0e-10, v10, v11, v12);
    CGFloat v16 = v64.origin.x;
    CGFloat v17 = v64.origin.y;
    CGFloat v18 = v64.size.width;
    CGFloat height = v64.size.height;
    v65.origin.CGFloat x = origin.x;
    v65.size.double width = width;
    v65.origin.CGFloat y = origin.y;
    v65.size.CGFloat height = rect2;
    if (CGRectEqualToRect(v64, v65))
    {
      double v57 = width / rect2;
      v20.f64[0] = x;
      v20.f64[1] = y;
      v58[0] = v20;
      NU::Quad2d::findInscribedAxisAlignedAspectFitRectWithAnchor((float64x2_t *)buf, v58[0].f64, (uint64_t)&v59, (uint64_t)&v59, (uint64_t *)&v57, 0.000000953674316);
      double v13 = v21;
      v59.origin.CGFloat x = v22;
      v59.origin.CGFloat y = v21;
      v59.size.double width = v14;
      v59.size.CGFloat height = v15;
    }
    else
    {
      v59.origin.CGFloat x = v16;
      v59.origin.CGFloat y = v17;
      double v15 = height;
      double v14 = v18;
      double v13 = v17;
      v59.size.double width = v18;
      v59.size.CGFloat height = height;
    }
  }
  self->_hitVertexID = -[NUCropModel _hitMaskFromRect:](self, "_hitMaskFromRect:", v59.origin.x, v13, v14, v15);
  CGSize size = v59.size;
  self->_cropRect.CGPoint origin = v59.origin;
  self->_cropRect.CGSize size = size;
  self->_isAutoCrop = 0;
}

- (void)_setCropRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double MidX = CGRectGetMidX(a3);
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.double width = width;
  v11.size.double height = height;
  double MidY = CGRectGetMidY(v11);

  -[NUCropModel _setCropRect:anchor:](self, "_setCropRect:anchor:", x, y, width, height, MidX, MidY);
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

- (CGRect)_integralCropRect:(CGRect)a3 straightenAngle:(double)a4 anchorPoint:(CGPoint)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double x = a3.origin.x;
  double v10 = 0.0;
  double v11 = 0.0;
  if (a3.size.width != 0.0) {
    double v11 = (a5.x - a3.origin.x) / a3.size.width;
  }
  if (a3.size.height != 0.0) {
    double v10 = (a5.y - a3.origin.y) / a3.size.height;
  }
  double y = a3.origin.y;
  v46.double x = v11;
  v46.double y = v10;
  double v38 = _bestIntegralRectPreservingAspectRatioAndAnchor(a3, v46);
  double v39 = v12;
  double v14 = v13;
  double v16 = v15;
  v17.f64[0] = v38;
  v17.f64[1] = v12;
  float64x2_t v40 = v17;
  [(NUCropModel *)self _getBoundingQuadFromPitch:self->_pitchRadians yaw:self->_yawRadians roll:a4];
  v45[0] = v18;
  v45[1] = v19;
  v45[2] = v20;
  v45[3] = v21;
  v18.f64[0] = v38 + v14;
  v19.f64[0] = v38 + v14;
  v19.f64[1] = v39;
  float64x2_t v41 = v40;
  float64x2_t v42 = v19;
  v20.f64[0] = v40.f64[0];
  v20.f64[1] = v39 + v16;
  v18.f64[1] = v39 + v16;
  float64x2_t v43 = v20;
  float64x2_t v44 = v18;
  if (NU::Quad2d::simpleContains(v45, &v41)) {
    goto LABEL_7;
  }
  v49.origin.double x = x + v11;
  v49.origin.double y = y + v10;
  v49.size.double width = width + -1.0;
  v49.size.double height = height + -1.0;
  v47.double x = v11;
  v47.double y = v10;
  double v22 = _bestIntegralRectPreservingAspectRatioAndAnchor(v49, v47);
  double v14 = v23;
  double v16 = v24;
  v25.f64[0] = v22 + v23;
  v26.f64[0] = v22;
  v26.f64[1] = v27;
  v28.f64[0] = v25.f64[0];
  v28.f64[1] = v27;
  float64x2_t v41 = v26;
  float64x2_t v42 = v28;
  v28.f64[0] = v27 + v16;
  float64x2_t v40 = v26;
  v29.f64[0] = v26.f64[0];
  v29.f64[1] = v28.f64[0];
  v25.f64[1] = v28.f64[0];
  float64x2_t v43 = v29;
  float64x2_t v44 = v25;
  if (NU::Quad2d::simpleContains(v45, &v41))
  {
LABEL_7:
    float64x2_t v30 = v40;
  }
  else
  {
    v50.origin.double x = x + -v11 * -2.0;
    v50.origin.double y = y + -v10 * -2.0;
    v50.size.double width = width + -2.0;
    v50.size.double height = height + -2.0;
    v48.double x = v11;
    v48.double y = v10;
    v30.f64[0] = _bestIntegralRectPreservingAspectRatioAndAnchor(v50, v48);
    double v14 = v31;
    double v16 = v32;
    v30.f64[1] = v33;
  }
  double v34 = v30.f64[1];
  double v35 = v14;
  double v36 = v16;
  result.origin.double x = v30.f64[0];
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  return result;
}

- (CGRect)integralCropRect:(CGRect)a3
{
  -[NUCropModel _integralCropRect:straightenAngle:anchorPoint:](self, "_integralCropRect:straightenAngle:anchorPoint:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, self->_rollRadians, a3.origin.x + a3.size.width * 0.5, a3.origin.y + a3.size.height * 0.5);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (double)_getBoundingQuadFromPitch:(double)a3 yaw:(double)a4 roll:(CGFloat)a5 withExpansionTol:(CGFloat)a6 imageRect:(CGFloat)a7
{
  CGFloat v15 = -a4;
  v38.origin.double x = a5;
  v38.origin.double y = a6;
  v38.size.double width = a7;
  v38.size.double height = a8;
  CGRect v39 = CGRectInset(v38, v15, v15);
  v39.size.double width = v39.origin.x + v39.size.width;
  *(CGFloat *)&long long v16 = v39.size.width;
  *((void *)&v16 + 1) = *(void *)&v39.origin.y;
  CGFloat v17 = v39.origin.y + v39.size.height;
  *(CGFloat *)&long long v18 = v39.origin.x;
  *((void *)&v18 + 1) = *(void *)&v39.origin.y;
  CGFloat v19 = v39.origin.y + v39.size.height;
  long long v29 = v18;
  long long v30 = 0u;
  long long v31 = v16;
  long long v32 = 0u;
  CGPoint origin = v39.origin;
  long long v34 = 0u;
  CGSize size = v39.size;
  long long v36 = 0u;
  for (uint64_t i = 24; i != 152; i += 32)
    *(void *)((char *)&v29 + i) = 0x3FF0000000000000;
  +[NUCropModel _imageTransformFromPitch:yaw:roll:imageRect:](NUCropModel, "_imageTransformFromPitch:yaw:roll:imageRect:", a1, a2, a3, a5, a6, a7, a8);
  uint64_t v21 = 0;
  memset(v28, 0, sizeof(v28));
  v27[2] = v31;
  v27[3] = v32;
  v27[0] = v29;
  v27[1] = v30;
  v27[6] = size;
  v27[7] = v36;
  v27[4] = origin;
  v27[5] = v34;
  do
  {
    float64x2_t v23 = (float64x2_t)v27[v21];
    float64x2_t v22 = (float64x2_t)v27[v21 + 1];
    double v24 = (float64x2_t *)&v28[v21];
    *double v24 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v23.f64[0]), (float64x2_t)0, v23, 1), (float64x2_t)0, v22.f64[0]), (float64x2_t)0, v22, 1);
    v24[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v23.f64[0]), (float64x2_t)0, v23, 1), (float64x2_t)0, v22.f64[0]), (float64x2_t)0, v22, 1);
    v21 += 2;
  }
  while (v21 != 8);
  for (uint64_t j = 0; j != 4; ++j)
    *(&v37 + j) = (__int128)vdivq_f64((float64x2_t)v28[2 * j], (float64x2_t)vdupq_laneq_s64((int64x2_t)v28[2 * j + 1], 1));
  return *(double *)&v37;
}

- (uint64_t)_getBoundingQuadFromPitch:(double)a3 yaw:(double)a4 roll:(double)a5 withExpansionTol:
{
  [a1 masterImageRect];

  return objc_msgSend(a1, "_getBoundingQuadFromPitch:yaw:roll:withExpansionTol:imageRect:", a2, a3, a4, a5, v10, v11, v12, v13);
}

- (uint64_t)_getBoundingQuadFromPitch:(double)a3 yaw:(double)a4 roll:(double)a5 imageRect:(double)a6
{
  return objc_msgSend(a1, "_getBoundingQuadFromPitch:yaw:roll:withExpansionTol:imageRect:", a3, a4, a5, 0.00001, a6, a7, a8, a9);
}

- (uint64_t)_getBoundingQuadFromPitch:(double)a3 yaw:(double)a4 roll:(double)a5
{
  return [a1 _getBoundingQuadFromPitch:a3 yaw:a4 roll:a5 withExpansionTol:0.00001];
}

- (uint64_t)_getBoundingQuad
{
  return [a1 _getBoundingQuadFromPitch:*((double *)a1 + 8) yaw:*((double *)a1 + 9) roll:*((double *)a1 + 10)];
}

- (BOOL)_hasDefaultValues
{
  if (fabs(self->_pitchRadians) > 0.000872664626) {
    return 0;
  }
  if (fabs(self->_yawRadians) > 0.000872664626) {
    return 0;
  }
  if (fabs(self->_rollRadians) > 0.000872664626) {
    return 0;
  }
  float64x2_t v14 = *(float64x2_t *)self->_imageCenter;
  [(NUCropModel *)self _defaultImageCenter];
  float64x2_t v4 = vsubq_f64(v14, v3);
  if (sqrt(vaddvq_f64(vmulq_f64(v4, v4))) >= 0.00001) {
    return 0;
  }
  CGFloat x = self->_cropRect.origin.x;
  CGFloat y = self->_cropRect.origin.y;
  CGFloat width = self->_cropRect.size.width;
  CGFloat height = self->_cropRect.size.height;
  [(NUCropModel *)self _defaultCropRect];
  v17.origin.CGFloat x = v9;
  v17.origin.CGFloat y = v10;
  v17.size.CGFloat width = v11;
  v17.size.CGFloat height = v12;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  if (!CGRectEqualToRect(v16, v17)) {
    return 0;
  }

  return [(NUCropModel *)self aspectRatioIsFreeForm];
}

- (void)_setToDefaultValues
{
  [(NUCropModel *)self _defaultImageCenter];
  *(_OWORD *)self->_imageCenter = v3;
  [(NUCropModel *)self _defaultCropRect];
  self->_cropRect.origin.CGFloat x = v4;
  self->_cropRect.origin.CGFloat y = v5;
  self->_cropRect.size.CGFloat width = v6;
  self->_cropRect.size.CGFloat height = v7;
  self->_aspectRatio.CGFloat width = [(id)objc_opt_class() freeFormAspectRatio];
  self->_aspectRatio.CGFloat height = v8;
  self->_isAutoCrop = 0;
  [(NUCropModel *)self setPitchRadians:0.0];
  [(NUCropModel *)self setYawRadians:0.0];

  [(NUCropModel *)self setRollRadians:0.0];
}

- (CGRect)_defaultCropRect
{
  double x = self->_masterImageRect.origin.x;
  double y = self->_masterImageRect.origin.y;
  double width = self->_masterImageRect.size.width;
  double height = self->_masterImageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_defaultImageCenter
{
  double MidX = CGRectGetMidX(a1[4]);
  CGRectGetMidY(a1[4]);
  return MidX;
}

- (CGRect)_widestCropRect
{
  double x = self->_masterImageRect.origin.x;
  double y = self->_masterImageRect.origin.y;
  double width = self->_masterImageRect.size.width;
  double height = self->_masterImageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)description
{
  long long v3 = NSString;
  uint64_t v4 = objc_opt_class();
  CGSize size = self->_masterImageRect.size;
  v9[0] = self->_masterImageRect.origin;
  v9[1] = size;
  CGFloat v6 = [MEMORY[0x1E4F29238] valueWithBytes:v9 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  CGFloat v7 = [v3 stringWithFormat:@"<%@:%p image: %@ crop: %g,%g %gx%g ratio: %lu:%lu angles: [%g %g %g]>", v4, self, v6, *(void *)&self->_cropRect.origin.x, *(void *)&self->_cropRect.origin.y, *(void *)&self->_cropRect.size.width, *(void *)&self->_cropRect.size.height, self->_aspectRatio.width, self->_aspectRatio.height, *(void *)&self->_pitchRadians, *(void *)&self->_yawRadians, *(void *)&self->_rollRadians];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = -[NUCropModel initWithMasterImageRect:](+[NUCropModel allocWithZone:](NUCropModel, "allocWithZone:", a3), "initWithMasterImageRect:", self->_masterImageRect.origin.x, self->_masterImageRect.origin.y, self->_masterImageRect.size.width, self->_masterImageRect.size.height);
  *((_OWORD *)result + 7) = self->_aspectRatio;
  CGSize size = self->_cropRect.size;
  *((_OWORD *)result + 2) = self->_cropRect.origin;
  *((CGSize *)result + 3) = size;
  *((unsigned char *)result + 96) = self->_isAutoCrop;
  *((void *)result + 8) = *(void *)&self->_pitchRadians;
  *((void *)result + 9) = *(void *)&self->_yawRadians;
  *((void *)result + 10) = *(void *)&self->_rollRadians;
  return result;
}

- (BOOL)isEqualToCropModel:(id)a3
{
  id v4 = a3;
  [(NUCropModel *)self masterImageRect];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 masterImageRect];
  v47.origin.double x = v13;
  v47.origin.double y = v14;
  v47.size.double width = v15;
  v47.size.double height = v16;
  v45.origin.double x = v6;
  v45.origin.double y = v8;
  v45.size.double width = v10;
  v45.size.double height = v12;
  if (!CGRectEqualToRect(v45, v47)) {
    goto LABEL_11;
  }
  [(NUCropModel *)self cropRect];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  [v4 cropRect];
  v48.origin.double x = v25;
  v48.origin.double y = v26;
  v48.size.double width = v27;
  v48.size.double height = v28;
  v46.origin.double x = v18;
  v46.origin.double y = v20;
  v46.size.double width = v22;
  v46.size.double height = v24;
  if (!CGRectEqualToRect(v46, v48)) {
    goto LABEL_11;
  }
  uint64_t v29 = [(NUCropModel *)self aspectRatio];
  uint64_t v31 = v30;
  uint64_t v32 = [v4 aspectRatio];
  if (v29 | v31 && v32 | v33)
  {
    if (v33 * v29 != v32 * v31) {
      goto LABEL_11;
    }
  }
  else if ((v29 | v31) != 0 || (v32 | v33) != 0)
  {
    goto LABEL_11;
  }
  [(NUCropModel *)self pitchDegreeUI];
  double v35 = v34;
  [v4 pitchDegreeUI];
  if (vabdd_f64(v35, v36) <= 0.05)
  {
    [(NUCropModel *)self yawDegreeUI];
    double v38 = v37;
    [v4 yawDegreeUI];
    if (vabdd_f64(v38, v39) <= 0.05)
    {
      [(NUCropModel *)self rollDegreeUI];
      double v41 = v40;
      [v4 rollDegreeUI];
      if (vabdd_f64(v41, v42) <= 0.05)
      {
        BOOL v43 = 1;
        goto LABEL_12;
      }
    }
  }
LABEL_11:
  BOOL v43 = 0;
LABEL_12:

  return v43;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NUCropModel *)self isEqualToCropModel:v4];

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)NUCropModel;
  return [(NUCropModel *)&v3 hash];
}

- (CGSize)masterImageSize
{
  double width = self->_masterImageRect.size.width;
  double height = self->_masterImageRect.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)hasCrop
{
  return ![(NUCropModel *)self _hasDefaultValues];
}

- (id)copyWithMasterImageSize:(CGSize)a3 fovRadians:(double)a4
{
  double width = a3.width;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (a4 >= 3.14159265)
  {
    double v19 = NUAssertLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      CGFloat v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fovRadians < M_PI");
      *(_DWORD *)buf = 138543362;
      CGRect v49 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    CGFloat v22 = NUAssertLogger();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        double v34 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        CGRect v49 = v33;
        __int16 v50 = 2114;
        uint64_t v51 = v35;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      CGFloat v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGFloat v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      CGRect v49 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCropModel copyWithMasterImageSize:fovRadians:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", 173, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"fovRadians < M_PI");
  }
  if (a4 <= -3.14159265)
  {
    CGFloat v26 = NUAssertLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      CGFloat v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fovRadians > -M_PI");
      *(_DWORD *)buf = 138543362;
      CGRect v49 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    CGFloat v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v29 = NUAssertLogger();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        double v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        double v41 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        CGRect v49 = v40;
        __int16 v50 = 2114;
        uint64_t v51 = v42;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      CGRect v49 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCropModel copyWithMasterImageSize:fovRadians:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", 174, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"fovRadians > -M_PI");
  }
  double height = a3.height;
  v47.receiver = self;
  v47.super_class = (Class)NUCropModel;
  CGFloat v8 = (double *)[(NUCropModel *)&v47 copy];
  double v9 = v8;
  if (v8)
  {
    v8[16] = 0.0;
    v8[17] = 0.0;
    v8[18] = width;
    v8[19] = height;
    v8[11] = a4;
    [v8 _setToDefaultValues];
    double v10 = self->_masterImageRect.size.width;
    double v11 = self->_masterImageRect.size.height;
    CGFloat v12 = self->_cropRect.origin.x / v10 + -0.5;
    CGFloat v13 = self->_cropRect.origin.y / v11 + -0.5;
    CGFloat v14 = v12 + self->_cropRect.size.width / v10;
    CGFloat v15 = v13 + self->_cropRect.size.height / v11;
    double v16 = sin(self->_fovRadians);
    long double v17 = v16 / sin(a4);
    v9[4] = width * (v12 * v17 + 0.5);
    v9[5] = height * (v13 * v17 + 0.5);
    v9[6] = width * ((v14 - v12) * v17);
    v9[7] = height * ((v15 - v13) * v17);
  }
  return v9;
}

- (NUCropModel)initWithMasterImageRect:(CGRect)a3 stitchedImageRect:(CGRect)a4
{
  CGFloat x = a3.origin.x;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a3.size.width < 1.0)
  {
    double v16 = NUAssertLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      long double v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "masterImageRect.size.width >= 1");
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v19 = NUAssertLogger();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v30 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v53 = v29;
        __int16 v54 = 2114;
        uint64_t v55 = (uint64_t)v31;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      double v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGFloat v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v32 = "masterImageRect.size.width >= 1";
    uint64_t v33 = 156;
LABEL_32:

    _NUAssertFailHandler((uint64_t)"-[NUCropModel initWithMasterImageRect:stitchedImageRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", v33, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)v32);
  }
  CGFloat height = a3.size.height;
  if (a3.size.height < 1.0)
  {
    BOOL v23 = NUAssertLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      CGFloat v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "masterImageRect.size.height >= 1");
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    CGFloat v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v19 = NUAssertLogger();
    BOOL v26 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v26)
      {
        double v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        double v35 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v53 = v34;
        __int16 v54 = 2114;
        uint64_t v55 = (uint64_t)v36;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      CGFloat v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGFloat v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = v28;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v32 = "masterImageRect.size.height >= 1";
    uint64_t v33 = 157;
    goto LABEL_32;
  }
  CGFloat v7 = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat v10 = a4.origin.x;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  if (!CGRectIsEmpty(a4))
  {
    v57.origin.CGFloat x = v10;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat width = width;
    v57.size.CGFloat height = v7;
    v58.origin.CGFloat x = x;
    v58.origin.CGFloat y = v12;
    v58.size.CGFloat width = v11;
    v58.size.CGFloat height = height;
    if (!CGRectContainsRect(v57, v58))
    {
      uint64_t v37 = NUAssertLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "CGRectContainsRect(stitchedImageRect, masterImageRect)");
        *(_DWORD *)buf = 138543362;
        uint64_t v53 = v38;
        _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      uint64_t v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      double v19 = NUAssertLogger();
      BOOL v40 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      if (v39)
      {
        if (v40)
        {
          uint64_t v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v44 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v45 = [v44 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          uint64_t v53 = v43;
          __int16 v54 = 2114;
          uint64_t v46 = (void *)v45;
          uint64_t v55 = v45;
          _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v40)
      {
        double v41 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v53 = v42;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      uint64_t v32 = "CGRectContainsRect(stitchedImageRect, masterImageRect)";
      uint64_t v33 = 160;
      goto LABEL_32;
    }
  }
  v51.receiver = self;
  v51.super_class = (Class)NUCropModel;
  CGFloat v13 = [(NUCropModel *)&v51 init];
  CGFloat v14 = v13;
  if (v13)
  {
    v13->_masterImageRect.origin.CGFloat x = x;
    v13->_masterImageRect.origin.CGFloat y = v12;
    v13->_masterImageRect.size.CGFloat width = v11;
    v13->_masterImageRect.size.CGFloat height = height;
    v13->_fovRadians = 1.04719755;
    [(NUCropModel *)v13 _setToDefaultValues];
  }
  return v14;
}

- (NUCropModel)initWithMasterImageSize:(CGSize)a3 stitchedImageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  v13.origin.CGFloat x = 0.0;
  v13.origin.CGFloat y = 0.0;
  v13.size.double width = v7;
  v13.size.double height = v6;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = 0.0;
  v14.origin.CGFloat y = 0.0;
  v14.size.double width = v7;
  v14.size.double height = v6;
  double MidY = CGRectGetMidY(v14);

  return -[NUCropModel initWithMasterImageRect:stitchedImageRect:](self, "initWithMasterImageRect:stitchedImageRect:", 0.0, 0.0, v7, v6, MidX - width * 0.5, MidY - height * 0.5, width, height);
}

- (NUCropModel)initWithMasterImageSize:(CGSize)a3 fovRadians:(double)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a4 >= 3.14159265)
  {
    double v6 = NUAssertLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fovRadians < M_PI");
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v9 = NUAssertLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        double v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v20 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v19;
        __int16 v33 = 2114;
        double v34 = v21;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      CGFloat v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGFloat v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    CGFloat v22 = "fovRadians < M_PI";
    uint64_t v23 = 137;
LABEL_22:

    _NUAssertFailHandler((uint64_t)"-[NUCropModel initWithMasterImageSize:fovRadians:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", v23, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)v22);
  }
  if (a4 <= -3.14159265)
  {
    CGRect v13 = NUAssertLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CGRect v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fovRadians > -M_PI");
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    CGFloat v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v9 = NUAssertLogger();
    BOOL v16 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v16)
      {
        CGFloat v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        CGFloat v25 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v24;
        __int16 v33 = 2114;
        double v34 = v26;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      long double v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGFloat v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v18;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    CGFloat v22 = "fovRadians > -M_PI";
    uint64_t v23 = 138;
    goto LABEL_22;
  }
  CGSize result = -[NUCropModel initWithMasterImageRect:](self, "initWithMasterImageRect:", 0.0, 0.0, a3.width, a3.height);
  if (result) {
    result->_fovRadians = a4;
  }
  return result;
}

- (NUCropModel)initWithMasterImageRect:(CGRect)a3
{
  CGFloat x = a3.origin.x;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a3.size.width < 1.0)
  {
    BOOL v10 = NUAssertLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CGFloat v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "masterImageRect.size.width >= 1");
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    CGRect v13 = NUAssertLogger();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        CGFloat v24 = [MEMORY[0x1E4F29060] callStackSymbols];
        CGFloat v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v23;
        __int16 v38 = 2114;
        uint64_t v39 = v25;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      CGFloat v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    BOOL v26 = "masterImageRect.size.width >= 1";
    uint64_t v27 = 123;
LABEL_22:

    _NUAssertFailHandler((uint64_t)"-[NUCropModel initWithMasterImageRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", v27, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)v26);
  }
  CGFloat height = a3.size.height;
  if (a3.size.height < 1.0)
  {
    long double v17 = NUAssertLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      CGFloat v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "masterImageRect.size.height >= 1");
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    CGRect v13 = NUAssertLogger();
    BOOL v20 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v20)
      {
        uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v28;
        __int16 v38 = 2114;
        uint64_t v39 = v30;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      double v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGFloat v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v22;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    BOOL v26 = "masterImageRect.size.height >= 1";
    uint64_t v27 = 124;
    goto LABEL_22;
  }
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  v35.receiver = self;
  v35.super_class = (Class)NUCropModel;
  double v7 = [(NUCropModel *)&v35 init];
  CGFloat v8 = v7;
  if (v7)
  {
    v7->_masterImageRect.origin.CGFloat x = x;
    v7->_masterImageRect.origin.CGFloat y = y;
    v7->_masterImageRect.size.CGFloat width = width;
    v7->_masterImageRect.size.CGFloat height = height;
    v7->_fovRadians = 1.04719755;
    [(NUCropModel *)v7 _setToDefaultValues];
  }
  return v8;
}

- (NUCropModel)initWithMasterImageSize:(CGSize)a3
{
  return -[NUCropModel initWithMasterImageRect:](self, "initWithMasterImageRect:", 0.0, 0.0, a3.width, a3.height);
}

- (NUCropModel)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
  }
  v2 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_super v3 = NSString;
    id v4 = (objc_class *)objc_opt_class();
    BOOL v5 = NSStringFromClass(v4);
    double v6 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v5];
    *(_DWORD *)buf = 138543362;
    BOOL v20 = v6;
    _os_log_error_impl(&dword_1A9892000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
    }
    double v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      CGFloat v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGFloat v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      BOOL v20 = v10;
      __int16 v21 = 2114;
      CGFloat v22 = v12;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
    }
    double v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      CGFloat v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v20 = v9;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  CGRect v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  _NUAssertFailHandler((uint64_t)"-[NUCropModel init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", 114, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v15, v16, v17, v18, v14);
}

+ (CGRect)adjustCropRect:(CGRect)a3 inputExtent:(CGRect)a4 geometryTransform:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGRect v65 = a3;
  CGFloat v59 = a3.size.width;
  CGFloat v60 = a3.size.height;
  id v9 = a5;
  objc_msgSend(v9, "transformPoint:", x, y);
  float64_t v61 = v10;
  float64_t v53 = v11;
  double v12 = x + width;
  objc_msgSend(v9, "transformPoint:", v12, y);
  float64_t v57 = v13;
  float64_t v51 = v14;
  double v15 = y + height;
  objc_msgSend(v9, "transformPoint:", x, v15);
  float64_t v55 = v16;
  float64_t v49 = v17;
  objc_msgSend(v9, "transformPoint:", v12, v15);
  v18.f64[0] = v61;
  v18.f64[1] = v53;
  v19.f64[0] = v57;
  v19.f64[1] = v51;
  v20.f64[0] = v55;
  v20.f64[1] = v49;
  v22.f64[1] = v21;
  float64x2_t v62 = v18;
  v64[0] = v18;
  v64[1] = v19;
  float64x2_t v56 = v20;
  float64x2_t v58 = v19;
  v64[2] = v20;
  v64[3] = v22;
  float64x2_t v47 = v22;
  v19.f64[0] = v59;
  v19.f64[1] = v60;
  float64x2_t v23 = vaddq_f64(v19, (float64x2_t)v65.origin);
  v19.f64[0] = v23.f64[0];
  v19.f64[1] = v65.origin.y;
  float64x2_t v50 = v19;
  float64x2_t v52 = v23;
  v19.f64[0] = v65.origin.x;
  v19.f64[1] = v23.f64[1];
  float64x2_t v48 = v19;
  CGPoint origin = v65.origin;
  BOOL v24 = NU::Quad2d::simpleContains(v64, (float64x2_t)v65.origin);
  BOOL v25 = NU::Quad2d::simpleContains(v64, v50);
  BOOL v26 = NU::Quad2d::simpleContains(v64, v48);
  BOOL v27 = NU::Quad2d::simpleContains(v64, v52);
  if (v24 && (v25 ? (_ZF = !v26) : (_ZF = 1), !_ZF && v27))
  {
    CGFloat v29 = origin.y;
  }
  else
  {
    __asm { FMOV            V1.2D, #0.25 }
    float64x2_t v34 = vaddq_f64(vmulq_f64(vaddq_f64(vaddq_f64(vaddq_f64(v62, v58), v56), v47), _Q1), vmulq_f64(vaddq_f64(vaddq_f64(vaddq_f64((float64x2_t)origin, v50), v48), v52), _Q1));
    __asm { FMOV            V1.2D, #0.5 }
    float64x2_t v63 = vmulq_f64(v34, _Q1);
    if (NU::Quad2d::simpleContains(v64, v63)) {
      NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchor(v64, &v63, (uint64_t)&v65, (uint64_t)&v65);
    }
    else {
      double InscribedUnscaledFitRect = NU::Quad2d::findInscribedUnscaledFitRect((NU::Quad2d *)v64, &v65, 0.000000953674316, v36, v37, v38);
    }
    CGFloat v59 = v41;
    CGFloat v60 = v42;
    CGFloat v29 = v40;
    origin.double x = InscribedUnscaledFitRect;
  }

  double v43 = origin.x;
  double v44 = v29;
  double v45 = v59;
  double v46 = v60;
  result.size.double height = v46;
  result.size.double width = v45;
  result.origin.double y = v44;
  result.origin.double x = v43;
  return result;
}

+ (double)defaultFocalLength
{
  return 28.0;
}

+ ($0AC6E346AE4835514AAA8AC86D8F4844)freeFormAspectRatio
{
  int64_t v2 = 0;
  int64_t v3 = 0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

+ (void)_imageTransformFromPitch:(double)a3@<D1> yaw:(double)a4@<D2> roll:(CGFloat)a5@<D3> imageRect:(CGFloat)a6@<D4>
{
  double v13 = fabs(a3);
  double v14 = fabs(a4);
  if (fabs(a2) > 0.0000000037252903 || v13 > 0.0000000037252903 || v14 > 0.0000000037252903)
  {
    +[NUCropModel defaultFocalLength];
    double v21 = v20 / hypotf(36.0, 24.0);
    double v161 = hypot(a8, a7) * v21;
    v189.origin.double x = a5;
    v189.origin.double y = a6;
    v189.size.double width = a7;
    v189.size.double height = a8;
    CGFloat MidX = CGRectGetMidX(v189);
    v190.origin.double x = a5;
    v190.origin.double y = a6;
    v190.size.double width = a7;
    v190.size.double height = a8;
    CGFloat MidY = CGRectGetMidY(v190);
    uint64_t v22 = MEMORY[0x1E4F14990];
    float64x2_t v154 = *(float64x2_t *)MEMORY[0x1E4F14990];
    float64x2_t v155 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 16);
    float64x2_t v151 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 32);
    float64x2_t v152 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 48);
    float64x2_t v159 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 64);
    float64x2_t v157 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 112);
    float64x2_t v149 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 96);
    float64x2_t v150 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 80);
    __double2 v24 = __sincos_stret(a2 * 0.5);
    v23.f64[0] = v24.__sinval;
    float64x2_t v156 = vmulq_n_f64((float64x2_t)xmmword_1A9A72CC0, v24.__sinval);
    *(void *)&v23.f64[0] = *(_OWORD *)&vmulq_f64(v23, (float64x2_t)0);
    v23.f64[1] = v24.__cosval;
    float64x2_t v153 = v23;
    __double2 v26 = __sincos_stret(a3 * 0.5);
    v25.f64[0] = v26.__sinval;
    *(void *)&v25.f64[0] = *(_OWORD *)&vmulq_f64(v25, (float64x2_t)0);
    v25.f64[1] = v26.__cosval;
    float64x2_t v147 = v25;
    float64x2_t v148 = vmulq_n_f64((float64x2_t)xmmword_1A9A72CB0, v26.__sinval);
    __double2 v27 = __sincos_stret(a4 * 0.5);
    v28.f64[0] = v150.f64[0];
    uint64_t v29 = 0;
    float64x2_t v30 = vmulq_n_f64((float64x2_t)0, v27.__sinval);
    float64x2_t v31 = vnegq_f64(v148);
    float64x2_t v32 = (float64x2_t)vextq_s8((int8x16_t)v147, (int8x16_t)vnegq_f64(v147), 8uLL);
    _Q0 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v147, v27.__cosval), v32, v27.__sinval), vmlaq_n_f64(vmulq_laneq_f64(v31, v30, 1), (float64x2_t)vextq_s8((int8x16_t)v148, (int8x16_t)v31, 8uLL), v30.f64[0]));
    float64x2_t v34 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v148, v27.__cosval), (float64x2_t)vextq_s8((int8x16_t)v31, (int8x16_t)v148, 8uLL), v27.__sinval), vmlaq_n_f64(vmulq_laneq_f64(v147, v30, 1), v32, v30.f64[0]));
    _Q3 = vnegq_f64(v156);
    float64x2_t v36 = (float64x2_t)vextq_s8((int8x16_t)v153, (int8x16_t)vnegq_f64(v153), 8uLL);
    _Q6 = vmlaq_n_f64(vmulq_laneq_f64(v153, v34, 1), v36, v34.f64[0]);
    _Q2 = vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(_Q3, v34, 1), (float64x2_t)vextq_s8((int8x16_t)v156, (int8x16_t)_Q3, 8uLL), v34.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v153, _Q0, 1), v36, _Q0.f64[0]));
    _Q1 = (int64x2_t)vaddq_f64(_Q6, vmlaq_n_f64(vmulq_laneq_f64(v156, _Q0, 1), (float64x2_t)vextq_s8((int8x16_t)_Q3, (int8x16_t)v156, 8uLL), _Q0.f64[0]));
    *(void *)&_Q3.f64[0] = _Q1.i64[1];
    __asm { FMLS            D0, D2, V2.D[0] }
    _D7 = _Q2.f64[1];
    __asm { FMLA            D0, D7, V2.D[1] }
    v31.f64[0] = vmlad_n_f64(vmuld_lane_f64(_Q2.f64[0], _Q2, 1), *(double *)&_Q1.i64[1], *(double *)_Q1.i64);
    v45.f64[0] = vmuld_lane_f64(*(double *)&_Q1.i64[1], _Q2, 1);
    double v46 = vmlad_n_f64(-(*(double *)&_Q1.i64[1] * _Q2.f64[1]), _Q2.f64[0], *(double *)_Q1.i64);
    _Q0.f64[1] = v31.f64[0] + v31.f64[0];
    v31.f64[0] = v46 + v46;
    double v47 = vmlad_n_f64(-(_Q2.f64[0] * _Q2.f64[1]), *(double *)&_Q1.i64[1], *(double *)_Q1.i64);
    v48.f64[0] = v47 + v47;
    __asm
    {
      FMLA            D6, D3, V1.D[1]
      FMLA            D6, D7, V2.D[1]
      FMLS            D6, D1, V1.D[0]
      FMLA            D17, D2, V1.D[1]
    }
    v48.f64[1] = _Q6.f64[0];
    __asm { FMLS            D7, D1, V1.D[0] }
    *(void *)&v51.f64[1] = _Q1.i64[1];
    v51.f64[0] = _Q2.f64[0];
    v45.f64[1] = -(*(double *)_Q1.i64 * _Q2.f64[1]);
    __asm { FMLS            D7, D3, V1.D[1] }
    float64x2_t v53 = vmlaq_f64(v45, (float64x2_t)vzip1q_s64(_Q1, (int64x2_t)_Q2), v51);
    float64x2_t v187 = 0u;
    float64x2_t v188 = 0u;
    float64x2_t v185 = 0u;
    float64x2_t v186 = 0u;
    float64x2_t v183 = 0u;
    float64x2_t v184 = 0u;
    float64x2_t v181 = 0u;
    float64x2_t v182 = 0u;
    v175[1] = *(unint64_t *)&v31.f64[0];
    v175[0] = _Q0;
    float64x2_t v176 = (float64x2_t)COERCE_UNSIGNED_INT64(_D17 + _D17);
    v175[2] = v48;
    float64x2_t v177 = vaddq_f64(v53, v53);
    long long v178 = _D7;
    float64x2_t v54 = vdivq_f64(vnegq_f64(vaddq_f64(vaddq_f64(v177, vmlaq_f64(vmulq_f64(_Q0, (float64x2_t)0), (float64x2_t)0, v48)), (float64x2_t)0)), (float64x2_t)vdupq_lane_s64(*(_OWORD *)&vaddq_f64(vaddq_f64((float64x2_t)_D7, vmlaq_f64(vmulq_f64((float64x2_t)*(unint64_t *)&v31.f64[0], (float64x2_t)0), (float64x2_t)0, v176)), (float64x2_t)0), 0));
    long long v180 = xmmword_1A9A72CB0;
    long long v179 = 0u;
    do
    {
      float64x2_t v56 = (float64x2_t)v175[v29];
      float64x2_t v55 = (float64x2_t)v175[v29 + 1];
      float64_t v57 = (float64x2_t *)((char *)&v181 + v29 * 16);
      *float64_t v57 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v154, v56.f64[0]), v151, v56, 1), v54, v55.f64[0]), v149, v55, 1);
      v57[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v155, v56.f64[0]), v152, v56, 1), v150, v55.f64[0]), v157, v55, 1);
      v29 += 2;
    }
    while (v29 != 8);
    uint64_t v58 = 0;
    v59.f64[0] = MidX;
    v59.f64[1] = MidY;
    float64x2_t v60 = *(float64x2_t *)(v22 + 64);
    float64x2_t v61 = *(float64x2_t *)(v22 + 80);
    long long v63 = *(_OWORD *)(v22 + 96);
    float64x2_t v62 = *(float64x2_t *)(v22 + 112);
    v64.f64[1] = *(float64_t *)(v22 + 120);
    v64.f64[0] = 0.0;
    v65.f64[0] = MidX;
    float64x2_t v66 = vnegq_f64(v59);
    float64x2_t v67 = v61;
    v166[4] = v60;
    v166[5] = v61;
    long long v68 = *(_OWORD *)(v22 + 112);
    v166[6] = v63;
    v166[7] = v68;
    long long v69 = *(_OWORD *)(v22 + 16);
    v166[0] = *(_OWORD *)v22;
    v166[1] = v69;
    long long v70 = *(_OWORD *)(v22 + 48);
    v166[2] = *(_OWORD *)(v22 + 32);
    v166[3] = v70;
    do
    {
      float64x2_t v72 = (float64x2_t)v166[v58];
      float64x2_t v71 = (float64x2_t)v166[v58 + 1];
      int v73 = (float64x2_t *)((char *)&v167 + v58 * 16);
      *int v73 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v154, v72.f64[0]), v151, v72, 1), v60, v71.f64[0]), v66, v71, 1);
      v73[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v155, v72.f64[0]), v152, v72, 1), v67, v71.f64[0]), v64, v71, 1);
      v58 += 2;
    }
    while (v58 != 8);
    uint64_t v74 = 0;
    v62.f64[0] = v161;
    long long v75 = v172;
    a1[4] = v171;
    a1[5] = v75;
    long long v76 = v174;
    a1[6] = v173;
    a1[7] = v76;
    long long v77 = v168;
    *a1 = v167;
    a1[1] = v77;
    long long v78 = v170;
    a1[2] = v169;
    a1[3] = v78;
    long long v79 = *a1;
    long long v80 = a1[1];
    long long v81 = a1[3];
    v165[2] = a1[2];
    v165[3] = v81;
    v165[0] = v79;
    v165[1] = v80;
    long long v82 = a1[4];
    long long v83 = a1[5];
    long long v84 = a1[7];
    v165[6] = a1[6];
    v165[7] = v84;
    v165[4] = v82;
    v165[5] = v83;
    do
    {
      float64x2_t v86 = (float64x2_t)v165[v74];
      float64x2_t v85 = (float64x2_t)v165[v74 + 1];
      float64x2_t v87 = (float64x2_t *)((char *)&v167 + v74 * 16);
      *float64x2_t v87 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v154, v86.f64[0]), v151, v86, 1), v60, v85.f64[0]), (float64x2_t)0, v85, 1);
      v87[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v155, v86.f64[0]), v152, v86, 1), v67, v85.f64[0]), v62, v85, 1);
      v74 += 2;
    }
    while (v74 != 8);
    uint64_t v88 = 0;
    long long v89 = v172;
    a1[4] = v171;
    a1[5] = v89;
    long long v90 = v174;
    a1[6] = v173;
    a1[7] = v90;
    long long v91 = v168;
    *a1 = v167;
    a1[1] = v91;
    long long v92 = v170;
    a1[2] = v169;
    a1[3] = v92;
    float64x2_t v94 = v181;
    float64x2_t v93 = v182;
    float64x2_t v96 = v183;
    float64x2_t v95 = v184;
    float64x2_t v98 = v185;
    float64x2_t v97 = v186;
    float64x2_t v100 = v187;
    float64x2_t v99 = v188;
    long long v101 = *a1;
    long long v102 = a1[1];
    long long v103 = a1[3];
    v164[2] = a1[2];
    v164[3] = v103;
    v164[0] = v101;
    v164[1] = v102;
    long long v104 = a1[4];
    long long v105 = a1[5];
    long long v106 = a1[7];
    v164[6] = a1[6];
    v164[7] = v106;
    v164[4] = v104;
    v164[5] = v105;
    do
    {
      float64x2_t v108 = (float64x2_t)v164[v88];
      float64x2_t v107 = (float64x2_t)v164[v88 + 1];
      v109 = (float64x2_t *)((char *)&v167 + v88 * 16);
      float64x2_t *v109 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v94, v108.f64[0]), v96, v108, 1), v98, v107.f64[0]), v100, v107, 1);
      v109[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v93, v108.f64[0]), v95, v108, 1), v97, v107.f64[0]), v99, v107, 1);
      v88 += 2;
    }
    while (v88 != 8);
    uint64_t v110 = 0;
    long long v111 = v172;
    a1[4] = v171;
    a1[5] = v111;
    long long v112 = v174;
    a1[6] = v173;
    a1[7] = v112;
    long long v113 = v168;
    *a1 = v167;
    a1[1] = v113;
    long long v114 = v170;
    a1[2] = v169;
    a1[3] = v114;
    long long v115 = *a1;
    long long v116 = a1[1];
    long long v117 = a1[3];
    v163[2] = a1[2];
    v163[3] = v117;
    v163[0] = v115;
    v163[1] = v116;
    long long v118 = a1[4];
    long long v119 = a1[5];
    long long v120 = a1[7];
    v163[6] = a1[6];
    v163[7] = v120;
    v163[4] = v118;
    v163[5] = v119;
    do
    {
      float64x2_t v122 = (float64x2_t)v163[v110];
      float64x2_t v121 = (float64x2_t)v163[v110 + 1];
      uint64_t v123 = (float64x2_t *)((char *)&v167 + v110 * 16);
      *uint64_t v123 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v154, v122.f64[0]), v151, v122, 1), v159, v121.f64[0]), v149, v121, 1);
      v28.f64[1] = 1.0 / v161;
      v123[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v155, v122.f64[0]), v152, v122, 1), v28, v121.f64[0]), (float64x2_t)xmmword_1A9A72DE0, v121, 1);
      v110 += 2;
    }
    while (v110 != 8);
    uint64_t v124 = 0;
    v65.f64[1] = MidY;
    long long v125 = v172;
    a1[4] = v171;
    a1[5] = v125;
    long long v126 = v174;
    a1[6] = v173;
    a1[7] = v126;
    long long v127 = v168;
    *a1 = v167;
    a1[1] = v127;
    long long v128 = v170;
    a1[2] = v169;
    a1[3] = v128;
    long long v129 = *a1;
    long long v130 = a1[1];
    long long v131 = a1[3];
    v162[2] = a1[2];
    v162[3] = v131;
    v162[0] = v129;
    v162[1] = v130;
    long long v132 = a1[4];
    long long v133 = a1[5];
    long long v134 = a1[7];
    v162[6] = a1[6];
    v162[7] = v134;
    v162[4] = v132;
    v162[5] = v133;
    do
    {
      float64x2_t v136 = (float64x2_t)v162[v124];
      float64x2_t v135 = (float64x2_t)v162[v124 + 1];
      double v137 = (float64x2_t *)((char *)&v167 + v124 * 16);
      *double v137 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v154, v136.f64[0]), v151, v136, 1), v60, v135.f64[0]), v65, v135, 1);
      v137[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v155, v136.f64[0]), v152, v136, 1), v67, v135.f64[0]), v64, v135, 1);
      v124 += 2;
    }
    while (v124 != 8);
    long long v138 = v172;
    a1[4] = v171;
    a1[5] = v138;
    long long v139 = v174;
    a1[6] = v173;
    a1[7] = v139;
    long long v140 = v168;
    *a1 = v167;
    a1[1] = v140;
    long long v145 = v169;
    long long v146 = v170;
  }
  else
  {
    double v141 = (long long *)MEMORY[0x1E4F14990];
    long long v142 = *(_OWORD *)(MEMORY[0x1E4F14990] + 80);
    a1[4] = *(_OWORD *)(MEMORY[0x1E4F14990] + 64);
    a1[5] = v142;
    long long v143 = v141[7];
    a1[6] = v141[6];
    a1[7] = v143;
    long long v144 = v141[1];
    *a1 = *v141;
    a1[1] = v144;
    long long v145 = v141[2];
    long long v146 = v141[3];
  }
  a1[2] = v145;
  a1[3] = v146;
}

@end
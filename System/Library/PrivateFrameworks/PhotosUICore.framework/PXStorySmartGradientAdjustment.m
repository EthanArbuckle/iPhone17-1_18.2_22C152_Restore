@interface PXStorySmartGradientAdjustment
- (BOOL)allowsUnadjustedOpportunisticDelivery;
- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3;
- (BOOL)simpleBlurRepeatEdges;
- (BOOL)useSimpleBlur;
- (BOOL)useSmartColor;
- (BOOL)wantsSingleHighQualityDelivery;
- (CGRect)normalizedSourceRect;
- (CGSize)requestSizeForProposedTargetSize:(CGSize)a3;
- (CGSize)targetSize;
- (double)simpleBlurEdgeStretch;
- (double)simpleBlurExposure;
- (double)simpleBlurRadius;
- (id)applyToImage:(id)a3 targetSize:(CGSize)a4;
- (int64_t)contentModeForProposedContentMode:(int64_t)a3;
- (unint64_t)hash;
- (void)setNormalizedSourceRect:(CGRect)a3;
- (void)setSimpleBlurEdgeStretch:(double)a3;
- (void)setSimpleBlurExposure:(double)a3;
- (void)setSimpleBlurRadius:(double)a3;
- (void)setSimpleBlurRepeatEdges:(BOOL)a3;
- (void)setTargetSize:(CGSize)a3;
- (void)setUseSimpleBlur:(BOOL)a3;
- (void)setUseSmartColor:(BOOL)a3;
@end

@implementation PXStorySmartGradientAdjustment

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNormalizedSourceRect:(CGRect)a3
{
  self->_normalizedSourceRect = a3;
}

- (CGRect)normalizedSourceRect
{
  double x = self->_normalizedSourceRect.origin.x;
  double y = self->_normalizedSourceRect.origin.y;
  double width = self->_normalizedSourceRect.size.width;
  double height = self->_normalizedSourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSimpleBlurEdgeStretch:(double)a3
{
  self->_simpleBlurEdgeStretch = a3;
}

- (double)simpleBlurEdgeStretch
{
  return self->_simpleBlurEdgeStretch;
}

- (void)setSimpleBlurRepeatEdges:(BOOL)a3
{
  self->_simpleBlurRepeatEdges = a3;
}

- (BOOL)simpleBlurRepeatEdges
{
  return self->_simpleBlurRepeatEdges;
}

- (void)setSimpleBlurExposure:(double)a3
{
  self->_simpleBlurExposure = a3;
}

- (double)simpleBlurExposure
{
  return self->_simpleBlurExposure;
}

- (void)setSimpleBlurRadius:(double)a3
{
  self->_simpleBlurRadius = a3;
}

- (double)simpleBlurRadius
{
  return self->_simpleBlurRadius;
}

- (void)setUseSimpleBlur:(BOOL)a3
{
  self->_useSimpleBlur = a3;
}

- (BOOL)useSimpleBlur
{
  return self->_useSimpleBlur;
}

- (void)setUseSmartColor:(BOOL)a3
{
  self->_useSmartColor = a3;
}

- (BOOL)useSmartColor
{
  return self->_useSmartColor;
}

- (int64_t)contentModeForProposedContentMode:(int64_t)a3
{
  return 0;
}

- (CGSize)requestSizeForProposedTargetSize:(CGSize)a3
{
  double v3 = 30.0;
  double v4 = 30.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (BOOL)wantsSingleHighQualityDelivery
{
  return 0;
}

- (BOOL)allowsUnadjustedOpportunisticDelivery
{
  return 0;
}

- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [v5 useSmartColor];
    if (v6 != [(PXStorySmartGradientAdjustment *)self useSmartColor]) {
      goto LABEL_13;
    }
    int v7 = [v5 useSimpleBlur];
    if (v7 != [(PXStorySmartGradientAdjustment *)self useSimpleBlur]) {
      goto LABEL_13;
    }
    [v5 simpleBlurRadius];
    double v9 = v8;
    [(PXStorySmartGradientAdjustment *)self simpleBlurRadius];
    if (v9 != v10) {
      goto LABEL_13;
    }
    [v5 simpleBlurExposure];
    double v12 = v11;
    [(PXStorySmartGradientAdjustment *)self simpleBlurExposure];
    if (v12 != v13) {
      goto LABEL_13;
    }
    int v14 = [v5 simpleBlurRepeatEdges];
    if (v14 != [(PXStorySmartGradientAdjustment *)self simpleBlurRepeatEdges]) {
      goto LABEL_13;
    }
    [v5 simpleBlurEdgeStretch];
    double v16 = v15;
    [(PXStorySmartGradientAdjustment *)self simpleBlurEdgeStretch];
    if (v16 != v17) {
      goto LABEL_13;
    }
    [v5 normalizedSourceRect];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    [(PXStorySmartGradientAdjustment *)self normalizedSourceRect];
    v39.origin.double x = v26;
    v39.origin.double y = v27;
    v39.size.double width = v28;
    v39.size.double height = v29;
    v38.origin.double x = v19;
    v38.origin.double y = v21;
    v38.size.double width = v23;
    v38.size.double height = v25;
    if (CGRectEqualToRect(v38, v39))
    {
      [v5 targetSize];
      double v31 = v30;
      double v33 = v32;
      [(PXStorySmartGradientAdjustment *)self targetSize];
      BOOL v36 = v33 == v35 && v31 == v34;
    }
    else
    {
LABEL_13:
      BOOL v36 = 0;
    }
  }
  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();
  return [v2 hash];
}

- (id)applyToImage:(id)a3 targetSize:(CGSize)a4
{
  v110[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v79 = [MEMORY[0x1E4F28B00] currentHandler];
    [v79 handleFailureInMethod:a2, self, @"PXStorySmartGradientAdjustment.m", 16, @"Invalid parameter not satisfying: %@", @"image != nil" object file lineNumber description];
  }
  [v6 extent];
  if (CGRectIsEmpty(v112))
  {
    v80 = [MEMORY[0x1E4F28B00] currentHandler];
    [v80 handleFailureInMethod:a2, self, @"PXStorySmartGradientAdjustment.m", 17, @"Invalid parameter not satisfying: %@", @"!CGRectIsEmpty(image.extent)" object file lineNumber description];
  }
  id v7 = v6;
  if ([(PXStorySmartGradientAdjustment *)self useSimpleBlur])
  {
    [v7 extent];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [(PXStorySmartGradientAdjustment *)self normalizedSourceRect];
    if (!CGRectIsEmpty(v113))
    {
      [(PXStorySmartGradientAdjustment *)self normalizedSourceRect];
      PXRectDenormalize();
    }
    double v89 = v9;
    double v90 = v11;
    v114.origin.double x = v9;
    v114.origin.double y = v11;
    double v91 = v13;
    double v92 = v15;
    v114.size.double width = v13;
    v114.size.double height = v15;
    CGRect v115 = CGRectInset(v114, 0.5, 0.5);
    double x = v115.origin.x;
    double width = v115.size.width;
    double height = v115.size.height;
    double y = v115.origin.y;
    double v17 = *MEMORY[0x1E4F1DAD8];
    double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(PXStorySmartGradientAdjustment *)self targetSize];
    double v19 = v18;
    double v21 = v20;
    v116.origin.double x = v17;
    v116.origin.double y = v16;
    v116.size.double width = v19;
    v116.size.double height = v21;
    CGRect v117 = CGRectInset(v116, 0.5, 0.5);
    double v22 = v117.origin.x;
    double v23 = v117.origin.y;
    sdouble y = v117.size.width;
    sdouble x = v117.size.height;
    [(PXStorySmartGradientAdjustment *)self simpleBlurExposure];
    double v25 = v24;
    [(PXStorySmartGradientAdjustment *)self simpleBlurRadius];
    double v27 = sqrt(v19 * v21) * (v26 * 0.01);
    uint64_t v109 = *MEMORY[0x1E4F1E470];
    CGFloat v28 = [NSNumber numberWithDouble:v25];
    v110[0] = v28;
    CGFloat v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:&v109 count:1];

    if ([(PXStorySmartGradientAdjustment *)self simpleBlurRepeatEdges])
    {
      CGFloat v88 = v23;
      double v84 = v27;
      CGFloat v30 = v16;
      [(PXStorySmartGradientAdjustment *)self simpleBlurEdgeStretch];
      double v32 = v31;
      long long v33 = *MEMORY[0x1E4F1DAB8];
      long long v34 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v106.a = v33;
      *(_OWORD *)&v106.c = v34;
      long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      *(_OWORD *)&v106.tdouble x = v35;
      *(_OWORD *)&v105.a = v33;
      *(_OWORD *)&v105.c = v34;
      *(_OWORD *)&v105.tdouble x = v35;
      *(_OWORD *)&v104.a = v33;
      *(_OWORD *)&v104.c = v34;
      *(_OWORD *)&v104.tdouble x = v35;
      *(_OWORD *)&v103.a = v33;
      *(_OWORD *)&v103.c = v34;
      *(_OWORD *)&v103.tdouble x = v35;
      memset(&slice, 0, sizeof(slice));
      memset(&remainder, 0, sizeof(remainder));
      double v36 = v31 * 0.5;
      double v82 = v21;
      double v83 = v30;
      double v81 = v19;
      if (width * sx >= height * sy)
      {
        v119.origin.double x = v17;
        v119.origin.double y = v30;
        v119.size.double width = v19;
        v119.size.double height = v21;
        CGRectDivide(v119, &slice, &remainder, v21 * 0.5, CGRectMinYEdge);
        double v54 = sx - sy / width * height;
        double v55 = fmax(sy / width, v54 * v36 / height);
        CGFloat v56 = sy / width * 0.5 * v32;
        CGFloat v57 = v23 + v54 * 0.5;
        CGAffineTransform v100 = v106;
        CGAffineTransformTranslate(&v106, &v100, v22, v57);
        CGAffineTransform v99 = v106;
        CGAffineTransformScale(&v100, &v99, sy / width, -v55);
        CGAffineTransform v106 = v100;
        CGAffineTransform v99 = v100;
        CGAffineTransformTranslate(&v100, &v99, -x, -y);
        CGAffineTransform v106 = v100;
        CGAffineTransform v100 = v105;
        CGAffineTransformTranslate(&v105, &v100, v22, v57);
        CGAffineTransform v99 = v105;
        CGAffineTransformScale(&v100, &v99, sy / width, v56);
        CGAffineTransform v105 = v100;
        CGAffineTransform v99 = v100;
        CGAffineTransformTranslate(&v100, &v99, -x, -y);
        CGAffineTransform v105 = v100;
        CGFloat v58 = v23 + (sx + sy / width * height) * 0.5;
        CGAffineTransform v100 = v104;
        CGAffineTransformTranslate(&v104, &v100, v22, v58);
        CGAffineTransform v99 = v104;
        CGAffineTransformScale(&v100, &v99, sy / width, -v55);
        CGAffineTransform v104 = v100;
        CGAffineTransform v99 = v100;
        CGAffineTransformTranslate(&v100, &v99, -x, -(y + height));
        CGAffineTransform v104 = v100;
        CGAffineTransform v100 = v103;
        CGAffineTransformTranslate(&v103, &v100, v22, v58);
        CGAffineTransform v99 = v103;
        double v41 = x;
        CGAffineTransformScale(&v100, &v99, sy / width, v56);
        CGAffineTransform v103 = v100;
        CGAffineTransform v99 = v100;
        double v43 = -x;
        double v44 = -(y + height);
      }
      else
      {
        long long v86 = v33;
        long long v87 = v35;
        v118.origin.double x = v17;
        v118.origin.double y = v30;
        v118.size.double width = v19;
        long long v85 = v34;
        v118.size.double height = v21;
        CGRectDivide(v118, &slice, &remainder, v19 * 0.5, CGRectMinXEdge);
        double v37 = sy - sx / height * width;
        double v38 = fmax(sx / height, v37 * v36 / width);
        CGFloat v39 = sx / height * 0.5 * v32;
        CGFloat v40 = v22 + v37 * 0.5;
        *(_OWORD *)&v100.a = v86;
        *(_OWORD *)&v100.c = v85;
        *(_OWORD *)&v100.tdouble x = v87;
        CGAffineTransformTranslate(&v106, &v100, v40, v23);
        CGAffineTransform v99 = v106;
        CGAffineTransformScale(&v100, &v99, -v38, sx / height);
        CGAffineTransform v106 = v100;
        double v41 = x;
        CGAffineTransform v99 = v100;
        CGAffineTransformTranslate(&v100, &v99, -x, -y);
        CGAffineTransform v106 = v100;
        *(_OWORD *)&v100.a = v86;
        *(_OWORD *)&v100.c = v85;
        *(_OWORD *)&v100.tdouble x = v87;
        CGAffineTransformTranslate(&v105, &v100, v40, v88);
        CGAffineTransform v99 = v105;
        CGAffineTransformScale(&v100, &v99, v39, sx / height);
        CGAffineTransform v105 = v100;
        CGAffineTransform v99 = v100;
        CGAffineTransformTranslate(&v100, &v99, -x, -y);
        CGAffineTransform v105 = v100;
        CGFloat v42 = v22 + (sy + sx / height * width) * 0.5;
        *(_OWORD *)&v100.a = v86;
        *(_OWORD *)&v100.c = v85;
        *(_OWORD *)&v100.tdouble x = v87;
        CGAffineTransformTranslate(&v104, &v100, v42, v88);
        CGAffineTransform v99 = v104;
        CGAffineTransformScale(&v100, &v99, -v38, sx / height);
        CGAffineTransform v104 = v100;
        CGAffineTransform v99 = v100;
        CGAffineTransformTranslate(&v100, &v99, -(x + width), -y);
        CGAffineTransform v104 = v100;
        *(_OWORD *)&v100.a = v86;
        *(_OWORD *)&v100.c = v85;
        *(_OWORD *)&v100.tdouble x = v87;
        CGAffineTransformTranslate(&v103, &v100, v42, v88);
        CGAffineTransform v99 = v103;
        CGAffineTransformScale(&v100, &v99, v39, sx / height);
        CGAffineTransform v103 = v100;
        CGAffineTransform v99 = v100;
        double v43 = -(x + width);
        double v44 = -y;
      }
      CGAffineTransformTranslate(&v100, &v99, v43, v44);
      CGAffineTransform v103 = v100;
      v59 = objc_msgSend(v7, "imageByClampingToRect:", v89, v90, v91, v92);
      CGAffineTransform v100 = v106;
      v60 = [v59 imageByApplyingTransform:&v100];

      v61 = objc_msgSend(v7, "imageByCroppingToRect:", v41, y, width, height);
      CGAffineTransform v100 = v105;
      v62 = [v61 imageByApplyingTransform:&v100];
      v63 = [v62 imageByCompositingOverImage:v60];

      v64 = objc_msgSend(v63, "imageByClampingToRect:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      v65 = [v64 imageByApplyingFilter:@"CIExposureAdjust" withInputParameters:v29];

      v66 = [v65 imageByApplyingGaussianBlurWithSigma:v84];
      v67 = objc_msgSend(v66, "imageByCroppingToRect:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);

      v68 = objc_msgSend(v7, "imageByClampingToRect:", v89, v90, v91, v92);
      CGAffineTransform v100 = v104;
      v69 = [v68 imageByApplyingTransform:&v100];

      v70 = objc_msgSend(v7, "imageByCroppingToRect:", v41, y, width, height);
      CGAffineTransform v100 = v103;
      v71 = [v70 imageByApplyingTransform:&v100];
      v72 = [v71 imageByCompositingOverImage:v69];

      v73 = objc_msgSend(v72, "imageByClampingToRect:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      v74 = [v73 imageByApplyingFilter:@"CIExposureAdjust" withInputParameters:v29];

      v75 = [v74 imageByApplyingGaussianBlurWithSigma:v84];
      v76 = objc_msgSend(v75, "imageByCroppingToRect:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);

      v77 = [v76 imageByCompositingOverImage:v67];
      v51 = objc_msgSend(v77, "imageByCroppingToRect:", v17, v83, v81, v82);

      goto LABEL_16;
    }
    long long v52 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v106.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v106.c = v52;
    *(_OWORD *)&v106.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v105.a = *(_OWORD *)&v106.a;
    *(_OWORD *)&v105.c = v52;
    *(_OWORD *)&v105.tdouble x = *(_OWORD *)&v106.tx;
    CGAffineTransformTranslate(&v106, &v105, v22, v23);
    CGAffineTransform v104 = v106;
    CGAffineTransformScale(&v105, &v104, sy / width, sx / height);
    CGAffineTransform v106 = v105;
    CGAffineTransform v104 = v105;
    CGAffineTransformTranslate(&v105, &v104, -x, -y);
    CGAffineTransform v106 = v105;
    v53 = [v7 imageByApplyingTransform:&v105];
    v48 = [v53 imageByApplyingFilter:@"CIExposureAdjust" withInputParameters:v29];

    v49 = [v48 imageByApplyingGaussianBlurWithSigma:v27];
    v51 = objc_msgSend(v49, "imageByCroppingToRect:", v17, v16, v19, v21);
  }
  else
  {
    v107[0] = @"inputWidth";
    v45 = NSNumber;
    [(PXStorySmartGradientAdjustment *)self targetSize];
    CGFloat v29 = objc_msgSend(v45, "numberWithDouble:");
    v108[0] = v29;
    v107[1] = @"inputHeight";
    v46 = NSNumber;
    [(PXStorySmartGradientAdjustment *)self targetSize];
    v48 = [v46 numberWithDouble:v47];
    v108[1] = v48;
    v107[2] = @"inputReturnSmartColor";
    v49 = objc_msgSend(NSNumber, "numberWithBool:", -[PXStorySmartGradientAdjustment useSmartColor](self, "useSmartColor"));
    v108[2] = v49;
    v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:3];
    v51 = [v7 imageByApplyingFilter:@"CISmartGradient" withInputParameters:v50];
  }
LABEL_16:

  return v51;
}

@end
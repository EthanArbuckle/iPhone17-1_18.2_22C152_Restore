@interface PUParallaxLayerLayoutInfo
- (BOOL)animateChanges;
- (BOOL)canApplyParallax;
- (BOOL)isEqual:(id)a3;
- (BOOL)styleIsHighKey;
- (CGAffineTransform)additionalContentTransform;
- (CGAffineTransform)additionalTransform;
- (CGPoint)parallaxVector;
- (CGRect)containerFrame;
- (CGRect)headroomFrame;
- (CGRect)settlingEffectFrame;
- (CGRect)viewFrameForLayerFrame:(CGRect)a3;
- (CGRect)visibleFrame;
- (UIColor)primaryStyleColor;
- (double)headroomVisibilityAmount;
- (double)parallaxAmount;
- (double)visibilityAmount;
- (id)description;
- (id)initWithDeviceOrientation:(void *)a3 containerFrame:(char)a4 visibleFrame:(void *)a5 settlingEffectFrame:(char)a6 headroomFrame:(void *)a7 headroomVisibilityAmount:(char)a8 styleIsHighKey:(double)a9 primaryStyleColor:(double)a10 canApplyParallax:(double)a11 parallaxVector:(double)a12 parallaxAmount:(CGFloat)a13 visibilityAmount:(CGFloat)a14 visibilityEdge:(CGFloat)a15 animateChanges:(CGFloat)a16;
- (int64_t)deviceOrientation;
- (unint64_t)visibilityEdge;
@end

@implementation PUParallaxLayerLayoutInfo

- (void).cxx_destruct
{
}

- (BOOL)animateChanges
{
  return self->_animateChanges;
}

- (unint64_t)visibilityEdge
{
  return self->_visibilityEdge;
}

- (double)visibilityAmount
{
  return self->_visibilityAmount;
}

- (double)parallaxAmount
{
  return self->_parallaxAmount;
}

- (CGPoint)parallaxVector
{
  double x = self->_parallaxVector.x;
  double y = self->_parallaxVector.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)canApplyParallax
{
  return self->_canApplyParallax;
}

- (double)headroomVisibilityAmount
{
  return self->_headroomVisibilityAmount;
}

- (UIColor)primaryStyleColor
{
  return self->_primaryStyleColor;
}

- (BOOL)styleIsHighKey
{
  return self->_styleIsHighKey;
}

- (CGRect)headroomFrame
{
  double x = self->_headroomFrame.origin.x;
  double y = self->_headroomFrame.origin.y;
  double width = self->_headroomFrame.size.width;
  double height = self->_headroomFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)settlingEffectFrame
{
  double x = self->_settlingEffectFrame.origin.x;
  double y = self->_settlingEffectFrame.origin.y;
  double width = self->_settlingEffectFrame.size.width;
  double height = self->_settlingEffectFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)visibleFrame
{
  double x = self->_visibleFrame.origin.x;
  double y = self->_visibleFrame.origin.y;
  double width = self->_visibleFrame.size.width;
  double height = self->_visibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)containerFrame
{
  double x = self->_containerFrame.origin.x;
  double y = self->_containerFrame.origin.y;
  double width = self->_containerFrame.size.width;
  double height = self->_containerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(PUParallaxLayerLayoutInfo *)self containerFrame];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v21);
  [(PUParallaxLayerLayoutInfo *)self visibleFrame];
  CFDictionaryRef v6 = CGRectCreateDictionaryRepresentation(v22);
  [(PUParallaxLayerLayoutInfo *)self settlingEffectFrame];
  CFDictionaryRef v7 = CGRectCreateDictionaryRepresentation(v23);
  if ([(PUParallaxLayerLayoutInfo *)self canApplyParallax]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [(PUParallaxLayerLayoutInfo *)self parallaxVector];
  uint64_t v10 = v9;
  [(PUParallaxLayerLayoutInfo *)self parallaxVector];
  uint64_t v12 = v11;
  [(PUParallaxLayerLayoutInfo *)self parallaxAmount];
  uint64_t v14 = v13;
  [(PUParallaxLayerLayoutInfo *)self visibilityAmount];
  uint64_t v16 = v15;
  if ([(PUParallaxLayerLayoutInfo *)self animateChanges]) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  v18 = [v3 stringWithFormat:@"<%@:%p container=%@ visible=%@ settling=%@ canDoParallax=%@ parallaxVec=(%.2f, %.2f) parallaxAmt=%.2f visiblityAmt=%.2f animate=%@>", v4, self, DictionaryRepresentation, v6, v7, v8, v10, v12, v14, v16, v17];

  return v18;
}

- (CGAffineTransform)additionalContentTransform
{
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v5 + 32);
  CGRect result = [(PUParallaxLayerLayoutInfo *)self deviceOrientation];
  if ((unint64_t)result >= 3)
  {
    [(PUParallaxLayerLayoutInfo *)self containerFrame];
    PXSizeTranspose();
    PXSizeSubtract();
    double v9 = v8 * 0.5;
    double v11 = v10 * 0.5;
    return CGAffineTransformMakeTranslation(retstr, v9, v11);
  }
  return result;
}

- (CGAffineTransform)additionalTransform
{
  uint64_t v4 = [(PUParallaxLayerLayoutInfo *)self deviceOrientation];
  return PUPosterAdditionalTransformForDeviceOrientation(v4, (uint64_t)retstr);
}

- (CGRect)viewFrameForLayerFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUParallaxLayerLayoutInfo *)self visibleFrame];
  double v12 = x - v11;
  double v13 = 0.0;
  double v14 = 0.0;
  if (v9 != 0.0)
  {
    double v12 = v12 / v9;
    double v14 = width / v9;
  }
  double v15 = y - v8;
  if (v10 != 0.0)
  {
    double v15 = v15 / v10;
    double v13 = height / v10;
  }
  [(PUParallaxLayerLayoutInfo *)self containerFrame];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  if ((unint64_t)([(PUParallaxLayerLayoutInfo *)self deviceOrientation] - 3) <= 1)
  {
    PXRectTransposed();
    double v17 = v24;
    double v19 = v25;
    double v21 = v26;
    double v23 = v27;
  }
  double v28 = v17 + v12 * v21;
  double v29 = v19 + v15 * v23;
  double v30 = v14 * v21;
  double v31 = v13 * v23;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PUParallaxLayerLayoutInfo *)a3;
  if (self == v4)
  {
    LOBYTE(v60) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t v6 = [(PUParallaxLayerLayoutInfo *)self deviceOrientation];
      if (v6 != [(PUParallaxLayerLayoutInfo *)v5 deviceOrientation]) {
        goto LABEL_17;
      }
      [(PUParallaxLayerLayoutInfo *)self containerFrame];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      [(PUParallaxLayerLayoutInfo *)v5 containerFrame];
      v81.origin.double x = v15;
      v81.origin.double y = v16;
      v81.size.double width = v17;
      v81.size.double height = v18;
      v77.origin.double x = v8;
      v77.origin.double y = v10;
      v77.size.double width = v12;
      v77.size.double height = v14;
      if (!CGRectEqualToRect(v77, v81)) {
        goto LABEL_17;
      }
      [(PUParallaxLayerLayoutInfo *)self visibleFrame];
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      [(PUParallaxLayerLayoutInfo *)v5 visibleFrame];
      v82.origin.double x = v27;
      v82.origin.double y = v28;
      v82.size.double width = v29;
      v82.size.double height = v30;
      v78.origin.double x = v20;
      v78.origin.double y = v22;
      v78.size.double width = v24;
      v78.size.double height = v26;
      if (!CGRectEqualToRect(v78, v82)) {
        goto LABEL_17;
      }
      [(PUParallaxLayerLayoutInfo *)self settlingEffectFrame];
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;
      [(PUParallaxLayerLayoutInfo *)v5 settlingEffectFrame];
      v83.origin.double x = v39;
      v83.origin.double y = v40;
      v83.size.double width = v41;
      v83.size.double height = v42;
      v79.origin.double x = v32;
      v79.origin.double y = v34;
      v79.size.double width = v36;
      v79.size.double height = v38;
      if (!CGRectEqualToRect(v79, v83)) {
        goto LABEL_17;
      }
      [(PUParallaxLayerLayoutInfo *)self headroomFrame];
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v47;
      CGFloat v50 = v49;
      [(PUParallaxLayerLayoutInfo *)v5 headroomFrame];
      v84.origin.double x = v51;
      v84.origin.double y = v52;
      v84.size.double width = v53;
      v84.size.double height = v54;
      v80.origin.double x = v44;
      v80.origin.double y = v46;
      v80.size.double width = v48;
      v80.size.double height = v50;
      if (!CGRectEqualToRect(v80, v84)) {
        goto LABEL_17;
      }
      BOOL v55 = [(PUParallaxLayerLayoutInfo *)self styleIsHighKey];
      if (v55 != [(PUParallaxLayerLayoutInfo *)v5 styleIsHighKey]) {
        goto LABEL_17;
      }
      id v56 = [(PUParallaxLayerLayoutInfo *)self primaryStyleColor];
      id v57 = [(PUParallaxLayerLayoutInfo *)v5 primaryStyleColor];
      if (v56 == v57)
      {
      }
      else
      {
        v58 = v57;
        char v59 = [v56 isEqual:v57];

        if ((v59 & 1) == 0) {
          goto LABEL_17;
        }
      }
      [(PUParallaxLayerLayoutInfo *)self headroomVisibilityAmount];
      [(PUParallaxLayerLayoutInfo *)v5 headroomVisibilityAmount];
      if (PXFloatApproximatelyEqualToFloat())
      {
        BOOL v61 = [(PUParallaxLayerLayoutInfo *)self canApplyParallax];
        if (v61 == [(PUParallaxLayerLayoutInfo *)v5 canApplyParallax])
        {
          [(PUParallaxLayerLayoutInfo *)self parallaxVector];
          double v64 = v63;
          double v66 = v65;
          [(PUParallaxLayerLayoutInfo *)v5 parallaxVector];
          LOBYTE(v60) = 0;
          if (v64 != v68 || v66 != v67) {
            goto LABEL_18;
          }
          [(PUParallaxLayerLayoutInfo *)self parallaxAmount];
          double v70 = v69;
          [(PUParallaxLayerLayoutInfo *)v5 parallaxAmount];
          if (vabdd_f64(v70, v71) <= 0.00000999999975)
          {
            [(PUParallaxLayerLayoutInfo *)self visibilityAmount];
            double v73 = v72;
            [(PUParallaxLayerLayoutInfo *)v5 visibilityAmount];
            if (vabdd_f64(v73, v74) <= 0.00000999999975)
            {
              unint64_t v75 = [(PUParallaxLayerLayoutInfo *)self visibilityEdge];
              if (v75 == [(PUParallaxLayerLayoutInfo *)v5 visibilityEdge])
              {
                BOOL v76 = [(PUParallaxLayerLayoutInfo *)self animateChanges];
                BOOL v60 = v76 ^ [(PUParallaxLayerLayoutInfo *)v5 animateChanges] ^ 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
LABEL_17:
      LOBYTE(v60) = 0;
LABEL_18:

      goto LABEL_19;
    }
    LOBYTE(v60) = 0;
  }
LABEL_19:

  return v60;
}

- (id)initWithDeviceOrientation:(void *)a3 containerFrame:(char)a4 visibleFrame:(void *)a5 settlingEffectFrame:(char)a6 headroomFrame:(void *)a7 headroomVisibilityAmount:(char)a8 styleIsHighKey:(double)a9 primaryStyleColor:(double)a10 canApplyParallax:(double)a11 parallaxVector:(double)a12 parallaxAmount:(CGFloat)a13 visibilityAmount:(CGFloat)a14 visibilityEdge:(CGFloat)a15 animateChanges:(CGFloat)a16
{
  id v45 = a5;
  v51.origin.double x = a13;
  v51.origin.double y = a14;
  v51.size.double width = a15;
  v51.size.double height = a16;
  if (CGRectIsEmpty(v51))
  {
    double v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, a1, @"PUParallaxLayerLayoutInfo.m", 21, @"Invalid parameter not satisfying: %@", @"!CGRectIsEmpty(visibleFrame)" object file lineNumber description];
  }
  v50.receiver = a1;
  v50.super_class = (Class)PUParallaxLayerLayoutInfo;
  CGFloat v46 = (id *)objc_msgSendSuper2(&v50, sel_init);
  double v47 = v46;
  if (v46)
  {
    v46[2] = a3;
    *((double *)v46 + 10) = a9;
    *((double *)v46 + 11) = a10;
    *((double *)v46 + 12) = a11;
    *((double *)v46 + 13) = a12;
    *((CGFloat *)v46 + 14) = a13;
    *((CGFloat *)v46 + 15) = a14;
    *((CGFloat *)v46 + 16) = a15;
    *((CGFloat *)v46 + 17) = a16;
    v46[18] = a17;
    v46[19] = a18;
    v46[20] = a19;
    v46[21] = a20;
    v46[22] = a21;
    v46[23] = a22;
    v46[24] = a23;
    v46[25] = a24;
    *((unsigned char *)v46 + 8) = a4;
    objc_storeStrong(v46 + 3, a5);
    *((unsigned char *)v47 + 9) = a6;
    v47[8] = a26;
    v47[9] = a27;
    v47[4] = a25;
    v47[5] = a28;
    v47[6] = a29;
    v47[7] = a7;
    *((unsigned char *)v47 + 10) = a8;
  }

  return v47;
}

@end
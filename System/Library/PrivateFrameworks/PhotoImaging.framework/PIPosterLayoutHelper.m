@interface PIPosterLayoutHelper
- (id)intermediateWithInactiveStrategy:(unint64_t)a3 intermediate:(id)a4;
- (id)intermediateWithZoomStrategy:(unint64_t)a3 intermediate:(id)a4;
- (id)pixelBasedIntermediateWithOverlapStrategy:(unint64_t)a3 intermediate:(id)a4 translationY:(double)a5;
- (id)scoreIntermediate:(id)a3;
- (void)initWithCIContext:(double)a3 matte:(double)a4 posterClassification:(double)a5 initialRect:(double)a6 imageSize:(double)a7 effectiveAcceptableRect:(uint64_t)a8 effectivePreferredRect:(void *)a9 validBoundsNormalized:(void *)a10 headroomFeasible:(uint64_t)a11 hasTopEdgeContact:(uint64_t)a12 layoutType:(uint64_t)a13 layoutConfiguration:(uint64_t)a14;
- (void)initWithPosterClassification:(uint64_t)a3 initialRect:(uint64_t)a4 imageSize:(uint64_t)a5 effectiveAcceptableRect:(uint64_t)a6 effectivePreferredRect:(void *)a7 validBoundsNormalized:headroomFeasible:hasTopEdgeContact:layoutType:layoutConfiguration:;
@end

@implementation PIPosterLayoutHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matte, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (id)scoreIntermediate:(id)a3
{
  id v4 = a3;
  [(PFParallaxLayoutHelper *)self computeCropScoreForIntermediate:v4];
  double v91 = v5;
  -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", [v4 headroomStrategy]);
  double v7 = v6;
  double v9 = v8;
  double v10 = *MEMORY[0x1E4F1DAD8];
  double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v4 visibleRect];
  double v16 = v15 - v10;
  double v17 = 0.0;
  double v18 = 0.0;
  if (v7 != 0.0)
  {
    double v16 = v16 / v7;
    double v18 = v13 / v7;
  }
  double v19 = v12 - v11;
  if (v9 != 0.0)
  {
    double v19 = v19 / v9;
    double v17 = v14 / v9;
  }
  [(CIImage *)self->_matte extent];
  double v22 = v20 + v16 * v21;
  double v25 = v23 + v19 * v24;
  double v26 = v18 * v21;
  double v27 = v17 * v24;
  -[PFParallaxLayoutHelper unsafeAreaInImageSpaceWithVisibleFrame:](self, "unsafeAreaInImageSpaceWithVisibleFrame:", v22, v25, v18 * v21, v27);
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  matte = self->_matte;
  v37 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
  +[PISegmentationHelper computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:](PISegmentationHelper, "computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:", matte, v37, self->_context, 0, v22, v25, v26, v27);

  +[PISegmentationHelper computeMatteCoverageWithRect:segmentationMatte:context:](PISegmentationHelper, "computeMatteCoverageWithRect:segmentationMatte:context:", self->_matte, self->_context, v29, v31, v33, v35);
  double v39 = v38;
  [v4 visibleRect];
  -[PFParallaxLayoutHelper unsafeAreaInImageSpaceWithVisibleFrame:](self, "unsafeAreaInImageSpaceWithVisibleFrame:");
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v48 = v39;
  if ([v4 overlapStrategy] == 4)
  {
    [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    if ([(PFParallaxLayoutHelper *)self canInflate])
    {
      objc_msgSend((id)objc_opt_class(), "inflatePersonFaceRect:", v50, v52, v54, v56);
      double v50 = v57;
      double v52 = v58;
      double v54 = v59;
      double v56 = v60;
    }
    v93.origin.x = v41;
    v93.origin.y = v43;
    v93.size.width = v45;
    v93.size.height = v47;
    v97.origin.x = v50;
    v97.origin.y = v52;
    v97.size.width = v54;
    v97.size.height = v56;
    CGRect v94 = CGRectIntersection(v93, v97);
    if (v94.size.width == 0.0
      || v94.size.height == 0.0
      || (v94.size.height == *(double *)(MEMORY[0x1E4F8A250] + 8)
        ? (BOOL v61 = v94.size.width == *MEMORY[0x1E4F8A250])
        : (BOOL v61 = 0),
          v61))
    {
      double v62 = 0.0;
    }
    else
    {
      double v62 = v94.size.width * v94.size.height;
    }
    BOOL v63 = v47 == 0.0 || v45 == 0.0;
    if (v63)
    {
      double v64 = v45 * v47;
    }
    else
    {
      BOOL v65 = v47 == *(double *)(MEMORY[0x1E4F8A250] + 8) && v45 == *MEMORY[0x1E4F8A250];
      double v64 = v45 * v47;
      double v66 = v45 * v47;
      if (!v65)
      {
LABEL_27:
        [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
        v98.origin.x = v67;
        v98.origin.y = v68;
        v98.size.width = v69;
        v98.size.height = v70;
        v95.origin.x = v41;
        v95.origin.y = v43;
        v95.size.width = v45;
        v95.size.height = v47;
        CGRect v96 = CGRectIntersection(v95, v98);
        if (v96.size.width == 0.0
          || v96.size.height == 0.0
          || (v96.size.height == *(double *)(MEMORY[0x1E4F8A250] + 8)
            ? (BOOL v71 = v96.size.width == *MEMORY[0x1E4F8A250])
            : (BOOL v71 = 0),
              v71))
        {
          double v72 = 0.0;
          if (!v63) {
            goto LABEL_37;
          }
        }
        else
        {
          double v72 = v96.size.width * v96.size.height;
          if (!v63)
          {
LABEL_37:
            if (v47 != *(double *)(MEMORY[0x1E4F8A250] + 8) || v45 != *MEMORY[0x1E4F8A250]) {
              goto LABEL_43;
            }
          }
        }
        double v64 = 0.0;
LABEL_43:
        double v48 = v62 / v66;
        double v39 = v72 / v64;
        goto LABEL_44;
      }
    }
    double v66 = 0.0;
    goto LABEL_27;
  }
LABEL_44:
  [(PFParallaxLayoutHelper *)self scoreAdjustmentWithUnscoredIntermediate:v4 unsafeAreaOverlap:v48 timeBottomOverlap:0.0 timeTopOverlap:0.0];
  double v75 = v74;
  id v76 = objc_alloc(MEMORY[0x1E4F8CC88]);
  [v4 visibleRect];
  double v89 = v78;
  double v90 = v77;
  double v88 = v79;
  double v81 = v80;
  [v4 inactiveRect];
  v86 = objc_msgSend(v76, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:cropScore:layoutScore:timeBottomOverlap:timeTopOverlap:unsafeAreaOverlap:uninflatedUnsafeAreaOverlap:hasTopEdgeContact:", objc_msgSend(v4, "zoomStrategy"), objc_msgSend(v4, "overlapStrategy"), objc_msgSend(v4, "parallaxStrategy"), objc_msgSend(v4, "inactiveStrategy"), objc_msgSend(v4, "headroomStrategy"), -[PFParallaxLayoutHelper hasTopEdgeContact](self, "hasTopEdgeContact"), v90, v89, v88, v81, v82, v83, v84, v85, *(void *)&v91,
                  (v91 + v75) * 0.5,
                  0,
                  0,
                  *(void *)&v48,
                  *(void *)&v39);

  return v86;
}

- (id)intermediateWithInactiveStrategy:(unint64_t)a3 intermediate:(id)a4
{
  id v6 = a4;
  [v6 visibleRect];
  if (a3)
  {
    if (a3 == 2)
    {
      [(PFParallaxLayoutHelper *)self originalImageSize];
      double v24 = v23;
      double v26 = v25;
      [v6 visibleRect];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      BOOL v35 = [v6 headroomStrategy] == 2;
      matte = self->_matte;
      v37 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
      +[PISegmentationHelper computeInactiveFrameWithVisibleFrame:imageSize:canUpdateVisibleRect:considerHeadroom:segmentationMatte:layoutConfiguration:context:](PISegmentationHelper, "computeInactiveFrameWithVisibleFrame:imageSize:canUpdateVisibleRect:considerHeadroom:segmentationMatte:layoutConfiguration:context:", 1, v35, matte, v37, self->_context, v28, v30, v32, v34, v24, v26);

      v40.origin = 0u;
      v40.size = 0u;
      if (CGRectIsNull(v40) || (v41.origin = 0u, v41.size = 0u, CGRectIsNull(v41)))
      {
        a3 = 0;
        goto LABEL_11;
      }
      double v19 = 0.0;
      double v17 = 0.0;
      double v15 = 0.0;
      double v21 = 0.0;
      double v12 = 0.0;
      double v11 = 0.0;
      double v14 = 0.0;
      double v13 = 0.0;
    }
    else
    {
      double v11 = v7;
      double v12 = v8;
      double v13 = v9;
      double v14 = v10;
      double v15 = 0.0;
      if (a3 == 1)
      {
        [v6 visibleRect];
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v15 = v22;
      }
      else
      {
        double v21 = 0.0;
        double v19 = 0.0;
        double v17 = 0.0;
      }
    }
    a3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8CC88]), "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", objc_msgSend(v6, "zoomStrategy"), objc_msgSend(v6, "overlapStrategy"), objc_msgSend(v6, "parallaxStrategy"), a3, objc_msgSend(v6, "headroomStrategy"), v11, v12, v13, v14, v17, v19, v21, v15);
  }
LABEL_11:

  return (id)a3;
}

- (id)pixelBasedIntermediateWithOverlapStrategy:(unint64_t)a3 intermediate:(id)a4 translationY:(double)a5
{
  id v8 = a4;
  [v8 visibleRect];
  CGFloat v10 = v9;
  double v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", [v8 headroomStrategy]);
  double v18 = v17;
  double v20 = v19;
  v55.origin.double x = v10;
  v55.origin.double y = v12;
  v55.size.double width = v14;
  v55.size.double height = v16;
  double v21 = v20 - CGRectGetMaxY(v55);
  if (v21 > a5) {
    double v21 = a5;
  }
  if (v21 <= -v12) {
    double v22 = -v12;
  }
  else {
    double v22 = v21;
  }
  v56.origin.double x = v10;
  v56.origin.double y = v12;
  v56.size.double width = v14;
  v56.size.double height = v16;
  CGRect v57 = CGRectOffset(v56, 0.0, v22);
  double x = v57.origin.x;
  double y = v57.origin.y;
  double width = v57.size.width;
  double height = v57.size.height;
  if ([(PFParallaxLayoutHelper *)self layoutType] != 2) {
    goto LABEL_33;
  }
  double v52 = height;
  double v53 = width;
  [(PFParallaxLayoutHelper *)self pixelValidBounds];
  double v28 = v27;
  double v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  if ([v8 headroomStrategy] == 2
    || (v58.origin.double x = v28, v58.origin.y = v30, v58.size.width = v32, v58.size.height = v34, CGRectIsNull(v58)))
  {
    double v28 = 0.0;
    double v30 = 0.0;
  }
  else
  {
    double v18 = v32;
    double v20 = v34;
  }
  double v36 = v52;
  double v35 = v53;
  double v37 = y + v52;
  if (x + v53 >= v28 + v18) {
    double v38 = v28 + v18;
  }
  else {
    double v38 = x + v53;
  }
  if (v28 >= v38) {
    double v38 = v28;
  }
  if (v37 >= v30 + v20) {
    double v39 = v30 + v20;
  }
  else {
    double v39 = y + v52;
  }
  if (v30 >= v39) {
    double v39 = v30;
  }
  double v40 = x + v38 - (x + v53);
  double v41 = y + v39 - v37;
  if (v40 >= v28 + v18) {
    double v40 = v28 + v18;
  }
  double x = v28 >= v40 ? v28 : v40;
  double v42 = v41 >= v30 + v20 ? v30 + v20 : v41;
  double y = v30 >= v42 ? v30 : v42;
  v59.origin.double x = v28;
  double width = v53;
  v59.origin.double y = v30;
  double height = v52;
  v59.size.double width = v18;
  v59.size.double height = v20;
  double v43 = x;
  double v44 = y;
  if (!CGRectContainsRect(v59, *(CGRect *)(&v35 - 2)))
  {
    double v50 = 0;
  }
  else
  {
LABEL_33:
    id v45 = objc_alloc(MEMORY[0x1E4F8CC88]);
    [v8 inactiveRect];
    double v50 = objc_msgSend(v45, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", objc_msgSend(v8, "zoomStrategy"), a3, objc_msgSend(v8, "parallaxStrategy"), objc_msgSend(v8, "inactiveStrategy"), objc_msgSend(v8, "headroomStrategy"), x, y, width, height, v46, v47, v48, v49);
  }

  return v50;
}

- (id)intermediateWithZoomStrategy:(unint64_t)a3 intermediate:(id)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = v6;
  if (a3 - 1 < 2)
  {
    v94.receiver = self;
    v94.super_class = (Class)PIPosterLayoutHelper;
    [(PFParallaxLayoutHelper *)&v94 intermediateWithZoomStrategy:a3 intermediate:v6];
    goto LABEL_3;
  }
  if (a3 == 3)
  {
    [v6 visibleRect];
    if (v10 >= 1.0)
    {
      [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
      if (v11 >= 1.0)
      {
        -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", [v7 headroomStrategy]);
        double v21 = v20;
        double v23 = v22;
        double v25 = *MEMORY[0x1E4F1DAD8];
        double v24 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
        double v28 = v26 + v27 * 0.5;
        double v31 = v29 + v30 * 0.5;
        [v7 visibleRect];
        double v33 = v32;
        double v35 = v34;
        double v36 = v28 + v32 * -0.5;
        double v37 = v31 + v34 * -0.5;
        double v38 = v32 + v36;
        double v39 = v34 + v37;
        double v40 = v25 + v21;
        if (v38 >= v40) {
          double v41 = v40;
        }
        else {
          double v41 = v38;
        }
        if (v25 >= v41) {
          double v41 = v25;
        }
        double v91 = v23;
        double v42 = v23 + v24;
        if (v39 >= v23 + v24) {
          double v43 = v23 + v24;
        }
        else {
          double v43 = v39;
        }
        if (v24 >= v43) {
          double v43 = v24;
        }
        double v44 = v36 + v41 - v38;
        double v45 = v37 + v43 - v39;
        if (v44 >= v40) {
          double v44 = v40;
        }
        if (v25 >= v44) {
          double v46 = v25;
        }
        else {
          double v46 = v44;
        }
        if (v45 >= v42) {
          double v47 = v42;
        }
        else {
          double v47 = v45;
        }
        if (v24 >= v47) {
          double v48 = v24;
        }
        else {
          double v48 = v47;
        }
        buf[0] = 1;
        matte = self->_matte;
        double v50 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
        +[PISegmentationHelper computeHeadroomZoomFactorWithVisibleFrame:zoomTowardsTop:matte:layoutConfiguration:context:](PISegmentationHelper, "computeHeadroomZoomFactorWithVisibleFrame:zoomTowardsTop:matte:layoutConfiguration:context:", buf, matte, v50, self->_context, v46, v48, v33, v35);
        double v52 = v51;

        if (v52 >= 1.0)
        {
          if (buf[0]) {
            double v60 = v91;
          }
          else {
            double v60 = 0.0;
          }
          objc_msgSend(MEMORY[0x1E4F8CCB8], "targetZoomFactorLimitWithLayoutType:", -[PFParallaxLayoutHelper layoutType](self, "layoutType"));
          if (v52 >= v61) {
            double v52 = v61;
          }
          [v7 visibleRect];
          double v90 = v62 * (1.0 / v52);
          double v64 = v63 * (1.0 / v52);
          [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
          double v67 = v65 + v66 * 0.5;
          [v7 visibleRect];
          double v70 = v68 + v69 * 0.5 - v60;
          [v7 visibleRect];
          double v72 = v67 + v90 * -0.5;
          double v73 = v60 + v70 / v71 * v64 + v64 * -0.5;
          double v74 = v64 + v73;
          if (v90 + v72 >= v40) {
            double v75 = v40;
          }
          else {
            double v75 = v90 + v72;
          }
          if (v25 >= v75) {
            double v75 = v25;
          }
          if (v74 >= v42) {
            double v76 = v42;
          }
          else {
            double v76 = v64 + v73;
          }
          if (v24 >= v76) {
            double v76 = v24;
          }
          double v77 = v72 + v75 - (v90 + v72);
          double v78 = v73 + v76 - v74;
          if (v77 >= v40) {
            double v77 = v40;
          }
          if (v25 >= v77) {
            double v77 = v25;
          }
          double v92 = v77;
          if (v78 >= v42) {
            double v78 = v42;
          }
          if (v24 >= v78) {
            double v79 = v24;
          }
          else {
            double v79 = v78;
          }
          id v80 = objc_alloc(MEMORY[0x1E4F8CC88]);
          [v7 inactiveRect];
          uint64_t v8 = objc_msgSend(v80, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", 3, objc_msgSend(v7, "overlapStrategy"), objc_msgSend(v7, "parallaxStrategy"), objc_msgSend(v7, "inactiveStrategy"), objc_msgSend(v7, "headroomStrategy"), v92, v79, v90, v64, v81, v82, v83, v84);
          goto LABEL_4;
        }
        v93.receiver = self;
        v93.super_class = (Class)PIPosterLayoutHelper;
        [(PFParallaxLayoutHelper *)&v93 intermediateWithZoomStrategy:3 intermediate:v7];
        uint64_t v8 = LABEL_3:;
LABEL_4:
        double v9 = (void *)v8;
        goto LABEL_71;
      }
    }
    [v7 visibleRect];
    if (v12 < 1.0)
    {
      double v13 = (uint64_t *)MEMORY[0x1E4F7A750];
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26641);
      }
      CGFloat v14 = (os_log_t *)MEMORY[0x1E4F7A748];
      double v15 = (void *)*MEMORY[0x1E4F7A748];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v16 = NSString;
        double v17 = v15;
        double v18 = objc_msgSend(v16, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "intermediate.visibleRect.size.width >= 1");
        *(_DWORD *)buf = 138543362;
        CGRect v96 = v18;
        _os_log_impl(&dword_1A9680000, v17, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

        uint64_t v19 = *v13;
        if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
        {
          if (v19 != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26641);
          }
LABEL_39:
          os_log_t v53 = *v14;
          if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
          {
            specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
            CGRect v55 = (void *)MEMORY[0x1E4F29060];
            id v56 = specific;
            CGRect v57 = v53;
            CGRect v58 = [v55 callStackSymbols];
            CGRect v59 = [v58 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            CGRect v96 = specific;
            __int16 v97 = 2114;
            CGRect v98 = v59;
            _os_log_error_impl(&dword_1A9680000, v57, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_75:
            goto LABEL_69;
          }
          goto LABEL_69;
        }
        if (v19 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26641);
        }
      }
      else if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        goto LABEL_39;
      }
      os_log_t v85 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
      {
        v87 = (void *)MEMORY[0x1E4F29060];
        CGRect v57 = v85;
        double v88 = [v87 callStackSymbols];
        double v89 = [v88 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        CGRect v96 = v89;
        _os_log_error_impl(&dword_1A9680000, v57, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        goto LABEL_75;
      }
LABEL_69:
      _NUAssertContinueHandler();
    }
  }
  double v9 = 0;
LABEL_71:

  return v9;
}

- (void)initWithPosterClassification:(uint64_t)a3 initialRect:(uint64_t)a4 imageSize:(uint64_t)a5 effectiveAcceptableRect:(uint64_t)a6 effectivePreferredRect:(void *)a7 validBoundsNormalized:headroomFeasible:hasTopEdgeContact:layoutType:layoutConfiguration:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a7;
  double v9 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    double v10 = (os_log_t *)MEMORY[0x1E4F7A748];
    double v11 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      double v12 = NSString;
      double v13 = v11;
      CGFloat v14 = (objc_class *)objc_opt_class();
      double v15 = NSStringFromClass(v14);
      CGFloat v16 = NSStringFromSelector(a2);
      double v17 = [v12 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v15, v16];
      *(_DWORD *)buf = 138543362;
      double v32 = v17;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v18 = *v9;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v18 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26641);
        }
LABEL_7:
        os_log_t v19 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        {
          double v20 = (void *)MEMORY[0x1E4F29060];
          double v21 = v19;
          double v22 = [v20 callStackSymbols];
          double v23 = [v22 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          double v32 = v23;
          _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v18 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26641);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v24 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      double v26 = (void *)MEMORY[0x1E4F29060];
      id v27 = specific;
      double v21 = v24;
      double v28 = [v26 callStackSymbols];
      double v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      double v32 = specific;
      __int16 v33 = 2114;
      double v34 = v29;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    double v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26641);
  }
}

- (void)initWithCIContext:(double)a3 matte:(double)a4 posterClassification:(double)a5 initialRect:(double)a6 imageSize:(double)a7 effectiveAcceptableRect:(uint64_t)a8 effectivePreferredRect:(void *)a9 validBoundsNormalized:(void *)a10 headroomFeasible:(uint64_t)a11 hasTopEdgeContact:(uint64_t)a12 layoutType:(uint64_t)a13 layoutConfiguration:(uint64_t)a14
{
  id v32 = a9;
  id v33 = a10;
  v43.receiver = a1;
  v43.super_class = (Class)PIPosterLayoutHelper;
  double v34 = objc_msgSendSuper2(&v43, sel_initWithPosterClassification_initialRect_imageSize_effectiveAcceptableRect_effectivePreferredRect_validBoundsNormalized_headroomFeasible_hasTopEdgeContact_layoutType_layoutConfiguration_, a11, a12, a13, a14, a24, a2, a3, a4, a5, a6, a7, a15, a16, a17, a18, a19, a20,
          a21,
          a22,
          a23);
  uint64_t v35 = (void *)v34[23];
  v34[23] = v32;
  id v36 = v32;

  double v37 = (void *)v34[24];
  v34[24] = v33;

  return v34;
}

@end
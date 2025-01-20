@interface PFParallaxLayoutHelper
+ (CGRect)inflatePersonFaceRect:(CGRect)result;
+ (double)scoreBonusInactiveWithLayoutType:(unint64_t)a3;
+ (double)scoreBonusOverlapAvoid;
+ (double)scoreBonusOverlapTargetWithLayoutType:(unint64_t)a3;
+ (double)scoreBonusZoomHeadroomWithLayoutType:(unint64_t)a3;
+ (double)scoreBonusZoomNoneWithLayoutType:(unint64_t)a3;
+ (double)scoreBonusZoomTargetWithLayoutType:(unint64_t)a3;
+ (double)targetZoomFactorLimitWithLayoutType:(unint64_t)a3;
+ (double)targetZoomPercentWithLayoutType:(unint64_t)a3;
+ (void)setScoreBonusInactive:(double)a3;
+ (void)setScoreBonusOverlapAvoid:(double)a3;
+ (void)setScoreBonusOverlapTarget:(double)a3;
+ (void)setScoreBonusZoomHeadroom:(double)a3;
+ (void)setScoreBonusZoomTarget:(double)a3;
+ (void)setTargetZoomFactorLimit:(double)a3;
+ (void)setTargetZoomPercent:(double)a3;
- (BOOL)canInflate;
- (BOOL)hasTopEdgeContact;
- (BOOL)headroomFeasible;
- (CGRect)initialRect;
- (CGRect)pixelEffectiveAcceptable;
- (CGRect)pixelEffectivePreferred;
- (CGRect)pixelValidBounds;
- (CGRect)unsafeAreaInImageSpaceWithVisibleFrame:(CGRect)a3;
- (CGSize)extendedImageSize;
- (CGSize)imageSizeWithHeadroomStrategy:(unint64_t)a3;
- (CGSize)originalImageSize;
- (PFParallaxLayoutConfiguration)layoutConfiguration;
- (double)computeCropScoreForIntermediate:(id)a3;
- (double)initWithPosterClassification:(double)a3 initialRect:(double)a4 imageSize:(double)a5 effectiveAcceptableRect:(double)a6 effectivePreferredRect:(double)a7 validBoundsNormalized:(uint64_t)a8 headroomFeasible:(uint64_t)a9 hasTopEdgeContact:(char)a10 layoutType:(char)a11 layoutConfiguration:(uint64_t)a12;
- (double)scoreAdjustmentWithUnscoredIntermediate:(id)a3 unsafeAreaOverlap:(double)a4 timeBottomOverlap:(double)a5 timeTopOverlap:(double)a6;
- (id)bestLayout:(id)a3;
- (id)intermediateWithHeadroomStrategy:(unint64_t)a3 intermediate:(id)a4;
- (id)intermediateWithInactiveStrategy:(unint64_t)a3 intermediate:(id)a4;
- (id)intermediateWithOverlapStrategy:(unint64_t)a3 intermediate:(id)a4;
- (id)intermediateWithZoomStrategy:(unint64_t)a3 intermediate:(id)a4;
- (id)scoreIntermediate:(id)a3;
- (unint64_t)classification;
- (unint64_t)layoutType;
@end

@implementation PFParallaxLayoutHelper

- (void).cxx_destruct
{
}

- (PFParallaxLayoutConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (CGRect)pixelEffectivePreferred
{
  double x = self->_pixelEffectivePreferred.origin.x;
  double y = self->_pixelEffectivePreferred.origin.y;
  double width = self->_pixelEffectivePreferred.size.width;
  double height = self->_pixelEffectivePreferred.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)pixelEffectiveAcceptable
{
  double x = self->_pixelEffectiveAcceptable.origin.x;
  double y = self->_pixelEffectiveAcceptable.origin.y;
  double width = self->_pixelEffectiveAcceptable.size.width;
  double height = self->_pixelEffectiveAcceptable.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)pixelValidBounds
{
  double x = self->_pixelValidBounds.origin.x;
  double y = self->_pixelValidBounds.origin.y;
  double width = self->_pixelValidBounds.size.width;
  double height = self->_pixelValidBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)hasTopEdgeContact
{
  return self->_hasTopEdgeContact;
}

- (BOOL)headroomFeasible
{
  return self->_headroomFeasible;
}

- (CGSize)originalImageSize
{
  double width = self->_originalImageSize.width;
  double height = self->_originalImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)initialRect
{
  double x = self->_initialRect.origin.x;
  double y = self->_initialRect.origin.y;
  double width = self->_initialRect.size.width;
  double height = self->_initialRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (unint64_t)classification
{
  return self->_classification;
}

- (double)scoreAdjustmentWithUnscoredIntermediate:(id)a3 unsafeAreaOverlap:(double)a4 timeBottomOverlap:(double)a5 timeTopOverlap:(double)a6
{
  id v9 = a3;
  +[PFParallaxLayoutHelper scoreBonusZoomTargetWithLayoutType:self->_layoutType];
  double v11 = v10;
  +[PFParallaxLayoutHelper scoreBonusZoomHeadroomWithLayoutType:self->_layoutType];
  double v13 = v12;
  +[PFParallaxLayoutHelper scoreBonusZoomNoneWithLayoutType:self->_layoutType];
  double v15 = v14;
  +[PFParallaxLayoutHelper scoreBonusOverlapAvoid];
  double v17 = v16;
  +[PFParallaxLayoutHelper scoreBonusOverlapTargetWithLayoutType:self->_layoutType];
  double v19 = v18;
  +[PFParallaxLayoutHelper scoreBonusInactiveWithLayoutType:self->_layoutType];
  double v42 = v20;
  double v21 = 0.0;
  if ([v9 zoomStrategy] == 2)
  {
    +[PFParallaxLayoutHelper scoreBonusZoomTargetWithLayoutType:self->_layoutType];
    double v21 = v22 + 0.0;
  }
  if ([v9 zoomStrategy] == 3)
  {
    +[PFParallaxLayoutHelper scoreBonusZoomHeadroomWithLayoutType:self->_layoutType];
    double v21 = v21 + v23;
  }
  if ([v9 zoomStrategy] == 1)
  {
    +[PFParallaxLayoutHelper scoreBonusZoomNoneWithLayoutType:self->_layoutType];
    double v21 = v21 + v24;
  }
  if ([v9 overlapStrategy] == 3)
  {
    +[PFParallaxLayoutHelper scoreBonusOverlapAvoid];
    double v21 = v21 + v25 * (1.0 - a4);
  }
  uint64_t v26 = [v9 overlapStrategy];
  if (a5 > 0.0 && v26 == 2)
  {
    v27 = +[PFParallaxLayoutTextOverlapParameters systemParameters];
    [v27 maxBottomOverlap];
    double v29 = v28;

    if (v29 > a5)
    {
      +[PFParallaxLayoutHelper scoreBonusOverlapTargetWithLayoutType:self->_layoutType];
      double v21 = v21 + v30;
    }
  }
  if ([v9 inactiveStrategy] == 2)
  {
    +[PFParallaxLayoutHelper scoreBonusInactiveWithLayoutType:self->_layoutType];
    double v21 = v21 + v31;
  }
  if ([v9 headroomStrategy] == 2 && self->_layoutType == 1)
  {
    [(PFParallaxLayoutHelper *)self originalImageSize];
    double v33 = v32;
    [(PFParallaxLayoutHelper *)self originalImageSize];
    double v35 = v34;
    v36 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
    +[PFParallaxLayoutUtilities headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:](PFParallaxLayoutUtilities, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v9, v36, 0.0, 0.0, v33, v35);
    double v21 = v21 - v37;
  }
  if (v11 >= v13) {
    double v38 = v11;
  }
  else {
    double v38 = v13;
  }
  if (v38 < v15) {
    double v38 = v15;
  }
  if (v17 >= v19) {
    double v39 = v17;
  }
  else {
    double v39 = v19;
  }
  double v40 = v21 / (v38 + v39 + v42);

  return v40;
}

- (id)scoreIntermediate:(id)a3
{
  id v4 = a3;
  [(PFParallaxLayoutHelper *)self computeCropScoreForIntermediate:v4];
  double v106 = v5;
  [v4 visibleRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  -[PFParallaxLayoutHelper unsafeAreaInImageSpaceWithVisibleFrame:](self, "unsafeAreaInImageSpaceWithVisibleFrame:");
  CGFloat v107 = v15;
  CGFloat v109 = v14;
  double v111 = v16;
  double v117 = v17;
  double v18 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
  [v18 timeOverlapCheckBottom];
  double v104 = v7 + v19 * v11;
  double r1 = v9 + v20 * v13;
  double v113 = v13 * v22;
  double v115 = v11 * v21;

  double v23 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
  [v23 timeOverlapCheckTop];
  double v100 = v25;
  double v102 = v24;
  double v97 = v27;
  double v98 = v26;

  [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  if ([(PFParallaxLayoutHelper *)self canInflate])
  {
    v36 = objc_opt_class();
    [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
    objc_msgSend(v36, "inflatePersonFaceRect:");
    CGFloat v29 = v37;
    CGFloat v31 = v38;
    CGFloat v33 = v39;
    CGFloat v35 = v40;
  }
  v120.origin.double x = v104;
  v120.origin.double y = r1;
  v120.size.double height = v113;
  v120.size.double width = v115;
  v126.origin.double x = v29;
  v126.origin.double y = v31;
  v126.size.double width = v33;
  v126.size.double height = v35;
  CGRect v121 = CGRectIntersection(v120, v126);
  v41 = (double *)MEMORY[0x1E4F8A250];
  if (v121.size.width == 0.0
    || v121.size.height == 0.0
    || (v121.size.height == *(double *)(MEMORY[0x1E4F8A250] + 8)
      ? (BOOL v42 = v121.size.width == *MEMORY[0x1E4F8A250])
      : (BOOL v42 = 0),
        v42))
  {
    double v43 = 0.0;
  }
  else
  {
    double v43 = v121.size.width * v121.size.height;
  }
  double v105 = v43;
  double v44 = v7 + v102 * v11;
  double v45 = v9 + v100 * v13;
  double v46 = v11 * v98;
  double v47 = v13 * v97;
  BOOL v48 = v113 == 0.0 || v115 == 0.0;
  double v49 = v115 * v113;
  if (v48
    || (v113 == *(double *)(MEMORY[0x1E4F8A250] + 8) ? (BOOL v50 = v115 == *MEMORY[0x1E4F8A250]) : (BOOL v50 = 0),
        double v51 = v115 * v113,
        v50))
  {
    double v51 = 0.0;
  }
  double v103 = v51;
  double v52 = v46;
  double v53 = v13 * v97;
  v127.origin.double x = v29;
  v127.origin.double y = v31;
  v127.size.double width = v33;
  v127.size.double height = v35;
  CGRect v122 = CGRectIntersection(*(CGRect *)&v44, v127);
  if (v122.size.width == 0.0
    || v122.size.height == 0.0
    || (v122.size.height == v41[1] ? (BOOL v54 = v122.size.width == *v41) : (BOOL v54 = 0), v54))
  {
    double v55 = 0.0;
  }
  else
  {
    double v55 = v122.size.width * v122.size.height;
  }
  double v101 = v55;
  double v56 = v117;
  BOOL v57 = v47 == 0.0 || v46 == 0.0;
  if (v57)
  {
    double v58 = v46 * v47;
LABEL_39:
    double v60 = 0.0;
    goto LABEL_40;
  }
  BOOL v59 = v47 == v41[1] && v46 == *v41;
  double v58 = v46 * v47;
  double v60 = v46 * v47;
  if (v59) {
    goto LABEL_39;
  }
LABEL_40:
  double v99 = v60;
  CGFloat v62 = v107;
  CGFloat v61 = v109;
  double v63 = v111;
  v128.origin.double x = v29;
  v128.origin.double y = v31;
  v128.size.double width = v33;
  v128.size.double height = v35;
  CGRect v123 = CGRectIntersection(*(CGRect *)(&v56 - 3), v128);
  if (v123.size.width == 0.0
    || v123.size.height == 0.0
    || (v123.size.height == v41[1] ? (BOOL v64 = v123.size.width == *v41) : (BOOL v64 = 0), v64))
  {
    double v65 = 0.0;
  }
  else
  {
    double v65 = v123.size.width * v123.size.height;
  }
  BOOL v66 = v117 == 0.0 || v111 == 0.0;
  if (v66)
  {
    double v67 = v111 * v117;
LABEL_58:
    double v69 = 0.0;
    goto LABEL_59;
  }
  BOOL v68 = v117 == v41[1] && v111 == *v41;
  double v67 = v111 * v117;
  double v69 = v111 * v117;
  if (v68) {
    goto LABEL_58;
  }
LABEL_59:
  [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
  v129.origin.double x = v70;
  v129.origin.double y = v71;
  v129.size.double width = v72;
  v129.size.double height = v73;
  v124.origin.double y = v107;
  v124.origin.double x = v109;
  v124.size.double width = v111;
  v124.size.double height = v117;
  CGRect v125 = CGRectIntersection(v124, v129);
  if (v125.size.width == 0.0
    || v125.size.height == 0.0
    || (v125.size.height == v41[1] ? (BOOL v74 = v125.size.width == *v41) : (BOOL v74 = 0), v74))
  {
    double v75 = 0.0;
  }
  else
  {
    double v75 = v125.size.width * v125.size.height;
  }
  if (v66 || (v117 == v41[1] ? (BOOL v76 = v111 == *v41) : (BOOL v76 = 0), v77 = v67, v76)) {
    double v77 = 0.0;
  }
  if (v48 || (v113 == v41[1] ? (BOOL v78 = v115 == *v41) : (BOOL v78 = 0), v78)) {
    double v49 = 0.0;
  }
  if (v57 || (v47 == v41[1] ? (BOOL v79 = v46 == *v41) : (BOOL v79 = 0), v79)) {
    double v58 = 0.0;
  }
  if (v66 || (v117 == v41[1] ? (BOOL v80 = v111 == *v41) : (BOOL v80 = 0), v80)) {
    double v67 = 0.0;
  }
  if (v58 >= 1.0) {
    double v81 = v101 / v99;
  }
  else {
    double v81 = 1.0;
  }
  if (v49 >= 1.0) {
    double v82 = v105 / v103;
  }
  else {
    double v82 = 1.0;
  }
  if (v67 >= 1.0) {
    double v83 = v65 / v69;
  }
  else {
    double v83 = 1.0;
  }
  double v118 = v75 / v77;
  [(PFParallaxLayoutHelper *)self scoreAdjustmentWithUnscoredIntermediate:v4 unsafeAreaOverlap:v83 timeBottomOverlap:v82 timeTopOverlap:v81];
  double v116 = (v106 + v84) * 0.5;
  v85 = [PFParallaxIntermediateLayout alloc];
  [v4 visibleRect];
  double v112 = v87;
  double v114 = v86;
  double v108 = v89;
  double v110 = v88;
  [v4 inactiveRect];
  v94 = -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:cropScore:layoutScore:timeBottomOverlap:timeTopOverlap:unsafeAreaOverlap:uninflatedUnsafeAreaOverlap:hasTopEdgeContact:](v85, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:cropScore:layoutScore:timeBottomOverlap:timeTopOverlap:unsafeAreaOverlap:uninflatedUnsafeAreaOverlap:hasTopEdgeContact:", [v4 zoomStrategy], objc_msgSend(v4, "overlapStrategy"), objc_msgSend(v4, "parallaxStrategy"), objc_msgSend(v4, "inactiveStrategy"), objc_msgSend(v4, "headroomStrategy"), -[PFParallaxLayoutHelper hasTopEdgeContact](self, "hasTopEdgeContact"), v114, v112, v110, v108, v90, v91, v92, v93, *(void *)&v106, *(void *)&v116,
          *(void *)&v82,
          *(void *)&v81,
          *(void *)&v83,
          *(void *)&v118);

  return v94;
}

- (id)intermediateWithHeadroomStrategy:(unint64_t)a3 intermediate:(id)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = v6;
  if (a3 == 2)
  {
    [v6 visibleRect];
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    double v49 = v48 * 1.35;
    [(PFParallaxLayoutHelper *)self originalImageSize];
    if (v49 >= v50)
    {
      [v7 visibleRect];
      double v59 = v57;
      double v60 = v58;
      if (v57 == 0.0
        || v58 == 0.0
        || (v57 == *MEMORY[0x1E4F8A250] ? (BOOL v61 = v58 == *(double *)(MEMORY[0x1E4F8A250] + 8)) : (BOOL v61 = 0), v61))
      {
        double v62 = 1.0;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          int v81 = 134218496;
          double v82 = v59;
          __int16 v83 = 2048;
          double v84 = v60;
          __int16 v85 = 2048;
          uint64_t v86 = 0x3FF0000000000000;
          _os_log_fault_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", (uint8_t *)&v81, 0x20u);
        }
      }
      else
      {
        double v62 = fabs(v57 / v58);
      }
      [(PFParallaxLayoutHelper *)self originalImageSize];
      double v51 = v63 / v62;
      [(PFParallaxLayoutHelper *)self originalImageSize];
      double v49 = v64;
      [v7 visibleRect];
      double v55 = v51 - v65;
      double v53 = 0.0;
    }
    else
    {
      double v51 = v47 * 1.35;
      [v7 visibleRect];
      double v53 = v43 + v52 * 0.35 * -0.5;
      [v7 visibleRect];
      double v55 = v54 * 0.35;
      if (v53 < 0.0) {
        double v53 = 0.0;
      }
    }
    double v66 = v45 + v55 * -0.5;
    if (v66 >= 0.0) {
      double v67 = v66;
    }
    else {
      double v67 = 0.0;
    }
    BOOL v68 = [PFParallaxIntermediateLayout alloc];
    [v7 inactiveRect];
    double v70 = v69;
    double v72 = v71;
    double v74 = v73;
    double v76 = v75;
    uint64_t v77 = [v7 zoomStrategy];
    uint64_t v78 = [v7 overlapStrategy];
    uint64_t v79 = [v7 parallaxStrategy];
    uint64_t v28 = [v7 inactiveStrategy];
    CGFloat v29 = v68;
    double v30 = v53;
    double v31 = v67;
    double v32 = v49;
    double v33 = v51;
    double v34 = v70;
    double v35 = v72;
    double v36 = v74;
    double v37 = v76;
    uint64_t v38 = v77;
    uint64_t v39 = v78;
    uint64_t v40 = v79;
    uint64_t v41 = 2;
  }
  else
  {
    if (a3 != 1)
    {
      double v56 = 0;
      goto LABEL_24;
    }
    double v8 = [PFParallaxIntermediateLayout alloc];
    [v7 visibleRect];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [v7 inactiveRect];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    uint64_t v25 = [v7 zoomStrategy];
    uint64_t v26 = [v7 overlapStrategy];
    uint64_t v27 = [v7 parallaxStrategy];
    uint64_t v28 = [v7 inactiveStrategy];
    CGFloat v29 = v8;
    double v30 = v10;
    double v31 = v12;
    double v32 = v14;
    double v33 = v16;
    double v34 = v18;
    double v35 = v20;
    double v36 = v22;
    double v37 = v24;
    uint64_t v38 = v25;
    uint64_t v39 = v26;
    uint64_t v40 = v27;
    uint64_t v41 = 1;
  }
  double v56 = -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:](v29, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", v38, v39, v40, v28, v41, v30, v31, v32, v33, v34, v35, v36, v37);
LABEL_24:

  return v56;
}

- (id)intermediateWithInactiveStrategy:(unint64_t)a3 intermediate:(id)a4
{
  id v6 = a4;
  [v6 visibleRect];
  double v11 = v10;
  long long v46 = 0u;
  long long v47 = 0u;
  if (a3)
  {
    double v12 = v7;
    double v13 = v8;
    double v14 = v9;
    if (a3 == 2)
    {
      [(PFParallaxLayoutHelper *)self originalImageSize];
      uint64_t v40 = v20;
      uint64_t v41 = v19;
      [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
      double v44 = v22;
      double v45 = v21;
      double v42 = v24;
      double v43 = v23;
      uint64_t v25 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
      [v25 unsafeRect];
      +[PFParallaxLayoutUtilities computeInactiveAvoidingRectForVisibleRect:acceptableFrame:unsafeRect:imageSize:considerHeadroom:newVisibleRect:](PFParallaxLayoutUtilities, "computeInactiveAvoidingRectForVisibleRect:acceptableFrame:unsafeRect:imageSize:considerHeadroom:newVisibleRect:", [v6 headroomStrategy] == 2, &v46, v11, v12, v13, v14, v45, v44, v43, v42, v26, v27, v28, v29, v41, v40);
      *(void *)&long long v46 = v30;
      *((void *)&v46 + 1) = v31;
      *(void *)&long long v47 = v32;
      *((void *)&v47 + 1) = v33;
    }
    else if (a3 == 1)
    {
      [v6 visibleRect];
      *(void *)&long long v46 = v15;
      *((void *)&v46 + 1) = v16;
      *(void *)&long long v47 = v17;
      *((void *)&v47 + 1) = v18;
    }
    double v34 = [PFParallaxIntermediateLayout alloc];
    uint64_t v35 = [v6 zoomStrategy];
    uint64_t v36 = [v6 overlapStrategy];
    uint64_t v37 = [v6 parallaxStrategy];
    uint64_t v38 = [v6 headroomStrategy];
    a3 = -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:](v34, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", v35, v36, v37, a3, v38, v11, v12, v13, v14, v46, v47);
  }

  return (id)a3;
}

- (id)intermediateWithOverlapStrategy:(unint64_t)a3 intermediate:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  double v8 = 0;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_40;
    case 1uLL:
      [v6 visibleRect];
      goto LABEL_11;
    case 2uLL:
      [v6 visibleRect];
      double v10 = v20;
      double v12 = v21;
      double v14 = v22;
      double v16 = v23;
      [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
      double MaxY = CGRectGetMaxY(v66);
      if ([(PFParallaxLayoutHelper *)self canInflate])
      {
        double v24 = objc_opt_class();
        [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
        objc_msgSend(v24, "inflatePersonFaceRect:");
        double MaxY = CGRectGetMaxY(v67);
      }
      uint64_t v25 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
      [v25 timeOverlapCheckBottom];
      double v27 = v12 + v26 * v16;
      double v29 = v16 * v28;

      double MinY = v27 + v29 * 0.5;
      goto LABEL_8;
    case 3uLL:
    case 4uLL:
      [v6 visibleRect];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
      double MaxY = CGRectGetMaxY(v63);
      if ([(PFParallaxLayoutHelper *)self canInflate])
      {
        uint64_t v18 = objc_opt_class();
        [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
        objc_msgSend(v18, "inflatePersonFaceRect:");
        double MaxY = CGRectGetMaxY(v64);
      }
      -[PFParallaxLayoutHelper unsafeAreaInImageSpaceWithVisibleFrame:](self, "unsafeAreaInImageSpaceWithVisibleFrame:", v10, v12, v14, v16);
      double MinY = CGRectGetMinY(v65);
LABEL_8:
      CGFloat v30 = MaxY - MinY;
      v68.origin.double x = v10;
      v68.origin.double y = v12;
      v68.size.double width = v14;
      v68.size.double height = v16;
      CGRect v69 = CGRectOffset(v68, 0.0, v30);
LABEL_11:
      double x = v69.origin.x;
      double y = v69.origin.y;
      double height = v69.size.height;
      uint64_t v33 = objc_msgSend(v7, "headroomStrategy", *(void *)&v69.size.width);
      break;
    default:
      double height = 0.0;
      double y = 0.0;
      double x = 0.0;
      uint64_t v33 = objc_msgSend(v6, "headroomStrategy", 0);
      break;
  }
  [(PFParallaxLayoutHelper *)self imageSizeWithHeadroomStrategy:v33];
  double v35 = v34;
  double v37 = v36;
  [(PFParallaxLayoutHelper *)self pixelValidBounds];
  double v39 = v38;
  double v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  if ([v7 headroomStrategy] == 2
    || (v70.origin.double x = v39, v70.origin.y = v41, v70.size.width = v43, v70.size.height = v45, CGRectIsNull(v70)))
  {
    double v39 = 0.0;
    double v41 = 0.0;
  }
  else
  {
    double v35 = v43;
    double v37 = v45;
  }
  double v46 = height + y;
  if (v60 + x >= v39 + v35) {
    double v47 = v39 + v35;
  }
  else {
    double v47 = v60 + x;
  }
  if (v39 >= v47) {
    double v47 = v39;
  }
  if (v46 >= v41 + v37) {
    double v48 = v41 + v37;
  }
  else {
    double v48 = height + y;
  }
  if (v41 >= v48) {
    double v48 = v41;
  }
  double v49 = x + v47 - (v60 + x);
  double v50 = y + v48 - v46;
  if (v49 >= v39 + v35) {
    double v49 = v39 + v35;
  }
  if (v39 >= v49) {
    double v51 = v39;
  }
  else {
    double v51 = v49;
  }
  if (v50 >= v41 + v37) {
    double v52 = v41 + v37;
  }
  else {
    double v52 = v50;
  }
  if (v41 >= v52) {
    double v53 = v41;
  }
  else {
    double v53 = v52;
  }
  v71.origin.double x = v39;
  v71.origin.double y = v41;
  v71.size.double width = v35;
  v71.size.double height = v37;
  v72.origin.double x = v51;
  v72.origin.double y = v53;
  v72.size.double width = v60;
  v72.size.double height = height;
  if (CGRectContainsRect(v71, v72))
  {
    double v54 = [PFParallaxIntermediateLayout alloc];
    [v7 inactiveRect];
    double v8 = -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:](v54, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", [v7 zoomStrategy], a3, objc_msgSend(v7, "parallaxStrategy"), objc_msgSend(v7, "inactiveStrategy"), objc_msgSend(v7, "headroomStrategy"), v51, v53, v60, height, v55, v56, v57, v58);
  }
  else
  {
    double v8 = 0;
  }
LABEL_40:

  return v8;
}

- (id)bestLayout:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count]) {
    _PFAssertFailHandler();
  }
  double v5 = [v4 objectAtIndexedSubscript:0];
  [v5 cropScore];
  double v7 = v6;
  id v8 = v5;
  double v9 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
  [v8 clockOverlapAcceptabilityForLayoutConfiguration:v9 inflated:1];
  double v11 = v10;

  double v12 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
  [v8 clockOverlapAcceptabilityForLayoutConfiguration:v12 inflated:0];
  double v48 = v13;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v53 count:16];
  double v46 = v8;
  double v16 = v8;
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v50;
    double v19 = 0.5;
    double v47 = v7;
    double v16 = v8;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v50 != v18) {
          objc_enumerationMutation(v14);
        }
        double v21 = *(void **)(*((void *)&v49 + 1) + 8 * v20);
        if (v7 >= v19 || [*(id *)(*((void *)&v49 + 1) + 8 * v20) zoomStrategy] == 1)
        {
          [v21 cropScore];
          if (v22 >= 0.45 || v7 <= 0.45)
          {
            double v23 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
            [v21 clockOverlapAcceptabilityForLayoutConfiguration:v23 inflated:1];
            double v25 = v24;

            double v26 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
            [v21 clockOverlapAcceptabilityForLayoutConfiguration:v26 inflated:0];
            double v28 = v27;

            double v29 = vabdd_f64(v25, v11);
            double v30 = v48;
            BOOL v31 = vabdd_f64(v28, v48) <= 0.00000999999975 && v29 <= 0.00000999999975;
            [v21 layoutScore];
            double v33 = v32;
            [v16 layoutScore];
            double v35 = v34;
            BOOL v36 = v33 > v34;
            BOOL v37 = v25 >= v19;
            BOOL v38 = v11 >= v19;
            double v22 = 0.5;
            BOOL v39 = v28 >= v19;
            if (v25 >= v28) {
              double v40 = v25;
            }
            else {
              double v40 = v28;
            }
            if (v11 >= v48) {
              double v30 = v11;
            }
            if ((v38 ^ v37))
            {
LABEL_20:
              if (v37) {
                goto LABEL_21;
              }
LABEL_22:
              double v7 = v47;
              double v19 = 0.5;
              goto LABEL_23;
            }
            if (v25 < 0.5 || (double v22 = 0.00000999999975, v29 <= 0.00000999999975))
            {
              double v22 = 0.5;
              if (v11 >= 0.5)
              {
                BOOL v37 = v36;
                goto LABEL_20;
              }
              BOOL v37 = v36;
              if (v25 >= 0.5) {
                goto LABEL_20;
              }
              uint64_t v42 = [v21 headroomStrategy];
              if (v42 == [v16 headroomStrategy])
              {
                double v22 = v48;
                BOOL v37 = v39;
                if (v48 < 0.5 == v28 >= 0.5) {
                  goto LABEL_20;
                }
                BOOL v43 = v33 > v35;
                if (!v31) {
                  BOOL v43 = v40 > v30;
                }
                if (!v43) {
                  goto LABEL_22;
                }
              }
              else if ([v21 headroomStrategy] != 1)
              {
                goto LABEL_22;
              }
            }
            else if (v25 <= v11)
            {
              goto LABEL_22;
            }
LABEL_21:
            id v41 = v21;

            double v48 = v28;
            double v11 = v25;
            double v16 = v41;
            goto LABEL_22;
          }
        }
LABEL_23:
        ++v20;
      }
      while (v17 != v20);
      uint64_t v44 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v53, 16, v22);
      uint64_t v17 = v44;
    }
    while (v44);
  }

  return v16;
}

- (id)intermediateWithZoomStrategy:(unint64_t)a3 intermediate:(id)a4
{
  id v6 = a4;
  [v6 visibleRect];
  double v11 = 0;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_53;
    case 1uLL:
      [v6 visibleRect];
      goto LABEL_13;
    case 2uLL:
      [v6 visibleRect];
      if (v12 >= 1.0)
      {
        [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
        if (v13 >= 1.0)
        {
          [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
          double v30 = v29;
          [v6 visibleRect];
          double v32 = v30 / v31;
          +[PFParallaxLayoutHelper targetZoomPercentWithLayoutType:self->_layoutType];
          double v18 = v33 / v32;
          [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
          double v19 = v34 + v35 * 0.5;
          goto LABEL_23;
        }
      }
      [v6 visibleRect];
      if (v14 >= 1.0) {
        goto LABEL_52;
      }
      goto LABEL_10;
    case 3uLL:
      [v6 visibleRect];
      if (v15 < 1.0
        || ([(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable], v16 < 1.0))
      {
        [v6 visibleRect];
        if (v17 < 1.0) {
LABEL_10:
        }
          _PFAssertContinueHandler();
        goto LABEL_52;
      }
      [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
      double MaxY = CGRectGetMaxY(v81);
      if ([(PFParallaxLayoutHelper *)self canInflate])
      {
        BOOL v37 = objc_opt_class();
        [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
        objc_msgSend(v37, "inflatePersonFaceRect:");
        double MaxY = CGRectGetMaxY(v82);
      }
      -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", [v6 headroomStrategy]);
      double v39 = v38;
      double v40 = (v38 - MaxY) / v38;
      id v41 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
      [v41 timeOverlapCheckBottom];
      double v44 = 1.0 - (v42 + v43 * 0.5);

      double v45 = v44 / v40;
      double v46 = (1.0 - v44) / (1.0 - v40);
      BOOL v47 = v44 / v40 <= v46;
      if (v44 / v40 < v46) {
        double v45 = (1.0 - v44) / (1.0 - v40);
      }
      double v18 = v45 * 1.03;
      if (v47) {
        double v19 = 0.0;
      }
      else {
        double v19 = v39;
      }
LABEL_23:
      if (v18 < 1.0) {
        goto LABEL_52;
      }
      goto LABEL_24;
    default:
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
LABEL_13:
        double v20 = v7;
        double v21 = v8;
        double v22 = v9;
        double v23 = v10;
LABEL_14:
        double v24 = [PFParallaxIntermediateLayout alloc];
        [v6 inactiveRect];
        double v11 = -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:](v24, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", a3, [v6 overlapStrategy], objc_msgSend(v6, "parallaxStrategy"), objc_msgSend(v6, "inactiveStrategy"), objc_msgSend(v6, "headroomStrategy"), v20, v21, v22, v23, v25, v26, v27, v28);
        goto LABEL_53;
      }
      double v18 = 1.0;
      double v19 = 0.0;
LABEL_24:
      +[PFParallaxLayoutHelper targetZoomFactorLimitWithLayoutType:self->_layoutType];
      if (v18 >= v48) {
        double v18 = v48;
      }
      [v6 visibleRect];
      double v49 = 1.0 / v18;
      double v22 = v50 * (1.0 / v18);
      double v23 = v51 * v49;
      [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
      double v54 = v52 + v53 * 0.5;
      [v6 visibleRect];
      double v57 = v55 + v56 * 0.5 - v19;
      [v6 visibleRect];
      double v78 = v19 + v57 / v58 * v23 + v23 * -0.5;
      double v79 = v54 + v22 * -0.5;
      -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", [v6 headroomStrategy]);
      double v60 = v59;
      double v62 = v61;
      [(PFParallaxLayoutHelper *)self pixelValidBounds];
      double v64 = v63;
      double v66 = v65;
      CGFloat v68 = v67;
      CGFloat v70 = v69;
      if ([v6 headroomStrategy] == 2
        || (v83.origin.double x = v64, v83.origin.y = v66, v83.size.width = v68, v83.size.height = v70, CGRectIsNull(v83)))
      {
        double v64 = 0.0;
        double v66 = 0.0;
      }
      else
      {
        double v60 = v68;
        double v62 = v70;
      }
      double v71 = v23 + v78;
      if (v22 + v79 >= v64 + v60) {
        double v72 = v64 + v60;
      }
      else {
        double v72 = v22 + v79;
      }
      if (v64 >= v72) {
        double v72 = v64;
      }
      if (v71 >= v66 + v62) {
        double v73 = v66 + v62;
      }
      else {
        double v73 = v23 + v78;
      }
      if (v66 >= v73) {
        double v73 = v66;
      }
      double v74 = v79 + v72 - (v22 + v79);
      double v75 = v78 + v73 - v71;
      if (v74 >= v64 + v60) {
        double v74 = v64 + v60;
      }
      if (v64 >= v74) {
        double v20 = v64;
      }
      else {
        double v20 = v74;
      }
      if (v75 >= v66 + v62) {
        double v76 = v66 + v62;
      }
      else {
        double v76 = v75;
      }
      if (v66 >= v76) {
        double v21 = v66;
      }
      else {
        double v21 = v76;
      }
      v84.origin.double x = v64;
      v84.origin.double y = v66;
      v84.size.double width = v60;
      v84.size.double height = v62;
      v85.origin.double x = v20;
      v85.origin.double y = v21;
      v85.size.double width = v22;
      v85.size.double height = v23;
      if (CGRectContainsRect(v84, v85)) {
        goto LABEL_14;
      }
LABEL_52:
      double v11 = 0;
LABEL_53:

      return v11;
  }
}

- (BOOL)canInflate
{
  unint64_t v3 = [(PFParallaxLayoutHelper *)self classification];
  if (v3 != 1) {
    LOBYTE(v3) = [(PFParallaxLayoutHelper *)self classification] == 2;
  }
  return v3;
}

- (double)computeCropScoreForIntermediate:(id)a3
{
  id v4 = a3;
  -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", [v4 headroomStrategy]);
  double v6 = v5;
  double v8 = v7;
  [v4 visibleRect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  unint64_t v17 = (unint64_t)v6;
  unint64_t v18 = (unint64_t)v8;
  [(PFParallaxLayoutHelper *)self pixelEffectiveAcceptable];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  [(PFParallaxLayoutHelper *)self pixelEffectivePreferred];
  +[PFCropUtilities scoreForCropRect:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:](PFCropUtilities, "scoreForCropRect:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:", v17, v18, v10, v12, v14, v16, v20, v22, v24, v26, v27, v28, v29, v30);
  return result;
}

- (CGRect)unsafeAreaInImageSpaceWithVisibleFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(PFParallaxLayoutHelper *)self layoutConfiguration];
  [v7 unsafeRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = x + v9 * width;
  double v17 = y + v11 * height;
  double v18 = width * v13;
  double v19 = height * v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGSize)imageSizeWithHeadroomStrategy:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      [(PFParallaxLayoutHelper *)self extendedImageSize];
    }
    else if (a3 == 1)
    {
      [(PFParallaxLayoutHelper *)self originalImageSize];
    }
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB30];
    double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)extendedImageSize
{
  double width = self->_originalImageSize.width;
  double v3 = self->_originalImageSize.height * 1.35;
  result.double height = v3;
  result.double width = width;
  return result;
}

- (double)initWithPosterClassification:(double)a3 initialRect:(double)a4 imageSize:(double)a5 effectiveAcceptableRect:(double)a6 effectivePreferredRect:(double)a7 validBoundsNormalized:(uint64_t)a8 headroomFeasible:(uint64_t)a9 hasTopEdgeContact:(char)a10 layoutType:(char)a11 layoutConfiguration:(uint64_t)a12
{
  id v35 = a13;
  v43.receiver = a1;
  v43.super_class = (Class)PFParallaxLayoutHelper;
  BOOL v36 = (double *)objc_msgSendSuper2(&v43, sel_init);
  *((void *)v36 + 2) = a9;
  v36[7] = a2;
  v36[8] = a3;
  v36[9] = a4;
  v36[10] = a5;
  v36[5] = a6;
  v36[6] = a7;
  double v37 = *MEMORY[0x1E4F1DAD8];
  double v38 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v36[11] = *MEMORY[0x1E4F1DAD8] + a24 * a6;
  v36[12] = v38 + a25 * a7;
  v36[13] = a6 * a26;
  v36[14] = a7 * a27;
  v36[15] = v37 + a16 * a6;
  v36[16] = v38 + a17 * a7;
  v36[17] = a6 * a18;
  v36[18] = a7 * a19;
  v36[19] = v37 + a20 * a6;
  v36[20] = v38 + a21 * a7;
  v36[21] = a6 * a22;
  v36[22] = a7 * a23;
  double v39 = (void *)*((void *)v36 + 4);
  *((void *)v36 + 4) = v35;

  *((void *)v36 + 3) = a12;
  *((unsigned char *)v36 + 8) = a10;
  *((unsigned char *)v36 + 9) = a11;
  return v36;
}

+ (CGRect)inflatePersonFaceRect:(CGRect)result
{
  double v3 = result.size.height * 1.5;
  result.size.double height = v3;
  return result;
}

+ (void)setScoreBonusInactive:(double)a3
{
  _scoreBonusInactive = *(void *)&a3;
}

+ (void)setScoreBonusOverlapAvoid:(double)a3
{
  _scoreBonusOverlapAvoid = *(void *)&a3;
}

+ (void)setScoreBonusOverlapTarget:(double)a3
{
  _scoreBonusOverlapTarget = *(void *)&a3;
}

+ (void)setScoreBonusZoomHeadroom:(double)a3
{
  _scoreBonusZoomHeadroom = *(void *)&a3;
}

+ (void)setScoreBonusZoomTarget:(double)a3
{
  _scoreBonusZoomTarget = *(void *)&a3;
}

+ (void)setTargetZoomFactorLimit:(double)a3
{
  _targetZoomFactorLimit = *(void *)&a3;
}

+ (void)setTargetZoomPercent:(double)a3
{
  _targetZoomPercent = *(void *)&a3;
}

+ (double)scoreBonusOverlapAvoid
{
  return *(double *)&_scoreBonusOverlapAvoid;
}

+ (double)scoreBonusInactiveWithLayoutType:(unint64_t)a3
{
  double result = *(double *)&_scoreBonusInactive;
  if (a3) {
    return 0.0;
  }
  return result;
}

+ (double)scoreBonusOverlapTargetWithLayoutType:(unint64_t)a3
{
  double result = *(double *)&_scoreBonusOverlapTarget;
  if (a3) {
    return 0.25;
  }
  return result;
}

+ (double)scoreBonusZoomNoneWithLayoutType:(unint64_t)a3
{
  double result = 0.2;
  if (a3 - 1 >= 2) {
    return 0.0;
  }
  return result;
}

+ (double)scoreBonusZoomTargetWithLayoutType:(unint64_t)a3
{
  double result = *(double *)&_scoreBonusZoomTarget;
  if (a3) {
    return 0.1;
  }
  return result;
}

+ (double)scoreBonusZoomHeadroomWithLayoutType:(unint64_t)a3
{
  double result = *(double *)&_scoreBonusZoomHeadroom;
  if (a3) {
    return 0.0;
  }
  return result;
}

+ (double)targetZoomFactorLimitWithLayoutType:(unint64_t)a3
{
  if (a3 == 2) {
    return 1.0;
  }
  if (a3) {
    return 1.2;
  }
  return *(double *)&_targetZoomFactorLimit;
}

+ (double)targetZoomPercentWithLayoutType:(unint64_t)a3
{
  double result = *(double *)&_targetZoomPercent;
  if (a3) {
    return 0.1;
  }
  return result;
}

@end
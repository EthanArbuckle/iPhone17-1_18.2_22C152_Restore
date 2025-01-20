@interface NTKDialView
- (BOOL)disableLayout;
- (BOOL)needsLayoutMarkers;
- (BOOL)shouldHideMarkerAtIndex:(int64_t)a3;
- (BOOL)shouldPixelAlignCenterPoints;
- (BOOL)shouldRotateMarkers;
- (CGPoint)centerPointForAngle:(double)a3 radius:(int64_t)a4;
- (CGPoint)positionForMarkerAtIndex:(unint64_t)a3;
- (CLKDevice)device;
- (NSIndexSet)markersToRotateIndexSet;
- (NSMutableArray)markers;
- (NSNumber)hidingMaskEndAngle;
- (NSNumber)hidingMaskStartAngle;
- (NTKDialView)initWithNumberOfMarkers:(unint64_t)a3 markersFactory:(id)a4;
- (NTKDialView)initWithNumberOfMarkers:(unint64_t)a3 markersFactory:(id)a4 angleProvider:(id)a5;
- (UIView)markerContainerView;
- (double)angleForIndex:(double)a3;
- (double)angleOffset;
- (double)contentDiameter;
- (double)contentInset;
- (double)diameter;
- (double)searchForClosestMarkerAngleAtAngle:(double)a3;
- (double)totalDiameter;
- (id)angleProvider;
- (id)markerAtIndex:(unint64_t)a3;
- (id)markerRotationProvider;
- (id)markersFactory;
- (unint64_t)numberOfMarkers;
- (unint64_t)searchForClosestIndexAtAngle:(double)a3;
- (void)_layoutCurvedLabel:(id)a3 rotationAngle:(double)a4;
- (void)enumerateMarkers:(id)a3;
- (void)layoutMarkers;
- (void)layoutSubviews;
- (void)reloadMarkers;
- (void)replaceMarker:(id)a3 atIndex:(int64_t)a4;
- (void)setAngleOffset:(double)a3;
- (void)setAngleProvider:(id)a3;
- (void)setContentDiameter:(double)a3;
- (void)setContentInset:(double)a3;
- (void)setDevice:(id)a3;
- (void)setDiameter:(double)a3;
- (void)setDisableLayout:(BOOL)a3;
- (void)setHidingMaskEndAngle:(id)a3;
- (void)setHidingMaskStartAngle:(id)a3;
- (void)setMarkerContainerView:(id)a3;
- (void)setMarkerRotationProvider:(id)a3;
- (void)setMarkers:(id)a3;
- (void)setMarkersFactory:(id)a3;
- (void)setMarkersToRotateIndexSet:(id)a3;
- (void)setNeedsLayoutMarkers:(BOOL)a3;
- (void)setNumberOfMarkers:(unint64_t)a3;
- (void)setShouldPixelAlignCenterPoints:(BOOL)a3;
- (void)setShouldRotateMarkers:(BOOL)a3;
- (void)updateMarkersVisibility;
@end

@implementation NTKDialView

- (NTKDialView)initWithNumberOfMarkers:(unint64_t)a3 markersFactory:(id)a4
{
  return [(NTKDialView *)self initWithNumberOfMarkers:a3 markersFactory:a4 angleProvider:0];
}

- (NTKDialView)initWithNumberOfMarkers:(unint64_t)a3 markersFactory:(id)a4 angleProvider:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)NTKDialView;
  v10 = -[NTKDialView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v10)
  {
    v11 = +[CLKRenderingContext sharedRenderingContext];
    uint64_t v12 = [v11 device];
    device = v10->_device;
    v10->_device = (CLKDevice *)v12;

    v14 = _Block_copy(v9);
    id angleProvider = v10->_angleProvider;
    v10->_id angleProvider = v14;

    v10->_numberOfMarkers = a3;
    v16 = _Block_copy(v8);
    id markersFactory = v10->_markersFactory;
    v10->_id markersFactory = v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    markers = v10->_markers;
    v10->_markers = (NSMutableArray *)v18;

    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    markerContainerView = v10->_markerContainerView;
    v10->_markerContainerView = v20;

    v22 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v10->_markerContainerView setBackgroundColor:v22];

    [(NTKDialView *)v10 addSubview:v10->_markerContainerView];
    v10->_shouldPixelAlignCenterPoints = 1;
  }

  return v10;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKDialView;
  [(NTKDialView *)&v5 layoutSubviews];
  [(NTKDialView *)self bounds];
  -[UIView setFrame:](self->_markerContainerView, "setFrame:");
  [(NTKDialView *)self bounds];
  double Width = CGRectGetWidth(v6);
  [(NTKDialView *)self bounds];
  double Height = CGRectGetHeight(v7);
  if (Width < Height) {
    double Height = Width;
  }
  [(NTKDialView *)self setDiameter:Height];
  if (self->_needsLayoutMarkers)
  {
    self->_needsLayoutMarkers = 0;
    [(NTKDialView *)self layoutMarkers];
  }
}

- (void)replaceMarker:(id)a3 atIndex:(int64_t)a4
{
  id v7 = a3;
  if ([(NSMutableArray *)self->_markers count] > (unint64_t)a4)
  {
    CGRect v6 = [(NSMutableArray *)self->_markers objectAtIndexedSubscript:a4];
    [v6 removeFromParent];
    [(NSMutableArray *)self->_markers setObject:v7 atIndexedSubscript:a4];
    [v7 addToParentView:self->_markerContainerView];
    [(NTKDialView *)self layoutMarkers];
  }
}

- (void)reloadMarkers
{
  [(NTKDialView *)self enumerateMarkers:&__block_literal_global_23];
  [(NSMutableArray *)self->_markers removeAllObjects];
  [(NTKDialView *)self layoutMarkers];
}

uint64_t __28__NTKDialView_reloadMarkers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromParent];
}

- (void)enumerateMarkers:(id)a3
{
  id v4 = a3;
  markers = self->_markers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__NTKDialView_enumerateMarkers___block_invoke;
  v7[3] = &unk_1E62C1C88;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)markers enumerateObjectsUsingBlock:v7];
}

void __32__NTKDialView_enumerateMarkers___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [MEMORY[0x1E4F1CA98] null];

  id v4 = v5;
  if (v3 != v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v4 = v5;
  }
}

- (void)setDiameter:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_diameter = a3;
    [(NTKDialView *)self totalDiameter];
    if (v5 > 0.0)
    {
      [(NTKDialView *)self layoutMarkers];
    }
  }
}

- (void)setContentInset:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_contentInset = a3;
    self->_needsLayoutMarkers = 1;
    [(NTKDialView *)self setNeedsLayout];
  }
}

- (double)totalDiameter
{
  [(NTKDialView *)self contentDiameter];
  if (!(uint64_t)diameter) {
    double diameter = self->_diameter;
  }
  return diameter - self->_contentInset;
}

- (void)setAngleOffset:(double)a3
{
  if (self->_angleOffset != a3)
  {
    self->_angleOffset = a3;
    [(NTKDialView *)self totalDiameter];
    if (v4 > 0.0)
    {
      [(NTKDialView *)self layoutMarkers];
    }
  }
}

- (double)searchForClosestMarkerAngleAtAngle:(double)a3
{
  double v4 = (double)[(NTKDialView *)self searchForClosestIndexAtAngle:a3];
  [(NTKDialView *)self angleForIndex:v4];
  return result;
}

- (unint64_t)searchForClosestIndexAtAngle:(double)a3
{
  double v4 = 360.0 / (double)[(NTKDialView *)self numberOfMarkers];
  if ((uint64_t)v4 - (uint64_t)a3 % (uint64_t)v4 > (uint64_t)a3 % (uint64_t)v4) {
    uint64_t v5 = (uint64_t)a3 / (uint64_t)v4;
  }
  else {
    uint64_t v5 = (uint64_t)a3 / (uint64_t)v4 + 1;
  }
  return (v5 % 24) & ~((v5 % 24) >> 63);
}

- (void)setDisableLayout:(BOOL)a3
{
  self->_disableLayout = a3;
  if (!a3 && self->_needsLayoutMarkers)
  {
    self->_needsLayoutMarkers = 0;
    [(NTKDialView *)self layoutMarkers];
  }
}

- (void)layoutMarkers
{
  if (self->_disableLayout)
  {
    self->_needsLayoutMarkers = 1;
    return;
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(NTKDialView *)self bounds];
  double v5 = v4;
  [(NTKDialView *)self bounds];
  double v7 = v6;
  [(NTKDialView *)self contentDiameter];
  double v9 = v8;
  if (!(uint64_t)v8)
  {
    [(NTKDialView *)self frame];
    double Width = CGRectGetWidth(v71);
    [(NTKDialView *)self frame];
    double Height = CGRectGetHeight(v72);
    if (Width >= Height) {
      double v9 = Height;
    }
    else {
      double v9 = Width;
    }
  }
  double contentInset = self->_contentInset;
  double v13 = MEMORY[0x1C1874A70]([(NTKDialView *)self bounds]);
  double v15 = v14;
  if ([(NTKDialView *)self numberOfMarkers])
  {
    uint64_t v16 = 0;
    double v17 = v5 * 0.5;
    double v18 = v7 * 0.5;
    uint64_t v19 = (uint64_t)((v9 - contentInset) * 0.5);
    v20 = &OBJC_IVAR___NTKComplicationMetrics__cornerRadius;
    double v21 = -180.0;
    double v63 = v15;
    while (1)
    {
      v22 = (void *)MEMORY[0x1C1875BE0]();
      v23 = [(NTKDialView *)self markerAtIndex:v16];
      if (v23) {
        break;
      }
LABEL_37:

      if (++v16 >= [(NTKDialView *)self numberOfMarkers]) {
        goto LABEL_38;
      }
    }
    [(NTKDialView *)self angleForIndex:(double)v16];
    double v25 = v24 + *(double *)((char *)&self->super.super.super.isa + v20[338]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = v23;
      int v27 = [v26 interior];
      double v28 = v25 + v21;
      if (!v27) {
        double v28 = v25;
      }
      [(NTKDialView *)self _layoutCurvedLabel:v26 rotationAngle:v28];
LABEL_36:

      goto LABEL_37;
    }
    [(NTKDialView *)self centerPointForAngle:v19 radius:v25];
    double v64 = v30;
    double v65 = v29;
    CGAffineTransformMakeTranslation(&v70, v18, v17);
    float64x2_t v66 = vaddq_f64(*(float64x2_t *)&v70.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v70.c, v64), *(float64x2_t *)&v70.a, v65));
    double v31 = v66.f64[1];
    if ([(NTKDialView *)self shouldPixelAlignCenterPoints])
    {
      v32 = [(NTKDialView *)self device];
      CLKPointRoundForDevice();
      v66.f64[0] = v33;
      double v31 = v34;
    }
    objc_msgSend(v23, "setPosition:", v13, v15);
    double v35 = v66.f64[0] - v13;
    double v36 = v31 - v15;
    if ([(NTKDialView *)self shouldPixelAlignCenterPoints])
    {
      v37 = [(NTKDialView *)self device];
      CLKRoundForDevice();
      double v35 = v38;

      v39 = [(NTKDialView *)self device];
      CLKRoundForDevice();
      double v36 = v40;
    }
    memset(&v69, 0, sizeof(v69));
    CGAffineTransformMakeTranslation(&v69, v35, v36);
    BOOL v41 = [(NTKDialView *)self shouldRotateMarkers];
    if (v41)
    {
      v2 = [(NTKDialView *)self markersToRotateIndexSet];
      if (([v2 containsIndex:v16] & 1) == 0)
      {

        goto LABEL_30;
      }
      if ([(NTKDialView *)self shouldRotateMarkers])
      {

LABEL_23:
        char v42 = 0;
        goto LABEL_33;
      }
    }
    else if ([(NTKDialView *)self shouldRotateMarkers])
    {
      goto LABEL_23;
    }
    v43 = [(NTKDialView *)self markersToRotateIndexSet];
    int v44 = [v43 containsIndex:v16];

    if (v41)
    {

      if ((v44 & 1) == 0)
      {
LABEL_26:
        char v42 = 0;
        v20 = &OBJC_IVAR___NTKComplicationMetrics__cornerRadius;
LABEL_33:
        CGAffineTransform v68 = v69;
        [v23 _setAffineTransform:&v68];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if ((v42 & 1) != 0 || (isKindOfClass & 1) == 0) {
          goto LABEL_37;
        }
        id v26 = v23;
        [v26 frame];
        double v50 = v49;
        double v51 = v13;
        double v52 = v21;
        double v53 = v18;
        double v54 = v17;
        double v56 = v55;
        v57 = [(NTKDialView *)self device];
        CLKPointRoundForDevice();
        double v59 = v58;
        double v61 = v60;

        double v62 = v56;
        double v17 = v54;
        double v18 = v53;
        double v21 = v52;
        double v13 = v51;
        double v15 = v63;
        objc_msgSend(v26, "setFrame:", v59, v61, v50, v62);
        goto LABEL_36;
      }
    }
    else if (!v44)
    {
      goto LABEL_26;
    }
    v20 = &OBJC_IVAR___NTKComplicationMetrics__cornerRadius;
LABEL_30:
    v45 = [(NTKDialView *)self markerRotationProvider];

    if (v45)
    {
      v46 = [(NTKDialView *)self markerRotationProvider];
      v46[2](v46, v16);
    }
    CLKDegreesToRadians();
    CGAffineTransform v67 = v69;
    CGAffineTransformRotate(&v68, &v67, v47);
    CGAffineTransform v69 = v68;
    char v42 = 1;
    goto LABEL_33;
  }
LABEL_38:
  [MEMORY[0x1E4F39CF8] setDisableActions:0];
}

- (void)_layoutCurvedLabel:(id)a3 rotationAngle:(double)a4
{
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v26[0] = *MEMORY[0x1E4F1DAB8];
  v26[1] = v5;
  v26[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  id v6 = a3;
  [v6 setTransform:v26];
  [v6 frame];
  objc_msgSend(v6, "sizeThatFits:", v7, v8);
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, v9, v10);
  double v11 = MEMORY[0x1C1874A70]([(NTKDialView *)self bounds]);
  double v13 = v12;
  long long v25 = *MEMORY[0x1E4F1DAD8];
  [v6 getTextCenter:&v25 startAngle:0 endAngle:0];
  long long v14 = v25;
  CGFloat v15 = v11 - *(double *)&v25;
  CGFloat v16 = v13 - *((double *)&v25 + 1);
  [v6 frame];
  CGFloat v17 = *(double *)&v14 - CGRectGetMidX(v27);
  double v18 = *((double *)&v25 + 1);
  [v6 frame];
  CGFloat v19 = v18 - CGRectGetMidY(v28);
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeTranslation(&v24, v15, v16);
  CGAffineTransform v22 = v24;
  CGAffineTransformTranslate(&v23, &v22, v17, v19);
  CGAffineTransform v24 = v23;
  CLKDegreesToRadians();
  CGAffineTransform v22 = v24;
  CGAffineTransformRotate(&v23, &v22, v20);
  CGAffineTransform v24 = v23;
  CGAffineTransform v22 = v23;
  CGAffineTransformTranslate(&v23, &v22, -v17, -v19);
  CGAffineTransform v24 = v23;
  CGAffineTransform v21 = v23;
  [v6 setTransform:&v21];
}

- (void)setMarkerRotationProvider:(id)a3
{
  double v4 = _Block_copy(a3);
  id markerRotationProvider = self->_markerRotationProvider;
  self->_id markerRotationProvider = v4;

  [(NTKDialView *)self layoutMarkers];
}

- (void)setHidingMaskStartAngle:(id)a3
{
  id v7 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_hidingMaskStartAngle, "isEqualToNumber:"))
  {
    double v4 = NSNumber;
    [v7 floatValue];
    NTKNormalizeAngle();
    objc_msgSend(v4, "numberWithDouble:");
    long long v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    hidingMaskStartAngle = self->_hidingMaskStartAngle;
    self->_hidingMaskStartAngle = v5;

    [(NTKDialView *)self updateMarkersVisibility];
  }
}

- (void)setHidingMaskEndAngle:(id)a3
{
  id v7 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_hidingMaskEndAngle, "isEqualToNumber:"))
  {
    double v4 = NSNumber;
    [v7 floatValue];
    NTKNormalizeAngle();
    objc_msgSend(v4, "numberWithDouble:");
    long long v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    hidingMaskEndAngle = self->_hidingMaskEndAngle;
    self->_hidingMaskEndAngle = v5;

    [(NTKDialView *)self updateMarkersVisibility];
  }
}

- (void)updateMarkersVisibility
{
  if ([(NTKDialView *)self numberOfMarkers])
  {
    unint64_t v3 = 0;
    do
    {
      double v4 = [(NTKDialView *)self markerAtIndex:v3];
      if (v4)
      {
        int v5 = [(NTKDialView *)self shouldHideMarkerAtIndex:v3];
        [v4 alpha];
        if (v5 != CLKFloatEqualsFloat()) {
          objc_msgSend(v4, "setAlpha:", (double)(-[NTKDialView shouldHideMarkerAtIndex:](self, "shouldHideMarkerAtIndex:", v3) ^ 1));
        }
      }

      ++v3;
    }
    while (v3 < [(NTKDialView *)self numberOfMarkers]);
  }
}

- (BOOL)shouldHideMarkerAtIndex:(int64_t)a3
{
  if (!self->_hidingMaskStartAngle && !self->_hidingMaskEndAngle) {
    return 0;
  }
  [(NTKDialView *)self angleForIndex:(double)a3];
  double v5 = v4;
  [(NSNumber *)self->_hidingMaskStartAngle floatValue];
  float v7 = v6;
  [(NSNumber *)self->_hidingMaskEndAngle floatValue];
  if (v7 >= v8) {
    return v5 < 0.0
  }
        || ([(NSNumber *)self->_hidingMaskStartAngle floatValue], v5 > v11)
        || ([(NSNumber *)self->_hidingMaskEndAngle floatValue], v5 < v12)
        || v5 > 360.0;
  [(NSNumber *)self->_hidingMaskStartAngle floatValue];
  if (v5 < v9) {
    return 0;
  }
  [(NSNumber *)self->_hidingMaskEndAngle floatValue];
  return v5 <= v13;
}

- (id)markerAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_markers count] <= a3)
  {
    double v5 = [(NTKDialView *)self markersFactory];
    float v6 = v5[2](v5, a3);

    if (v6)
    {
      float v7 = [(NTKDialView *)self markers];
      [v7 addObject:v6];

      [v6 addToParentView:self->_markerContainerView];
    }
    else
    {
      float v8 = [MEMORY[0x1E4F1CA98] null];
      float v9 = [(NTKDialView *)self markers];
      [v9 addObject:v8];
    }
  }
  double v10 = [(NTKDialView *)self markers];
  float v11 = [v10 objectAtIndexedSubscript:a3];

  float v12 = [MEMORY[0x1E4F1CA98] null];

  if (v11 == v12) {
    id v13 = 0;
  }
  else {
    id v13 = v11;
  }

  return v13;
}

- (double)angleForIndex:(double)a3
{
  double v5 = [(NTKDialView *)self angleProvider];

  if (v5
    && ([(NTKDialView *)self angleProvider],
        float v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(),
        v6[2](v6, (unint64_t)a3),
        float v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    [v7 floatValue];
    NTKNormalizeAngle();
    double v9 = v8;

    return v9;
  }
  else
  {
    [(NTKDialView *)self numberOfMarkers];
    NTKNormalizeAngle();
  }
  return result;
}

- (CGPoint)positionForMarkerAtIndex:(unint64_t)a3
{
  double v5 = [(NTKDialView *)self markers];
  unint64_t v6 = [v5 count];

  if (v6 > a3
    && ([(NTKDialView *)self markerAtIndex:a3],
        (float v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v8 = v7;
    [v7 position];
    double v13 = v10;
    double v14 = v9;
    [v8 _getAffineTransform];

    float64x2_t v11 = vaddq_f64(v17, vmlaq_n_f64(vmulq_n_f64(v16, v13), v15, v14));
  }
  else
  {
    float64x2_t v11 = *(float64x2_t *)MEMORY[0x1E4F1DAD8];
  }
  double v12 = v11.f64[1];
  result.x = v11.f64[0];
  result.y = v12;
  return result;
}

- (CGPoint)centerPointForAngle:(double)a3 radius:(int64_t)a4
{
  CLKDegreesToRadians();
  memset(&v8, 0, sizeof(v8));
  CGAffineTransformMakeRotation(&v8, v5);
  float64x2_t v6 = vaddq_f64(*(float64x2_t *)&v8.tx, vmlaq_f64(vmulq_n_f64(*(float64x2_t *)&v8.c, (double)-a4), (float64x2_t)0, *(float64x2_t *)&v8.a));
  double v7 = v6.f64[1];
  result.x = v6.f64[0];
  result.y = v7;
  return result;
}

- (double)contentInset
{
  return self->_contentInset;
}

- (double)contentDiameter
{
  return self->_contentDiameter;
}

- (void)setContentDiameter:(double)a3
{
  self->_contentDiameter = a3;
}

- (double)angleOffset
{
  return self->_angleOffset;
}

- (unint64_t)numberOfMarkers
{
  return self->_numberOfMarkers;
}

- (void)setNumberOfMarkers:(unint64_t)a3
{
  self->_numberOfMarkers = a3;
}

- (BOOL)shouldRotateMarkers
{
  return self->_shouldRotateMarkers;
}

- (void)setShouldRotateMarkers:(BOOL)a3
{
  self->_shouldRotateMarkers = a3;
}

- (NSIndexSet)markersToRotateIndexSet
{
  return self->_markersToRotateIndexSet;
}

- (void)setMarkersToRotateIndexSet:(id)a3
{
}

- (BOOL)shouldPixelAlignCenterPoints
{
  return self->_shouldPixelAlignCenterPoints;
}

- (void)setShouldPixelAlignCenterPoints:(BOOL)a3
{
  self->_shouldPixelAlignCenterPoints = a3;
}

- (NSNumber)hidingMaskStartAngle
{
  return self->_hidingMaskStartAngle;
}

- (NSNumber)hidingMaskEndAngle
{
  return self->_hidingMaskEndAngle;
}

- (UIView)markerContainerView
{
  return self->_markerContainerView;
}

- (void)setMarkerContainerView:(id)a3
{
}

- (BOOL)disableLayout
{
  return self->_disableLayout;
}

- (id)markerRotationProvider
{
  return self->_markerRotationProvider;
}

- (id)markersFactory
{
  return self->_markersFactory;
}

- (void)setMarkersFactory:(id)a3
{
}

- (id)angleProvider
{
  return self->_angleProvider;
}

- (void)setAngleProvider:(id)a3
{
}

- (double)diameter
{
  return self->_diameter;
}

- (NSMutableArray)markers
{
  return self->_markers;
}

- (void)setMarkers:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BOOL)needsLayoutMarkers
{
  return self->_needsLayoutMarkers;
}

- (void)setNeedsLayoutMarkers:(BOOL)a3
{
  self->_needsLayoutMarkers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_markers, 0);
  objc_storeStrong(&self->_angleProvider, 0);
  objc_storeStrong(&self->_markersFactory, 0);
  objc_storeStrong(&self->_markerRotationProvider, 0);
  objc_storeStrong((id *)&self->_markerContainerView, 0);
  objc_storeStrong((id *)&self->_hidingMaskEndAngle, 0);
  objc_storeStrong((id *)&self->_hidingMaskStartAngle, 0);
  objc_storeStrong((id *)&self->_markersToRotateIndexSet, 0);
}

@end
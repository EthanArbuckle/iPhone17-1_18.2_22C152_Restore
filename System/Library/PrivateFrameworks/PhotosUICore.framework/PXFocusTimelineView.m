@interface PXFocusTimelineView
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- (BOOL)_isEventWithinZoomRange:(id)a3;
- (BOOL)_isTickWithinActiveTrackRange:(double)a3;
- (BOOL)dimmed;
- (BOOL)skipLayoutUpdates;
- (BOOL)viewCanBeEnabled;
- (CGPoint)_closestTickPointToPointOnTrack:(CGPoint)a3;
- (CGPoint)_trackPointFromTimestamp:(id *)a3;
- (CGRect)_trackFrame;
- (CGSize)intrinsicContentSize;
- (PXFocusTimelineView)initWithFrame:(CGRect)a3;
- (PXFocusTimelineViewDelegate)delegate;
- (UIImage)autoFocusEventMarkerImage;
- (UIImage)userInitiatedFocusEventMarkerImage;
- (double)_zoomAdjustedTickGap;
- (id)_axDescriptionForFocusEvent:(id)a3;
- (id)_eventAtLocation:(CGPoint)a3 threshold:(double)a4;
- (id)_imageViewForFocusEvent:(id)a3;
- (void)_addEventToTimeline:(id)a3 atIndex:(unint64_t)a4;
- (void)_animateFocusChangeFrom:(id)a3 to:(id)a4 completion:(id)a5;
- (void)_updateTrack;
- (void)_updateTrackingProgress;
- (void)addFocusEvent:(id *)a3 userInitiated:(BOOL)a4 shouldAnimate:(BOOL)a5;
- (void)enableUIForCinematographyScriptLoad:(BOOL)a3;
- (void)handleEventSelectedAtLocation:(CGPoint)a3;
- (void)layoutSubviews;
- (void)objectTrackingFinishedWithSuccess:(BOOL)a3;
- (void)objectTrackingStartedAtTime:(id *)a3;
- (void)resetTimeline;
- (void)setDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setSkipLayoutUpdates:(BOOL)a3;
- (void)setTimeRange:(id *)a3;
- (void)setViewCanBeEnabled:(BOOL)a3;
- (void)setZoomMinValue:(double)a3 maxValue:(double)a4;
- (void)unzoom;
- (void)updateObjectTrackingProgressAtTime:(id *)a3 shouldStop:(BOOL *)a4;
- (void)updateTimeline;
@end

@implementation PXFocusTimelineView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_objectTrackingEvent, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_focusEventsView, 0);
  objc_storeStrong((id *)&self->_trackImageView, 0);
  objc_storeStrong((id *)&self->_animatableFocusEvents, 0);
  objc_storeStrong((id *)&self->_focusEvents, 0);
}

- (void)setViewCanBeEnabled:(BOOL)a3
{
  self->_viewCanBeEnabled = a3;
}

- (BOOL)viewCanBeEnabled
{
  return self->_viewCanBeEnabled;
}

- (BOOL)dimmed
{
  return self->_dimmed;
}

- (void)setSkipLayoutUpdates:(BOOL)a3
{
  self->_skipLayoutUpdates = a3;
}

- (BOOL)skipLayoutUpdates
{
  return self->_skipLayoutUpdates;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange
{
  long long v3 = *(_OWORD *)&self[11].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[10].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[11].var1.var0;
  return self;
}

- (void)setDelegate:(id)a3
{
}

- (PXFocusTimelineViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXFocusTimelineViewDelegate *)WeakRetained;
}

- (UIImage)userInitiatedFocusEventMarkerImage
{
  return 0;
}

- (UIImage)autoFocusEventMarkerImage
{
  return 0;
}

- (id)_axDescriptionForFocusEvent:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(PXFocusTimelineView *)self delegate];
    [v4 time];

    v6 = [v5 axDescriptionForFocusEventATime:v8];
  }
  else
  {
    v6 = &stru_1F00B0030;
  }
  return v6;
}

- (double)_zoomAdjustedTickGap
{
  double v2 = self->_zoomMaxValue - self->_zoomMinValue;
  BOOL v3 = v2 <= 0.0 || !self->_zoomed;
  double result = 3.0 / (1.0 / v2) + 1.0;
  if (v3) {
    return 4.0;
  }
  return result;
}

- (BOOL)_isTickWithinActiveTrackRange:(double)a3
{
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v6 = [v5 BOOLForKey:@"disableTimelineAnimations"];

  if ((v6 & 1) != 0 || ![(NSMutableArray *)self->_focusEvents count]) {
    return 0;
  }
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  focusEvents = self->_focusEvents;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__PXFocusTimelineView__isTickWithinActiveTrackRange___block_invoke;
  v10[3] = &unk_1E5DC31E8;
  *(double *)&v10[6] = a3;
  v10[4] = self;
  v10[5] = &v11;
  [(NSMutableArray *)focusEvents enumerateObjectsUsingBlock:v10];
  BOOL v8 = *((unsigned char *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

void __53__PXFocusTimelineView__isTickWithinActiveTrackRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  [v7 location];
  double v9 = v8;
  unint64_t v10 = a3 + 1;
  unint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 408) count];
  if (v11 <= v10)
  {
    v12 = 0;
  }
  else
  {
    v12 = [*(id *)(*(void *)(a1 + 32) + 408) objectAtIndexedSubscript:v10];
  }
  uint64_t v13 = *(unsigned char **)(a1 + 32);
  if (v13[480])
  {
    if (v7)
    {
      [v7 time];
    }
    else
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
    }
    [v13 _trackPointFromTimestamp:&v21];
    double v9 = v14;
  }
  double v15 = 0.0;
  if (v11 > v10)
  {
    v16 = *(unsigned char **)(a1 + 32);
    if (v16[480])
    {
      if (v12)
      {
        [v12 time];
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        uint64_t v20 = 0;
      }
      [v16 _trackPointFromTimestamp:&v18];
    }
    else
    {
      [v12 location];
    }
    double v15 = v17;
  }
  if (objc_msgSend(v7, "type", v18, v19, v20, v21, v22, v23) == 1
    && *(id *)(*(void *)(a1 + 32) + 472) != v7
    && ([v7 shouldAnimate] & 1) == 0
    && *(double *)(a1 + 48) >= v9
    && ([*(id *)(*(void *)(a1 + 32) + 408) count] == v10 || v11 > v10 && *(double *)(a1 + 48) <= v15))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)_isEventWithinZoomRange:(id)a3
{
  id v4 = a3;
  v5 = v4;
  memset(&v21, 0, sizeof(v21));
  double zoomMinValue = self->_zoomMinValue;
  if (v4)
  {
    [v4 time];
    LODWORD(v4) = v19;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  CMTimeMakeWithSeconds(&v21, zoomMinValue, (int32_t)v4);
  memset(&v17, 0, sizeof(v17));
  double zoomMaxValue = self->_zoomMaxValue;
  if (v5)
  {
    [v5 time];
    int32_t v8 = v15;
  }
  else
  {
    int32_t v8 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  CMTimeMakeWithSeconds(&v17, zoomMaxValue, v8);
  if (!self->_zoomed) {
    goto LABEL_17;
  }
  if (v5) {
    [v5 time];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime time1 = v21;
  if (CMTimeCompare(&time1, &time2) > 0) {
    goto LABEL_12;
  }
  if (v5) {
    [v5 time];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CMTime time1 = v17;
  if (CMTimeCompare(&time1, &v11) < 0) {
LABEL_12:
  }
    BOOL v9 = 1;
  else {
LABEL_17:
  }
    BOOL v9 = 0;

  return v9;
}

- (id)_eventAtLocation:(CGPoint)a3 threshold:(double)a4
{
  double x = a3.x;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3.x, a3.y);
  focusEvents = self->_focusEvents;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __50__PXFocusTimelineView__eventAtLocation_threshold___block_invoke;
  v31[3] = &unk_1E5DC31C0;
  double v33 = x;
  uint64_t v34 = 0x401C000000000000;
  double v35 = a4;
  id v9 = v7;
  id v32 = v9;
  [(NSMutableArray *)focusEvents enumerateObjectsUsingBlock:v31];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v10);
        }
        CMTime v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_msgSend(v17, "location", (void)v27);
        double v19 = v18 - x;
        if (v18 - x < a4)
        {
          id v20 = v17;

          uint64_t v14 = v20;
          a4 = v19;
        }
        if ([v17 type] == 1)
        {
          id v21 = v17;

          uint64_t v13 = v21;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }

  uint64_t v22 = [v14 type];
  if (v13) {
    BOOL v23 = v22 == 1;
  }
  else {
    BOOL v23 = 1;
  }
  if (v23) {
    v24 = v14;
  }
  else {
    v24 = v13;
  }
  id v25 = v24;

  return v25;
}

void __50__PXFocusTimelineView__eventAtLocation_threshold___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  [v12 location];
  double v7 = v6;
  double v8 = *(double *)(a1 + 40);
  double v9 = *(double *)(a1 + 48);
  double v10 = *(double *)(a1 + 56);
  if (v8 >= v7 - v9 - v10 && v8 <= v7 + v9 + v10)
  {
    [*(id *)(a1 + 32) addObject:v12];
    double v8 = *(double *)(a1 + 40);
    double v9 = *(double *)(a1 + 48);
    double v10 = *(double *)(a1 + 56);
  }
  if (v7 > v8 + v9 + v10) {
    *a4 = 1;
  }
}

- (CGPoint)_closestTickPointToPointOnTrack:(CGPoint)a3
{
  CGFloat y = a3.y;
  double x = a3.x;
  [(PXFocusTimelineView *)self _zoomAdjustedTickGap];
  double v6 = v5 * round(x / v5);
  double v7 = y;
  result.CGFloat y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)_trackPointFromTimestamp:(id *)a3
{
  int64_t var0 = a3->var0;
  [(PXFocusTimelineView *)self _trackFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  CGFloat v13 = v12;
  [(PXFocusTimelineView *)self timeRange];
  double v14 = (double)v25;
  [(PXFocusTimelineView *)self timeRange];
  double v15 = (double)v24;
  CMTimeMakeWithSeconds(&v23, self->_zoomMinValue, a3->var1);
  double value = (double)v23.value;
  CMTimeMakeWithSeconds(&v22, self->_zoomMaxValue, a3->var1);
  double v17 = (double)v22.value - value;
  if (self->_zoomed && v17 > 0.0)
  {
    double v18 = value;
  }
  else
  {
    double v17 = v14;
    double v18 = v15;
  }
  double v19 = v11 * (((double)var0 - v18) / v17);
  v27.origin.double x = v7;
  v27.origin.CGFloat y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  double MidY = CGRectGetMidY(v27);
  double v21 = v19;
  result.CGFloat y = MidY;
  result.double x = v21;
  return result;
}

- (CGRect)_trackFrame
{
  [(PXFocusTimelineView *)self bounds];
  double v3 = v2 + -14.0;
  double v5 = v4 + 7.0;
  *(float *)&double v6 = (v6 + -6.0) * 0.5;
  double v8 = v7 + roundf(*(float *)&v6);
  double v9 = 6.0;
  return CGRectIntegral(*(CGRect *)&v5);
}

- (void)_updateTrackingProgress
{
  objectTrackingEvent = self->_objectTrackingEvent;
  if (objectTrackingEvent && (self->_currentTrackingTime.flags & 1) != 0)
  {
    [(PXFocusTimelineEvent *)objectTrackingEvent location];
    double v5 = v4;
    long long v12 = *(_OWORD *)&self->_currentTrackingTime.value;
    int64_t epoch = self->_currentTrackingTime.epoch;
    [(PXFocusTimelineView *)self _trackPointFromTimestamp:&v12];
    double v7 = v6 - v5;
    [(PXFocusTimelineView *)self _trackFrame];
    CGFloat x = v14.origin.x;
    CGFloat y = v14.origin.y;
    CGFloat width = v14.size.width;
    CGFloat height = v14.size.height;
    CGRectGetMidY(v14);
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    CGRectGetMaxX(v15);
    if (v7 > 0.0) {
      -[UIView setFrame:](self->_progressView, "setFrame:");
    }
  }
}

- (void)_animateFocusChangeFrom:(id)a3 to:(id)a4 completion:(id)a5
{
  v61[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v39 = [(PXFocusTimelineView *)self _imageViewForFocusEvent:v8];
  v38 = [v39 layer];
  [v38 setOpacity:0.0];
  [(UIView *)self->_focusEventsView addSubview:v39];
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__187045;
  v59 = __Block_byref_object_dispose__187046;
  id v11 = v9;
  id v60 = v11;
  if (v11) {
    goto LABEL_3;
  }
  focusEvents = self->_focusEvents;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke;
  v51[3] = &unk_1E5DC3170;
  id v52 = v8;
  v53 = self;
  v54 = &v55;
  [(NSMutableArray *)focusEvents enumerateObjectsUsingBlock:v51];
  id v11 = (id)v56[5];

  if (v11)
  {
LABEL_3:
    CGFloat v13 = [(PXFocusTimelineView *)self _imageViewForFocusEvent:v11];
    uint64_t v37 = [v13 layer];
    if ([v11 shouldAnimate]) {
      [v37 setOpacity:0.0];
    }
    [(UIView *)self->_focusEventsView addSubview:v13];
  }
  else
  {
    uint64_t v37 = 0;
    CGFloat v13 = 0;
  }
  uint64_t v14 = [(NSMutableArray *)self->_animatableFocusEvents indexOfObject:v8];
  unint64_t v15 = [(NSMutableArray *)self->_animatableFocusEvents count];
  int v16 = 0;
  if (v14 && v15 > v14 - 1)
  {
    double v17 = -[NSMutableArray objectAtIndexedSubscript:](self->_animatableFocusEvents, "objectAtIndexedSubscript:");
    int v16 = [v17 shouldAnimate];
  }
  [MEMORY[0x1E4F39CF8] begin];
  LODWORD(v18) = 1036831949;
  LODWORD(v19) = 0.25;
  LODWORD(v20) = 0.25;
  LODWORD(v21) = 1.0;
  CMTime v22 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v19 :v18 :v20 :v21];
  id v23 = objc_alloc_init(MEMORY[0x1E4F39B38]);
  [v23 setBeginTime:CACurrentMediaTime() + 0.3];
  [v23 setRemovedOnCompletion:0];
  [v23 setFillMode:*MEMORY[0x1E4F39FA8]];
  uint64_t v24 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v24 setDuration:0.3];
  [v24 setTimingFunction:v22];
  [v24 setFromValue:&unk_1F02DA380];
  [v24 setToValue:&unk_1F02DA390];
  uint64_t v25 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v25 setStiffness:600.0];
  [v25 setDamping:20.0];
  [v25 setFromValue:&unk_1F02DA3A0];
  [v25 setToValue:&unk_1F02D8F98];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke_65;
  aBlock[3] = &unk_1E5DC3198;
  id v26 = v8;
  id v43 = v26;
  v44 = self;
  id v27 = v11;
  id v45 = v27;
  id v28 = v22;
  id v46 = v28;
  id v29 = v24;
  id v47 = v29;
  id v30 = v25;
  id v48 = v30;
  id v31 = v10;
  id v50 = v31;
  id v32 = v13;
  id v49 = v32;
  double v33 = _Block_copy(aBlock);
  uint64_t v34 = v33;
  if (v16)
  {
    (*((void (**)(void *))v33 + 2))(v33);
  }
  else
  {
    v61[0] = v29;
    v61[1] = v30;
    double v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    [v23 setAnimations:v35];

    v36 = (void *)MEMORY[0x1E4F39CF8];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke_77;
    v40[3] = &unk_1E5DD3128;
    id v41 = v34;
    [v36 setCompletionBlock:v40];
    [v38 addAnimation:v23 forKey:@"appearAnimations"];
    [MEMORY[0x1E4F39CF8] commit];
  }
  _Block_object_dispose(&v55, 8);
}

void __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1[4] == a2)
  {
    uint64_t v4 = a3 + 1;
    if (a3 + 1 < (unint64_t)[*(id *)(a1[5] + 408) count])
    {
      uint64_t v5 = [*(id *)(a1[5] + 408) objectAtIndexedSubscript:v4];
      uint64_t v6 = *(void *)(a1[6] + 8);
      double v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
  }
}

void __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke_65(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4F39C68] layer];
  [*(id *)(a1 + 32) location];
  objc_msgSend(*(id *)(a1 + 40), "_closestTickPointToPointOnTrack:");
  double v4 = v3 + 1.0;
  uint64_t v5 = *(void **)(a1 + 48);
  if (v5)
  {
    [v5 location];
  }
  else
  {
    [*(id *)(a1 + 40) _trackFrame];
    double MaxX = CGRectGetMaxX(v33);
  }
  double v7 = MaxX - v4 + 7.0;
  [*(id *)(a1 + 40) _zoomAdjustedTickGap];
  CGFloat v9 = v8;
  unint64_t v10 = (unint64_t)(v7 / v8);
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, v7, 6.0);
  objc_msgSend(v2, "setPosition:", v4 + v7 * 0.5, 4.0);
  [v2 setInstanceCount:v10];
  [v2 setInstanceDelay:0.005];
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v31.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v31.m33 = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v31.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v31.m43 = v12;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v31.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v31.m13 = v13;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v31.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v31.m23 = v14;
  CATransform3DTranslate(&v32, &v31, v9, 0.0, 0.0);
  CATransform3D v30 = v32;
  [v2 setInstanceTransform:&v30];
  unint64_t v15 = [MEMORY[0x1E4F39BE8] layer];
  [v15 setOpacity:0.0];
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, 1.0, 4.0);
  objc_msgSend(v15, "setPosition:", 0.0, 2.0);
  id v16 = [MEMORY[0x1E4FB1618] systemYellowColor];
  objc_msgSend(v15, "setBackgroundColor:", objc_msgSend(v16, "CGColor"));
  [v2 addSublayer:v15];
  double v17 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v17 setDuration:0.1];
  [v17 setTimingFunction:*(void *)(a1 + 56)];
  [v17 setFromValue:&unk_1F02DA380];
  [v17 setToValue:&unk_1F02DA390];
  [v17 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v17 setRemovedOnCompletion:0];
  double v18 = [*(id *)(*(void *)(a1 + 40) + 424) layer];
  [v18 addSublayer:v2];

  double v19 = *(void **)(a1 + 48);
  if (v19)
  {
    double v20 = (void *)MEMORY[0x1E4F39CF8];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke_2;
    v22[3] = &unk_1E5DC79E8;
    unint64_t v28 = v10;
    uint64_t v29 = 0x3F747AE147AE147BLL;
    id v23 = v19;
    id v24 = *(id *)(a1 + 64);
    id v25 = *(id *)(a1 + 72);
    id v27 = *(id *)(a1 + 88);
    id v26 = *(id *)(a1 + 80);
    [v20 setCompletionBlock:v22];
  }
  else
  {
    dispatch_time_t v21 = dispatch_time(0, (uint64_t)((double)v10 * 0.005 * 1000000000.0));
    dispatch_after(v21, MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 88));
  }
  [v15 addAnimation:v17 forKey:@"opacityAnimation"];
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke_77(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

void __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke_2(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] begin];
  id v2 = objc_alloc_init(MEMORY[0x1E4F39B38]);
  [v2 setBeginTime:CACurrentMediaTime() + (double)*(unint64_t *)(a1 + 72) * *(double *)(a1 + 80)];
  [v2 setRemovedOnCompletion:0];
  [v2 setFillMode:*MEMORY[0x1E4F39FA8]];
  if ([*(id *)(a1 + 32) shouldAnimate])
  {
    double v3 = (void *)[*(id *)(a1 + 40) copy];
    double v4 = (void *)[*(id *)(a1 + 48) copy];
    v8[0] = v3;
    v8[1] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
    [v2 setAnimations:v5];
  }
  else
  {
    double v3 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
    [v3 setStiffness:600.0];
    [v3 setDamping:20.0];
    [v3 setFromValue:&unk_1F02DA3B0];
    [v3 setToValue:&unk_1F02D8F98];
    double v7 = v3;
    double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    [v2 setAnimations:v4];
  }

  [MEMORY[0x1E4F39CF8] setCompletionBlock:*(void *)(a1 + 64)];
  uint64_t v6 = [*(id *)(a1 + 56) layer];
  [v6 addAnimation:v2 forKey:@"appearAnimations"];
  [MEMORY[0x1E4F39CF8] commit];
}

- (id)_imageViewForFocusEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    [v4 time];
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  [(PXFocusTimelineView *)self _trackPointFromTimestamp:v13];
  double v7 = v6;
  double v9 = v8;
  objc_msgSend(v5, "setLocation:");
  if ([v5 type]) {
    [(PXFocusTimelineView *)self userInitiatedFocusEventMarkerImage];
  }
  else {
  unint64_t v10 = [(PXFocusTimelineView *)self autoFocusEventMarkerImage];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  objc_msgSend(v11, "setFrame:", v7, v9 + -7.0, 14.0, 14.0);
  [v11 setImage:v10];

  return v11;
}

- (void)_addEventToTimeline:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if (![(PXFocusTimelineView *)self _isEventWithinZoomRange:v6])
  {
    double v7 = [(PXFocusTimelineView *)self _imageViewForFocusEvent:v6];
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v22[3] = a4;
    unint64_t v8 = [(NSMutableArray *)self->_animatableFocusEvents count];
    unint64_t v9 = v8;
    char v10 = 0;
    if (a4 && v8 > a4 - 1)
    {
      id v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_animatableFocusEvents, "objectAtIndexedSubscript:");
      char v10 = [v11 shouldAnimate];
    }
    if (v9 <= a4 + 1)
    {
      long long v12 = 0;
    }
    else
    {
      long long v12 = [(NSMutableArray *)self->_animatableFocusEvents objectAtIndexedSubscript:a4 + 1];
    }
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PXFocusTimelineView__addEventToTimeline_atIndex___block_invoke;
    aBlock[3] = &unk_1E5DC3148;
    objc_copyWeak(v20, &location);
    double v19 = v22;
    v20[1] = (id)(v9 - 1);
    id v13 = v12;
    id v18 = v13;
    v20[2] = (id)(a4 + 1);
    long long v14 = (void (**)(void))_Block_copy(aBlock);
    if ([v6 shouldAnimate])
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51__PXFocusTimelineView__addEventToTimeline_atIndex___block_invoke_3;
      v15[3] = &unk_1E5DD3128;
      id v16 = v14;
      [(PXFocusTimelineView *)self _animateFocusChangeFrom:v6 to:v13 completion:v15];
    }
    else
    {
      if ((v10 & 1) == 0) {
        [(UIView *)self->_focusEventsView addSubview:v7];
      }
      v14[2](v14);
    }

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);

    _Block_object_dispose(v22, 8);
  }
}

void __51__PXFocusTimelineView__addEventToTimeline_atIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == *(void *)(a1 + 56))
    {
      id v4 = WeakRetained;
      [WeakRetained[52] enumerateObjectsUsingBlock:&__block_literal_global_187075];
      [v4 _updateTrack];
    }
    else
    {
      uint64_t v3 = *(void *)(a1 + 32);
      if (!v3) {
        goto LABEL_7;
      }
      id v4 = WeakRetained;
      [WeakRetained _addEventToTimeline:v3 atIndex:*(void *)(a1 + 64)];
    }
    id WeakRetained = v4;
  }
LABEL_7:
}

uint64_t __51__PXFocusTimelineView__addEventToTimeline_atIndex___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__PXFocusTimelineView__addEventToTimeline_atIndex___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setShouldAnimate:0];
}

- (void)updateTimeline
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(PXFocusTimelineView *)self timeRange];
  if ((v22 & 1) != 0 && [(NSMutableArray *)self->_focusEvents count])
  {
    uint64_t v3 = [(UIView *)self->_focusEventsView subviews];
    id v4 = (void *)[v3 copy];
    [v4 makeObjectsPerformSelector:sel_removeFromSuperview];

    uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    LODWORD(v4) = [v5 BOOLForKey:@"disableTimelineAnimations"];

    if (v4)
    {
      focusEvents = self->_focusEvents;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __37__PXFocusTimelineView_updateTimeline__block_invoke;
      v21[3] = &unk_1E5DC3100;
      v21[4] = self;
      [(NSMutableArray *)focusEvents enumerateObjectsUsingBlock:v21];
    }
    else
    {
      double v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_focusEvents];
      [v7 removeObjectsInArray:self->_animatableFocusEvents];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __37__PXFocusTimelineView_updateTimeline__block_invoke_2;
      id v20[3] = &unk_1E5DC3100;
      v20[4] = self;
      [v7 enumerateObjectsUsingBlock:v20];
      [(PXFocusTimelineView *)self _updateTrack];
      if ([(NSMutableArray *)self->_animatableFocusEvents count])
      {
        unint64_t v8 = [(NSMutableArray *)self->_animatableFocusEvents objectAtIndexedSubscript:0];
        [(PXFocusTimelineView *)self _addEventToTimeline:v8 atIndex:0];
      }
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unint64_t v9 = self->_focusEvents;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v14, "type", (void)v16) == 1)
          {
            unint64_t v15 = [(PXFocusTimelineView *)self _imageViewForFocusEvent:v14];
            [(UIView *)self->_focusEventsView bringSubviewToFront:v15];
          }
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v23 count:16];
      }
      while (v11);
    }
  }
}

void __37__PXFocusTimelineView_updateTimeline__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isEventWithinZoomRange:") & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _imageViewForFocusEvent:v4];
    [*(id *)(*(void *)(a1 + 32) + 432) addSubview:v3];
  }
}

void __37__PXFocusTimelineView_updateTimeline__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isEventWithinZoomRange:") & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _imageViewForFocusEvent:v4];
    [*(id *)(*(void *)(a1 + 32) + 432) addSubview:v3];
  }
}

- (void)_updateTrack
{
  uint64_t v3 = [(UIImageView *)self->_trackImageView layer];
  id v4 = [v3 sublayers];
  uint64_t v5 = (void *)[v4 copy];
  [v5 makeObjectsPerformSelector:sel_removeFromSuperlayer];

  [(PXFocusTimelineView *)self _trackFrame];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 scale];
  double v12 = v11;

  int v13 = vcvtpd_s64_f64(v7 * v12);
  int v14 = vcvtpd_s64_f64(v9 * v12);
  [(PXFocusTimelineView *)self timeRange];
  CMTime time = v45;
  double Seconds = CMTimeGetSeconds(&time);
  [(PXFocusTimelineView *)self timeRange];
  CMTime v44 = v43;
  double v16 = CMTimeGetSeconds(&v44);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  long long v18 = CGBitmapContextCreate(0, v13, v14, 8uLL, 0, DeviceRGB, 2u);
  CGColorSpaceRelease(DeviceRGB);
  if (v18)
  {
    v47.size.CGFloat width = (double)v13;
    v47.origin.CGFloat x = 0.0;
    v47.origin.CGFloat y = 0.0;
    v47.size.CGFloat height = (double)v14;
    CGContextClearRect(v18, v47);
    CGContextTranslateCTM(v18, 0.0, (double)v14);
    CGContextScaleCTM(v18, v12, -v12);
    CGContextGetCTM(&v42, v18);
    CGContextSetBaseCTM();
  }
  long long v19 = [MEMORY[0x1E4FB1618] systemYellowColor];
  double v20 = [MEMORY[0x1E4FB1618] labelColor];
  dispatch_time_t v21 = [(PXFocusTimelineView *)self traitCollection];
  char v22 = [v20 resolvedColorWithTraitCollection:v21];
  id v23 = [v22 colorWithAlphaComponent:0.6];
  uint64_t v24 = (CGColor *)[v23 CGColor];

  id v25 = [(PXFocusTimelineView *)self traitCollection];
  id v26 = [v19 resolvedColorWithTraitCollection:v25];
  id v27 = (CGColor *)[v26 CGColor];

  double v28 = 1.0;
  CGContextSetLineWidth(v18, 1.0);
  if (self->_zoomed)
  {
    double zoomMinValue = self->_zoomMinValue;
    if (zoomMinValue > v16) {
      double v30 = 2.0;
    }
    else {
      double v30 = 0.0;
    }
    if (zoomMinValue > v16) {
      double v31 = 2.0;
    }
    else {
      double v31 = 6.0;
    }
  }
  else
  {
    double v31 = 6.0;
    double v30 = 0.0;
  }
  CGContextBeginPath(v18);
  if ([(PXFocusTimelineView *)self _isTickWithinActiveTrackRange:1.0]) {
    CATransform3D v32 = v27;
  }
  else {
    CATransform3D v32 = v24;
  }
  CGContextSetStrokeColorWithColor(v18, v32);
  CGContextMoveToPoint(v18, 1.0, v30);
  CGContextAddLineToPoint(v18, 1.0, v30 + v31);
  CGContextStrokePath(v18);
  [(PXFocusTimelineView *)self _zoomAdjustedTickGap];
  double v34 = v7 - v33;
  if (v7 - v33 > 1.0)
  {
    double v35 = v33;
    do
    {
      double v28 = v35 + v28;
      CGContextBeginPath(v18);
      if ([(PXFocusTimelineView *)self _isTickWithinActiveTrackRange:v28])
      {
        CGContextSetStrokeColorWithColor(v18, v27);
        CGContextMoveToPoint(v18, v28, 1.0);
        CGContextAddLineToPoint(v18, v28, 5.0);
      }
      else
      {
        CGContextMoveToPoint(v18, v28, 2.0);
        CGContextAddLineToPoint(v18, v28, 4.0);
        CGContextSetStrokeColorWithColor(v18, v24);
      }
      CGContextStrokePath(v18);
    }
    while (v28 < v34);
  }
  if (!self->_zoomed || (v36 = Seconds + v16, double v37 = 2.0, v38 = 2.0, self->_zoomMaxValue >= v36))
  {
    double v28 = v7 + -1.0;
    double v38 = 6.0;
    double v37 = 0.0;
  }
  CGContextBeginPath(v18);
  if ([(PXFocusTimelineView *)self _isTickWithinActiveTrackRange:v28]) {
    v39 = v27;
  }
  else {
    v39 = v24;
  }
  CGContextSetStrokeColorWithColor(v18, v39);
  CGContextMoveToPoint(v18, v28, v37);
  CGContextAddLineToPoint(v18, v28, v37 + v38);
  CGContextStrokePath(v18);
  Image = CGBitmapContextCreateImage(v18);
  CGContextRelease(v18);
  id v41 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image scale:0 orientation:v12];
  CGImageRelease(Image);
  [(UIImageView *)self->_trackImageView setImage:v41];
}

- (void)objectTrackingFinishedWithSuccess:(BOOL)a3
{
  id v4 = [(PXFocusTimelineView *)self delegate];
  [v4 hideFocusTimelineActions:self];

  self->_currentTrackingTime = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1F9F8];
  -[UIView setFrame:](self->_progressView, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PXFocusTimelineView *)self setUserInteractionEnabled:1];
}

- (void)updateObjectTrackingProgressAtTime:(id *)a3 shouldStop:(BOOL *)a4
{
  if (self->_objectTrackingEvent && (a3->var2 & 1) != 0)
  {
    long long v7 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&range.start.double value = *(_OWORD *)&self->_timeRange.start.value;
    *(_OWORD *)&range.start.int64_t epoch = v7;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    CMTime v10 = *(CMTime *)a3;
    if (CMTimeRangeContainsTime(&range, &v10))
    {
      double v8 = [(PXFocusTimelineView *)self delegate];
      [v8 focusTimeline:self updateTrackingProgressShouldStop:a4];

      int64_t var3 = a3->var3;
      *(_OWORD *)&self->_currentTrackingTime.double value = *(_OWORD *)&a3->var0;
      self->_currentTrackingTime.int64_t epoch = var3;
      [(PXFocusTimelineView *)self _updateTrackingProgress];
    }
  }
}

- (void)objectTrackingStartedAtTime:(id *)a3
{
  if (a3->var2)
  {
    long long v5 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&range.start.double value = *(_OWORD *)&self->_timeRange.start.value;
    *(_OWORD *)&range.start.int64_t epoch = v5;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    CMTime time = *(CMTime *)a3;
    if (CMTimeRangeContainsTime(&range, &time))
    {
      if (!self->_objectTrackingEvent)
      {
        double v6 = [PXFocusTimelineEvent alloc];
        *(_OWORD *)&range.start.double value = *(_OWORD *)&a3->var0;
        range.start.int64_t epoch = a3->var3;
        long long v7 = [(PXFocusTimelineEvent *)v6 initWithTime:&range type:1];
        objectTrackingEvent = self->_objectTrackingEvent;
        self->_objectTrackingEvent = v7;

        [(NSMutableArray *)self->_focusEvents addObject:self->_objectTrackingEvent];
        [(PXFocusTimelineView *)self updateTimeline];
      }
      double v9 = objc_alloc_init(PXFocusTimelineAction);
      long long v11 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      [(PXFocusTimelineAction *)v9 setTime:&v11];
      [(PXFocusTimelineAction *)v9 setKind:1];
      CMTime v10 = [(PXFocusTimelineView *)self delegate];
      [(PXFocusTimelineEvent *)self->_objectTrackingEvent location];
      objc_msgSend(v10, "focusTimeline:presentAction:locationInTimeline:", self, v9);

      [(PXFocusTimelineView *)self setUserInteractionEnabled:0];
    }
  }
}

- (void)enableUIForCinematographyScriptLoad:(BOOL)a3
{
  self->_viewCanBeEnabled = a3;
  [(PXFocusTimelineView *)self setDimmed:!a3];
}

- (void)setDimmed:(BOOL)a3
{
  BOOL v3 = !self->_viewCanBeEnabled || a3;
  if (self->_dimmed != v3)
  {
    self->_dimmed = v3;
    [(PXFocusTimelineView *)self setUserInteractionEnabled:!v3];
    double v5 = 0.3;
    if (!v3) {
      double v5 = 1.0;
    }
    [(PXFocusTimelineView *)self setAlpha:v5];
  }
}

- (void)resetTimeline
{
  [(NSMutableArray *)self->_focusEvents removeAllObjects];
  [(NSMutableArray *)self->_animatableFocusEvents removeAllObjects];
  [(PXFocusTimelineView *)self setNeedsLayout];
  [(PXFocusTimelineView *)self layoutIfNeeded];
}

- (void)setTimeRange:(id *)a3
{
  if ((a3->var0.var2 & 1) != 0
    && (a3->var1.var2 & 1) != 0
    && !a3->var1.var3
    && (a3->var1.var0 & 0x8000000000000000) == 0)
  {
    p_timeRange = &self->_timeRange;
    long long v6 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range1.start.double value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range1.start.int64_t epoch = v6;
    *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a3->var1.var1;
    long long v7 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&v10.start.double value = *(_OWORD *)&self->_timeRange.start.value;
    *(_OWORD *)&v10.start.int64_t epoch = v7;
    *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    if (!CMTimeRangeEqual(&range1, &v10))
    {
      long long v8 = *(_OWORD *)&a3->var0.var0;
      long long v9 = *(_OWORD *)&a3->var1.var1;
      *(_OWORD *)&p_timeRange->start.int64_t epoch = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&p_timeRange->duration.timescale = v9;
      *(_OWORD *)&p_timeRange->start.double value = v8;
      [(PXFocusTimelineView *)self updateTimeline];
    }
  }
}

- (void)addFocusEvent:(id *)a3 userInitiated:(BOOL)a4 shouldAnimate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v8 = a4;
  long long v9 = [PXFocusTimelineEvent alloc];
  CMTime time2 = *(CMTime *)a3;
  CMTimeRange v10 = [(PXFocusTimelineEvent *)v9 initWithTime:&time2 type:v8];
  long long v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v12 = [v11 BOOLForKey:@"disableTimelineAnimations"];

  if ((v12 & 1) == 0)
  {
    if (v5)
    {
      objectTrackingEvent = self->_objectTrackingEvent;
      if (!objectTrackingEvent
        || ([(PXFocusTimelineEvent *)objectTrackingEvent time], CMTime time2 = (CMTime)*a3,
                                                                       CMTimeCompare(&time1, &time2)))
      {
        [(PXFocusTimelineEvent *)v10 setShouldAnimate:1];
        [(NSMutableArray *)self->_animatableFocusEvents addObject:v10];
        goto LABEL_8;
      }
      int v14 = self->_objectTrackingEvent;
      self->_objectTrackingEvent = 0;
    }
    [(PXFocusTimelineEvent *)v10 setShouldAnimate:0];
  }
LABEL_8:
  CMTime time2 = (CMTime)*a3;
  [(PXFocusTimelineView *)self _trackPointFromTimestamp:&time2];
  -[PXFocusTimelineEvent setLocation:](v10, "setLocation:");
  [(NSMutableArray *)self->_focusEvents addObject:v10];
}

- (void)handleEventSelectedAtLocation:(CGPoint)a3
{
  id v4 = -[PXFocusTimelineView _eventAtLocation:threshold:](self, "_eventAtLocation:threshold:", a3.x, a3.y, 10.0);
  if (v4)
  {
    BOOL v5 = objc_alloc_init(PXFocusTimelineAction);
    [v4 time];
    long long v7 = v9;
    uint64_t v8 = v10;
    [(PXFocusTimelineAction *)v5 setTime:&v7];
    -[PXFocusTimelineAction setKind:](v5, "setKind:", 2 * ([v4 type] != 1));
    long long v6 = [(PXFocusTimelineView *)self delegate];
    [v4 location];
    objc_msgSend(v6, "focusTimeline:presentAction:locationInTimeline:", self, v5);
  }
}

- (void)unzoom
{
  self->_zoomed = 0;
  [(PXFocusTimelineView *)self setNeedsLayout];
  [(PXFocusTimelineView *)self layoutIfNeeded];
}

- (void)setZoomMinValue:(double)a3 maxValue:(double)a4
{
  self->_zoomed = 1;
  self->_double zoomMinValue = a3;
  self->_double zoomMaxValue = a4;
  [(PXFocusTimelineView *)self setNeedsLayout];
  [(PXFocusTimelineView *)self layoutIfNeeded];
}

- (CGSize)intrinsicContentSize
{
  [(PXFocusTimelineView *)self bounds];
  -[PXFocusTimelineView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXFocusTimelineView;
  [(PXFocusTimelineView *)&v3 layoutSubviews];
  if (![(PXFocusTimelineView *)self skipLayoutUpdates])
  {
    [(PXFocusTimelineView *)self _trackFrame];
    -[UIImageView setFrame:](self->_trackImageView, "setFrame:");
    [(PXFocusTimelineView *)self _updateTrack];
    [(PXFocusTimelineView *)self bounds];
    -[UIView setFrame:](self->_focusEventsView, "setFrame:");
    [(PXFocusTimelineView *)self updateTimeline];
    [(PXFocusTimelineView *)self _updateTrackingProgress];
  }
}

- (PXFocusTimelineView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)PXFocusTimelineView;
  objc_super v3 = -[PXFocusTimelineView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PXFocusTimelineView *)v3 setOpaque:0];
    [(PXFocusTimelineView *)v4 setDimmed:1];
    v4->_viewCanBeEnabled = 1;
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    focusEvents = v4->_focusEvents;
    v4->_focusEvents = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    animatableFocusEvents = v4->_animatableFocusEvents;
    v4->_animatableFocusEvents = (NSMutableArray *)v7;

    uint64_t v9 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v4->_currentTrackingTime.double value = *MEMORY[0x1E4F1F9F8];
    v4->_currentTrackingTime.int64_t epoch = *(void *)(v9 + 16);
    objectTrackingEvent = v4->_objectTrackingEvent;
    v4->_objectTrackingEvent = 0;

    v4->_double zoomMinValue = 0.0;
    v4->_double zoomMaxValue = 0.0;
    id v11 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
    trackImageView = v4->_trackImageView;
    v4->_trackImageView = (UIImageView *)v16;

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v12, v13, v14, v15);
    focusEventsView = v4->_focusEventsView;
    v4->_focusEventsView = (UIView *)v18;

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v12, v13, v14, v15);
    progressView = v4->_progressView;
    v4->_progressView = (UIView *)v20;

    char v22 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [(UIView *)v4->_progressView setBackgroundColor:v22];
    [(PXFocusTimelineView *)v4 addSubview:v4->_trackImageView];
    [(PXFocusTimelineView *)v4 addSubview:v4->_progressView];
    [(PXFocusTimelineView *)v4 addSubview:v4->_focusEventsView];
  }
  return v4;
}

@end
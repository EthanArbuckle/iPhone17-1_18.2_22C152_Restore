@interface SBFluidScrunchGestureRecognizer
+ (id)_panTemplatesForTouchType:(int64_t)a3 displayConfiguration:(id)a4;
+ (id)_scrunchTemplatesForTouchType:(int64_t)a3 displayConfiguration:(id)a4;
+ (void)_rotateTemplates:(id)a3 forDisplayConfiguration:(id)a4;
- (BOOL)_isMatchedTemplateScrunchTemplate;
- (BOOL)_shouldAddNewTouchesAfterGestureRecognition;
- (CGPoint)_centroidInGestureViewForPolygon:(id)a3;
- (CGPoint)absoluteTranslation;
- (CGPoint)additionalTranslationDueToChangingAnchorPoints;
- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3;
- (CGPoint)centroid;
- (CGPoint)initialCentroid;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)translationInView:(id)a3;
- (CGPoint)translationWithoutConsideringScaleInView:(id)a3;
- (CGPoint)velocityInView:(id)a3;
- (FBSDisplayConfiguration)displayConfiguration;
- (SBFluidScrunchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (SBFluidScrunchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 displayConfiguration:(id)a5;
- (SBTouchHistory)touchHistory;
- (double)_hysteresis;
- (double)absoluteScale;
- (double)animationDistance;
- (double)averageTouchPathAngleOverTimeDuration:(double)a3;
- (double)incrementalGestureMotionForCandidate:(id)a3 withTransformAnalyzerInfo:(id)a4;
- (double)lastPerimeter;
- (double)peakSpeed;
- (id)_gestureView;
- (int64_t)recognizedTouchType;
- (void)_computeGestureMotionWithTouches:(id)a3 polygon:(id)a4;
- (void)_installTemplatesForDisplayConfiguration:(id)a3;
- (void)_setMatchedPolygon:(id)a3;
- (void)_updateRecognizedTouchTypeIfNecessaryWithTouches:(id)a3;
- (void)reset;
- (void)setAbsoluteScale:(double)a3;
- (void)setAbsoluteTranslation:(CGPoint)a3;
- (void)setAdditionalTranslationDueToChangingAnchorPoints:(CGPoint)a3;
- (void)setAllowedTouchTypes:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setInitialCentroid:(CGPoint)a3;
- (void)setLastPerimeter:(double)a3;
- (void)setState:(int64_t)a3;
- (void)setTouchHistory:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SBFluidScrunchGestureRecognizer

- (SBFluidScrunchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  return [(SBFluidScrunchGestureRecognizer *)self initWithTarget:a3 action:a4 displayConfiguration:0];
}

- (SBFluidScrunchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 displayConfiguration:(id)a5
{
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBFluidScrunchGestureRecognizer;
  v10 = [(SBTouchTemplateGestureRecognizer *)&v15 initWithTarget:a3 action:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_displayConfiguration, a5);
    [(SBFluidScrunchGestureRecognizer *)v11 _installTemplatesForDisplayConfiguration:v9];
    v12 = objc_alloc_init(SBTouchHistory);
    touchHistory = v11->_touchHistory;
    v11->_touchHistory = v12;
  }
  return v11;
}

- (void)setAllowedTouchTypes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBFluidScrunchGestureRecognizer;
  [(SBFluidScrunchGestureRecognizer *)&v4 setAllowedTouchTypes:a3];
  [(SBFluidScrunchGestureRecognizer *)self _installTemplatesForDisplayConfiguration:self->_displayConfiguration];
}

- (void)setState:(int64_t)a3
{
  if (a3 == 1)
  {
    CGPoint v5 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    self->_absoluteTranslation = (CGPoint)*MEMORY[0x1E4F1DAD8];
    self->_absoluteScale = 1.0;
    self->_additionalTranslationDueToChangingAnchorPoints = v5;
    v6 = [(SBTouchTemplateGestureRecognizer *)self _matchedPolygon];
    [(SBFluidScrunchGestureRecognizer *)self _centroidInGestureViewForPolygon:v6];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [v6 _perimeter];
    self->_lastPerimeter = v11;
    self->_initialCentroid.x = v8;
    self->_initialCentroid.y = v10;
  }
  v12.receiver = self;
  v12.super_class = (Class)SBFluidScrunchGestureRecognizer;
  [(SBTouchTemplateGestureRecognizer *)&v12 setState:a3];
}

- (void)_setMatchedPolygon:(id)a3
{
  id v4 = a3;
  CGPoint v5 = [(SBTouchTemplateGestureRecognizer *)self _matchedPolygon];

  if (v4 && !v5)
  {
    [(SBFluidScrunchGestureRecognizer *)self _centroidInGestureViewForPolygon:v4];
    self->_initialCentroid.x = v6;
    self->_initialCentroid.y = v7;
    [v4 _perimeter];
    self->_lastPerimeter = v8;
  }
  v9.receiver = self;
  v9.super_class = (Class)SBFluidScrunchGestureRecognizer;
  [(SBTouchTemplateGestureRecognizer *)&v9 _setMatchedPolygon:v4];
}

- (void)_computeGestureMotionWithTouches:(id)a3 polygon:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SBFluidScrunchGestureRecognizer *)self _centroidInGestureViewForPolygon:v6];
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(SBTouchTemplateGestureRecognizer *)self _matchedPolygon];
  if (v12)
  {
    [(SBFluidScrunchGestureRecognizer *)self centroid];
    double v14 = v9 - v13;
    double v16 = v11 - v15;
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DAD8];
    double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  CGFloat v17 = v16 + self->_absoluteTranslation.y;
  self->_absoluteTranslation.x = v14 + self->_absoluteTranslation.x;
  self->_absoluteTranslation.y = v17;
  if (self->_lastPerimeter != 0.0)
  {
    double absoluteScale = self->_absoluteScale;
    if ([(SBFluidScrunchGestureRecognizer *)self _isMatchedTemplateScrunchTemplate])
    {
      double v19 = self->_absoluteScale;
      [v6 _perimeter];
      double absoluteScale = v19 * v20 / self->_lastPerimeter;
    }
    if (absoluteScale > 1.0)
    {
      BSUIConstrainValueWithRubberBand();
      double absoluteScale = v21 + 1.0;
    }
    self->_double absoluteScale = absoluteScale;
  }
  [v6 _perimeter];
  self->_lastPerimeter = v22;
  v23.receiver = self;
  v23.super_class = (Class)SBFluidScrunchGestureRecognizer;
  [(SBTouchTemplateGestureRecognizer *)&v23 _computeGestureMotionWithTouches:v7 polygon:v6];
}

- (BOOL)_shouldAddNewTouchesAfterGestureRecognition
{
  return 1;
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)SBFluidScrunchGestureRecognizer;
  [(SBTouchTemplateGestureRecognizer *)&v4 reset];
  CGPoint v3 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_absoluteTranslation = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_double absoluteScale = 1.0;
  self->_additionalTranslationDueToChangingAnchorPoints = v3;
  self->_initialCentroid = v3;
  self->_lastPerimeter = 0.0;
  [(SBTouchHistory *)self->_touchHistory reset];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  CGPoint absoluteTranslation = self->_absoluteTranslation;
  double absoluteScale = self->_absoluteScale;
  id v8 = a3;
  double v9 = [(SBTouchTemplateGestureRecognizer *)self _matchedPolygon];
  [(SBFluidScrunchGestureRecognizer *)self _centroidInGestureViewForPolygon:v9];
  double v11 = v10;
  double v13 = v12;

  uint64_t v14 = [(SBTouchTemplateGestureRecognizer *)self _matchedTemplate];
  if (v14)
  {
    double v15 = (void *)v14;
    uint64_t v16 = [(SBFluidScrunchGestureRecognizer *)self state];

    v30.receiver = self;
    v30.super_class = (Class)SBFluidScrunchGestureRecognizer;
    [(SBTouchTemplateGestureRecognizer *)&v30 touchesBegan:v8 withEvent:v6];
    [(SBFluidScrunchGestureRecognizer *)self _updateRecognizedTouchTypeIfNecessaryWithTouches:v8];

    if (v16)
    {
      self->_CGPoint absoluteTranslation = absoluteTranslation;
      self->_double absoluteScale = absoluteScale;
      CGFloat v17 = [(SBTouchTemplateGestureRecognizer *)self _matchedPolygon];
      [(SBFluidScrunchGestureRecognizer *)self _centroidInGestureViewForPolygon:v17];
      double v19 = v18 - v11;
      double v21 = v20 - v13;

      CGFloat v22 = v21 + self->_additionalTranslationDueToChangingAnchorPoints.y;
      self->_additionalTranslationDueToChangingAnchorPoints.x = v19
                                                              + self->_additionalTranslationDueToChangingAnchorPoints.x;
      self->_additionalTranslationDueToChangingAnchorPoints.y = v22;
    }
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)SBFluidScrunchGestureRecognizer;
    [(SBTouchTemplateGestureRecognizer *)&v30 touchesBegan:v8 withEvent:v6];
    [(SBFluidScrunchGestureRecognizer *)self _updateRecognizedTouchTypeIfNecessaryWithTouches:v8];
  }
  objc_super v23 = [(SBFluidScrunchGestureRecognizer *)self _gestureView];
  [(SBFluidScrunchGestureRecognizer *)self locationInView:v23];
  double v25 = v24;
  double v27 = v26;

  touchHistory = self->_touchHistory;
  [(SBFluidScrunchGestureRecognizer *)self lastTouchTimestamp];
  -[SBTouchHistory updateWithLocation:timestamp:](touchHistory, "updateWithLocation:timestamp:", v25, v27, v29);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SBFluidScrunchGestureRecognizer;
  id v6 = a3;
  [(SBTouchTemplateGestureRecognizer *)&v14 touchesMoved:v6 withEvent:a4];
  -[SBFluidScrunchGestureRecognizer _updateRecognizedTouchTypeIfNecessaryWithTouches:](self, "_updateRecognizedTouchTypeIfNecessaryWithTouches:", v6, v14.receiver, v14.super_class);

  id v7 = [(SBFluidScrunchGestureRecognizer *)self _gestureView];
  [(SBFluidScrunchGestureRecognizer *)self locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  touchHistory = self->_touchHistory;
  [(SBFluidScrunchGestureRecognizer *)self lastTouchTimestamp];
  -[SBTouchHistory updateWithLocation:timestamp:](touchHistory, "updateWithLocation:timestamp:", v9, v11, v13);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  CGPoint absoluteTranslation = self->_absoluteTranslation;
  double absoluteScale = self->_absoluteScale;
  id v7 = a4;
  id v8 = a3;
  double v9 = [(SBTouchTemplateGestureRecognizer *)self _matchedPolygon];
  [(SBFluidScrunchGestureRecognizer *)self _centroidInGestureViewForPolygon:v9];
  double v11 = v10;
  double v13 = v12;

  v20.receiver = self;
  v20.super_class = (Class)SBFluidScrunchGestureRecognizer;
  [(SBTouchTemplateGestureRecognizer *)&v20 touchesEnded:v8 withEvent:v7];

  objc_super v14 = [(SBTouchTemplateGestureRecognizer *)self _matchedPolygon];
  [(SBFluidScrunchGestureRecognizer *)self _centroidInGestureViewForPolygon:v14];
  double v16 = v15 - v11;
  double v18 = v17 - v13;

  self->_CGPoint absoluteTranslation = absoluteTranslation;
  self->_double absoluteScale = absoluteScale;
  CGFloat v19 = v18 + self->_additionalTranslationDueToChangingAnchorPoints.y;
  self->_additionalTranslationDueToChangingAnchorPoints.x = v16
                                                          + self->_additionalTranslationDueToChangingAnchorPoints.x;
  self->_additionalTranslationDueToChangingAnchorPoints.y = v19;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  CGPoint absoluteTranslation = self->_absoluteTranslation;
  double absoluteScale = self->_absoluteScale;
  id v7 = a4;
  id v8 = a3;
  double v9 = [(SBTouchTemplateGestureRecognizer *)self _matchedPolygon];
  [(SBFluidScrunchGestureRecognizer *)self _centroidInGestureViewForPolygon:v9];
  double v11 = v10;
  double v13 = v12;

  v20.receiver = self;
  v20.super_class = (Class)SBFluidScrunchGestureRecognizer;
  [(SBTouchTemplateGestureRecognizer *)&v20 touchesCancelled:v8 withEvent:v7];

  objc_super v14 = [(SBTouchTemplateGestureRecognizer *)self _matchedPolygon];
  [(SBFluidScrunchGestureRecognizer *)self _centroidInGestureViewForPolygon:v14];
  double v16 = v15 - v11;
  double v18 = v17 - v13;

  self->_CGPoint absoluteTranslation = absoluteTranslation;
  self->_double absoluteScale = absoluteScale;
  CGFloat v19 = v18 + self->_additionalTranslationDueToChangingAnchorPoints.y;
  self->_additionalTranslationDueToChangingAnchorPoints.x = v16
                                                          + self->_additionalTranslationDueToChangingAnchorPoints.x;
  self->_additionalTranslationDueToChangingAnchorPoints.y = v19;
}

- (CGPoint)centroid
{
  CGPoint v3 = [(SBTouchTemplateGestureRecognizer *)self _matchedPolygon];
  [(SBFluidScrunchGestureRecognizer *)self _centroidInGestureViewForPolygon:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5 - self->_additionalTranslationDueToChangingAnchorPoints.x;
  double v9 = v7 - self->_additionalTranslationDueToChangingAnchorPoints.y;
  result.y = v9;
  result.x = v8;
  return result;
}

- (double)_hysteresis
{
  return 10.0;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidScrunchGestureRecognizer *)self _gestureView];
  [(SBFluidScrunchGestureRecognizer *)self translationInView:v5];
  double v7 = v6;
  double v9 = v8;
  [v5 bounds];
  double v11 = v10 * 0.5;
  [v5 bounds];
  objc_msgSend(v5, "convertPoint:toView:", v4, v7 + v11, v9 + v12);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidScrunchGestureRecognizer *)self _gestureView];
  [(SBFluidScrunchGestureRecognizer *)self absoluteScale];
  double v7 = v6;
  [(SBFluidScrunchGestureRecognizer *)self initialCentroid];
  double v9 = v8;
  double v11 = v10;
  [(SBFluidScrunchGestureRecognizer *)self centroid];
  double v14 = v13;
  if (v12 <= v11) {
    double v15 = v12;
  }
  else {
    double v15 = v11;
  }
  [v5 bounds];
  double v17 = v15 + (1.0 - v7) * v16 * -0.5;
  double v18 = [v5 window];
  CGFloat v19 = [v18 screen];
  objc_super v20 = [v19 fixedCoordinateSpace];

  objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v20, v9, v11);
  double v22 = v21;
  double v24 = v23;
  objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v20, v14, v17);
  double v26 = v25;
  double v28 = v27;
  objc_msgSend(v4, "convertPoint:fromCoordinateSpace:", v20, v22, v24);
  double v30 = v29;
  double v32 = v31;
  objc_msgSend(v4, "convertPoint:fromCoordinateSpace:", v20, v26, v28);
  double v34 = v33;
  double v36 = v35;

  double v37 = v34 - v30;
  double v38 = v36 - v32;
  result.y = v38;
  result.x = v37;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  CGPoint v3 = [(SBFluidScrunchGestureRecognizer *)self touchHistory];
  [v3 averageTouchVelocityOverTimeDuration:0.0416666667];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)translationWithoutConsideringScaleInView:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidScrunchGestureRecognizer *)self _gestureView];
  [(SBFluidScrunchGestureRecognizer *)self initialCentroid];
  double v7 = v6;
  double v9 = v8;
  [(SBFluidScrunchGestureRecognizer *)self centroid];
  double v12 = v11;
  if (v10 <= v9) {
    double v13 = v10;
  }
  else {
    double v13 = v9;
  }
  objc_msgSend(v5, "convertPoint:toView:", v4, v7, v9);
  double v15 = v14;
  double v17 = v16;
  objc_msgSend(v5, "convertPoint:toView:", v4, v12, v13);
  double v19 = v18;
  double v21 = v20;

  double v22 = v19 - v15;
  double v23 = v21 - v17;
  result.y = v23;
  result.x = v22;
  return result;
}

- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3
{
  [(SBTouchHistory *)self->_touchHistory averageTouchVelocityOverTimeDuration:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)averageTouchPathAngleOverTimeDuration:(double)a3
{
  [(SBTouchHistory *)self->_touchHistory averageTouchPathAngleOverTimeDuration:a3];
  return result;
}

- (double)peakSpeed
{
  [(SBTouchHistory *)self->_touchHistory peakSpeed];
  return result;
}

- (id)_gestureView
{
  double v3 = [(SBFluidScrunchGestureRecognizer *)self delegate];
  double v4 = [v3 viewForSystemGestureRecognizer:self];

  return v4;
}

- (CGPoint)_centroidInGestureViewForPolygon:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidScrunchGestureRecognizer *)self _gestureView];
  double v6 = [v5 window];
  [v4 _centroid];
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(v6, "_convertPointFromSceneReferenceSpace:", v8, v10);
  double v12 = v11;
  double v14 = v13;

  double v15 = [v5 window];
  objc_msgSend(v15, "convertPoint:toView:", v5, v12, v14);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

- (void)_installTemplatesForDisplayConfiguration:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = [(SBFluidScrunchGestureRecognizer *)self allowedTouchTypes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) integerValue];
        double v11 = [MEMORY[0x1E4F1CA48] array];
        double v12 = [(id)objc_opt_class() _panTemplatesForTouchType:v10 displayConfiguration:v4];
        [v11 addObjectsFromArray:v12];

        double v13 = [(id)objc_opt_class() _scrunchTemplatesForTouchType:v10 displayConfiguration:v4];
        [v11 addObjectsFromArray:v13];

        [(SBTouchTemplateGestureRecognizer *)self setTemplates:v11 forTouchType:v10];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (BOOL)_isMatchedTemplateScrunchTemplate
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v2 = [(SBTouchTemplateGestureRecognizer *)self _matchedTemplate];
  if ((unint64_t)[v2 pointCount] >= 4)
  {
    [v2 _pointAtIndex:0];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__SBFluidScrunchGestureRecognizer__isMatchedTemplateScrunchTemplate__block_invoke;
    v6[3] = &unk_1E6B08180;
    v6[5] = v3;
    v6[4] = &v7;
    [v2 enumeratePointsUsingBlock:v6];
  }
  char v4 = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __68__SBFluidScrunchGestureRecognizer__isMatchedTemplateScrunchTemplate__block_invoke(uint64_t result, double a2, double a3)
{
  if (a3 != *(double *)(result + 40)) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

- (void)_updateRecognizedTouchTypeIfNecessaryWithTouches:(id)a3
{
  id v5 = a3;
  if ([(SBFluidScrunchGestureRecognizer *)self state] == 1)
  {
    char v4 = [v5 anyObject];
    self->_recognizedTouchType = [v4 type];
  }
}

- (double)animationDistance
{
  return 350.0;
}

- (double)incrementalGestureMotionForCandidate:(id)a3 withTransformAnalyzerInfo:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBFluidScrunchGestureRecognizer *)self _gestureView];
  [v6 bounds];
  double v8 = v7;

  [v5 scale];
  [v5 scale];
  double v10 = v9 * v8 + 0.0;
  [v5 translation];
  long double v12 = v11;
  [v5 translation];
  double v14 = v10 + hypot(v12, v13);

  return v14;
}

+ (void)_rotateTemplates:(id)a3 forDisplayConfiguration:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    double v7 = +[SBSystemGestureManager mainDisplayManager];
    double v8 = [v7 windowForSystemGestures];

    double v9 = [v8 _fbsDisplayConfiguration];
    [v9 nativeOrientation];
    double v11 = v10;

    [v6 nativeOrientation];
    double v13 = v12;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = v5;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      double v17 = v11 - v13;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v19++), "_rotate:", v17, (void)v20);
        }
        while (v16 != v19);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }
  }
}

+ (id)_scrunchTemplatesForTouchType:(int64_t)a3 displayConfiguration:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = xmmword_1D8FD2490;
  long long v39 = xmmword_1D8FD24A0;
  long long v40 = xmmword_1D8FD24B0;
  long long v41 = xmmword_1D8FD24C0;
  double v7 = [(SBPolygon *)[SBTouchTemplate alloc] initWithPoints:&v38 pointCount:4];
  [v6 addObject:v7];
  long long v34 = xmmword_1D8FD24D0;
  long long v35 = xmmword_1D8FD24E0;
  long long v36 = xmmword_1D8FD24F0;
  long long v37 = xmmword_1D8FD2500;
  double v8 = [(SBPolygon *)[SBTouchTemplate alloc] initWithPoints:&v34 pointCount:4];

  [v6 addObject:v8];
  long long v29 = xmmword_1D8FD2510;
  long long v30 = xmmword_1D8FD2520;
  long long v31 = xmmword_1D8FD2530;
  long long v32 = xmmword_1D8FD2540;
  long long v33 = xmmword_1D8FD2550;
  double v9 = [(SBPolygon *)[SBTouchTemplate alloc] initWithPoints:&v29 pointCount:5];

  [v6 addObject:v9];
  long long v24 = xmmword_1D8FD2560;
  long long v25 = xmmword_1D8FD2570;
  long long v26 = xmmword_1D8FD2580;
  long long v27 = xmmword_1D8FD2590;
  long long v28 = xmmword_1D8FD25A0;
  double v10 = [(SBPolygon *)[SBTouchTemplate alloc] initWithPoints:&v24 pointCount:5];

  [v6 addObject:v10];
  long long v19 = xmmword_1D8FD25B0;
  long long v20 = xmmword_1D8FD25C0;
  long long v21 = xmmword_1D8FD25D0;
  long long v22 = xmmword_1D8FD25E0;
  long long v23 = xmmword_1D8FD25F0;
  double v11 = [(SBPolygon *)[SBTouchTemplate alloc] initWithPoints:&v19 pointCount:5];

  [v6 addObject:v11];
  long long v14 = xmmword_1D8FD2600;
  long long v15 = xmmword_1D8FD2610;
  long long v16 = xmmword_1D8FD2620;
  long long v17 = xmmword_1D8FD2630;
  long long v18 = xmmword_1D8FD2640;
  double v12 = [(SBPolygon *)[SBTouchTemplate alloc] initWithPoints:&v14 pointCount:5];

  objc_msgSend(v6, "addObject:", v12, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41);
  if (a3 == 1 && v5) {
    +[SBFluidScrunchGestureRecognizer _rotateTemplates:v6 forDisplayConfiguration:v5];
  }

  return v6;
}

+ (id)_panTemplatesForTouchType:(int64_t)a3 displayConfiguration:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  if (a3 == 1)
  {
    long long v14 = xmmword_1D8FD2650;
    long long v15 = xmmword_1D8FD2660;
    long long v16 = xmmword_1D8FD2670;
    double v7 = [(SBPolygon *)[SBTouchTemplate alloc] initWithPoints:&v14 pointCount:3];
    [v6 addObject:v7];
    long long v23 = xmmword_1D8FD2520;
    long long v24 = xmmword_1D8FD2530;
    long long v25 = xmmword_1D8FD2540;
    double v8 = [(SBPolygon *)[SBTouchTemplate alloc] initWithPoints:&v23 pointCount:3];

    [v6 addObject:v8];
    long long v19 = xmmword_1D8FD2680;
    long long v20 = xmmword_1D8FD2520;
    long long v21 = xmmword_1D8FD2530;
    double v9 = [(SBPolygon *)[SBTouchTemplate alloc] initWithPoints:&v19 pointCount:3];

    [v6 addObject:v9];
  }
  long long v23 = xmmword_1D8FD2690;
  long long v24 = xmmword_1D8FD26A0;
  long long v25 = xmmword_1D8FD26B0;
  long long v26 = xmmword_1D8FD26C0;
  double v10 = [(SBPolygon *)[SBTouchTemplate alloc] initWithPoints:&v23 pointCount:4];
  [v6 addObject:v10];
  long long v19 = xmmword_1D8FD2680;
  long long v20 = xmmword_1D8FD2520;
  long long v21 = xmmword_1D8FD2530;
  long long v22 = xmmword_1D8FD2540;
  double v11 = [(SBPolygon *)[SBTouchTemplate alloc] initWithPoints:&v19 pointCount:4];

  [v6 addObject:v11];
  long long v14 = xmmword_1D8FD2680;
  long long v15 = xmmword_1D8FD2520;
  long long v16 = xmmword_1D8FD2530;
  long long v17 = xmmword_1D8FD2540;
  long long v18 = xmmword_1D8FD2550;
  double v12 = [(SBPolygon *)[SBTouchTemplate alloc] initWithPoints:&v14 pointCount:5];

  [v6 addObject:v12];
  if (a3 == 1 && v5) {
    +[SBFluidScrunchGestureRecognizer _rotateTemplates:v6 forDisplayConfiguration:v5];
  }

  return v6;
}

- (double)absoluteScale
{
  return self->_absoluteScale;
}

- (void)setAbsoluteScale:(double)a3
{
  self->_double absoluteScale = a3;
}

- (CGPoint)initialCentroid
{
  double x = self->_initialCentroid.x;
  double y = self->_initialCentroid.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialCentroid:(CGPoint)a3
{
  self->_initialCentroid = a3;
}

- (int64_t)recognizedTouchType
{
  return self->_recognizedTouchType;
}

- (CGPoint)absoluteTranslation
{
  double x = self->_absoluteTranslation.x;
  double y = self->_absoluteTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAbsoluteTranslation:(CGPoint)a3
{
  self->_CGPoint absoluteTranslation = a3;
}

- (CGPoint)additionalTranslationDueToChangingAnchorPoints
{
  double x = self->_additionalTranslationDueToChangingAnchorPoints.x;
  double y = self->_additionalTranslationDueToChangingAnchorPoints.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAdditionalTranslationDueToChangingAnchorPoints:(CGPoint)a3
{
  self->_additionalTranslationDueToChangingAnchorPoints = a3;
}

- (double)lastPerimeter
{
  return self->_lastPerimeter;
}

- (void)setLastPerimeter:(double)a3
{
  self->_lastPerimeter = a3;
}

- (SBTouchHistory)touchHistory
{
  return self->_touchHistory;
}

- (void)setTouchHistory:(id)a3
{
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void)setDisplayConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_touchHistory, 0);
}

@end
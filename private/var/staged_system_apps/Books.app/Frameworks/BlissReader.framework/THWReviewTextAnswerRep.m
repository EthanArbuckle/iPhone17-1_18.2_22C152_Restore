@interface THWReviewTextAnswerRep
- (BOOL)allowTrackingContainedRep:(id)a3;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)handleGesture:(id)a3;
- (BOOL)pressed;
- (CALayer)radioButtonLayer;
- (id)p_answerAccessibilityDescription;
- (id)p_answerText;
- (id)p_questionHost;
- (id)p_questionRep;
- (int)pressTarget;
- (int)radioState;
- (int)state;
- (unint64_t)p_choiceIndex;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)dealloc;
- (void)p_selectAnswer;
- (void)setPressTarget:(int)a3;
- (void)setPressed:(BOOL)a3;
- (void)setRadioState:(int)a3;
- (void)setState:(int)a3;
- (void)updateRadioState;
@end

@implementation THWReviewTextAnswerRep

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextAnswerRep;
  [(THWReviewTextAnswerRep *)&v3 dealloc];
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)updateRadioState
{
  id v3 = [[-[THWReviewTextAnswerRep p_questionHost](self, "p_questionHost") reviewQuestion:radioStateForChoice:pressed:v221 v222 v223];

  [(THWReviewTextAnswerRep *)self setRadioState:v3];
}

- (void)setRadioState:(int)a3
{
  if (self->_radioState != a3)
  {
    self->_radioState = a3;
    id v3 = [(THWReviewTextAnswerRep *)self canvas];
    [v3 invalidateLayers];
  }
}

- (unint64_t)p_choiceIndex
{
  id v3 = objc_msgSend(objc_msgSend(-[THWReviewTextAnswerRep p_questionRep](self, "p_questionRep"), "questionLayout"), "question");
  id v4 = [self layout].choice;

  return (unint64_t)[v3 indexForChoice:v4];
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  id v5 = [(THWReviewTextAnswerRep *)self layout];
  id v6 = [(THWReviewTextAnswerRep *)self p_questionRep];
  id v7 = [(THWReviewTextAnswerRep *)self p_questionHost];
  if (!self->_radioButtonLayer)
  {
    self->_radioButtonLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    [(CALayer *)self->_radioButtonLayer setDelegate:[(THWReviewTextAnswerRep *)self interactiveCanvasController]];
  }
  id v8 = [v7 reviewQuestion:v6 cachedImageNamed:*(&off_45A618[4 * self->_state] + self->_radioState)];
  -[CALayer setBounds:](self->_radioButtonLayer, "setBounds:", 0.0, 0.0, 46.0, 46.0);
  [self canvas].viewScale
  double v10 = v9;
  [v5 labelFrame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [v5 horizontalOffset];
  double v20 = v10 * (v19 + 46.0 * 0.5);
  v34.origin.x = v12;
  v34.origin.y = v14;
  v34.size.width = v16;
  v34.size.height = v18;
  -[CALayer setPosition:](self->_radioButtonLayer, "setPosition:", v20, v10 * CGRectGetMidY(v34));
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeScale(&v33, v10, v10);
  CGAffineTransform v32 = v33;
  [(CALayer *)self->_radioButtonLayer setAffineTransform:&v32];
  [self canvas].contentsScale;
  double v22 = v21;
  id v23 = [v8 CGImageForContentsScale:];
  if ([(CALayer *)self->_radioButtonLayer contents] != v23)
  {
    [(CALayer *)self->_radioButtonLayer setContents:v23];
    [(CALayer *)self->_radioButtonLayer setContentsScale:v22];
  }
  radioButtonLayer = self->_radioButtonLayer;
  if (radioButtonLayer)
  {
    [(CALayer *)radioButtonLayer frame];
    double v26 = v25;
    double v28 = v27;
    TSDFloorForScale();
    double v30 = v29;
    TSDFloorForScale();
    -[CALayer setFrame:](self->_radioButtonLayer, "setFrame:", v30, v31, v26, v28);
    [a3 addObject:self->_radioButtonLayer];
  }
}

- (BOOL)allowTrackingContainedRep:(id)a3
{
  return 0;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v4 = [a3 gestureKind];
  return v4 == (id)TSWPImmediatePress
      && [(THWReviewTextAnswerRep *)self state] != 1
      && [[self p_questionRep] questionState] != 6;
}

- (BOOL)handleGesture:(id)a3
{
  [a3 naturalLocationForRep:self];
  double v6 = v5;
  CGFloat v8 = v7;
  [(THWReviewTextAnswerRep *)self naturalBounds];
  v15.x = v6;
  v15.y = v8;
  BOOL v9 = CGRectContainsPoint(v16, v15);
  unsigned int v10 = [a3 gestureState] - 1;
  uint64_t v11 = 0;
  switch(v10)
  {
    case 0u:
      goto LABEL_2;
    case 1u:
      if (objc_msgSend(objc_msgSend(-[THWReviewTextAnswerRep interactiveCanvasController](self, "interactiveCanvasController", 0), "canvasView"), "isAncestorScrollViewDragging"))goto LABEL_10; {
      unsigned int v13 = [(THWReviewTextAnswerRep *)self pressed];
      }
      [(THWReviewTextAnswerRep *)self setPressed:v9];
      if (v9 != v13)
      {
        if (v9)
        {
LABEL_2:
          [self layout:v11 horizontalOffset];
          if (v6 < v12 + 47.0) {
            uint64_t v11 = 1;
          }
          else {
            uint64_t v11 = 2;
          }
        }
        else
        {
LABEL_10:
          uint64_t v11 = 0;
        }
LABEL_11:
        [(THWReviewTextAnswerRep *)self setPressTarget:v11];
      }
      return 1;
    case 2u:
      if ([(THWReviewTextAnswerRep *)self pressed]) {
        [(THWReviewTextAnswerRep *)self p_selectAnswer];
      }
      goto LABEL_10;
    case 3u:
    case 4u:
      goto LABEL_11;
    default:
      return 1;
  }
}

- (void)setPressTarget:(int)a3
{
  if (self->_pressTarget == a3) {
    return;
  }
  self->_int pressTarget = a3;
  id v4 = [(THWReviewTextAnswerRep *)self interactiveCanvasController];
  id v5 = [v4 layerForRep:[v4 repForLayout:[v4 layout]]];
  [v5 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  int pressTarget = self->_pressTarget;
  if (pressTarget == 2)
  {
    [(THWReviewTextAnswerRep *)self setPressed:1];
    v21.origin.x = v7;
    v21.origin.y = v9;
    v21.size.width = v11;
    v21.size.height = v13;
    CGFloat v16 = CGRectGetMinX(v21) + 47.0;
    v22.origin.x = v7;
    v22.origin.y = v9;
    v22.size.width = v11;
    v22.size.height = v13;
    [v5 addPressAnimationFromPoint:v16 scale:CGRectGetMidY(v22) 0.85];
    radioButtonLayer = self->_radioButtonLayer;
    [(CALayer *)radioButtonLayer position];
  }
  else
  {
    if (pressTarget != 1)
    {
      if (!pressTarget)
      {
        [(THWReviewTextAnswerRep *)self setPressed:0];
        [v5 position];
        [v5 addRecoilAnimationFromPoint:0];
        CGPoint v15 = self->_radioButtonLayer;
        [(CALayer *)v15 position];
        -[CALayer addRecoilAnimationFromPoint:hardRebound:](v15, "addRecoilAnimationFromPoint:hardRebound:", 0);
      }
      goto LABEL_9;
    }
    [(THWReviewTextAnswerRep *)self setPressed:1];
    v23.origin.x = v7;
    v23.origin.y = v9;
    v23.size.width = v11;
    v23.size.height = v13;
    CGFloat v18 = CGRectGetMinX(v23) + 47.0;
    v24.origin.x = v7;
    v24.origin.y = v9;
    v24.size.width = v11;
    v24.size.height = v13;
    [v5 addPressAnimationFromPoint:v18 scale:CGRectGetMidY(v24) 1.17647059];
    radioButtonLayer = self->_radioButtonLayer;
    [(CALayer *)radioButtonLayer position];
  }
  -[CALayer addPressAnimationFromPoint:scale:](radioButtonLayer, "addPressAnimationFromPoint:scale:");
LABEL_9:
  id v19 = [(THWReviewTextAnswerRep *)self canvas];

  [v19 invalidateLayers];
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    [(THWReviewTextAnswerRep *)self updateRadioState];
  }
}

- (void)setState:(int)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    id v3 = [(THWReviewTextAnswerRep *)self canvas];
    [v3 invalidateLayers];
  }
}

- (void)p_selectAnswer
{
  id v3 = [(THWReviewTextAnswerRep *)self p_questionRep];
  id v4 = [(THWReviewTextAnswerRep *)self p_questionHost];
  id v5 = [[[v3 questionLayout] question] indexForChoice:[self layout] choice];

  [v4 reviewQuestion:v3 selectChoice:v5];
}

- (id)p_answerText
{
  id v2 = [[-[THWReviewTextAnswerRep layout](self, "layout") choice] contentStorage];

  return [v2 stringValue];
}

- (id)p_answerAccessibilityDescription
{
  id v2 = [self layout].choice;

  return [v2 accessibilityDescription];
}

- (id)p_questionRep
{
  id v3 = [(THWReviewTextAnswerRep *)self interactiveCanvasController];

  return [v3 ancestorRepOfRep:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THWReviewQuestionRep];
}

- (id)p_questionHost
{
  id v3 = [(THWReviewTextAnswerRep *)self interactiveCanvasController];

  return [v3 ancestorRepOfRep:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THWReviewQuestionHosting];
}

- (int)state
{
  return self->_state;
}

- (int)radioState
{
  return self->_radioState;
}

- (CALayer)radioButtonLayer
{
  return self->_radioButtonLayer;
}

- (int)pressTarget
{
  return self->_pressTarget;
}

- (BOOL)pressed
{
  return self->_pressed;
}

@end
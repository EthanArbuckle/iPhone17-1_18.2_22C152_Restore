@interface THWReviewImageAnswerChoiceState
- (BOOL)pressed;
- (BOOL)selected;
- (CALayer)radioButtonLayer;
- (NSString)choiceAccessibilityDescription;
- (THWReviewChoice)choice;
- (THWReviewImageAnswerChoiceState)initWithChoice:(id)a3 questionRep:(id)a4 questionHost:(id)a5;
- (THWReviewQuestionHosting)questionHost;
- (THWReviewQuestionRep)questionRep;
- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5;
- (int)buttonControlState:(id)a3;
- (int)choiceState;
- (int)radioState;
- (unint64_t)p_choiceIndex;
- (void)buttonControl:(id)a3 addAdditionalChildLayersToArray:(id)a4;
- (void)buttonControlHighlightedDidChange:(id)a3;
- (void)buttonControlWasPressed:(id)a3;
- (void)dealloc;
- (void)p_setImagePressed:(BOOL)a3 forButton:(id)a4;
- (void)setChoiceState:(int)a3;
- (void)setPressed:(BOOL)a3;
- (void)setRadioState:(int)a3;
- (void)updateRadioState;
@end

@implementation THWReviewImageAnswerChoiceState

- (THWReviewImageAnswerChoiceState)initWithChoice:(id)a3 questionRep:(id)a4 questionHost:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)THWReviewImageAnswerChoiceState;
  v8 = [(THWReviewImageAnswerChoiceState *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_questionRep = (THWReviewQuestionRep *)a4;
    v8->_questionHost = (THWReviewQuestionHosting *)a5;
    v8->_choice = (THWReviewChoice *)a3;
    [(THWReviewImageAnswerChoiceState *)v9 updateRadioState];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageAnswerChoiceState;
  [(THWReviewImageAnswerChoiceState *)&v3 dealloc];
}

- (void)setChoiceState:(int)a3
{
  if (self->_choiceState != a3)
  {
    self->_choiceState = a3;
    [(THWReviewQuestionHosting *)self->_questionHost reviewQuestionInvalidateLayers:self->_questionRep];
  }
}

- (void)setRadioState:(int)a3
{
  if (self->_radioState != a3)
  {
    self->_radioState = a3;
    [(THWReviewQuestionHosting *)self->_questionHost reviewQuestionInvalidateLayers:self->_questionRep];
  }
}

- (void)updateRadioState
{
  id v3 = [(THWReviewQuestionHosting *)self->_questionHost reviewQuestion:self->_questionRep radioStateForChoice:[(THWReviewImageAnswerChoiceState *)self p_choiceIndex] pressed:self->_pressed];

  [(THWReviewImageAnswerChoiceState *)self setRadioState:v3];
}

- (void)buttonControlWasPressed:(id)a3
{
  questionRep = self->_questionRep;
  questionHost = self->_questionHost;
  unint64_t v5 = [(THWReviewImageAnswerChoiceState *)self p_choiceIndex];

  [(THWReviewQuestionHosting *)questionHost reviewQuestion:questionRep selectChoice:v5];
}

- (int)buttonControlState:(id)a3
{
  if ([(THWReviewQuestionRep *)self->_questionRep questionState] == 6) {
    return 2;
  }
  else {
    return 2 * ([(THWReviewImageAnswerChoiceState *)self choiceState] == 1);
  }
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  if (objc_msgSend(objc_msgSend(a3, "layout"), "tag")) {
    return 0;
  }
  choice = self->_choice;

  return [(THWReviewChoice *)choice contentImage];
}

- (void)buttonControlHighlightedDidChange:(id)a3
{
  self->_BOOL pressed = [a3 highlighted];
  -[THWReviewImageAnswerChoiceState setRadioState:](self, "setRadioState:", -[THWReviewQuestionHosting reviewQuestion:radioStateForChoice:pressed:](self->_questionHost, "reviewQuestion:radioStateForChoice:pressed:", self->_questionRep, -[THWReviewImageAnswerChoiceState p_choiceIndex](self, "p_choiceIndex"), [a3 highlighted]));
  BOOL pressed = self->_pressed;

  [(THWReviewImageAnswerChoiceState *)self p_setImagePressed:pressed forButton:a3];
}

- (void)p_setImagePressed:(BOOL)a3 forButton:(id)a4
{
  BOOL v4 = a3;
  id v6 = objc_msgSend(objc_msgSend(a4, "interactiveCanvasController"), "layerForRep:", a4);
  if (v4)
  {
    if (self->_radioState == 2) {
      [(CALayer *)self->_radioButtonLayer addButtonShadow];
    }
    [v6 frame];
    TSDCenterOfRect();
    [v6 addPressAnimationFromPoint:scale:];
  }
  else
  {
    [(CALayer *)self->_radioButtonLayer removeButtonShadow];
    [v6 removePressAnimation];
  }
}

- (void)buttonControl:(id)a3 addAdditionalChildLayersToArray:(id)a4
{
  if (!self->_radioButtonLayer)
  {
    self->_radioButtonLayer = (CALayer *)+[TSDNoDefaultImplicitActionLayer layer];
    -[CALayer setDelegate:](self->_radioButtonLayer, "setDelegate:", [a3 interactiveCanvasController]);
    -[CALayer setBounds:](self->_radioButtonLayer, "setBounds:", 0.0, 0.0, 46.0, 46.0);
  }
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "interactiveCanvasController"), "layerForRep:", a3), "bounds");
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  objc_msgSend(objc_msgSend(a3, "canvas"), "viewScale");
  double v16 = v15;
  v36.origin.x = v8;
  v36.origin.y = v10;
  v36.size.width = v12;
  v36.size.height = v14;
  double v17 = CGRectGetMinX(v36) + 46.0 * 0.5 * v16;
  v37.origin.x = v8;
  v37.origin.y = v10;
  v37.size.width = v12;
  v37.size.height = v14;
  double v18 = CGRectGetMaxY(v37) + 46.0 * -0.5 * v16;
  [(CALayer *)self->_radioButtonLayer position];
  if (v17 != v20 || v18 != v19) {
    -[CALayer setPosition:](self->_radioButtonLayer, "setPosition:", v17, v18);
  }
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeScale(&v35, v16, v16);
  CGAffineTransform v34 = v35;
  [(CALayer *)self->_radioButtonLayer setAffineTransform:&v34];
  id v22 = [(THWReviewQuestionHosting *)self->_questionHost reviewQuestion:self->_questionRep cachedImageNamed:*(&off_45A790[4 * self->_choiceState] + self->_radioState)];
  objc_msgSend(objc_msgSend(a3, "canvas"), "contentsScale");
  double v24 = v23;
  id v25 = [v22 CGImageForContentsScale:];
  if ([(CALayer *)self->_radioButtonLayer contents] != v25)
  {
    [(CALayer *)self->_radioButtonLayer setContents:v25];
    [(CALayer *)self->_radioButtonLayer setContentsScale:v24];
  }
  radioButtonLayer = self->_radioButtonLayer;
  if (radioButtonLayer)
  {
    [(CALayer *)radioButtonLayer frame];
    double v28 = v27;
    double v30 = v29;
    TSDFloorForScale();
    double v32 = v31;
    TSDFloorForScale();
    -[CALayer setFrame:](self->_radioButtonLayer, "setFrame:", v32, v33, v28, v30);
    [a4 addObject:self->_radioButtonLayer];
  }
}

- (unint64_t)p_choiceIndex
{
  id v3 = [[self->_questionRep questionLayout] question];
  choice = self->_choice;

  return (unint64_t)[v3 indexForChoice:choice];
}

- (NSString)choiceAccessibilityDescription
{
  v2 = [(THWReviewImageAnswerChoiceState *)self choice];

  return [(THWReviewChoice *)v2 accessibilityDescription];
}

- (BOOL)selected
{
  return [(THWReviewImageAnswerChoiceState *)self radioState] == 2;
}

- (THWReviewQuestionRep)questionRep
{
  return self->_questionRep;
}

- (THWReviewQuestionHosting)questionHost
{
  return self->_questionHost;
}

- (THWReviewChoice)choice
{
  return self->_choice;
}

- (CALayer)radioButtonLayer
{
  return self->_radioButtonLayer;
}

- (int)choiceState
{
  return self->_choiceState;
}

- (int)radioState
{
  return self->_radioState;
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (void)setPressed:(BOOL)a3
{
  self->_BOOL pressed = a3;
}

@end
@interface THWReviewControlsRep
- (BOOL)animateNextButton;
- (BOOL)animatePrevButton;
- (BOOL)buttonControlAdjustImageWhenHighlighted:(id)a3;
- (BOOL)buttonControlUseContentsScaleForImageCache:(id)a3;
- (BOOL)checkAnswerButtonDisabled;
- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4;
- (BOOL)directlyManagesLayerContent;
- (BOOL)nextButtonHidden;
- (BOOL)nextButtonHiddenStateChanged;
- (BOOL)prevButtonHidden;
- (BOOL)prevButtonHiddenStateChanged;
- (THWLabelLayer)checkAnswerButtonLabel;
- (THWReviewControlsDelegate)delegate;
- (THWReviewControlsRep)initWithLayout:(id)a3 canvas:(id)a4;
- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5;
- (int)checkAnswerButtonState;
- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4;
- (void)buttonControlWasPressed:(id)a3;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)dealloc;
- (void)p_animateButtonLayer:(id)a3 hide:(BOOL)a4;
- (void)setAnimateNextButton:(BOOL)a3;
- (void)setAnimatePrevButton:(BOOL)a3;
- (void)setCheckAnswerButtonDisabled:(BOOL)a3;
- (void)setCheckAnswerButtonState:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setNextButtonHidden:(BOOL)a3;
- (void)setNextButtonHiddenStateChanged:(BOOL)a3;
- (void)setPrevButtonHidden:(BOOL)a3;
- (void)setPrevButtonHiddenStateChanged:(BOOL)a3;
@end

@implementation THWReviewControlsRep

- (THWReviewControlsRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THWReviewControlsRep;
  result = [(THWReviewControlsRep *)&v5 initWithLayout:a3 canvas:a4];
  if (result) {
    result->_checkAnswerButtonDisabled = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewControlsRep;
  [(THWReviewControlsRep *)&v3 dealloc];
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)setPrevButtonHidden:(BOOL)a3
{
  if (self->_prevButtonHidden != a3)
  {
    self->_prevButtonHidden = a3;
    self->_prevButtonHiddenStateChanged = 1;
    id v3 = [(THWReviewControlsRep *)self canvas];
    [v3 invalidateLayers];
  }
}

- (void)setNextButtonHidden:(BOOL)a3
{
  if (self->_nextButtonHidden != a3)
  {
    self->_nextButtonHidden = a3;
    self->_nextButtonHiddenStateChanged = 1;
    id v3 = [(THWReviewControlsRep *)self canvas];
    [v3 invalidateLayers];
  }
}

- (void)setCheckAnswerButtonDisabled:(BOOL)a3
{
  if (self->_checkAnswerButtonDisabled != a3)
  {
    self->_checkAnswerButtonDisabled = a3;
    id v3 = [(THWReviewControlsRep *)self canvas];
    [v3 invalidateLayers];
  }
}

- (void)setCheckAnswerButtonState:(int)a3
{
  if (self->_checkAnswerButtonState != a3)
  {
    self->_checkAnswerButtonState = a3;
    id v3 = [(THWReviewControlsRep *)self canvas];
    [v3 invalidateLayers];
  }
}

- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4
{
  id v6 = [(THWControlContainerRep *)self controlHostRep];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (LODWORD(v7) = [v6 control:a3 isInteractionEnabledForRep:self], v7))
  {
    unint64_t v7 = (unint64_t)[a3 tag];
    LOBYTE(v7) = v7 > 2 || self->super.TSDContainerRep_opaque[*off_45A698[v7]] == 0;
  }
  return v7;
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  if ((unint64_t)[a3 tag] <= 2)
  {
    objc_opt_class();
    objc_super v5 = (void *)TSUDynamicCast();
    [v5 setDelegate:self];
  }
}

- (void)buttonControlWasPressed:(id)a3
{
  id v4 = [a3 layout];
  objc_super v5 = (char *)[v4 tag];
  if (v5 == (unsigned char *)&dword_0 + 2)
  {
    if (self->_checkAnswerButtonDisabled) {
      return;
    }
    delegate = self->_delegate;
    v8 = self;
    id v9 = &dword_0 + 2;
    goto LABEL_11;
  }
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t v6 = 297;
  }
  else
  {
    if (v5) {
      return;
    }
    uint64_t v6 = 296;
  }
  if (!self->super.TSDContainerRep_opaque[v6])
  {
    v10 = self->_delegate;
    id v9 = [v4 tag];
    delegate = v10;
    v8 = self;
LABEL_11:
    [(THWReviewControlsDelegate *)delegate reviewControls:v8 buttonPressed:v9];
  }
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = [a3 layout];
  id v9 = [[self layout] primaryColor];
  if ([v8 tag])
  {
    if ([v8 tag] != (char *)&dword_0 + 1) {
      return 0;
    }
    [self layout].nextButtonFrame;
    double v11 = v10;
    double v13 = v12;
    objc_msgSend(objc_msgSend(a3, "canvas"), "contentsScale");
    double v15 = v14;
    double v16 = v11;
    double v17 = v13;
    uint64_t v18 = 2;
  }
  else
  {
    [self layout].prevButtonFrame;
    double v20 = v19;
    double v22 = v21;
    objc_msgSend(objc_msgSend(a3, "canvas"), "contentsScale");
    double v15 = v23;
    double v16 = v20;
    double v17 = v22;
    uint64_t v18 = 4;
  }

  return +[THWButtonUtilities navigationArrowImageWithSize:direction:color:highlighted:contentsScale:](THWButtonUtilities, "navigationArrowImageWithSize:direction:color:highlighted:contentsScale:", v18, v9, v5, v16, v17, v15);
}

- (BOOL)buttonControlUseContentsScaleForImageCache:(id)a3
{
  return 1;
}

- (BOOL)buttonControlAdjustImageWhenHighlighted:(id)a3
{
  return 0;
}

- (void)p_animateButtonLayer:(id)a3 hide:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  if (v4) {
    *(float *)&double v7 = 1.0;
  }
  else {
    *(float *)&double v7 = 0.0;
  }
  if (v4) {
    float v8 = 0.0;
  }
  else {
    float v8 = 1.0;
  }
  [(CABasicAnimation *)v6 setFromValue:+[NSNumber numberWithFloat:v7]];
  *(float *)&double v9 = v8;
  [(CABasicAnimation *)v6 setToValue:+[NSNumber numberWithFloat:v9]];
  [(CABasicAnimation *)v6 setDuration:0.15];
  [(CABasicAnimation *)v6 setRemovedOnCompletion:0];
  [(CABasicAnimation *)v6 setFillMode:kCAFillModeForwards];

  [a3 addAnimation:v6 forKey:@"opacity"];
}

- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4
{
  id v7 = [a3 layout];
  [self canvas].viewScale;
  double v9 = v8;
  id v10 = [(THWReviewControlsRep *)self layout];
  [a4 setContentsGravity:kCAGravityResize];
  if (![v7 tag])
  {
    if (self->_prevButtonHiddenStateChanged)
    {
      self->_prevButtonHiddenStateChanged = 0;
      uint64_t v11 = 301;
      BOOL animatePrevButton = self->_animatePrevButton;
      uint64_t v13 = 296;
      goto LABEL_7;
    }
LABEL_19:
    id v20 = objc_msgSend(objc_msgSend(v10, "primaryColor"), "CGColor");
    [a4 setBorderColor:v20];
    return;
  }
  if ([v7 tag] == (char *)&dword_0 + 1)
  {
    if (self->_nextButtonHiddenStateChanged)
    {
      self->_nextButtonHiddenStateChanged = 0;
      uint64_t v11 = 302;
      BOOL animatePrevButton = self->_animateNextButton;
      uint64_t v13 = 297;
LABEL_7:
      int v14 = self->super.TSDContainerRep_opaque[v13];
      if (animatePrevButton)
      {
        [(THWReviewControlsRep *)self p_animateButtonLayer:a4 hide:v14 != 0];
      }
      else
      {
        double v19 = 0.0;
        if (!v14) {
          *(float *)&double v19 = 1.0;
        }
        [a4 setOpacity:v19];
      }
      self->super.TSDContainerRep_opaque[v11] = 1;
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if ([v7 tag] != (char *)&dword_0 + 2) {
    return;
  }
  LODWORD(v15) = 1.0;
  if ((self->_checkAnswerButtonState - 1) <= 2)
  {
    unsigned int v16 = [a3 highlighted];
    LODWORD(v15) = 1.0;
    if (v16) {
      *(float *)&double v15 = 0.5;
    }
  }
  [a4 setOpacity:v15];
  [v10 buttonCornerRadius];
  [a4 setCornerRadius:v9 * v17];
  if (self->_checkAnswerButtonState)
  {
    [a4 setBackgroundColor:0];
    id v18 = v10;
LABEL_24:
    objc_msgSend(a4, "setBorderColor:", objc_msgSend(objc_msgSend(objc_msgSend(v18, "primaryColor"), "colorWithAlphaComponent:", 0.4), "CGColor"));
    [v10 buttonStrokeWidth];
    [a4 setBorderWidth:v9 * v21];
    goto LABEL_25;
  }
  if (self->_checkAnswerButtonDisabled)
  {
    [a4 setBackgroundColor:0];
    id v18 = [(THWReviewControlsRep *)self layout];
    goto LABEL_24;
  }
  [a4 setBorderWidth:0.0];
  if ([a3 highlighted]) {
    double v32 = 0.5;
  }
  else {
    double v32 = 1.0;
  }
  [a4 setBackgroundColor:[+[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 0.09, 0.49, 0.98, v32), "CGColor"]];
  [a4 setBorderColor:0];
LABEL_25:
  if (self->_checkAnswerButtonLabel
    || (self->_checkAnswerButtonLabel = objc_alloc_init(THWLabelLayer),
        -[THWLabelLayer setDelegate:](self->_checkAnswerButtonLabel, "setDelegate:", +[THNoAnimationLayerDelegate sharedInstance](THNoAnimationLayerDelegate, "sharedInstance")), -[THWLabelLayer setFontName:](self->_checkAnswerButtonLabel, "setFontName:", [v10 buttonFontName]), -[THWLabelLayer setHorizontalAlignment:](self->_checkAnswerButtonLabel, "setHorizontalAlignment:", 1), -[THWLabelLayer setVerticalAlignment:](self->_checkAnswerButtonLabel, "setVerticalAlignment:", 1), self->_checkAnswerButtonLabel))
  {
    objc_msgSend(objc_msgSend(a3, "canvas"), "contentsScale");
    double v23 = v22;
    [(THWLabelLayer *)self->_checkAnswerButtonLabel contentsScale];
    if (v24 != v23) {
      [(THWLabelLayer *)self->_checkAnswerButtonLabel setContentsScale:v23];
    }
    switch(self->_checkAnswerButtonState)
    {
      case 0:
        -[THWLabelLayer setString:](self->_checkAnswerButtonLabel, "setString:", [(id)THBundle() localizedStringForKey:@"Check Answer" value:&stru_46D7E8 table:0]);
        if (self->_checkAnswerButtonDisabled) {
          v25 = (TSUColor *)[v10 disabledPrimaryColor];
        }
        else {
          v25 = +[TSUColor colorWithWhite:1.0 alpha:1.0];
        }
        goto LABEL_36;
      case 1:
        v26 = (void *)THBundle();
        CFStringRef v27 = @"Try Again";
        goto LABEL_35;
      case 2:
        v26 = (void *)THBundle();
        CFStringRef v27 = @"Clear Answer";
        goto LABEL_35;
      case 3:
        v26 = (void *)THBundle();
        CFStringRef v27 = @"Start Over";
LABEL_35:
        -[THWLabelLayer setString:](self->_checkAnswerButtonLabel, "setString:", [v26 localizedStringForKey:v27 value:&stru_46D7E8 table:0]);
        v25 = (TSUColor *)[v10 primaryColor];
LABEL_36:
        [(THWLabelLayer *)self->_checkAnswerButtonLabel setTextColor:v25];
        break;
      default:
        break;
    }
    [v10 buttonFontSize];
    double v29 = v28;
    [self canvas].viewScale;
    [(THWLabelLayer *)self->_checkAnswerButtonLabel setFontSize:v29 * v30];
    [a4 bounds];
    -[THWLabelLayer setFrame:](self->_checkAnswerButtonLabel, "setFrame:");
    if ([(THWLabelLayer *)self->_checkAnswerButtonLabel superlayer] != a4)
    {
      checkAnswerButtonLabel = self->_checkAnswerButtonLabel;
      [a4 addSublayer:checkAnswerButtonLabel];
    }
  }
}

- (THWReviewControlsDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWReviewControlsDelegate *)a3;
}

- (BOOL)prevButtonHidden
{
  return self->_prevButtonHidden;
}

- (BOOL)nextButtonHidden
{
  return self->_nextButtonHidden;
}

- (BOOL)checkAnswerButtonDisabled
{
  return self->_checkAnswerButtonDisabled;
}

- (int)checkAnswerButtonState
{
  return self->_checkAnswerButtonState;
}

- (THWLabelLayer)checkAnswerButtonLabel
{
  return self->_checkAnswerButtonLabel;
}

- (BOOL)prevButtonHiddenStateChanged
{
  return self->_prevButtonHiddenStateChanged;
}

- (void)setPrevButtonHiddenStateChanged:(BOOL)a3
{
  self->_prevButtonHiddenStateChanged = a3;
}

- (BOOL)nextButtonHiddenStateChanged
{
  return self->_nextButtonHiddenStateChanged;
}

- (void)setNextButtonHiddenStateChanged:(BOOL)a3
{
  self->_nextButtonHiddenStateChanged = a3;
}

- (BOOL)animatePrevButton
{
  return self->_animatePrevButton;
}

- (void)setAnimatePrevButton:(BOOL)a3
{
  self->_BOOL animatePrevButton = a3;
}

- (BOOL)animateNextButton
{
  return self->_animateNextButton;
}

- (void)setAnimateNextButton:(BOOL)a3
{
  self->_animateNextButton = a3;
}

@end
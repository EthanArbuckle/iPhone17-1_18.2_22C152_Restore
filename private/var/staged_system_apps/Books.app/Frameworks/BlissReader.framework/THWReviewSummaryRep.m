@interface THWReviewSummaryRep
- (BOOL)directlyManagesLayerContent;
- (BOOL)showingResults;
- (CALayer)spinnerLayer;
- (THWReviewSummaryRep)initWithLayout:(id)a3 canvas:(id)a4;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)controlContainer:(id)a3 addChildLayersToArray:(id)a4;
- (void)dealloc;
- (void)didUpdateLayer:(id)a3;
- (void)p_updateWantsSpinner;
- (void)viewScrollWillChange;
@end

@implementation THWReviewSummaryRep

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewSummaryRep;
  [(THWReviewSummaryRep *)&v3 dealloc];
}

- (THWReviewSummaryRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THWReviewSummaryRep;
  v4 = [(THWReviewSummaryRep *)&v7 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4)
  {
    v4->_showingResults = objc_msgSend(objc_msgSend(-[THWReviewSummaryRep layout](v4, "layout"), "delegate"), "reviewSummaryShouldShowResults");
    [(THWReviewSummaryRep *)v5 p_updateWantsSpinner];
  }
  return v5;
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)viewScrollWillChange
{
  self->_wantsSpinner = 1;
  id v2 = [(THWReviewSummaryRep *)self interactiveCanvasController];

  [v2 invalidateLayers];
}

- (void)p_updateWantsSpinner
{
  if (self->_showingResults)
  {
    BOOL v3 = 0;
  }
  else
  {
    [self.interactiveCanvasController visibleUnscaledRect];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [self layout].frameInRoot
    v19.origin.x = v12;
    v19.origin.y = v13;
    v19.size.width = v14;
    v19.size.height = v15;
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    BOOL v3 = CGRectIntersectsRect(v18, v19);
  }
  if (self->_wantsSpinner != v3)
  {
    self->_wantsSpinner = v3;
    id v16 = [(THWReviewSummaryRep *)self interactiveCanvasController];
    [v16 invalidateLayers];
  }
}

- (void)didUpdateLayer:(id)a3
{
  id v5 = [(THWReviewSummaryRep *)self layout];
  id v6 = [[-[THWReviewSummaryRep canvas](self, "canvas")] repForLayout:[v5 resultsLayout]];
  id v7 = [[-[THWReviewSummaryRep canvas](self, "canvas") repForLayout:[v5 checkingLayout]];
  id v8 = [[self interactiveCanvasController] layerForRep:v6];
  id v9 = [[self interactiveCanvasController] layerForRep:v7];
  id v10 = objc_msgSend(objc_msgSend(v5, "delegate"), "reviewSummaryShouldShowResults");
  [v8 setHidden:v10 ^ 1];
  [v9 setHidden:v10];
  if (self->_showingResults != v10)
  {
    +[CATransaction begin];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1A1E28;
    v12[3] = &unk_457278;
    v12[4] = self;
    char v13 = (char)v10;
    +[CATransaction setCompletionBlock:v12];
    id v11 = +[CATransition animation];
    [v11 setType:kCATransitionFade];
    [v11 setBeginTime:CACurrentMediaTime() + 0.25];
    [v11 setDuration:0.25];
    [v11 setFillMode:kCAFillModeBoth];
    [a3 addAnimation:v11 forKey:@"fadeAnimation"];
    +[CATransaction commit];
  }
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  if ([a3 tag] == (char *)&dword_4 + 2)
  {
    objc_opt_class();
    id v5 = (void *)TSUDynamicCast();
    [v5 setDelegate:self];
  }
}

- (void)controlContainer:(id)a3 addChildLayersToArray:(id)a4
{
  if (objc_msgSend(objc_msgSend(a3, "layout"), "tag") == (char *)&dword_4 + 2)
  {
    spinnerLayer = self->_spinnerLayer;
    if (self->_wantsSpinner)
    {
      if (!spinnerLayer)
      {
        id v7 = +[CALayer layer];
        self->_spinnerLayer = v7;
        -[CALayer setBounds:](v7, "setBounds:", 0.0, 0.0, 40.0, 40.0);
        for (unint64_t i = 0; i != 12; ++i)
        {
          id v9 = +[CALayer layer];
          -[CALayer setBounds:](v9, "setBounds:", 0.0, 0.0, 3.0, 8.0);
          [(CALayer *)v9 setCornerRadius:1.5];
          [v9 setBackgroundColor:[+[TSUColor blackColor](TSUColor, "blackColor") CGColor]];
          -[CALayer setAnchorPoint:](v9, "setAnchorPoint:", 0.5, 1.75);
          -[CALayer setPosition:](v9, "setPosition:", 20.0, 20.0);
          CGAffineTransformMakeRotation(&v30, (double)i * 0.523598776);
          [(CALayer *)v9 setAffineTransform:&v30];
          [(CALayer *)self->_spinnerLayer addSublayer:v9];
          id v10 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
          LODWORD(v11) = 1.0;
          [(CABasicAnimation *)v10 setFromValue:+[NSNumber numberWithFloat:v11]];
          [(CABasicAnimation *)v10 setToValue:+[NSNumber numberWithFloat:0.0]];
          [(CABasicAnimation *)v10 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
          LODWORD(v12) = 2139095040;
          [(CABasicAnimation *)v10 setRepeatCount:v12];
          [(CABasicAnimation *)v10 setDuration:1.0];
          [(CABasicAnimation *)v10 setTimeOffset:(double)i * -0.0833333333];
          [(CALayer *)v9 addAnimation:v10 forKey:@"MarkerAnimationKey"];
        }
      }
      id v13 = [self layout].checkingWPLayout;
      id v14 = [(-[THWReviewSummaryRep canvas](self, "canvas")) repForLayout:v13];
      objc_msgSend(objc_msgSend(objc_msgSend(v13, "columns"), "lastObject"), "typographicBounds");
      [v14 convertNaturalRectToUnscaledCanvas:];
      objc_msgSend(objc_msgSend(v14, "canvas"), "convertUnscaledToBoundsRect:", v15, v16, v17, v18);
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      if ([(THWReviewSummaryRep *)self parentRep])
      {
        [self parentRep].layerFrameInScaledCanvas;
        TSDSubtractPoints();
        CGFloat v20 = v27;
        CGFloat v22 = v28;
      }
      v31.origin.x = v20;
      v31.origin.y = v22;
      v31.size.width = v24;
      v31.size.height = v26;
      CGFloat v29 = CGRectGetMinX(v31) + -20.0;
      v32.origin.x = v20;
      v32.origin.y = v22;
      v32.size.width = v24;
      v32.size.height = v26;
      -[CALayer setPosition:](self->_spinnerLayer, "setPosition:", v29, CGRectGetMidY(v32));
      if (self->_spinnerLayer) {
        [a4 addObject:];
      }
    }
    else
    {

      self->_spinnerLayer = 0;
    }
  }
}

- (BOOL)showingResults
{
  return self->_showingResults;
}

- (CALayer)spinnerLayer
{
  return self->_spinnerLayer;
}

@end
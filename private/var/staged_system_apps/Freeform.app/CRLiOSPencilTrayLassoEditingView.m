@interface CRLiOSPencilTrayLassoEditingView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isBringForwardEnabled;
- (BOOL)isSendBackwardEnabled;
- (CRLiOSPencilTrayLassoEditingView)initWithCoder:(id)a3;
- (CRLiOSPencilTrayLassoEditingView)initWithFrame:(CGRect)a3;
- (UIColor)selectedFillColor;
- (UIColor)selectedStrokeColor;
- (id)p_makeZOrderButton;
- (id)p_makeZOrderButtonConfiguration;
- (id)p_makeZOrderButtonImageForForward:(BOOL)a3 pointSize:(double)a4;
- (void)dealloc;
- (void)forBringForwardAddTarget:(id)a3 action:(SEL)a4;
- (void)forBringToFrontAddTarget:(id)a3 action:(SEL)a4;
- (void)forFillColorChangeAddTarget:(id)a3 action:(SEL)a4;
- (void)forSendBackwardAddTarget:(id)a3 action:(SEL)a4;
- (void)forSendToBackAddTarget:(id)a3 action:(SEL)a4;
- (void)forStrokeColorChangeAddTarget:(id)a3 action:(SEL)a4;
- (void)layoutSubviews;
- (void)p_commonInit;
- (void)p_updateLongPressGestureDurations;
- (void)setBringForwardEnabled:(BOOL)a3;
- (void)setSelectedFillColor:(id)a3;
- (void)setSelectedStrokeColor:(id)a3;
- (void)setSendBackwardEnabled:(BOOL)a3;
- (void)toggleFillColorPickerPresentation;
- (void)toggleStrokeColorPickerPresentation;
@end

@implementation CRLiOSPencilTrayLassoEditingView

- (CRLiOSPencilTrayLassoEditingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSPencilTrayLassoEditingView;
  v3 = -[CRLiOSPencilTrayLassoEditingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CRLiOSPencilTrayLassoEditingView *)v3 p_commonInit];
  }
  return v4;
}

- (CRLiOSPencilTrayLassoEditingView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSPencilTrayLassoEditingView;
  v3 = [(CRLiOSPencilTrayLassoEditingView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CRLiOSPencilTrayLassoEditingView *)v3 p_commonInit];
  }
  return v4;
}

- (void)p_commonInit
{
  v3 = objc_alloc_init(CRLiOSPencilTrayColorWell);
  fillColorWell = self->_fillColorWell;
  self->_fillColorWell = v3;

  v5 = +[NSBundle mainBundle];
  objc_super v6 = [v5 localizedStringForKey:@"Fill color" value:0 table:0];
  [(CRLiOSPencilTrayColorWell *)self->_fillColorWell setAccessibilityLabel:v6];

  [(CRLiOSPencilTrayColorWell *)self->_fillColorWell setIsAccessibilityElement:1];
  [(CRLiOSPencilTrayLassoEditingView *)self addSubview:self->_fillColorWell];
  v7 = objc_alloc_init(CRLiOSPencilTrayColorWell);
  strokeColorWell = self->_strokeColorWell;
  self->_strokeColorWell = v7;

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Stroke color" value:0 table:0];
  [(CRLiOSPencilTrayColorWell *)self->_strokeColorWell setAccessibilityLabel:v10];

  [(CRLiOSPencilTrayColorWell *)self->_strokeColorWell setIsAccessibilityElement:1];
  [(CRLiOSPencilTrayColorWell *)self->_strokeColorWell setForStrokeColor:1];
  [(CRLiOSPencilTrayLassoEditingView *)self addSubview:self->_strokeColorWell];
  v11 = [(CRLiOSPencilTrayLassoEditingView *)self p_makeZOrderButton];
  sendBackwardButton = self->_sendBackwardButton;
  self->_sendBackwardButton = v11;

  v13 = +[NSBundle mainBundle];
  id v27 = [v13 localizedStringForKey:@"Send backward" value:0 table:0];

  [(CRLAXZorderButton *)self->_sendBackwardButton setAccessibilityLabel:v27];
  [(CRLAXZorderButton *)self->_sendBackwardButton setLargeContentTitle:v27];
  v14 = (UILongPressGestureRecognizer *)objc_alloc_init((Class)UILongPressGestureRecognizer);
  sendToBackGR = self->_sendToBackGR;
  self->_sendToBackGR = v14;

  [(UILongPressGestureRecognizer *)self->_sendToBackGR setDelegate:self];
  [(CRLAXZorderButton *)self->_sendBackwardButton addGestureRecognizer:self->_sendToBackGR];
  v16 = (UILargeContentViewerInteraction *)objc_alloc_init((Class)UILargeContentViewerInteraction);
  largeContentViewerInteractionForSendBackwardButton = self->_largeContentViewerInteractionForSendBackwardButton;
  self->_largeContentViewerInteractionForSendBackwardButton = v16;

  [(CRLAXZorderButton *)self->_sendBackwardButton addInteraction:self->_largeContentViewerInteractionForSendBackwardButton];
  [(CRLiOSPencilTrayLassoEditingView *)self addSubview:self->_sendBackwardButton];
  v18 = [(CRLiOSPencilTrayLassoEditingView *)self p_makeZOrderButton];
  bringForwardButton = self->_bringForwardButton;
  self->_bringForwardButton = v18;

  v20 = +[NSBundle mainBundle];
  v21 = [v20 localizedStringForKey:@"Bring forward" value:0 table:0];

  [(CRLAXZorderButton *)self->_bringForwardButton setAccessibilityLabel:v21];
  [(CRLAXZorderButton *)self->_bringForwardButton setLargeContentTitle:v21];
  v22 = (UILongPressGestureRecognizer *)objc_alloc_init((Class)UILongPressGestureRecognizer);
  bringToFrontGR = self->_bringToFrontGR;
  self->_bringToFrontGR = v22;

  [(UILongPressGestureRecognizer *)self->_bringToFrontGR setDelegate:self];
  [(CRLAXZorderButton *)self->_bringForwardButton addGestureRecognizer:self->_bringToFrontGR];
  v24 = (UILargeContentViewerInteraction *)objc_alloc_init((Class)UILargeContentViewerInteraction);
  largeContentViewerInteractionForBringForwardButton = self->_largeContentViewerInteractionForBringForwardButton;
  self->_largeContentViewerInteractionForBringForwardButton = v24;

  [(CRLAXZorderButton *)self->_bringForwardButton addInteraction:self->_largeContentViewerInteractionForBringForwardButton];
  [(CRLiOSPencilTrayLassoEditingView *)self addSubview:self->_bringForwardButton];
  [(CRLiOSPencilTrayLassoEditingView *)self p_updateLongPressGestureDurations];
  v26 = +[NSNotificationCenter defaultCenter];
  [v26 addObserver:self selector:"p_updateLongPressGestureDurations" name:UILargeContentViewerInteractionEnabledStatusDidChangeNotification object:0];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UILargeContentViewerInteractionEnabledStatusDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSPencilTrayLassoEditingView;
  [(CRLiOSPencilTrayLassoEditingView *)&v4 dealloc];
}

- (id)p_makeZOrderButton
{
  v3 = objc_alloc_init(CRLAXZorderButton);
  objc_super v4 = [(CRLiOSPencilTrayLassoEditingView *)self p_makeZOrderButtonConfiguration];
  [(CRLAXZorderButton *)v3 setConfiguration:v4];

  [(CRLAXZorderButton *)v3 setIsAccessibilityElement:1];
  [(CRLAXZorderButton *)v3 setPointerInteractionEnabled:1];
  [(CRLAXZorderButton *)v3 setShowsLargeContentViewer:1];

  return v3;
}

- (id)p_makeZOrderButtonConfiguration
{
  v2 = +[UIButtonConfiguration grayButtonConfiguration];
  [v2 setCornerStyle:4];
  v3 = +[UIColor tertiarySystemFillColor];
  [v2 setBaseBackgroundColor:v3];

  objc_super v4 = +[UIColor secondaryLabelColor];
  [v2 setBaseForegroundColor:v4];

  return v2;
}

- (id)p_makeZOrderButtonImageForForward:(BOOL)a3 pointSize:(double)a4
{
  v5 = @"square.2.stack.3d.bottom.filled";
  if (a3) {
    v5 = @"square.2.stack.3d.top.filled";
  }
  objc_super v6 = v5;
  v7 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:2 scale:a4];
  v8 = +[UIImage systemImageNamed:v6 withConfiguration:v7];

  return v8;
}

- (UIColor)selectedFillColor
{
  return [(CRLiOSPencilTrayColorWell *)self->_fillColorWell selectedColor];
}

- (void)setSelectedFillColor:(id)a3
{
  -[CRLiOSPencilTrayColorWell setSelectedColor:](self->_fillColorWell, "setSelectedColor:");
  fillColorWell = self->_fillColorWell;

  [(CRLiOSPencilTrayColorWell *)fillColorWell setHidden:a3 == 0];
}

- (UIColor)selectedStrokeColor
{
  return [(CRLiOSPencilTrayColorWell *)self->_strokeColorWell selectedColor];
}

- (void)setSelectedStrokeColor:(id)a3
{
  -[CRLiOSPencilTrayColorWell setSelectedColor:](self->_strokeColorWell, "setSelectedColor:");
  strokeColorWell = self->_strokeColorWell;

  [(CRLiOSPencilTrayColorWell *)strokeColorWell setHidden:a3 == 0];
}

- (BOOL)isSendBackwardEnabled
{
  return [(CRLAXZorderButton *)self->_sendBackwardButton isEnabled];
}

- (void)setSendBackwardEnabled:(BOOL)a3
{
  [(CRLAXZorderButton *)self->_sendBackwardButton setEnabled:a3];
  sendBackwardButton = self->_sendBackwardButton;

  [(CRLAXZorderButton *)sendBackwardButton layoutIfNeeded];
}

- (BOOL)isBringForwardEnabled
{
  return [(CRLAXZorderButton *)self->_bringForwardButton isEnabled];
}

- (void)setBringForwardEnabled:(BOOL)a3
{
  [(CRLAXZorderButton *)self->_bringForwardButton setEnabled:a3];
  bringForwardButton = self->_bringForwardButton;

  [(CRLAXZorderButton *)bringForwardButton layoutIfNeeded];
}

- (void)forFillColorChangeAddTarget:(id)a3 action:(SEL)a4
{
}

- (void)forStrokeColorChangeAddTarget:(id)a3 action:(SEL)a4
{
}

- (void)forSendBackwardAddTarget:(id)a3 action:(SEL)a4
{
}

- (void)forSendToBackAddTarget:(id)a3 action:(SEL)a4
{
  sendToBackGR = self->_sendToBackGR;
  id v7 = a3;
  [(UILongPressGestureRecognizer *)sendToBackGR addTarget:v7 action:a4];
  [(CRLAXZorderButton *)self->_sendBackwardButton setTarget:v7];

  [(CRLAXZorderButton *)self->_sendBackwardButton setAction:a4];
  id v9 = +[NSBundle mainBundle];
  v8 = [v9 localizedStringForKey:@"Send to back" value:0 table:0];
  [(CRLAXZorderButton *)self->_sendBackwardButton setActionTitle:v8];
}

- (void)forBringForwardAddTarget:(id)a3 action:(SEL)a4
{
}

- (void)forBringToFrontAddTarget:(id)a3 action:(SEL)a4
{
  bringToFrontGR = self->_bringToFrontGR;
  id v7 = a3;
  [(UILongPressGestureRecognizer *)bringToFrontGR addTarget:v7 action:a4];
  [(CRLAXZorderButton *)self->_bringForwardButton setTarget:v7];

  [(CRLAXZorderButton *)self->_bringForwardButton setAction:a4];
  id v9 = +[NSBundle mainBundle];
  v8 = [v9 localizedStringForKey:@"Bring to front" value:0 table:0];
  [(CRLAXZorderButton *)self->_bringForwardButton setActionTitle:v8];
}

- (void)toggleFillColorPickerPresentation
{
  if ([(CRLiOSPencilTrayColorWell *)self->_fillColorWell isHidden])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E4110);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108ED30();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E4130);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    objc_super v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayLassoEditingView toggleFillColorPickerPresentation]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayLassoEditingView.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:237 isFatal:0 description:"Should not try to toggle fill color picker presentation while its color well is hidden."];
  }
  else
  {
    fillColorWell = self->_fillColorWell;
    [(CRLiOSPencilTrayColorWell *)fillColorWell toggleColorPickerPresentation];
  }
}

- (void)toggleStrokeColorPickerPresentation
{
  if ([(CRLiOSPencilTrayColorWell *)self->_strokeColorWell isHidden])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E4150);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108EDC4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E4170);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    objc_super v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayLassoEditingView toggleStrokeColorPickerPresentation]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayLassoEditingView.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:246 isFatal:0 description:"Should not try to toggle stroke color picker presentation while its color well is hidden."];
  }
  else
  {
    strokeColorWell = self->_strokeColorWell;
    [(CRLiOSPencilTrayColorWell *)strokeColorWell toggleColorPickerPresentation];
  }
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)CRLiOSPencilTrayLassoEditingView;
  [(CRLiOSPencilTrayLassoEditingView *)&v36 layoutSubviews];
  [(CRLiOSPencilTrayLassoEditingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(CRLiOSPencilTrayLassoEditingView *)self traitCollection];
  if ([v7 userInterfaceIdiom] && objc_msgSend(v7, "horizontalSizeClass") != (id)1)
  {
    if (v4 >= v6) {
      double v14 = v6;
    }
    else {
      double v14 = v4;
    }
    double v10 = (v14 + -12.0) * 0.5;
    double v9 = 12.0;
    double v11 = 0.0;
    int v8 = 1;
    unint64_t v13 = 2;
    unint64_t v12 = 2;
  }
  else
  {
    int v8 = 0;
    double v9 = (v4 + -28.0 + -112.0) / 3.0;
    double v10 = 28.0;
    double v11 = 14.0;
    unint64_t v12 = 4;
    unint64_t v13 = 1;
  }
  v31 = v7;
  strokeColorWell = self->_strokeColorWell;
  v38[0] = self->_fillColorWell;
  v38[1] = strokeColorWell;
  bringForwardButton = self->_bringForwardButton;
  v38[2] = self->_sendBackwardButton;
  v38[3] = bringForwardButton;
  +[NSArray arrayWithObjects:v38 count:4];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v18)
  {
    id v19 = v18;
    double v20 = (v4 - (v9 * (double)(v12 - 1) + v10 * (double)v12 + v11 * 2.0)) * 0.5;
    double v21 = (v6 - (v9 * (double)(v13 - 1) + v10 * (double)v13)) * 0.5;
    uint64_t v22 = *(void *)v33;
    double v23 = v9 + v10;
    double v24 = v20;
    do
    {
      v25 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v17);
        }
        v26 = *(CRLiOSPencilTrayColorWell **)(*((void *)&v32 + 1) + 8 * (void)v25);
        -[CRLiOSPencilTrayColorWell setFrame:](v26, "setFrame:", v24, v21, v10, v10);
        if (v8 && v26 == self->_strokeColorWell)
        {
          double v21 = v23 + v21;
          double v24 = v20;
        }
        else
        {
          double v24 = v23 + v24;
        }
        v25 = (char *)v25 + 1;
      }
      while (v19 != v25);
      id v27 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
      id v19 = v27;
    }
    while (v27);
  }

  double v28 = round(v10 * 0.45);
  if (v28 != self->_currentZOrderImagePoints)
  {
    v29 = [(CRLiOSPencilTrayLassoEditingView *)self p_makeZOrderButtonImageForForward:0 pointSize:v28];
    [(CRLAXZorderButton *)self->_sendBackwardButton setImage:v29 forState:0];
    [(CRLAXZorderButton *)self->_sendBackwardButton setLargeContentImage:v29];
    v30 = [(CRLiOSPencilTrayLassoEditingView *)self p_makeZOrderButtonImageForForward:1 pointSize:v28];
    [(CRLAXZorderButton *)self->_bringForwardButton setImage:v30 forState:0];
    [(CRLAXZorderButton *)self->_bringForwardButton setLargeContentImage:v30];
    self->_currentZOrderImagePoints = v28;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  double v6 = (UILongPressGestureRecognizer *)a3;
  id v7 = a4;
  if (self->_sendToBackGR == v6)
  {
    double v9 = &OBJC_IVAR___CRLiOSPencilTrayLassoEditingView__largeContentViewerInteractionForSendBackwardButton;
LABEL_6:
    id v10 = [*(id *)((char *)&self->super.super.super.isa + *v9) gestureRecognizerForExclusionRelationship];
    BOOL v8 = v10 == v7;

    goto LABEL_7;
  }
  if (self->_bringToFrontGR == v6)
  {
    double v9 = &OBJC_IVAR___CRLiOSPencilTrayLassoEditingView__largeContentViewerInteractionForBringForwardButton;
    goto LABEL_6;
  }
  BOOL v8 = 0;
LABEL_7:

  return v8;
}

- (void)p_updateLongPressGestureDurations
{
  if (+[UILargeContentViewerInteraction isEnabled]) {
    double v3 = 3.0;
  }
  else {
    double v3 = 1.0;
  }
  [(UILongPressGestureRecognizer *)self->_sendToBackGR setMinimumPressDuration:v3];
  bringToFrontGR = self->_bringToFrontGR;

  [(UILongPressGestureRecognizer *)bringToFrontGR setMinimumPressDuration:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeContentViewerInteractionForBringForwardButton, 0);
  objc_storeStrong((id *)&self->_largeContentViewerInteractionForSendBackwardButton, 0);
  objc_storeStrong((id *)&self->_bringToFrontGR, 0);
  objc_storeStrong((id *)&self->_bringForwardButton, 0);
  objc_storeStrong((id *)&self->_sendToBackGR, 0);
  objc_storeStrong((id *)&self->_sendBackwardButton, 0);
  objc_storeStrong((id *)&self->_strokeColorWell, 0);

  objc_storeStrong((id *)&self->_fillColorWell, 0);
}

@end
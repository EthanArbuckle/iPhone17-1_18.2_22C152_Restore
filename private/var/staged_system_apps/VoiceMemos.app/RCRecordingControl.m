@interface RCRecordingControl
- (BOOL)_hasOuterRingLayer;
- (BOOL)_isInsideForLocation:(CGPoint)a3;
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)enabled;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)pressed;
- (CAShapeLayer)innerStateLayer;
- (CAShapeLayer)outerRingLayer;
- (CAShapeLayer)pauseShapeLayer;
- (CGPath)_circlePath;
- (CGPath)_circlePath:(double)a3;
- (CGPath)_fillPathAnimateEndForState:(int64_t)a3 fromState:(int64_t)a4;
- (CGPath)_fillPathAnimateStartForState:(int64_t)a3 fromState:(int64_t)a4;
- (CGPath)_fillPathForState:(int64_t)a3;
- (CGPath)_interactionPath;
- (CGPath)_labelLozengePath;
- (CGPath)_microCirclePath;
- (CGPath)_pausePath;
- (CGPath)_ringLozengePath:(BOOL)a3;
- (CGPath)_ringLozengePathWithHeight:(double)a3 extraWidth:(double)a4;
- (CGPath)_ringPath:(BOOL)a3;
- (CGPath)_ringPathForState:(int64_t)a3;
- (CGPath)_ringPathForState:(int64_t)a3 includingStrokeThickeness:(BOOL)a4;
- (CGPath)_squarePath;
- (CGPoint)_getSquarePathPosition;
- (CGRect)_accessibilityBounds;
- (CGRect)accessibilityFrame;
- (CGSize)intrinsicContentSize;
- (RCRecordingControl)initWithDiameter:(double)a3;
- (RCRecordingControlDelegate)delegate;
- (UIColor)fontColor;
- (UIColor)fontColorResume;
- (UIColor)innerColor;
- (UIColor)innerColorResume;
- (UIColor)outerColor;
- (UIColor)outerColorResume;
- (UIColor)resolvedInnerColor;
- (UIColor)resolvedInnerColorResume;
- (UIColor)resolvedOuterColor;
- (UIColor)resolvedOuterColorResume;
- (UILabel)namedStateLabel;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (_TtC10VoiceMemos30RCRecordingControlLayoutHelper)layoutHelper;
- (double)_labelWidth;
- (double)_ringOpacityForState:(int64_t)a3;
- (double)_xInset;
- (double)diameter;
- (double)innerSquareCornerRadius;
- (double)innerSquareWidth;
- (double)layerAlpha;
- (double)outerRingGap;
- (double)outerRingThickness;
- (double)pauseStrokeCornerRadius;
- (id)_accessibilityLabelTextForState:(int64_t)a3;
- (id)_buttonTextForState:(int64_t)a3;
- (id)_resolvedFillColorForState:(int64_t)a3;
- (id)_resolvedRingColorForState:(int64_t)a3;
- (id)_textColorForState:(int64_t)a3;
- (id)accessibilityPath;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)recordingControlState;
- (unint64_t)accessibilityTraits;
- (void)_commonInit;
- (void)_handleUserTouch:(id)a3;
- (void)_processControlActuation;
- (void)_styleView;
- (void)_syncLongPressGestureRecognizerEnablement;
- (void)_updateVisibilityOfNamedStateLabel:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateVisualState:(BOOL)a3 fromState:(int64_t)a4;
- (void)crossfadePauseLayer:(BOOL)a3 animated:(BOOL)a4;
- (void)crossfadeText:(id)a3 color:(id)a4 animated:(BOOL)a5;
- (void)fadeOutPauseAndInText:(BOOL)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
- (void)resolveColors;
- (void)setDelegate:(id)a3;
- (void)setDiameter:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFontColor:(id)a3;
- (void)setFontColorResume:(id)a3;
- (void)setInnerColor:(id)a3;
- (void)setInnerColorResume:(id)a3;
- (void)setInnerSquareCornerRadius:(double)a3;
- (void)setInnerSquareWidth:(double)a3;
- (void)setInnerStateLayer:(id)a3;
- (void)setLayoutHelper:(id)a3;
- (void)setLongPressRecognizer:(id)a3;
- (void)setNamedStateLabel:(id)a3;
- (void)setOuterColor:(id)a3;
- (void)setOuterColorResume:(id)a3;
- (void)setOuterRingGap:(double)a3;
- (void)setOuterRingLayer:(id)a3;
- (void)setOuterRingThickness:(double)a3;
- (void)setPauseShapeLayer:(id)a3;
- (void)setPauseStrokeCornerRadius:(double)a3;
- (void)setPressed:(BOOL)a3;
- (void)setRecordAccessibilityLabel;
- (void)setRecordingControlState:(int64_t)a3;
- (void)setRecordingControlState:(int64_t)a3 animated:(BOOL)a4 force:(BOOL)a5;
- (void)setResolvedInnerColor:(id)a3;
- (void)setResolvedInnerColorResume:(id)a3;
- (void)setResolvedOuterColor:(id)a3;
- (void)setResolvedOuterColorResume:(id)a3;
- (void)updateLayerAlphaIfVisible:(id)a3;
@end

@implementation RCRecordingControl

- (void)setRecordingControlState:(int64_t)a3
{
  v5 = [(RCRecordingControl *)self traitCollection];
  unsigned int v6 = [v5 isInAndromeda];

  [(RCRecordingControl *)self setRecordingControlState:a3 animated:v6 ^ 1 force:0];
}

- (void)setRecordingControlState:(int64_t)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  int64_t recordingControlState = self->_recordingControlState;
  if (a5 || recordingControlState != a3)
  {
    self->_int64_t recordingControlState = a3;
    [(RCRecordingControl *)self _updateVisualState:a4 fromState:recordingControlState];
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  [(RCRecordingControl *)self _syncLongPressGestureRecognizerEnablement];
  v4 = [(RCRecordingControl *)self outerRingLayer];
  [(RCRecordingControl *)self updateLayerAlphaIfVisible:v4];

  v5 = [(RCRecordingControl *)self innerStateLayer];
  [(RCRecordingControl *)self updateLayerAlphaIfVisible:v5];

  unsigned int v6 = [(RCRecordingControl *)self pauseShapeLayer];
  [(RCRecordingControl *)self updateLayerAlphaIfVisible:v6];

  v7 = [(RCRecordingControl *)self namedStateLabel];
  [v7 alpha];
  BOOL v9 = v8 != 0.0;

  [(RCRecordingControl *)self _updateVisibilityOfNamedStateLabel:v9 animated:0];
}

- (void)_syncLongPressGestureRecognizerEnablement
{
  if ([(RCRecordingControl *)self enabled]) {
    BOOL v3 = !self->_longPressBeingThrottled;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = [(RCRecordingControl *)self longPressRecognizer];
  [v4 setEnabled:v3];
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    [(RCRecordingControl *)self _updateVisualState:1 fromState:self->_recordingControlState];
  }
}

- (void)setInnerColor:(id)a3
{
}

- (double)layerAlpha
{
  unsigned int v2 = [(RCRecordingControl *)self enabled];
  double result = 0.5;
  if (v2) {
    return 1.0;
  }
  return result;
}

- (void)updateLayerAlphaIfVisible:(id)a3
{
  id v6 = a3;
  [v6 opacity];
  if (v4 != 0.0)
  {
    [(RCRecordingControl *)self layerAlpha];
    *(float *)&double v5 = v5;
    [v6 setOpacity:v5];
  }
}

- (RCRecordingControl)initWithDiameter:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RCRecordingControl;
  float v4 = -[RCRecordingControl initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  double v5 = v4;
  if (v4)
  {
    v4->_diameter = a3;
    [(RCRecordingControl *)v4 _commonInit];
  }
  return v5;
}

- (void)_commonInit
{
  [(RCRecordingControl *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  float v4 = [[_TtC10VoiceMemos30RCRecordingControlLayoutHelper alloc] initWithDiameter:self->_diameter];
  layoutHelper = self->_layoutHelper;
  self->_layoutHelper = v4;

  [(RCRecordingControlLayoutHelper *)self->_layoutHelper recordingControlOuterRingThickness];
  self->_outerRingThickness = v6;
  [(RCRecordingControlLayoutHelper *)self->_layoutHelper recordingControlOuterRingGap];
  self->_outerRingGap = v7;
  [(RCRecordingControlLayoutHelper *)self->_layoutHelper recordingControlInnerSquareWidth];
  self->_innerSquareWidth = v8;
  [(RCRecordingControlLayoutHelper *)self->_layoutHelper recordingControlSquareCornerRadius];
  self->_innerSquareCornerRadius = v9;
  v10 = [v3 recordingControlFontColor];
  fontColor = self->_fontColor;
  self->_fontColor = v10;

  v12 = [v3 recordingControlInnerColor];
  innerColor = self->_innerColor;
  self->_innerColor = v12;

  v14 = [v3 recordingControlFontColorResume];
  fontColorResume = self->_fontColorResume;
  self->_fontColorResume = v14;

  v16 = [v3 recordingControlInnerColorResume];
  innerColorResume = self->_innerColorResume;
  self->_innerColorResume = v16;

  v18 = [v3 recordingControlOuterColorResume];
  outerColorResume = self->_outerColorResume;
  self->_outerColorResume = v18;

  [(RCRecordingControlLayoutHelper *)self->_layoutHelper recordingControlPauseStrokeCornerRadius];
  self->_pauseStrokeCornerRadius = v20;
  v21 = [(RCRecordingControl *)self layer];
  if ([(RCRecordingControl *)self _hasOuterRingLayer])
  {
    v22 = objc_opt_new();
    [(RCRecordingControl *)self setOuterRingLayer:v22];
    [v22 setStrokeColor:[self->_outerColor CGColor]];
    [v22 setLineWidth:self->_outerRingThickness];
    id v23 = +[UIColor clearColor];
    objc_msgSend(v22, "setFillColor:", objc_msgSend(v23, "CGColor"));

    [v21 addSublayer:v22];
  }
  v24 = objc_opt_new();
  [(RCRecordingControl *)self setInnerStateLayer:v24];
  [v24 setFillColor:[self->_innerColor CGColor]];
  [v24 setPath:[self _circlePath]];
  [v21 addSublayer:v24];
  v25 = objc_opt_new();
  [(RCRecordingControl *)self setPauseShapeLayer:v25];
  [v25 setFillColor:[self->_innerColor CGColor]];
  [v25 setPath:[self _pausePath]];
  [v25 setOpacity:0.0];
  [v21 addSublayer:v25];
  v26 = objc_opt_new();
  v27 = +[NSBundle mainBundle];
  v28 = [v27 localizedStringForKey:@"APPEND" value:&stru_100228BC8 table:0];
  [v26 setText:v28];

  [(RCRecordingControl *)self setNamedStateLabel:v26];
  [(RCRecordingControl *)self addSubview:v26];
  [v26 alignCenterToCenterOfView:self];
  [v26 setTextColor:self->_fontColor];
  v29 = [v3 recordingControlTextFont];
  [v26 setFont:v29];

  id v30 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_handleUserTouch:"];
  [(RCRecordingControl *)self addGestureRecognizer:v30];
  [(RCRecordingControl *)self setLongPressRecognizer:v30];
  [v30 setMinimumPressDuration:0.0];
  [v30 setDelegate:self];
  v31 = OSLogForCategory();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_10016C9FC((uint64_t)self, v31);
  }

  [(RCRecordingControl *)self resolveColors];
  [(RCRecordingControl *)self _styleView];
  self->_enabled = 1;
  id v32 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:self];
  [(RCRecordingControl *)self addInteraction:v32];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RCRecordingControl;
  [(RCRecordingControl *)&v3 layoutSubviews];
  [(RCRecordingControl *)self resolveColors];
}

- (BOOL)_hasOuterRingLayer
{
  return 1;
}

- (void)_styleView
{
  id v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  objc_super v3 = [v7 recordingControlOuterColor];
  [(RCRecordingControl *)self setOuterColor:v3];
  id v4 = [(RCRecordingControl *)self _resolvedRingColorForState:[(RCRecordingControl *)self recordingControlState]];
  id v5 = [v4 CGColor];
  double v6 = [(RCRecordingControl *)self outerRingLayer];
  [v6 setStrokeColor:v5];
}

- (void)resolveColors
{
  id v11 = [(RCRecordingControl *)self traitCollection];
  objc_super v3 = [(UIColor *)self->_innerColor resolvedColorWithTraitCollection:v11];
  resolvedInnerColor = self->_resolvedInnerColor;
  self->_resolvedInnerColor = v3;

  id v5 = [(UIColor *)self->_innerColorResume resolvedColorWithTraitCollection:v11];
  resolvedInnerColorResume = self->_resolvedInnerColorResume;
  self->_resolvedInnerColorResume = v5;

  id v7 = [(UIColor *)self->_outerColor resolvedColorWithTraitCollection:v11];
  resolvedOuterColor = self->_resolvedOuterColor;
  self->_resolvedOuterColor = v7;

  double v9 = [(UIColor *)self->_outerColorResume resolvedColorWithTraitCollection:v11];
  resolvedOuterColorResume = self->_resolvedOuterColorResume;
  self->_resolvedOuterColorResume = v9;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCRecordingControl;
  [(RCRecordingControl *)&v6 layoutSublayersOfLayer:a3];
  id v4 = [(RCRecordingControl *)self _pausePath];
  id v5 = [(RCRecordingControl *)self pauseShapeLayer];
  [v5 setPath:v4];

  [(RCRecordingControl *)self _updateVisualState:0 fromState:self->_recordingControlState];
}

- (void)_updateVisualState:(BOOL)a3 fromState:(int64_t)a4
{
  BOOL v5 = a3;
  id v7 = [(RCRecordingControl *)self _ringPathForState:self->_recordingControlState];
  id v8 = [(RCRecordingControl *)self _resolvedRingColorForState:self->_recordingControlState];
  id v9 = [v8 CGColor];

  [(RCRecordingControl *)self _ringOpacityForState:self->_recordingControlState];
  double v11 = v10;
  v12 = [(RCRecordingControl *)self _fillPathAnimateStartForState:self->_recordingControlState fromState:a4];
  v13 = [(RCRecordingControl *)self _fillPathAnimateEndForState:self->_recordingControlState fromState:a4];
  id v14 = [(RCRecordingControl *)self _resolvedFillColorForState:self->_recordingControlState];
  id v15 = [v14 CGColor];

  id v32 = v9;
  if ([(RCRecordingControl *)self pressed])
  {
    v16 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v16 recordingControlAlphaWhenPressed];
    double v18 = v17;
  }
  else
  {
    [(RCRecordingControl *)self layerAlpha];
    double v18 = v19;
  }
  id v33 = [(RCRecordingControl *)self _buttonTextForState:self->_recordingControlState];
  double v20 = [(RCRecordingControl *)self _textColorForState:self->_recordingControlState];
  int64_t recordingControlState = self->_recordingControlState;
  if (recordingControlState != 5 && recordingControlState)
  {
    v22 = [(RCRecordingControl *)self _accessibilityLabelTextForState:self->_recordingControlState];
    [(RCRecordingControl *)self setAccessibilityLabel:v22];
  }
  else
  {
    [(RCRecordingControl *)self setRecordAccessibilityLabel];
  }
  +[CATransaction begin];
  +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
  id v23 = [(RCRecordingControl *)self outerRingLayer];
  [v23 setPath:v7 animated:v5];

  v24 = [(RCRecordingControl *)self outerRingLayer];
  [v24 setStrokeColor:v32 animated:v5];

  v25 = [(RCRecordingControl *)self outerRingLayer];
  *(float *)&double v26 = v11;
  [v25 setOpacity:v5 animated:v26];

  v27 = [(RCRecordingControl *)self innerStateLayer];
  [v27 setPath:v13 fromPath:v12 animated:v5];

  v28 = [(RCRecordingControl *)self innerStateLayer];
  [v28 setFillColor:v15 animated:v5];

  v29 = [(RCRecordingControl *)self innerStateLayer];
  *(float *)&double v30 = v18;
  [v29 setOpacity:v5 animated:v30];

  if (a4 == 1 || recordingControlState == 1) {
    [(RCRecordingControl *)self crossfadePauseLayer:recordingControlState == 1 animated:v5];
  }
  id v31 = v33;
  if (v33)
  {
    [(RCRecordingControl *)self crossfadeText:v33 color:v20 animated:v5];
    id v31 = v33;
    if (a4 == 1)
    {
      [(RCRecordingControl *)self fadeOutPauseAndInText:v5];
      id v31 = v33;
    }
  }
  [(RCRecordingControl *)self _updateVisibilityOfNamedStateLabel:v31 != 0 animated:v5];
  +[CATransaction commit];
}

- (id)_resolvedRingColorForState:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 4) {
    objc_super v3 = &OBJC_IVAR___RCRecordingControl__resolvedOuterColorResume;
  }
  else {
    objc_super v3 = &OBJC_IVAR___RCRecordingControl__resolvedOuterColor;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (CGPath)_ringPathForState:(int64_t)a3
{
  return [(RCRecordingControl *)self _ringPathForState:a3 includingStrokeThickeness:0];
}

- (CGPath)_interactionPath
{
  int64_t v3 = [(RCRecordingControl *)self recordingControlState];

  return [(RCRecordingControl *)self _ringPathForState:v3 includingStrokeThickeness:1];
}

- (CGPath)_ringPathForState:(int64_t)a3 includingStrokeThickeness:(BOOL)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    return [(RCRecordingControl *)self _ringLozengePath:a4];
  }
  else {
    return [(RCRecordingControl *)self _ringPath:a4];
  }
}

- (double)_ringOpacityForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 7) < 4) {
    return 0.0;
  }
  [(RCRecordingControl *)self layerAlpha];
  return result;
}

- (id)_resolvedFillColorForState:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 4) {
    int64_t v3 = &OBJC_IVAR___RCRecordingControl__resolvedInnerColorResume;
  }
  else {
    int64_t v3 = &OBJC_IVAR___RCRecordingControl__resolvedInnerColor;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (CGPath)_fillPathAnimateStartForState:(int64_t)a3 fromState:(int64_t)a4
{
  if (a3 == 1 && a4 == 2 || a3 == 2 && a4 == 1) {
    return [(RCRecordingControl *)self _squarePath];
  }
  else {
    return [(RCRecordingControl *)self _fillPathForState:a4];
  }
}

- (CGPath)_fillPathAnimateEndForState:(int64_t)a3 fromState:(int64_t)a4
{
  if (a3 == 1 && a4 == 2 || a3 == 2 && a4 == 1) {
    return [(RCRecordingControl *)self _squarePath];
  }
  else {
    return -[RCRecordingControl _fillPathForState:](self, "_fillPathForState:");
  }
}

- (CGPath)_fillPathForState:(int64_t)a3
{
  if (a3 == 2) {
    return [(RCRecordingControl *)self _squarePath];
  }
  if (a3 == 1) {
    return [(RCRecordingControl *)self _microCirclePath];
  }
  if (a3) {
    return [(RCRecordingControl *)self _labelLozengePath];
  }
  return [(RCRecordingControl *)self _circlePath];
}

- (id)_accessibilityLabelTextForState:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      int64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"RECORD";
      goto LABEL_14;
    case 1:
      int64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"PAUSE";
      goto LABEL_14;
    case 2:
      int64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"STOP";
      goto LABEL_14;
    case 3:
      int64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"REPLACE";
      goto LABEL_14;
    case 4:
      int64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"RESUME";
      goto LABEL_14;
    case 5:
      int64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"BUSY";
      goto LABEL_14;
    case 6:
      int64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"INSERT";
      goto LABEL_14;
    case 7:
      int64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"DONE";
      goto LABEL_14;
    case 8:
      int64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"SAVE";
      goto LABEL_14;
    case 9:
      int64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"UNLOCK";
      goto LABEL_14;
    case 10:
      int64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"CANCEL";
LABEL_14:
      objc_super v6 = [v3 localizedStringForKey:v5 value:&stru_100228BC8 table:0];

      break;
    default:
      objc_super v6 = 0;
      break;
  }

  return v6;
}

- (id)_buttonTextForState:(int64_t)a3
{
  int64_t v3 = 0;
  switch(a3)
  {
    case 3:
      id v4 = +[NSBundle mainBundle];
      CFStringRef v5 = v4;
      CFStringRef v6 = @"REPLACE";
      goto LABEL_5;
    case 4:
      id v4 = +[NSBundle mainBundle];
      CFStringRef v5 = v4;
      CFStringRef v6 = @"RESUME";
      goto LABEL_5;
    case 6:
      id v4 = +[NSBundle mainBundle];
      CFStringRef v5 = v4;
      CFStringRef v6 = @"INSERT";
LABEL_5:
      id v7 = [v4 localizedStringForKey:v6 value:&stru_100228BC8 table:0];
      int64_t v3 = [v7 localizedUppercaseString];

      goto LABEL_11;
    case 7:
      id v8 = +[NSBundle mainBundle];
      CFStringRef v5 = v8;
      CFStringRef v9 = @"DONE";
      goto LABEL_10;
    case 8:
      id v8 = +[NSBundle mainBundle];
      CFStringRef v5 = v8;
      CFStringRef v9 = @"SAVE";
      goto LABEL_10;
    case 9:
      id v8 = +[NSBundle mainBundle];
      CFStringRef v5 = v8;
      CFStringRef v9 = @"UNLOCK";
      goto LABEL_10;
    case 10:
      id v8 = +[NSBundle mainBundle];
      CFStringRef v5 = v8;
      CFStringRef v9 = @"CANCEL";
LABEL_10:
      int64_t v3 = [v8 localizedStringForKey:v9 value:&stru_100228BC8 table:0];
LABEL_11:

      break;
    default:
      break;
  }

  return v3;
}

- (id)_textColorForState:(int64_t)a3
{
  switch(a3)
  {
    case 4:
    case 6:
      uint64_t v3 = 32;
      goto LABEL_5;
    case 7:
    case 9:
      id v4 = [(RCRecordingControl *)self fontColor];
      break;
    default:
      uint64_t v3 = 24;
LABEL_5:
      id v4 = *(id *)((char *)&self->super.super.super.isa + v3);
      break;
  }

  return v4;
}

- (void)crossfadePauseLayer:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(RCRecordingControl *)self layerAlpha];
  float v8 = v7;
  if (v5) {
    float v9 = v8;
  }
  else {
    float v9 = 0.0;
  }
  if (v5) {
    float v10 = 0.0;
  }
  else {
    float v10 = v8;
  }
  double v11 = [(RCRecordingControl *)self pauseShapeLayer];
  *(float *)&double v12 = v9;
  [v11 setOpacity:v4 animated:v12];

  id v14 = [(RCRecordingControl *)self innerStateLayer];
  *(float *)&double v13 = v10;
  [v14 setOpacity:v4 animated:v13];
}

- (void)fadeOutPauseAndInText:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(RCRecordingControl *)self pauseShapeLayer];
  [v5 setOpacity:v3 animated:0.0];

  CFStringRef v6 = [(RCRecordingControl *)self innerStateLayer];
  [v6 setPath:[self _labelLozengePath] animated:v3];

  double v7 = [(RCRecordingControl *)self innerStateLayer];
  [(RCRecordingControl *)self layerAlpha];
  *(float *)&double v8 = v8;
  [v7 setOpacity:v3 animated:v8];

  [(RCRecordingControl *)self _updateVisibilityOfNamedStateLabel:1 animated:v3];
}

- (void)crossfadeText:(id)a3 color:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a3;
  id v8 = a4;
  if (v5)
  {
    float v9 = +[CATransition animation];
    float v10 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [v9 setTimingFunction:v10];

    [v9 setType:kCATransitionFade];
    double v11 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v11 recordingControlAnimationDuration];
    [v9 setDuration:];

    double v12 = [(RCRecordingControl *)self namedStateLabel];
    double v13 = [v12 layer];
    [v13 addAnimation:v9 forKey:@"kCATransitionFade"];
  }
  id v14 = [(RCRecordingControl *)self namedStateLabel];
  [v14 setText:v16];

  id v15 = [(RCRecordingControl *)self namedStateLabel];
  [v15 setTextColor:v8];

  [(RCRecordingControl *)self setAccessibilityLabel:v16];
}

- (void)_updateVisibilityOfNamedStateLabel:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(RCRecordingControl *)self layerAlpha];
  double v8 = v7;
  if (v4)
  {
    float v9 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v9 recordingControlAnimationDuration];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100087BA8;
    v11[3] = &unk_100222588;
    v11[4] = self;
    BOOL v12 = v5;
    *(double *)&v11[5] = v8;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11);
  }
  else
  {
    if (!v5) {
      double v8 = 0.0;
    }
    id v10 = [(RCRecordingControl *)self namedStateLabel];
    [v10 setAlpha:v8];
  }
}

- (CGPath)_ringLozengePathWithHeight:(double)a3 extraWidth:(double)a4
{
  [(RCRecordingControl *)self bounds];
  double v8 = v7 * 0.5;
  [(RCRecordingControl *)self bounds];
  double v10 = v9 * 0.5;
  double v11 = a4 * 0.5;
  double v12 = v8 - a4 * 0.5;
  double v13 = v11 + v8;
  double v14 = a3 * 0.5;
  id v15 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0, v12, v9 * 0.5, v14, 4.71238898, 1.57079633);
  [v15 addLineToPoint:v13, v14 + v10];
  [v15 addArcWithCenter:0 radius:v13 startAngle:v10 endAngle:v14 clockwise:1.57079633];
  [v15 addLineToPoint:v12, v10 - v14];
  id v16 = v15;
  double v17 = (CGPath *)[v16 CGPath];

  return v17;
}

- (CGPath)_ringPath:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(RCRecordingControl *)self outerRingLayer];
  [(RCRecordingControl *)self frame];
  double v7 = v6;
  double v8 = v6 * 0.5;
  [v5 setBounds:0.0, 0.0, v6];
  [v5 setPosition:v8, v8];
  if (v3)
  {
    [(RCRecordingControl *)self outerRingThickness];
    double v7 = v7 + v9;
  }
  double v10 = [(RCRecordingControl *)self _ringLozengePathWithHeight:v7 extraWidth:0.0];

  return v10;
}

- (CGPath)_ringLozengePath:(BOOL)a3
{
  BOOL v3 = a3;
  [(RCRecordingControl *)self _labelWidth];
  double v6 = v5;
  double v7 = [(RCRecordingControl *)self outerRingLayer];
  [(RCRecordingControl *)self frame];
  double v9 = v8;
  double v10 = v8 * 0.5;
  [v7 setBounds:0.0, 0.0, v8];
  [v7 setPosition:v10, v10];
  if (v3)
  {
    unsigned int v11 = [(RCRecordingControl *)self _hasOuterRingLayer];
    [(RCRecordingControl *)self outerRingThickness];
    double v13 = v12;
    if (v11)
    {
      double v9 = v9 + v12;
    }
    else
    {
      [(RCRecordingControl *)self outerRingGap];
      double v9 = v9 - (v13 + v14);
    }
  }
  id v15 = [(RCRecordingControl *)self _ringLozengePathWithHeight:v9 extraWidth:v6];

  return v15;
}

- (CGPath)_circlePath
{
  [(RCRecordingControl *)self outerRingGap];

  return -[RCRecordingControl _circlePath:](self, "_circlePath:");
}

- (CGPath)_microCirclePath
{
  [(RCRecordingControl *)self frame];
  double v4 = v3;
  [(RCRecordingControl *)self outerRingThickness];
  double v6 = v4 - v5 + -0.01;

  return [(RCRecordingControl *)self _circlePath:v6];
}

- (CGPath)_circlePath:(double)a3
{
  [(RCRecordingControl *)self frame];
  double v6 = v5;
  [(RCRecordingControl *)self outerRingThickness];
  double v8 = v7;
  double v9 = v6 - v7 - a3;
  [(RCRecordingControl *)self _xInset];
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", a3 * 0.5 + v10 + v8 * 0.5, a3 * 0.5 + v8 * 0.5, v9, v9, v9 * 0.5);
  id v11 = objc_claimAutoreleasedReturnValue();
  double v12 = (CGPath *)[v11 CGPath];

  return v12;
}

- (CGPoint)_getSquarePathPosition
{
  [(RCRecordingControl *)self frame];
  double v4 = v3;
  [(RCRecordingControl *)self frame];
  double v6 = v5;
  [(RCRecordingControl *)self innerSquareWidth];
  double v8 = (v4 - v7) * 0.5;
  [(RCRecordingControl *)self innerSquareWidth];
  double v10 = (v6 - v9) * 0.5;
  double v11 = v8;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPath)_squarePath
{
  [(RCRecordingControl *)self innerSquareWidth];
  double v4 = v3;
  [(RCRecordingControl *)self _getSquarePathPosition];
  double v6 = v5;
  double v8 = v7;
  [(RCRecordingControl *)self innerSquareCornerRadius];
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v6, v8, v4, v4, v9);
  id v10 = objc_claimAutoreleasedReturnValue();
  double v11 = (CGPath *)[v10 CGPath];

  return v11;
}

- (CGPath)_pausePath
{
  [(RCRecordingControl *)self _getSquarePathPosition];
  double v4 = v3;
  double v6 = v5;
  [(RCRecordingControl *)self innerSquareWidth];
  double v8 = v7;
  [(RCRecordingControlLayoutHelper *)self->_layoutHelper recordingControlPauseGap];
  double v10 = (v8 - v9) * 0.5;
  double v11 = v9 + v4 + v10;
  [(RCRecordingControl *)self pauseStrokeCornerRadius];
  double v13 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v10, v8, v12);
  [(RCRecordingControl *)self pauseStrokeCornerRadius];
  id v15 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v11, v6, v10, v8, v14);
  [v13 appendPath:v15];
  id v16 = v13;
  double v17 = (CGPath *)[v16 CGPath];

  return v17;
}

- (CGPath)_labelLozengePath
{
  [(RCRecordingControl *)self frame];
  [(RCRecordingControl *)self frame];
  layoutHelper = self->_layoutHelper;
  double v4 = [(RCRecordingControl *)self namedStateLabel];
  [v4 intrinsicContentSize];
  -[RCRecordingControlLayoutHelper labelLozengeRectWithLabelIntrinsicWidth:recordingControlCenterPoint:](layoutHelper, "labelLozengeRectWithLabelIntrinsicWidth:recordingControlCenterPoint:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v6, v8, v10, v12, v12);
  id v13 = objc_claimAutoreleasedReturnValue();
  double v14 = (CGPath *)[v13 CGPath];

  return v14;
}

- (double)_xInset
{
  [(RCRecordingControl *)self frame];
  double v4 = v3;
  [(RCRecordingControl *)self frame];
  return (v4 - v5) * 0.5;
}

- (CGSize)intrinsicContentSize
{
  layoutHelper = self->_layoutHelper;
  double v4 = [(RCRecordingControl *)self namedStateLabel];
  [v4 intrinsicContentSize];
  -[RCRecordingControlLayoutHelper recordingControlWidthWithLabelIntrinsicWidth:](layoutHelper, "recordingControlWidthWithLabelIntrinsicWidth:");
  double v6 = v5;

  [(RCRecordingControlLayoutHelper *)self->_layoutHelper recordingControlHeight];
  double v8 = v7;
  double v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (double)_labelWidth
{
  layoutHelper = self->_layoutHelper;
  double v3 = [(RCRecordingControl *)self namedStateLabel];
  [v3 intrinsicContentSize];
  -[RCRecordingControlLayoutHelper paddedLabelWidthWithLabelIntrinsicWidth:](layoutHelper, "paddedLabelWidthWithLabelIntrinsicWidth:");
  double v5 = v4;

  return v5;
}

- (void)_handleUserTouch:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  double v9 = (char *)[v4 state];

  if ((unint64_t)(v9 - 1) < 2)
  {
    BOOL v11 = -[RCRecordingControl _isInsideForLocation:](self, "_isInsideForLocation:", v6, v8);
    double v10 = self;
LABEL_6:
    [(RCRecordingControl *)v10 setPressed:v11];
    return;
  }
  if (v9 != (char *)3)
  {
    if (v9 != (char *)4) {
      return;
    }
    double v10 = self;
    BOOL v11 = 0;
    goto LABEL_6;
  }
  [(RCRecordingControl *)self setPressed:0];
  if (-[RCRecordingControl _isInsideForLocation:](self, "_isInsideForLocation:", v6, v8))
  {
    [(RCRecordingControl *)self _processControlActuation];
  }
}

- (BOOL)_isInsideForLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(RCRecordingControl *)self bounds];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (void)_processControlActuation
{
  self->_longPressBeingThrottled = 1;
  [(RCRecordingControl *)self _syncLongPressGestureRecognizerEnablement];
  double v3 = [(RCRecordingControl *)self delegate];
  [v3 controlActivated:self];

  objc_initWeak(&location, self);
  dispatch_time_t v4 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000885D0;
  block[3] = &unk_1002225B0;
  block[4] = self;
  objc_copyWeak(&v6, &location);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RCRecordingControl *)self longPressRecognizer];

  if (v8 == v7)
  {
    CGFloat v10 = (objc_class *)objc_opt_class();
    BOOL v11 = NSStringFromClass(v10);
    unsigned __int8 v9 = [v11 isEqualToString:@"_UIPassthroughScrollGestureRecognizer"];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  [a4 locationInView:self];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  BoundingBoCGFloat x = CGPathGetBoundingBox([(RCRecordingControl *)self _ringPathForState:[(RCRecordingControl *)self recordingControlState]]);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  id v13 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v13 recordingControlExtraHitOutset];
  double v15 = v14;

  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = CGRectInset(v21, -v15, -v15);
  uint64_t v16 = v6;
  uint64_t v17 = v8;

  return CGRectContainsPoint(v22, *(CGPoint *)&v16);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)RCRecordingControl;
  return UIAccessibilityTraitStartsMediaSession | [(RCRecordingControl *)&v3 accessibilityTraits] | UIAccessibilityTraitButton;
}

- (CGRect)accessibilityFrame
{
  BoundingBoCGFloat x = CGPathGetBoundingBox([(RCRecordingControl *)self _interactionPath]);

  -[RCRecordingControl convertRect:toView:](self, "convertRect:toView:", 0, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)_accessibilityBounds
{
  [(RCRecordingControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(RCRecordingControl *)self _xInset];
  double v12 = v11;
  if (((unint64_t)[(RCRecordingControl *)self recordingControlState] | 2) == 2)
  {
    double v8 = v8 + v12 * -2.0;
    double v4 = v12;
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)accessibilityPath
{
  if (((unint64_t)[(RCRecordingControl *)self recordingControlState] | 2) == 2)
  {
    double v3 = [(RCRecordingControl *)self _accessibilityCirclePathBasedOnBoundsWidth];
  }
  else
  {
    double v4 = [(RCRecordingControl *)self _ringPathForState:[(RCRecordingControl *)self recordingControlState]];
    [(RCRecordingControl *)self frame];
    double v6 = v5;
    double v8 = v7;
    double v9 = [(RCRecordingControl *)self superview];
    [v9 convertPoint:0 toView:v6];
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    memset(&v16, 0, sizeof(v16));
    CGAffineTransformMakeTranslation(&v16, v11, v13);
    double v14 = CGPathCreateMutableCopyByTransformingPath(v4, &v16);
    double v3 = +[UIBezierPath bezierPathWithCGPath:v14];
    CGPathRelease(v14);
  }

  return v3;
}

- (void)setRecordAccessibilityLabel
{
  double v3 = +[NSLocale preferredLanguages];
  if ([v3 count]
    && ([v3 objectAtIndex:0],
        double v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 hasPrefix:@"en"],
        v4,
        v5))
  {
    id v6 = objc_alloc((Class)NSMutableAttributedString);
    double v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"RECORD" value:&stru_100228BC8 table:0];
    id v9 = [v6 initWithString:v8];

    NSAttributedStringKey v12 = UIAccessibilitySpeechAttributeIPANotation;
    CFStringRef v13 = @"ɻɪ.ˈkwɔɻd";
    double v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v9 setAttributes:v10 range:0, 6];

    [(RCRecordingControl *)self setAccessibilityAttributedLabel:v9];
  }
  else
  {
    id v9 = +[NSBundle mainBundle];
    CGFloat v11 = [v9 localizedStringForKey:@"RECORD" value:&stru_100228BC8 table:0];
    [(RCRecordingControl *)self setAccessibilityLabel:v11];
  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  BoundingBoCGFloat x = CGPathGetBoundingBox([(RCRecordingControl *)self _interactionPath]);

  return +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = [objc_alloc((Class)UITargetedPreview) initWithView:self];
  id v6 = +[UIBezierPath bezierPathWithCGPath:[(RCRecordingControl *)self _interactionPath]];
  double v7 = [v5 parameters];
  [v7 setVisiblePath:v6];

  double v8 = +[UIPointerLiftEffect effectWithPreview:v5];
  id v9 = +[UIPointerStyle styleWithEffect:v8 shape:0];

  return v9;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int64_t)recordingControlState
{
  return self->_recordingControlState;
}

- (UIColor)fontColor
{
  return self->_fontColor;
}

- (void)setFontColor:(id)a3
{
}

- (UIColor)fontColorResume
{
  return self->_fontColorResume;
}

- (void)setFontColorResume:(id)a3
{
}

- (UIColor)innerColor
{
  return self->_innerColor;
}

- (UIColor)outerColor
{
  return self->_outerColor;
}

- (void)setOuterColor:(id)a3
{
}

- (UIColor)innerColorResume
{
  return self->_innerColorResume;
}

- (void)setInnerColorResume:(id)a3
{
}

- (UIColor)outerColorResume
{
  return self->_outerColorResume;
}

- (void)setOuterColorResume:(id)a3
{
}

- (RCRecordingControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCRecordingControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CAShapeLayer)outerRingLayer
{
  return self->_outerRingLayer;
}

- (void)setOuterRingLayer:(id)a3
{
}

- (CAShapeLayer)innerStateLayer
{
  return self->_innerStateLayer;
}

- (void)setInnerStateLayer:(id)a3
{
}

- (CAShapeLayer)pauseShapeLayer
{
  return self->_pauseShapeLayer;
}

- (void)setPauseShapeLayer:(id)a3
{
}

- (UIColor)resolvedInnerColor
{
  return self->_resolvedInnerColor;
}

- (void)setResolvedInnerColor:(id)a3
{
}

- (UIColor)resolvedOuterColor
{
  return self->_resolvedOuterColor;
}

- (void)setResolvedOuterColor:(id)a3
{
}

- (UIColor)resolvedInnerColorResume
{
  return self->_resolvedInnerColorResume;
}

- (void)setResolvedInnerColorResume:(id)a3
{
}

- (UIColor)resolvedOuterColorResume
{
  return self->_resolvedOuterColorResume;
}

- (void)setResolvedOuterColorResume:(id)a3
{
}

- (UILabel)namedStateLabel
{
  return self->_namedStateLabel;
}

- (void)setNamedStateLabel:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
}

- (_TtC10VoiceMemos30RCRecordingControlLayoutHelper)layoutHelper
{
  return self->_layoutHelper;
}

- (void)setLayoutHelper:(id)a3
{
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (double)outerRingThickness
{
  return self->_outerRingThickness;
}

- (void)setOuterRingThickness:(double)a3
{
  self->_outerRingThickness = a3;
}

- (double)outerRingGap
{
  return self->_outerRingGap;
}

- (void)setOuterRingGap:(double)a3
{
  self->_outerRingGap = a3;
}

- (double)innerSquareWidth
{
  return self->_innerSquareWidth;
}

- (void)setInnerSquareWidth:(double)a3
{
  self->_innerSquareWidth = a3;
}

- (double)innerSquareCornerRadius
{
  return self->_innerSquareCornerRadius;
}

- (void)setInnerSquareCornerRadius:(double)a3
{
  self->_innerSquareCornerRadius = a3;
}

- (double)pauseStrokeCornerRadius
{
  return self->_pauseStrokeCornerRadius;
}

- (void)setPauseStrokeCornerRadius:(double)a3
{
  self->_pauseStrokeCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutHelper, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_namedStateLabel, 0);
  objc_storeStrong((id *)&self->_resolvedOuterColorResume, 0);
  objc_storeStrong((id *)&self->_resolvedInnerColorResume, 0);
  objc_storeStrong((id *)&self->_resolvedOuterColor, 0);
  objc_storeStrong((id *)&self->_resolvedInnerColor, 0);
  objc_storeStrong((id *)&self->_pauseShapeLayer, 0);
  objc_storeStrong((id *)&self->_innerStateLayer, 0);
  objc_storeStrong((id *)&self->_outerRingLayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outerColorResume, 0);
  objc_storeStrong((id *)&self->_innerColorResume, 0);
  objc_storeStrong((id *)&self->_outerColor, 0);
  objc_storeStrong((id *)&self->_innerColor, 0);
  objc_storeStrong((id *)&self->_fontColorResume, 0);

  objc_storeStrong((id *)&self->_fontColor, 0);
}

@end
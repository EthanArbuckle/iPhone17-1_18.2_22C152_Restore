@interface ICRecordingControl
- (BOOL)_hasOuterRingLayer;
- (BOOL)_isInsideForLocation:(CGPoint)a3;
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)didBuildSublayers;
- (BOOL)enabled;
- (BOOL)isAccessibilityElement;
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
- (CGRect)labelLozengeRectWithLabelIntrinsicWidth:(double)a3;
- (CGSize)intrinsicContentSize;
- (ICRecordingControl)initWithDiameter:(double)a3;
- (ICRecordingControlDelegate)delegate;
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
- (double)_labelWidth;
- (double)_originalRecordingControlDiameter;
- (double)_ringOpacityForState:(int64_t)a3;
- (double)_xInset;
- (double)diameter;
- (double)innerSquareCornerRadius;
- (double)innerSquareWidth;
- (double)layerAlpha;
- (double)outerRingGap;
- (double)outerRingThickness;
- (double)paddedLabelWidth:(double)a3;
- (double)paddedLabelWidthWithLabelIntrinsicWidth:(double)a3;
- (double)pauseStrokeCornerRadius;
- (double)recordingControlHeight;
- (double)recordingControlInnerSquareWidth;
- (double)recordingControlLozengeFixedWidth;
- (double)recordingControlOuterRingGapScaleFactor;
- (double)recordingControlPauseGap;
- (double)recordingControlPauseStrokeCornerRadius;
- (double)recordingControlWidthWithLabelIntrinsicWidth:(double)a3;
- (id)_accessibilityLabelTextForState:(int64_t)a3;
- (id)_buttonTextForState:(int64_t)a3;
- (id)_resolvedFillColorForState:(int64_t)a3;
- (id)_resolvedRingColorForState:(int64_t)a3;
- (id)_textColorForState:(int64_t)a3;
- (id)accessibilityPath;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)recordingControlOuterColor;
- (int64_t)recordingControlState;
- (unint64_t)accessibilityTraits;
- (void)_buildSublayers;
- (void)_commonInit;
- (void)_commonLayerUpdate;
- (void)_handleUserTouch:(id)a3;
- (void)_processControlActuation;
- (void)_styleView;
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
- (void)setDidBuildSublayers:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFontColor:(id)a3;
- (void)setFontColorResume:(id)a3;
- (void)setInnerColor:(id)a3;
- (void)setInnerColorResume:(id)a3;
- (void)setInnerSquareCornerRadius:(double)a3;
- (void)setInnerSquareWidth:(double)a3;
- (void)setInnerStateLayer:(id)a3;
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

@implementation ICRecordingControl

- (void)setRecordingControlState:(int64_t)a3
{
}

- (void)setRecordingControlState:(int64_t)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  int64_t recordingControlState = self->_recordingControlState;
  if (a5 || recordingControlState != a3)
  {
    self->_int64_t recordingControlState = a3;
    [(ICRecordingControl *)self _updateVisualState:a4 fromState:recordingControlState];
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  [(ICRecordingControl *)self _syncLongPressGestureRecognizerEnablement];
  v4 = [(ICRecordingControl *)self outerRingLayer];
  [(ICRecordingControl *)self updateLayerAlphaIfVisible:v4];

  v5 = [(ICRecordingControl *)self innerStateLayer];
  [(ICRecordingControl *)self updateLayerAlphaIfVisible:v5];

  v6 = [(ICRecordingControl *)self pauseShapeLayer];
  [(ICRecordingControl *)self updateLayerAlphaIfVisible:v6];

  v7 = [(ICRecordingControl *)self namedStateLabel];
  [v7 alpha];
  BOOL v9 = v8 != 0.0;

  [(ICRecordingControl *)self _updateVisibilityOfNamedStateLabel:v9 animated:0];
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    [(ICRecordingControl *)self _updateVisualState:1 fromState:self->_recordingControlState];
  }
}

- (void)setInnerColor:(id)a3
{
}

- (double)layerAlpha
{
  BOOL v2 = [(ICRecordingControl *)self enabled];
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
    [(ICRecordingControl *)self layerAlpha];
    *(float *)&double v5 = v5;
    [v6 setOpacity:v5];
  }
}

- (ICRecordingControl)initWithDiameter:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICRecordingControl;
  float v4 = -[ICRecordingControl initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v5 = v4;
  if (v4)
  {
    v4->_diameter = a3;
    [(ICRecordingControl *)v4 _commonInit];
  }
  return v5;
}

- (double)_originalRecordingControlDiameter
{
  return 60.0;
}

- (double)recordingControlInnerSquareWidth
{
  [(ICRecordingControl *)self _originalRecordingControlDiameter];
  double v4 = 24.0 / v3;
  [(ICRecordingControl *)self _originalRecordingControlDiameter];
  return v4 * v5;
}

- (double)recordingControlPauseGap
{
  [(ICRecordingControl *)self _originalRecordingControlDiameter];
  double v4 = 4.0 / v3;
  [(ICRecordingControl *)self _originalRecordingControlDiameter];
  return v4 * v5;
}

- (double)recordingControlPauseStrokeCornerRadius
{
  [(ICRecordingControl *)self _originalRecordingControlDiameter];
  double v4 = 2.0 / v3;
  [(ICRecordingControl *)self _originalRecordingControlDiameter];
  return v4 * v5;
}

- (double)recordingControlLozengeFixedWidth
{
  [(ICRecordingControl *)self _originalRecordingControlDiameter];
  double v4 = 86.0 / v3;
  [(ICRecordingControl *)self _originalRecordingControlDiameter];
  return v4 * v5;
}

- (double)recordingControlOuterRingGapScaleFactor
{
  [(ICRecordingControl *)self _originalRecordingControlDiameter];
  return 6.0 / v2;
}

- (void)_commonInit
{
  [(ICRecordingControl *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ICRecordingControl *)self resolveColors];
  [(ICRecordingControl *)self _styleView];
  self->_enabled = 1;
  double v3 = (void *)[objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:self];
  [(ICRecordingControl *)self addInteraction:v3];

  [(ICRecordingControl *)self _buildSublayers];
}

- (void)_buildSublayers
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "layer did not exist when _buildSublayers was called.", v1, 2u);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ICRecordingControl;
  [(ICRecordingControl *)&v3 layoutSubviews];
  [(ICRecordingControl *)self resolveColors];
}

- (BOOL)_hasOuterRingLayer
{
  return 1;
}

- (id)recordingControlOuterColor
{
  return (id)[MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global];
}

id __48__ICRecordingControl_recordingControlOuterColor__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "ic_isDark")) {
    [MEMORY[0x263F825C8] labelColor];
  }
  else {
  double v2 = [MEMORY[0x263F825C8] systemGrayColor];
  }

  return v2;
}

- (void)_styleView
{
  id v6 = [(ICRecordingControl *)self recordingControlOuterColor];
  [(ICRecordingControl *)self setOuterColor:v6];
  id v3 = [(ICRecordingControl *)self _resolvedRingColorForState:[(ICRecordingControl *)self recordingControlState]];
  uint64_t v4 = [v3 CGColor];
  double v5 = [(ICRecordingControl *)self outerRingLayer];
  [v5 setStrokeColor:v4];
}

- (void)resolveColors
{
  id v11 = [(ICRecordingControl *)self traitCollection];
  id v3 = [(UIColor *)self->_innerColor resolvedColorWithTraitCollection:v11];
  resolvedInnerColor = self->_resolvedInnerColor;
  self->_resolvedInnerColor = v3;

  double v5 = [(UIColor *)self->_innerColorResume resolvedColorWithTraitCollection:v11];
  resolvedInnerColorResume = self->_resolvedInnerColorResume;
  self->_resolvedInnerColorResume = v5;

  objc_super v7 = [(UIColor *)self->_outerColor resolvedColorWithTraitCollection:v11];
  resolvedOuterColor = self->_resolvedOuterColor;
  self->_resolvedOuterColor = v7;

  BOOL v9 = [(UIColor *)self->_outerColorResume resolvedColorWithTraitCollection:v11];
  resolvedOuterColorResume = self->_resolvedOuterColorResume;
  self->_resolvedOuterColorResume = v9;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICRecordingControl;
  [(ICRecordingControl *)&v4 layoutSublayersOfLayer:a3];
  [(ICRecordingControl *)self _commonLayerUpdate];
}

- (void)_commonLayerUpdate
{
  id v3 = [(ICRecordingControl *)self _pausePath];
  objc_super v4 = [(ICRecordingControl *)self pauseShapeLayer];
  [v4 setPath:v3];

  int64_t recordingControlState = self->_recordingControlState;

  [(ICRecordingControl *)self _updateVisualState:0 fromState:recordingControlState];
}

- (void)_updateVisualState:(BOOL)a3 fromState:(int64_t)a4
{
  BOOL v5 = a3;
  objc_super v7 = [(ICRecordingControl *)self _ringPathForState:self->_recordingControlState];
  id v8 = [(ICRecordingControl *)self _resolvedRingColorForState:self->_recordingControlState];
  uint64_t v9 = [v8 CGColor];

  [(ICRecordingControl *)self _ringOpacityForState:self->_recordingControlState];
  double v11 = v10;
  v30 = [(ICRecordingControl *)self _fillPathAnimateStartForState:self->_recordingControlState fromState:a4];
  v29 = [(ICRecordingControl *)self _fillPathAnimateEndForState:self->_recordingControlState fromState:a4];
  id v12 = [(ICRecordingControl *)self _resolvedFillColorForState:self->_recordingControlState];
  uint64_t v13 = [v12 CGColor];

  float v14 = 0.5;
  if (![(ICRecordingControl *)self pressed])
  {
    [(ICRecordingControl *)self layerAlpha];
    float v14 = v15;
  }
  id v31 = [(ICRecordingControl *)self _buttonTextForState:self->_recordingControlState];
  v16 = [(ICRecordingControl *)self _textColorForState:self->_recordingControlState];
  int64_t recordingControlState = self->_recordingControlState;
  if (recordingControlState == 5 || recordingControlState == 0)
  {
    [(ICRecordingControl *)self setRecordAccessibilityLabel];
  }
  else
  {
    v19 = [(ICRecordingControl *)self _accessibilityLabelTextForState:self->_recordingControlState];
    [(ICRecordingControl *)self setAccessibilityLabel:v19];
  }
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setValue:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F15FC8]];
  v20 = [(ICRecordingControl *)self outerRingLayer];
  objc_msgSend(v20, "ic_setPath:animated:", v7, v5);

  v21 = [(ICRecordingControl *)self outerRingLayer];
  objc_msgSend(v21, "ic_setStrokeColor:animated:", v9, v5);

  v22 = [(ICRecordingControl *)self outerRingLayer];
  *(float *)&double v23 = v11;
  objc_msgSend(v22, "ic_setOpacity:animated:", v5, v23);

  v24 = [(ICRecordingControl *)self innerStateLayer];
  objc_msgSend(v24, "ic_setPath:fromPath:animated:", v29, v30, v5);

  v25 = [(ICRecordingControl *)self innerStateLayer];
  objc_msgSend(v25, "ic_setFillColor:animated:", v13, v5);

  v26 = [(ICRecordingControl *)self innerStateLayer];
  *(float *)&double v27 = v14;
  objc_msgSend(v26, "ic_setOpacity:animated:", v5, v27);

  if (a4 == 1 || recordingControlState == 1) {
    [(ICRecordingControl *)self crossfadePauseLayer:recordingControlState == 1 animated:v5];
  }
  id v28 = v31;
  if (v31)
  {
    [(ICRecordingControl *)self crossfadeText:v31 color:v16 animated:v5];
    id v28 = v31;
    if (a4 == 1)
    {
      [(ICRecordingControl *)self fadeOutPauseAndInText:v5];
      id v28 = v31;
    }
  }
  [(ICRecordingControl *)self _updateVisibilityOfNamedStateLabel:v28 != 0 animated:v5];
  [MEMORY[0x263F158F8] commit];
}

- (id)_resolvedRingColorForState:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 4) {
    id v3 = &OBJC_IVAR___ICRecordingControl__resolvedOuterColorResume;
  }
  else {
    id v3 = &OBJC_IVAR___ICRecordingControl__resolvedOuterColor;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (CGPath)_ringPathForState:(int64_t)a3
{
  return [(ICRecordingControl *)self _ringPathForState:a3 includingStrokeThickeness:0];
}

- (CGPath)_interactionPath
{
  int64_t v3 = [(ICRecordingControl *)self recordingControlState];

  return [(ICRecordingControl *)self _ringPathForState:v3 includingStrokeThickeness:1];
}

- (CGPath)_ringPathForState:(int64_t)a3 includingStrokeThickeness:(BOOL)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    return [(ICRecordingControl *)self _ringLozengePath:a4];
  }
  else {
    return [(ICRecordingControl *)self _ringPath:a4];
  }
}

- (double)_ringOpacityForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 7) < 4) {
    return 0.0;
  }
  [(ICRecordingControl *)self layerAlpha];
  return result;
}

- (id)_resolvedFillColorForState:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 4) {
    int64_t v3 = &OBJC_IVAR___ICRecordingControl__resolvedInnerColorResume;
  }
  else {
    int64_t v3 = &OBJC_IVAR___ICRecordingControl__resolvedInnerColor;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (CGPath)_fillPathAnimateStartForState:(int64_t)a3 fromState:(int64_t)a4
{
  if (a3 == 1 && a4 == 2 || a3 == 2 && a4 == 1) {
    return [(ICRecordingControl *)self _squarePath];
  }
  else {
    return [(ICRecordingControl *)self _fillPathForState:a4];
  }
}

- (CGPath)_fillPathAnimateEndForState:(int64_t)a3 fromState:(int64_t)a4
{
  if (a3 == 1 && a4 == 2 || a3 == 2 && a4 == 1) {
    return [(ICRecordingControl *)self _squarePath];
  }
  else {
    return -[ICRecordingControl _fillPathForState:](self, "_fillPathForState:");
  }
}

- (CGPath)_fillPathForState:(int64_t)a3
{
  if (a3 == 2) {
    return [(ICRecordingControl *)self _squarePath];
  }
  if (a3 == 1) {
    return [(ICRecordingControl *)self _microCirclePath];
  }
  if (a3) {
    return [(ICRecordingControl *)self _labelLozengePath];
  }
  return [(ICRecordingControl *)self _circlePath];
}

- (id)_accessibilityLabelTextForState:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      int64_t v3 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v4 = v3;
      BOOL v5 = @"RECORD";
      goto LABEL_14;
    case 1:
      int64_t v3 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v4 = v3;
      BOOL v5 = @"PAUSE";
      goto LABEL_14;
    case 2:
      int64_t v3 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v4 = v3;
      BOOL v5 = @"STOP";
      goto LABEL_14;
    case 3:
      int64_t v3 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v4 = v3;
      BOOL v5 = @"REPLACE";
      goto LABEL_14;
    case 4:
      int64_t v3 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v4 = v3;
      BOOL v5 = @"RESUME";
      goto LABEL_14;
    case 5:
      int64_t v3 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v4 = v3;
      BOOL v5 = @"BUSY";
      goto LABEL_14;
    case 6:
      int64_t v3 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v4 = v3;
      BOOL v5 = @"INSERT";
      goto LABEL_14;
    case 7:
      int64_t v3 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v4 = v3;
      BOOL v5 = @"DONE";
      goto LABEL_14;
    case 8:
      int64_t v3 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v4 = v3;
      BOOL v5 = @"SAVE";
      goto LABEL_14;
    case 9:
      int64_t v3 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v4 = v3;
      BOOL v5 = @"UNLOCK";
      goto LABEL_14;
    case 10:
      int64_t v3 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v4 = v3;
      BOOL v5 = @"CANCEL";
LABEL_14:
      id v6 = [v3 localizedStringForKey:v5 value:&stru_26C10E100 table:0];

      break;
    default:
      id v6 = 0;
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
      objc_super v4 = [MEMORY[0x263F086E0] mainBundle];
      BOOL v5 = v4;
      id v6 = @"REPLACE";
      goto LABEL_5;
    case 4:
      objc_super v4 = [MEMORY[0x263F086E0] mainBundle];
      BOOL v5 = v4;
      id v6 = @"RESUME";
      goto LABEL_5;
    case 6:
      objc_super v4 = [MEMORY[0x263F086E0] mainBundle];
      BOOL v5 = v4;
      id v6 = @"INSERT";
LABEL_5:
      objc_super v7 = [v4 localizedStringForKey:v6 value:&stru_26C10E100 table:0];
      int64_t v3 = [v7 localizedUppercaseString];

      goto LABEL_11;
    case 7:
      id v8 = [MEMORY[0x263F086E0] mainBundle];
      BOOL v5 = v8;
      uint64_t v9 = @"DONE";
      goto LABEL_10;
    case 8:
      id v8 = [MEMORY[0x263F086E0] mainBundle];
      BOOL v5 = v8;
      uint64_t v9 = @"SAVE";
      goto LABEL_10;
    case 9:
      id v8 = [MEMORY[0x263F086E0] mainBundle];
      BOOL v5 = v8;
      uint64_t v9 = @"UNLOCK";
      goto LABEL_10;
    case 10:
      id v8 = [MEMORY[0x263F086E0] mainBundle];
      BOOL v5 = v8;
      uint64_t v9 = @"CANCEL";
LABEL_10:
      int64_t v3 = [v8 localizedStringForKey:v9 value:&stru_26C10E100 table:0];
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
      uint64_t v3 = 432;
      goto LABEL_5;
    case 7:
    case 9:
      id v4 = [(ICRecordingControl *)self fontColor];
      break;
    default:
      uint64_t v3 = 424;
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
  [(ICRecordingControl *)self layerAlpha];
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
  double v11 = [(ICRecordingControl *)self pauseShapeLayer];
  *(float *)&double v12 = v9;
  objc_msgSend(v11, "ic_setOpacity:animated:", v4, v12);

  id v14 = [(ICRecordingControl *)self innerStateLayer];
  *(float *)&double v13 = v10;
  objc_msgSend(v14, "ic_setOpacity:animated:", v4, v13);
}

- (void)fadeOutPauseAndInText:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(ICRecordingControl *)self pauseShapeLayer];
  objc_msgSend(v5, "ic_setOpacity:animated:", v3, 0.0);

  id v6 = [(ICRecordingControl *)self innerStateLayer];
  objc_msgSend(v6, "ic_setPath:animated:", -[ICRecordingControl _labelLozengePath](self, "_labelLozengePath"), v3);

  double v7 = [(ICRecordingControl *)self innerStateLayer];
  [(ICRecordingControl *)self layerAlpha];
  *(float *)&double v8 = v8;
  objc_msgSend(v7, "ic_setOpacity:animated:", v3, v8);

  [(ICRecordingControl *)self _updateVisibilityOfNamedStateLabel:1 animated:v3];
}

- (void)crossfadeText:(id)a3 color:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v8 = a4;
  if (v5)
  {
    float v9 = [MEMORY[0x263F15910] animation];
    float v10 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v9 setTimingFunction:v10];

    [v9 setType:*MEMORY[0x263F15FD8]];
    [v9 setDuration:0.2];
    double v11 = [(ICRecordingControl *)self namedStateLabel];
    double v12 = [v11 layer];
    [v12 addAnimation:v9 forKey:@"kCATransitionFade"];
  }
  double v13 = [(ICRecordingControl *)self namedStateLabel];
  [v13 setText:v15];

  id v14 = [(ICRecordingControl *)self namedStateLabel];
  [v14 setTextColor:v8];

  [(ICRecordingControl *)self setAccessibilityLabel:v15];
}

- (void)_updateVisibilityOfNamedStateLabel:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(ICRecordingControl *)self layerAlpha];
  if (v4)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__ICRecordingControl__updateVisibilityOfNamedStateLabel_animated___block_invoke;
    v10[3] = &unk_2640B7F68;
    v10[4] = self;
    BOOL v11 = v5;
    *(double *)&v10[5] = v7;
    [MEMORY[0x263F82E00] animateWithDuration:v10 animations:0.2];
  }
  else
  {
    if (v5) {
      double v8 = v7;
    }
    else {
      double v8 = 0.0;
    }
    id v9 = [(ICRecordingControl *)self namedStateLabel];
    [v9 setAlpha:v8];
  }
}

void __66__ICRecordingControl__updateVisibilityOfNamedStateLabel_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    double v1 = *(double *)(a1 + 40);
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) namedStateLabel];
  [v2 setAlpha:v1];
}

- (CGPath)_ringLozengePathWithHeight:(double)a3 extraWidth:(double)a4
{
  [(ICRecordingControl *)self bounds];
  double v8 = v7 * 0.5;
  [(ICRecordingControl *)self bounds];
  double v10 = v9 * 0.5;
  double v11 = a4 * 0.5;
  double v12 = v8 - a4 * 0.5;
  double v13 = v11 + v8;
  double v14 = a3 * 0.5;
  id v15 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0, v12, v9 * 0.5, v14, 4.71238898, 1.57079633);
  objc_msgSend(v15, "addLineToPoint:", v13, v14 + v10);
  objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v13, v10, v14, 1.57079633, 4.71238898);
  objc_msgSend(v15, "addLineToPoint:", v12, v10 - v14);
  id v16 = v15;
  v17 = (CGPath *)[v16 CGPath];

  return v17;
}

- (CGPath)_ringPath:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(ICRecordingControl *)self outerRingLayer];
  [(ICRecordingControl *)self frame];
  double v7 = v6;
  double v8 = v6 * 0.5;
  objc_msgSend(v5, "setBounds:", 0.0, 0.0, v6);
  objc_msgSend(v5, "setPosition:", v8, v8);
  if (v3)
  {
    [(ICRecordingControl *)self outerRingThickness];
    double v7 = v7 + v9;
  }
  double v10 = [(ICRecordingControl *)self _ringLozengePathWithHeight:v7 extraWidth:0.0];

  return v10;
}

- (CGPath)_ringLozengePath:(BOOL)a3
{
  BOOL v3 = a3;
  [(ICRecordingControl *)self _labelWidth];
  double v6 = v5;
  double v7 = [(ICRecordingControl *)self outerRingLayer];
  [(ICRecordingControl *)self frame];
  double v9 = v8;
  double v10 = v8 * 0.5;
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, v8);
  objc_msgSend(v7, "setPosition:", v10, v10);
  if (v3)
  {
    BOOL v11 = [(ICRecordingControl *)self _hasOuterRingLayer];
    [(ICRecordingControl *)self outerRingThickness];
    double v13 = v12;
    if (v11)
    {
      double v9 = v9 + v12;
    }
    else
    {
      [(ICRecordingControl *)self outerRingGap];
      double v9 = v9 - (v13 + v14);
    }
  }
  id v15 = [(ICRecordingControl *)self _ringLozengePathWithHeight:v9 extraWidth:v6];

  return v15;
}

- (CGPath)_circlePath
{
  [(ICRecordingControl *)self outerRingGap];

  return -[ICRecordingControl _circlePath:](self, "_circlePath:");
}

- (CGPath)_microCirclePath
{
  [(ICRecordingControl *)self frame];
  double v4 = v3;
  [(ICRecordingControl *)self outerRingThickness];
  double v6 = v4 - v5 + -0.01;

  return [(ICRecordingControl *)self _circlePath:v6];
}

- (CGPath)_circlePath:(double)a3
{
  [(ICRecordingControl *)self frame];
  double v6 = v5;
  [(ICRecordingControl *)self outerRingThickness];
  double v8 = v7;
  double v9 = v6 - v7 - a3;
  [(ICRecordingControl *)self _xInset];
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", a3 * 0.5 + v10 + v8 * 0.5, a3 * 0.5 + v8 * 0.5, v9, v9, v9 * 0.5);
  id v11 = objc_claimAutoreleasedReturnValue();
  double v12 = (CGPath *)[v11 CGPath];

  return v12;
}

- (CGPoint)_getSquarePathPosition
{
  [(ICRecordingControl *)self frame];
  double v4 = v3;
  [(ICRecordingControl *)self frame];
  double v6 = v5;
  [(ICRecordingControl *)self innerSquareWidth];
  double v8 = (v4 - v7) * 0.5;
  [(ICRecordingControl *)self innerSquareWidth];
  double v10 = (v6 - v9) * 0.5;
  double v11 = v8;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPath)_squarePath
{
  [(ICRecordingControl *)self innerSquareWidth];
  double v4 = v3;
  [(ICRecordingControl *)self _getSquarePathPosition];
  double v6 = v5;
  double v8 = v7;
  double v9 = (void *)MEMORY[0x263F824C0];
  [(ICRecordingControl *)self innerSquareCornerRadius];
  objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:", v6, v8, v4, v4, v10);
  id v11 = objc_claimAutoreleasedReturnValue();
  double v12 = (CGPath *)[v11 CGPath];

  return v12;
}

- (CGPath)_pausePath
{
  [(ICRecordingControl *)self _getSquarePathPosition];
  double v4 = v3;
  double v6 = v5;
  [(ICRecordingControl *)self innerSquareWidth];
  double v8 = v7;
  [(ICRecordingControl *)self recordingControlPauseGap];
  double v10 = (v8 - v9) * 0.5;
  double v11 = v9 + v4 + v10;
  double v12 = (void *)MEMORY[0x263F824C0];
  [(ICRecordingControl *)self pauseStrokeCornerRadius];
  double v14 = objc_msgSend(v12, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v10, v8, v13);
  id v15 = (void *)MEMORY[0x263F824C0];
  [(ICRecordingControl *)self pauseStrokeCornerRadius];
  v17 = objc_msgSend(v15, "bezierPathWithRoundedRect:cornerRadius:", v11, v6, v10, v8, v16);
  [v14 appendPath:v17];
  id v18 = v14;
  v19 = (CGPath *)[v18 CGPath];

  return v19;
}

- (CGPath)_labelLozengePath
{
  double v3 = [(ICRecordingControl *)self namedStateLabel];
  [v3 intrinsicContentSize];
  -[ICRecordingControl labelLozengeRectWithLabelIntrinsicWidth:](self, "labelLozengeRectWithLabelIntrinsicWidth:");
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  CGRect v16 = CGRectInset(v15, 4.0, 4.0);
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", v16.origin.x, v16.origin.y + 1.0, v16.size.width, v16.size.height, v16.size.height);
  id v12 = objc_claimAutoreleasedReturnValue();
  double v13 = (CGPath *)[v12 CGPath];

  return v13;
}

- (double)recordingControlHeight
{
  [(ICRecordingControl *)self diameter];
  return v2 + -2.0;
}

- (double)recordingControlWidthWithLabelIntrinsicWidth:(double)a3
{
  [(ICRecordingControl *)self recordingControlHeight];
  double v6 = v5;
  [(ICRecordingControl *)self paddedLabelWidth:a3];
  return v7 + v6 * 2.0;
}

- (CGRect)labelLozengeRectWithLabelIntrinsicWidth:(double)a3
{
  -[ICRecordingControl paddedLabelWidth:](self, "paddedLabelWidth:");
  double v6 = v5;
  [(ICRecordingControl *)self recordingControlHeight];
  double v8 = v7;
  double v9 = v6 + v7;
  [(ICRecordingControl *)self recordingControlWidthWithLabelIntrinsicWidth:a3];
  double v11 = v10 * 0.5;
  [(ICRecordingControl *)self recordingControlHeight];
  double v13 = v12 * 0.5;
  double v14 = v11 - v9 * 0.5;
  double v15 = v13 - v8 * 0.5;
  double v16 = v9;
  double v17 = v8;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (double)paddedLabelWidth:(double)a3
{
  [(ICRecordingControl *)self recordingControlLozengeFixedWidth];
  if (result <= a3) {
    return a3;
  }
  return result;
}

- (double)_xInset
{
  [(ICRecordingControl *)self frame];
  double v4 = v3;
  [(ICRecordingControl *)self frame];
  return (v4 - v5) * 0.5;
}

- (double)paddedLabelWidthWithLabelIntrinsicWidth:(double)a3
{
  [(ICRecordingControl *)self recordingControlLozengeFixedWidth];
  if (result <= a3) {
    return a3;
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(ICRecordingControl *)self namedStateLabel];
  [v3 intrinsicContentSize];
  -[ICRecordingControl recordingControlWidthWithLabelIntrinsicWidth:](self, "recordingControlWidthWithLabelIntrinsicWidth:");
  double v5 = v4;

  [(ICRecordingControl *)self recordingControlHeight];
  double v7 = v6;
  double v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (double)_labelWidth
{
  double v3 = [(ICRecordingControl *)self namedStateLabel];
  [v3 intrinsicContentSize];
  -[ICRecordingControl paddedLabelWidthWithLabelIntrinsicWidth:](self, "paddedLabelWidthWithLabelIntrinsicWidth:");
  double v5 = v4;

  return v5;
}

- (void)_handleUserTouch:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 state];

  if ((unint64_t)(v9 - 1) < 2)
  {
    BOOL v11 = -[ICRecordingControl _isInsideForLocation:](self, "_isInsideForLocation:", v6, v8);
    double v10 = self;
LABEL_6:
    [(ICRecordingControl *)v10 setPressed:v11];
    return;
  }
  if (v9 != 3)
  {
    if (v9 != 4) {
      return;
    }
    double v10 = self;
    BOOL v11 = 0;
    goto LABEL_6;
  }
  [(ICRecordingControl *)self setPressed:0];
  if (-[ICRecordingControl _isInsideForLocation:](self, "_isInsideForLocation:", v6, v8))
  {
    [(ICRecordingControl *)self _processControlActuation];
  }
}

- (BOOL)_isInsideForLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(ICRecordingControl *)self bounds];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (void)_processControlActuation
{
  [(ICRecordingControl *)self _syncLongPressGestureRecognizerEnablement];
  double v3 = [(ICRecordingControl *)self delegate];
  [v3 controlDidActivate:self];

  objc_initWeak(&location, self);
  dispatch_time_t v4 = dispatch_time(0, 200000000);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__ICRecordingControl__processControlActuation__block_invoke;
  v5[3] = &unk_2640B7F90;
  objc_copyWeak(&v6, &location);
  dispatch_after(v4, MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __46__ICRecordingControl__processControlActuation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _syncLongPressGestureRecognizerEnablement];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)ICRecordingControl;
  unint64_t v3 = *MEMORY[0x263F832B0] | [(ICRecordingControl *)&v7 accessibilityTraits] | *MEMORY[0x263F83260];
  BOOL v4 = [(ICRecordingControl *)self enabled];
  uint64_t v5 = *MEMORY[0x263F83290];
  if (v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

- (CGRect)accessibilityFrame
{
  BoundingBoCGFloat x = CGPathGetBoundingBox([(ICRecordingControl *)self _interactionPath]);

  -[ICRecordingControl convertRect:toView:](self, "convertRect:toView:", 0, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)_accessibilityBounds
{
  [(ICRecordingControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(ICRecordingControl *)self _xInset];
  double v12 = v11;
  if (([(ICRecordingControl *)self recordingControlState] | 2) == 2)
  {
    double v8 = v8 + v12 * -2.0;
    double v4 = v12;
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)accessibilityPath
{
  if (([(ICRecordingControl *)self recordingControlState] | 2) == 2)
  {
    double v3 = [(ICRecordingControl *)self _accessibilityCirclePathBasedOnBoundsWidth];
  }
  else
  {
    double v4 = [(ICRecordingControl *)self _ringPathForState:[(ICRecordingControl *)self recordingControlState]];
    [(ICRecordingControl *)self frame];
    double v6 = v5;
    double v8 = v7;
    double v9 = [(ICRecordingControl *)self superview];
    objc_msgSend(v9, "convertPoint:toView:", 0, v6, v8);
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    memset(&v16, 0, sizeof(v16));
    CGAffineTransformMakeTranslation(&v16, v11, v13);
    double v14 = CGPathCreateMutableCopyByTransformingPath(v4, &v16);
    double v3 = [MEMORY[0x263F824C0] bezierPathWithCGPath:v14];
    CGPathRelease(v14);
  }

  return v3;
}

- (void)setRecordAccessibilityLabel
{
  v13[1] = *MEMORY[0x263EF8340];
  double v3 = [MEMORY[0x263EFF960] preferredLanguages];
  if ([v3 count]
    && ([v3 objectAtIndex:0],
        double v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 hasPrefix:@"en"],
        v4,
        v5))
  {
    id v6 = objc_alloc(MEMORY[0x263F089B8]);
    double v7 = [MEMORY[0x263F086E0] mainBundle];
    double v8 = [v7 localizedStringForKey:@"RECORD" value:&stru_26C10E100 table:0];
    double v9 = (void *)[v6 initWithString:v8];

    uint64_t v12 = *MEMORY[0x263F83210];
    v13[0] = @"ɻɪ.ˈkwɔɻd";
    double v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    objc_msgSend(v9, "setAttributes:range:", v10, 0, 6);

    [(ICRecordingControl *)self setAccessibilityAttributedLabel:v9];
  }
  else
  {
    double v9 = [MEMORY[0x263F086E0] mainBundle];
    CGFloat v11 = [v9 localizedStringForKey:@"RECORD" value:&stru_26C10E100 table:0];
    [(ICRecordingControl *)self setAccessibilityLabel:v11];
  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  BoundingBoCGFloat x = CGPathGetBoundingBox([(ICRecordingControl *)self _interactionPath]);
  int v5 = (void *)MEMORY[0x263F82A80];

  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  int v5 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:self];
  id v6 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithCGPath:", -[ICRecordingControl _interactionPath](self, "_interactionPath"));
  double v7 = [v5 parameters];
  [v7 setVisiblePath:v6];

  double v8 = (void *)MEMORY[0x263F82A90];
  double v9 = [MEMORY[0x263F82A78] effectWithPreview:v5];
  double v10 = [v8 styleWithEffect:v9 shape:0];

  return v10;
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

- (ICRecordingControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICRecordingControlDelegate *)WeakRetained;
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

- (BOOL)pressed
{
  return self->_pressed;
}

- (BOOL)didBuildSublayers
{
  return self->_didBuildSublayers;
}

- (void)setDidBuildSublayers:(BOOL)a3
{
  self->_didBuildSublayers = a3;
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

- (UILabel)namedStateLabel
{
  return self->_namedStateLabel;
}

- (void)setNamedStateLabel:(id)a3
{
}

- (void).cxx_destruct
{
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
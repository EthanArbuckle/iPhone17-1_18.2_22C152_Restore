@interface CRLiOSVibrantBackdropView
+ (id)backdropViewForSoloButton:(id)a3 active:(BOOL)a4;
+ (id)backdropViewForTieredButton:(id)a3 withPosition:(int64_t)a4;
- (BOOL)alwaysUsesBoldActiveStyle;
- (BOOL)isInsideTouchedButton;
- (BOOL)isMovingToWindow;
- (BOOL)isSelected;
- (BOOL)isTouched;
- (BOOL)touchOverlayRoundsAllCorners;
- (BOOL)unableToFindBlurEffect;
- (BOOL)wantsScrimOpacityUpAnimation;
- (CRLiOSVibrantBackdropView)initWithCoder:(id)a3;
- (CRLiOSVibrantBackdropView)initWithCorners:(int64_t)a3 radius:(double)a4 style:(int64_t)a5;
- (CRLiOSVibrantBackdropView)initWithFrame:(CGRect)a3;
- (UIButton)touchedButton;
- (UIView)baseBackdrop;
- (UIView)overlayBackdrop;
- (UIView)scrimBackdrop;
- (UIVisualEffectView)visualEffectView;
- (double)cornerRadius;
- (int64_t)activeStylePresetPair;
- (int64_t)boldActiveStylePresetPair;
- (int64_t)highContrastStylePresetPair;
- (int64_t)noneStylePresetPair;
- (int64_t)normalStylePresetPair;
- (int64_t)p_alternateStyleForStyle:(int64_t)a3;
- (int64_t)p_effectiveStyleForStyle:(int64_t)a3;
- (int64_t)p_presetColorPairForStyle:(int64_t)a3;
- (int64_t)p_selectedStyleForStyle:(int64_t)a3;
- (int64_t)roundedCorners;
- (int64_t)style;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)dealloc;
- (void)didEndScrimOpacityAnimation;
- (void)didMoveToWindow;
- (void)linkStyleWithHighlightedStateOfButton:(id)a3;
- (void)p_buttonDragEnter:(id)a3;
- (void)p_buttonDragExit:(id)a3;
- (void)p_buttonTouchCancel:(id)a3;
- (void)p_buttonTouchDown:(id)a3;
- (void)p_buttonTouchUpInside:(id)a3;
- (void)p_commonInit;
- (void)p_configureBackdropsForCurrentEffectiveStyle;
- (void)p_configureBackdropsWithCorners:(int64_t)a3 radius:(double)a4 presetPair:(int64_t)a5;
- (void)p_constrainToSuperview:(id)a3;
- (void)p_didChangeColorPresets;
- (void)p_resetSubviewHierarchy;
- (void)p_setupSubviewHierarchy;
- (void)setActiveStylePresetPair:(int64_t)a3;
- (void)setAlwaysUsesBoldActiveStyle:(BOOL)a3;
- (void)setBaseBackdrop:(id)a3;
- (void)setBoldActiveStylePresetPair:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHighContrastStylePresetPair:(int64_t)a3;
- (void)setIsInsideTouchedButton:(BOOL)a3;
- (void)setIsMovingToWindow:(BOOL)a3;
- (void)setNoneStylePresetPair:(int64_t)a3;
- (void)setNormalStylePresetPair:(int64_t)a3;
- (void)setOverlayBackdrop:(id)a3;
- (void)setRoundedCorners:(int64_t)a3;
- (void)setScrimBackdrop:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTouchOverlayRoundsAllCorners:(BOOL)a3;
- (void)setTouched:(BOOL)a3;
- (void)setTouchedButton:(id)a3;
- (void)setUnableToFindBlurEffect:(BOOL)a3;
- (void)setVisualEffectView:(id)a3;
- (void)unlinkStyleWithHighlightedStateOfButton:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation CRLiOSVibrantBackdropView

- (CRLiOSVibrantBackdropView)initWithCorners:(int64_t)a3 radius:(double)a4 style:(int64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CRLiOSVibrantBackdropView;
  v8 = -[CRLiOSVibrantBackdropView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    v8->_roundedCorners = a3;
    v8->_cornerRadius = a4;
    v8->_style = a5;
    v8->_selected = 0;
    [(CRLiOSVibrantBackdropView *)v8 p_commonInit];
  }
  return v9;
}

- (CRLiOSVibrantBackdropView)initWithFrame:(CGRect)a3
{
  v3 = -[CRLiOSVibrantBackdropView initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CRLiOSVibrantBackdropView *)v3 p_commonInit];
  }
  return v4;
}

- (CRLiOSVibrantBackdropView)initWithCoder:(id)a3
{
  v3 = [(CRLiOSVibrantBackdropView *)self initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CRLiOSVibrantBackdropView *)v3 p_commonInit];
  }
  return v4;
}

- (void)p_commonInit
{
  self->_normalStylePresetPair = 21;
  self->_highContrastStylePresetPair = 22;
  self->_activeStylePresetPair = 917525;
  self->_boldActiveStylePresetPair = 12;
  id v6 = objc_alloc_init((Class)UIView);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setUserInteractionEnabled:0];
  id v3 = objc_alloc_init((Class)UIView);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setUserInteractionEnabled:0];
  id v4 = objc_alloc_init((Class)UIView);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setUserInteractionEnabled:0];
  [v4 setAlpha:0.0];
  [(CRLiOSVibrantBackdropView *)self setBaseBackdrop:v6];
  [(CRLiOSVibrantBackdropView *)self setOverlayBackdrop:v3];
  [(CRLiOSVibrantBackdropView *)self setScrimBackdrop:v4];
  [(CRLiOSVibrantBackdropView *)self setUserInteractionEnabled:0];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"p_configureBackdropsForCurrentEffectiveStyle" name:UIAccessibilityDarkerSystemColorsStatusDidChangeNotification object:0];
}

+ (id)backdropViewForSoloButton:(id)a3 active:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithCorners:5 radius:v5 style:7.5];
  [v7 linkStyleWithHighlightedStateOfButton:v6];

  return v7;
}

+ (id)backdropViewForTieredButton:(id)a3 withPosition:(int64_t)a4
{
  if ((unint64_t)a4 > 4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_101178920[a4];
  }
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithCorners:v5 radius:0 style:7.5];
  [v7 linkStyleWithHighlightedStateOfButton:v6];

  return v7;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSVibrantBackdropView;
  [(CRLiOSVibrantBackdropView *)&v4 dealloc];
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [(CRLiOSVibrantBackdropView *)self p_resetSubviewHierarchy];
  }
  [(CRLiOSVibrantBackdropView *)self setIsMovingToWindow:1];
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSVibrantBackdropView;
  [(CRLiOSVibrantBackdropView *)&v5 willMoveToWindow:v4];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSVibrantBackdropView;
  [(CRLiOSVibrantBackdropView *)&v4 didMoveToWindow];
  [(CRLiOSVibrantBackdropView *)self setIsMovingToWindow:0];
  id v3 = [(CRLiOSVibrantBackdropView *)self window];

  if (v3) {
    [(CRLiOSVibrantBackdropView *)self p_setupSubviewHierarchy];
  }
}

- (void)p_resetSubviewHierarchy
{
  [(CRLiOSVibrantBackdropView *)self setUnableToFindBlurEffect:0];
  id v3 = [(CRLiOSVibrantBackdropView *)self baseBackdrop];
  [v3 removeFromSuperview];

  objc_super v4 = [(CRLiOSVibrantBackdropView *)self overlayBackdrop];
  [v4 removeFromSuperview];

  objc_super v5 = [(CRLiOSVibrantBackdropView *)self visualEffectView];

  if (v5)
  {
    id v6 = [(CRLiOSVibrantBackdropView *)self visualEffectView];
    [v6 removeFromSuperview];

    [(CRLiOSVibrantBackdropView *)self setVisualEffectView:0];
  }
}

- (void)p_setupSubviewHierarchy
{
  uint64_t v3 = (unsigned __int16)[(CRLiOSVibrantBackdropView *)self p_presetColorPairForStyle:[(CRLiOSVibrantBackdropView *)self p_effectiveStyleForStyle:self->_style]];
  if (v3 == 2
    && ([(CRLiOSVibrantBackdropView *)self superview],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        +[CRLiOSVisualEffectHelper blurEffectProvidedByHierarchyOfView:v4], objc_super v5 = objc_claimAutoreleasedReturnValue(), v4, v5))
  {
    id v6 = +[UIVibrancyEffect effectForBlurEffect:v5 style:6];
    id v7 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v6];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CRLiOSVibrantBackdropView *)self addSubview:v7];
    [(CRLiOSVibrantBackdropView *)self p_constrainToSuperview:v7];
    v8 = [v7 contentView];
    v9 = [(CRLiOSVibrantBackdropView *)self baseBackdrop];
    [v8 addSubview:v9];

    v10 = [(CRLiOSVibrantBackdropView *)self baseBackdrop];
    [(CRLiOSVibrantBackdropView *)self p_constrainToSuperview:v10];

    objc_super v11 = [(CRLiOSVibrantBackdropView *)self overlayBackdrop];
    [(CRLiOSVibrantBackdropView *)self addSubview:v11];

    v12 = [(CRLiOSVibrantBackdropView *)self overlayBackdrop];
    [(CRLiOSVibrantBackdropView *)self p_constrainToSuperview:v12];

    v13 = [(CRLiOSVibrantBackdropView *)self scrimBackdrop];
    [(CRLiOSVibrantBackdropView *)self addSubview:v13];

    v14 = [(CRLiOSVibrantBackdropView *)self scrimBackdrop];
    [(CRLiOSVibrantBackdropView *)self p_constrainToSuperview:v14];

    [(CRLiOSVibrantBackdropView *)self setVisualEffectView:v7];
  }
  else
  {
    [(CRLiOSVibrantBackdropView *)self setUnableToFindBlurEffect:v3 == 2];
    v15 = [(CRLiOSVibrantBackdropView *)self baseBackdrop];
    [(CRLiOSVibrantBackdropView *)self addSubview:v15];

    v16 = [(CRLiOSVibrantBackdropView *)self baseBackdrop];
    [(CRLiOSVibrantBackdropView *)self p_constrainToSuperview:v16];

    v17 = [(CRLiOSVibrantBackdropView *)self overlayBackdrop];
    [(CRLiOSVibrantBackdropView *)self addSubview:v17];

    v18 = [(CRLiOSVibrantBackdropView *)self overlayBackdrop];
    [(CRLiOSVibrantBackdropView *)self p_constrainToSuperview:v18];

    v19 = [(CRLiOSVibrantBackdropView *)self scrimBackdrop];
    [(CRLiOSVibrantBackdropView *)self addSubview:v19];

    objc_super v5 = [(CRLiOSVibrantBackdropView *)self scrimBackdrop];
    [(CRLiOSVibrantBackdropView *)self p_constrainToSuperview:v5];
  }

  [(CRLiOSVibrantBackdropView *)self p_configureBackdropsForCurrentEffectiveStyle];
}

- (int64_t)p_alternateStyleForStyle:(int64_t)a3
{
  int64_t result = a3;
  if ((unint64_t)a3 <= 9) {
    return qword_101178948[a3];
  }
  return result;
}

- (int64_t)p_selectedStyleForStyle:(int64_t)a3
{
  int64_t result = a3;
  if ((unint64_t)a3 <= 9) {
    return qword_101178998[a3];
  }
  return result;
}

- (int64_t)p_effectiveStyleForStyle:(int64_t)a3
{
  uint64_t v5 = [(CRLiOSVibrantBackdropView *)self touchedButton];
  if (v5)
  {
    id v6 = (void *)v5;
    unsigned int v7 = [(CRLiOSVibrantBackdropView *)self isInsideTouchedButton];

    if (v7) {
      a3 = [(CRLiOSVibrantBackdropView *)self p_alternateStyleForStyle:a3];
    }
  }
  if (self->_selected) {
    a3 = [(CRLiOSVibrantBackdropView *)self p_selectedStyleForStyle:a3];
  }
  if (self->_alwaysUsesBoldActiveStyle || UIAccessibilityDarkerSystemColorsEnabled())
  {
    int64_t v8 = 6;
    if (a3 != 4) {
      int64_t v8 = a3;
    }
    if (a3 == 5) {
      return 7;
    }
    else {
      return v8;
    }
  }
  return a3;
}

- (int64_t)p_presetColorPairForStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
      int64_t v4 = [(CRLiOSVibrantBackdropView *)self normalStylePresetPair];
      goto LABEL_7;
    case 2:
    case 3:
      int64_t v4 = [(CRLiOSVibrantBackdropView *)self highContrastStylePresetPair];
      goto LABEL_7;
    case 4:
    case 5:
      int64_t v4 = [(CRLiOSVibrantBackdropView *)self activeStylePresetPair];
      goto LABEL_7;
    case 6:
    case 7:
      int64_t v4 = [(CRLiOSVibrantBackdropView *)self boldActiveStylePresetPair];
      goto LABEL_7;
    case 8:
    case 9:
      int64_t v4 = [(CRLiOSVibrantBackdropView *)self noneStylePresetPair];
LABEL_7:
      int64_t v5 = v4;
      break;
    default:
      int64_t v5 = 0;
      break;
  }
  if ([(CRLiOSVibrantBackdropView *)self unableToFindBlurEffect]
    && (unsigned __int16)v5 == 2)
  {
    return v5 & 0xFFFFFFFFFFFF0000 | 5;
  }
  else
  {
    return v5;
  }
}

- (void)p_configureBackdropsWithCorners:(int64_t)a3 radius:(double)a4 presetPair:(int64_t)a5
{
  uint64_t v9 = (unsigned __int16)a5;
  BOOL v10 = (unsigned __int16)a5 != 2;
  objc_super v11 = [(CRLiOSVibrantBackdropView *)self visualEffectView];
  BOOL v12 = v11 != 0;

  if (((v10 ^ v12) & 1) == 0)
  {
    [(CRLiOSVibrantBackdropView *)self p_resetSubviewHierarchy];
    [(CRLiOSVibrantBackdropView *)self p_setupSubviewHierarchy];
  }
  v13 = [(CRLiOSVibrantBackdropView *)self baseBackdrop];
  v14 = v13;
  if (v9)
  {
    [v13 setHidden:0];

    v14 = +[CRLiOSVisualEffectHelper sharedHelper];
    v15 = [(CRLiOSVibrantBackdropView *)self baseBackdrop];
    v16 = [v15 layer];
    v17 = [(CRLiOSVibrantBackdropView *)self traitCollection];
    [v14 configureBackdropLayer:v16 radius:a3 corners:v9 colorPreset:v17 forTraitCollection:a4];
  }
  else
  {
    [v13 setHidden:1];
  }

  v18 = [(CRLiOSVibrantBackdropView *)self overlayBackdrop];
  v19 = v18;
  if ((unint64_t)a5 >= 0x10000)
  {
    [v18 setHidden:0];

    v19 = +[CRLiOSVisualEffectHelper sharedHelper];
    v20 = [(CRLiOSVibrantBackdropView *)self overlayBackdrop];
    v21 = [v20 layer];
    v22 = [(CRLiOSVibrantBackdropView *)self traitCollection];
    [v19 configureBackdropLayer:v21 radius:a3 corners:a5 >> 16 colorPreset:v22 forTraitCollection:a4];
  }
  else
  {
    [v18 setHidden:1];
  }

  id v26 = +[CRLiOSVisualEffectHelper sharedHelper];
  v23 = [(CRLiOSVibrantBackdropView *)self scrimBackdrop];
  v24 = [v23 layer];
  if (self->_touchOverlayRoundsAllCorners) {
    a3 = 5;
  }
  v25 = [(CRLiOSVibrantBackdropView *)self traitCollection];
  [v26 configureBackdropLayer:v24 radius:a3 corners:7 colorPreset:v25 forTraitCollection:a4];
}

- (void)p_configureBackdropsForCurrentEffectiveStyle
{
  int64_t v3 = [(CRLiOSVibrantBackdropView *)self p_presetColorPairForStyle:[(CRLiOSVibrantBackdropView *)self p_effectiveStyleForStyle:[(CRLiOSVibrantBackdropView *)self style]]];
  int64_t v4 = [(CRLiOSVibrantBackdropView *)self roundedCorners];
  [(CRLiOSVibrantBackdropView *)self cornerRadius];

  -[CRLiOSVibrantBackdropView p_configureBackdropsWithCorners:radius:presetPair:](self, "p_configureBackdropsWithCorners:radius:presetPair:", v4, v3);
}

- (void)p_didChangeColorPresets
{
  if (![(CRLiOSVibrantBackdropView *)self isMovingToWindow])
  {
    [(CRLiOSVibrantBackdropView *)self p_configureBackdropsForCurrentEffectiveStyle];
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
}

- (void)p_constrainToSuperview:(id)a3
{
  id v16 = a3;
  int64_t v3 = [v16 superview];
  if (v3)
  {
    int64_t v4 = [v16 leadingAnchor];
    int64_t v5 = [v3 leadingAnchor];
    id v6 = [v4 constraintEqualToAnchor:v5];
    [v6 setActive:1];

    unsigned int v7 = [v16 topAnchor];
    int64_t v8 = [v3 topAnchor];
    uint64_t v9 = [v7 constraintEqualToAnchor:v8];
    [v9 setActive:1];

    BOOL v10 = [v16 trailingAnchor];
    objc_super v11 = [v3 trailingAnchor];
    BOOL v12 = [v10 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    v13 = [v16 bottomAnchor];
    v14 = [v3 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];
  }
}

- (void)p_buttonTouchDown:(id)a3
{
  [(CRLiOSVibrantBackdropView *)self setTouchedButton:a3];
  [(CRLiOSVibrantBackdropView *)self setIsInsideTouchedButton:1];

  [(CRLiOSVibrantBackdropView *)self p_configureBackdropsForCurrentEffectiveStyle];
}

- (void)p_buttonDragEnter:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSVibrantBackdropView *)self touchedButton];

  if (v5 == v4)
  {
    [(CRLiOSVibrantBackdropView *)self setIsInsideTouchedButton:1];
    [(CRLiOSVibrantBackdropView *)self p_configureBackdropsForCurrentEffectiveStyle];
  }
}

- (void)p_buttonDragExit:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSVibrantBackdropView *)self touchedButton];

  if (v5 == v4)
  {
    [(CRLiOSVibrantBackdropView *)self setIsInsideTouchedButton:0];
    [(CRLiOSVibrantBackdropView *)self p_configureBackdropsForCurrentEffectiveStyle];
  }
}

- (void)p_buttonTouchCancel:(id)a3
{
  [(CRLiOSVibrantBackdropView *)self setTouchedButton:0];
  [(CRLiOSVibrantBackdropView *)self setIsInsideTouchedButton:0];

  [(CRLiOSVibrantBackdropView *)self p_configureBackdropsForCurrentEffectiveStyle];
}

- (void)p_buttonTouchUpInside:(id)a3
{
}

- (void)setRoundedCorners:(int64_t)a3
{
  if (self->_roundedCorners != a3)
  {
    self->_roundedCorners = a3;
    [(CRLiOSVibrantBackdropView *)self p_configureBackdropsForCurrentEffectiveStyle];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(CRLiOSVibrantBackdropView *)self p_configureBackdropsForCurrentEffectiveStyle];
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(CRLiOSVibrantBackdropView *)self p_configureBackdropsForCurrentEffectiveStyle];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(CRLiOSVibrantBackdropView *)self p_configureBackdropsForCurrentEffectiveStyle];
  }
}

- (void)setAlwaysUsesBoldActiveStyle:(BOOL)a3
{
  if (self->_alwaysUsesBoldActiveStyle != a3)
  {
    self->_alwaysUsesBoldActiveStyle = a3;
    [(CRLiOSVibrantBackdropView *)self p_configureBackdropsForCurrentEffectiveStyle];
  }
}

- (BOOL)isTouched
{
  [(UIView *)self->_overlayBackdrop alpha];
  return v2 != 0.0;
}

- (void)setTouched:(BOOL)a3
{
}

- (void)setTouchOverlayRoundsAllCorners:(BOOL)a3
{
  if (self->_touchOverlayRoundsAllCorners != a3) {
    self->_touchOverlayRoundsAllCorners = a3;
  }
  [(CRLiOSVibrantBackdropView *)self p_configureBackdropsForCurrentEffectiveStyle];
}

- (void)linkStyleWithHighlightedStateOfButton:(id)a3
{
  id v4 = a3;
  [v4 addTarget:self action:"p_buttonTouchDown:" forControlEvents:1];
  [v4 addTarget:self action:"p_buttonDragEnter:" forControlEvents:16];
  [v4 addTarget:self action:"p_buttonDragExit:" forControlEvents:32];
  [v4 addTarget:self action:"p_buttonTouchCancel:" forControlEvents:256];
  [v4 addTarget:self action:"p_buttonTouchCancel:" forControlEvents:64];
  [v4 addTarget:self action:"p_buttonTouchCancel:" forControlEvents:128];
}

- (void)unlinkStyleWithHighlightedStateOfButton:(id)a3
{
  id v4 = a3;
  [v4 removeTarget:self action:"p_buttonTouchDown:" forControlEvents:1];
  [v4 removeTarget:self action:"p_buttonDragEnter:" forControlEvents:16];
  [v4 removeTarget:self action:"p_buttonDragExit:" forControlEvents:32];
  [v4 removeTarget:self action:"p_buttonTouchCancel:" forControlEvents:256];
  [v4 removeTarget:self action:"p_buttonTouchCancel:" forControlEvents:64];
  [v4 removeTarget:self action:"p_buttonTouchCancel:" forControlEvents:128];
}

- (int64_t)normalStylePresetPair
{
  return self->_normalStylePresetPair;
}

- (void)setNormalStylePresetPair:(int64_t)a3
{
  if (self->_normalStylePresetPair != a3)
  {
    self->_normalStylePresetPair = a3;
    [(CRLiOSVibrantBackdropView *)self p_didChangeColorPresets];
  }
}

- (int64_t)highContrastStylePresetPair
{
  return self->_highContrastStylePresetPair;
}

- (void)setHighContrastStylePresetPair:(int64_t)a3
{
  if (self->_highContrastStylePresetPair != a3)
  {
    self->_highContrastStylePresetPair = a3;
    [(CRLiOSVibrantBackdropView *)self p_didChangeColorPresets];
  }
}

- (int64_t)activeStylePresetPair
{
  return self->_activeStylePresetPair;
}

- (void)setActiveStylePresetPair:(int64_t)a3
{
  if (self->_activeStylePresetPair != a3)
  {
    self->_activeStylePresetPair = a3;
    [(CRLiOSVibrantBackdropView *)self p_didChangeColorPresets];
  }
}

- (int64_t)boldActiveStylePresetPair
{
  return self->_boldActiveStylePresetPair;
}

- (void)setBoldActiveStylePresetPair:(int64_t)a3
{
  if (self->_boldActiveStylePresetPair != a3)
  {
    self->_boldActiveStylePresetPair = a3;
    [(CRLiOSVibrantBackdropView *)self p_didChangeColorPresets];
  }
}

- (int64_t)noneStylePresetPair
{
  return self->_noneStylePresetPair;
}

- (void)setNoneStylePresetPair:(int64_t)a3
{
  if (self->_noneStylePresetPair != a3)
  {
    self->_noneStylePresetPair = a3;
    [(CRLiOSVibrantBackdropView *)self p_didChangeColorPresets];
  }
}

- (void)didEndScrimOpacityAnimation
{
}

- (BOOL)wantsScrimOpacityUpAnimation
{
  return 1;
}

- (int64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)alwaysUsesBoldActiveStyle
{
  return self->_alwaysUsesBoldActiveStyle;
}

- (BOOL)touchOverlayRoundsAllCorners
{
  return self->_touchOverlayRoundsAllCorners;
}

- (UIView)baseBackdrop
{
  return self->_baseBackdrop;
}

- (void)setBaseBackdrop:(id)a3
{
}

- (UIView)overlayBackdrop
{
  return self->_overlayBackdrop;
}

- (void)setOverlayBackdrop:(id)a3
{
}

- (UIView)scrimBackdrop
{
  return self->_scrimBackdrop;
}

- (void)setScrimBackdrop:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (BOOL)unableToFindBlurEffect
{
  return self->_unableToFindBlurEffect;
}

- (void)setUnableToFindBlurEffect:(BOOL)a3
{
  self->_unableToFindBlurEffect = a3;
}

- (UIButton)touchedButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchedButton);

  return (UIButton *)WeakRetained;
}

- (void)setTouchedButton:(id)a3
{
}

- (BOOL)isInsideTouchedButton
{
  return self->_isInsideTouchedButton;
}

- (void)setIsInsideTouchedButton:(BOOL)a3
{
  self->_isInsideTouchedButton = a3;
}

- (BOOL)isMovingToWindow
{
  return self->_isMovingToWindow;
}

- (void)setIsMovingToWindow:(BOOL)a3
{
  self->_isMovingToWindow = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_touchedButton);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_scrimBackdrop, 0);
  objc_storeStrong((id *)&self->_overlayBackdrop, 0);

  objc_storeStrong((id *)&self->_baseBackdrop, 0);
}

@end
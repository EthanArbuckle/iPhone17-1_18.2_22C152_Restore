@interface PXFocusSettings
+ (PXFocusSettings)sharedInstance;
- (BOOL)hideFocusRing;
- (double)focusAnimationPadding;
- (double)pressedAnimationPadding;
- (id)parentSettings;
- (int64_t)focusAnimationStyle;
- (int64_t)pressedAnimationStyle;
- (void)setDefaultValues;
- (void)setFocusAnimationPadding:(double)a3;
- (void)setFocusAnimationStyle:(int64_t)a3;
- (void)setHideFocusRing:(BOOL)a3;
- (void)setPressedAnimationPadding:(double)a3;
- (void)setPressedAnimationStyle:(int64_t)a3;
@end

@implementation PXFocusSettings

- (BOOL)hideFocusRing
{
  return self->_hideFocusRing;
}

+ (PXFocusSettings)sharedInstance
{
  if (sharedInstance_onceToken_188712 != -1) {
    dispatch_once(&sharedInstance_onceToken_188712, &__block_literal_global_188713);
  }
  v2 = (void *)sharedInstance_sharedInstance_188714;
  return (PXFocusSettings *)v2;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXFocusSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXFocusSettings *)self setFocusAnimationStyle:1];
  [(PXFocusSettings *)self setFocusAnimationPadding:48.0];
  [(PXFocusSettings *)self setPressedAnimationStyle:2];
  [(PXFocusSettings *)self setPressedAnimationPadding:24.0];
  [(PXFocusSettings *)self setHideFocusRing:0];
}

- (void)setPressedAnimationStyle:(int64_t)a3
{
  self->_pressedAnimationStyle = a3;
}

- (void)setPressedAnimationPadding:(double)a3
{
  self->_pressedAnimationPadding = a3;
}

- (void)setHideFocusRing:(BOOL)a3
{
  self->_hideFocusRing = a3;
}

- (void)setFocusAnimationStyle:(int64_t)a3
{
  self->_focusAnimationStyle = a3;
}

- (void)setFocusAnimationPadding:(double)a3
{
  self->_focusAnimationPadding = a3;
}

void __33__PXFocusSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 focusSettings];
  v1 = (void *)sharedInstance_sharedInstance_188714;
  sharedInstance_sharedInstance_188714 = v0;
}

- (int64_t)pressedAnimationStyle
{
  return self->_pressedAnimationStyle;
}

- (double)pressedAnimationPadding
{
  return self->_pressedAnimationPadding;
}

- (int64_t)focusAnimationStyle
{
  return self->_focusAnimationStyle;
}

- (double)focusAnimationPadding
{
  return self->_focusAnimationPadding;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

@end
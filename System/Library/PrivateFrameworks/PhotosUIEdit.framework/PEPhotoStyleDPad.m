@interface PEPhotoStyleDPad
- (BOOL)_canShowWhileLocked;
- (BOOL)isActive;
- (BOOL)isDottedGridAnimated;
- (BOOL)pulsingValueIndicator;
- (BOOL)snapIndicatorToGrid;
- (CGImage)backgroundImage;
- (CGImage)staticDottedGridImage;
- (CGPoint)defaultValue;
- (CGPoint)value;
- (NSString)gradientCast;
- (PEPhotoStyleDPad)initWithCoder:(id)a3;
- (PEPhotoStyleDPad)initWithNibName:(id)a3 bundle:(id)a4;
- (PEPhotoStyleDPad)initWithSize:(CGSize)a3;
- (UIColor)backgroundColor;
- (id)onGestureDidBegin;
- (id)onGestureDidEnd;
- (id)onValueChanged;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(CGImage *)a3;
- (void)setDefaultValue:(CGPoint)a3;
- (void)setDefaultValue:(CGPoint)a3 animated:(BOOL)a4;
- (void)setGradientCast:(id)a3;
- (void)setIsDottedGridAnimated:(BOOL)a3;
- (void)setOnGestureDidBegin:(id)a3;
- (void)setOnGestureDidEnd:(id)a3;
- (void)setOnValueChanged:(id)a3;
- (void)setPulsingValueIndicator:(BOOL)a3;
- (void)setSnapIndicatorToGrid:(BOOL)a3;
- (void)setStaticDottedGridImage:(CGImage *)a3;
- (void)setValue:(CGPoint)a3;
- (void)setValue:(CGPoint)a3 animated:(BOOL)a4;
- (void)setValue:(CGPoint)a3 notifyObserver:(BOOL)a4;
@end

@implementation PEPhotoStyleDPad

- (CGPoint)value
{
  v2 = self;
  double v3 = PEPhotoStyleDPad.value.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)setValue:(CGPoint)a3
{
  double v3 = self;
  PEPhotoStyleDPad.value.setter();
}

- (CGPoint)defaultValue
{
  v2 = self;
  double v3 = PEPhotoStyleDPad.defaultValue.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)setDefaultValue:(CGPoint)a3
{
  double v3 = self;
  PEPhotoStyleDPad.defaultValue.setter();
}

- (CGImage)backgroundImage
{
  v2 = self;
  double v3 = (void *)PEPhotoStyleDPad.backgroundImage.getter();

  return (CGImage *)v3;
}

- (void)setBackgroundImage:(CGImage *)a3
{
  double v5 = a3;
  double v6 = self;
  PEPhotoStyleDPad.backgroundImage.setter(a3);
}

- (UIColor)backgroundColor
{
  v2 = self;
  double v3 = (void *)PEPhotoStyleDPad.backgroundColor.getter();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  double v6 = self;
  PEPhotoStyleDPad.backgroundColor.setter(a3);
}

- (NSString)gradientCast
{
  v2 = self;
  double v3 = (void *)PEPhotoStyleDPad.gradientCast.getter();

  return (NSString *)v3;
}

- (void)setGradientCast:(id)a3
{
  id v4 = a3;
  id v5 = self;
  PEPhotoStyleDPad.gradientCast.setter(v4);
}

- (CGImage)staticDottedGridImage
{
  v2 = self;
  double v3 = (void *)PEPhotoStyleDPad.staticDottedGridImage.getter();

  return (CGImage *)v3;
}

- (void)setStaticDottedGridImage:(CGImage *)a3
{
  id v5 = a3;
  double v6 = self;
  PEPhotoStyleDPad.staticDottedGridImage.setter(a3);
}

- (id)onValueChanged
{
  v2 = self;
  uint64_t v3 = PEPhotoStyleDPad.onValueChanged.getter();
  uint64_t v5 = v4;

  v8[4] = v3;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_217BA13A0;
  v8[3] = &block_descriptor_60;
  double v6 = _Block_copy(v8);
  swift_release();
  return v6;
}

- (void)setOnValueChanged:(id)a3
{
}

- (BOOL)isActive
{
  v2 = self;
  char v3 = PEPhotoStyleDPad.isActive.getter();

  return v3 & 1;
}

- (BOOL)pulsingValueIndicator
{
  v2 = self;
  char v3 = PEPhotoStyleDPad.pulsingValueIndicator.getter();

  return v3 & 1;
}

- (void)setPulsingValueIndicator:(BOOL)a3
{
  char v3 = self;
  PEPhotoStyleDPad.pulsingValueIndicator.setter();
}

- (BOOL)isDottedGridAnimated
{
  v2 = self;
  BOOL v3 = PEPhotoStyleDPad.isDottedGridAnimated.getter();

  return v3;
}

- (void)setIsDottedGridAnimated:(BOOL)a3
{
  uint64_t v4 = self;
  PEPhotoStyleDPad.isDottedGridAnimated.setter(a3);
}

- (BOOL)snapIndicatorToGrid
{
  v2 = self;
  BOOL v3 = PEPhotoStyleDPad.snapIndicatorToGrid.getter();

  return v3;
}

- (void)setSnapIndicatorToGrid:(BOOL)a3
{
  uint64_t v4 = self;
  PEPhotoStyleDPad.snapIndicatorToGrid.setter(a3);
}

- (id)onGestureDidBegin
{
  return sub_217BA2044(self, (uint64_t)a2, PEPhotoStyleDPad.onGestureDidBegin.getter, (uint64_t)&block_descriptor_54);
}

- (void)setOnGestureDidBegin:(id)a3
{
}

- (id)onGestureDidEnd
{
  return sub_217BA2044(self, (uint64_t)a2, PEPhotoStyleDPad.onGestureDidEnd.getter, (uint64_t)&block_descriptor_3);
}

- (void)setOnGestureDidEnd:(id)a3
{
}

- (PEPhotoStyleDPad)initWithSize:(CGSize)a3
{
  return (PEPhotoStyleDPad *)PEPhotoStyleDPad.init(size:)();
}

- (PEPhotoStyleDPad)initWithCoder:(id)a3
{
}

- (void)setValue:(CGPoint)a3 animated:(BOOL)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v7 = self;
  PEPhotoStyleDPad.setValue(_:animated:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), a4);
}

- (void)setDefaultValue:(CGPoint)a3 animated:(BOOL)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v7 = self;
  PEPhotoStyleDPad.setDefaultValue(_:animated:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), a4);
}

- (void)setValue:(CGPoint)a3 notifyObserver:(BOOL)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v7 = self;
  PEPhotoStyleDPad.setValue(_:notifyObserver:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), a4);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PEPhotoStyleDPad)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_217BD8B10();
  }
  id v5 = a4;
  PEPhotoStyleDPad.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PEPhotoStyleDPad_hostingController);
}

@end
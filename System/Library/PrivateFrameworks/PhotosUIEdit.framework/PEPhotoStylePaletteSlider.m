@interface PEPhotoStylePaletteSlider
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSArray)colors;
- (NSString)gradientCast;
- (PEPhotoStylePaletteSlider)initWithCoder:(id)a3;
- (PEPhotoStylePaletteSlider)initWithFrame:(CGRect)a3;
- (PEPhotoStylePaletteSlider)initWithValue:(double)a3;
- (double)value;
- (id)onGestureDidBegin;
- (id)onGestureDidEnd;
- (id)onValueChanged;
- (void)setColors:(id)a3;
- (void)setGradientCast:(id)a3;
- (void)setOnGestureDidBegin:(id)a3;
- (void)setOnGestureDidEnd:(id)a3;
- (void)setOnValueChanged:(id)a3;
- (void)setValue:(double)a3;
- (void)setValue:(double)a3 notifyObserver:(BOOL)a4;
@end

@implementation PEPhotoStylePaletteSlider

- (double)value
{
  v2 = self;
  double v3 = PEPhotoStylePaletteSlider.value.getter();

  return v3;
}

- (void)setValue:(double)a3
{
  v4 = self;
  PEPhotoStylePaletteSlider.value.setter(a3);
}

- (NSArray)colors
{
  v2 = self;
  uint64_t v3 = PEPhotoStylePaletteSlider.colors.getter();

  if (v3)
  {
    sub_217B7C758(0, &qword_267BAE858);
    v4 = (void *)sub_217BD8B60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setColors:(id)a3
{
  if (a3)
  {
    sub_217B7C758(0, &qword_267BAE858);
    sub_217BD8B70();
  }
  v4 = self;
  PEPhotoStylePaletteSlider.colors.setter();
}

- (NSString)gradientCast
{
  v2 = self;
  uint64_t v3 = (void *)PEPhotoStylePaletteSlider.gradientCast.getter();

  return (NSString *)v3;
}

- (void)setGradientCast:(id)a3
{
  id v4 = a3;
  v5 = self;
  PEPhotoStylePaletteSlider.gradientCast.setter(v4);
}

- (id)onValueChanged
{
  v2 = self;
  uint64_t v3 = PEPhotoStylePaletteSlider.onValueChanged.getter();
  uint64_t v5 = v4;

  v8[4] = v3;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_217B79770;
  v8[3] = &block_descriptor_39;
  v6 = _Block_copy(v8);
  swift_release();
  return v6;
}

- (void)setOnValueChanged:(id)a3
{
}

- (id)onGestureDidBegin
{
  return sub_217B79D50(self, (uint64_t)a2, PEPhotoStylePaletteSlider.onGestureDidBegin.getter, (uint64_t)&block_descriptor_33);
}

- (void)setOnGestureDidBegin:(id)a3
{
}

- (id)onGestureDidEnd
{
  return sub_217B79D50(self, (uint64_t)a2, PEPhotoStylePaletteSlider.onGestureDidEnd.getter, (uint64_t)&block_descriptor_0);
}

- (void)setOnGestureDidEnd:(id)a3
{
}

- (PEPhotoStylePaletteSlider)initWithValue:(double)a3
{
  return (PEPhotoStylePaletteSlider *)PEPhotoStylePaletteSlider.init(value:)(a3);
}

- (PEPhotoStylePaletteSlider)initWithFrame:(CGRect)a3
{
  return (PEPhotoStylePaletteSlider *)PEPhotoStylePaletteSlider.init(frame:)();
}

- (PEPhotoStylePaletteSlider)initWithCoder:(id)a3
{
  id v3 = a3;
  PEPhotoStylePaletteSlider.init(coder:)();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v10.value.super.Class isa = (Class)self;
  Class isa = v10.value.super.isa;
  LOBYTE(self) = PEPhotoStylePaletteSlider.point(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v10);

  return self & 1;
}

- (void)setValue:(double)a3 notifyObserver:(BOOL)a4
{
  v6 = self;
  PEPhotoStylePaletteSlider.setValue(_:notifyObserver:)(a3, a4);
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PEPhotoStylePaletteSlider_hostingView);
}

@end
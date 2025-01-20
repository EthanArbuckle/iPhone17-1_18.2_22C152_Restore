@interface PEPhotoStyleValuesPlatterView
- (BOOL)hidePaletteLabel;
- (BOOL)hideResetButton;
- (BOOL)hideToneAndColorLabels;
- (BOOL)isResetButtonEnabled;
- (PEPhotoStyleValuesPlatterView)initWithCoder:(id)a3;
- (PEPhotoStyleValuesPlatterView)initWithFrame:(CGRect)a3;
- (PEPhotoStyleValuesPlatterView)initWithTone:(double)a3 color:(double)a4 palette:(double)a5;
- (double)color;
- (double)palette;
- (double)tone;
- (id)resetAction;
- (void)setColor:(double)a3;
- (void)setHidePaletteLabel:(BOOL)a3;
- (void)setHideResetButton:(BOOL)a3;
- (void)setHideToneAndColorLabels:(BOOL)a3;
- (void)setIsResetButtonEnabled:(BOOL)a3;
- (void)setPalette:(double)a3;
- (void)setResetAction:(id)a3;
- (void)setTone:(double)a3;
@end

@implementation PEPhotoStyleValuesPlatterView

- (double)tone
{
  v2 = self;
  double v3 = PEPhotoStyleValuesPlatterView.tone.getter();

  return v3;
}

- (void)setTone:(double)a3
{
  double v3 = self;
  PEPhotoStyleValuesPlatterView.tone.setter();
}

- (double)color
{
  v2 = self;
  double v3 = PEPhotoStyleValuesPlatterView.color.getter();

  return v3;
}

- (void)setColor:(double)a3
{
  double v3 = self;
  PEPhotoStyleValuesPlatterView.color.setter();
}

- (double)palette
{
  v2 = self;
  double v3 = PEPhotoStyleValuesPlatterView.palette.getter();

  return v3;
}

- (void)setPalette:(double)a3
{
  double v3 = self;
  PEPhotoStyleValuesPlatterView.palette.setter();
}

- (BOOL)hideToneAndColorLabels
{
  v2 = self;
  char v3 = PEPhotoStyleValuesPlatterView.hideToneAndColorLabels.getter();

  return v3 & 1;
}

- (void)setHideToneAndColorLabels:(BOOL)a3
{
  char v3 = self;
  PEPhotoStyleValuesPlatterView.hideToneAndColorLabels.setter();
}

- (BOOL)hidePaletteLabel
{
  v2 = self;
  char v3 = PEPhotoStyleValuesPlatterView.hidePaletteLabel.getter();

  return v3 & 1;
}

- (void)setHidePaletteLabel:(BOOL)a3
{
  char v3 = self;
  PEPhotoStyleValuesPlatterView.hidePaletteLabel.setter();
}

- (BOOL)hideResetButton
{
  v2 = self;
  char v3 = PEPhotoStyleValuesPlatterView.hideResetButton.getter();

  return v3 & 1;
}

- (void)setHideResetButton:(BOOL)a3
{
  char v3 = self;
  PEPhotoStyleValuesPlatterView.hideResetButton.setter();
}

- (BOOL)isResetButtonEnabled
{
  v2 = self;
  char v3 = PEPhotoStyleValuesPlatterView.isResetButtonEnabled.getter();

  return v3 & 1;
}

- (void)setIsResetButtonEnabled:(BOOL)a3
{
  char v3 = self;
  PEPhotoStyleValuesPlatterView.isResetButtonEnabled.setter();
}

- (id)resetAction
{
  v2 = self;
  uint64_t v3 = PEPhotoStyleValuesPlatterView.resetAction.getter();
  uint64_t v5 = v4;

  v8[4] = v3;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_217B9E748;
  v8[3] = &block_descriptor_1;
  v6 = _Block_copy(v8);
  swift_release();
  return v6;
}

- (void)setResetAction:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  uint64_t v5 = self;
  PEPhotoStyleValuesPlatterView.resetAction.setter();
}

- (PEPhotoStyleValuesPlatterView)initWithTone:(double)a3 color:(double)a4 palette:(double)a5
{
  return (PEPhotoStyleValuesPlatterView *)PEPhotoStyleValuesPlatterView.init(tone:color:palette:)(a3, a4, a5);
}

- (PEPhotoStyleValuesPlatterView)initWithCoder:(id)a3
{
}

- (PEPhotoStyleValuesPlatterView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PEPhotoStyleValuesPlatterView_hostingController);
}

@end
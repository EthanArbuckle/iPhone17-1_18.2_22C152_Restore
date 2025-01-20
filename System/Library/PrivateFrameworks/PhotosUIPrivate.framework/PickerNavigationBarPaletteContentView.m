@interface PickerNavigationBarPaletteContentView
- (_TtC15PhotosUIPrivateP33_DC9A8F55D6B39D6B39426715689DCE8337PickerNavigationBarPaletteContentView)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivateP33_DC9A8F55D6B39D6B39426715689DCE8337PickerNavigationBarPaletteContentView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation PickerNavigationBarPaletteContentView

- (void)layoutSubviews
{
  v2 = self;
  sub_1AEAA7128();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = (void *)sub_1AEAA7358((uint64_t)a4, x, y);

  return v10;
}

- (_TtC15PhotosUIPrivateP33_DC9A8F55D6B39D6B39426715689DCE8337PickerNavigationBarPaletteContentView)initWithFrame:(CGRect)a3
{
  return (_TtC15PhotosUIPrivateP33_DC9A8F55D6B39D6B39426715689DCE8337PickerNavigationBarPaletteContentView *)sub_1AEAA78C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15PhotosUIPrivateP33_DC9A8F55D6B39D6B39426715689DCE8337PickerNavigationBarPaletteContentView)initWithCoder:(id)a3
{
  return (_TtC15PhotosUIPrivateP33_DC9A8F55D6B39D6B39426715689DCE8337PickerNavigationBarPaletteContentView *)sub_1AEAA7950(a3);
}

@end
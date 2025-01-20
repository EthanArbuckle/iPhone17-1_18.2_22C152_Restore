@interface PXMapOptionsView
- (BOOL)enableUserTrackingButton;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXMapOptionsView)initWithCoder:(id)a3;
- (PXMapOptionsView)initWithFrame:(CGRect)a3;
- (PXMapOptionsView)initWithMapView:(id)a3;
- (PXMapOptionsViewDelegate)delegate;
- (unint64_t)mapStyle;
- (void)didTapMapModeSettingsButton;
- (void)didTapPerspectiveButtonWithSender:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableUserTrackingButton:(BOOL)a3;
- (void)setMapStyle:(unint64_t)a3;
- (void)setPerspectiveButtonState:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation PXMapOptionsView

- (unint64_t)mapStyle
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___PXMapOptionsView_mapStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setMapStyle:(unint64_t)a3
{
  v5 = (unint64_t *)((char *)self + OBJC_IVAR___PXMapOptionsView_mapStyle);
  swift_beginAccess();
  unint64_t *v5 = a3;
  v6 = self;
  sub_1AA772008();
}

- (BOOL)enableUserTrackingButton
{
  v2 = (BOOL *)self + OBJC_IVAR___PXMapOptionsView_enableUserTrackingButton;
  swift_beginAccess();
  return *v2;
}

- (void)setEnableUserTrackingButton:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR___PXMapOptionsView_enableUserTrackingButton;
  swift_beginAccess();
  BOOL *v5 = a3;
  v6 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0xD0);
  v7 = self;
  BOOL v8 = (v6() & 1) == 0;
  objc_msgSend(*(id *)((char *)&v7->super.super.super.isa + OBJC_IVAR___PXMapOptionsView_userLocationButton), sel_setHidden_, v8);
  objc_msgSend(*(id *)((char *)&v7->super.super.super.isa + OBJC_IVAR___PXMapOptionsView_platterSeparatorView), sel_setHidden_, v8);
}

- (PXMapOptionsViewDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___PXMapOptionsView_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1AD10DA80](v2);
  return (PXMapOptionsViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (PXMapOptionsView)initWithMapView:(id)a3
{
  return (PXMapOptionsView *)MapOptionsView.init(mapView:)(a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXMapOptionsView_platterStackView), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setPerspectiveButtonState:(unint64_t)a3 animated:(BOOL)a4
{
  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXMapOptionsView_perspectiveButtonState) != (Class)a3)
  {
    v6 = self;
    sub_1AA77275C(a3, a4);
  }
}

- (void)didTapMapModeSettingsButton
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0x100);
  double v4 = self;
  double v3 = (void *)v2();
  if (v3)
  {
    objc_msgSend(v3, sel_mapOptionsViewDidTapMapModeSettingsButton_, v4);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)didTapPerspectiveButtonWithSender:(id)a3
{
  double v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0x100);
  id v5 = a3;
  v7 = self;
  v6 = (void *)v4();
  if (v6)
  {
    objc_msgSend(v6, sel_mapOptionsViewDidTapPerspectiveButton_, v7);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (PXMapOptionsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AA773304();
}

- (PXMapOptionsView)initWithFrame:(CGRect)a3
{
  CGSize result = (PXMapOptionsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR___PXMapOptionsView_delegate;
  sub_1A9D6D380((uint64_t)v3);
}

@end
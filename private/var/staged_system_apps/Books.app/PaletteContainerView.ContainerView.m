@interface PaletteContainerView.ContainerView
- (_TtCC5Books20PaletteContainerViewP33_B708909BBFE60AF0BC370E92243FB30413ContainerView)initWithCoder:(id)a3;
- (_TtCC5Books20PaletteContainerViewP33_B708909BBFE60AF0BC370E92243FB30413ContainerView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
@end

@implementation PaletteContainerView.ContainerView

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PaletteContainerView.ContainerView();
  id v2 = v4.receiver;
  [(PaletteContainerView.ContainerView *)&v4 didMoveToSuperview];
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  [Strong setNeedsLayout];
}

- (_TtCC5Books20PaletteContainerViewP33_B708909BBFE60AF0BC370E92243FB30413ContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PaletteContainerView.ContainerView();
  return -[PaletteContainerView.ContainerView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtCC5Books20PaletteContainerViewP33_B708909BBFE60AF0BC370E92243FB30413ContainerView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PaletteContainerView.ContainerView();
  return [(PaletteContainerView.ContainerView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end
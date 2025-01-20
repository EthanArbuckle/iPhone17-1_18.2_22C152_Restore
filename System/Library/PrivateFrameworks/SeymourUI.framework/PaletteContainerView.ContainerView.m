@interface PaletteContainerView.ContainerView
- (_TtCC9SeymourUI20PaletteContainerViewP33_CD8D19E118B7B4A87B690718073E587E13ContainerView)initWithCoder:(id)a3;
- (_TtCC9SeymourUI20PaletteContainerViewP33_CD8D19E118B7B4A87B690718073E587E13ContainerView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
@end

@implementation PaletteContainerView.ContainerView

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PaletteContainerView.ContainerView();
  v2 = (char *)v4.receiver;
  [(PaletteContainerView.ContainerView *)&v4 didMoveToSuperview];
  v3 = (void *)MEMORY[0x23ECB8640](&v2[OBJC_IVAR____TtCC9SeymourUI20PaletteContainerViewP33_CD8D19E118B7B4A87B690718073E587E13ContainerView_layoutDelegate]);
  objc_msgSend(v3, sel_setNeedsLayout, v4.receiver, v4.super_class);
}

- (_TtCC9SeymourUI20PaletteContainerViewP33_CD8D19E118B7B4A87B690718073E587E13ContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PaletteContainerView.ContainerView();
  return -[PaletteContainerView.ContainerView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC9SeymourUI20PaletteContainerViewP33_CD8D19E118B7B4A87B690718073E587E13ContainerView)initWithCoder:(id)a3
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
@interface CanvasElementResizeViewMoreButton
- (_TtC8PaperKit33CanvasElementResizeViewMoreButton)init;
- (_TtC8PaperKit33CanvasElementResizeViewMoreButton)initWithCoder:(id)a3;
- (_TtC8PaperKit33CanvasElementResizeViewMoreButton)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)didMoveToWindow;
@end

@implementation CanvasElementResizeViewMoreButton

- (_TtC8PaperKit33CanvasElementResizeViewMoreButton)init
{
  CanvasElementResizeViewMoreButton.init()();
  return result;
}

- (void)didMoveToWindow
{
  v2 = self;
  CanvasElementResizeViewMoreButton.didMoveToWindow()();
}

- (_TtC8PaperKit33CanvasElementResizeViewMoreButton)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized CanvasElementResizeViewMoreButton.init(coder:)();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v8 = MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit33CanvasElementResizeViewMoreButton_delegate, a2);
  if (v8)
  {
    v9 = (void *)v8;
    id v10 = a3;
    v11 = self;
    id v12 = objc_msgSend(v9, sel_contextMenuInteraction_configurationForMenuAtLocation_, v10, x, y);

    swift_unknownObjectRelease();
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  v9 = (void *)specialized CanvasElementResizeViewMoreButton.pointerInteraction(_:styleFor:)(v6);

  return v9;
}

- (_TtC8PaperKit33CanvasElementResizeViewMoreButton)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit33CanvasElementResizeViewMoreButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit33CanvasElementResizeViewMoreButton_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit33CanvasElementResizeViewMoreButton_imageView);
}

@end
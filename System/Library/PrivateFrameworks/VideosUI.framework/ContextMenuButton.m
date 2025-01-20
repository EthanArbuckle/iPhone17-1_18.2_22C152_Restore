@interface ContextMenuButton
- (_TtC8VideosUI17ContextMenuButton)initWithCoder:(id)a3;
- (_TtC8VideosUI17ContextMenuButton)initWithFrame:(CGRect)a3;
- (_TtC8VideosUI17ContextMenuButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation ContextMenuButton

- (_TtC8VideosUI17ContextMenuButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4
{
  return (_TtC8VideosUI17ContextMenuButton *)sub_1E30F1678(a3, a4);
}

- (_TtC8VideosUI17ContextMenuButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E30F1C00();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  v9 = self;
  uint64_t v10 = OUTLINED_FUNCTION_12_15();
  v11 = sub_1E30F21E0(v10, x, y);

  return v11;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  sub_1E30F25B0((uint64_t)v8, v9, a5);

  swift_unknownObjectRelease();
}

- (_TtC8VideosUI17ContextMenuButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17ContextMenuButton_contextMenuInteractor));
  id v3 = (char *)self + OBJC_IVAR____TtC8VideosUI17ContextMenuButton_contextMenuInteractorDelegate;
  sub_1E2F6ABF0((uint64_t)v3);
}

@end
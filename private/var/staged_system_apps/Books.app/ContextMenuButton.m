@interface ContextMenuButton
- (_TtC5Books17ContextMenuButton)initWithCoder:(id)a3;
- (_TtC5Books17ContextMenuButton)initWithFrame:(CGRect)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation ContextMenuButton

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
}

- (_TtC5Books17ContextMenuButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ContextMenuButton();
  return -[ContextMenuButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books17ContextMenuButton)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ContextMenuButton();
  return [(ContextMenuButton *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end
@interface ToolbarUIButton
- (_TtC5Books15ToolbarUIButton)initWithCoder:(id)a3;
- (_TtC5Books15ToolbarUIButton)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
@end

@implementation ToolbarUIButton

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = _s5Books15ToolbarUIButtonC22contextMenuInteraction_016configurationForE10AtLocationSo09UIContextE13ConfigurationCSgSo0keF0C_So7CGPointVtF_0();

  return v7;
}

- (_TtC5Books15ToolbarUIButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books15ToolbarUIButton_tuiMenu) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ToolbarUIButton();
  return -[ToolbarUIButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books15ToolbarUIButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books15ToolbarUIButton_tuiMenu) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ToolbarUIButton();
  return [(ToolbarUIButton *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end
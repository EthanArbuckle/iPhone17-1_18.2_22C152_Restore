@interface ToolbarStyleButton
- (_TtC5Books18ToolbarStyleButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ToolbarStyleButton

- (_TtC5Books18ToolbarStyleButton)initWithFrame:(CGRect)a3
{
  return (_TtC5Books18ToolbarStyleButton *)sub_100444590(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ToolbarStyleButton();
  v2 = (char *)v4.receiver;
  [(ToolbarStyleButton *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC5Books18ToolbarStyleButton_highlightView];
  [v2 bounds];
  [v3 setFrame:];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books18ToolbarStyleButton_highlightView));
}

@end
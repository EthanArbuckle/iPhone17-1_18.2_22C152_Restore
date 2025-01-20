@interface PlatterCellView
- (BOOL)isHighlighted;
- (_TtC16MusicMessagesApp15PlatterCellView)initWithCoder:(id)a3;
- (_TtC16MusicMessagesApp15PlatterCellView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation PlatterCellView

- (_TtC16MusicMessagesApp15PlatterCellView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicMessagesApp15PlatterCellView *)sub_1000147B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicMessagesApp15PlatterCellView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000152AC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100014BE4();
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlatterCellView();
  return [(PlatterCellView *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_100014DF8(a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100014F30();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp15PlatterCellView_platterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp15PlatterCellView_customBackgroundView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicMessagesApp15PlatterCellView_highlightDimmingView);
}

@end
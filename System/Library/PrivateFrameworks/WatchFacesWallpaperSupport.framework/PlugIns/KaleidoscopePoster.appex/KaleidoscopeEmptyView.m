@interface KaleidoscopeEmptyView
- (_TtC18KaleidoscopePoster21KaleidoscopeEmptyView)initWithCoder:(id)a3;
- (_TtC18KaleidoscopePoster21KaleidoscopeEmptyView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation KaleidoscopeEmptyView

- (_TtC18KaleidoscopePoster21KaleidoscopeEmptyView)initWithFrame:(CGRect)a3
{
  return (_TtC18KaleidoscopePoster21KaleidoscopeEmptyView *)sub_100021CA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18KaleidoscopePoster21KaleidoscopeEmptyView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18KaleidoscopePoster21KaleidoscopeEmptyView_emptyPosterLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC18KaleidoscopePoster21KaleidoscopeEmptyView *)sub_100029460();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for KaleidoscopeEmptyView();
  v2 = (char *)v4.receiver;
  [(KaleidoscopeEmptyView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC18KaleidoscopePoster21KaleidoscopeEmptyView_emptyPosterLabel];
  objc_msgSend(v3, "sizeToFit", v4.receiver, v4.super_class);
  [v2 center];
  objc_msgSend(v3, "setCenter:");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18KaleidoscopePoster21KaleidoscopeEmptyView_emptyPosterLabel));
}

@end
@interface FormatMicaSectionDecorationView
- (_TtC8NewsFeed31FormatMicaSectionDecorationView)initWithCoder:(id)a3;
- (_TtC8NewsFeed31FormatMicaSectionDecorationView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)didMoveToSuperview;
- (void)gutterViewBoundsDidChange;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation FormatMicaSectionDecorationView

- (_TtC8NewsFeed31FormatMicaSectionDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed31FormatMicaSectionDecorationView *)sub_1C0AF070C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed31FormatMicaSectionDecorationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0AF25C8();
}

- (void)willMoveToSuperview:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  id v5 = a3;
  [(FormatMicaSectionDecorationView *)&v8 willMoveToSuperview:v5];
  uint64_t v6 = sub_1C151F8CC();
  if (v6)
  {
    v7 = (void *)v6;
    sub_1C1519EDC();

    id v5 = v4;
    id v4 = v7;
  }
}

- (void)didMoveToSuperview
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(FormatMicaSectionDecorationView *)&v5 didMoveToSuperview];
  uint64_t v3 = sub_1C151F8CC();
  if (v3)
  {
    id v4 = (void *)v3;
    sub_1C1519ECC();

    id v2 = v4;
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(FormatMicaSectionDecorationView *)&v3 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  sub_1C151F8FC();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1C0AF0AC4(v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1C0AF1388((uint64_t)a3);
}

- (void)gutterViewBoundsDidChange
{
  id v2 = self;
  sub_1C151F96C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatMicaSectionDecorationView_micaView));
  swift_bridgeObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed31FormatMicaSectionDecorationView_model;
  sub_1C0AF1E08((uint64_t)v3);
}

@end
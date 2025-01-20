@interface SearchActionContentView
- (_TtC8AppStore23SearchActionContentView)initWithCoder:(id)a3;
- (_TtC8AppStore23SearchActionContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SearchActionContentView

- (_TtC8AppStore23SearchActionContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23SearchActionContentView *)sub_10046B20C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore23SearchActionContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10046FC28();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10046BA3C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23SearchActionContentView_linkLabel));
  sub_10046FB80((uint64_t)self + OBJC_IVAR____TtC8AppStore23SearchActionContentView_metrics, type metadata accessor for SearchActionContentView.Layout.Metrics);
}

@end
@interface EmptyStateView
- (_TtC8AppStore14EmptyStateView)initWithCoder:(id)a3;
- (_TtC8AppStore14EmptyStateView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EmptyStateView

- (_TtC8AppStore14EmptyStateView)initWithFrame:(CGRect)a3
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for EmptyStateView());
  v4 = sub_100408054(0, 0, 0, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC8AppStore14EmptyStateView *)v4;
}

- (_TtC8AppStore14EmptyStateView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100409338();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100408A8C();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore14EmptyStateView_descriptionTextSpace;
  uint64_t v4 = type metadata accessor for StaticDimension();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore14EmptyStateView_descriptionLabel);
}

@end
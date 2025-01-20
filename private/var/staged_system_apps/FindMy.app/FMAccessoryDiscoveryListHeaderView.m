@interface FMAccessoryDiscoveryListHeaderView
- (_TtC6FindMy34FMAccessoryDiscoveryListHeaderView)initWithCoder:(id)a3;
- (_TtC6FindMy34FMAccessoryDiscoveryListHeaderView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMAccessoryDiscoveryListHeaderView

- (_TtC6FindMy34FMAccessoryDiscoveryListHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy34FMAccessoryDiscoveryListHeaderView_headerView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for FMAddItemFlowHeaderView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC6FindMy34FMAccessoryDiscoveryListHeaderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1002D3A50((uint64_t)a3);
}

- (_TtC6FindMy34FMAccessoryDiscoveryListHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy34FMAccessoryDiscoveryListHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMAccessoryDiscoveryListHeaderView_videoPlayerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMAccessoryDiscoveryListHeaderView_headerView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
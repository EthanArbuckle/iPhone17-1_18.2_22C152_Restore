@interface InteractiveTitleHeaderView
- (_TtC8AppStore26InteractiveTitleHeaderView)initWithCoder:(id)a3;
- (_TtC8AppStore26InteractiveTitleHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation InteractiveTitleHeaderView

- (_TtC8AppStore26InteractiveTitleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26InteractiveTitleHeaderView *)sub_10030F708(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore26InteractiveTitleHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore26InteractiveTitleHeaderView_titleView;
  type metadata accessor for TitleHeaderView(0);
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  v8 = (char *)self + OBJC_IVAR____TtC8AppStore26InteractiveTitleHeaderView_currentState;
  uint64_t v9 = type metadata accessor for InteractiveSectionBackgroundScrollObserver.State(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);

  result = (_TtC8AppStore26InteractiveTitleHeaderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for InteractiveTitleHeaderView();
  v2 = (char *)v4.receiver;
  [(InteractiveTitleHeaderView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore26InteractiveTitleHeaderView_titleView];
  [v2 bounds];
  [v3 setFrame:];
}

- (void)prepareForReuse
{
  uint64_t v3 = sub_100082C28((uint64_t *)&unk_100990400);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (objc_class *)type metadata accessor for InteractiveTitleHeaderView();
  v11.receiver = self;
  v11.super_class = v6;
  id v7 = self;
  [(InteractiveTitleHeaderView *)&v11 prepareForReuse];
  [*(id *)((char *)&v7->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore26InteractiveTitleHeaderView_titleView) prepareForReuse];
  uint64_t v8 = type metadata accessor for InteractiveSectionBackgroundScrollObserver.State(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC8AppStore26InteractiveTitleHeaderView_currentState;
  swift_beginAccess();
  sub_100310160((uint64_t)v5, v9);
  swift_endAccess();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26InteractiveTitleHeaderView_titleView));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8AppStore26InteractiveTitleHeaderView_currentState;

  sub_10031009C((uint64_t)v3);
}

@end
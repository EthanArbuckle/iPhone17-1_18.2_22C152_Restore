@interface UberHeaderView
- (_TtC8AppStore14UberHeaderView)initWithCoder:(id)a3;
- (_TtC8AppStore14UberHeaderView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UberHeaderView

- (_TtC8AppStore14UberHeaderView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UberHeaderView_isRubberbanding) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UberHeaderView_reflectionOutset) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UberHeaderView_contentBottomInset) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UberHeaderView_navigationItem) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UberHeaderView_sizeChangeObserver);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8AppStore14UberHeaderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_1001758E8();
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore14UberHeaderView_legibilityGradientView));

  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UberHeaderView_sizeChangeObserver);

  sub_10006012C(v3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1001776F8((unint64_t *)&qword_1009810E0, 255, type metadata accessor for NSKeyValueChangeKey);
  v15 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

LABEL_8:
  sub_100175D34(v10, v12, (uint64_t)v18, v15, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100082BCC((uint64_t)v18, (uint64_t *)&unk_100982B40);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100176304(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100176444();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1001769F8((uint64_t)a4, x, y);

  return v10;
}

- (_TtC8AppStore14UberHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore14UberHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
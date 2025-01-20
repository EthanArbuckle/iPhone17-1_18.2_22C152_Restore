@interface AppShowcaseCollectionViewCell
- (_TtC8AppStore29AppShowcaseCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore29AppShowcaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AppShowcaseCollectionViewCell

- (_TtC8AppStore29AppShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29AppShowcaseCollectionViewCell *)sub_100165F7C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29AppShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_lockupView;
  id v8 = objc_allocWithZone((Class)type metadata accessor for AppShowcaseLockupView());
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)[v8 initWithFrame:0.0, 0.0, 0.0, 0.0];
  swift_unknownObjectWeakInit();
  v10 = (char *)self + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_showcaseType;
  uint64_t v11 = enum case for AppShowcaseType.large(_:);
  uint64_t v12 = type metadata accessor for AppShowcaseType();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);

  result = (_TtC8AppStore29AppShowcaseCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100166690();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100166798();
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_lockupView));
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_showcaseType;
  uint64_t v4 = type metadata accessor for AppShowcaseType();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end
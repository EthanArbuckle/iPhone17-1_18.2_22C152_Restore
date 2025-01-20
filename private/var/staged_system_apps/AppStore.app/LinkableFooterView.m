@interface LinkableFooterView
- (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView)initWithReuseIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation LinkableFooterView

- (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView *)sub_10063B074(v3, v4);
}

- (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView)initWithCoder:(id)a3
{
  uint64_t v5 = type metadata accessor for FontUseCase();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView_linkedLabel;
  uint64_t v10 = qword_10097F708;
  id v11 = a3;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100087728(v5, (uint64_t)qword_1009E4F70);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
  id v13 = objc_allocWithZone((Class)type metadata accessor for DynamicTypeLinkedLabel());
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)sub_10034EA28((uint64_t)v8, 0, 0);

  result = (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10063B508();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10063B7AC((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView_linkedLabel));
}

@end
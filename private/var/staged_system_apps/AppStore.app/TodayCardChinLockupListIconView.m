@interface TodayCardChinLockupListIconView
- (_TtC8AppStore31TodayCardChinLockupListIconView)initWithCoder:(id)a3;
- (_TtC8AppStore31TodayCardChinLockupListIconView)initWithFrame:(CGRect)a3;
- (void)handleTap;
- (void)layoutSubviews;
@end

@implementation TodayCardChinLockupListIconView

- (_TtC8AppStore31TodayCardChinLockupListIconView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31TodayCardChinLockupListIconView *)sub_1000F25D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31TodayCardChinLockupListIconView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore31TodayCardChinLockupListIconView_artworkView;
  type metadata accessor for ArtworkView();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)static ArtworkView.iconArtworkView.getter();
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore31TodayCardChinLockupListIconView_clickAction;
  uint64_t v8 = sub_100082C28((uint64_t *)&unk_10098A9A0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);

  result = (_TtC8AppStore31TodayCardChinLockupListIconView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TodayCardChinLockupListIconView *)&v3 layoutSubviews];
  [v2 bounds];
  ArtworkView.frame.setter();
}

- (void)handleTap
{
  id v2 = self;
  sub_1000F28F0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31TodayCardChinLockupListIconView_artworkView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31TodayCardChinLockupListIconView_clickAction, &qword_10098D120);
}

@end
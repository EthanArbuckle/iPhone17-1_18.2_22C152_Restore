@interface TodayCardSmallLockupCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore19TodayCardLockupView)accessibilityLockupView;
- (_TtC8AppStore38TodayCardSmallLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore38TodayCardSmallLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TodayCardSmallLockupCollectionViewCell

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  [(TodayCardSmallLockupCollectionViewCell *)&v13 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore38TodayCardSmallLockupCollectionViewCell_lockupView];
  id v4 = [v2 contentView];
  sub_10003A33C();
  LayoutMarginsAware<>.layoutFrame.getter();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v3 setFrame:v6, v8, v10, v12];
}

- (_TtC8AppStore38TodayCardSmallLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore38TodayCardSmallLockupCollectionViewCell *)sub_1000726B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore38TodayCardSmallLockupCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore38TodayCardSmallLockupCollectionViewCell_lockupView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for TodayCardLockupView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];

  result = (_TtC8AppStore38TodayCardSmallLockupCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore38TodayCardSmallLockupCollectionViewCell_lockupView) sizeThatFits:a3.width, a3.height];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(TodayCardSmallLockupCollectionViewCell *)&v5 prepareForReuse];
  id v3 = objc_retain(*(id *)(*(void *)&v2[OBJC_IVAR____TtC8AppStore38TodayCardSmallLockupCollectionViewCell_lockupView]
                         + OBJC_IVAR____TtC8AppStore14BaseLockupView_artworkView));
  v6.value.super.isa = 0;
  v6.is_nil = 0;
  ArtworkView.setImage(image:animated:)(v6, v4);
}

- (_TtC8AppStore19TodayCardLockupView)accessibilityLockupView
{
  return (_TtC8AppStore19TodayCardLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                       + OBJC_IVAR____TtC8AppStore38TodayCardSmallLockupCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38TodayCardSmallLockupCollectionViewCell_lockupView));
}

@end
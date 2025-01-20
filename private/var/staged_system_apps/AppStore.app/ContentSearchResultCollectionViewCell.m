@interface ContentSearchResultCollectionViewCell
- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView;
- (_TtC8AppStore37ContentSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore37ContentSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ContentSearchResultCollectionViewCell

- (_TtC8AppStore37ContentSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore37ContentSearchResultCollectionViewCell *)sub_100389A50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore37ContentSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore37ContentSearchResultCollectionViewCell_lockupView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v8 = OBJC_IVAR____TtC8AppStore37ContentSearchResultCollectionViewCell_screenshots;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)type metadata accessor for LockupMediaView()) init];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore37ContentSearchResultCollectionViewCell_preferredImageSizes) = (Class)_swiftEmptyDictionarySingleton;

  result = (_TtC8AppStore37ContentSearchResultCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100389D3C();
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ContentSearchResultCollectionViewCell();
  v2 = (char *)v7.receiver;
  id v3 = [(ContentSearchResultCollectionViewCell *)&v7 prepareForReuse];
  sub_100122EC8((uint64_t)v3, v4, v5);
  id v6 = *(void **)&v2[OBJC_IVAR____TtC8AppStore37ContentSearchResultCollectionViewCell_screenshots];
  sub_100225FBC();
  [v6 setHidden:0];
}

- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC8AppStore21SmallSearchLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                         + OBJC_IVAR____TtC8AppStore37ContentSearchResultCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37ContentSearchResultCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37ContentSearchResultCollectionViewCell_screenshots));

  swift_bridgeObjectRelease();
}

@end
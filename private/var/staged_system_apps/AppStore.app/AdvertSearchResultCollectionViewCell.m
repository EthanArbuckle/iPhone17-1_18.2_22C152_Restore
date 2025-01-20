@interface AdvertSearchResultCollectionViewCell
- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView;
- (_TtC8AppStore36AdvertSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore36AdvertSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AdvertSearchResultCollectionViewCell

- (_TtC8AppStore36AdvertSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36AdvertSearchResultCollectionViewCell *)sub_1004C0D5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36AdvertSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  result = (_TtC8AppStore36AdvertSearchResultCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AdvertSearchResultCollectionViewCell();
  v2 = (char *)v4.receiver;
  [(AdvertSearchResultCollectionViewCell *)&v4 layoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC8AppStore36AdvertSearchResultCollectionViewCell_advertsContentView];
  [v2 bounds];
  [v3 setFrame:];
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AdvertSearchResultCollectionViewCell();
  v2 = (char *)v6.receiver;
  [(AdvertSearchResultCollectionViewCell *)&v6 prepareForReuse];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC8AppStore36AdvertSearchResultCollectionViewCell_advertsContentView];
  sub_100122EC8((uint64_t)v3, v4, v5);
  sub_100225FBC();
}

- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC8AppStore21SmallSearchLockupView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore36AdvertSearchResultCollectionViewCell_advertsContentView)
                                                                                         + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AdvertSearchResultCollectionViewCell_advertsContentView));
}

@end
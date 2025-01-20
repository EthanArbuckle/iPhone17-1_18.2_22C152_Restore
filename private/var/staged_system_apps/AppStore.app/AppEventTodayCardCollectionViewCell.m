@interface AppEventTodayCardCollectionViewCell
- (_TtC8AppStore35AppEventTodayCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applySizeCategoryUpdates;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AppEventTodayCardCollectionViewCell

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(StoryCardCollectionViewCell *)&v3 layoutSubviews];
  sub_10001E370();
  sub_100006FC8();
}

- (_TtC8AppStore35AppEventTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore35AppEventTodayCardCollectionViewCell *)sub_10003D708(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)applySizeCategoryUpdates
{
  id v2 = self;
  sub_100021A90();
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_1004911E0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35AppEventTodayCardCollectionViewCell_formattedDateView));
}

@end
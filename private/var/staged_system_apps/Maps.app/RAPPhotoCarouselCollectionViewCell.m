@interface RAPPhotoCarouselCollectionViewCell
+ (NSString)reuseIdentifier;
- (UGCPhotoCarouselCell)photoCarouselCell;
- (UGCPhotoCarouselController)carouselController;
- (_TtC4Maps34RAPPhotoCarouselCollectionViewCell)initWithCoder:(id)a3;
- (_TtC4Maps34RAPPhotoCarouselCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)setCarouselController:(id)a3;
@end

@implementation RAPPhotoCarouselCollectionViewCell

+ (NSString)reuseIdentifier
{
  type metadata accessor for RAPPhotoCarouselCollectionViewCell();
  sub_1000FF33C(&qword_1015DC320);
  String.init<A>(describing:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (UGCPhotoCarouselCell)photoCarouselCell
{
  return (UGCPhotoCarouselCell *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super
                                                                         + OBJC_IVAR____TtC4Maps34RAPPhotoCarouselCollectionViewCell_photoCarouselCell));
}

- (UGCPhotoCarouselController)carouselController
{
  id v2 = [*(id *)((char *)&self->super + OBJC_IVAR____TtC4Maps34RAPPhotoCarouselCollectionViewCell_photoCarouselCell) carouselController];

  return (UGCPhotoCarouselController *)v2;
}

- (void)setCarouselController:(id)a3
{
}

- (_TtC4Maps34RAPPhotoCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps34RAPPhotoCarouselCollectionViewCell *)sub_10033F61C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps34RAPPhotoCarouselCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC4Maps34RAPPhotoCarouselCollectionViewCell_photoCarouselCell;
  id v6 = objc_allocWithZone((Class)UGCPhotoCarouselCell);
  id v7 = a3;
  *(MapsThemeCollectionViewListCell *)((char *)&self->super + v5) = (MapsThemeCollectionViewListCell)[v6 init];

  result = (_TtC4Maps34RAPPhotoCarouselCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
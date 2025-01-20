@interface Spinner
- (_TtC23ShelfKitCollectionViewsP33_FDB3F2239CCD97B16BEB144B6C7466ED7Spinner)initWithActivityIndicatorStyle:(int64_t)a3;
- (_TtC23ShelfKitCollectionViewsP33_FDB3F2239CCD97B16BEB144B6C7466ED7Spinner)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViewsP33_FDB3F2239CCD97B16BEB144B6C7466ED7Spinner)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation Spinner

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for Spinner();
  id v2 = v4.receiver;
  [(Spinner *)&v4 tintColorDidChange];
  id v3 = [v2 tintColor];
  [v2 setColor:v3];
}

- (_TtC23ShelfKitCollectionViewsP33_FDB3F2239CCD97B16BEB144B6C7466ED7Spinner)initWithActivityIndicatorStyle:(int64_t)a3
{
  return (_TtC23ShelfKitCollectionViewsP33_FDB3F2239CCD97B16BEB144B6C7466ED7Spinner *)sub_18F808(self, (uint64_t)a2, a3, (SEL *)&selRef_initWithActivityIndicatorStyle_);
}

- (_TtC23ShelfKitCollectionViewsP33_FDB3F2239CCD97B16BEB144B6C7466ED7Spinner)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for Spinner();
  return -[Spinner initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViewsP33_FDB3F2239CCD97B16BEB144B6C7466ED7Spinner)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViewsP33_FDB3F2239CCD97B16BEB144B6C7466ED7Spinner *)sub_18F808(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end
@interface PhotosDetailsAlbumAttributionWidget
- (NSString)snappableWidgetIdentifier;
- (PXPhotosDetailsContext)context;
- (_TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget)init;
- (int64_t)contentLayoutStyle;
- (void)setContext:(id)a3;
@end

@implementation PhotosDetailsAlbumAttributionWidget

- (PXPhotosDetailsContext)context
{
  v2 = self;
  v3 = (void *)sub_1AA0A5974();

  return (PXPhotosDetailsContext *)v3;
}

- (void)setContext:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_1AA3E5BE8(v5);
}

- (NSString)snappableWidgetIdentifier
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

- (int64_t)contentLayoutStyle
{
  v2 = self;
  char v3 = sub_1AA3E575C();

  if (v3) {
    return 2;
  }
  else {
    return 0;
  }
}

- (_TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget)init
{
  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget_contextObservation);
  void *v2 = 0;
  v2[1] = 0;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget____lazy_storage___hasSiblingWidgetAbove) = 2;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget____lazy_storage___hasSiblingWidgetBelow) = 2;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PhotosDetailsAlbumAttributionWidget();
  return [(PhotosDetailsWidget *)&v4 init];
}

- (void).cxx_destruct
{
}

@end
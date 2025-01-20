@interface PhotosDetailsAssetProvenanceWidget
- (NSString)snappableWidgetIdentifier;
- (_TtC12PhotosUICore34PhotosDetailsAssetProvenanceWidget)init;
- (int64_t)contentLayoutStyle;
@end

@implementation PhotosDetailsAssetProvenanceWidget

- (NSString)snappableWidgetIdentifier
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

- (int64_t)contentLayoutStyle
{
  v2 = self;
  char v3 = sub_1AA625D90();

  if (v3) {
    return 2;
  }
  else {
    return 0;
  }
}

- (_TtC12PhotosUICore34PhotosDetailsAssetProvenanceWidget)init
{
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC12PhotosUICore34PhotosDetailsAssetProvenanceWidget____lazy_storage___hasSiblingWidgetAbove) = 2;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC12PhotosUICore34PhotosDetailsAssetProvenanceWidget____lazy_storage___hasSiblingWidgetBelow) = 2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosDetailsAssetProvenanceWidget();
  return [(PhotosDetailsWidget *)&v3 init];
}

@end
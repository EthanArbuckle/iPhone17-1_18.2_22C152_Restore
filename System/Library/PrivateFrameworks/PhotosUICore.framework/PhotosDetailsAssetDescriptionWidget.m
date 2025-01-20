@interface PhotosDetailsAssetDescriptionWidget
- (BOOL)hasLoadedContentData;
- (NSString)snappableWidgetIdentifier;
- (_TtC12PhotosUICore35PhotosDetailsAssetDescriptionWidget)init;
@end

@implementation PhotosDetailsAssetDescriptionWidget

- (NSString)snappableWidgetIdentifier
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

- (BOOL)hasLoadedContentData
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0xD8);
  v3 = self;
  uint64_t v4 = v2();
  if (v4)
  {
    v5 = (_TtC12PhotosUICore35PhotosDetailsAssetDescriptionWidget *)v4;
    type metadata accessor for PhotosDetailsAssetDescriptionWidgetViewModel(0);
    uint64_t v6 = swift_dynamicCastClass();
    if (v6)
    {
      uint64_t v7 = (*(uint64_t (**)(void))(**(void **)(v6
                                              + OBJC_IVAR____TtC12PhotosUICore44PhotosDetailsAssetDescriptionWidgetViewModel_content)
                                + 120))();
      unint64_t v9 = v8;
      BOOL v10 = sub_1AA5910C4(v7, v8);
      sub_1AA594644(v7, v9);
    }
    else
    {
      BOOL v10 = 0;
    }

    v3 = v5;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (_TtC12PhotosUICore35PhotosDetailsAssetDescriptionWidget)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosDetailsAssetDescriptionWidget();
  return [(PhotosDetailsWidget *)&v3 init];
}

@end
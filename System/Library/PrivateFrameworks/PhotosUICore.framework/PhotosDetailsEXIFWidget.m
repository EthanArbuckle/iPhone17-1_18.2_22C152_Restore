@interface PhotosDetailsEXIFWidget
- (BOOL)hasLoadedContentData;
- (NSString)snappableWidgetIdentifier;
- (_TtC12PhotosUICore23PhotosDetailsEXIFWidget)init;
- (void)loadContentData;
@end

@implementation PhotosDetailsEXIFWidget

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
    v5 = (_TtC12PhotosUICore23PhotosDetailsEXIFWidget *)v4;
    type metadata accessor for PhotosDetailsEXIFWidgetViewModel();
    if (swift_dynamicCastClass()) {
      char v6 = sub_1AA669070();
    }
    else {
      char v6 = 0;
    }

    v3 = v5;
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (void)loadContentData
{
  v2 = self;
  sub_1A9D6D93C();
}

- (_TtC12PhotosUICore23PhotosDetailsEXIFWidget)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosDetailsEXIFWidget();
  return [(PhotosDetailsWidget *)&v3 init];
}

@end
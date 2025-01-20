@interface MusicAttributionMetadata
+ (NSString)didChangeNotificationName;
- (MPArtworkCatalog)artworkCatalog;
- (MPArtworkCatalog)placeholderArtworkCatalog;
- (MusicAttributionMetadata)init;
- (NSString)title;
- (void)setArtworkCatalog:(id)a3;
- (void)setPlaceholderArtworkCatalog:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MusicAttributionMetadata

+ (NSString)didChangeNotificationName
{
  if (qword_101098788 != -1) {
    swift_once();
  }
  v2 = (void *)qword_101129FC8;

  return (NSString *)v2;
}

- (NSString)title
{
  if (*(void *)&self->title[OBJC_IVAR___MusicAttributionMetadata_title])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___MusicAttributionMetadata_title);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (MPArtworkCatalog)artworkCatalog
{
  return (MPArtworkCatalog *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___MusicAttributionMetadata_artworkCatalog));
}

- (void)setArtworkCatalog:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_artworkCatalog);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_artworkCatalog) = (Class)a3;
  id v3 = a3;
}

- (MPArtworkCatalog)placeholderArtworkCatalog
{
  return (MPArtworkCatalog *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___MusicAttributionMetadata_placeholderArtworkCatalog));
}

- (void)setPlaceholderArtworkCatalog:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_placeholderArtworkCatalog);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_placeholderArtworkCatalog) = (Class)a3;
  id v3 = a3;
}

- (MusicAttributionMetadata)init
{
  NSString v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_title);
  void *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_artworkCatalog) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_placeholderArtworkCatalog) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AttributionMetadata();
  return [(MusicAttributionMetadata *)&v4 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_placeholderArtworkCatalog);
}

@end
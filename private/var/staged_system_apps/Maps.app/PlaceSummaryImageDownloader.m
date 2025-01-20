@interface PlaceSummaryImageDownloader
- (_TtC4Maps27PlaceSummaryImageDownloader)init;
@end

@implementation PlaceSummaryImageDownloader

- (_TtC4Maps27PlaceSummaryImageDownloader)init
{
  id v3 = objc_allocWithZone((Class)NSCache);
  v4 = self;
  v5 = (objc_class *)[v3 init];
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC4Maps27PlaceSummaryImageDownloader_photoCarouselImageCache) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for PlaceSummaryImageDownloader();
  return [(PlaceSummaryImageDownloader *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps27PlaceSummaryImageDownloader_photoCarouselImageCache));
}

@end
@interface PXSharedAlbumAddToViewFactory
+ (id)contentHostedViewControllerWithSharedAlbum:(id)a3 assets:(id)a4 doneCallback:(id)a5;
+ (id)contentHostedViewControllerWithSharedAlbum:(id)a3 mediaSources:(id)a4 doneCallback:(id)a5;
- (_TtC12PhotosUICore29PXSharedAlbumAddToViewFactory)init;
@end

@implementation PXSharedAlbumAddToViewFactory

+ (id)contentHostedViewControllerWithSharedAlbum:(id)a3 assets:(id)a4 doneCallback:(id)a5
{
  v6 = _Block_copy(a5);
  sub_1A9B21070(0, (unint64_t *)&qword_1E981C730);
  uint64_t v7 = sub_1AB23AADC();
  if (v6)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v6;
    v6 = sub_1AA4356A0;
  }
  else
  {
    uint64_t v8 = 0;
  }
  sub_1AA42A330(a3, v7, (uint64_t)v6, v8);
}

+ (id)contentHostedViewControllerWithSharedAlbum:(id)a3 mediaSources:(id)a4 doneCallback:(id)a5
{
  v6 = _Block_copy(a5);
  sub_1A9B21070(0, &qword_1E9821580);
  uint64_t v7 = sub_1AB23AADC();
  if (v6)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v6;
    v6 = sub_1A9D5E1E4;
  }
  else
  {
    uint64_t v8 = 0;
  }
  sub_1AA42A8E8(a3, v7, (uint64_t)v6, v8);
}

- (_TtC12PhotosUICore29PXSharedAlbumAddToViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXSharedAlbumAddToViewFactory();
  return [(PXSharedAlbumAddToViewFactory *)&v3 init];
}

@end
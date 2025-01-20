@interface ThumbnailProvider
- (_TtC18ThumbnailExtension17ThumbnailProvider)init;
- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation ThumbnailProvider

- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100002EF0(v8, (uint64_t)sub_100003418, v7);

  swift_release();
}

- (_TtC18ThumbnailExtension17ThumbnailProvider)init
{
  return (_TtC18ThumbnailExtension17ThumbnailProvider *)sub_100003330();
}

@end
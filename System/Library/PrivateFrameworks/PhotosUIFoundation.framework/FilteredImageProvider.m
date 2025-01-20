@interface FilteredImageProvider
- (_TtC18PhotosUIFoundation21FilteredImageProvider)init;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (void)cancelImageRequest:(int64_t)a3;
@end

@implementation FilteredImageProvider

- (_TtC18PhotosUIFoundation21FilteredImageProvider)init
{
  return (_TtC18PhotosUIFoundation21FilteredImageProvider *)FilteredImageProvider.init()();
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  v13 = _Block_copy(a7);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  swift_unknownObjectRetain();
  id v15 = a6;
  v16 = self;
  int64_t v17 = sub_259D185D0((uint64_t)a3, a5, a6, (uint64_t)sub_259D1BF28, v14, width, height);
  swift_unknownObjectRelease();

  swift_release();
  return v17;
}

- (void)cancelImageRequest:(int64_t)a3
{
  v3 = self;
  sub_259D18E18();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
}

@end
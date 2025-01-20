@interface AmbientPhotoFrameDataSource
+ (id)suggestionPredicateForSmartAlbumTypes:(unint64_t)a3;
+ (unint64_t)supportedTypes;
- (_TtC15PhotosUIPrivate27AmbientPhotoFrameDataSource)initWithPhotoLibrary:(id)a3 changeObserver:(id)a4;
- (id)fetchSuggestionsForPersonLocalIdentifier:(id)a3;
- (id)keyAssetFetchOptions;
- (void)fetchSuggestions;
- (void)setupPreviewAssets;
@end

@implementation AmbientPhotoFrameDataSource

- (_TtC15PhotosUIPrivate27AmbientPhotoFrameDataSource)initWithPhotoLibrary:(id)a3 changeObserver:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  return (_TtC15PhotosUIPrivate27AmbientPhotoFrameDataSource *)sub_1AEB153CC(v5, (uint64_t)a4);
}

+ (unint64_t)supportedTypes
{
  return 31;
}

- (void)fetchSuggestions
{
  v2 = self;
  sub_1AEB155A8();
}

- (id)fetchSuggestionsForPersonLocalIdentifier:(id)a3
{
  sub_1AEF96DE0();
  v4 = self;
  id v5 = (void *)sub_1AEB161DC();

  swift_bridgeObjectRelease();
  return v5;
}

- (id)keyAssetFetchOptions
{
  v2 = self;
  id v3 = sub_1AEB162F8();

  return v3;
}

- (void)setupPreviewAssets
{
  v2 = self;
  sub_1AEB16420();
}

+ (id)suggestionPredicateForSmartAlbumTypes:(unint64_t)a3
{
  id v3 = sub_1AEB175D4(a3);
  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameDataSource_featuredAssets));
}

@end
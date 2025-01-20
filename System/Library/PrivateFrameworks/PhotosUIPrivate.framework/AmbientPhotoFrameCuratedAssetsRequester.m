@interface AmbientPhotoFrameCuratedAssetsRequester
- (_TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedAssetsRequester)init;
- (void)passiveContentDataSourcePreviewAssetsDidChange:(id)a3;
- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3;
@end

@implementation AmbientPhotoFrameCuratedAssetsRequester

- (void)passiveContentDataSourcePreviewAssetsDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEABD664(v4);
}

- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEABD904();
}

- (_TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedAssetsRequester)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedAssetsRequester____lazy_storage___smartAlbumDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedAssetsRequester____lazy_storage___peoplePickerDataSource));
  sub_1AEABDEDC((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedAssetsRequester_assetsContinuation);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedAssetsRequester_photoLibrary);
}

@end
@interface AmbientPhotoFrameCuratedPeopleRequester
- (_TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedPeopleRequester)init;
- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3;
@end

@implementation AmbientPhotoFrameCuratedPeopleRequester

- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEB08194();
}

- (_TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedPeopleRequester)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedPeopleRequester____lazy_storage___peoplePickerDataSource));
  sub_1AEB0AA6C((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedPeopleRequester_assetsContinuation);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedPeopleRequester_photoLibrary);
}

@end
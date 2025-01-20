@interface AmbientPhotoFramePeoplePickerDataSource
- (_TtC15PhotosUIPrivate39AmbientPhotoFramePeoplePickerDataSource)initWithPhotoLibrary:(id)a3;
- (id)peopleSuggestionSubtypes;
- (void)computeAndCachePersonsWithPersonLocalIdentifierWithNegativeFeedback:(id)a3;
@end

@implementation AmbientPhotoFramePeoplePickerDataSource

- (id)peopleSuggestionSubtypes
{
  v2 = self;
  sub_1AEB07154();

  sub_1AEA0826C(0, (unint64_t *)&qword_1E9A98E00);
  sub_1AEB07294();
  v3 = (void *)sub_1AEF97110();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)computeAndCachePersonsWithPersonLocalIdentifierWithNegativeFeedback:(id)a3
{
  sub_1AEF97130();
  v4 = self;
  sub_1AEB07374();

  swift_bridgeObjectRelease();
}

- (_TtC15PhotosUIPrivate39AmbientPhotoFramePeoplePickerDataSource)initWithPhotoLibrary:(id)a3
{
  return (_TtC15PhotosUIPrivate39AmbientPhotoFramePeoplePickerDataSource *)AmbientPhotoFramePeoplePickerDataSource.init(photoLibrary:)(a3);
}

@end
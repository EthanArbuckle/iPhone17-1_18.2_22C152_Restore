@interface PersonCuration
+ (id)fetchCuratedAssetsForPerson:(id)a3 options:(id)a4 useSummary:(BOOL)a5;
+ (id)fetchCuratedAssetsForSocialGroup:(id)a3 options:(id)a4 useSummary:(BOOL)a5 includeOthersInSocialGroupAssets:(BOOL)a6;
- (_TtC18PhotosIntelligence14PersonCuration)init;
@end

@implementation PersonCuration

+ (id)fetchCuratedAssetsForPerson:(id)a3 options:(id)a4 useSummary:(BOOL)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = static PersonCuration.fetchCuratedAssets(for:options:useSummary:)(v8, a4, a5);

  return v10;
}

+ (id)fetchCuratedAssetsForSocialGroup:(id)a3 options:(id)a4 useSummary:(BOOL)a5 includeOthersInSocialGroupAssets:(BOOL)a6
{
  swift_getObjCClassMetadata();
  id v10 = a3;
  id v11 = a4;
  id v12 = static PersonCuration.fetchCuratedAssets(for:options:useSummary:includeOthersInSocialGroupAssets:)(v10, a4, a5, a6);

  return v12;
}

- (_TtC18PhotosIntelligence14PersonCuration)init
{
  return (_TtC18PhotosIntelligence14PersonCuration *)PersonCuration.init()();
}

@end
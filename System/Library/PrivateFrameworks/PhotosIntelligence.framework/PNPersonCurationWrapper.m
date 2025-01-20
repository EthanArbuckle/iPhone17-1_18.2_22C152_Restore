@interface PNPersonCurationWrapper
+ (id)fetchCuratedAssetsForPerson:(id)a3 options:(id)a4;
+ (id)fetchCuratedAssetsForSocialGroup:(id)a3 options:(id)a4 includeOthersInSocialGroupAssets:(BOOL)a5;
@end

@implementation PNPersonCurationWrapper

+ (id)fetchCuratedAssetsForSocialGroup:(id)a3 options:(id)a4 includeOthersInSocialGroupAssets:(BOOL)a5
{
  return +[PersonCuration fetchCuratedAssetsForSocialGroup:a3 options:a4 useSummary:1 includeOthersInSocialGroupAssets:a5];
}

+ (id)fetchCuratedAssetsForPerson:(id)a3 options:(id)a4
{
  return +[PersonCuration fetchCuratedAssetsForPerson:a3 options:a4 useSummary:1];
}

@end
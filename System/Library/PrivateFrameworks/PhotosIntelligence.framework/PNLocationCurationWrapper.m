@interface PNLocationCurationWrapper
+ (id)representativeAssetsForMapDisplayFromAssets:(id)a3;
+ (id)requiredFetchPropertySets;
+ (unint64_t)fetchLimit;
@end

@implementation PNLocationCurationWrapper

+ (id)representativeAssetsForMapDisplayFromAssets:(id)a3
{
  return +[PNLocationCuration representativeAssetsForMapDisplayFromAssets:a3];
}

+ (unint64_t)fetchLimit
{
  return +[PNLocationCuration fetchLimit];
}

+ (id)requiredFetchPropertySets
{
  return +[PNLocationCuration requiredFetchPropertySets];
}

@end
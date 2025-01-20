@interface CRTrackingAssociator
+ (id)performAssociationOnCandidates:(id)a3 useRegionsAtOCRDispatchTime:(BOOL)a4 existingRegions:(id)a5 fineGrainedResults:(id)a6 newRegionHandler:(id)a7 matchedRegionHandler:(id)a8;
+ (id)performAssociationOnCandidates:(id)a3 useRegionsAtOCRDispatchTime:(BOOL)a4 existingRegions:(id)a5 newRegionHandler:(id)a6 matchedRegionHandler:(id)a7;
@end

@implementation CRTrackingAssociator

+ (id)performAssociationOnCandidates:(id)a3 useRegionsAtOCRDispatchTime:(BOOL)a4 existingRegions:(id)a5 newRegionHandler:(id)a6 matchedRegionHandler:(id)a7
{
  return (id)[a1 performAssociationOnCandidates:a3 useRegionsAtOCRDispatchTime:a4 existingRegions:a5 fineGrainedResults:0 newRegionHandler:a6 matchedRegionHandler:a7];
}

+ (id)performAssociationOnCandidates:(id)a3 useRegionsAtOCRDispatchTime:(BOOL)a4 existingRegions:(id)a5 fineGrainedResults:(id)a6 newRegionHandler:(id)a7 matchedRegionHandler:(id)a8
{
  return 0;
}

@end
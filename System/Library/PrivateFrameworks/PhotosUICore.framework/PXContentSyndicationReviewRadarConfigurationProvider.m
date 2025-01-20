@interface PXContentSyndicationReviewRadarConfigurationProvider
- (BOOL)includeAssetImages;
- (BOOL)includeAssetThumbnails;
- (PXRadarConfiguration)radarConfiguration;
@end

@implementation PXContentSyndicationReviewRadarConfigurationProvider

- (PXRadarConfiguration)radarConfiguration
{
  v2 = objc_alloc_init(PXRadarConfiguration);
  [(PXRadarConfiguration *)v2 setComponent:13];
  [(PXRadarConfiguration *)v2 setClassification:7];
  v3 = +[PXFeedbackTapToRadarUtilities defaultDescription];
  [(PXRadarConfiguration *)v2 setDescription:v3];

  [(PXRadarConfiguration *)v2 setKeywordIDs:&unk_1F02D3370];
  [(PXRadarConfiguration *)v2 setWantsPhotosDiagnostics:1];
  return v2;
}

- (BOOL)includeAssetThumbnails
{
  return 0;
}

- (BOOL)includeAssetImages
{
  return 1;
}

@end
@interface PXDuplicatesRadarConfigurationProvider
- (BOOL)includeAssetImages;
- (BOOL)includeAssetThumbnails;
- (PXRadarConfiguration)radarConfiguration;
@end

@implementation PXDuplicatesRadarConfigurationProvider

- (PXRadarConfiguration)radarConfiguration
{
  v2 = objc_alloc_init(PXRadarConfiguration);
  [(PXRadarConfiguration *)v2 setComponent:12];
  [(PXRadarConfiguration *)v2 setClassification:7];
  v3 = +[PXFeedbackTapToRadarUtilities defaultDescription];
  [(PXRadarConfiguration *)v2 setDescription:v3];

  [(PXRadarConfiguration *)v2 setAttachmentsIncludeAnyUserAsset:1];
  [(PXRadarConfiguration *)v2 setKeywordIDs:&unk_1F02D4600];
  [(PXRadarConfiguration *)v2 setWantsPhotosDiagnostics:1];
  return v2;
}

- (BOOL)includeAssetThumbnails
{
  return 1;
}

- (BOOL)includeAssetImages
{
  return 0;
}

@end
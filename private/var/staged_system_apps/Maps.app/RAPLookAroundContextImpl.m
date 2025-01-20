@interface RAPLookAroundContextImpl
- (BOOL)lookAroundLabelsEnabled;
- (GEOPDMuninViewState)reportedMuninViewState;
- (GEOPDPhotoPosition)reportedMuninPhotoPosition;
- (GEOTileCoordinate)reportedMuninTileCoordinate;
- (NSArray)reportedMuninImageResources;
- (NSArray)reportedMuninRoadLabels;
- (NSArray)reportedVisibleMUIDs;
- (NSData)lookAroundSnapshotImageData;
- (RAPLookAroundContextImpl)initWithLookAroundView:(id)a3;
- (unint64_t)muninImageDataId;
- (unsigned)muninMetadataTileBuildId;
- (void)setMuninImageDataId:(unint64_t)a3;
- (void)setMuninMetadataTileBuildId:(unsigned int)a3;
@end

@implementation RAPLookAroundContextImpl

- (RAPLookAroundContextImpl)initWithLookAroundView:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RAPLookAroundContextImpl;
  v5 = [(RAPLookAroundContextImpl *)&v22 init];
  if (v5)
  {
    v6 = [v4 snapshotImage];
    UIImagePNGRepresentation(v6);
    v7 = (NSData *)objc_claimAutoreleasedReturnValue();

    lookAroundSnapshotImageData = v5->_lookAroundSnapshotImageData;
    v5->_lookAroundSnapshotImageData = v7;
    v9 = v7;

    v10 = [v4 muninViewState];
    uint64_t v11 = [v10 toGEOPDMuninViewState];
    reportedMuninViewState = v5->_reportedMuninViewState;
    v5->_reportedMuninViewState = (GEOPDMuninViewState *)v11;

    v13 = [v4 muninMarker];
    v5->_muninMetadataTileBuildId = [v13 buildId];
    v5->_muninImageDataId = (unint64_t)[v13 pointId];
    uint64_t v14 = [v4 visiblePlaceMUIDs];
    reportedVisibleMUIDs = v5->_reportedVisibleMUIDs;
    v5->_reportedVisibleMUIDs = (NSArray *)v14;

    uint64_t v16 = [v4 visibleRoadLabels];
    reportedMuninRoadLabels = v5->_reportedMuninRoadLabels;
    v5->_reportedMuninRoadLabels = (NSArray *)v16;

    uint64_t v18 = [v4 imageResources];
    reportedMuninImageResources = v5->_reportedMuninImageResources;
    v5->_reportedMuninImageResources = (NSArray *)v18;

    if ([v4 showsRoadLabels]) {
      unsigned __int8 v20 = 1;
    }
    else {
      unsigned __int8 v20 = [v4 showsPointLabels];
    }
    v5->_lookAroundLabelsEnabled = v20;
  }
  return v5;
}

- (unint64_t)muninImageDataId
{
  return self->_muninImageDataId;
}

- (void)setMuninImageDataId:(unint64_t)a3
{
  self->_muninImageDataId = a3;
}

- (BOOL)lookAroundLabelsEnabled
{
  return self->_lookAroundLabelsEnabled;
}

- (unsigned)muninMetadataTileBuildId
{
  return self->_muninMetadataTileBuildId;
}

- (void)setMuninMetadataTileBuildId:(unsigned int)a3
{
  self->_muninMetadataTileBuildId = a3;
}

- (NSData)lookAroundSnapshotImageData
{
  return self->_lookAroundSnapshotImageData;
}

- (NSArray)reportedMuninImageResources
{
  return self->_reportedMuninImageResources;
}

- (GEOPDPhotoPosition)reportedMuninPhotoPosition
{
  return self->_reportedMuninPhotoPosition;
}

- (NSArray)reportedMuninRoadLabels
{
  return self->_reportedMuninRoadLabels;
}

- (GEOTileCoordinate)reportedMuninTileCoordinate
{
  return self->_reportedMuninTileCoordinate;
}

- (GEOPDMuninViewState)reportedMuninViewState
{
  return self->_reportedMuninViewState;
}

- (NSArray)reportedVisibleMUIDs
{
  return self->_reportedVisibleMUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedVisibleMUIDs, 0);
  objc_storeStrong((id *)&self->_reportedMuninViewState, 0);
  objc_storeStrong((id *)&self->_reportedMuninTileCoordinate, 0);
  objc_storeStrong((id *)&self->_reportedMuninRoadLabels, 0);
  objc_storeStrong((id *)&self->_reportedMuninPhotoPosition, 0);
  objc_storeStrong((id *)&self->_reportedMuninImageResources, 0);

  objc_storeStrong((id *)&self->_lookAroundSnapshotImageData, 0);
}

@end
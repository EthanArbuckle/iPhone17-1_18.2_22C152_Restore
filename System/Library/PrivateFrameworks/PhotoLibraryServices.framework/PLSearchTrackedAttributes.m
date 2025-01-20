@interface PLSearchTrackedAttributes
- (NSArray)assetAttributesTrackedForSearch;
- (NSArray)detectedFaceAttributesTrackedForSearch;
- (NSArray)fetchingAlbumAttributesTrackedForSearch;
- (NSArray)highlightAttributesTrackedForSearch;
- (NSArray)managedAlbumAttributesTrackedForSearch;
- (NSArray)mediaAnalysisAssetAttributesTrackedForSearch;
- (NSArray)memoryAttributesTrackedForSearch;
- (NSArray)personAttributesTrackedForSearch;
- (void)setAssetAttributesTrackedForSearch:(id)a3;
- (void)setDetectedFaceAttributesTrackedForSearch:(id)a3;
- (void)setFetchingAlbumAttributesTrackedForSearch:(id)a3;
- (void)setHighlightAttributesTrackedForSearch:(id)a3;
- (void)setManagedAlbumAttributesTrackedForSearch:(id)a3;
- (void)setMediaAnalysisAssetAttributesTrackedForSearch:(id)a3;
- (void)setMemoryAttributesTrackedForSearch:(id)a3;
- (void)setPersonAttributesTrackedForSearch:(id)a3;
@end

@implementation PLSearchTrackedAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedFaceAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_personAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_highlightAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_memoryAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_fetchingAlbumAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_managedAlbumAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisAssetAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_assetAttributesTrackedForSearch, 0);
}

- (void)setDetectedFaceAttributesTrackedForSearch:(id)a3
{
}

- (void)setPersonAttributesTrackedForSearch:(id)a3
{
}

- (void)setHighlightAttributesTrackedForSearch:(id)a3
{
}

- (void)setMemoryAttributesTrackedForSearch:(id)a3
{
}

- (void)setFetchingAlbumAttributesTrackedForSearch:(id)a3
{
}

- (void)setManagedAlbumAttributesTrackedForSearch:(id)a3
{
}

- (void)setMediaAnalysisAssetAttributesTrackedForSearch:(id)a3
{
}

- (void)setAssetAttributesTrackedForSearch:(id)a3
{
}

- (NSArray)detectedFaceAttributesTrackedForSearch
{
  v7[1] = *MEMORY[0x1E4F143B8];
  detectedFaceAttributesTrackedForSearch = self->_detectedFaceAttributesTrackedForSearch;
  if (!detectedFaceAttributesTrackedForSearch)
  {
    v7[0] = @"personForFace";
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    v5 = self->_detectedFaceAttributesTrackedForSearch;
    self->_detectedFaceAttributesTrackedForSearch = v4;

    detectedFaceAttributesTrackedForSearch = self->_detectedFaceAttributesTrackedForSearch;
  }
  return detectedFaceAttributesTrackedForSearch;
}

- (NSArray)personAttributesTrackedForSearch
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  personAttributesTrackedForSearch = self->_personAttributesTrackedForSearch;
  if (!personAttributesTrackedForSearch)
  {
    v7[0] = @"fullName";
    v7[1] = @"verifiedType";
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
    v5 = self->_personAttributesTrackedForSearch;
    self->_personAttributesTrackedForSearch = v4;

    personAttributesTrackedForSearch = self->_personAttributesTrackedForSearch;
  }
  return personAttributesTrackedForSearch;
}

- (NSArray)highlightAttributesTrackedForSearch
{
  v7[10] = *MEMORY[0x1E4F143B8];
  highlightAttributesTrackedForSearch = self->_highlightAttributesTrackedForSearch;
  if (!highlightAttributesTrackedForSearch)
  {
    v7[0] = @"dayGroupAssets";
    v7[1] = @"dayGroupExtendedAssets";
    void v7[2] = @"endDate";
    void v7[3] = @"extendedAssets";
    v7[4] = @"kind";
    v7[5] = @"moments";
    v7[6] = @"startDate";
    v7[7] = @"summaryAssets";
    v7[8] = @"title";
    v7[9] = @"type";
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:10];
    v5 = self->_highlightAttributesTrackedForSearch;
    self->_highlightAttributesTrackedForSearch = v4;

    highlightAttributesTrackedForSearch = self->_highlightAttributesTrackedForSearch;
  }
  return highlightAttributesTrackedForSearch;
}

- (NSArray)memoryAttributesTrackedForSearch
{
  v7[5] = *MEMORY[0x1E4F143B8];
  memoryAttributesTrackedForSearch = self->_memoryAttributesTrackedForSearch;
  if (!memoryAttributesTrackedForSearch)
  {
    v7[0] = @"category";
    v7[1] = @"curatedAssets";
    void v7[2] = @"creationDate";
    void v7[3] = @"rejected";
    v7[4] = @"title";
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
    v5 = self->_memoryAttributesTrackedForSearch;
    self->_memoryAttributesTrackedForSearch = v4;

    memoryAttributesTrackedForSearch = self->_memoryAttributesTrackedForSearch;
  }
  return memoryAttributesTrackedForSearch;
}

- (NSArray)fetchingAlbumAttributesTrackedForSearch
{
  v7[7] = *MEMORY[0x1E4F143B8];
  fetchingAlbumAttributesTrackedForSearch = self->_fetchingAlbumAttributesTrackedForSearch;
  if (!fetchingAlbumAttributesTrackedForSearch)
  {
    v7[0] = @"assets";
    v7[1] = @"creationDate";
    void v7[2] = @"endDate";
    void v7[3] = @"keyAssets";
    v7[4] = @"startDate";
    v7[5] = @"title";
    void v7[6] = @"trashedState";
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:7];
    v5 = self->_fetchingAlbumAttributesTrackedForSearch;
    self->_fetchingAlbumAttributesTrackedForSearch = v4;

    fetchingAlbumAttributesTrackedForSearch = self->_fetchingAlbumAttributesTrackedForSearch;
  }
  return fetchingAlbumAttributesTrackedForSearch;
}

- (NSArray)managedAlbumAttributesTrackedForSearch
{
  v7[7] = *MEMORY[0x1E4F143B8];
  managedAlbumAttributesTrackedForSearch = self->_managedAlbumAttributesTrackedForSearch;
  if (!managedAlbumAttributesTrackedForSearch)
  {
    v7[0] = @"assets";
    v7[1] = @"creationDate";
    void v7[2] = @"endDate";
    void v7[3] = @"keyAssets";
    v7[4] = @"startDate";
    v7[5] = @"title";
    void v7[6] = @"trashedState";
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:7];
    v5 = self->_managedAlbumAttributesTrackedForSearch;
    self->_managedAlbumAttributesTrackedForSearch = v4;

    managedAlbumAttributesTrackedForSearch = self->_managedAlbumAttributesTrackedForSearch;
  }
  return managedAlbumAttributesTrackedForSearch;
}

- (NSArray)mediaAnalysisAssetAttributesTrackedForSearch
{
  v7[1] = *MEMORY[0x1E4F143B8];
  mediaAnalysisAssetAttributesTrackedForSearch = self->_mediaAnalysisAssetAttributesTrackedForSearch;
  if (!mediaAnalysisAssetAttributesTrackedForSearch)
  {
    v7[0] = @"characterRecognitionAttributes";
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    v5 = self->_mediaAnalysisAssetAttributesTrackedForSearch;
    self->_mediaAnalysisAssetAttributesTrackedForSearch = v4;

    mediaAnalysisAssetAttributesTrackedForSearch = self->_mediaAnalysisAssetAttributesTrackedForSearch;
  }
  return mediaAnalysisAssetAttributesTrackedForSearch;
}

- (NSArray)assetAttributesTrackedForSearch
{
  v7[35] = *MEMORY[0x1E4F143B8];
  assetAttributesTrackedForSearch = self->_assetAttributesTrackedForSearch;
  if (!assetAttributesTrackedForSearch)
  {
    v7[0] = @"addedDate";
    v7[1] = @"albums";
    void v7[2] = @"avalanchePickType";
    void v7[3] = @"curationScore";
    v7[4] = @"depthType";
    v7[5] = @"dateCreated";
    void v7[6] = @"detectedFaces";
    v7[7] = @"duration";
    void v7[8] = @"favorite";
    v7[9] = @"filename";
    v7[10] = @"hidden";
    void v7[11] = @"isMagicCarpet";
    v7[12] = @"kind";
    v7[13] = @"kindSubtype";
    v7[14] = @"locationInfo";
    v7[15] = @"longitude";
    v7[16] = @"moment";
    v7[17] = @"overallAestheticScore";
    v7[18] = @"originalFilename";
    v7[19] = @"placeAnnotation";
    v7[20] = @"playbackVariation";
    v7[21] = @"playbackStyle";
    v7[22] = @"RAWBadgeAttribute";
    v7[23] = @"savedAssetType";
    v7[24] = @"title";
    v7[25] = @"trashedState";
    v7[26] = @"longDescription";
    v7[27] = @"uniformTypeIdentifier";
    v7[28] = @"visibilityState";
    v7[29] = @"additionalAttributes.cameraCaptureDevice";
    v7[30] = @"additionalAttributes.sceneAnalysisVersion";
    v7[31] = @"additionalAttributes.sceneClassifications";
    v7[32] = @"additionalAttributes.personReferences";
    v7[33] = @"extendedAttributes.cameraMake";
    v7[34] = @"extendedAttributes.cameraModel";
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:35];
    v5 = self->_assetAttributesTrackedForSearch;
    self->_assetAttributesTrackedForSearch = v4;

    assetAttributesTrackedForSearch = self->_assetAttributesTrackedForSearch;
  }
  return assetAttributesTrackedForSearch;
}

@end
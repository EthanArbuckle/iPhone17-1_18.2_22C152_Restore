@interface PGCuratorInvestigationItem
+ (id)itemWithUUID:(id)a3 itemInfo:(id)a4 curationModel:(id)a5;
- (BOOL)clsAvoidIfPossibleAsKeyItemForMemories:(BOOL)a3 allowGuestAsset:(BOOL)a4;
- (BOOL)clsAvoidIfPossibleAsKeyItemForMemories:(BOOL)a3 allowGuestAsset:(BOOL)a4 reason:(id *)a5;
- (BOOL)clsHasCustomPlaybackVariation;
- (BOOL)clsHasInterestingAudioClassification;
- (BOOL)clsHasInterestingScenes;
- (BOOL)clsHasPoorResolution;
- (BOOL)clsIsAestheticallyPrettyGood;
- (BOOL)clsIsBlurry;
- (BOOL)clsIsInSharedLibrary;
- (BOOL)clsIsInhabited;
- (BOOL)clsIsInterestingHDR;
- (BOOL)clsIsInterestingLivePhoto;
- (BOOL)clsIsInterestingPanorama;
- (BOOL)clsIsInterestingSDOF;
- (BOOL)clsIsInterestingVideo;
- (BOOL)clsIsLongExposure;
- (BOOL)clsIsLoopOrBounce;
- (BOOL)clsIsNonMemorable;
- (BOOL)clsIsScreenshotOrScreenRecording;
- (BOOL)clsIsUtility;
- (BOOL)isFavorite;
- (BOOL)isRegularGem;
- (BOOL)isShinyGem;
- (BOOL)isVideo;
- (CLLocation)clsLocation;
- (CLLocation)location;
- (CLLocationCoordinate2D)pl_coordinate;
- (CLSCurationModel)curationModel;
- (NSArray)clsConsolidatedPersonLocalIdentifiers;
- (NSArray)clsPersonAndPetLocalIdentifiers;
- (NSArray)clsPersonLocalIdentifiers;
- (NSArray)clsPetLocalIdentifiers;
- (NSArray)clsUnprefetchedPersonLocalIdentifiers;
- (NSArray)faceInfos;
- (NSDate)cls_localDate;
- (NSDate)cls_universalDate;
- (NSDateComponents)cls_localDateComponents;
- (NSSet)clsSceneClassifications;
- (NSString)clsIdentifier;
- (NSString)description;
- (PGCuratorInvestigationItem)init;
- (PGCuratorInvestigationItem)initWithUUID:(id)a3 itemInfo:(id)a4 curationModel:(id)a5;
- (VNSceneprint)clsSceneprint;
- (double)clsAestheticScore;
- (double)clsAutoplaySuggestionScore;
- (double)clsContentScore;
- (double)clsDuration;
- (double)clsExposureScore;
- (double)clsFaceScore;
- (double)clsHighlightVisibilityScore;
- (double)clsIconicScore;
- (double)clsInteractionScore;
- (double)clsLikabilityScore;
- (double)clsSharpnessScore;
- (double)clsSquareCropScore;
- (double)pl_gpsHorizontalAccuracy;
- (double)scoreInContext:(id)a3;
- (id)date;
- (int64_t)clsPlayCount;
- (int64_t)clsShareCount;
- (int64_t)clsViewCount;
- (unint64_t)clsPeopleCount;
- (unint64_t)clsSimilarityModelVersion;
@end

@implementation PGCuratorInvestigationItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationModel, 0);
  objc_storeStrong((id *)&self->_faceInfos, 0);
  objc_storeStrong((id *)&self->_clsUnprefetchedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsSceneprint, 0);
  objc_storeStrong((id *)&self->_clsSceneClassifications, 0);
  objc_storeStrong((id *)&self->_clsPersonAndPetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsPetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsConsolidatedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsLocation, 0);
  objc_storeStrong((id *)&self->_cls_localDate, 0);
  objc_storeStrong((id *)&self->_cls_universalDate, 0);
  objc_storeStrong((id *)&self->_clsIdentifier, 0);
  objc_storeStrong((id *)&self->_clsIconicScore, 0);
  objc_storeStrong((id *)&self->_clsIsInSharedLibrary, 0);
  objc_storeStrong((id *)&self->_clsSquareCropScore, 0);
  objc_storeStrong((id *)&self->_clsGpsHorizontalAccuracy, 0);
  objc_storeStrong((id *)&self->_clsIsLongExposure, 0);
  objc_storeStrong((id *)&self->_clsIsLoopOrBounce, 0);
  objc_storeStrong((id *)&self->_clsIsNonMemorable, 0);
  objc_storeStrong((id *)&self->_clsDuration, 0);
  objc_storeStrong((id *)&self->_isRegularGem, 0);
  objc_storeStrong((id *)&self->_isShinyGem, 0);
  objc_storeStrong((id *)&self->_clsAutoplaySuggestionScore, 0);
  objc_storeStrong((id *)&self->_clsHighlightVisibilityScore, 0);
  objc_storeStrong((id *)&self->_clsInteractionScore, 0);
  objc_storeStrong((id *)&self->_clsLikabilityScore, 0);
  objc_storeStrong((id *)&self->_clsHasInterestingScenes, 0);
  objc_storeStrong((id *)&self->_clsHasPoorResolution, 0);
  objc_storeStrong((id *)&self->_clsAvoidIfPossibleForKeyItem, 0);
  objc_storeStrong((id *)&self->_clsIsInhabited, 0);
  objc_storeStrong((id *)&self->_clsFaceScore, 0);
  objc_storeStrong((id *)&self->_clsIsAestheticallyPrettyGood, 0);
  objc_storeStrong((id *)&self->_clsAestheticScore, 0);
  objc_storeStrong((id *)&self->_clsExposureScore, 0);
  objc_storeStrong((id *)&self->_clsSharpnessScore, 0);
  objc_storeStrong((id *)&self->_clsHasCustomPlaybackVariation, 0);
  objc_storeStrong((id *)&self->_clsHasInterestingAudioClassification, 0);
  objc_storeStrong((id *)&self->_clsIsInterestingHDR, 0);
  objc_storeStrong((id *)&self->_clsIsInterestingSDOF, 0);
  objc_storeStrong((id *)&self->_clsIsInterestingPanorama, 0);
  objc_storeStrong((id *)&self->_clsIsInterestingLivePhoto, 0);
  objc_storeStrong((id *)&self->_clsIsInterestingVideo, 0);
  objc_storeStrong((id *)&self->_clsContentScore, 0);
  objc_storeStrong((id *)&self->_isVideo, 0);
  objc_storeStrong((id *)&self->_isFavorite, 0);
  objc_storeStrong((id *)&self->_clsIsScreenshotOrScreenRecording, 0);
  objc_storeStrong((id *)&self->_clsIsBlurry, 0);
  objc_storeStrong((id *)&self->_clsIsUtility, 0);
  objc_storeStrong((id *)&self->_clsShareCount, 0);
  objc_storeStrong((id *)&self->_clsPlayCount, 0);
  objc_storeStrong((id *)&self->_clsViewCount, 0);
}

- (CLSCurationModel)curationModel
{
  return (CLSCurationModel *)objc_getProperty(self, a2, 416, 1);
}

- (NSArray)faceInfos
{
  return (NSArray *)objc_getProperty(self, a2, 408, 1);
}

- (NSArray)clsUnprefetchedPersonLocalIdentifiers
{
  return self->_clsUnprefetchedPersonLocalIdentifiers;
}

- (VNSceneprint)clsSceneprint
{
  return self->_clsSceneprint;
}

- (NSSet)clsSceneClassifications
{
  return self->_clsSceneClassifications;
}

- (NSArray)clsPersonAndPetLocalIdentifiers
{
  return self->_clsPersonAndPetLocalIdentifiers;
}

- (NSArray)clsPetLocalIdentifiers
{
  return self->_clsPetLocalIdentifiers;
}

- (NSArray)clsConsolidatedPersonLocalIdentifiers
{
  return self->_clsConsolidatedPersonLocalIdentifiers;
}

- (NSArray)clsPersonLocalIdentifiers
{
  return self->_clsPersonLocalIdentifiers;
}

- (CLLocation)clsLocation
{
  return self->_clsLocation;
}

- (NSDate)cls_localDate
{
  return self->_cls_localDate;
}

- (NSDate)cls_universalDate
{
  return self->_cls_universalDate;
}

- (NSString)clsIdentifier
{
  return self->_clsIdentifier;
}

- (double)pl_gpsHorizontalAccuracy
{
  clsGpsHorizontalAccuracy = self->_clsGpsHorizontalAccuracy;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsGpsHorizontalAccuracy == v4) {
    return 0.0;
  }
  v5 = self->_clsGpsHorizontalAccuracy;
  [(NSNumber *)v5 doubleValue];
  return result;
}

- (CLLocationCoordinate2D)pl_coordinate
{
  v3 = [(PGCuratorInvestigationItem *)self location];

  if (v3)
  {
    v4 = [(PGCuratorInvestigationItem *)self location];
    [v4 coordinate];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1E750];
    double v8 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  double v9 = v6;
  double v10 = v8;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

- (unint64_t)clsSimilarityModelVersion
{
  v2 = [(CLSCurationModel *)self->_curationModel sceneModel];
  unint64_t v3 = [v2 version];

  return v3;
}

- (double)clsIconicScore
{
  clsIconicScore = self->_clsIconicScore;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIconicScore == v4) {
    return 0.0;
  }
  double v5 = self->_clsIconicScore;
  [(NSNumber *)v5 doubleValue];
  return result;
}

- (BOOL)clsIsInSharedLibrary
{
  clsIsInSharedLibrary = self->_clsIsInSharedLibrary;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIsInSharedLibrary == v4) {
    return 0;
  }
  double v5 = self->_clsIsInSharedLibrary;
  return [(NSNumber *)v5 BOOLValue];
}

- (double)clsSquareCropScore
{
  clsSquareCropScore = self->_clsSquareCropScore;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsSquareCropScore == v4) {
    return 0.0;
  }
  double v5 = self->_clsSquareCropScore;
  double v6 = [MEMORY[0x1E4F1CA98] null];
  if (v5 == v6)
  {
    double v8 = 0.5;
  }
  else
  {
    [(NSNumber *)self->_clsSquareCropScore doubleValue];
    double v8 = v7;
  }

  return v8;
}

- (BOOL)clsIsLongExposure
{
  clsIsLongExposure = self->_clsIsLongExposure;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIsLongExposure == v4) {
    return 0;
  }
  double v5 = self->_clsIsLongExposure;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)clsIsLoopOrBounce
{
  clsIsLoopOrBounce = self->_clsIsLoopOrBounce;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIsLoopOrBounce == v4) {
    return 0;
  }
  double v5 = self->_clsIsLoopOrBounce;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)clsIsNonMemorable
{
  clsIsNonMemorable = self->_clsIsNonMemorable;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIsNonMemorable == v4) {
    return 0;
  }
  double v5 = self->_clsIsNonMemorable;
  return [(NSNumber *)v5 BOOLValue];
}

- (double)clsDuration
{
  clsDuration = self->_clsDuration;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsDuration == v4) {
    return 0.0;
  }
  double v5 = self->_clsDuration;
  [(NSNumber *)v5 doubleValue];
  return result;
}

- (BOOL)isRegularGem
{
  isRegularGem = self->_isRegularGem;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (isRegularGem == v4) {
    return 0;
  }
  double v5 = self->_isRegularGem;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)isShinyGem
{
  isShinyGem = self->_isShinyGem;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (isShinyGem == v4) {
    return 0;
  }
  double v5 = self->_isShinyGem;
  return [(NSNumber *)v5 BOOLValue];
}

- (double)clsAutoplaySuggestionScore
{
  clsAutoplaySuggestionScore = self->_clsAutoplaySuggestionScore;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsAutoplaySuggestionScore == v4) {
    return 0.0;
  }
  double v5 = self->_clsAutoplaySuggestionScore;
  [(NSNumber *)v5 doubleValue];
  return result;
}

- (double)clsHighlightVisibilityScore
{
  clsHighlightVisibilityScore = self->_clsHighlightVisibilityScore;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsHighlightVisibilityScore == v4) {
    return 0.0;
  }
  double v5 = self->_clsHighlightVisibilityScore;
  [(NSNumber *)v5 doubleValue];
  return result;
}

- (double)clsInteractionScore
{
  clsInteractionScore = self->_clsInteractionScore;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsInteractionScore == v4) {
    return 0.0;
  }
  double v5 = self->_clsInteractionScore;
  [(NSNumber *)v5 doubleValue];
  return result;
}

- (double)clsLikabilityScore
{
  clsLikabilityScore = self->_clsLikabilityScore;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsLikabilityScore == v4) {
    return 0.0;
  }
  double v5 = self->_clsLikabilityScore;
  [(NSNumber *)v5 doubleValue];
  return result;
}

- (BOOL)clsHasInterestingScenes
{
  clsHasInterestingScenes = self->_clsHasInterestingScenes;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsHasInterestingScenes == v4) {
    return 0;
  }
  double v5 = self->_clsHasInterestingScenes;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)clsHasPoorResolution
{
  clsHasPoorResolution = self->_clsHasPoorResolution;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsHasPoorResolution == v4) {
    return 0;
  }
  double v5 = self->_clsHasPoorResolution;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)clsAvoidIfPossibleAsKeyItemForMemories:(BOOL)a3 allowGuestAsset:(BOOL)a4
{
  return [(PGCuratorInvestigationItem *)self clsAvoidIfPossibleAsKeyItemForMemories:a3 allowGuestAsset:a4 reason:0];
}

- (BOOL)clsAvoidIfPossibleAsKeyItemForMemories:(BOOL)a3 allowGuestAsset:(BOOL)a4 reason:(id *)a5
{
  clsAvoidIfPossibleForKeyItem = self->_clsAvoidIfPossibleForKeyItem;
  objc_msgSend(MEMORY[0x1E4F1CA98], "null", a3, a4, a5);
  double v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsAvoidIfPossibleForKeyItem == v7) {
    return 0;
  }
  double v8 = self->_clsAvoidIfPossibleForKeyItem;
  return [(NSNumber *)v8 BOOLValue];
}

- (BOOL)clsIsInhabited
{
  clsIsInhabited = self->_clsIsInhabited;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIsInhabited == v4) {
    return 0;
  }
  double v5 = self->_clsIsInhabited;
  return [(NSNumber *)v5 BOOLValue];
}

- (double)clsFaceScore
{
  clsFaceScore = self->_clsFaceScore;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsFaceScore == v4) {
    return 0.0;
  }
  double v5 = self->_clsFaceScore;
  [(NSNumber *)v5 doubleValue];
  return result;
}

- (BOOL)clsIsAestheticallyPrettyGood
{
  return [(CLSCurationModel *)self->_curationModel isAestheticallyPrettyGoodWithAsset:self];
}

- (double)clsAestheticScore
{
  clsAestheticScore = self->_clsAestheticScore;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsAestheticScore == v4) {
    return 0.0;
  }
  double v5 = self->_clsAestheticScore;
  [(NSNumber *)v5 doubleValue];
  return result;
}

- (double)clsExposureScore
{
  clsExposureScore = self->_clsExposureScore;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsExposureScore == v4) {
    return 0.0;
  }
  double v5 = self->_clsExposureScore;
  [(NSNumber *)v5 doubleValue];
  return result;
}

- (double)clsSharpnessScore
{
  clsSharpnessScore = self->_clsSharpnessScore;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsSharpnessScore == v4) {
    return 0.0;
  }
  double v5 = self->_clsSharpnessScore;
  [(NSNumber *)v5 doubleValue];
  return result;
}

- (BOOL)clsHasCustomPlaybackVariation
{
  clsHasCustomPlaybackVariation = self->_clsHasCustomPlaybackVariation;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsHasCustomPlaybackVariation == v4) {
    return 0;
  }
  double v5 = self->_clsHasCustomPlaybackVariation;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)clsHasInterestingAudioClassification
{
  clsHasInterestingAudioClassification = self->_clsHasInterestingAudioClassification;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsHasInterestingAudioClassification == v4) {
    return 0;
  }
  double v5 = self->_clsHasInterestingAudioClassification;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)clsIsInterestingHDR
{
  clsIsInterestingHDR = self->_clsIsInterestingHDR;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIsInterestingHDR == v4) {
    return 0;
  }
  double v5 = self->_clsIsInterestingHDR;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)clsIsInterestingSDOF
{
  clsIsInterestingSDOF = self->_clsIsInterestingSDOF;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIsInterestingSDOF == v4) {
    return 0;
  }
  double v5 = self->_clsIsInterestingSDOF;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)clsIsInterestingPanorama
{
  clsIsInterestingPanorama = self->_clsIsInterestingPanorama;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIsInterestingPanorama == v4) {
    return 0;
  }
  double v5 = self->_clsIsInterestingPanorama;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)clsIsInterestingLivePhoto
{
  clsIsInterestingLivePhoto = self->_clsIsInterestingLivePhoto;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIsInterestingLivePhoto == v4) {
    return 0;
  }
  double v5 = self->_clsIsInterestingLivePhoto;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)clsIsInterestingVideo
{
  clsIsInterestingVideo = self->_clsIsInterestingVideo;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIsInterestingVideo == v4) {
    return 0;
  }
  double v5 = self->_clsIsInterestingVideo;
  return [(NSNumber *)v5 BOOLValue];
}

- (double)clsContentScore
{
  clsContentScore = self->_clsContentScore;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsContentScore == v4) {
    return 0.0;
  }
  double v5 = self->_clsContentScore;
  [(NSNumber *)v5 doubleValue];
  return result;
}

- (BOOL)isVideo
{
  isVideo = self->_isVideo;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (isVideo == v4) {
    return 0;
  }
  double v5 = self->_isVideo;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)isFavorite
{
  isFavorite = self->_isFavorite;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (isFavorite == v4) {
    return 0;
  }
  double v5 = self->_isFavorite;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)clsIsScreenshotOrScreenRecording
{
  clsIsScreenshotOrScreenRecording = self->_clsIsScreenshotOrScreenRecording;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIsScreenshotOrScreenRecording == v4) {
    return 0;
  }
  double v5 = self->_clsIsScreenshotOrScreenRecording;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)clsIsBlurry
{
  clsIsBlurry = self->_clsIsBlurry;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIsBlurry == v4) {
    return 0;
  }
  double v5 = self->_clsIsBlurry;
  return [(NSNumber *)v5 BOOLValue];
}

- (BOOL)clsIsUtility
{
  clsIsUtility = self->_clsIsUtility;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsIsUtility == v4) {
    return 0;
  }
  double v5 = self->_clsIsUtility;
  return [(NSNumber *)v5 BOOLValue];
}

- (int64_t)clsShareCount
{
  clsShareCount = self->_clsShareCount;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsShareCount == v4) {
    return 0;
  }
  double v5 = self->_clsShareCount;
  return [(NSNumber *)v5 integerValue];
}

- (int64_t)clsPlayCount
{
  clsPlayCount = self->_clsPlayCount;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsPlayCount == v4) {
    return 0;
  }
  double v5 = self->_clsPlayCount;
  return [(NSNumber *)v5 integerValue];
}

- (int64_t)clsViewCount
{
  clsViewCount = self->_clsViewCount;
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (clsViewCount == v4) {
    return 0;
  }
  double v5 = self->_clsViewCount;
  return [(NSNumber *)v5 integerValue];
}

- (double)scoreInContext:(id)a3
{
  [(CLSCurationModel *)self->_curationModel scoreWithAsset:self inContext:a3];
  return result;
}

- (NSDateComponents)cls_localDateComponents
{
  unint64_t v3 = (void *)MEMORY[0x1E4F76C68];
  v4 = [(PGCuratorInvestigationItem *)self cls_universalDate];
  double v5 = [(PGCuratorInvestigationItem *)self cls_localDate];
  double v6 = [v3 dateComponentsWithUTCDate:v4 localDate:v5];

  return (NSDateComponents *)v6;
}

- (unint64_t)clsPeopleCount
{
  unint64_t v3 = [(PGCuratorInvestigationItem *)self clsPersonLocalIdentifiers];
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (v3 == v4) {
    return 0;
  }
  double v5 = [(PGCuratorInvestigationItem *)self clsPersonLocalIdentifiers];
  unint64_t v6 = [v5 count];

  return v6;
}

- (CLLocation)location
{
  unint64_t v3 = [(PGCuratorInvestigationItem *)self clsLocation];
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (v3 == v4)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = [(PGCuratorInvestigationItem *)self clsLocation];
  }
  return (CLLocation *)v5;
}

- (id)date
{
  unint64_t v3 = [(PGCuratorInvestigationItem *)self cls_universalDate];
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (v3 == v4)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = [(PGCuratorInvestigationItem *)self cls_universalDate];
  }
  return v5;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PGCuratorInvestigationItem;
  v4 = [(PGCuratorInvestigationItem *)&v8 description];
  double v5 = [(PGCuratorInvestigationItem *)self cls_universalDate];
  unint64_t v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return (NSString *)v6;
}

- (PGCuratorInvestigationItem)initWithUUID:(id)a3 itemInfo:(id)a4 curationModel:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v239.receiver = self;
  v239.super_class = (Class)PGCuratorInvestigationItem;
  v12 = [(PGCuratorInvestigationItem *)&v239 init];

  if (v12)
  {
    id v235 = v11;
    id v217 = v9;
    objc_storeStrong((id *)&v12->_clsIdentifier, a3);
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    cls_universalDate = v12->_cls_universalDate;
    v12->_cls_universalDate = (NSDate *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
    clsLocation = v12->_clsLocation;
    v12->_clsLocation = (CLLocation *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
    clsPersonLocalIdentifiers = v12->_clsPersonLocalIdentifiers;
    v12->_clsPersonLocalIdentifiers = (NSArray *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
    clsSceneClassifications = v12->_clsSceneClassifications;
    v12->_clsSceneClassifications = (NSSet *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
    clsSceneprint = v12->_clsSceneprint;
    v12->_clsSceneprint = (VNSceneprint *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
    clsUnprefetchedPersonLocalIdentifiers = v12->_clsUnprefetchedPersonLocalIdentifiers;
    v12->_clsUnprefetchedPersonLocalIdentifiers = (NSArray *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
    clsPetLocalIdentifiers = v12->_clsPetLocalIdentifiers;
    v12->_clsPetLocalIdentifiers = (NSArray *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
    clsPersonAndPetLocalIdentifiers = v12->_clsPersonAndPetLocalIdentifiers;
    v12->_clsPersonAndPetLocalIdentifiers = (NSArray *)v27;

    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
    clsViewCount = v12->_clsViewCount;
    v12->_clsViewCount = (NSNumber *)v29;

    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
    clsPlayCount = v12->_clsPlayCount;
    v12->_clsPlayCount = (NSNumber *)v31;

    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
    clsShareCount = v12->_clsShareCount;
    v12->_clsShareCount = (NSNumber *)v33;

    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
    clsIsUtility = v12->_clsIsUtility;
    v12->_clsIsUtility = (NSNumber *)v35;

    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
    clsIsBlurry = v12->_clsIsBlurry;
    v12->_clsIsBlurry = (NSNumber *)v37;

    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
    isVideo = v12->_isVideo;
    v12->_isVideo = (NSNumber *)v39;

    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
    clsIsScreenshotOrScreenRecording = v12->_clsIsScreenshotOrScreenRecording;
    v12->_clsIsScreenshotOrScreenRecording = (NSNumber *)v41;

    uint64_t v43 = [MEMORY[0x1E4F1CA98] null];
    isFavorite = v12->_isFavorite;
    v12->_isFavorite = (NSNumber *)v43;

    uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
    clsContentScore = v12->_clsContentScore;
    v12->_clsContentScore = (NSNumber *)v45;

    uint64_t v47 = [MEMORY[0x1E4F1CA98] null];
    clsIsInterestingVideo = v12->_clsIsInterestingVideo;
    p_clsIsInterestingVideo = (id *)&v12->_clsIsInterestingVideo;
    v12->_clsIsInterestingVideo = (NSNumber *)v47;

    uint64_t v49 = [MEMORY[0x1E4F1CA98] null];
    clsIsInterestingLivePhoto = v12->_clsIsInterestingLivePhoto;
    p_clsIsInterestingLivePhoto = (id *)&v12->_clsIsInterestingLivePhoto;
    v12->_clsIsInterestingLivePhoto = (NSNumber *)v49;

    uint64_t v51 = [MEMORY[0x1E4F1CA98] null];
    clsIsInterestingPanorama = v12->_clsIsInterestingPanorama;
    p_clsIsInterestingPanorama = (id *)&v12->_clsIsInterestingPanorama;
    v12->_clsIsInterestingPanorama = (NSNumber *)v51;

    uint64_t v53 = [MEMORY[0x1E4F1CA98] null];
    clsIsInterestingSDOF = v12->_clsIsInterestingSDOF;
    p_clsIsInterestingSDOF = (id *)&v12->_clsIsInterestingSDOF;
    v12->_clsIsInterestingSDOF = (NSNumber *)v53;

    uint64_t v55 = [MEMORY[0x1E4F1CA98] null];
    clsIsInterestingHDR = v12->_clsIsInterestingHDR;
    p_clsIsInterestingHDR = (id *)&v12->_clsIsInterestingHDR;
    v12->_clsIsInterestingHDR = (NSNumber *)v55;

    uint64_t v57 = [MEMORY[0x1E4F1CA98] null];
    clsHasInterestingAudioClassification = v12->_clsHasInterestingAudioClassification;
    p_clsHasInterestingAudioClassification = (id *)&v12->_clsHasInterestingAudioClassification;
    v12->_clsHasInterestingAudioClassification = (NSNumber *)v57;

    uint64_t v59 = [MEMORY[0x1E4F1CA98] null];
    clsHasCustomPlaybackVariation = v12->_clsHasCustomPlaybackVariation;
    p_clsHasCustomPlaybackVariation = (id *)&v12->_clsHasCustomPlaybackVariation;
    v12->_clsHasCustomPlaybackVariation = (NSNumber *)v59;

    uint64_t v61 = [MEMORY[0x1E4F1CA98] null];
    clsSharpnessScore = v12->_clsSharpnessScore;
    p_clsSharpnessScore = (id *)&v12->_clsSharpnessScore;
    v12->_clsSharpnessScore = (NSNumber *)v61;

    uint64_t v63 = [MEMORY[0x1E4F1CA98] null];
    clsExposureScore = v12->_clsExposureScore;
    p_clsExposureScore = (id *)&v12->_clsExposureScore;
    v12->_clsExposureScore = (NSNumber *)v63;

    uint64_t v65 = [MEMORY[0x1E4F1CA98] null];
    clsAestheticScore = v12->_clsAestheticScore;
    v12->_clsAestheticScore = (NSNumber *)v65;

    uint64_t v67 = [MEMORY[0x1E4F1CA98] null];
    clsIsAestheticallyPrettyGood = v12->_clsIsAestheticallyPrettyGood;
    v12->_clsIsAestheticallyPrettyGood = (NSNumber *)v67;

    uint64_t v69 = [MEMORY[0x1E4F1CA98] null];
    clsFaceScore = v12->_clsFaceScore;
    v12->_clsFaceScore = (NSNumber *)v69;

    uint64_t v71 = [MEMORY[0x1E4F1CA98] null];
    clsIsInhabited = v12->_clsIsInhabited;
    p_clsIsInhabited = (id *)&v12->_clsIsInhabited;
    v12->_clsIsInhabited = (NSNumber *)v71;

    uint64_t v73 = [MEMORY[0x1E4F1CA98] null];
    clsAvoidIfPossibleForKeyItem = v12->_clsAvoidIfPossibleForKeyItem;
    v12->_clsAvoidIfPossibleForKeyItem = (NSNumber *)v73;

    uint64_t v75 = [MEMORY[0x1E4F1CA98] null];
    clsHasPoorResolution = v12->_clsHasPoorResolution;
    v12->_clsHasPoorResolution = (NSNumber *)v75;

    uint64_t v77 = [MEMORY[0x1E4F1CA98] null];
    clsHasInterestingScenes = v12->_clsHasInterestingScenes;
    p_clsHasInterestingScenes = (id *)&v12->_clsHasInterestingScenes;
    v12->_clsHasInterestingScenes = (NSNumber *)v77;

    uint64_t v79 = [MEMORY[0x1E4F1CA98] null];
    clsLikabilityScore = v12->_clsLikabilityScore;
    p_clsLikabilityScore = (id *)&v12->_clsLikabilityScore;
    v12->_clsLikabilityScore = (NSNumber *)v79;

    uint64_t v81 = [MEMORY[0x1E4F1CA98] null];
    clsInteractionScore = v12->_clsInteractionScore;
    p_clsInteractionScore = (id *)&v12->_clsInteractionScore;
    v12->_clsInteractionScore = (NSNumber *)v81;

    uint64_t v83 = [MEMORY[0x1E4F1CA98] null];
    clsHighlightVisibilityScore = v12->_clsHighlightVisibilityScore;
    p_clsHighlightVisibilityScore = (id *)&v12->_clsHighlightVisibilityScore;
    v12->_clsHighlightVisibilityScore = (NSNumber *)v83;

    uint64_t v85 = [MEMORY[0x1E4F1CA98] null];
    clsAutoplaySuggestionScore = v12->_clsAutoplaySuggestionScore;
    p_clsAutoplaySuggestionScore = (id *)&v12->_clsAutoplaySuggestionScore;
    v12->_clsAutoplaySuggestionScore = (NSNumber *)v85;

    uint64_t v87 = [MEMORY[0x1E4F1CA98] null];
    isShinyGem = v12->_isShinyGem;
    p_isShinyGem = (id *)&v12->_isShinyGem;
    v12->_isShinyGem = (NSNumber *)v87;

    uint64_t v89 = [MEMORY[0x1E4F1CA98] null];
    isRegularGem = v12->_isRegularGem;
    v12->_isRegularGem = (NSNumber *)v89;

    uint64_t v91 = [MEMORY[0x1E4F1CA98] null];
    clsDuration = v12->_clsDuration;
    v12->_clsDuration = (NSNumber *)v91;

    uint64_t v93 = [MEMORY[0x1E4F1CA98] null];
    clsIsNonMemorable = v12->_clsIsNonMemorable;
    v12->_clsIsNonMemorable = (NSNumber *)v93;

    uint64_t v95 = [MEMORY[0x1E4F1CA98] null];
    clsIsLoopOrBounce = v12->_clsIsLoopOrBounce;
    v12->_clsIsLoopOrBounce = (NSNumber *)v95;

    uint64_t v97 = [MEMORY[0x1E4F1CA98] null];
    clsIsLongExposure = v12->_clsIsLongExposure;
    v12->_clsIsLongExposure = (NSNumber *)v97;

    uint64_t v99 = [MEMORY[0x1E4F1CA98] null];
    clsGpsHorizontalAccuracy = v12->_clsGpsHorizontalAccuracy;
    v12->_clsGpsHorizontalAccuracy = (NSNumber *)v99;

    uint64_t v101 = [MEMORY[0x1E4F1CA98] null];
    clsSquareCropScore = v12->_clsSquareCropScore;
    v12->_clsSquareCropScore = (NSNumber *)v101;

    uint64_t v103 = [MEMORY[0x1E4F1CA98] null];
    clsIsInSharedLibrary = v12->_clsIsInSharedLibrary;
    v12->_clsIsInSharedLibrary = (NSNumber *)v103;

    uint64_t v105 = [MEMORY[0x1E4F1CA98] null];
    clsIconicScore = v12->_clsIconicScore;
    v12->_clsIconicScore = (NSNumber *)v105;

    v107 = [v10 objectForKeyedSubscript:@"creationDate"];
    v108 = v107;
    if (!v107) {
      v108 = v12->_cls_universalDate;
    }
    objc_storeStrong((id *)&v12->_cls_universalDate, v108);

    v109 = [v10 objectForKeyedSubscript:@"localCreationDate"];
    cls_localDate = v109;
    if (!v109) {
      cls_localDate = v12->_cls_localDate;
    }
    objc_storeStrong((id *)&v12->_cls_localDate, cls_localDate);

    v111 = [v10 objectForKeyedSubscript:@"location"];
    v216 = v111;
    if (v111)
    {
      v112 = v111;
      v113 = [v111 objectForKeyedSubscript:@"latitude"];

      if (v113)
      {
        id v114 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        v115 = [v112 objectForKeyedSubscript:@"latitude"];
        [v115 doubleValue];
        double v117 = v116;
        v118 = [v112 objectForKeyedSubscript:@"longitude"];
        [v118 doubleValue];
        uint64_t v120 = [v114 initWithLatitude:v117 longitude:v119];
        v121 = v12->_clsLocation;
        v12->_clsLocation = (CLLocation *)v120;
      }
      else
      {
        v115 = v12->_clsLocation;
        v12->_clsLocation = 0;
      }
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", @"peopleNames", &v12->_clsIsBlurry);
    v122 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v123 = v122;
    if (!v122) {
      v123 = v12->_clsPersonLocalIdentifiers;
    }
    objc_storeStrong((id *)&v12->_clsPersonLocalIdentifiers, v123);

    v124 = [v10 objectForKeyedSubscript:@"petNames"];
    v125 = v124;
    if (!v124) {
      v125 = v12->_clsPetLocalIdentifiers;
    }
    objc_storeStrong((id *)&v12->_clsPetLocalIdentifiers, v125);

    v126 = v12->_clsPersonLocalIdentifiers;
    v127 = (NSArray *)MEMORY[0x1E4F1CBF0];
    if (!v126) {
      v126 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    v128 = v126;
    v129 = v12->_clsPetLocalIdentifiers;
    if (!v129) {
      v129 = v127;
    }
    v234 = v129;
    uint64_t v130 = -[NSArray arrayByAddingObjectsFromArray:](v128, "arrayByAddingObjectsFromArray:");
    v131 = v12->_clsPersonAndPetLocalIdentifiers;
    v12->_clsPersonAndPetLocalIdentifiers = (NSArray *)v130;

    uint64_t v132 = [v10 objectForKeyedSubscript:@"isUtility"];
    v133 = (void *)v132;
    v134 = (void *)MEMORY[0x1E4F1CC28];
    if (v132) {
      v135 = (void *)v132;
    }
    else {
      v135 = (void *)MEMORY[0x1E4F1CC28];
    }
    objc_storeStrong((id *)&v12->_clsIsUtility, v135);

    uint64_t v136 = [v10 objectForKeyedSubscript:@"isFavorite"];
    v137 = (void *)v136;
    if (v136) {
      v138 = (void *)v136;
    }
    else {
      v138 = v134;
    }
    objc_storeStrong((id *)&v12->_isFavorite, v138);

    uint64_t v139 = [v10 objectForKeyedSubscript:@"isVideo"];
    v140 = (void *)v139;
    if (v139) {
      v141 = (void *)v139;
    }
    else {
      v141 = v134;
    }
    objc_storeStrong((id *)&v12->_isVideo, v141);

    v142 = [v10 objectForKeyedSubscript:@"contentScore"];
    v143 = v142;
    if (!v142) {
      v143 = v12->_clsContentScore;
    }
    objc_storeStrong((id *)&v12->_clsContentScore, v143);

    v144 = [v10 objectForKeyedSubscript:@"aestheticScore"];
    v145 = v144;
    if (!v144) {
      v145 = v12->_clsAestheticScore;
    }
    objc_storeStrong((id *)&v12->_clsAestheticScore, v145);

    v146 = [v10 objectForKeyedSubscript:@"faceScore"];
    v147 = v146;
    if (!v146) {
      v147 = v12->_clsFaceScore;
    }
    p_clsSceneprint = (void **)&v12->_clsSceneprint;
    objc_storeStrong((id *)&v12->_clsFaceScore, v147);

    v149 = [v10 objectForKeyedSubscript:@"sceneprint"];
    v150 = v128;
    if (v149)
    {
      v151 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v152 = objc_opt_class();
      v153 = [v10 objectForKeyedSubscript:@"sceneprint"];
      id v238 = 0;
      v154 = [v151 unarchivedObjectOfClass:v152 fromData:v153 error:&v238];
      id v155 = v238;
      objc_storeStrong((id *)&v12->_clsSceneprint, v154);
    }
    else
    {
      id v155 = 0;
      v153 = *p_clsSceneprint;
      *p_clsSceneprint = 0;
    }
    id v9 = v217;

    v156 = [v10 objectForKeyedSubscript:@"isInterestingVideo"];
    id v157 = v156;
    if (!v156) {
      id v157 = *p_clsIsInterestingVideo;
    }
    objc_storeStrong(p_clsIsInterestingVideo, v157);

    v158 = [v10 objectForKeyedSubscript:@"isInterestingLivePhoto"];
    id v159 = v158;
    if (!v158) {
      id v159 = *p_clsIsInterestingLivePhoto;
    }
    objc_storeStrong(p_clsIsInterestingLivePhoto, v159);

    v160 = [v10 objectForKeyedSubscript:@"isInterestingPanorama"];
    id v161 = v160;
    if (!v160) {
      id v161 = *p_clsIsInterestingPanorama;
    }
    objc_storeStrong(p_clsIsInterestingPanorama, v161);

    v162 = [v10 objectForKeyedSubscript:@"isInterestingSDOF"];
    id v163 = v162;
    if (!v162) {
      id v163 = *p_clsIsInterestingSDOF;
    }
    objc_storeStrong(p_clsIsInterestingSDOF, v163);

    v164 = [v10 objectForKeyedSubscript:@"isInterestingHDR"];
    id v165 = v164;
    if (!v164) {
      id v165 = *p_clsIsInterestingHDR;
    }
    objc_storeStrong(p_clsIsInterestingHDR, v165);

    v166 = [v10 objectForKeyedSubscript:@"hasInterestingAudioClassification"];
    id v167 = v166;
    if (!v166) {
      id v167 = *p_clsHasInterestingAudioClassification;
    }
    objc_storeStrong(p_clsHasInterestingAudioClassification, v167);

    v168 = [v10 objectForKeyedSubscript:@"hasCustomPlaybackVariation"];
    id v169 = v168;
    if (!v168) {
      id v169 = *p_clsHasCustomPlaybackVariation;
    }
    objc_storeStrong(p_clsHasCustomPlaybackVariation, v169);

    v170 = [v10 objectForKeyedSubscript:@"sharpnessScore"];
    id v171 = v170;
    if (!v170) {
      id v171 = *p_clsSharpnessScore;
    }
    objc_storeStrong(p_clsSharpnessScore, v171);

    v172 = [v10 objectForKeyedSubscript:@"exposureScore"];
    id v173 = v172;
    if (!v172) {
      id v173 = *p_clsExposureScore;
    }
    objc_storeStrong(p_clsExposureScore, v173);

    v174 = [v10 objectForKeyedSubscript:@"isBlurry"];
    id v175 = v174;
    if (!v174) {
      id v175 = *v215;
    }
    objc_storeStrong(v215, v175);

    v176 = [v10 objectForKeyedSubscript:@"isInhabited"];
    id v177 = v176;
    if (!v176) {
      id v177 = *p_clsIsInhabited;
    }
    objc_storeStrong(p_clsIsInhabited, v177);

    v178 = [v10 objectForKeyedSubscript:@"hasInterestingScenes"];
    id v179 = v178;
    if (!v178) {
      id v179 = *p_clsHasInterestingScenes;
    }
    objc_storeStrong(p_clsHasInterestingScenes, v179);

    v180 = [v10 objectForKeyedSubscript:@"behavioralScore"];
    id v181 = v180;
    if (!v180) {
      id v181 = *p_clsLikabilityScore;
    }
    objc_storeStrong(p_clsLikabilityScore, v181);

    v182 = [v10 objectForKeyedSubscript:@"interactionScore"];
    id v183 = v182;
    if (!v182) {
      id v183 = *p_clsInteractionScore;
    }
    objc_storeStrong(p_clsInteractionScore, v183);

    v184 = [v10 objectForKeyedSubscript:@"highlightVisibilityScore"];
    id v185 = v184;
    if (!v184) {
      id v185 = *p_clsHighlightVisibilityScore;
    }
    objc_storeStrong(p_clsHighlightVisibilityScore, v185);

    v186 = [v10 objectForKeyedSubscript:@"autoplaySuggestionScore"];
    id v187 = v186;
    if (!v186) {
      id v187 = *p_clsAutoplaySuggestionScore;
    }
    objc_storeStrong(p_clsAutoplaySuggestionScore, v187);

    v188 = [v10 objectForKeyedSubscript:@"isShinyGem"];
    id v189 = v188;
    if (!v188) {
      id v189 = *p_isShinyGem;
    }
    objc_storeStrong(p_isShinyGem, v189);

    v190 = [v10 objectForKeyedSubscript:@"isRegularGem"];
    v191 = v190;
    if (!v190) {
      v191 = v12->_isRegularGem;
    }
    objc_storeStrong((id *)&v12->_isRegularGem, v191);

    v192 = [v10 objectForKeyedSubscript:@"faceInfos"];
    faceInfos = v192;
    if (!v192) {
      faceInfos = v12->_faceInfos;
    }
    objc_storeStrong((id *)&v12->_faceInfos, faceInfos);

    v194 = [v10 objectForKeyedSubscript:@"duration"];
    v195 = v194;
    if (!v194) {
      v195 = v12->_clsDuration;
    }
    objc_storeStrong((id *)&v12->_clsDuration, v195);

    v196 = [v10 objectForKeyedSubscript:@"isNonMemorable"];
    v197 = v196;
    if (!v196) {
      v197 = v12->_clsIsNonMemorable;
    }
    objc_storeStrong((id *)&v12->_clsIsNonMemorable, v197);

    v198 = [v10 objectForKeyedSubscript:@"isLoopOrBounce"];
    v199 = v198;
    if (!v198) {
      v199 = v12->_clsIsLoopOrBounce;
    }
    objc_storeStrong((id *)&v12->_clsIsLoopOrBounce, v199);

    v200 = [v10 objectForKeyedSubscript:@"isLongExposure"];
    v201 = v200;
    if (!v200) {
      v201 = v12->_clsIsLongExposure;
    }
    objc_storeStrong((id *)&v12->_clsIsLongExposure, v201);

    v202 = [v10 objectForKeyedSubscript:@"gpsHorizontalAccuracy"];
    v203 = v202;
    if (!v202) {
      v203 = v12->_clsGpsHorizontalAccuracy;
    }
    objc_storeStrong((id *)&v12->_clsGpsHorizontalAccuracy, v203);

    v204 = [v10 objectForKeyedSubscript:@"squareCropScore"];
    v205 = v204;
    if (!v204) {
      v205 = v12->_clsSquareCropScore;
    }
    objc_storeStrong((id *)&v12->_clsSquareCropScore, v205);

    v206 = [v10 objectForKeyedSubscript:@"isInSharedLibrary"];
    v207 = v206;
    if (!v206) {
      v207 = v12->_clsIsInSharedLibrary;
    }
    objc_storeStrong((id *)&v12->_clsIsInSharedLibrary, v207);

    v208 = [v10 objectForKeyedSubscript:@"iconicScore"];
    v209 = v208;
    if (!v208) {
      v209 = v12->_clsIconicScore;
    }
    objc_storeStrong((id *)&v12->_clsIconicScore, v209);

    v210 = [v10 objectForKeyedSubscript:@"scenes"];
    if (v210)
    {
      id v211 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v236[0] = MEMORY[0x1E4F143A8];
      v236[1] = 3221225472;
      v236[2] = __66__PGCuratorInvestigationItem_initWithUUID_itemInfo_curationModel___block_invoke;
      v236[3] = &unk_1E68E7F98;
      id v212 = v211;
      id v237 = v212;
      [v210 enumerateKeysAndObjectsUsingBlock:v236];
      objc_storeStrong((id *)&v12->_clsSceneClassifications, v211);
    }
    id v11 = v235;
  }
  v213 = v12;

  return v213;
}

void __66__PGCuratorInvestigationItem_initWithUUID_itemInfo_curationModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v5, "rangeOfString:", @"(");
  uint64_t v8 = [v5 rangeOfString:@""]);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = objc_msgSend(v5, "substringWithRange:", v7 + 1, v8 + ~v7);
    id v11 = [MEMORY[0x1E4F28FE8] scannerWithString:v10];
    uint64_t v15 = 0;
    [v11 scanUnsignedLongLong:&v15];
    id v12 = objc_alloc(MEMORY[0x1E4F39280]);
    uint64_t v13 = v15;
    [v6 doubleValue];
    v14 = objc_msgSend(v12, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v13, 0);
    [*(id *)(a1 + 32) addObject:v14];
  }
}

- (PGCuratorInvestigationItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)PGCuratorInvestigationItem;
  v2 = [(PGCuratorInvestigationItem *)&v7 init];
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    clsIdentifier = v2->_clsIdentifier;
    v2->_clsIdentifier = (NSString *)v4;
  }
  return v2;
}

+ (id)itemWithUUID:(id)a3 itemInfo:(id)a4 curationModel:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithUUID:v10 itemInfo:v9 curationModel:v8];

  return v11;
}

@end
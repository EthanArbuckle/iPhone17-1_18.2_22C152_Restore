@interface PGDejunkerDeduperOptions
- (BOOL)allowAdaptiveForSemanticalDeduping;
- (BOOL)doDejunk;
- (BOOL)doFinalPass;
- (BOOL)doIdenticalDeduping;
- (BOOL)doNotDedupeInterestingPortraitsAndLivePictures;
- (BOOL)doNotDedupeVideos;
- (BOOL)doSemanticalDeduping;
- (BOOL)dontSemanticallyDedupePeople;
- (BOOL)dontSemanticallyDedupePersons;
- (BOOL)onlyDedupeContiguousItems;
- (BOOL)returnDedupedJunkIfOnlyJunk;
- (BOOL)semanticalDedupingProtectSmallClusters;
- (BOOL)useAllPersonsForDeduping;
- (BOOL)useFaceQualityForElection;
- (BOOL)useFaceprintsForIdenticalDeduping;
- (BOOL)useOnlyScenesForDeduping;
- (NSSet)identifiersOfEligibleItems;
- (NSSet)identifiersOfRequiredItems;
- (PGDejunkerDeduperOptions)initWithDictionaryRepresentation:(id)a3;
- (double)finalPassDedupingThreshold;
- (double)finalPassMaximumTimeGroupExtension;
- (double)finalPassTimeInterval;
- (double)identicalDedupingFaceprintDistance;
- (double)identicalDedupingMaximumTimeGroupExtension;
- (double)identicalDedupingThreshold;
- (double)identicalDedupingThresholdForBestItems;
- (double)identicalDedupingThresholdForPeople;
- (double)identicalDedupingTimeInterval;
- (double)identicalDedupingTimeIntervalForPeople;
- (double)semanticalDedupingMaximumTimeGroupExtension;
- (double)semanticalDedupingThreshold;
- (double)semanticalDedupingThresholdForPeople;
- (double)semanticalDedupingThresholdForPersons;
- (double)semanticalDedupingTimeInterval;
- (double)semanticalDedupingTimeIntervalForPeople;
- (double)semanticalDedupingTimeIntervalForPersons;
- (id)description;
- (id)dictionaryRepresentationRestrictingToGlobalOptions:(BOOL)a3;
- (id)initForCuratedLibrary;
- (id)initForMemories;
- (unint64_t)duration;
- (unint64_t)maximumNumberOfItemsPerIdenticalCluster;
- (unint64_t)maximumNumberOfItemsPerSemanticalCluster;
- (void)setAllowAdaptiveForSemanticalDeduping:(BOOL)a3;
- (void)setDoDejunk:(BOOL)a3;
- (void)setDoFinalPass:(BOOL)a3;
- (void)setDoIdenticalDeduping:(BOOL)a3;
- (void)setDoNotDedupeInterestingPortraitsAndLivePictures:(BOOL)a3;
- (void)setDoNotDedupeVideos:(BOOL)a3;
- (void)setDoSemanticalDeduping:(BOOL)a3;
- (void)setDontSemanticallyDedupePeople:(BOOL)a3;
- (void)setDontSemanticallyDedupePersons:(BOOL)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setFinalPassDedupingThreshold:(double)a3;
- (void)setFinalPassMaximumTimeGroupExtension:(double)a3;
- (void)setFinalPassTimeInterval:(double)a3;
- (void)setIdenticalDedupingFaceprintDistance:(double)a3;
- (void)setIdenticalDedupingMaximumTimeGroupExtension:(double)a3;
- (void)setIdenticalDedupingThreshold:(double)a3;
- (void)setIdenticalDedupingThresholdForBestItems:(double)a3;
- (void)setIdenticalDedupingThresholdForPeople:(double)a3;
- (void)setIdenticalDedupingTimeInterval:(double)a3;
- (void)setIdenticalDedupingTimeIntervalForPeople:(double)a3;
- (void)setIdentifiersOfEligibleItems:(id)a3;
- (void)setIdentifiersOfRequiredItems:(id)a3;
- (void)setMaximumNumberOfItemsPerIdenticalCluster:(unint64_t)a3;
- (void)setMaximumNumberOfItemsPerSemanticalCluster:(unint64_t)a3;
- (void)setOnlyDedupeContiguousItems:(BOOL)a3;
- (void)setReturnDedupedJunkIfOnlyJunk:(BOOL)a3;
- (void)setSemanticalDedupingMaximumTimeGroupExtension:(double)a3;
- (void)setSemanticalDedupingProtectSmallClusters:(BOOL)a3;
- (void)setSemanticalDedupingThreshold:(double)a3;
- (void)setSemanticalDedupingThresholdForPeople:(double)a3;
- (void)setSemanticalDedupingThresholdForPersons:(double)a3;
- (void)setSemanticalDedupingTimeInterval:(double)a3;
- (void)setSemanticalDedupingTimeIntervalForPeople:(double)a3;
- (void)setSemanticalDedupingTimeIntervalForPersons:(double)a3;
- (void)setUseAllPersonsForDeduping:(BOOL)a3;
- (void)setUseFaceQualityForElection:(BOOL)a3;
- (void)setUseFaceprintsForIdenticalDeduping:(BOOL)a3;
- (void)setUseOnlyScenesForDeduping:(BOOL)a3;
@end

@implementation PGDejunkerDeduperOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfEligibleItems, 0);
  objc_storeStrong((id *)&self->_identifiersOfRequiredItems, 0);
  objc_storeStrong((id *)&self->_baseFlavor, 0);
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setIdentifiersOfEligibleItems:(id)a3
{
}

- (NSSet)identifiersOfEligibleItems
{
  return self->_identifiersOfEligibleItems;
}

- (void)setIdentifiersOfRequiredItems:(id)a3
{
}

- (NSSet)identifiersOfRequiredItems
{
  return self->_identifiersOfRequiredItems;
}

- (void)setFinalPassDedupingThreshold:(double)a3
{
  self->_finalPassDedupingThreshold = a3;
}

- (double)finalPassDedupingThreshold
{
  return self->_finalPassDedupingThreshold;
}

- (void)setFinalPassMaximumTimeGroupExtension:(double)a3
{
  self->_finalPassMaximumTimeGroupExtension = a3;
}

- (double)finalPassMaximumTimeGroupExtension
{
  return self->_finalPassMaximumTimeGroupExtension;
}

- (void)setFinalPassTimeInterval:(double)a3
{
  self->_finalPassTimeInterval = a3;
}

- (double)finalPassTimeInterval
{
  return self->_finalPassTimeInterval;
}

- (void)setDoFinalPass:(BOOL)a3
{
  self->_doFinalPass = a3;
}

- (BOOL)doFinalPass
{
  return self->_doFinalPass;
}

- (void)setReturnDedupedJunkIfOnlyJunk:(BOOL)a3
{
  self->_returnDedupedJunkIfOnlyJunk = a3;
}

- (BOOL)returnDedupedJunkIfOnlyJunk
{
  return self->_returnDedupedJunkIfOnlyJunk;
}

- (void)setDoDejunk:(BOOL)a3
{
  self->_doDejunk = a3;
}

- (BOOL)doDejunk
{
  return self->_doDejunk;
}

- (void)setOnlyDedupeContiguousItems:(BOOL)a3
{
  self->_onlyDedupeContiguousItems = a3;
}

- (BOOL)onlyDedupeContiguousItems
{
  return self->_onlyDedupeContiguousItems;
}

- (void)setDoNotDedupeInterestingPortraitsAndLivePictures:(BOOL)a3
{
  self->_doNotDedupeInterestingPortraitsAndLivePictures = a3;
}

- (BOOL)doNotDedupeInterestingPortraitsAndLivePictures
{
  return self->_doNotDedupeInterestingPortraitsAndLivePictures;
}

- (void)setDoNotDedupeVideos:(BOOL)a3
{
  self->_doNotDedupeVideos = a3;
}

- (BOOL)doNotDedupeVideos
{
  return self->_doNotDedupeVideos;
}

- (void)setUseFaceQualityForElection:(BOOL)a3
{
  self->_useFaceQualityForElection = a3;
}

- (BOOL)useFaceQualityForElection
{
  return self->_useFaceQualityForElection;
}

- (void)setUseAllPersonsForDeduping:(BOOL)a3
{
  self->_useAllPersonsForDeduping = a3;
}

- (BOOL)useAllPersonsForDeduping
{
  return self->_useAllPersonsForDeduping;
}

- (void)setUseOnlyScenesForDeduping:(BOOL)a3
{
  self->_useOnlyScenesForDeduping = a3;
}

- (BOOL)useOnlyScenesForDeduping
{
  return self->_useOnlyScenesForDeduping;
}

- (void)setSemanticalDedupingProtectSmallClusters:(BOOL)a3
{
  self->_semanticalDedupingProtectSmallClusters = a3;
}

- (BOOL)semanticalDedupingProtectSmallClusters
{
  return self->_semanticalDedupingProtectSmallClusters;
}

- (void)setAllowAdaptiveForSemanticalDeduping:(BOOL)a3
{
  self->_allowAdaptiveForSemanticalDeduping = a3;
}

- (BOOL)allowAdaptiveForSemanticalDeduping
{
  return self->_allowAdaptiveForSemanticalDeduping;
}

- (void)setDontSemanticallyDedupePersons:(BOOL)a3
{
  self->_doNotSemanticallyDedupePersons = a3;
}

- (BOOL)dontSemanticallyDedupePersons
{
  return self->_doNotSemanticallyDedupePersons;
}

- (void)setDontSemanticallyDedupePeople:(BOOL)a3
{
  self->_doNotSemanticallyDedupePeople = a3;
}

- (BOOL)dontSemanticallyDedupePeople
{
  return self->_doNotSemanticallyDedupePeople;
}

- (void)setSemanticalDedupingThresholdForPersons:(double)a3
{
  self->_semanticalDedupingThresholdForPersons = a3;
}

- (double)semanticalDedupingThresholdForPersons
{
  return self->_semanticalDedupingThresholdForPersons;
}

- (void)setSemanticalDedupingThresholdForPeople:(double)a3
{
  self->_semanticalDedupingThresholdForPeople = a3;
}

- (double)semanticalDedupingThresholdForPeople
{
  return self->_semanticalDedupingThresholdForPeople;
}

- (void)setSemanticalDedupingThreshold:(double)a3
{
  self->_semanticalDedupingThreshold = a3;
}

- (double)semanticalDedupingThreshold
{
  return self->_semanticalDedupingThreshold;
}

- (void)setMaximumNumberOfItemsPerSemanticalCluster:(unint64_t)a3
{
  self->_maximumNumberOfItemsPerSemanticalCluster = a3;
}

- (unint64_t)maximumNumberOfItemsPerSemanticalCluster
{
  return self->_maximumNumberOfItemsPerSemanticalCluster;
}

- (void)setSemanticalDedupingMaximumTimeGroupExtension:(double)a3
{
  self->_semanticalDedupingMaximumTimeGroupExtension = a3;
}

- (double)semanticalDedupingMaximumTimeGroupExtension
{
  return self->_semanticalDedupingMaximumTimeGroupExtension;
}

- (void)setSemanticalDedupingTimeIntervalForPersons:(double)a3
{
  self->_semanticalDedupingTimeIntervalForPersons = a3;
}

- (double)semanticalDedupingTimeIntervalForPersons
{
  return self->_semanticalDedupingTimeIntervalForPersons;
}

- (void)setSemanticalDedupingTimeIntervalForPeople:(double)a3
{
  self->_semanticalDedupingTimeIntervalForPeople = a3;
}

- (double)semanticalDedupingTimeIntervalForPeople
{
  return self->_semanticalDedupingTimeIntervalForPeople;
}

- (void)setSemanticalDedupingTimeInterval:(double)a3
{
  self->_semanticalDedupingTimeInterval = a3;
}

- (double)semanticalDedupingTimeInterval
{
  return self->_semanticalDedupingTimeInterval;
}

- (void)setDoSemanticalDeduping:(BOOL)a3
{
  self->_doSemanticalDeduping = a3;
}

- (BOOL)doSemanticalDeduping
{
  return self->_doSemanticalDeduping;
}

- (void)setIdenticalDedupingFaceprintDistance:(double)a3
{
  self->_identicalDedupingFaceprintDistance = a3;
}

- (double)identicalDedupingFaceprintDistance
{
  return self->_identicalDedupingFaceprintDistance;
}

- (void)setUseFaceprintsForIdenticalDeduping:(BOOL)a3
{
  self->_useFaceprintsForIdenticalDeduping = a3;
}

- (BOOL)useFaceprintsForIdenticalDeduping
{
  return self->_useFaceprintsForIdenticalDeduping;
}

- (void)setIdenticalDedupingThresholdForBestItems:(double)a3
{
  self->_identicalDedupingThresholdForBestItems = a3;
}

- (double)identicalDedupingThresholdForBestItems
{
  return self->_identicalDedupingThresholdForBestItems;
}

- (void)setIdenticalDedupingThresholdForPeople:(double)a3
{
  self->_identicalDedupingThresholdForPeople = a3;
}

- (double)identicalDedupingThresholdForPeople
{
  return self->_identicalDedupingThresholdForPeople;
}

- (void)setIdenticalDedupingThreshold:(double)a3
{
  self->_identicalDedupingThreshold = a3;
}

- (double)identicalDedupingThreshold
{
  return self->_identicalDedupingThreshold;
}

- (void)setMaximumNumberOfItemsPerIdenticalCluster:(unint64_t)a3
{
  self->_maximumNumberOfItemsPerIdenticalCluster = a3;
}

- (unint64_t)maximumNumberOfItemsPerIdenticalCluster
{
  return self->_maximumNumberOfItemsPerIdenticalCluster;
}

- (void)setIdenticalDedupingMaximumTimeGroupExtension:(double)a3
{
  self->_identicalDedupingMaximumTimeGroupExtension = a3;
}

- (double)identicalDedupingMaximumTimeGroupExtension
{
  return self->_identicalDedupingMaximumTimeGroupExtension;
}

- (void)setIdenticalDedupingTimeIntervalForPeople:(double)a3
{
  self->_identicalDedupingTimeIntervalForPeople = a3;
}

- (double)identicalDedupingTimeIntervalForPeople
{
  return self->_identicalDedupingTimeIntervalForPeople;
}

- (void)setIdenticalDedupingTimeInterval:(double)a3
{
  self->_identicalDedupingTimeInterval = a3;
}

- (double)identicalDedupingTimeInterval
{
  return self->_identicalDedupingTimeInterval;
}

- (void)setDoIdenticalDeduping:(BOOL)a3
{
  self->_doIdenticalDeduping = a3;
}

- (BOOL)doIdenticalDeduping
{
  return self->_doIdenticalDeduping;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = v3;
  if (self->_doIdenticalDeduping) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v3 appendFormat:@"Do identical deduping: %@", v5];
  objc_msgSend(v4, "appendFormat:", @"\tTime interval: %.3f", *(void *)&self->_identicalDedupingTimeInterval);
  objc_msgSend(v4, "appendFormat:", @"\tTime interval for people: %.3f", *(void *)&self->_identicalDedupingTimeIntervalForPeople);
  objc_msgSend(v4, "appendFormat:", @"\tMaximum time group extension: %.3f", *(void *)&self->_identicalDedupingMaximumTimeGroupExtension);
  objc_msgSend(v4, "appendFormat:", @"\tMaximum number of items per cluster: %lu", self->_maximumNumberOfItemsPerIdenticalCluster);
  objc_msgSend(v4, "appendFormat:", @"\tDeduping threshold: %.3f", *(void *)&self->_identicalDedupingThreshold);
  objc_msgSend(v4, "appendFormat:", @"\tDeduping threshold for people: %.3f", *(void *)&self->_identicalDedupingThresholdForPeople);
  objc_msgSend(v4, "appendFormat:", @"\tDeduping threshold for best items: %.3f", *(void *)&self->_identicalDedupingThresholdForBestItems);
  if (self->_useFaceprintsForIdenticalDeduping) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v4 appendFormat:@"\tUse faceprints: %@", v6];
  objc_msgSend(v4, "appendFormat:", @"\tFaceprint distance: %.3f", *(void *)&self->_identicalDedupingFaceprintDistance);
  if (self->_doSemanticalDeduping) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v4 appendFormat:@"Do semantical deduping: %@", v7];
  objc_msgSend(v4, "appendFormat:", @"\tTime interval: %.3f", *(void *)&self->_semanticalDedupingTimeInterval);
  objc_msgSend(v4, "appendFormat:", @"\tTime interval for people: %.3f", *(void *)&self->_semanticalDedupingTimeIntervalForPeople);
  objc_msgSend(v4, "appendFormat:", @"\tTime interval for persons: %.3f", *(void *)&self->_semanticalDedupingTimeIntervalForPersons);
  objc_msgSend(v4, "appendFormat:", @"\tMaximum time group extension: %.3f", *(void *)&self->_semanticalDedupingMaximumTimeGroupExtension);
  objc_msgSend(v4, "appendFormat:", @"\tMaximum number of items per cluster: %lu", self->_maximumNumberOfItemsPerSemanticalCluster);
  objc_msgSend(v4, "appendFormat:", @"\tDeduping threshold: %.3f", *(void *)&self->_semanticalDedupingThreshold);
  objc_msgSend(v4, "appendFormat:", @"\tDeduping threshold for people: %.3f", *(void *)&self->_semanticalDedupingThresholdForPeople);
  objc_msgSend(v4, "appendFormat:", @"\tDeduping threshold for persons: %.3f", *(void *)&self->_semanticalDedupingThresholdForPersons);
  if (self->_doNotSemanticallyDedupePeople) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v4 appendFormat:@"\tDon't dedupe people: %@", v8];
  if (self->_doNotSemanticallyDedupePersons) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v4 appendFormat:@"\tDon't dedupe persons: %@", v9];
  if (self->_allowAdaptiveForSemanticalDeduping) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v4 appendFormat:@"\tAllow adaptive: %@", v10];
  if (self->_semanticalDedupingProtectSmallClusters) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  [v4 appendFormat:@"\tProtect small clusters: %@", v11];
  if (self->_useOnlyScenesForDeduping) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  [v4 appendFormat:@"Use only scenes for deduping: %@", v12];
  if (self->_useAllPersonsForDeduping) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  [v4 appendFormat:@"Use all persons for deduping: %@", v13];
  if (self->_useFaceQualityForElection) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  [v4 appendFormat:@"Use face quality for election: %@", v14];
  if (self->_doNotDedupeVideos) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  [v4 appendFormat:@"Don't dedupe videos: %@", v15];
  if (self->_doNotDedupeInterestingPortraitsAndLivePictures) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  [v4 appendFormat:@"Don't dedupe interesting portraits and live pictures together: %@", v16];
  if (self->_onlyDedupeContiguousItems) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  [v4 appendFormat:@"Only dedupe contiguous items: %@", v17];
  if (self->_doDejunk) {
    v18 = @"YES";
  }
  else {
    v18 = @"NO";
  }
  [v4 appendFormat:@"Do dejunk: %@", v18];
  if (self->_returnDedupedJunkIfOnlyJunk) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  [v4 appendFormat:@"\tReturn deduped junk if only junk: %@", v19];
  if (self->_doFinalPass) {
    v20 = @"YES";
  }
  else {
    v20 = @"NO";
  }
  [v4 appendFormat:@"Do final pass: %@", v20];
  objc_msgSend(v4, "appendFormat:", @"\tTime interval: %.3f", *(void *)&self->_finalPassTimeInterval);
  objc_msgSend(v4, "appendFormat:", @"\tMaximum time group extension: %.3f", *(void *)&self->_finalPassMaximumTimeGroupExtension);
  objc_msgSend(v4, "appendFormat:", @"\tDeduping threshold: %.3f", *(void *)&self->_finalPassDedupingThreshold);
  v21 = [(NSSet *)self->_identifiersOfRequiredItems allObjects];
  v22 = [v21 sortedArrayUsingSelector:sel_compare_];
  v23 = [v22 componentsJoinedByString:@", "];
  [v4 appendFormat:@"\tRequired Item Identifiers: %@", v23];

  v24 = [(NSSet *)self->_identifiersOfEligibleItems allObjects];
  v25 = [v24 sortedArrayUsingSelector:sel_compare_];
  v26 = [v25 componentsJoinedByString:@", "];
  [v4 appendFormat:@"\tEligible Item Identifiers: %@", v26];

  objc_msgSend(v4, "appendFormat:", @"\tDuration: %lu", self->_duration);
  return v4;
}

- (id)dictionaryRepresentationRestrictingToGlobalOptions:(BOOL)a3
{
  v51[37] = *MEMORY[0x1E4F143B8];
  baseFlavor = self->_baseFlavor;
  if (!baseFlavor) {
    baseFlavor = (NSString *)@"CuratedLibrary";
  }
  v51[0] = baseFlavor;
  v50[0] = @"baseFlavor";
  v50[1] = @"doIdenticalDeduping";
  v48 = [NSNumber numberWithBool:self->_doIdenticalDeduping];
  v51[1] = v48;
  v50[2] = @"identicalDedupingTimeInterval";
  v47 = [NSNumber numberWithDouble:self->_identicalDedupingTimeInterval];
  v51[2] = v47;
  v50[3] = @"identicalDedupingTimeIntervalForPeople";
  v46 = [NSNumber numberWithDouble:self->_identicalDedupingTimeIntervalForPeople];
  v51[3] = v46;
  v50[4] = @"identicalDedupingMaximumTimeGroupExtension";
  v45 = [NSNumber numberWithDouble:self->_identicalDedupingMaximumTimeGroupExtension];
  v51[4] = v45;
  v50[5] = @"maximumNumberOfItemsPerIdenticalCluster";
  v44 = [NSNumber numberWithUnsignedInteger:self->_maximumNumberOfItemsPerIdenticalCluster];
  v51[5] = v44;
  v50[6] = @"identicalDedupingThreshold";
  v43 = [NSNumber numberWithDouble:self->_identicalDedupingThreshold];
  v51[6] = v43;
  v50[7] = @"identicalDedupingThresholdForPeople";
  v42 = [NSNumber numberWithDouble:self->_identicalDedupingThresholdForPeople];
  v51[7] = v42;
  v50[8] = @"identicalDedupingThresholdForBestItems";
  v41 = [NSNumber numberWithDouble:self->_identicalDedupingThresholdForBestItems];
  v51[8] = v41;
  v50[9] = @"useFaceprintsForIdenticalDeduping";
  v40 = [NSNumber numberWithBool:self->_useFaceprintsForIdenticalDeduping];
  v51[9] = v40;
  v50[10] = @"identicalDedupingFaceprintDistance";
  v39 = [NSNumber numberWithDouble:self->_identicalDedupingFaceprintDistance];
  v51[10] = v39;
  v50[11] = @"doSemanticalDeduping";
  v38 = [NSNumber numberWithBool:self->_doSemanticalDeduping];
  v51[11] = v38;
  v50[12] = @"semanticalDedupingTimeInterval";
  v37 = [NSNumber numberWithDouble:self->_semanticalDedupingTimeInterval];
  v51[12] = v37;
  v50[13] = @"semanticalDedupingTimeIntervalForPeople";
  v36 = [NSNumber numberWithDouble:self->_semanticalDedupingTimeIntervalForPeople];
  v51[13] = v36;
  v50[14] = @"semanticalDedupingTimeIntervalForPersons";
  v35 = [NSNumber numberWithDouble:self->_semanticalDedupingTimeIntervalForPersons];
  v51[14] = v35;
  v50[15] = @"semanticalDedupingMaximumTimeGroupExtension";
  v34 = [NSNumber numberWithDouble:self->_semanticalDedupingMaximumTimeGroupExtension];
  v51[15] = v34;
  v50[16] = @"maximumNumberOfItemsPerSemanticalCluster";
  v33 = [NSNumber numberWithUnsignedInteger:self->_maximumNumberOfItemsPerSemanticalCluster];
  v51[16] = v33;
  v50[17] = @"semanticalDedupingThreshold";
  v32 = [NSNumber numberWithDouble:self->_semanticalDedupingThreshold];
  v51[17] = v32;
  v50[18] = @"semanticalDedupingThresholdForPeople";
  v31 = [NSNumber numberWithDouble:self->_semanticalDedupingThresholdForPeople];
  v51[18] = v31;
  v50[19] = @"semanticalDedupingThresholdForPersons";
  v30 = [NSNumber numberWithDouble:self->_semanticalDedupingThresholdForPersons];
  v51[19] = v30;
  v50[20] = @"dontSemanticallyDedupePeople";
  v29 = [NSNumber numberWithBool:self->_doNotSemanticallyDedupePeople];
  v51[20] = v29;
  v50[21] = @"dontSemanticallyDedupePersons";
  v28 = [NSNumber numberWithBool:self->_doNotSemanticallyDedupePersons];
  v51[21] = v28;
  v50[22] = @"allowAdaptiveForSemanticalDeduping";
  v27 = [NSNumber numberWithBool:self->_allowAdaptiveForSemanticalDeduping];
  v51[22] = v27;
  v50[23] = @"semanticalDedupingProtectSmallCluster";
  v25 = [NSNumber numberWithBool:self->_semanticalDedupingProtectSmallClusters];
  v51[23] = v25;
  v50[24] = @"useOnlyScenesForDeduping";
  v24 = [NSNumber numberWithBool:self->_useOnlyScenesForDeduping];
  v51[24] = v24;
  v50[25] = @"useAllPersonsForDeduping";
  v23 = [NSNumber numberWithBool:self->_useAllPersonsForDeduping];
  v51[25] = v23;
  v50[26] = @"useFaceQualityForElection";
  v22 = [NSNumber numberWithBool:self->_useFaceQualityForElection];
  v51[26] = v22;
  v50[27] = @"doNotDedupeVideos";
  v21 = [NSNumber numberWithBool:self->_doNotDedupeVideos];
  v51[27] = v21;
  v50[28] = @"doNotDedupeInterestingPortraitsAndLivePictures";
  v5 = [NSNumber numberWithBool:self->_doNotDedupeInterestingPortraitsAndLivePictures];
  v51[28] = v5;
  v50[29] = @"onlyDedupeContiguousItems";
  v6 = [NSNumber numberWithBool:self->_onlyDedupeContiguousItems];
  v51[29] = v6;
  v50[30] = @"doDejunk";
  v7 = [NSNumber numberWithBool:self->_doDejunk];
  v51[30] = v7;
  v50[31] = @"returnDedupedJunkIfOnlyJunk";
  v8 = [NSNumber numberWithBool:self->_returnDedupedJunkIfOnlyJunk];
  v51[31] = v8;
  v50[32] = @"doFinalPass";
  v9 = [NSNumber numberWithBool:self->_doFinalPass];
  v51[32] = v9;
  v50[33] = @"finalPassTimeInterval";
  v10 = [NSNumber numberWithDouble:self->_finalPassTimeInterval];
  v51[33] = v10;
  v50[34] = @"finalPassMaximumTimeGroupExtension";
  v11 = [NSNumber numberWithDouble:self->_finalPassMaximumTimeGroupExtension];
  v51[34] = v11;
  v50[35] = @"finalPassDedupingThreshold";
  v12 = [NSNumber numberWithDouble:self->_finalPassDedupingThreshold];
  v51[35] = v12;
  v50[36] = @"duration";
  v13 = [NSNumber numberWithUnsignedInteger:self->_duration];
  v51[36] = v13;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:37];

  if (a3)
  {
    v14 = v26;
  }
  else
  {
    v15 = (void *)[v26 mutableCopy];
    v16 = [(NSSet *)self->_identifiersOfRequiredItems allObjects];
    v17 = [v16 sortedArrayUsingSelector:sel_compare_];
    [v15 setObject:v17 forKeyedSubscript:@"identifiersOfRequiredItems"];

    v18 = [(NSSet *)self->_identifiersOfEligibleItems allObjects];
    v19 = [v18 sortedArrayUsingSelector:sel_compare_];
    [v15 setObject:v19 forKeyedSubscript:@"identifiersOfEligibleItems"];

    v14 = v15;
  }
  return v14;
}

- (PGDejunkerDeduperOptions)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"baseFlavor"];
  if ([v5 isEqualToString:@"Memories"]) {
    id v6 = [(PGDejunkerDeduperOptions *)self initForMemories];
  }
  else {
    id v6 = [(PGDejunkerDeduperOptions *)self initForCuratedLibrary];
  }
  v7 = (uint64_t *)v6;

  if (v7)
  {
    v8 = [v4 objectForKeyedSubscript:@"doIdenticalDeduping"];

    if (v8)
    {
      v9 = [v4 objectForKeyedSubscript:@"doIdenticalDeduping"];
      *((unsigned char *)v7 + 16) = [v9 BOOLValue];
    }
    v10 = [v4 objectForKeyedSubscript:@"identicalDedupingTimeInterval"];

    if (v10)
    {
      v11 = [v4 objectForKeyedSubscript:@"identicalDedupingTimeInterval"];
      [v11 doubleValue];
      if (v12 > 0.0)
      {
        v13 = [v4 objectForKeyedSubscript:@"identicalDedupingTimeInterval"];
        [v13 doubleValue];
        v7[4] = v14;
      }
    }
    v15 = [v4 objectForKeyedSubscript:@"identicalDedupingTimeIntervalForPeople"];

    if (v15)
    {
      v16 = [v4 objectForKeyedSubscript:@"identicalDedupingTimeIntervalForPeople"];
      [v16 doubleValue];
      if (v17 > 0.0)
      {
        v18 = [v4 objectForKeyedSubscript:@"identicalDedupingTimeIntervalForPeople"];
        [v18 doubleValue];
        v7[5] = v19;
      }
    }
    v20 = [v4 objectForKeyedSubscript:@"identicalDedupingMaximumTimeGroupExtension"];

    if (v20)
    {
      v21 = [v4 objectForKeyedSubscript:@"identicalDedupingMaximumTimeGroupExtension"];
      [v21 doubleValue];
      if (v22 > 0.0)
      {
        v23 = [v4 objectForKeyedSubscript:@"identicalDedupingMaximumTimeGroupExtension"];
        [v23 doubleValue];
        v7[6] = v24;
      }
    }
    v25 = [v4 objectForKeyedSubscript:@"maximumNumberOfItemsPerIdenticalCluster"];

    if (v25)
    {
      v26 = [v4 objectForKeyedSubscript:@"maximumNumberOfItemsPerIdenticalCluster"];
      uint64_t v27 = [v26 unsignedIntegerValue];
      if (!v27) {
        uint64_t v27 = v7[7];
      }
      v7[7] = v27;
    }
    v28 = [v4 objectForKeyedSubscript:@"identicalDedupingThreshold"];

    if (v28)
    {
      v29 = [v4 objectForKeyedSubscript:@"identicalDedupingThreshold"];
      [v29 doubleValue];
      if (v30 > 0.0)
      {
        v31 = [v4 objectForKeyedSubscript:@"identicalDedupingThreshold"];
        [v31 doubleValue];
        v7[8] = v32;
      }
    }
    v33 = [v4 objectForKeyedSubscript:@"identicalDedupingThresholdForPeople"];

    if (v33)
    {
      v34 = [v4 objectForKeyedSubscript:@"identicalDedupingThresholdForPeople"];
      [v34 doubleValue];
      if (v35 > 0.0)
      {
        v36 = [v4 objectForKeyedSubscript:@"identicalDedupingThresholdForPeople"];
        [v36 doubleValue];
        v7[9] = v37;
      }
    }
    v38 = [v4 objectForKeyedSubscript:@"identicalDedupingThresholdForBestItems"];

    if (v38)
    {
      v39 = [v4 objectForKeyedSubscript:@"identicalDedupingThresholdForBestItems"];
      [v39 doubleValue];
      if (v40 > 0.0)
      {
        v41 = [v4 objectForKeyedSubscript:@"identicalDedupingThresholdForBestItems"];
        [v41 doubleValue];
        v7[10] = v42;
      }
    }
    v43 = [v4 objectForKeyedSubscript:@"useFaceprintsForIdenticalDeduping"];

    if (v43)
    {
      v44 = [v4 objectForKeyedSubscript:@"useFaceprintsForIdenticalDeduping"];
      *((unsigned char *)v7 + 17) = [v44 BOOLValue];
    }
    v45 = [v4 objectForKeyedSubscript:@"identicalDedupingFaceprintDistance"];

    if (v45)
    {
      v46 = [v4 objectForKeyedSubscript:@"identicalDedupingFaceprintDistance"];
      [v46 doubleValue];
      if (v47 > 0.0)
      {
        v48 = [v4 objectForKeyedSubscript:@"identicalDedupingFaceprintDistance"];
        [v48 doubleValue];
        v7[11] = v49;
      }
    }
    v50 = [v4 objectForKeyedSubscript:@"doSemanticalDeduping"];

    if (v50)
    {
      v51 = [v4 objectForKeyedSubscript:@"doSemanticalDeduping"];
      *((unsigned char *)v7 + 18) = [v51 BOOLValue];
    }
    v52 = [v4 objectForKeyedSubscript:@"semanticalDedupingTimeInterval"];

    if (v52)
    {
      v53 = [v4 objectForKeyedSubscript:@"semanticalDedupingTimeInterval"];
      [v53 doubleValue];
      if (v54 > 0.0)
      {
        v55 = [v4 objectForKeyedSubscript:@"semanticalDedupingTimeInterval"];
        [v55 doubleValue];
        v7[12] = v56;
      }
    }
    v57 = [v4 objectForKeyedSubscript:@"semanticalDedupingTimeIntervalForPeople"];

    if (v57)
    {
      v58 = [v4 objectForKeyedSubscript:@"semanticalDedupingTimeIntervalForPeople"];
      [v58 doubleValue];
      if (v59 > 0.0)
      {
        v60 = [v4 objectForKeyedSubscript:@"semanticalDedupingTimeIntervalForPeople"];
        [v60 doubleValue];
        v7[13] = v61;
      }
    }
    v62 = [v4 objectForKeyedSubscript:@"semanticalDedupingTimeIntervalForPersons"];

    if (v62)
    {
      v63 = [v4 objectForKeyedSubscript:@"semanticalDedupingTimeIntervalForPersons"];
      [v63 doubleValue];
      if (v64 > 0.0)
      {
        v65 = [v4 objectForKeyedSubscript:@"semanticalDedupingTimeIntervalForPersons"];
        [v65 doubleValue];
        v7[14] = v66;
      }
    }
    v67 = [v4 objectForKeyedSubscript:@"semanticalDedupingMaximumTimeGroupExtension"];

    if (v67)
    {
      v68 = [v4 objectForKeyedSubscript:@"semanticalDedupingMaximumTimeGroupExtension"];
      [v68 doubleValue];
      if (v69 > 0.0)
      {
        v70 = [v4 objectForKeyedSubscript:@"semanticalDedupingMaximumTimeGroupExtension"];
        [v70 doubleValue];
        v7[15] = v71;
      }
    }
    v72 = [v4 objectForKeyedSubscript:@"maximumNumberOfItemsPerSemanticalCluster"];

    if (v72)
    {
      v73 = [v4 objectForKeyedSubscript:@"maximumNumberOfItemsPerSemanticalCluster"];
      uint64_t v74 = [v73 unsignedIntegerValue];
      if (!v74) {
        uint64_t v74 = v7[16];
      }
      v7[16] = v74;
    }
    v75 = [v4 objectForKeyedSubscript:@"semanticalDedupingThreshold"];

    if (v75)
    {
      v76 = [v4 objectForKeyedSubscript:@"semanticalDedupingThreshold"];
      [v76 doubleValue];
      if (v77 > 0.0)
      {
        v78 = [v4 objectForKeyedSubscript:@"semanticalDedupingThreshold"];
        [v78 doubleValue];
        v7[17] = v79;
      }
    }
    v80 = [v4 objectForKeyedSubscript:@"semanticalDedupingThresholdForPeople"];

    if (v80)
    {
      v81 = [v4 objectForKeyedSubscript:@"semanticalDedupingThresholdForPeople"];
      [v81 doubleValue];
      if (v82 > 0.0)
      {
        v83 = [v4 objectForKeyedSubscript:@"semanticalDedupingThresholdForPeople"];
        [v83 doubleValue];
        v7[18] = v84;
      }
    }
    v85 = [v4 objectForKeyedSubscript:@"semanticalDedupingThresholdForPersons"];

    if (v85)
    {
      v86 = [v4 objectForKeyedSubscript:@"semanticalDedupingThresholdForPersons"];
      [v86 doubleValue];
      if (v87 > 0.0)
      {
        v88 = [v4 objectForKeyedSubscript:@"semanticalDedupingThresholdForPersons"];
        [v88 doubleValue];
        v7[19] = v89;
      }
    }
    v90 = [v4 objectForKeyedSubscript:@"dontSemanticallyDedupePeople"];

    if (v90)
    {
      v91 = [v4 objectForKeyedSubscript:@"dontSemanticallyDedupePeople"];
      *((unsigned char *)v7 + 19) = [v91 BOOLValue];
    }
    v92 = [v4 objectForKeyedSubscript:@"dontSemanticallyDedupePersons"];

    if (v92)
    {
      v93 = [v4 objectForKeyedSubscript:@"dontSemanticallyDedupePersons"];
      *((unsigned char *)v7 + 20) = [v93 BOOLValue];
    }
    v94 = [v4 objectForKeyedSubscript:@"allowAdaptiveForSemanticalDeduping"];

    if (v94)
    {
      v95 = [v4 objectForKeyedSubscript:@"allowAdaptiveForSemanticalDeduping"];
      *((unsigned char *)v7 + 21) = [v95 BOOLValue];
    }
    v96 = [v4 objectForKeyedSubscript:@"semanticalDedupingProtectSmallCluster"];

    if (v96)
    {
      v97 = [v4 objectForKeyedSubscript:@"semanticalDedupingProtectSmallCluster"];
      *((unsigned char *)v7 + 22) = [v97 BOOLValue];
    }
    v98 = [v4 objectForKeyedSubscript:@"useOnlyScenesForDeduping"];

    if (v98)
    {
      v99 = [v4 objectForKeyedSubscript:@"useOnlyScenesForDeduping"];
      *((unsigned char *)v7 + 23) = [v99 BOOLValue];
    }
    v100 = [v4 objectForKeyedSubscript:@"useAllPersonsForDeduping"];

    if (v100)
    {
      v101 = [v4 objectForKeyedSubscript:@"useAllPersonsForDeduping"];
      *((unsigned char *)v7 + 24) = [v101 BOOLValue];
    }
    v102 = [v4 objectForKeyedSubscript:@"useFaceQualityForElection"];

    if (v102)
    {
      v103 = [v4 objectForKeyedSubscript:@"useFaceQualityForElection"];
      *((unsigned char *)v7 + 25) = [v103 BOOLValue];
    }
    v104 = [v4 objectForKeyedSubscript:@"doNotDedupeVideos"];

    if (v104)
    {
      v105 = [v4 objectForKeyedSubscript:@"doNotDedupeVideos"];
      *((unsigned char *)v7 + 26) = [v105 BOOLValue];
    }
    v106 = [v4 objectForKeyedSubscript:@"doNotDedupeInterestingPortraitsAndLivePictures"];

    if (v106)
    {
      v107 = [v4 objectForKeyedSubscript:@"doNotDedupeInterestingPortraitsAndLivePictures"];
      *((unsigned char *)v7 + 27) = [v107 BOOLValue];
    }
    v108 = [v4 objectForKeyedSubscript:@"onlyDedupeContiguousItems"];

    if (v108)
    {
      v109 = [v4 objectForKeyedSubscript:@"onlyDedupeContiguousItems"];
      *((unsigned char *)v7 + 28) = [v109 BOOLValue];
    }
    v110 = [v4 objectForKeyedSubscript:@"doDejunk"];

    if (v110)
    {
      v111 = [v4 objectForKeyedSubscript:@"doDejunk"];
      *((unsigned char *)v7 + 29) = [v111 BOOLValue];
    }
    v112 = [v4 objectForKeyedSubscript:@"returnDedupedJunkIfOnlyJunk"];

    if (v112)
    {
      v113 = [v4 objectForKeyedSubscript:@"returnDedupedJunkIfOnlyJunk"];
      *((unsigned char *)v7 + 30) = [v113 BOOLValue];
    }
    v114 = [v4 objectForKeyedSubscript:@"doFinalPass"];

    if (v114)
    {
      v115 = [v4 objectForKeyedSubscript:@"doFinalPass"];
      *((unsigned char *)v7 + 31) = [v115 BOOLValue];
    }
    v116 = [v4 objectForKeyedSubscript:@"finalPassTimeInterval"];

    if (v116)
    {
      v117 = [v4 objectForKeyedSubscript:@"finalPassTimeInterval"];
      [v117 doubleValue];
      if (v118 > 0.0)
      {
        v119 = [v4 objectForKeyedSubscript:@"finalPassTimeInterval"];
        [v119 doubleValue];
        v7[20] = v120;
      }
    }
    v121 = [v4 objectForKeyedSubscript:@"finalPassMaximumTimeGroupExtension"];

    if (v121)
    {
      v122 = [v4 objectForKeyedSubscript:@"finalPassMaximumTimeGroupExtension"];
      [v122 doubleValue];
      if (v123 > 0.0)
      {
        v124 = [v4 objectForKeyedSubscript:@"finalPassMaximumTimeGroupExtension"];
        [v124 doubleValue];
        v7[21] = v125;
      }
    }
    v126 = [v4 objectForKeyedSubscript:@"finalPassDedupingThreshold"];

    if (v126)
    {
      v127 = [v4 objectForKeyedSubscript:@"finalPassDedupingThreshold"];
      [v127 doubleValue];
      if (v128 > 0.0)
      {
        v129 = [v4 objectForKeyedSubscript:@"finalPassDedupingThreshold"];
        [v129 doubleValue];
        v7[22] = v130;
      }
    }
    v131 = [v4 objectForKeyedSubscript:@"identifiersOfRequiredItems"];

    if (v131)
    {
      v132 = (void *)MEMORY[0x1E4F1CAD0];
      v133 = [v4 objectForKeyedSubscript:@"identifiersOfRequiredItems"];
      uint64_t v134 = [v132 setWithArray:v133];
      v135 = (void *)v7[23];
      v7[23] = v134;
    }
    v136 = [v4 objectForKeyedSubscript:@"identifiersOfEligibleItems"];

    if (v136)
    {
      v137 = (void *)MEMORY[0x1E4F1CAD0];
      v138 = [v4 objectForKeyedSubscript:@"identifiersOfEligibleItems"];
      uint64_t v139 = [v137 setWithArray:v138];
      v140 = (void *)v7[24];
      v7[24] = v139;
    }
    v141 = [v4 objectForKeyedSubscript:@"duration"];

    if (v141)
    {
      v142 = [v4 objectForKeyedSubscript:@"duration"];
      v7[25] = [v142 unsignedIntegerValue];
    }
  }
  v143 = v7;

  return v143;
}

- (id)initForMemories
{
  v14.receiver = self;
  v14.super_class = (Class)PGDejunkerDeduperOptions;
  v2 = [(PGDejunkerDeduperOptions *)&v14 init];
  id v3 = v2;
  if (v2)
  {
    baseFlavor = v2->_baseFlavor;
    v2->_baseFlavor = (NSString *)@"Memories";

    *(_WORD *)&v3->_doIdenticalDeduping = 1;
    *(_OWORD *)&v3->_identicalDedupingTimeInterval = xmmword_1D1F4F290;
    v3->_identicalDedupingMaximumTimeGroupExtension = 5.0;
    v3->_maximumNumberOfItemsPerIdenticalCluster = 0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v3->_identicalDedupingThreshold = _Q0;
    *(_OWORD *)&v3->_identicalDedupingThresholdForBestItems = _Q0;
    v3->_doSemanticalDeduping = 1;
    *(_OWORD *)&v3->_semanticalDedupingTimeInterval = xmmword_1D1F4F2A0;
    *(_OWORD *)&v3->_semanticalDedupingTimeIntervalForPersons = xmmword_1D1F4F2B0;
    v3->_maximumNumberOfItemsPerSemanticalCluster = 0;
    *(_OWORD *)&v3->_semanticalDedupingThreshold = _Q0;
    *(_DWORD *)&v3->_doNotSemanticallyDedupePeople = 0;
    *(_WORD *)&v3->_useOnlyScenesForDeduping = 0;
    *(_DWORD *)&v3->_useFaceQualityForElection = 65537;
    *(_WORD *)&v3->_doDejunk = 1;
    v3->_doFinalPass = 0;
    *(_OWORD *)&v3->_semanticalDedupingThresholdForPersons = xmmword_1D1F4F2C0;
    *(_OWORD *)&v3->_finalPassMaximumTimeGroupExtension = xmmword_1D1F4F2D0;
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
    identifiersOfRequiredItems = v3->_identifiersOfRequiredItems;
    v3->_identifiersOfRequiredItems = (NSSet *)v10;

    identifiersOfEligibleItems = v3->_identifiersOfEligibleItems;
    v3->_identifiersOfEligibleItems = 0;

    v3->_duration = 16;
  }
  return v3;
}

- (id)initForCuratedLibrary
{
  v18.receiver = self;
  v18.super_class = (Class)PGDejunkerDeduperOptions;
  v2 = [(PGDejunkerDeduperOptions *)&v18 init];
  id v3 = v2;
  if (v2)
  {
    baseFlavor = v2->_baseFlavor;
    v2->_baseFlavor = (NSString *)@"CuratedLibrary";

    *(_WORD *)&v3->_doIdenticalDeduping = 257;
    *(_OWORD *)&v3->_identicalDedupingTimeInterval = xmmword_1D1F4F2E0;
    v3->_identicalDedupingMaximumTimeGroupExtension = 2.0;
    v3->_maximumNumberOfItemsPerIdenticalCluster = 0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v3->_identicalDedupingThreshold = _Q0;
    *(_OWORD *)&v3->_identicalDedupingThresholdForBestItems = _Q0;
    long long v17 = _Q0;
    uint64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v11 = [v10 objectForKey:@"PGDeduperIdenticalDedupingFaceprintDistance"];

    if (v11)
    {
      [v11 doubleValue];
      v3->_identicalDedupingFaceprintDistance = v12;
    }
    *(_OWORD *)&v3->_semanticalDedupingTimeInterval = xmmword_1D1F4F2F0;
    *(_OWORD *)&v3->_semanticalDedupingTimeIntervalForPersons = xmmword_1D1F4F300;
    v3->_maximumNumberOfItemsPerSemanticalCluster = 0;
    *(_OWORD *)&v3->_semanticalDedupingThreshold = v17;
    *(_DWORD *)&v3->_doSemanticalDeduping = 1;
    *(_WORD *)&v3->_semanticalDedupingProtectSmallClusters = 1;
    *(_DWORD *)&v3->_useAllPersonsForDeduping = 16843009;
    *(_DWORD *)&v3->_onlyDedupeContiguousItems = 256;
    *(_OWORD *)&v3->_semanticalDedupingThresholdForPersons = xmmword_1D1F4F2C0;
    *(_OWORD *)&v3->_finalPassMaximumTimeGroupExtension = xmmword_1D1F4F2D0;
    uint64_t v13 = [MEMORY[0x1E4F1CAD0] set];
    identifiersOfRequiredItems = v3->_identifiersOfRequiredItems;
    v3->_identifiersOfRequiredItems = (NSSet *)v13;

    identifiersOfEligibleItems = v3->_identifiersOfEligibleItems;
    v3->_identifiersOfEligibleItems = 0;

    v3->_duration = 16;
  }
  return v3;
}

@end
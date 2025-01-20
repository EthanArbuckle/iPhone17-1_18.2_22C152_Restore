@interface RCQueryManager
+ (NSArray)defaultFetchedProperties;
+ (NSArray)defaultSortDescriptors;
+ (id)_defaultFolderFetchRequest;
+ (id)_defaultFolderFetchRequest:(id)a3;
+ (id)_defaultRecordingsFetchRequest;
+ (id)_defaultRecordingsFetchRequest:(id)a3;
+ (id)_foldersWithPredicateFormat:(id)a3;
+ (id)_recordingsWithPredicateFormat:(id)a3;
+ (id)allCustomLabelsFetchRequest;
+ (id)allDeletedRecordingsFetchRequest;
+ (id)allFoldersForSortingFetchRequest;
+ (id)cacheDeletedOnWatchPredicate;
+ (id)customLabelSearchPredicateWithString:(id)a3;
+ (id)defaultResidentRecordingsFetchedProperties;
+ (id)deletedRecordingsFetchRequest;
+ (id)deletedRecordingsPredicate;
+ (id)encryptedFieldsMigrationsFetchRequest;
+ (id)evictionDateBeforeFetchRequest:(id)a3;
+ (id)favoritePredicate;
+ (id)foldersWithNameFetchRequest:(id)a3 searchOption:(int)a4;
+ (id)foldersWithUUIDFetchRequest:(id)a3;
+ (id)foldersWithhRankFetchRequest:(int64_t)a3;
+ (id)musicMemoPredicate;
+ (id)playablePredicate;
+ (id)playableRecordingsFetchRequestWithSubPredicate:(id)a3;
+ (id)recordingWithNameFetchRequest:(id)a3 searchOption:(int)a4;
+ (id)recordingsForFileNameFetchRequest:(id)a3;
+ (id)recordingsInFolderFetchRequest:(id)a3;
+ (id)recordingsInFolderPredicate:(id)a3;
+ (id)recordingsNeedingAssetExportFetchRequest;
+ (id)recordingsWithNilAudioFuturesFetchRequest;
+ (id)recordingsWithNilEncryptedTitleOrCustomLabelFetchRequest;
+ (id)recordingsWithTitleFetchRequest:(id)a3;
+ (id)recordingsWithUniqueIDFetchRequest:(id)a3;
+ (id)recordingsWithUniqueIDsFetchRequest:(id)a3;
+ (id)userDefinedFoldersFetchRequest;
+ (id)visibleRecordingsFetchRequest;
+ (id)watchOSPredicate;
@end

@implementation RCQueryManager

+ (id)deletedRecordingsFetchRequest
{
  v3 = [a1 _defaultRecordingsFetchRequest];
  v4 = [a1 playablePredicate];
  v5 = [a1 deletedRecordingsPredicate];
  v6 = objc_msgSend(v4, "rc_and:", v5);
  [v3 setPredicate:v6];

  v7 = [a1 defaultResidentRecordingsFetchedProperties];
  [v3 setPropertiesToFetch:v7];

  v8 = [a1 defaultSortDescriptors];
  [v3 setSortDescriptors:v8];

  [v3 setFetchBatchSize:100];
  return v3;
}

+ (id)_defaultRecordingsFetchRequest
{
  v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CloudRecording"];
  v4 = [a1 defaultFetchedProperties];
  [v3 setPropertiesToFetch:v4];

  return v3;
}

+ (NSArray)defaultFetchedProperties
{
  if (defaultFetchedProperties_onceToken != -1) {
    dispatch_once(&defaultFetchedProperties_onceToken, &__block_literal_global_36);
  }
  v2 = (void *)defaultFetchedProperties_properties;
  return (NSArray *)v2;
}

+ (id)defaultResidentRecordingsFetchedProperties
{
  if (defaultResidentRecordingsFetchedProperties_onceToken != -1) {
    dispatch_once(&defaultResidentRecordingsFetchedProperties_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)defaultResidentRecordingsFetchedProperties_properties;
  return v2;
}

+ (NSArray)defaultSortDescriptors
{
  if (defaultSortDescriptors_onceToken != -1) {
    dispatch_once(&defaultSortDescriptors_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)defaultSortDescriptors_sortDescriptors;
  return (NSArray *)v2;
}

+ (id)playableRecordingsFetchRequestWithSubPredicate:(id)a3
{
  id v4 = a3;
  v5 = [a1 _defaultRecordingsFetchRequest];
  v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"evictionDate");
  v7 = [a1 playablePredicate];
  v8 = objc_msgSend(v7, "rc_and:", v6);
  [v5 setPredicate:v8];

  v9 = [a1 defaultResidentRecordingsFetchedProperties];
  [v5 setPropertiesToFetch:v9];

  v10 = [a1 defaultSortDescriptors];
  [v5 setSortDescriptors:v10];

  [v5 setFetchBatchSize:100];
  if (v4)
  {
    v11 = [v5 predicate];
    v12 = objc_msgSend(v11, "rc_and:", v4);
    [v5 setPredicate:v12];
  }
  return v5;
}

+ (id)playablePredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"flags != nil && bitwiseAnd:with:(flags, %@) != 0", &unk_1F1F0D8F0];
}

+ (id)deletedRecordingsPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"evictionDate");
}

void __40__RCQueryManager_defaultSortDescriptors__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:0];
  v4[0] = v0;
  v1 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"customLabelForSorting" ascending:1];
  v4[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  v3 = (void *)defaultSortDescriptors_sortDescriptors;
  defaultSortDescriptors_sortDescriptors = v2;
}

+ (id)evictionDateBeforeFetchRequest:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 _defaultRecordingsFetchRequest];
  v9[0] = @"evictionDate";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v5 setPropertiesToFetch:v6];

  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != nil AND %K <= %@", @"evictionDate", @"evictionDate", v4];

  [v5 setPredicate:v7];
  return v5;
}

void __60__RCQueryManager_defaultResidentRecordingsFetchedProperties__block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"customLabelForSorting";
  v2[1] = @"date";
  v2[2] = @"localDuration";
  v2[3] = @"sharedFlags";
  v2[4] = @"uniqueID";
  v2[5] = @"evictionDate";
  v2[6] = @"flags";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  v1 = (void *)defaultResidentRecordingsFetchedProperties_properties;
  defaultResidentRecordingsFetchedProperties_properties = v0;
}

void __42__RCQueryManager_defaultFetchedProperties__block_invoke()
{
  void v2[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"customLabelForSorting";
  v2[1] = @"date";
  v2[2] = @"localDuration";
  v2[3] = @"sharedFlags";
  v2[4] = @"uniqueID";
  v2[5] = @"evictionDate";
  v2[6] = @"flags";
  v2[7] = @"path";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:8];
  v1 = (void *)defaultFetchedProperties_properties;
  defaultFetchedProperties_properties = v0;
}

+ (id)recordingsForFileNameFetchRequest:(id)a3
{
  return (id)[a1 _recordingsWithPredicateFormat:@"%K == %@", @"path", a3];
}

+ (id)recordingsWithUniqueIDFetchRequest:(id)a3
{
  return (id)[a1 _recordingsWithPredicateFormat:@"%K == %@", @"uniqueID", a3];
}

+ (id)recordingsWithUniqueIDsFetchRequest:(id)a3
{
  return (id)[a1 _recordingsWithPredicateFormat:@"%K IN %@", @"uniqueID", a3];
}

+ (id)allDeletedRecordingsFetchRequest
{
  v3 = [a1 deletedRecordingsPredicate];
  id v4 = [a1 _defaultRecordingsFetchRequest:v3];

  return v4;
}

+ (id)allCustomLabelsFetchRequest
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 _defaultRecordingsFetchRequest];
  v5[0] = @"customLabelForSorting";
  v5[1] = @"evictionDate";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  [v2 setPropertiesToFetch:v3];

  return v2;
}

+ (id)recordingWithNameFetchRequest:(id)a3 searchOption:(int)a4
{
  v6 = (void *)MEMORY[0x1E4F28C68];
  id v7 = a3;
  v8 = [v6 expressionForKeyPath:@"customLabelForSorting"];
  v9 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v7];

  v10 = (void *)MEMORY[0x1E4F28B98];
  uint64_t v11 = _predicateOperatorTypeForSearchOption(a4);
  v12 = [v10 predicateWithLeftExpression:v8 rightExpression:v9 modifier:0 type:v11 options:_predicateOptionsForSearchOption(a4)];
  v13 = [a1 _defaultRecordingsFetchRequest:v12];

  return v13;
}

+ (id)recordingsInFolderFetchRequest:(id)a3
{
  return (id)[a1 _recordingsWithPredicateFormat:@"folder.uuid == %@", a3];
}

+ (id)visibleRecordingsFetchRequest
{
  v3 = [a1 playablePredicate];
  id v4 = [a1 _defaultRecordingsFetchRequest:v3];

  v5 = [a1 defaultSortDescriptors];
  [v4 setSortDescriptors:v5];

  return v4;
}

+ (id)recordingsNeedingAssetExportFetchRequest
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != nil && bitwiseAnd:with:(%K, %@) == %@", @"flags", @"flags", &unk_1F1F0D8C0, &unk_1F1F0D8C0];
  id v4 = [a1 _defaultRecordingsFetchRequest:v3];

  v7[0] = @"flags";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v4 setPropertiesToFetch:v5];

  return v4;
}

+ (id)recordingsWithNilEncryptedTitleOrCustomLabelFetchRequest
{
  return (id)objc_msgSend(a1, "_recordingsWithPredicateFormat:", @"%K == nil || %K == nil", @"encryptedTitle", @"customLabel");
}

+ (id)recordingsWithNilAudioFuturesFetchRequest
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(a1, "_recordingsWithPredicateFormat:", @"%K == nil && %K == nil", @"audioFuture", @"mtAudioFuture");
  v5[0] = @"audioFuture";
  v5[1] = @"mtAudioFuture";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  [v2 setPropertiesToFetch:v3];

  return v2;
}

+ (id)encryptedFieldsMigrationsFetchRequest
{
  uint64_t v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Migration"];
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != nil && bitwiseAnd:with:(%K, %@) == %@", @"flags", @"flags", &unk_1F1F0D8D8, &unk_1F1F0D8D8];
  [v2 setPredicate:v3];

  return v2;
}

+ (id)recordingsWithTitleFetchRequest:(id)a3
{
  v3 = @"nil";
  if (a3) {
    v3 = (__CFString *)a3;
  }
  return (id)[a1 _recordingsWithPredicateFormat:@"%K == %@", @"customLabelForSorting", v3];
}

+ (id)userDefinedFoldersFetchRequest
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(a1, "_foldersWithPredicateFormat:", @"%K != NULL && %K != NULL", @"encryptedName", @"uuid");
  [v2 setShouldRefreshRefetchedObjects:1];
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"rank" ascending:1];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v2 setSortDescriptors:v4];

  return v2;
}

+ (id)foldersWithNameFetchRequest:(id)a3 searchOption:(int)a4
{
  v6 = (void *)MEMORY[0x1E4F28C68];
  id v7 = a3;
  v8 = [v6 expressionForKeyPath:@"encryptedName"];
  v9 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v7];

  v10 = (void *)MEMORY[0x1E4F28B98];
  uint64_t v11 = _predicateOperatorTypeForSearchOption(a4);
  v12 = [v10 predicateWithLeftExpression:v8 rightExpression:v9 modifier:0 type:v11 options:_predicateOptionsForSearchOption(a4)];
  v13 = [a1 _defaultFolderFetchRequest:v12];

  return v13;
}

+ (id)foldersWithUUIDFetchRequest:(id)a3
{
  return (id)[a1 _foldersWithPredicateFormat:@"%K == %@", @"uuid", a3];
}

+ (id)foldersWithhRankFetchRequest:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  v5 = [a1 _foldersWithPredicateFormat:@"%K == %@", @"rank", v4];

  return v5;
}

+ (id)allFoldersForSortingFetchRequest
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 _defaultFolderFetchRequest];
  v5[0] = @"rank";
  v5[1] = @"uuid";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  [v2 setPropertiesToFetch:v3];

  return v2;
}

+ (id)customLabelSearchPredicateWithString:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K contains[cd] %@", @"customLabelForSorting", a3];
}

+ (id)cacheDeletedOnWatchPredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"flags != nil && bitwiseAnd:with:(flags, %@) == %@", &unk_1F1F0D908, &unk_1F1F0D920];
}

+ (id)watchOSPredicate
{
  return SharedFlagsBitwiseAndCompoundPredicate(64);
}

+ (id)musicMemoPredicate
{
  return SharedFlagsBitwiseAndCompoundPredicate(4);
}

+ (id)favoritePredicate
{
  return SharedFlagsBitwiseAndCompoundPredicate(1);
}

+ (id)recordingsInFolderPredicate:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ == folder.uuid", a3];
}

+ (id)_defaultRecordingsFetchRequest:(id)a3
{
  id v4 = a3;
  v5 = [a1 _defaultRecordingsFetchRequest];
  [v5 setPredicate:v4];

  return v5;
}

+ (id)_defaultFolderFetchRequest
{
  if (_defaultFolderFetchRequest_onceToken != -1) {
    dispatch_once(&_defaultFolderFetchRequest_onceToken, &__block_literal_global_61);
  }
  uint64_t v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Folder"];
  [v2 setPropertiesToFetch:_defaultFolderFetchRequest_defaultFolderPropertiesToFetch];
  return v2;
}

void __44__RCQueryManager__defaultFolderFetchRequest__block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"encryptedName";
  v2[1] = @"rank";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)_defaultFolderFetchRequest_defaultFolderPropertiesToFetch;
  _defaultFolderFetchRequest_defaultFolderPropertiesToFetch = v0;
}

+ (id)_defaultFolderFetchRequest:(id)a3
{
  id v4 = a3;
  v5 = [a1 _defaultFolderFetchRequest];
  [v5 setPredicate:v4];

  return v5;
}

+ (id)_recordingsWithPredicateFormat:(id)a3
{
  id v4 = a3;
  v5 = [a1 _defaultRecordingsFetchRequest];
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:v4 arguments:&v9];

  [v5 setPredicate:v6];
  return v5;
}

+ (id)_foldersWithPredicateFormat:(id)a3
{
  id v4 = a3;
  v5 = [a1 _defaultFolderFetchRequest];
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:v4 arguments:&v9];

  [v5 setPredicate:v6];
  return v5;
}

@end
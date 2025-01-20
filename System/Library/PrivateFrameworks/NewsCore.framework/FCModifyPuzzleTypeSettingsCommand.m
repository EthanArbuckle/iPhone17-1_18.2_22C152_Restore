@interface FCModifyPuzzleTypeSettingsCommand
- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4;
- (FCModifyPuzzleTypeSettingsCommand)initWithPuzzleTypeSettingsEntries:(id)a3 merge:(BOOL)a4;
@end

@implementation FCModifyPuzzleTypeSettingsCommand

- (FCModifyPuzzleTypeSettingsCommand)initWithPuzzleTypeSettingsEntries:(id)a3 merge:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_54);
  v7 = [(FCModifyRecordsCommand *)self initWithLocalRecords:v6 merge:v4];

  return v7;
}

uint64_t __77__FCModifyPuzzleTypeSettingsCommand_initWithPuzzleTypeSettingsEntries_merge___block_invoke(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:@"puzzleTypeID"];
  v8 = [v6 objectForKeyedSubscript:@"puzzleTypeID"];
  if ([v7 isEqualToString:v8])
  {
    v9 = [v5 objectForKeyedSubscript:@"settingsData"];
    v10 = [v6 objectForKeyedSubscript:@"settingsData"];
    BOOL v11 = v9 != v10;
    if (v9 != v10) {
      [v6 setObject:v9 forKeyedSubscript:@"settingsData"];
    }
    v12 = [v5 objectForKeyedSubscript:@"lastSeenPuzzleIDs"];
    v13 = [v6 objectForKeyedSubscript:@"lastSeenPuzzleIDs"];
    if ((objc_msgSend(v12, "fc_isEqualToArray:", v13) & 1) == 0)
    {
      [v6 setObject:v12 forKeyedSubscript:@"lastSeenPuzzleIDs"];
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

@end
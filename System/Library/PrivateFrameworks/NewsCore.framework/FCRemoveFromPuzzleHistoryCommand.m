@interface FCRemoveFromPuzzleHistoryCommand
- (FCRemoveFromPuzzleHistoryCommand)initWithEntryID:(id)a3;
@end

@implementation FCRemoveFromPuzzleHistoryCommand

- (FCRemoveFromPuzzleHistoryCommand)initWithEntryID:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F1A320];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithZoneName:@"PuzzleHistory" ownerName:*MEMORY[0x1E4F19C08]];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v5 zoneID:v7];

  if (v8)
  {
    v12[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    v10 = [(FCRemoveRecordsCommand *)self initWithRecordIDs:v9];
  }
  else
  {
    v10 = [(FCRemoveRecordsCommand *)self initWithRecordIDs:MEMORY[0x1E4F1CBF0]];
  }

  return v10;
}

@end
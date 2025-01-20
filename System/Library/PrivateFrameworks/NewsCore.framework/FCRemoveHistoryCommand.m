@interface FCRemoveHistoryCommand
- (FCRemoveHistoryCommand)initWithHistoryItemIDs:(id)a3;
@end

@implementation FCRemoveHistoryCommand

- (FCRemoveHistoryCommand)initWithHistoryItemIDs:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1A320];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithZoneName:@"ReadingHistory" ownerName:*MEMORY[0x1E4F19C08]];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__FCRemoveHistoryCommand_initWithHistoryItemIDs___block_invoke;
  v13[3] = &unk_1E5B4DC20;
  id v14 = v7;
  id v8 = v7;
  v9 = objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", v13);

  if (v9) {
    v10 = v9;
  }
  else {
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v11 = [(FCRemoveRecordsCommand *)self initWithRecordIDs:v10];

  return v11;
}

id __49__FCRemoveHistoryCommand_initWithHistoryItemIDs___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithRecordName:v4 zoneID:*(void *)(a1 + 32)];

  return v5;
}

@end
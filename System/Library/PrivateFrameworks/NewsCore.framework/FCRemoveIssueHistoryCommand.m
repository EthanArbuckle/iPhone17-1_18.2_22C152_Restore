@interface FCRemoveIssueHistoryCommand
- (FCRemoveIssueHistoryCommand)initWithIssueHistoryItemIDs:(id)a3;
@end

@implementation FCRemoveIssueHistoryCommand

- (FCRemoveIssueHistoryCommand)initWithIssueHistoryItemIDs:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1A320];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithZoneName:@"IssueReadingHistory" ownerName:*MEMORY[0x1E4F19C08]];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__FCRemoveIssueHistoryCommand_initWithIssueHistoryItemIDs___block_invoke;
  v15[3] = &unk_1E5B4DC20;
  id v8 = v7;
  id v16 = v8;
  v9 = objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", v15);

  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)FCRemoveIssueHistoryCommand;
    v10 = [(FCRemoveRecordsCommand *)&v14 initWithRecordIDs:v9];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)FCRemoveIssueHistoryCommand;
    v10 = [(FCRemoveRecordsCommand *)&v13 initWithRecordIDs:MEMORY[0x1E4F1CBF0]];
  }
  v11 = v10;

  return v11;
}

id __59__FCRemoveIssueHistoryCommand_initWithIssueHistoryItemIDs___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithRecordName:v4 zoneID:*(void *)(a1 + 32)];

  return v5;
}

@end
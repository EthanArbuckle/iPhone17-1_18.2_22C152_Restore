@interface FCModifyReadingListCommand
- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4;
- (FCModifyReadingListCommand)initWithReadingListEntries:(id)a3 merge:(BOOL)a4;
@end

@implementation FCModifyReadingListCommand

- (FCModifyReadingListCommand)initWithReadingListEntries:(id)a3 merge:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_140);
  v7 = [(FCModifyRecordsCommand *)self initWithLocalRecords:v6 merge:v4];

  return v7;
}

id __63__FCModifyReadingListCommand_initWithReadingListEntries_merge___block_invoke(uint64_t a1, void *a2)
{
  return -[FCReadingListEntry asCKRecord](a2);
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:@"dateAdded"];
  v8 = [v6 objectForKeyedSubscript:@"dateAdded"];
  uint64_t v9 = [v7 compare:v8];
  if (v9 == 1)
  {
    v10 = [v5 objectForKeyedSubscript:@"dateAdded"];
    [v6 setObject:v10 forKeyedSubscript:@"dateAdded"];

    v11 = [v5 objectForKeyedSubscript:@"articleID"];
    [v6 setObject:v11 forKeyedSubscript:@"articleID"];

    v12 = [v5 objectForKeyedSubscript:@"origin"];
    [v6 setObject:v12 forKeyedSubscript:@"origin"];
  }
  return v9 == 1;
}

@end
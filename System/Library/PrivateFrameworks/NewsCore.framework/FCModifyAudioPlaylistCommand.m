@interface FCModifyAudioPlaylistCommand
- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4;
- (FCModifyAudioPlaylistCommand)initWithItems:(id)a3 merge:(BOOL)a4;
@end

@implementation FCModifyAudioPlaylistCommand

- (FCModifyAudioPlaylistCommand)initWithItems:(id)a3 merge:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_83);
  v7 = [(FCModifyRecordsCommand *)self initWithLocalRecords:v6 merge:v4];

  return v7;
}

uint64_t __52__FCModifyAudioPlaylistCommand_initWithItems_merge___block_invoke(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
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
    v10 = [v5 objectForKeyedSubscript:@"articleID"];
    [v6 setObject:v10 forKeyedSubscript:@"articleID"];

    v11 = [v5 objectForKeyedSubscript:@"dateAdded"];
    [v6 setObject:v11 forKeyedSubscript:@"dateAdded"];

    v12 = [v5 objectForKeyedSubscript:@"order"];
    [v6 setObject:v12 forKeyedSubscript:@"order"];
  }
  return v9 == 1;
}

@end
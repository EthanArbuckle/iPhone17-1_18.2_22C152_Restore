@interface FCModifySubscriptionsCommand
- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4;
- (FCModifySubscriptionsCommand)initWithSubscriptions:(id)a3 merge:(BOOL)a4;
@end

@implementation FCModifySubscriptionsCommand

- (FCModifySubscriptionsCommand)initWithSubscriptions:(id)a3 merge:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_97);
  v7 = [(FCModifyRecordsCommand *)self initWithLocalRecords:v6 merge:v4];

  return v7;
}

uint64_t __60__FCModifySubscriptionsCommand_initWithSubscriptions_merge___block_invoke(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:@"dateAdded"];
  v8 = [v6 objectForKeyedSubscript:@"dateAdded"];
  int v9 = objc_msgSend(v7, "fc_isLaterThan:", v8);
  if (v9)
  {
    v10 = [v5 objectForKeyedSubscript:@"dateAdded"];
    [v6 setObject:v10 forKeyedSubscript:@"dateAdded"];
  }
  return v9;
}

@end
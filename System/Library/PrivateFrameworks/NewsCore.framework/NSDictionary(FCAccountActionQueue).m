@interface NSDictionary(FCAccountActionQueue)
- (uint64_t)fc_actionTypes;
- (uint64_t)fc_localDataHint;
@end

@implementation NSDictionary(FCAccountActionQueue)

- (uint64_t)fc_actionTypes
{
  return [a1 objectForKeyedSubscript:@"FCFileCoordinatedAccountActionQueueActionTypesKey"];
}

- (uint64_t)fc_localDataHint
{
  v1 = [a1 objectForKeyedSubscript:@"FCFileCoordinatedAccountActionQueueLocalDataHintKey"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end
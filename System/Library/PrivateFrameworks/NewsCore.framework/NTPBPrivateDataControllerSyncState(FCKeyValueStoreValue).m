@interface NTPBPrivateDataControllerSyncState(FCKeyValueStoreValue)
+ (uint64_t)keyValuePairType;
+ (uint64_t)readValueFromKeyValuePair:()FCKeyValueStoreValue;
- (void)writeToKeyValuePair:()FCKeyValueStoreValue;
@end

@implementation NTPBPrivateDataControllerSyncState(FCKeyValueStoreValue)

+ (uint64_t)keyValuePairType
{
  return 13;
}

+ (uint64_t)readValueFromKeyValuePair:()FCKeyValueStoreValue
{
  return [a3 privateDataControllerSyncState];
}

- (void)writeToKeyValuePair:()FCKeyValueStoreValue
{
  id v4 = a3;
  [v4 setValueType:13];
  [v4 setPrivateDataControllerSyncState:a1];
}

@end
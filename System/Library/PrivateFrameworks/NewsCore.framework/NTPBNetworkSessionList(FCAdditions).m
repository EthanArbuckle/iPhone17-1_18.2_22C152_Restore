@interface NTPBNetworkSessionList(FCAdditions)
+ (uint64_t)keyValuePairType;
+ (uint64_t)readValueFromKeyValuePair:()FCAdditions;
- (void)writeToKeyValuePair:()FCAdditions;
@end

@implementation NTPBNetworkSessionList(FCAdditions)

+ (uint64_t)readValueFromKeyValuePair:()FCAdditions
{
  return [a3 networkSessionList];
}

+ (uint64_t)keyValuePairType
{
  return 8;
}

- (void)writeToKeyValuePair:()FCAdditions
{
  id v4 = a3;
  [v4 setValueType:8];
  [v4 setNetworkSessionList:a1];
}

@end
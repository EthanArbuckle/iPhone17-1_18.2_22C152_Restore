@interface NTPBAsset(KVS)
+ (uint64_t)keyValuePairType;
+ (uint64_t)readValueFromKeyValuePair:()KVS;
- (void)writeToKeyValuePair:()KVS;
@end

@implementation NTPBAsset(KVS)

+ (uint64_t)readValueFromKeyValuePair:()KVS
{
  return [a3 asset];
}

+ (uint64_t)keyValuePairType
{
  return 15;
}

- (void)writeToKeyValuePair:()KVS
{
  id v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  [v4 setAsset:a1];
}

@end
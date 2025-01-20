@interface NTPBAVAssetKey(KVS)
+ (uint64_t)keyValuePairType;
+ (uint64_t)readValueFromKeyValuePair:()KVS;
- (void)writeToKeyValuePair:()KVS;
@end

@implementation NTPBAVAssetKey(KVS)

+ (uint64_t)keyValuePairType
{
  return 18;
}

+ (uint64_t)readValueFromKeyValuePair:()KVS
{
  return [a3 avAssetKey];
}

- (void)writeToKeyValuePair:()KVS
{
  id v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  [v4 setAvAssetKey:a1];
}

@end
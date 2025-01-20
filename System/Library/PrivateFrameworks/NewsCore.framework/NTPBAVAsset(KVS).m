@interface NTPBAVAsset(KVS)
+ (uint64_t)keyValuePairType;
+ (uint64_t)readValueFromKeyValuePair:()KVS;
- (void)writeToKeyValuePair:()KVS;
@end

@implementation NTPBAVAsset(KVS)

+ (uint64_t)keyValuePairType
{
  return 17;
}

+ (uint64_t)readValueFromKeyValuePair:()KVS
{
  return [a3 avAsset];
}

- (void)writeToKeyValuePair:()KVS
{
  id v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  [v4 setAvAsset:a1];
}

@end
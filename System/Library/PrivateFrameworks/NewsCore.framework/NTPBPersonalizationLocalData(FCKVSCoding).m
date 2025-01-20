@interface NTPBPersonalizationLocalData(FCKVSCoding)
+ (uint64_t)keyValuePairType;
+ (uint64_t)readValueFromKeyValuePair:()FCKVSCoding;
- (void)writeToKeyValuePair:()FCKVSCoding;
@end

@implementation NTPBPersonalizationLocalData(FCKVSCoding)

+ (uint64_t)keyValuePairType
{
  return 11;
}

+ (uint64_t)readValueFromKeyValuePair:()FCKVSCoding
{
  return [a3 personalizationLocalData];
}

- (void)writeToKeyValuePair:()FCKVSCoding
{
  id v4 = a3;
  [v4 setValueType:11];
  [v4 setPersonalizationLocalData:a1];
}

@end
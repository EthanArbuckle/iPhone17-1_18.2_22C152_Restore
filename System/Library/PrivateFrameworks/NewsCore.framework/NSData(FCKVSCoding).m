@interface NSData(FCKVSCoding)
+ (uint64_t)keyValuePairType;
+ (uint64_t)readValueFromKeyValuePair:()FCKVSCoding;
- (void)writeToKeyValuePair:()FCKVSCoding;
@end

@implementation NSData(FCKVSCoding)

+ (uint64_t)readValueFromKeyValuePair:()FCKVSCoding
{
  return [a3 dataValue];
}

+ (uint64_t)keyValuePairType
{
  return 1;
}

- (void)writeToKeyValuePair:()FCKVSCoding
{
  id v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  [v4 setDataValue:a1];
}

@end
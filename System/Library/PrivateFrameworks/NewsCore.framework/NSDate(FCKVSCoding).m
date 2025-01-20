@interface NSDate(FCKVSCoding)
+ (id)readValueFromKeyValuePair:()FCKVSCoding;
+ (uint64_t)keyValuePairType;
- (void)writeToKeyValuePair:()FCKVSCoding;
@end

@implementation NSDate(FCKVSCoding)

+ (uint64_t)keyValuePairType
{
  return 3;
}

+ (id)readValueFromKeyValuePair:()FCKVSCoding
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  v4 = [a3 dateValue];
  [v4 timeIntervalSince1970];
  v5 = objc_msgSend(v3, "dateWithTimeIntervalSince1970:");

  return v5;
}

- (void)writeToKeyValuePair:()FCKVSCoding
{
  id v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  id v5 = [a1 pbDate];
  [v4 setDateValue:v5];
}

@end
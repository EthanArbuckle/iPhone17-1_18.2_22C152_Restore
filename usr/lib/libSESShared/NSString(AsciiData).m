@interface NSString(AsciiData)
+ (id)stringWithAsciiData:()AsciiData;
- (uint64_t)asAsciiData;
@end

@implementation NSString(AsciiData)

- (uint64_t)asAsciiData
{
  return [a1 dataUsingEncoding:1];
}

+ (id)stringWithAsciiData:()AsciiData
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithData:v4 encoding:1];

  return v5;
}

@end
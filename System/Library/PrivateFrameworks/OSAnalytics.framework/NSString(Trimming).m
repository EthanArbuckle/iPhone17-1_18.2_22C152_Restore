@interface NSString(Trimming)
- (id)stringByTrimming;
- (id)stringByTrimmingColumnSensitive;
@end

@implementation NSString(Trimming)

- (id)stringByTrimming
{
  v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

- (id)stringByTrimmingColumnSensitive
{
  v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];

  if ([v3 isEqualToString:@"^"])
  {
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"{column %lu}", objc_msgSend(a1, "length"));

    v3 = (void *)v4;
  }
  return v3;
}

@end
@interface NSNumber(TSUAdditions)
+ (uint64_t)tsu_numberWithCGFloat:()TSUAdditions;
- (BOOL)tsu_isFloatingPointType;
@end

@implementation NSNumber(TSUAdditions)

+ (uint64_t)tsu_numberWithCGFloat:()TSUAdditions
{
  return objc_msgSend(NSNumber, "numberWithDouble:");
}

- (BOOL)tsu_isFloatingPointType
{
  return (*(unsigned char *)[a1 objCType] & 0xFD) == 100;
}

@end
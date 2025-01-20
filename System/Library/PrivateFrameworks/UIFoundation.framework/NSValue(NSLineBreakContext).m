@interface NSValue(NSLineBreakContext)
+ (uint64_t)UIF_valueWithLineBreakContext:()NSLineBreakContext;
- (uint64_t)UIF_lineBreakContextValue;
@end

@implementation NSValue(NSLineBreakContext)

+ (uint64_t)UIF_valueWithLineBreakContext:()NSLineBreakContext
{
  return [MEMORY[0x1E4F29238] value:a3 withObjCType:"{?=QQB}"];
}

- (uint64_t)UIF_lineBreakContextValue
{
  *x8_0 = 0;
  x8_0[1] = 0;
  x8_0[2] = 0;
  return [a1 getValue:x8_0];
}

@end
@interface NSValue(FstArc)
+ (id)valueWithArc:()FstArc;
- (uint64_t)arcValue;
@end

@implementation NSValue(FstArc)

+ (id)valueWithArc:()FstArc
{
  uint64_t v5 = a3;
  v3 = [MEMORY[0x263F08D40] value:&v5 withObjCType:"{_FstArc=ii}"];
  return v3;
}

- (uint64_t)arcValue
{
  [a1 getValue:&v2];
  return v2;
}

@end
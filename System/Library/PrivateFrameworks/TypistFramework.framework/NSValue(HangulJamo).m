@interface NSValue(HangulJamo)
+ (id)valueWithHangulJamoTransformationData:()HangulJamo;
+ (uint64_t)hangulJamoTransformationDataValueWithJamoType:()HangulJamo direction:;
- (uint64_t)hangulJamoTransformationDataValue;
@end

@implementation NSValue(HangulJamo)

+ (id)valueWithHangulJamoTransformationData:()HangulJamo
{
  uint64_t v5 = a3;
  v3 = [a1 valueWithBytes:&v5 objCType:"{?=ii}"];
  return v3;
}

- (uint64_t)hangulJamoTransformationDataValue
{
  uint64_t v2 = 0;
  [a1 getValue:&v2];
  return v2;
}

+ (uint64_t)hangulJamoTransformationDataValueWithJamoType:()HangulJamo direction:
{
  return [MEMORY[0x263F08D40] valueWithHangulJamoTransformationData:a3 | (unint64_t)(a4 << 32)];
}

@end
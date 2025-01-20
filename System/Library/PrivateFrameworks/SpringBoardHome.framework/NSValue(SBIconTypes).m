@interface NSValue(SBIconTypes)
+ (id)sbh_valueWithSBHIconGridSize:()SBIconTypes;
+ (id)sbh_valueWithSBIconCoordinate:()SBIconTypes;
+ (id)sbh_valueWithSBIconImageInfo:()SBIconTypes;
- (double)sbh_SBIconImageInfoValue;
- (uint64_t)sbh_SBHIconGridSizeValue;
- (uint64_t)sbh_SBIconCoordinateValue;
@end

@implementation NSValue(SBIconTypes)

- (double)sbh_SBIconImageInfoValue
{
  memset(v2, 0, sizeof(v2));
  [a1 getValue:v2 size:32];
  return *(double *)v2;
}

- (uint64_t)sbh_SBHIconGridSizeValue
{
  unsigned int v2 = 0;
  [a1 getValue:&v2 size:4];
  return v2;
}

+ (id)sbh_valueWithSBHIconGridSize:()SBIconTypes
{
  int v5 = a3;
  v3 = [MEMORY[0x1E4F29238] valueWithBytes:&v5 objCType:"{SBHIconGridSize=SS}"];
  return v3;
}

+ (id)sbh_valueWithSBIconImageInfo:()SBIconTypes
{
  *(double *)v6 = a1;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  *(double *)&v6[3] = a4;
  v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{SBIconImageInfo={CGSize=dd}dd}"];
  return v4;
}

+ (id)sbh_valueWithSBIconCoordinate:()SBIconTypes
{
  v6[0] = a3;
  v6[1] = a4;
  v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{SBIconCoordinate=qq}"];
  return v4;
}

- (uint64_t)sbh_SBIconCoordinateValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2 size:16];
  return v2[0];
}

@end
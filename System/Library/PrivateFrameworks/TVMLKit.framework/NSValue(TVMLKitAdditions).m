@interface NSValue(TVMLKitAdditions)
+ (uint64_t)tv_valueWithCellMetrics:()TVMLKitAdditions;
+ (uint64_t)tv_valueWithRowMetrics:()TVMLKitAdditions;
- (uint64_t)tv_cellMetricsValue;
- (uint64_t)tv_rowMetricsValue;
@end

@implementation NSValue(TVMLKitAdditions)

+ (uint64_t)tv_valueWithCellMetrics:()TVMLKitAdditions
{
  return [MEMORY[0x263F08D40] valueWithBytes:a3 objCType:"{TVCellMetrics={CGSize=dd}{UIEdgeInsets=dddd}{UIEdgeInsets=dddd}{UIEdgeInsets=dddd}{UIEdgeInsets=dddd}}"];
}

+ (uint64_t)tv_valueWithRowMetrics:()TVMLKitAdditions
{
  return [MEMORY[0x263F08D40] valueWithBytes:a3 objCType:"{TVRowMetrics=qd{?=dd}{?=dd}{?=dd}{?=dd}}"];
}

- (uint64_t)tv_cellMetricsValue
{
  x8_0[7] = 0u;
  x8_0[8] = 0u;
  x8_0[5] = 0u;
  x8_0[6] = 0u;
  x8_0[3] = 0u;
  x8_0[4] = 0u;
  x8_0[1] = 0u;
  x8_0[2] = 0u;
  *x8_0 = 0u;
  return [a1 getValue:x8_0];
}

- (uint64_t)tv_rowMetricsValue
{
  x8_0[3] = 0u;
  x8_0[4] = 0u;
  x8_0[1] = 0u;
  x8_0[2] = 0u;
  *x8_0 = 0u;
  return [a1 getValue:x8_0];
}

@end
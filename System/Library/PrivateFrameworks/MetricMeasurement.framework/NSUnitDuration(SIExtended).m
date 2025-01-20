@interface NSUnitDuration(SIExtended)
+ (id)microseconds;
+ (id)milliseconds;
+ (id)nanoseconds;
@end

@implementation NSUnitDuration(SIExtended)

+ (id)nanoseconds
{
  id v0 = objc_alloc(MEMORY[0x263F08C98]);
  v1 = (void *)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:0.000000001];
  v2 = (void *)[v0 initWithSymbol:@"ns" converter:v1];

  return v2;
}

+ (id)microseconds
{
  id v0 = objc_alloc(MEMORY[0x263F08C98]);
  v1 = (void *)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:0.000001];
  v2 = (void *)[v0 initWithSymbol:@"µs" converter:v1];

  return v2;
}

+ (id)milliseconds
{
  id v0 = objc_alloc(MEMORY[0x263F08C98]);
  v1 = (void *)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:0.001];
  v2 = (void *)[v0 initWithSymbol:@"ms" converter:v1];

  return v2;
}

@end
@interface MXMUnitPacket
+ (MXMUnitPacket)baseUnit;
@end

@implementation MXMUnitPacket

+ (MXMUnitPacket)baseUnit
{
  v2 = [MXMUnitPacket alloc];
  v3 = (void *)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:1.0];
  v4 = [(NSDimension *)v2 initWithSymbol:@"p" converter:v3];

  return v4;
}

@end
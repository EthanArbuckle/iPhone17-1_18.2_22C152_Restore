@interface MRAVOutputContext
- (NSArray)mr_allAirPlayDevices;
@end

@implementation MRAVOutputContext

- (NSArray)mr_allAirPlayDevices
{
  v2 = [(MRAVOutputContext *)self outputDevices];
  v3 = objc_msgSend(v2, "msv_flatMap:", &stru_100420230);

  return (NSArray *)v3;
}

@end
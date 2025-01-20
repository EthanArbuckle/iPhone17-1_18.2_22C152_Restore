@interface NRGError
+ (id)errorWithCode:(int64_t)a3;
@end

@implementation NRGError

+ (id)errorWithCode:(int64_t)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0:
      [NSString stringWithFormat:@"(%@) NanoResourceGrabber cannot connect to service", @"NRGErrorCannotConnect"];
      goto LABEL_10;
    case 1:
      [NSString stringWithFormat:@"(%@) No NanoResourceGrabber proxy returned", @"NRGErrorNoProxy"];
      goto LABEL_10;
    case 2:
      [NSString stringWithFormat:@"(%@) Not yet implemented", @"NRGErrorNotImplemented"];
      goto LABEL_10;
    case 3:
      [NSString stringWithFormat:@"(%@) No paired device", @"NRGErrorNoPairedDevice"];
      goto LABEL_10;
    case 4:
      [NSString stringWithFormat:@"(%@) Request timed out", @"NRGErrorTimedOut"];
      goto LABEL_10;
    case 5:
      [NSString stringWithFormat:@"(%@) Request already pending", @"NRGErrorRequestAlreadyPending"];
      goto LABEL_10;
    case 6:
      [NSString stringWithFormat:@"(%@) No data returned for request", @"NRGErrorNoData"];
      v4 = LABEL_10:;
      break;
    default:
      v4 = 0;
      break;
  }
  v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = v4;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v5 errorWithDomain:@"com.apple.NanoResourceGrabber" code:a3 userInfo:v6];

  return v7;
}

@end
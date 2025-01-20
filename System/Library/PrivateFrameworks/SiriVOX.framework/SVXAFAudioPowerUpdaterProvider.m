@interface SVXAFAudioPowerUpdaterProvider
- (id)createWithProvider:(id)a3 queue:(id)a4 frequency:(int64_t)a5 delegate:(id)a6;
@end

@implementation SVXAFAudioPowerUpdaterProvider

- (id)createWithProvider:(id)a3 queue:(id)a4 frequency:(int64_t)a5 delegate:(id)a6
{
  v9 = (objc_class *)MEMORY[0x263F28428];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[[v9 alloc] initWithProvider:v12 queue:v11 frequency:a5 delegate:v10];

  return v13;
}

@end
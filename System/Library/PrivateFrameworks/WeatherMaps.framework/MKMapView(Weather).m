@interface MKMapView(Weather)
- (void)configureForMuted;
- (void)configureForWeather;
- (void)configureForWeatherWind;
@end

@implementation MKMapView(Weather)

- (void)configureForWeather
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F10A30]) initWithEmphasisStyle:101];
  objc_msgSend(a1, "setPreferredConfiguration:");
}

- (void)configureForMuted
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F10A30]) initWithEmphasisStyle:1];
  objc_msgSend(a1, "setPreferredConfiguration:");
}

- (void)configureForWeatherWind
{
  id v2 = objc_alloc(MEMORY[0x263F10A30]);
  id v3 = (id)[v2 initWithEmphasisStyle:*MEMORY[0x263F10880]];
  objc_msgSend(a1, "setPreferredConfiguration:");
}

@end
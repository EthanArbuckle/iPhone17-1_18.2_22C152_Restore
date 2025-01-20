@interface STUIStatusBarIndicatorSatelliteItem
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation STUIStatusBarIndicatorSatelliteItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA97C0];
}

- (id)systemImageNameForUpdate:(id)a3
{
  v3 = [a3 data];
  v4 = [v3 satelliteEntry];
  uint64_t v5 = [v4 connectionStatus];

  if (v5 == 1) {
    v6 = @"satellite.wave.2.fill";
  }
  else {
    v6 = @"satellite.fill";
  }
  return v6;
}

@end
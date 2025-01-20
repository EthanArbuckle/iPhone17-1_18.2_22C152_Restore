@interface STUIStatusBarIndicatorRingerSilenceItem
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
- (int64_t)fontStyle;
@end

@implementation STUIStatusBarIndicatorRingerSilenceItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA97B0];
}

- (int64_t)fontStyle
{
  return 1;
}

- (id)systemImageNameForUpdate:(id)a3
{
  v3 = +[STUIStatusBarSettingsDomain rootSettings];
  v4 = [v3 itemSettings];
  int v5 = [v4 showRingerWhenSilenced];

  if (v5) {
    v6 = @"bell.slash.fill";
  }
  else {
    v6 = @"bell.fill";
  }
  return v6;
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  id v4 = a4;
  int v5 = +[STUIStatusBarSettingsDomain rootSettings];
  v6 = [v5 itemSettings];
  char v7 = [v6 showRingerWhenSilenced];

  v8 = [v4 ringerSilenceEntry];

  LOBYTE(v4) = v7 ^ [v8 BOOLValue] ^ 1;
  return (char)v4;
}

@end
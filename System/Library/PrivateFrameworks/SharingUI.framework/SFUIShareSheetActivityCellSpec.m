@interface SFUIShareSheetActivityCellSpec
+ (double)appIconWidth;
+ (double)nearbyAirDropBadgeSizeForIdiom:(int64_t)a3;
+ (double)peopleIconWidth;
+ (double)transportIconWidth;
+ (id)subtitleLabelColorForIdiom:(int64_t)a3;
+ (id)titleLabelFontTextStyleForIdiom:(int64_t)a3;
@end

@implementation SFUIShareSheetActivityCellSpec

+ (id)titleLabelFontTextStyleForIdiom:(int64_t)a3
{
  v3 = (id *)MEMORY[0x263F835B8];
  if (a3 != 6) {
    v3 = (id *)MEMORY[0x263F83590];
  }
  return *v3;
}

+ (double)nearbyAirDropBadgeSizeForIdiom:(int64_t)a3
{
  return 24.0;
}

+ (double)peopleIconWidth
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 6) {
    return 52.0;
  }
  v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 _referenceBounds];
  if (v6 >= 414.0)
  {
    v7 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v4 = 62.0;
    }
    else {
      double v4 = 66.0;
    }
  }
  else
  {
    double v4 = 62.0;
  }

  return v4;
}

+ (double)appIconWidth
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 6) {
    return 52.0;
  }
  v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 _referenceBounds];
  if (v6 >= 414.0)
  {
    v7 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v4 = 60.0;
    }
    else {
      double v4 = 64.0;
    }
  }
  else
  {
    double v4 = 60.0;
  }

  return v4;
}

+ (double)transportIconWidth
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double result = 20.0;
  if (v3 == 6) {
    return 24.0;
  }
  return result;
}

+ (id)subtitleLabelColorForIdiom:(int64_t)a3
{
  if (a3 == 6) {
    [MEMORY[0x263F825C8] secondaryLabelColor];
  }
  else {
  uint64_t v3 = [MEMORY[0x263F825C8] systemGrayColor];
  }
  return v3;
}

@end
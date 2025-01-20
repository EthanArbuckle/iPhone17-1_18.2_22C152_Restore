@interface PCLocalizedString
+ (id)keyValueForKey:(unint64_t)a3;
+ (id)localizedStringForKey:(unint64_t)a3;
@end

@implementation PCLocalizedString

+ (id)localizedStringForKey:(unint64_t)a3
{
  v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.ProximityControl"];
  v5 = +[PCLocalizedString keyValueForKey:a3];
  v6 = [v4 localizedStringForKey:v5 value:&stru_26CD922E8 table:0];

  return v6;
}

+ (id)keyValueForKey:(unint64_t)a3
{
  if (a3 - 1 > 0x14) {
    return @"ALARM_DEFAULT_TEXT";
  }
  else {
    return off_26443DF30[a3 - 1];
  }
}

@end
@interface TransitPreferencesText
+ (id)cellTextForICFares;
+ (id)footerTextForDisabledModes;
+ (id)footerTextForICFares;
+ (id)headerTextForDisabledModes;
@end

@implementation TransitPreferencesText

+ (id)headerTextForDisabledModes
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Prefer Trips Using" value:@"localized string not found" table:0];

  return v3;
}

+ (id)footerTextForDisabledModes
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Prefer these vehicles when planning transit trips." value:@"localized string not found" table:0];

  return v3;
}

+ (id)cellTextForICFares
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Transit Filter Picker, Fares] Transit Card Fares", @"localized string not found", 0 value table];

  return v3;
}

+ (id)footerTextForICFares
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Transit Filter Picker, Fares] Transit Card Fares Footer", @"localized string not found", 0 value table];

  return v3;
}

@end
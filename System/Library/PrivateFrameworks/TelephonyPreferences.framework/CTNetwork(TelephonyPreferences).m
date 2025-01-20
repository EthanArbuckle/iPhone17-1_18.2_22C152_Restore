@interface CTNetwork(TelephonyPreferences)
- (id)tps_localizedName;
@end

@implementation CTNetwork(TelephonyPreferences)

- (id)tps_localizedName
{
  v2 = [a1 name];
  v3 = +[TPSLocalizedString localizedStringForKey:v2];

  if (![v3 length])
  {
    uint64_t v4 = [a1 name];

    v3 = (void *)v4;
  }
  return v3;
}

@end
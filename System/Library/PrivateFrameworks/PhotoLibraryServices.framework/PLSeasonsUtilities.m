@interface PLSeasonsUtilities
+ (BOOL)isCountryCodePartOfNorthernHemisphere:(id)a3;
+ (BOOL)isCountryCodePartOfSouthernHemisphere:(id)a3;
+ (id)_seasonCountryCodesDictionary;
+ (unint64_t)_northernMeteorologicalSeasonForMonthNumber:(unint64_t)a3;
+ (unint64_t)_seasonForMonthNumber:(unint64_t)a3 locale:(id)a4;
+ (unint64_t)_southernMeteorologicalSeasonForMonthNumber:(unint64_t)a3;
@end

@implementation PLSeasonsUtilities

+ (BOOL)isCountryCodePartOfSouthernHemisphere:(id)a3
{
  id v4 = a3;
  v5 = [a1 _seasonCountryCodesDictionary];
  v6 = [v5 objectForKeyedSubscript:@"southernHemisphereCountryCodes"];
  char v7 = [v6 containsObject:v4];

  return v7;
}

+ (BOOL)isCountryCodePartOfNorthernHemisphere:(id)a3
{
  id v4 = a3;
  v5 = [a1 _seasonCountryCodesDictionary];
  v6 = [v5 objectForKeyedSubscript:@"northernHemisphereCountryCodes"];
  char v7 = [v6 containsObject:v4];

  return v7;
}

+ (id)_seasonCountryCodesDictionary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PLSeasonsUtilities__seasonCountryCodesDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_seasonCountryCodesDictionary_onceToken != -1) {
    dispatch_once(&_seasonCountryCodesDictionary_onceToken, block);
  }
  v2 = (void *)_seasonCountryCodesDictionary_seasonCountryCodesDictionary;
  return v2;
}

void __51__PLSeasonsUtilities__seasonCountryCodesDictionary__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v0 URLForResource:@"seasonsCountryCodes" withExtension:@"plist"];

  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3];
  v2 = (void *)_seasonCountryCodesDictionary_seasonCountryCodesDictionary;
  _seasonCountryCodesDictionary_seasonCountryCodesDictionary = v1;
}

+ (unint64_t)_southernMeteorologicalSeasonForMonthNumber:(unint64_t)a3
{
  if (a3 - 1 < 0xC) {
    return qword_19BA9ACF8[a3 - 1];
  }
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:a1 file:@"PLSeasonsUtilities.m" lineNumber:86 description:@"Month number needs to be in the range 1...12"];

  return 0;
}

+ (unint64_t)_northernMeteorologicalSeasonForMonthNumber:(unint64_t)a3
{
  if (a3 - 1 < 0xC) {
    return qword_19BA9AC98[a3 - 1];
  }
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:a1 file:@"PLSeasonsUtilities.m" lineNumber:60 description:@"Month number needs to be in the range 1...12"];

  return 0;
}

+ (unint64_t)_seasonForMonthNumber:(unint64_t)a3 locale:(id)a4
{
  id v6 = a4;
  char v7 = v6;
  if (a3 - 13 < 0xFFFFFFFFFFFFFFF4) {
    goto LABEL_7;
  }
  v8 = [v6 countryCode];
  int v9 = [a1 isCountryCodePartOfNorthernHemisphere:v8];

  if (!v9)
  {
    v11 = [v7 countryCode];
    int v12 = [a1 isCountryCodePartOfSouthernHemisphere:v11];

    if (v12)
    {
      uint64_t v10 = [a1 _southernMeteorologicalSeasonForMonthNumber:a3];
      goto LABEL_6;
    }
LABEL_7:
    unint64_t v13 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = [a1 _northernMeteorologicalSeasonForMonthNumber:a3];
LABEL_6:
  unint64_t v13 = v10;
LABEL_8:

  return v13;
}

@end
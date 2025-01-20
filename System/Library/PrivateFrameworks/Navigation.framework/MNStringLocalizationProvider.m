@interface MNStringLocalizationProvider
+ (void)initLocalizationProvider;
- (MNStringLocalizationProvider)init;
- (id)aboutDistanceAndAHalfKilometers;
- (id)aboutDistanceAndAHalfMiles;
- (id)aboutNDistance;
- (id)distanceAQuarterMile;
- (id)distanceAndAHalfKilometers;
- (id)distanceAndAHalfMiles;
- (id)distanceHalfAMile;
- (id)distanceThreeQuartersOfAMile;
- (id)frequencyRange_BothOnlyHours;
- (id)frequencyRange_BothOnlyMinutes;
- (id)frequencyRange_MixedUnits;
- (id)frequencySingleValue_OneHour;
- (id)frequencySingleValue_OneMinute;
- (id)locale;
- (id)minutesFormatForCountdownList;
- (id)separatorForTimestampList;
- (id)spokenLocale;
@end

@implementation MNStringLocalizationProvider

- (MNStringLocalizationProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)MNStringLocalizationProvider;
  v2 = [(MNStringLocalizationProvider *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    v5 = v2;
  }

  return v2;
}

+ (void)initLocalizationProvider
{
  if (initLocalizationProvider_onceToken != -1) {
    dispatch_once(&initLocalizationProvider_onceToken, &__block_literal_global_43);
  }
}

uint64_t __56__MNStringLocalizationProvider_initLocalizationProvider__block_invoke()
{
  v0 = objc_alloc_init(MNStringLocalizationProvider);
  v1 = (void *)initLocalizationProvider_localizationProvider;
  initLocalizationProvider_localizationProvider = (uint64_t)v0;

  uint64_t v2 = initLocalizationProvider_localizationProvider;
  uint64_t v3 = (void *)MEMORY[0x1E4F644D0];
  return [v3 setLocalizationProvider:v2];
}

- (id)locale
{
  return self->_locale;
}

- (id)spokenLocale
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA20];
  uint64_t v3 = +[MNUserOptionsEngine sharedInstance];
  v4 = [v3 currentVoiceLanguage];
  v5 = [v2 localeWithLocaleIdentifier:v4];

  return v5;
}

- (id)aboutNDistance
{
  return _MNStringFromSpokenLocalization(@"about N distance [SPOKEN]");
}

- (id)distanceAndAHalfKilometers
{
  return _MNStringFromSpokenLocalization(@"N and a half kilometers [SPOKEN]");
}

- (id)aboutDistanceAndAHalfKilometers
{
  return _MNStringFromSpokenLocalization(@"N and a half kilometers [SPOKEN][APPROXIMATE]");
}

- (id)distanceAndAHalfMiles
{
  return _MNStringFromSpokenLocalization(@"N and a half miles [SPOKEN]");
}

- (id)aboutDistanceAndAHalfMiles
{
  return _MNStringFromSpokenLocalization(@"N and a half miles [SPOKEN][APPROXIMATE]");
}

- (id)distanceAQuarterMile
{
  return _MNStringFromSpokenLocalization(@"a quarter mile [SPOKEN]");
}

- (id)distanceHalfAMile
{
  return _MNStringFromSpokenLocalization(@"half a mile [SPOKEN]");
}

- (id)distanceThreeQuartersOfAMile
{
  return _MNStringFromSpokenLocalization(@"three quarters of a mile [SPOKEN]");
}

- (id)frequencySingleValue_OneHour
{
  return _MNLocalizedStringFromThisBundle(@"TransitDepartureFrequency_component_singleHour");
}

- (id)frequencySingleValue_OneMinute
{
  return _MNLocalizedStringFromThisBundle(@"TransitDepartureFrequency_component_singleMinute");
}

- (id)frequencyRange_BothOnlyHours
{
  return _MNLocalizedStringFromThisBundle(@"TransitDepartureFrequency_description_hour_range");
}

- (id)frequencyRange_BothOnlyMinutes
{
  return _MNLocalizedStringFromThisBundle(@"TransitDepartureFrequency_description_minutes_range");
}

- (id)frequencyRange_MixedUnits
{
  return _MNLocalizedStringFromThisBundle(@"TransitDepartureFrequency_description_mixes_range");
}

- (id)separatorForTimestampList
{
  return _MNLocalizedStringFromThisBundle(@"timestamp list delimiter");
}

- (id)minutesFormatForCountdownList
{
  return _MNLocalizedStringFromThisBundle(@"FormattedString_Countdownlist_Min_Format");
}

- (void).cxx_destruct
{
}

@end
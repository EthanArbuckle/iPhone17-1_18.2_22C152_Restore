@interface PPQuickTypeFormatter
+ (id)formatterWithQuery:(id)a3;
- (id)_dateFormatForTemplate:(uint64_t)a1;
- (id)attributionPattern;
- (id)destinationLabel;
- (id)distanceLabel;
- (id)etaLabel;
- (id)formattedBirthday:(id)a3;
- (id)formattedEventTime:(id)a3;
- (id)formattedLengthInMeters:(double)a3;
- (id)formattedMeasurement:(id)a3 allowDecimals:(BOOL)a4 scaleUnits:(BOOL)a5;
- (id)formattedPostalAddress:(id)a3;
- (id)formattedStringForLabel:(id)a3;
- (id)formattedStringsForLabels:(id)a3;
- (id)formattedTimeInterval:(double)a3;
- (id)inviteLinkLabel;
- (id)itemLabelForBundleId:(void *)a1 typeLabel:(void *)a2;
- (id)localizedAppNameForBundleIdentifier:(id)a3;
- (id)makeBirthdayFormatter;
- (id)makeChineseBirthdayFormatter;
- (id)makeDateComponentFormatter;
- (id)makeLengthFormatter;
- (id)makeLongEventFormatter;
- (id)makeMeasurementDecimalFormatter;
- (id)makeMeasurementUnscaledFormatter;
- (id)makeMeasurementWholeFormatter;
- (id)makeShortEventFormatter;
- (id)makeYearlessChineseBirthdayFormatter;
- (id)navigationItemLabelForTypeLabel:(id)a3 destination:(id)a4;
- (id)streetLabel;
- (id)timeLeftLabel;
- (uint64_t)_isYearlessComponents:(uint64_t)a1;
- (void)_localizedStringForKey:(void *)a1;
@end

@implementation PPQuickTypeFormatter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedContactsLabeledValuesLprojs, 0);
  objc_storeStrong((id *)&self->_localizedStringsCache, 0);
  objc_storeStrong((id *)&self->_dateComponentFormatter, 0);
  objc_storeStrong((id *)&self->_lengthFormatter, 0);
  objc_storeStrong((id *)&self->_measurementUnscaledFormatter, 0);
  objc_storeStrong((id *)&self->_measurementDecimalFormatter, 0);
  objc_storeStrong((id *)&self->_measurementWholeFormatter, 0);
  objc_storeStrong((id *)&self->_appNameCache, 0);
  objc_storeStrong((id *)&self->_dateFormatCache, 0);
  objc_storeStrong((id *)&self->_longEventFormatter, 0);
  objc_storeStrong((id *)&self->_shortEventFormatter, 0);
  objc_storeStrong((id *)&self->_yearlessChineseBirthdayFormatter, 0);
  objc_storeStrong((id *)&self->_chineseBirthdayFormatter, 0);
  objc_storeStrong((id *)&self->_birthdayFormatter, 0);
  objc_storeStrong((id *)&self->_fallbackLanguage, 0);
  objc_storeStrong((id *)&self->_desiredLanguage, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (id)inviteLinkLabel
{
  v2 = -[PPQuickTypeFormatter _localizedStringForKey:](self, @"FaceTime Invitation");
  if ([v2 length])
  {
    v3 = v2;
  }
  else
  {
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
    if (v4)
    {
      v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
      v3 = [v5 localizedStringForKey:@"FaceTime Invitation" value:&stru_1F253DF18 table:@"Localizable"];
    }
    else
    {
      v3 = @"FaceTime Invitation";
    }
  }
  return v3;
}

- (void)_localizedStringForKey:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__13050;
    v16 = __Block_byref_object_dispose__13051;
    id v17 = 0;
    v5 = (void *)a1[17];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__PPQuickTypeFormatter__localizedStringForKey___block_invoke;
    v7[3] = &unk_1E65D7C50;
    v10 = &v12;
    v11 = sel__localizedStringForKey_;
    id v8 = v3;
    v9 = a1;
    [v5 runWithLockAcquired:v7];
    a1 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  return a1;
}

void __47__PPQuickTypeFormatter__localizedStringForKey___block_invoke(void *a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:a1[4]];
  id v5 = [MEMORY[0x1E4F1CA98] null];

  if (v4 == v5)
  {
    uint64_t v6 = *(void *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  else if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a1[7], a1[5], @"PPQuickTypeFormatter.m", 729, @"Invalid parameter not satisfying: %@", @"[result isKindOfClass:[NSString class]]" object file lineNumber description];
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v4);
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v8 = *(void *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;

    v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
    v11 = v10;
    if (v10)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28B50];
      v13 = [v10 localizations];
      uint64_t v14 = a1[5];
      uint64_t v16 = *(void *)(v14 + 24);
      uint64_t v15 = *(void *)(v14 + 32);
      v38[0] = v16;
      v38[1] = v15;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
      v18 = [v12 preferredLocalizationsFromArray:v13 forPreferences:v17];

      if ([v18 count])
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          v32 = v18;
          uint64_t v22 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v34 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              v25 = (void *)MEMORY[0x1CB79D060]();
              v26 = [v11 localizedStringForKey:a1[4] value:0 table:0 localization:v24];
              v27 = v26;
              if (v26 && ([v26 isEqual:a1[4]] & 1) == 0)
              {

                goto LABEL_24;
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
            if (v21) {
              continue;
            }
            break;
          }
          v27 = v4;
LABEL_24:
          v18 = v32;
        }
        else
        {
          v27 = v4;
        }

        [v3 setObject:v27 forKeyedSubscript:a1[4]];
        uint64_t v30 = *(void *)(a1[6] + 8);
        id v4 = v27;
        v28 = *(NSObject **)(v30 + 40);
        *(void *)(v30 + 40) = v4;
      }
      else
      {
        v28 = pp_quicktype_log_handle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = *(__CFString **)(a1[5] + 24);
          *(_DWORD *)buf = 138412290;
          v40 = v29;
          _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEFAULT, "Could not determine localizations for %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v18 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = @"com.apple.proactive.PersonalizationPortraitInternals";
        _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "Could not load bundle for %@", buf, 0xCu);
      }
    }
  }
}

- (id)timeLeftLabel
{
  v2 = -[PPQuickTypeFormatter _localizedStringForKey:](self, @"time to %@");
  if ([v2 length])
  {
    id v3 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
    if (v4)
    {
      id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
      id v3 = [v5 localizedStringForKey:@"time to %@" value:&stru_1F253DF18 table:@"Localizable"];
    }
    else
    {
      id v3 = @"time to %@";
    }
  }
  return v3;
}

- (id)streetLabel
{
  v2 = -[PPQuickTypeFormatter _localizedStringForKey:](self, @"street");
  if ([v2 length])
  {
    id v3 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
    if (v4)
    {
      id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
      id v3 = [v5 localizedStringForKey:@"street" value:&stru_1F253DF18 table:@"Localizable"];
    }
    else
    {
      id v3 = @"street";
    }
  }
  return v3;
}

- (id)distanceLabel
{
  v2 = -[PPQuickTypeFormatter _localizedStringForKey:](self, @"distance to %@");
  if ([v2 length])
  {
    id v3 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
    if (v4)
    {
      id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
      id v3 = [v5 localizedStringForKey:@"distance to %@" value:&stru_1F253DF18 table:@"Localizable"];
    }
    else
    {
      id v3 = @"distance to %@";
    }
  }
  return v3;
}

- (id)destinationLabel
{
  v2 = -[PPQuickTypeFormatter _localizedStringForKey:](self, @"destination");
  if ([v2 length])
  {
    id v3 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
    if (v4)
    {
      id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
      id v3 = [v5 localizedStringForKey:@"destination" value:&stru_1F253DF18 table:@"Localizable"];
    }
    else
    {
      id v3 = @"destination";
    }
  }
  return v3;
}

- (id)etaLabel
{
  v2 = -[PPQuickTypeFormatter _localizedStringForKey:](self, @"arrival at %@");
  if ([v2 length])
  {
    id v3 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
    if (v4)
    {
      id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
      id v3 = [v5 localizedStringForKey:@"arrival at %@" value:&stru_1F253DF18 table:@"Localizable"];
    }
    else
    {
      id v3 = @"arrival at %@";
    }
  }
  return v3;
}

- (id)attributionPattern
{
  v2 = -[PPQuickTypeFormatter _localizedStringForKey:](self, @"%@ (%@ App)");
  if ([v2 length])
  {
    id v3 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.PersonalizationPortraitInternals"];
    id v5 = v4;
    if (v4)
    {
      id v3 = [v4 localizedStringForKey:@"%@ (%@ App)" value:&stru_1F253DF18 table:@"Localizable"];
    }
    else
    {
      id v3 = @"%@ (%@ App)";
    }
  }
  return v3;
}

- (id)navigationItemLabelForTypeLabel:(id)a3 destination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    uint64_t v14 = _PASValidatedFormat(v6, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    uint64_t v15 = -[PPQuickTypeFormatter itemLabelForBundleId:typeLabel:](self, v14);
  }
  else
  {
    uint64_t v14 = [(PPQuickTypeFormatter *)self destinationLabel];
    uint64_t v22 = _PASValidatedFormat(v6, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v14);
    uint64_t v15 = -[PPQuickTypeFormatter itemLabelForBundleId:typeLabel:](self, v22);
  }
  return v15;
}

- (id)itemLabelForBundleId:(void *)a1 typeLabel:(void *)a2
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = @"com.apple.Maps";
  id v5 = a2;
  if (a1)
  {
    id v6 = [a1 localizedAppNameForBundleIdentifier:@"com.apple.Maps"];
    id v7 = [a1 attributionPattern];
    uint64_t v14 = v7;
    if (v7)
    {
      _PASValidatedFormat(v7, @"%@%@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v16 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v20 = @"com.apple.Maps";
        __int16 v21 = 2112;
        id v22 = v5;
        _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Formatter failed to get label pattern for bundle: %@ label: %@", buf, 0x16u);
      }

      id v15 = v5;
    }
    uint64_t v17 = v15;
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)formattedTimeInterval:(double)a3
{
  id v4 = [(PPQuickTypeFormatter *)self makeDateComponentFormatter];
  id v5 = [v4 stringFromTimeInterval:a3];

  return v5;
}

- (id)makeDateComponentFormatter
{
  v2 = self;
  objc_sync_enter(v2);
  dateComponentFormatter = v2->_dateComponentFormatter;
  if (dateComponentFormatter)
  {
    id v4 = dateComponentFormatter;
  }
  else
  {
    id v5 = (NSDateComponentsFormatter *)objc_opt_new();
    id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v6 setLocale:v2->_locale];
    [(NSDateComponentsFormatter *)v5 setCalendar:v6];
    [(NSDateComponentsFormatter *)v5 setUnitsStyle:5];
    [(NSDateComponentsFormatter *)v5 setAllowedUnits:96];
    id v7 = v2->_dateComponentFormatter;
    v2->_dateComponentFormatter = v5;
    uint64_t v8 = v5;

    id v4 = v2->_dateComponentFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)formattedPostalAddress:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F643C0];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 toCNPostalAddress];

  uint64_t v8 = [(NSLocale *)self->_locale languageCode];
  uint64_t v9 = [(NSLocale *)self->_locale countryCode];
  uint64_t v10 = (void *)[v6 initWithCNPostalAddress:v7 language:v8 country:v9 phoneticLocale:self->_desiredLanguage];

  uint64_t v11 = [v10 fullAddressNoCurrentCountryWithMultiline:0];

  return v11;
}

- (id)formattedLengthInMeters:(double)a3
{
  id v4 = [(PPQuickTypeFormatter *)self makeLengthFormatter];
  id v5 = [v4 stringFromMeters:a3];

  return v5;
}

- (id)makeLengthFormatter
{
  v2 = self;
  objc_sync_enter(v2);
  lengthFormatter = v2->_lengthFormatter;
  if (lengthFormatter)
  {
    id v4 = lengthFormatter;
  }
  else
  {
    id v5 = (NSLengthFormatter *)objc_opt_new();
    id v6 = objc_opt_new();
    [v6 setMaximumFractionDigits:1];
    [(NSLengthFormatter *)v5 setNumberFormatter:v6];
    id v7 = v2->_lengthFormatter;
    v2->_lengthFormatter = v5;
    uint64_t v8 = v5;

    id v4 = v2->_lengthFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)formattedMeasurement:(id)a3 allowDecimals:(BOOL)a4 scaleUnits:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v6)
  {
    uint64_t v9 = [(PPQuickTypeFormatter *)self makeMeasurementDecimalFormatter];
  }
  else
  {
    if (v5) {
      [(PPQuickTypeFormatter *)self makeMeasurementWholeFormatter];
    }
    else {
    uint64_t v9 = [(PPQuickTypeFormatter *)self makeMeasurementUnscaledFormatter];
    }
  }
  uint64_t v10 = v9;
  uint64_t v11 = [v9 stringFromMeasurement:v8];

  return v11;
}

- (id)makeMeasurementUnscaledFormatter
{
  v2 = self;
  objc_sync_enter(v2);
  measurementUnscaledFormatter = v2->_measurementUnscaledFormatter;
  if (measurementUnscaledFormatter)
  {
    id v4 = measurementUnscaledFormatter;
  }
  else
  {
    BOOL v5 = (NSMeasurementFormatter *)objc_opt_new();
    [(NSMeasurementFormatter *)v5 setLocale:v2->_locale];
    [(NSMeasurementFormatter *)v5 setUnitOptions:1];
    BOOL v6 = objc_opt_new();
    [v6 setMaximumFractionDigits:0];
    [v6 setMinimumFractionDigits:0];
    [v6 setMinimumIntegerDigits:1];
    [(NSMeasurementFormatter *)v5 setNumberFormatter:v6];
    id v7 = v2->_measurementUnscaledFormatter;
    v2->_measurementUnscaledFormatter = v5;
    id v8 = v5;

    id v4 = v2->_measurementUnscaledFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)makeMeasurementDecimalFormatter
{
  v2 = self;
  objc_sync_enter(v2);
  measurementDecimalFormatter = v2->_measurementDecimalFormatter;
  if (measurementDecimalFormatter)
  {
    id v4 = measurementDecimalFormatter;
  }
  else
  {
    BOOL v5 = (NSMeasurementFormatter *)objc_opt_new();
    [(NSMeasurementFormatter *)v5 setLocale:v2->_locale];
    [(NSMeasurementFormatter *)v5 setUnitOptions:3];
    BOOL v6 = objc_opt_new();
    [v6 setMaximumFractionDigits:1];
    [v6 setMinimumFractionDigits:1];
    [v6 setMinimumIntegerDigits:1];
    [(NSMeasurementFormatter *)v5 setNumberFormatter:v6];
    id v7 = v2->_measurementDecimalFormatter;
    v2->_measurementDecimalFormatter = v5;
    id v8 = v5;

    id v4 = v2->_measurementDecimalFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)makeMeasurementWholeFormatter
{
  v2 = self;
  objc_sync_enter(v2);
  measurementWholeFormatter = v2->_measurementWholeFormatter;
  if (measurementWholeFormatter)
  {
    id v4 = measurementWholeFormatter;
  }
  else
  {
    BOOL v5 = (NSMeasurementFormatter *)objc_opt_new();
    [(NSMeasurementFormatter *)v5 setLocale:v2->_locale];
    [(NSMeasurementFormatter *)v5 setUnitOptions:3];
    BOOL v6 = objc_opt_new();
    [v6 setMaximumFractionDigits:0];
    [v6 setMinimumFractionDigits:0];
    [v6 setMinimumIntegerDigits:1];
    [(NSMeasurementFormatter *)v5 setNumberFormatter:v6];
    id v7 = v2->_measurementWholeFormatter;
    v2->_measurementWholeFormatter = v5;
    id v8 = v5;

    id v4 = v2->_measurementWholeFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)localizedAppNameForBundleIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NSCache *)self->_appNameCache objectForKey:v4];
  if (!v5)
  {
    id v11 = 0;
    BOOL v6 = [objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v11];
    id v7 = v11;
    if (v6)
    {
      fallbackLanguage = self->_fallbackLanguage;
      v12[0] = self->_desiredLanguage;
      v12[1] = fallbackLanguage;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
      BOOL v5 = [v6 localizedNameWithPreferredLocalizations:v9];

      if (v5) {
        [(NSCache *)self->_appNameCache setObject:v5 forKey:v4];
      }
    }
    else
    {
      BOOL v6 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "PPQuickTypeFormatter: Failed to get application record for %@: %@", buf, 0x16u);
      }
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (id)formattedStringsForLabels:(id)a3
{
  id v4 = a3;
  if (formattedStringsForLabels__onceToken != -1) {
    dispatch_once(&formattedStringsForLabels__onceToken, &__block_literal_global_63_13112);
  }
  cachedContactsLabeledValuesLprojs = self->_cachedContactsLabeledValuesLprojs;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke_2;
  v22[3] = &unk_1E65D7BD8;
  v22[4] = self;
  BOOL v6 = [(_PASCachedResult *)cachedContactsLabeledValuesLprojs resultNonnullWithBlock:v22];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__13050;
  uint64_t v20 = __Block_byref_object_dispose__13051;
  id v21 = 0;
  id v7 = (void *)formattedStringsForLabels__lprojAndLabelToLocalizedStringCache;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke_3;
  v12[3] = &unk_1E65D7C28;
  __int16 v15 = &v16;
  id v8 = v4;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  [v7 runWithLockAcquired:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

id __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke_2(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28B50];
  id v3 = [(id)formattedStringsForLabels__cnBundle localizations];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v4 + 24);
  uint64_t v5 = *(void *)(v4 + 32);
  v10[0] = v6;
  v10[1] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v8 = [v2 preferredLocalizationsFromArray:v3 forPreferences:v7];

  return v8;
}

void __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke_4;
  v9[3] = &unk_1E65D7C00;
  uint64_t v4 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v9);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

id __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([(__CFString *)v3 hasPrefix:@"_$!<"]
    && ([(__CFString *)v3 hasSuffix:@">!$_"] & 1) != 0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v9 = (void *)MEMORY[0x1CB79D060]();
          id v10 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v8 second:v3];
          id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];
          if (!v11)
          {
            uint64_t v12 = [(id)formattedStringsForLabels__cnBundle localizedStringForKey:v3 value:0 table:formattedStringsForLabels__table localization:v8];
            id v13 = v12;
            if (v12 && ([v12 isEqual:v3] & 1) == 0)
            {
              id v14 = v13;
            }
            else
            {
              id v14 = [MEMORY[0x1E4F1CA98] null];
            }
            id v11 = v14;
            if ((unint64_t)[*(id *)(a1 + 40) count] >= 0x800)
            {
              __int16 v15 = pp_quicktype_log_handle();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "clearing formattedStringsForLabels cache due to size", buf, 2u);
              }

              [*(id *)(a1 + 40) removeAllObjects];
            }
            uint64_t v16 = (void *)[v11 copy];
            [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:v10];
          }
          uint64_t v17 = [MEMORY[0x1E4F1CA98] null];

          if (v11 != v17)
          {
            id v21 = pp_quicktype_log_handle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v28 = @"cache miss";
              __int16 v29 = 2112;
              uint64_t v30 = v3;
              __int16 v31 = 2112;
              v32 = v11;
              _os_log_debug_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEBUG, "(%@) localized label: %@ -> %@", buf, 0x20u);
            }

            goto LABEL_26;
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    uint64_t v18 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v28 = v3;
      _os_log_debug_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEBUG, "no localized label available for %{private}@ -- must be either a custom label, or localizations not available", buf, 0xCu);
    }

    uint64_t v19 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:v3];
  }
  else
  {
    uint64_t v19 = v3;
  }
  id v11 = v19;
LABEL_26:

  return v11;
}

void __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = (void *)formattedStringsForLabels__cnBundle;
  formattedStringsForLabels__cnBundle = v0;

  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = (void *)formattedStringsForLabels__table;
  formattedStringsForLabels__table = v3;

  id v5 = objc_alloc(MEMORY[0x1E4F93B70]);
  id v8 = (id)objc_opt_new();
  uint64_t v6 = [v5 initWithGuardedData:v8];
  uint64_t v7 = (void *)formattedStringsForLabels__lprojAndLabelToLocalizedStringCache;
  formattedStringsForLabels__lprojAndLabelToLocalizedStringCache = v6;
}

- (id)formattedStringForLabel:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v10 count:1];

  uint64_t v7 = -[PPQuickTypeFormatter formattedStringsForLabels:](self, "formattedStringsForLabels:", v6, v10, v11);
  id v8 = [v7 firstObject];

  return v8;
}

- (id)formattedEventTime:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_debug_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEBUG, "formatting event time: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v6 = PPNextMidnight();
  uint64_t v7 = [v4 compare:v6];

  if (v7 == 1) {
    [(PPQuickTypeFormatter *)self makeLongEventFormatter];
  }
  else {
  id v8 = [(PPQuickTypeFormatter *)self makeShortEventFormatter];
  }
  id v9 = [v8 stringFromDate:v4];

  return v9;
}

- (id)formattedBirthday:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v38 = 138412290;
    id v39 = v4;
    _os_log_debug_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEBUG, "formatting birthday: %@", (uint8_t *)&v38, 0xCu);
  }

  uint64_t v6 = [v4 calendar];
  uint64_t v7 = [v6 calendarIdentifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F1C318]];

  if (v8)
  {
    id v9 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v38) = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEBUG, "using gregorian formatter", (uint8_t *)&v38, 2u);
    }

    uint64_t v10 = [(PPQuickTypeFormatter *)self makeBirthdayFormatter];
LABEL_18:
    uint64_t v18 = (void *)v10;
    goto LABEL_19;
  }
  int v11 = [v4 calendar];
  id v12 = [v11 calendarIdentifier];
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F1C2F0]];

  if (v13)
  {
    int v14 = -[PPQuickTypeFormatter _isYearlessComponents:]((uint64_t)self, v4);
    __int16 v15 = pp_quicktype_log_handle();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v16)
      {
        LOWORD(v38) = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEBUG, "using yearless chinese formatter", (uint8_t *)&v38, 2u);
      }

      uint64_t v10 = [(PPQuickTypeFormatter *)self makeYearlessChineseBirthdayFormatter];
    }
    else
    {
      if (v16)
      {
        LOWORD(v38) = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEBUG, "using chinese formatter", (uint8_t *)&v38, 2u);
      }

      uint64_t v10 = [(PPQuickTypeFormatter *)self makeChineseBirthdayFormatter];
    }
    goto LABEL_18;
  }
  uint64_t v17 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v38) = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEBUG, "configuring a new formatter", (uint8_t *)&v38, 2u);
  }

  uint64_t v18 = objc_opt_new();
  uint64_t v19 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v18 setTimeZone:v19];

  uint64_t v20 = [v4 calendar];
  [v18 setCalendar:v20];

  id IntlUtilityClass = getIntlUtilityClass();
  id v22 = [v4 calendar];
  long long v23 = [v22 calendarIdentifier];
  long long v24 = [IntlUtilityClass localeForCalendarID:v23];
  [v18 setLocale:v24];

  long long v25 = -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)self, @"MMMMd");
  [v18 setDateFormat:v25];

LABEL_19:
  id v26 = [v4 calendar];
  v27 = v26;
  if (self)
  {
    id v28 = v4;
    __int16 v29 = (void *)[v27 copy];

    uint64_t v30 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v29 setTimeZone:v30];

    __int16 v31 = (void *)[v28 copy];
    [v31 setHour:12];
    [v31 setMinute:0];
    [v31 setSecond:0];
    v32 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v31 setTimeZone:v32];

    [v31 setCalendar:v29];
    if (-[PPQuickTypeFormatter _isYearlessComponents:]((uint64_t)self, v31))
    {
      [getIntlUtilityClass() setYearlessYear:v31 forCalendar:v29];
      self = [v29 dateFromComponents:v31];
    }
    else
    {
      long long v33 = [v31 date];
      self = v33;
      if (v29 && v33)
      {
        uint64_t v34 = [v29 components:2097182 fromDate:v33];
        long long v35 = [v29 dateFromComponents:v34];

        self = v35;
      }
    }
  }
  else
  {
    __int16 v29 = v26;
  }

  if (self)
  {
    long long v36 = [v18 stringFromDate:self];
  }
  else
  {
    long long v36 = 0;
  }

  return v36;
}

- (uint64_t)_isYearlessComponents:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ([v3 year] == 0x7FFFFFFFFFFFFFFFLL)
    {
      a1 = 1;
    }
    else
    {
      a1 = [v4 calendar];

      if (a1)
      {
        id IntlUtilityClass = getIntlUtilityClass();
        uint64_t v6 = [v4 calendar];
        a1 = [IntlUtilityClass isYearlessDate:v4 forCalendar:v6];
      }
    }
  }

  return a1;
}

- (id)_dateFormatForTemplate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [*(id *)(a1 + 80) objectForKey:v3];
    if (!v4)
    {
      id v4 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:v3 options:0 locale:*(void *)(a1 + 16)];
      if (v4) {
        [*(id *)(a1 + 80) setObject:v4 forKey:v3];
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)makeBirthdayFormatter
{
  v2 = self;
  objc_sync_enter(v2);
  birthdayFormatter = v2->_birthdayFormatter;
  if (birthdayFormatter)
  {
    id v4 = birthdayFormatter;
  }
  else
  {
    id v5 = (NSDateFormatter *)objc_opt_new();
    uint64_t v6 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [(NSDateFormatter *)v5 setTimeZone:v6];

    uint64_t v7 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [(NSDateFormatter *)v5 setCalendar:v7];

    [(NSDateFormatter *)v5 setLocale:v2->_locale];
    int v8 = -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)v2, @"MMMMd");
    [(NSDateFormatter *)v5 setDateFormat:v8];

    id v9 = objc_opt_new();
    id v10 = [(NSDateFormatter *)v5 stringFromDate:v9];

    int v11 = v2->_birthdayFormatter;
    v2->_birthdayFormatter = v5;
    id v12 = v5;

    id v4 = v2->_birthdayFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)makeChineseBirthdayFormatter
{
  v2 = self;
  objc_sync_enter(v2);
  chineseBirthdayFormatter = v2->_chineseBirthdayFormatter;
  if (chineseBirthdayFormatter)
  {
    id v4 = chineseBirthdayFormatter;
  }
  else
  {
    id v5 = (NSDateFormatter *)objc_opt_new();
    uint64_t v6 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [(NSDateFormatter *)v5 setTimeZone:v6];

    uint64_t v7 = *MEMORY[0x1E4F1C2F0];
    int v8 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C2F0]];
    [(NSDateFormatter *)v5 setCalendar:v8];

    id v9 = [getIntlUtilityClass() localeForCalendarID:v7];
    [(NSDateFormatter *)v5 setLocale:v9];

    [(NSDateFormatter *)v5 setDateStyle:3];
    [(NSDateFormatter *)v5 setTimeStyle:0];
    id v10 = objc_opt_new();
    id v11 = [(NSDateFormatter *)v5 stringFromDate:v10];

    id v12 = v2->_chineseBirthdayFormatter;
    v2->_chineseBirthdayFormatter = v5;
    int v13 = v5;

    id v4 = v2->_chineseBirthdayFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)makeYearlessChineseBirthdayFormatter
{
  v2 = self;
  objc_sync_enter(v2);
  yearlessChineseBirthdayFormatter = v2->_yearlessChineseBirthdayFormatter;
  if (yearlessChineseBirthdayFormatter)
  {
    id v4 = yearlessChineseBirthdayFormatter;
  }
  else
  {
    id v5 = (NSDateFormatter *)objc_opt_new();
    uint64_t v6 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [(NSDateFormatter *)v5 setTimeZone:v6];

    uint64_t v7 = *MEMORY[0x1E4F1C2F0];
    int v8 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C2F0]];
    [(NSDateFormatter *)v5 setCalendar:v8];

    id v9 = [getIntlUtilityClass() localeForCalendarID:v7];
    [(NSDateFormatter *)v5 setLocale:v9];

    [(NSDateFormatter *)v5 setDateStyle:3];
    [(NSDateFormatter *)v5 setTimeStyle:0];
    id v10 = (void *)MEMORY[0x1E4F28C10];
    id v11 = [(NSDateFormatter *)v5 locale];
    id v12 = [v10 dateFormatFromTemplate:@"MMMMd" options:0 locale:v11];
    [(NSDateFormatter *)v5 setDateFormat:v12];

    int v13 = objc_opt_new();
    id v14 = [(NSDateFormatter *)v5 stringFromDate:v13];

    __int16 v15 = v2->_yearlessChineseBirthdayFormatter;
    v2->_yearlessChineseBirthdayFormatter = v5;
    BOOL v16 = v5;

    id v4 = v2->_yearlessChineseBirthdayFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)makeLongEventFormatter
{
  v2 = self;
  objc_sync_enter(v2);
  longEventFormatter = v2->_longEventFormatter;
  if (longEventFormatter)
  {
    id v4 = longEventFormatter;
  }
  else
  {
    id v5 = (NSDateFormatter *)objc_opt_new();
    [(NSDateFormatter *)v5 setLocale:v2->_locale];
    uint64_t v6 = -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)v2, @"eeejmm");
    [(NSDateFormatter *)v5 setDateFormat:v6];

    uint64_t v7 = objc_opt_new();
    id v8 = [(NSDateFormatter *)v5 stringFromDate:v7];

    id v9 = v2->_longEventFormatter;
    v2->_longEventFormatter = v5;
    id v10 = v5;

    id v4 = v2->_longEventFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)makeShortEventFormatter
{
  v2 = self;
  objc_sync_enter(v2);
  shortEventFormatter = v2->_shortEventFormatter;
  if (shortEventFormatter)
  {
    id v4 = shortEventFormatter;
  }
  else
  {
    id v5 = (NSDateFormatter *)objc_opt_new();
    [(NSDateFormatter *)v5 setLocale:v2->_locale];
    uint64_t v6 = -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)v2, @"jmm");
    [(NSDateFormatter *)v5 setDateFormat:v6];

    uint64_t v7 = objc_opt_new();
    id v8 = [(NSDateFormatter *)v5 stringFromDate:v7];

    id v9 = v2->_shortEventFormatter;
    v2->_shortEventFormatter = v5;
    id v10 = v5;

    id v4 = v2->_shortEventFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

+ (id)formatterWithQuery:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  v24[0] = @"locale";
  id v5 = [v4 localeIdentifier];

  uint64_t v6 = v5;
  if (!v5)
  {
    id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v6 = [v3 localeIdentifier];
  }
  uint64_t v18 = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:v24 count:1];
  if (!v5)
  {
  }
  if (formatterWithQuery___pasOnceToken4 != -1) {
    dispatch_once(&formatterWithQuery___pasOnceToken4, &__block_literal_global_13160);
  }
  id v8 = (id)formatterWithQuery___pasExprOnceResult;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__13050;
  id v22 = __Block_byref_object_dispose__13051;
  id v23 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PPQuickTypeFormatter_formatterWithQuery___block_invoke_34;
  aBlock[3] = &unk_1E65D7C28;
  id v9 = v7;
  id v15 = v9;
  id v10 = v4;
  id v16 = v10;
  uint64_t v17 = &v18;
  id v11 = _Block_copy(aBlock);

  [v8 runWithLockAcquired:v11];
  id v12 = v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __43__PPQuickTypeFormatter_formatterWithQuery___block_invoke_34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F93B60]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__PPQuickTypeFormatter_formatterWithQuery___block_invoke_2;
    v9[3] = &unk_1E65D7BB0;
    id v10 = *(id *)(a1 + 40);
    id v4 = (void *)[v5 initWithBlock:v9];
    [v3 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  uint64_t v6 = [v4 result];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

PPQuickTypeFormatter *__43__PPQuickTypeFormatter_formatterWithQuery___block_invoke_2(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v2 = [PPQuickTypeFormatter alloc];
  id v3 = *(void **)(a1 + 32);
  id v4 = v3;
  if (v2)
  {
    v45.receiver = v2;
    v45.super_class = (Class)PPQuickTypeFormatter;
    id v5 = (PPQuickTypeFormatter *)objc_msgSendSuper2(&v45, sel_init);
    v2 = v5;
    if (v5)
    {
      objc_storeStrong((id *)&v5->_query, v3);
      uint64_t v6 = [v4 localeIdentifier];

      if (v6)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F1CA20];
        id v8 = [v4 localeIdentifier];
        uint64_t v6 = [v7 localeWithLocaleIdentifier:v8];
      }
      uint64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
      id v10 = (void *)v9;
      if (v6) {
        id v11 = v6;
      }
      else {
        id v11 = (void *)v9;
      }
      objc_storeStrong((id *)&v2->_locale, v11);
      uint64_t v12 = [(NSLocale *)v2->_locale localeIdentifier];
      desiredLanguage = v2->_desiredLanguage;
      v2->_desiredLanguage = (NSString *)v12;

      uint64_t v14 = [v10 localeIdentifier];
      fallbackLanguage = v2->_fallbackLanguage;
      v2->_fallbackLanguage = (NSString *)v14;

      uint64_t v16 = objc_opt_new();
      dateFormatCache = v2->_dateFormatCache;
      v2->_dateFormatCache = (NSCache *)v16;

      [(NSCache *)v2->_dateFormatCache setCountLimit:4];
      id v18 = -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)v2, @"MMMMd");
      id v19 = -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)v2, @"jmm");
      id v20 = -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)v2, @"eeejmm");
      uint64_t v21 = objc_opt_new();
      appNameCache = v2->_appNameCache;
      v2->_appNameCache = (NSCache *)v21;

      [(NSCache *)v2->_appNameCache setCountLimit:1];
      id v23 = objc_alloc(MEMORY[0x1E4F93B70]);
      long long v24 = objc_opt_new();
      uint64_t v25 = [v23 initWithGuardedData:v24];
      localizedStringsCache = v2->_localizedStringsCache;
      v2->_localizedStringsCache = (_PASLock *)v25;

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v27 = [&unk_1F256A730 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v42 != v29) {
              objc_enumerationMutation(&unk_1F256A730);
            }
            id v31 = -[PPQuickTypeFormatter _localizedStringForKey:](v2, *(void **)(*((void *)&v41 + 1) + 8 * i));
          }
          uint64_t v28 = [&unk_1F256A730 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v28);
      }
      uint64_t v32 = objc_opt_new();
      cachedContactsLabeledValuesLprojs = v2->_cachedContactsLabeledValuesLprojs;
      v2->_cachedContactsLabeledValuesLprojs = (_PASCachedResult *)v32;

      uint64_t v34 = *MEMORY[0x1E4F1B770];
      v46[0] = *MEMORY[0x1E4F1B6F8];
      v46[1] = v34;
      uint64_t v35 = *MEMORY[0x1E4F1B720];
      v46[2] = *MEMORY[0x1E4F1B728];
      v46[3] = v35;
      uint64_t v36 = *MEMORY[0x1E4F1B750];
      v46[4] = *MEMORY[0x1E4F1B710];
      v46[5] = v36;
      uint64_t v37 = *MEMORY[0x1E4F1B700];
      v46[6] = *MEMORY[0x1E4F1B738];
      v46[7] = v37;
      int v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:8];
      id v39 = [(PPQuickTypeFormatter *)v2 formattedStringsForLabels:v38];
    }
  }

  return v2;
}

void __43__PPQuickTypeFormatter_formatterWithQuery___block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1CB79D060]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  v2 = objc_opt_new();
  uint64_t v3 = [v1 initWithGuardedData:v2];
  id v4 = (void *)formatterWithQuery___pasExprOnceResult;
  formatterWithQuery___pasExprOnceResult = v3;
}

@end
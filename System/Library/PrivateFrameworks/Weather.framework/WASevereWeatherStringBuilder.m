@interface WASevereWeatherStringBuilder
+ (BOOL)_hasImportantEvent:(id)a3;
+ (id)_capitalizeFirstWordOfString:(id)a3;
+ (id)_displayDescriptionForEvent:(id)a3 useSentenceCase:(BOOL)a4 isFirstEvent:(BOOL)a5;
+ (id)attributedImportantHeadlineForEvents:(id)a3;
+ (id)atttributedDescriptionForEvents:(id)a3 includeLearnMore:(BOOL)a4;
+ (id)atttributedDescriptionForEvents:(id)a3 includeLearnMore:(BOOL)a4 useSentenceCase:(BOOL)a5;
+ (id)atttributedHeadlineForEvents:(id)a3;
+ (id)descriptionForEvents:(id)a3 includeLearnMore:(BOOL)a4;
+ (id)descriptionForEvents:(id)a3 includeLearnMore:(BOOL)a4 useSentenceCase:(BOOL)a5;
+ (id)headlineForEvents:(id)a3;
+ (id)headlineForEvents:(id)a3 shouldUppercase:(BOOL)a4;
+ (id)importantHeadlineForEvents:(id)a3;
@end

@implementation WASevereWeatherStringBuilder

+ (id)headlineForEvents:(id)a3
{
  return (id)[a1 headlineForEvents:a3 shouldUppercase:1];
}

+ (id)headlineForEvents:(id)a3 shouldUppercase:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263EFF9B0] orderedSet];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v13 = [v12 eventDescription];

        if (v13)
        {
          v14 = [v12 eventDescription];
          v15 = v14;
          if (v4)
          {
            uint64_t v16 = [v14 localizedUppercaseString];

            v15 = (void *)v16;
          }
          [v6 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }

  uint64_t v17 = [v6 count];
  v18 = [v6 firstObject];
  v19 = @"%2$@ & %1$li more";
  if (v4) {
    v19 = @"%2$@ & %1$li MORE";
  }
  v20 = NSString;
  v21 = (void *)MEMORY[0x263F086E0];
  v22 = v19;
  v23 = [v21 bundleForClass:objc_opt_class()];
  v24 = [v23 localizedStringForKey:v22 value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];

  v25 = objc_msgSend(v20, "stringWithFormat:", v24, v17 - 1, v18, (void)v27);

  return v25;
}

+ (id)descriptionForEvents:(id)a3 includeLearnMore:(BOOL)a4
{
  return (id)[a1 descriptionForEvents:a3 includeLearnMore:a4 useSentenceCase:1];
}

+ (id)descriptionForEvents:(id)a3 includeLearnMore:(BOOL)a4 useSentenceCase:(BOOL)a5
{
  BOOL v42 = a5;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF9B0] orderedSet];
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v12 = 0;
    uint64_t v13 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v16 = [v15 eventDescription];
        if (v16 && ([v7 containsObject:v16] & 1) == 0)
        {
          [v8 addObject:v15];
          [v7 addObject:v16];
        }
        if (!v12)
        {
          v12 = [v15 source];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  uint64_t v17 = [v9 count];
  unint64_t v18 = [v8 count];
  if (v18 == 2)
  {
    long long v27 = [v8 firstObject];
    v20 = [a1 _displayDescriptionForEvent:v27 useSentenceCase:v42 isFirstEvent:1];

    long long v28 = [v8 lastObject];
    v21 = [a1 _displayDescriptionForEvent:v28 useSentenceCase:v42 isFirstEvent:0];

    long long v29 = NSString;
    long long v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = v30;
    if (v12)
    {
      v31 = [v30 localizedStringForKey:@"SEVERE_WEATHER_DESCRIPTION_TWO_EVENTS_WITH_SOURCE_WITH_DESCRIPTIONS" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
      objc_msgSend(v29, "stringWithFormat:", v31, v12, v20, v21);
    }
    else
    {
      v31 = [v30 localizedStringForKey:@"SEVERE_WEATHER_DESCRIPTION_TWO_EVENTS_WITHOUT_SOURCE_WITH_DESCRIPTIONS" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
      objc_msgSend(v29, "stringWithFormat:", v31, v20, v21, v41);
    v38 = };

    goto LABEL_45;
  }
  unint64_t v19 = v18 - 1;
  if (v18 == 1)
  {
    v20 = [v8 firstObject];
    v21 = [v20 areaName];
    v22 = [a1 _displayDescriptionForEvent:v20 useSentenceCase:v42 isFirstEvent:1];
    if (v12)
    {
      v23 = NSString;
      v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v25 = v24;
      if (v17 == 1 && v21)
      {
        v26 = [v24 localizedStringForKey:@"SEVERE_WEATHER_DESCRIPTION_ONE_EVENT_WITH_SOURCE_WITH_DESCRIPTION_WITH_AREA_NAME" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
        objc_msgSend(v23, "stringWithFormat:", v26, v12, v22, v21);
      }
      else
      {
        v26 = [v24 localizedStringForKey:@"SEVERE_WEATHER_DESCRIPTION_ONE_EVENT_WITH_SOURCE_WITH_DESCRIPTION_WITHOUT_AREA_NAME" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
        objc_msgSend(v23, "stringWithFormat:", v26, v12, v22, v41);
      }
    }
    else
    {
      v37 = NSString;
      v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v26 = [v25 localizedStringForKey:@"SEVERE_WEATHER_DESCRIPTION_ONE_EVENT_WITHOUT_SOURCE_WITH_DESCRIPTION_WITHOUT_AREA_NAME" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
      objc_msgSend(v37, "stringWithFormat:", v26, v22, v40, v41);
    v38 = };
  }
  else
  {
    if (v18 >= 3)
    {
      uint64_t v32 = [v8 firstObject];
      v20 = [a1 _displayDescriptionForEvent:v32 useSentenceCase:v42 isFirstEvent:1];

      v33 = NSString;
      v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v21 = v34;
      if (v12)
      {
        v22 = [v34 localizedStringForKey:@"%2$@: %3$@ and %1$li other alert/alerts." value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
        objc_msgSend(v33, "localizedStringWithFormat:", v22, v19, v12, v20);
      }
      else
      {
        v22 = [v34 localizedStringForKey:@"Severe weather alerts: %2$@ and %1$li other alert/alerts." value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
        objc_msgSend(v33, "localizedStringWithFormat:", v22, v19, v20, v41);
      v38 = };
      goto LABEL_45;
    }
    if (!v17)
    {
      v38 = 0;
      goto LABEL_46;
    }
    v20 = [v9 firstObject];
    v21 = [v20 areaName];
    v35 = NSString;
    v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = v36;
    if (v17 == 1 && v21)
    {
      if (v12)
      {
        v25 = [v36 localizedStringForKey:@"SEVERE_WEATHER_DESCRIPTION_ONE_EVENT_WITH_SOURCE_WITHOUT_DESCRIPTION_WITH_AREA_NAME" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
        objc_msgSend(v35, "stringWithFormat:", v25, v12, v21);
      }
      else
      {
        v25 = [v36 localizedStringForKey:@"SEVERE_WEATHER_DESCRIPTION_ONE_EVENT_WITHOUT_SOURCE_WITHOUT_DESCRIPTION_WITH_AREA_NAME" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
        objc_msgSend(v35, "stringWithFormat:", v25, v21, v40);
      }
    }
    else if (v12)
    {
      v25 = [v36 localizedStringForKey:@"%2$@: %1$li severe weather alert/alerts." value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
      objc_msgSend(v35, "localizedStringWithFormat:", v25, v17, v12);
    }
    else
    {
      v25 = [v36 localizedStringForKey:@"There are %li severe weather alert/alerts." value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
      objc_msgSend(v35, "localizedStringWithFormat:", v25, v17, v40);
    v38 = };
  }

LABEL_45:
LABEL_46:

  return v38;
}

+ (id)attributedImportantHeadlineForEvents:(id)a3
{
  id v4 = a3;
  if ([a1 _hasImportantEvent:v4])
  {
    id v5 = [a1 atttributedHeadlineForEvents:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)importantHeadlineForEvents:(id)a3
{
  id v4 = a3;
  if ([a1 _hasImportantEvent:v4])
  {
    id v5 = [a1 headlineForEvents:v4 shouldUppercase:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)_hasImportantEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "description", (void)v10);

        if (v8)
        {
          LOBYTE(v4) = [v7 importance] == 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)atttributedHeadlineForEvents:(id)a3
{
  id v3 = [a1 headlineForEvents:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D2C0] scale:1];
    uint64_t v5 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle.fill" withConfiguration:v4];
    id v6 = [MEMORY[0x263F1C370] textAttachmentWithImage:v5];
    id v7 = objc_alloc(MEMORY[0x263F089B8]);
    uint64_t v8 = [NSString stringWithFormat:@" %@", v3];
    id v9 = (void *)[v7 initWithString:v8];

    long long v10 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v6];
    [v9 insertAttributedString:v10 atIndex:0];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)atttributedDescriptionForEvents:(id)a3 includeLearnMore:(BOOL)a4
{
  return (id)[a1 atttributedDescriptionForEvents:a3 includeLearnMore:a4 useSentenceCase:1];
}

+ (id)atttributedDescriptionForEvents:(id)a3 includeLearnMore:(BOOL)a4 useSentenceCase:(BOOL)a5
{
  BOOL v5 = a4;
  id v6 = [a1 descriptionForEvents:a3 includeLearnMore:a4 useSentenceCase:a5];
  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v6];
    if (v5)
    {
      uint64_t v8 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D2C0] scale:1];
      id v9 = [MEMORY[0x263F1C6B0] systemImageNamed:@"chevron.forward" withConfiguration:v8];
      long long v10 = [MEMORY[0x263F1C370] textAttachmentWithImage:v9];
      int v11 = IsUIRTL();
      id v12 = objc_alloc(MEMORY[0x263F086A0]);
      long long v13 = v12;
      if (v11)
      {
        v14 = (void *)[v12 initWithString:@"\n"];
        [v7 appendAttributedString:v14];

        uint64_t v15 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v10];
        [v7 appendAttributedString:v15];

        id v16 = objc_alloc(MEMORY[0x263F086A0]);
        uint64_t v17 = NSString;
        unint64_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        unint64_t v19 = [v18 localizedStringForKey:@"SEVERE_WEATHER_DESCRIPTION_LEARN_MORE" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
        v20 = [v17 stringWithFormat:@" %@", v19];
        v21 = (void *)[v16 initWithString:v20];
        [v7 appendAttributedString:v21];
      }
      else
      {
        v22 = NSString;
        v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v24 = [v23 localizedStringForKey:@"SEVERE_WEATHER_DESCRIPTION_LEARN_MORE" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
        v25 = [v22 stringWithFormat:@" %@ ", v24];
        v26 = (void *)[v13 initWithString:v25];
        [v7 appendAttributedString:v26];

        unint64_t v18 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v10];
        [v7 appendAttributedString:v18];
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_displayDescriptionForEvent:(id)a3 useSentenceCase:(BOOL)a4 isFirstEvent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [v8 eventDescription];
  long long v10 = v9;
  if (v6)
  {
    int v11 = [v9 lowercaseString];
    if (v5)
    {
      uint64_t v12 = [a1 _capitalizeFirstWordOfString:v11];

      int v11 = (void *)v12;
    }

    long long v10 = v11;
  }

  return v10;
}

+ (id)_capitalizeFirstWordOfString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[v3 mutableCopy];
  uint64_t v17 = 0;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3010000000;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  v14 = "";
  uint64_t v5 = [v3 length];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__WASevereWeatherStringBuilder__capitalizeFirstWordOfString___block_invoke;
  v10[3] = &unk_2647E0F18;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 1027, v10);
  BOOL v6 = (void *)v18[5];
  if (v6)
  {
    id v7 = v12;
    id v8 = [v6 localizedCapitalizedString];
    objc_msgSend(v4, "replaceCharactersInRange:withString:", v7[4], v7[5], v8);
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v4;
}

void __61__WASevereWeatherStringBuilder__capitalizeFirstWordOfString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v12 = a2;
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v13 + 32) = a3;
  *(void *)(v13 + 40) = a4;

  *a7 = 1;
}

@end
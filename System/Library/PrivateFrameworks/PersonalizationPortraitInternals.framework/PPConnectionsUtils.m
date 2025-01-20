@interface PPConnectionsUtils
+ (BOOL)isClientAuthorizedForSemanticTriggers:(id)a3;
+ (BOOL)isValidLinguisticQuery:(id)a3;
+ (BOOL)shouldAggregateLabel:(id)a3 withValue:(id)a4 query:(id)a5;
+ (id)calendarUserActivityExternalIDKey;
+ (id)calendarUserActivityIdentifier;
+ (id)supportedLocationSemanticTypes;
+ (id)triggerTypeFromQuery:(id)a3;
+ (unsigned)locationFieldFromSemanticTag:(unsigned __int8)a3;
@end

@implementation PPConnectionsUtils

+ (id)calendarUserActivityExternalIDKey
{
  return @"com.apple.calendarUIKit.userActivity.externalID";
}

+ (id)calendarUserActivityIdentifier
{
  return @"com.apple.calendar.continuity.event_selection";
}

+ (unsigned)locationFieldFromSemanticTag:(unsigned __int8)a3
{
  if ((a3 - 1) > 0x10) {
    return 0;
  }
  else {
    return byte_1CAB7BC58[(a3 - 1)];
  }
}

+ (id)triggerTypeFromQuery:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() isValidLinguisticQuery:v3])
  {
    if ([v3 subtype] == 6)
    {
      if ([v3 fields])
      {
        v4 = @"phone";
      }
      else if (([v3 fields] & 4) != 0)
      {
        v4 = @"location";
      }
      else
      {
        v4 = @"unknown";
      }
    }
    else
    {
      v4 = @"unknown";
      if ([v3 subtype] == 7 && (objc_msgSend(v3, "fields") & 4) != 0) {
        v4 = @"address";
      }
    }
  }
  else
  {
    v5 = [(id)objc_opt_class() supportedLocationSemanticTypes];
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v3, "semanticTag"));
    int v7 = [v5 containsObject:v6];

    if (v7) {
      v4 = @"semantic";
    }
    else {
      v4 = @"unknown";
    }
  }

  return v4;
}

+ (BOOL)shouldAggregateLabel:(id)a3 withValue:(id)a4 query:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(id)objc_opt_class() isValidLinguisticQuery:v9]
    && [v9 subtype] != 7)
  {
    char v12 = [v9 fields];
    LOBYTE(v10) = 0;
    if (v7 && (v12 & 1) == 0) {
      int v10 = [v7 isEqualToString:v8] ^ 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (BOOL)isValidLinguisticQuery:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 3
    && ([v3 subtype] == 6 || objc_msgSend(v3, "subtype") == 7))
  {
    if ([v3 fields]) {
      LOBYTE(v4) = 1;
    }
    else {
      unsigned int v4 = ([v3 fields] >> 2) & 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (BOOL)isClientAuthorizedForSemanticTriggers:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:*MEMORY[0x1E4F8A0E8]]) {
    BOOL v5 = [v3 semanticTag] == 1;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

+ (id)supportedLocationSemanticTypes
{
  if (supportedLocationSemanticTypes_onceToken != -1) {
    dispatch_once(&supportedLocationSemanticTypes_onceToken, &__block_literal_global_3014);
  }
  v2 = (void *)supportedLocationSemanticTypes_supportedLocationSemanticTypes;
  return v2;
}

void __52__PPConnectionsUtils_supportedLocationSemanticTypes__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F2568C18, &unk_1F2568C30, &unk_1F2568C48, &unk_1F2568C60, &unk_1F2568C78, &unk_1F2568C90, &unk_1F2568CA8, &unk_1F2568CC0, 0);
  v2 = (void *)supportedLocationSemanticTypes_supportedLocationSemanticTypes;
  supportedLocationSemanticTypes_supportedLocationSemanticTypes = v1;
}

@end
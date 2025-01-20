@interface NTKComplication
+ (BOOL)supportsSecureCoding;
+ (Class)_complicationClassForType:(unint64_t)a3;
+ (NTKComplication)complicationWithJSONObjectRepresentation:(id)a3;
+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3;
+ (id)allComplicationsOfType:(unint64_t)a3;
+ (id)anyComplicationOfType:(unint64_t)a3;
+ (id)nullComplication;
- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
- (NSString)appIdentifier;
- (NSString)description;
- (NSString)ntk_contactIdentifier;
- (NSString)uniqueIdentifier;
- (NTKComplication)initWithCoder:(id)a3;
- (NTKComplication)initWithComplicationType:(unint64_t)a3;
- (id)JSONObjectRepresentation;
- (id)_generateAppIdentifier;
- (id)_migrateToFamily:(int64_t)a3 withAllowedComplications:(id)a4;
- (id)awakeAfterUsingCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4;
- (id)localizedKeylineLabelText;
- (id)localizedRichKeylineLabelText;
- (id)localizedSectionHeaderName;
- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4;
- (unint64_t)complicationType;
- (unint64_t)hash;
- (unint64_t)ntk_itemType;
- (void)_setComplicationType:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation NTKComplication

- (NSString)ntk_contactIdentifier
{
  return 0;
}

- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4
{
  char v4 = a3;
  v6 = NTKLocalizedTitleForComplication(self, a4);
  if ((v4 & 2) != 0)
  {
    v7 = [(NTKComplication *)self localizedSectionHeaderName];
    v8 = [v7 localizedLowercaseString];
    v9 = [v6 localizedLowercaseString];
    char v10 = NTKEqualObjects(v8, v9);

    if ((v10 & 1) == 0)
    {
      v11 = NTKClockFaceLocalizedString(@"COMPLICATION_JOINED_DESCRIPTORS", @"%@: %@");
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", v11, v7, v6);

      v6 = (void *)v12;
    }
  }

  return v6;
}

- (unint64_t)ntk_itemType
{
  if ([(NTKComplication *)self complicationType]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)localizedSectionHeaderName
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v2 && (isKindOfClass & 1) != 0)
  {
    char v4 = [(NTKComplication *)v2 complication];
    v5 = [v4 bundleIdentifier];

    v6 = +[NTKBundleComplicationManager sharedManager];
    v7 = [v6 localizedAppNameForBundleIdentifier:v5];

    if ([v7 length]) {
      goto LABEL_39;
    }
  }
  if ([(NTKComplication *)v2 complicationType] == 2)
  {
    v8 = @"EDIT_MODE_LABEL_COMPLICATION_SECTION_ALARMS";
    v9 = @"Alarms";
LABEL_11:
    v7 = NTKCompanionClockFaceLocalizedString(v8, v9);
    goto LABEL_40;
  }
  char v10 = [(NTKComplication *)v2 ntk_sectionIdentifier];
  int v11 = [v10 isEqualToString:@"com.apple.NanoWorldClock"];

  if (v11)
  {
    v8 = @"EDIT_MODE_LABEL_COMPLICATION_SECTION_WORLD_CLOCK";
    v9 = @"World Clock";
    goto LABEL_11;
  }
  uint64_t v12 = [(NTKComplication *)v2 ntk_sectionIdentifier];
  int v13 = [v12 isEqualToString:@"com.apple.SafetyMonitorApp"];

  if (v13)
  {
    v8 = @"EDIT_MODE_LABEL_COMPLICATION_SECTION_CHECK_IN";
    v9 = @"Check In";
    goto LABEL_11;
  }
  v5 = [(NTKComplication *)v2 ntk_sectionIdentifier];
  if ([v5 isEqual:@"com.apple.nanotimekit.off"])
  {
    v14 = @"COMPLICATION_PICKER_NONE_SECTION_NAME";
    v15 = @"None";
  }
  else if ([v5 isEqual:@"com.apple.findmy"])
  {
    v14 = @"COMPLICATION_PICKER_FINDMY_SECTION_NAME";
    v15 = @"Find My";
  }
  else if ([v5 isEqual:@"com.apple.nanotimekit.controls"])
  {
    v14 = @"COMPLICATION_PICKER_CONTROLS_SECTION_NAME";
    v15 = @"Controls";
  }
  else if ([v5 isEqual:@"com.apple.nanotimekit.battery"])
  {
    v14 = @"COMPLICATION_PICKER_BATTERY_SECTION_NAME";
    v15 = @"Battery";
  }
  else if ([v5 isEqual:@"com.apple.nanotimekit.cellular"])
  {
    v14 = @"COMPLICATION_PICKER_CELLULAR_SECTION_NAME";
    v15 = @"Cellular";
  }
  else if ([v5 isEqual:@"com.apple.nanotimekit.internal"])
  {
    v14 = @"COMPLICATION_PICKER_INTERNAL_SECTION_NAME";
    v15 = @"Internal";
  }
  else if ([v5 isEqual:@"com.apple.nanotimekit.contacts"])
  {
    v14 = @"COMPLICATION_PICKER_CONTACTS_SECTION_NAME";
    v15 = @"Contacts";
  }
  else if ([v5 isEqual:@"com.apple.nanotimekit.astronomy"])
  {
    v14 = @"COMPLICATION_PICKER_ASTRONOMY_SECTION_NAME";
    v15 = @"Astronomy";
  }
  else if ([v5 isEqual:@"com.apple.nanotimekit.personalization"])
  {
    v14 = @"COMPLICATION_PICKER_PERSONALIZATION_SECTION_NAME";
    v15 = @"Personalization";
  }
  else if ([v5 isEqual:@"com.apple.nanotimekit.time"])
  {
    v14 = @"COMPLICATION_PICKER_TIME_SECTION_NAME";
    v15 = @"Time";
  }
  else if ([v5 isEqual:@"com.apple.DateComplicationsHost"])
  {
    v14 = @"COMPLICATION_PICKER_DATE_SECTION_NAME";
    v15 = @"Date";
  }
  else if ([v5 isEqual:@"com.apple.nanotimekit.siri"])
  {
    v14 = @"COMPLICATION_PICKER_SIRI_SECTION_NAME";
    v15 = @"Siri";
  }
  else
  {
    if (![v5 isEqual:@"com.apple.NanoCompass.watchkitapp.waypoints"])
    {
      v17 = +[NTKCompanion1stPartyApp appForBundleIdentifier:v5];
      v18 = v17;
      if (v17)
      {
        v7 = [v17 name];
      }
      else
      {
        v19 = +[NTKBundleComplicationManager sharedManager];
        id v20 = (id)[v19 localizedAppNameForBundleIdentifier:v5];

        +[NTKCompanionAppLibrary sharedAppLibrary];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v36 = long long v40 = 0u;
        v21 = [v36 allApps];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v38;
          while (2)
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v38 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              v27 = [v26 watchApplicationIdentifier];
              char v28 = [v27 isEqual:v5];

              if (v28)
              {
                v7 = [v26 name];
                goto LABEL_56;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v21 = NTKSharedRemoteComplicationProvider();
          v29 = [(NTKComplication *)v2 clientIdentifier];
          v7 = [v21 localizedAppNameForClientIdentifier:v29];

LABEL_56:
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v30 = (void *)MEMORY[0x1E4F19A30];
            v31 = v2;
            v32 = [v30 currentDevice];
            v33 = NTKSharedWidgetComplicationProvider((uint64_t)v32);
            v34 = [(NTKComplication *)v31 descriptor];

            v35 = [v33 infoForDescriptor:v34];

            v7 = [v35 localizedAppName];
          }
          else
          {
            v7 = NTKComplicationTypeLocalizedLabelText([(NTKComplication *)v2 complicationType]);
          }
        }
      }
      goto LABEL_39;
    }
    v14 = @"COMPLICATION_PICKER_COMPASS_WAYPOINTS";
    v15 = @"Compass";
  }
  v7 = NTKClockFaceLocalizedString(v14, v15);
LABEL_39:

LABEL_40:

  return v7;
}

+ (id)allComplicationsOfType:(unint64_t)a3
{
  char v4 = objc_msgSend(a1, "_complicationClassForType:");

  return (id)[v4 _allComplicationConfigurationsWithType:a3];
}

+ (id)anyComplicationOfType:(unint64_t)a3
{
  v3 = [a1 allComplicationsOfType:a3];
  char v4 = [v3 firstObject];

  return v4;
}

+ (id)nullComplication
{
  v2 = (void *)[objc_alloc((Class)a1) initWithComplicationType:0];

  return v2;
}

- (NTKComplication)initWithComplicationType:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NTKComplication;
  char v4 = [(NTKComplication *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_complicationType = a3;
    v6 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v7 = [v6 stringValue];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v7;

    uint64_t v9 = [(NTKComplication *)v5 _generateAppIdentifier];
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v9;
  }
  return v5;
}

- (id)_generateAppIdentifier
{
  uint64_t v3 = [(NTKComplication *)self complicationType];
  if (v3 > 37)
  {
    if ((unint64_t)(v3 - 38) >= 4)
    {
      if (v3 == 45 || v3 == 57)
      {
        char v4 = @"com.apple.nanotimekit.time";
        goto LABEL_10;
      }
LABEL_18:
      v6 = [MEMORY[0x1E4F19A30] currentDevice];
      uint64_t v7 = NTKComplicationTypesToBundleIDMappingForDevice(v6);
      v8 = [NSNumber numberWithUnsignedInteger:self->_complicationType];
      uint64_t v9 = [v7 objectForKeyedSubscript:v8];

      if (v9) {
        char v4 = (__CFString *)v9;
      }
      else {
        char v4 = @"com.apple.nanotimekit.internal";
      }

      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v3 > 12)
  {
    if (v3 == 13)
    {
      char v4 = @"com.apple.nanotimekit.battery";
    }
    else
    {
      if (v3 != 29) {
        goto LABEL_18;
      }
      char v4 = @"com.apple.nanotimekit.siri";
    }
  }
  else
  {
    if (v3)
    {
      if (v3 != 11) {
        goto LABEL_18;
      }
LABEL_9:
      char v4 = @"com.apple.nanotimekit.astronomy";
      goto LABEL_10;
    }
    char v4 = @"com.apple.nanotimekit.off";
  }
LABEL_10:

  return v4;
}

+ (Class)_complicationClassForType:(unint64_t)a3
{
  char v4 = objc_opt_class();
  return (Class)v4;
}

- (void)_setComplicationType:(unint64_t)a3
{
  self->_complicationType = a3;
}

- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[NTKComplicationController controllerClassForComplicationType:[(NTKComplication *)self complicationType] family:a3 forDevice:v6];

  return v7 != 0;
}

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithComplicationType:a3];
  v6[0] = v3;
  char v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return 0;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  if (self->_complicationType != 19) {
    return 0;
  }
  char v4 = objc_msgSend(MEMORY[0x1E4F19A30], "currentDevice", a3, a4);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2A51E7B3-1B80-4981-9F09-F725BC3A8065"];
  int v6 = [v4 supportsCapability:v5];

  if (v6) {
    return @"mind";
  }
  else {
    return 0;
  }
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 localeMatchesContext:v6]) {
    int v7 = [v5 buildVersionMatchesContext:v6] ^ 1;
  }
  else {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (NSString)description
{
  v2 = [MEMORY[0x1E4F28D60] indexSetWithIndex:self->_complicationType];
  uint64_t v3 = NTKComplicationTypeDescription(v2);

  return (NSString *)v3;
}

- (id)localizedKeylineLabelText
{
  return NTKComplicationTypeLocalizedLabelText(self->_complicationType);
}

- (id)localizedRichKeylineLabelText
{
  return NTKComplicationTypeRichLocalizedLabelText(self->_complicationType);
}

- (BOOL)isEqual:(id)a3
{
  char v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSString *)self->_uniqueIdentifier isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_uniqueIdentifier hash];
}

- (id)JSONObjectRepresentation
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t complicationType = self->_complicationType;
  if ((isKindOfClass & 1) == 0 && !complicationType)
  {
    char v5 = 0;
    goto LABEL_16;
  }
  char v5 = objc_opt_new();
  if (isKindOfClass)
  {
LABEL_9:
    if (complicationType != 56 && complicationType != 31) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (complicationType == 31)
  {
LABEL_14:
    v8 = [NSNumber numberWithUnsignedInteger:self->_complicationType];
    [v5 setObject:v8 forKeyedSubscript:@"type"];

    goto LABEL_15;
  }
  if (complicationType != 48)
  {
    if (complicationType != 56)
    {
      id v6 = NTKFaceBundleStringFromComplicationType(self->_complicationType);
      [v5 setObject:v6 forKeyedSubscript:@"app"];

      goto LABEL_9;
    }
    goto LABEL_14;
  }
LABEL_15:
  [(NTKComplication *)self _addKeysToJSONDictionary:v5];
LABEL_16:

  return v5;
}

+ (NTKComplication)complicationWithJSONObjectRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"object must be dictionary - invalid value: %@", v4 format];
  }
  char v5 = [v4 objectForKeyedSubscript:@"bundle identifier"];
  id v6 = [v4 objectForKeyedSubscript:@"bundle app identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass())))
  {
    int v7 = [v4 objectForKeyedSubscript:@"bundle app complication descriptor"];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F196C8]) initWithJSONObjectRepresentation:v7];
    }
    else {
      v8 = 0;
    }
    objc_super v12 = [MEMORY[0x1E4F59148] complicationWithBundleIdentifier:v5 appBundleIdentifier:v6 complicationDescriptor:v8];
    int v13 = +[NTKBundleComplication bundledComplicationWithComplication:v12];
  }
  else
  {
    uint64_t v9 = [v4 objectForKeyedSubscript:@"app"];
    if (!v9) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"missing value for '%@'", @"app" format];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"value for '%@' must be a string - invalid value: %@", @"app", v9 format];
    }
    uint64_t v21 = 0;
    if (!NTKFaceBundleGetComplicationTypeFromString(v9, &v21))
    {
      char v10 = [v4 objectForKeyedSubscript:@"type"];
      uint64_t v11 = [v10 unsignedIntegerValue];
      if (v10)
      {
        if (v11 == 56 || v11 == 31) {
          uint64_t v21 = v11;
        }
        else {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"NTKFaceBundleException", @"Disallowed complication type encoded: %lu", v11);
        }
      }
      else
      {
        uint64_t v21 = 31;
      }
    }
    v14 = (objc_class *)[a1 _complicationClassForType:v21];
    if (v14 != (objc_class *)objc_opt_class()
      || (+[NTKBundleComplication _revertedBundleComplicationFromJSONDictionary:v4], (v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v15 = [v14 alloc];
      v16 = (void *)[v15 _initWithComplicationType:v21 JSONDictionary:v4];
    }
    v17 = [v4 objectForKeyedSubscript:@"available"];
    int v18 = [v17 isEqual:MEMORY[0x1E4F1CC28]];

    if (v18)
    {
      id v19 = +[NTKComplicationTombstone tombstoneWithComplication:v16];
    }
    else
    {
      id v19 = v16;
    }
    int v13 = v19;
  }

  return (NTKComplication *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 24) = self->_complicationType;
  objc_storeStrong((id *)(v4 + 8), self->_uniqueIdentifier);
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t complicationType = self->_complicationType;
  id v4 = a3;
  [v4 encodeInteger:complicationType forKey:@"ComplicationTypeKey"];
  [v4 encodeInteger:2 forKey:@"ComplicationEncodingVersionKey"];
}

- (NTKComplication)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NTKComplication;
  char v5 = [(NTKComplication *)&v19 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeIntegerForKey:@"ComplicationEncodingVersionKey"];
    uint64_t v7 = [v4 decodeIntegerForKey:@"ComplicationTypeKey"];
    uint64_t v8 = v7;
    if (v6 < 2)
    {
      uint64_t v10 = NTKComplicationTypeV2fromV1Encoding(v7);
      unint64_t v9 = v10;
      v5->_unint64_t complicationType = v10;
      if (v8 && !v10)
      {
        uint64_t v11 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          unint64_t complicationType = v5->_complicationType;
          *(_DWORD *)buf = 134218496;
          uint64_t v21 = v8;
          __int16 v22 = 2048;
          unint64_t v23 = complicationType;
          __int16 v24 = 2048;
          unint64_t v25 = v6;
          _os_log_error_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_ERROR, "Unable to decode complication type. starting type: (%lu) resulting type: (%lu) version encoding: (%lu)", buf, 0x20u);
        }

        unint64_t v9 = v5->_complicationType;
      }
    }
    else
    {
      v5->_unint64_t complicationType = v7;
      unint64_t v9 = v7;
    }
    objc_super v12 = [NSNumber numberWithUnsignedInteger:v9];
    uint64_t v13 = [v12 stringValue];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v13;

    uint64_t v15 = [(NTKComplication *)v5 _generateAppIdentifier];
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v15;
  }
  return v5;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  uint64_t v3 = self;
  id v4 = v3;
  if (v3->_complicationType == 9)
  {
    uint64_t v5 = *MEMORY[0x1E4F19658];
    unint64_t v6 = [MEMORY[0x1E4F19A30] currentDevice];
    id v4 = +[NTKRemoteComplication _remoteStocksComplicationWithIdentifier:v5 forDevice:v6];
  }
  return v4;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (unint64_t)complicationType
{
  return self->_complicationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (id)_migrateToFamily:(int64_t)a3 withAllowedComplications:(id)a4
{
  if (!NTKIsRichComplicationFamily(a3)) {
    goto LABEL_12;
  }
  unint64_t v6 = [(NTKComplication *)self complicationType];
  if (v6 == 16)
  {
    if (a3 != 11)
    {
      uint64_t v7 = 1;
      goto LABEL_14;
    }
LABEL_11:
    uint64_t v7 = 8;
    goto LABEL_14;
  }
  if (v6 != 11)
  {
    if (a3 == 11)
    {
      if (v6 == 36 || v6 == 10)
      {
        uint64_t v7 = 22;
        goto LABEL_14;
      }
      if (v6 == 1) {
        goto LABEL_11;
      }
    }
LABEL_12:
    uint64_t v8 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = 40;
LABEL_14:
  uint64_t v8 = +[NTKComplication anyComplicationOfType:v7];
LABEL_15:

  return v8;
}

@end
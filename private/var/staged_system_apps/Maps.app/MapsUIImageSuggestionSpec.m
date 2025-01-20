@interface MapsUIImageSuggestionSpec
- (BOOL)inverted;
- (BOOL)isDashboardWidget;
- (BOOL)isEqual:(id)a3;
- (BOOL)showEVChargingIcon;
- (BOOL)showOnboardingMultipleVehiclesIcon;
- (BOOL)useSearchImageFallback;
- (CNContact)contact;
- (GEOFeatureStyleAttributes)mapItemAttributes;
- (GEOFeatureStyleAttributes)suggestionAttributes;
- (MapsUIImageSuggestionSpec)initWithFavorite:(id)a3;
- (MapsUIImageSuggestionSpec)initWithSuggestion:(id)a3;
- (NSString)originBundleID;
- (NSString)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4;
- (int64_t)suggestionType;
- (unint64_t)hash;
- (void)setContact:(id)a3;
- (void)setInverted:(BOOL)a3;
- (void)setIsDashboardWidget:(BOOL)a3;
- (void)setMapItemAttributes:(id)a3;
- (void)setOriginBundleID:(id)a3;
- (void)setShowEVChargingIcon:(BOOL)a3;
- (void)setShowOnboardingMultipleVehiclesIcon:(BOOL)a3;
- (void)setSuggestionAttributes:(id)a3;
- (void)setSuggestionType:(int64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation MapsUIImageSuggestionSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_originBundleID, 0);
  objc_storeStrong((id *)&self->_mapItemAttributes, 0);
  objc_storeStrong((id *)&self->_suggestionAttributes, 0);

  objc_storeStrong((id *)&self->_suggestionType, 0);
}

- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4
{
  int64_t v19 = [(MapsUIImageSuggestionSpec *)self suggestionType];
  v6 = [(MapsUIImageSuggestionSpec *)self suggestionAttributes];
  v7 = [(MapsUIImageSuggestionSpec *)self mapItemAttributes];
  v8 = [(MapsUIImageSuggestionSpec *)self originBundleID];
  BOOL v9 = [(MapsUIImageSuggestionSpec *)self showEVChargingIcon];
  BOOL v10 = [(MapsUIImageSuggestionSpec *)self showOnboardingMultipleVehiclesIcon];
  unsigned __int8 v11 = [(MapsUIImageSuggestionSpec *)self inverted];
  unsigned __int8 v12 = [(MapsUIImageSuggestionSpec *)self isDashboardWidget];
  unsigned __int8 v13 = [(MapsUIImageSpec *)self nightMode];
  unsigned __int8 v14 = [(MapsUIImageSpec *)self isRTL];
  v15 = [(MapsUIImageSuggestionSpec *)self contact];
  BYTE3(v18) = v14;
  BYTE2(v18) = v13;
  BYTE1(v18) = v12;
  LOBYTE(v18) = v11;
  v16 = +[MapsSuggestionsEntry iconForSuggestionType:suggestionAttributes:mapItemAttributes:originBundleID:screenScale:showEVChargingIcon:showOnboardingMultipleVehiclesIcon:inverted:isDashboardWidget:nightMode:isRTL:contact:](MapsSuggestionsEntry, "iconForSuggestionType:suggestionAttributes:mapItemAttributes:originBundleID:screenScale:showEVChargingIcon:showOnboardingMultipleVehiclesIcon:inverted:isDashboardWidget:nightMode:isRTL:contact:", v19, v6, v7, v8, v9, v10, a3, v18, v15);

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  [v4 setSuggestionType:[self suggestionType]];
  v5 = [(MapsUIImageSuggestionSpec *)self suggestionAttributes];
  [v4 setSuggestionAttributes:v5];

  v6 = [(MapsUIImageSuggestionSpec *)self mapItemAttributes];
  [v4 setMapItemAttributes:v6];

  v7 = [(MapsUIImageSuggestionSpec *)self originBundleID];
  [v4 setOriginBundleID:v7];

  [v4 setShowEVChargingIcon:[self showEVChargingIcon]];
  [v4 setShowOnboardingMultipleVehiclesIcon:[self showOnboardingMultipleVehiclesIcon]];
  [v4 setInverted:[self inverted]];
  [v4 setIsDashboardWidget:[self isDashboardWidget]];
  [v4 setNightMode:[self nightMode]];
  v8 = [(MapsUIImageSuggestionSpec *)self uniqueIdentifier];
  [v4 setUniqueIdentifier:v8];

  BOOL v9 = [(MapsUIImageSuggestionSpec *)self contact];
  [v4 setContact:v9];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MapsUIImageSuggestionSpec *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v24 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = [(MapsUIImageSuggestionSpec *)self suggestionType];
    if (v7 == (id)[(MapsUIImageSuggestionSpec *)v6 suggestionType])
    {
      v8 = [(MapsUIImageSuggestionSpec *)self uniqueIdentifier];
      BOOL v9 = [(MapsUIImageSuggestionSpec *)v6 uniqueIdentifier];
      if ([v8 isEqualToString:v9])
      {
        BOOL v10 = [(MapsUIImageSuggestionSpec *)self suggestionAttributes];
        unsigned __int8 v11 = [(MapsUIImageSuggestionSpec *)v6 suggestionAttributes];
        if (v10 == v11 || [v10 isEqual:v11])
        {
          unsigned __int8 v12 = [(MapsUIImageSuggestionSpec *)self mapItemAttributes];
          unsigned __int8 v13 = [(MapsUIImageSuggestionSpec *)v6 mapItemAttributes];
          if (v12 == v13 || [v12 isEqual:v13])
          {
            v29 = v12;
            unsigned __int8 v14 = [(MapsUIImageSuggestionSpec *)self originBundleID];
            v15 = [(MapsUIImageSuggestionSpec *)v6 originBundleID];
            if (v14 == v15 || (v16 = v15, unsigned int v17 = [v14 isEqual:v15], v15 = v16, v17))
            {
              uint64_t v18 = v15;
              unsigned int v19 = [(MapsUIImageSuggestionSpec *)self showEVChargingIcon];
              if (v19 == [(MapsUIImageSuggestionSpec *)v6 showEVChargingIcon]
                && (unsigned int v20 = [(MapsUIImageSuggestionSpec *)self showOnboardingMultipleVehiclesIcon], v20 == [(MapsUIImageSuggestionSpec *)v6 showOnboardingMultipleVehiclesIcon])&& (v21 = [(MapsUIImageSuggestionSpec *)self inverted], v21 == [(MapsUIImageSuggestionSpec *)v6 inverted])&& (v22 = [(MapsUIImageSuggestionSpec *)self isDashboardWidget], v22 == [(MapsUIImageSuggestionSpec *)v6 isDashboardWidget])&& (v23 = [(MapsUIImageSpec *)self nightMode], v23 == [(MapsUIImageSpec *)v6 nightMode]))
              {
                v26 = [(MapsUIImageSuggestionSpec *)self contact];
                v27 = [(MapsUIImageSuggestionSpec *)v6 contact];
                BOOL v24 = v26 == v27;
              }
              else
              {
                BOOL v24 = 0;
              }
              unsigned __int8 v14 = v28;
              v15 = v18;
            }
            else
            {
              BOOL v24 = 0;
            }
            unsigned __int8 v12 = v29;
          }
          else
          {
            BOOL v24 = 0;
          }
        }
        else
        {
          BOOL v24 = 0;
        }
      }
      else
      {
        BOOL v24 = 0;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (int64_t)suggestionType
{
  return *(void *)&self->_inverted;
}

- (unint64_t)hash
{
  v3 = +[NSNumber numberWithInteger:[(MapsUIImageSuggestionSpec *)self suggestionType]];
  unint64_t v4 = (unint64_t)[v3 hash];
  if ([(MapsUIImageSuggestionSpec *)self inverted]) {
    uint64_t v5 = 2248;
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(MapsUIImageSuggestionSpec *)self isDashboardWidget]) {
    uint64_t v6 = 4496;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v5 ^ v6;
  if ([(MapsUIImageSpec *)self nightMode]) {
    uint64_t v8 = 4496;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v7 ^ v8 ^ v4;

  return v9;
}

- (BOOL)isDashboardWidget
{
  return *(&self->super._isRTL + 2);
}

- (BOOL)inverted
{
  return *(&self->super._isRTL + 1);
}

- (GEOFeatureStyleAttributes)suggestionAttributes
{
  return (GEOFeatureStyleAttributes *)self->_suggestionType;
}

- (BOOL)showOnboardingMultipleVehiclesIcon
{
  return *(&self->super._isRTL + 4);
}

- (BOOL)showEVChargingIcon
{
  return *(&self->super._isRTL + 3);
}

- (NSString)originBundleID
{
  return (NSString *)self->_mapItemAttributes;
}

- (GEOFeatureStyleAttributes)mapItemAttributes
{
  return self->_suggestionAttributes;
}

- (CNContact)contact
{
  return (CNContact *)self->_originBundleID;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)&self->_contact->super.isa;
}

- (MapsUIImageSuggestionSpec)initWithFavorite:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsUIImageSuggestionSpec;
  uint64_t v5 = [(MapsUIImageSuggestionSpec *)&v11 init];
  if (v5)
  {
    -[MapsUIImageSuggestionSpec setSuggestionType:](v5, "setSuggestionType:", [v4 entryType]);
    uint64_t v6 = [v4 styleAttributes];
    [(MapsUIImageSuggestionSpec *)v5 setSuggestionAttributes:v6];

    uint64_t v7 = [v4 geoMapItem];
    uint64_t v8 = [v7 _styleAttributes];
    [(MapsUIImageSuggestionSpec *)v5 setMapItemAttributes:v8];

    [(MapsUIImageSuggestionSpec *)v5 setIsDashboardWidget:0];
    unint64_t v9 = [v4 uniqueIdentifier];
    [(MapsUIImageSuggestionSpec *)v5 setUniqueIdentifier:v9];
  }
  return v5;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setSuggestionType:(int64_t)a3
{
  *(void *)&self->_inverted = a3;
}

- (void)setSuggestionAttributes:(id)a3
{
}

- (void)setMapItemAttributes:(id)a3
{
}

- (void)setIsDashboardWidget:(BOOL)a3
{
  *(&self->super._isRTL + 2) = a3;
}

- (void)setInverted:(BOOL)a3
{
  *(&self->super._isRTL + 1) = a3;
}

- (void)setShowOnboardingMultipleVehiclesIcon:(BOOL)a3
{
  *(&self->super._isRTL + 4) = a3;
}

- (void)setShowEVChargingIcon:(BOOL)a3
{
  *(&self->super._isRTL + 3) = a3;
}

- (void)setOriginBundleID:(id)a3
{
}

- (void)setContact:(id)a3
{
}

- (MapsUIImageSuggestionSpec)initWithSuggestion:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MapsUIImageSuggestionSpec;
  uint64_t v5 = [(MapsUIImageSuggestionSpec *)&v27 init];
  if (v5)
  {
    -[MapsUIImageSuggestionSpec setSuggestionType:](v5, "setSuggestionType:", [v4 type]);
    uint64_t v6 = [v4 styleAttributes];
    [(MapsUIImageSuggestionSpec *)v5 setSuggestionAttributes:v6];

    uint64_t v7 = [v4 MKMapItem];
    uint64_t v8 = [v7 _styleAttributes];
    [(MapsUIImageSuggestionSpec *)v5 setMapItemAttributes:v8];

    unint64_t v9 = [v4 stringForKey:@"MapsSuggestionsOriginBundleIDKey"];
    [(MapsUIImageSuggestionSpec *)v5 setOriginBundleID:v9];

    id v10 = v4;
    if ([v10 type] != (id)11) {
      goto LABEL_4;
    }
    if (([v10 BOOLeanForKey:@"MapsSuggestionsHasEnoughChargeKey" is:1] & 1) == 0) {
      id v11 = [v10 BOOLeanForKey:@"MapsSuggestionsIsResumingAnEVRoute" is:1];
    }
    else {
LABEL_4:
    }
      id v11 = 0;

    [(MapsUIImageSuggestionSpec *)v5 setShowEVChargingIcon:v11];
    id v12 = v10;
    id v13 = [v12 type] == (id)20
        ? [v12 BOOLeanForKey:@"MapsSuggestionsVehicleSetupWithGenericIconKey" is:1]
        : 0;

    [(MapsUIImageSuggestionSpec *)v5 setShowOnboardingMultipleVehiclesIcon:v13];
    [(MapsUIImageSuggestionSpec *)v5 setIsDashboardWidget:0];
    unsigned __int8 v14 = [v12 uniqueIdentifier];
    [(MapsUIImageSuggestionSpec *)v5 setUniqueIdentifier:v14];

    if (*(void *)&v5->_inverted == 24)
    {
      if ([v12 containsKey:@"MapsSuggestionsContactAsDataKey"])
      {
        uint64_t v15 = objc_opt_class();
        v16 = [v12 dataForKey:@"MapsSuggestionsContactAsDataKey"];
        id v26 = 0;
        uint64_t v17 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v15 fromData:v16 error:&v26];
        id v18 = v26;
        originBundleID = v5->_originBundleID;
        v5->_originBundleID = (NSString *)v17;

        unsigned int v20 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          unsigned int v21 = [v18 localizedDescription];
          *(_DWORD *)buf = 138412290;
          v29 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error unarchiving contact from entry: %@", buf, 0xCu);
        }
      }
      else
      {
        id v18 = 0;
      }
      if (!v5->_originBundleID)
      {
        unsigned int v22 = [v12 stringForKey:@"MapsSuggestionsContactLikelyAppleIDKey"];
        uint64_t v23 = +[CNContact contactWithDisplayName:0 emailOrPhoneNumber:v22];
        BOOL v24 = v5->_originBundleID;
        v5->_originBundleID = (NSString *)v23;
      }
    }
  }

  return v5;
}

- (BOOL)useSearchImageFallback
{
  return 0;
}

- (id)description
{
  uint64_t v18 = objc_opt_class();
  int64_t v17 = [(MapsUIImageSuggestionSpec *)self suggestionType];
  v3 = [(MapsUIImageSuggestionSpec *)self suggestionAttributes];
  id v4 = [(MapsUIImageSuggestionSpec *)self mapItemAttributes];
  uint64_t v5 = [(MapsUIImageSuggestionSpec *)self originBundleID];
  if ([(MapsUIImageSuggestionSpec *)self showEVChargingIcon]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  uint64_t v7 = v6;
  if ([(MapsUIImageSuggestionSpec *)self showOnboardingMultipleVehiclesIcon]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  unint64_t v9 = v8;
  if ([(MapsUIImageSuggestionSpec *)self inverted]) {
    id v10 = @"YES";
  }
  else {
    id v10 = @"NO";
  }
  id v11 = v10;
  if ([(MapsUIImageSuggestionSpec *)self isDashboardWidget]) {
    id v12 = @"YES";
  }
  else {
    id v12 = @"NO";
  }
  id v13 = v12;
  if ([(MapsUIImageSpec *)self nightMode]) {
    CFStringRef v14 = @"YES";
  }
  else {
    CFStringRef v14 = @"NO";
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; suggestionType = %d, suggestionAttributes = %@, mapItemAttributes = %@; originBundleID = %@, showEVChargingIcon = %@, showOnboardingMultipleVehiclesIcon = %@, inverted = %@, isDashboardWidget = %@; nightMode = %@>",
    v18,
    self,
    v17,
    v3,
    v4,
    v5,
    v7,
    v9,
    v11,
    v13,
  uint64_t v15 = v14);

  return v15;
}

@end
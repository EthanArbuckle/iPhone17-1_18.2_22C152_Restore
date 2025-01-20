@interface WFAirQualityConditions
+ (BOOL)supportsSecureCoding;
- (BOOL)isExpired;
- (BOOL)temporarilyUnavailable;
- (NSArray)pollutants;
- (NSDate)date;
- (NSDate)expirationDate;
- (NSLocale)locale;
- (NSString)airQualityScale;
- (NSString)localizedAirQualityCategory;
- (NSString)localizedDisclaimer;
- (NSString)localizedRecommendation;
- (NSString)provider;
- (NSString)scaleIdentifier;
- (NSURL)learnMoreURL;
- (WFAQIScale)scale;
- (WFAQIScaleCategory)currentScaleCategory;
- (WFAQIScaleCategory)localizedAirQualityScaleCategory;
- (WFAirPollutant)primaryPollutant;
- (WFAirQualityConditions)initWithCoder:(id)a3;
- (WFAirQualityProviderAttribution)providerAttribution;
- (WFLocation)location;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)category;
- (unint64_t)currentCategoryIndex;
- (unint64_t)localizedAirQualityIndex;
- (unint64_t)significance;
- (void)encodeWithCoder:(id)a3;
- (void)setAirQualityIndex:(unint64_t)a3;
- (void)setAirQualityScale:(id)a3;
- (void)setCategory:(unint64_t)a3;
- (void)setCurrentCategoryIndex:(unint64_t)a3;
- (void)setCurrentScaleCategory:(id)a3;
- (void)setDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setLearnMoreURL:(id)a3;
- (void)setLocale:(id)a3;
- (void)setLocalizedAirQualityCategory:(id)a3;
- (void)setLocalizedAirQualityIndex:(unint64_t)a3;
- (void)setLocalizedAirQualityScaleCategory:(id)a3;
- (void)setLocalizedDisclaimer:(id)a3;
- (void)setLocalizedRecommendation:(id)a3;
- (void)setLocation:(id)a3;
- (void)setPollutants:(id)a3;
- (void)setPrimaryPollutant:(id)a3;
- (void)setProvider:(id)a3;
- (void)setProviderAttribution:(id)a3;
- (void)setScale:(id)a3;
- (void)setScaleIdentifier:(id)a3;
- (void)setSignificance:(unint64_t)a3;
- (void)setTemporarilyUnavailable:(BOOL)a3;
@end

@implementation WFAirQualityConditions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFAirQualityConditions)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)WFAirQualityConditions;
  v5 = [(WFAirQualityConditions *)&v38 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityConditionsLocationKey"];
    location = v5->_location;
    v5->_location = (WFLocation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityConditionsDateKey"];
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityConditionsExpirationDateKey"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityConditionsProviderKey"];
    provider = v5->_provider;
    v5->_provider = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityConditionsLocalizedDisclaimerKey"];
    localizedDisclaimer = v5->_localizedDisclaimer;
    v5->_localizedDisclaimer = (NSString *)v14;

    v5->_localizedAirQualityIndex = [v4 decodeIntegerForKey:@"WFAirQualityConditionsLocalizedAQIKey"];
    v5->_significance = [v4 decodeIntegerForKey:@"WFAirQualityConditionsSignificanceKey"];
    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"WFAirQualityConditionsPollutantsKey"];
    pollutants = v5->_pollutants;
    v5->_pollutants = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityConditionsPrimaryPollutantKey"];
    primaryPollutant = v5->_primaryPollutant;
    v5->_primaryPollutant = (WFAirPollutant *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityConditionsLocaleKey"];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v23;

    v5->_category = [v4 decodeIntegerForKey:@"WFAirQualityConditionsCategoryKey"];
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityConditionsAirQualityScaleKey"];
    airQualityScale = v5->_airQualityScale;
    v5->_airQualityScale = (NSString *)v25;

    v5->_temporarilyUnavailable = [v4 decodeBoolForKey:@"WFAirQualityConditionsTemporarilyUnavailableKey"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityConditionsScaleIdentifierKey"];
    scaleIdentifier = v5->_scaleIdentifier;
    v5->_scaleIdentifier = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityConditionsScaleKey"];
    scale = v5->_scale;
    v5->_scale = (WFAQIScale *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityConditionsScaleCurrentCategoryKey"];
    currentScaleCategory = v5->_currentScaleCategory;
    v5->_currentScaleCategory = (WFAQIScaleCategory *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityConditionsAttributionProviderKey"];
    providerAttribution = v5->_providerAttribution;
    v5->_providerAttribution = (WFAirQualityProviderAttribution *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityConditionsLearnMoreKey"];
    learnMoreURL = v5->_learnMoreURL;
    v5->_learnMoreURL = (NSURL *)v35;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFAirQualityConditions *)self location];
  [v4 encodeObject:v5 forKey:@"WFAirQualityConditionsLocationKey"];

  uint64_t v6 = [(WFAirQualityConditions *)self date];
  [v4 encodeObject:v6 forKey:@"WFAirQualityConditionsDateKey"];

  v7 = [(WFAirQualityConditions *)self expirationDate];
  [v4 encodeObject:v7 forKey:@"WFAirQualityConditionsExpirationDateKey"];

  uint64_t v8 = [(WFAirQualityConditions *)self provider];
  [v4 encodeObject:v8 forKey:@"WFAirQualityConditionsProviderKey"];

  v9 = [(WFAirQualityConditions *)self localizedDisclaimer];
  [v4 encodeObject:v9 forKey:@"WFAirQualityConditionsLocalizedDisclaimerKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAirQualityConditions localizedAirQualityIndex](self, "localizedAirQualityIndex"), @"WFAirQualityConditionsLocalizedAQIKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAirQualityConditions significance](self, "significance"), @"WFAirQualityConditionsSignificanceKey");
  uint64_t v10 = [(WFAirQualityConditions *)self pollutants];
  [v4 encodeObject:v10 forKey:@"WFAirQualityConditionsPollutantsKey"];

  v11 = [(WFAirQualityConditions *)self primaryPollutant];
  [v4 encodeObject:v11 forKey:@"WFAirQualityConditionsPrimaryPollutantKey"];

  uint64_t v12 = [(WFAirQualityConditions *)self locale];
  [v4 encodeObject:v12 forKey:@"WFAirQualityConditionsLocaleKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAirQualityConditions category](self, "category"), @"WFAirQualityConditionsCategoryKey");
  v13 = [(WFAirQualityConditions *)self airQualityScale];
  [v4 encodeObject:v13 forKey:@"WFAirQualityConditionsAirQualityScaleKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFAirQualityConditions temporarilyUnavailable](self, "temporarilyUnavailable"), @"WFAirQualityConditionsTemporarilyUnavailableKey");
  uint64_t v14 = [(WFAirQualityConditions *)self scaleIdentifier];
  [v4 encodeObject:v14 forKey:@"WFAirQualityConditionsScaleIdentifierKey"];

  v15 = [(WFAirQualityConditions *)self scale];
  [v4 encodeObject:v15 forKey:@"WFAirQualityConditionsScaleKey"];

  v16 = [(WFAirQualityConditions *)self currentScaleCategory];
  [v4 encodeObject:v16 forKey:@"WFAirQualityConditionsScaleCurrentCategoryKey"];

  uint64_t v17 = [(WFAirQualityConditions *)self providerAttribution];
  [v4 encodeObject:v17 forKey:@"WFAirQualityConditionsAttributionProviderKey"];

  id v18 = [(WFAirQualityConditions *)self learnMoreURL];
  [v4 encodeObject:v18 forKey:@"WFAirQualityConditionsLearnMoreKey"];
}

- (BOOL)isExpired
{
  v3 = [MEMORY[0x263EFF910] date];
  id v4 = [(WFAirQualityConditions *)self expirationDate];
  BOOL v5 = [v3 compare:v4] != -1;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    id v6 = [(WFLocation *)self->_location copyWithZone:a3];
    [v5 setLocation:v6];

    v7 = (void *)[(NSDate *)self->_date copyWithZone:a3];
    [v5 setDate:v7];

    uint64_t v8 = (void *)[(NSDate *)self->_expirationDate copyWithZone:a3];
    [v5 setExpirationDate:v8];

    v9 = (void *)[(NSString *)self->_provider copyWithZone:a3];
    [v5 setProvider:v9];

    uint64_t v10 = (void *)[(NSString *)self->_localizedDisclaimer copyWithZone:a3];
    [v5 setLocalizedDisclaimer:v10];

    [v5 setLocalizedAirQualityIndex:self->_localizedAirQualityIndex];
    v11 = (void *)[(WFAQIScaleCategory *)self->_localizedAirQualityScaleCategory copy];
    [v5 setLocalizedAirQualityScaleCategory:v11];

    [v5 setSignificance:self->_significance];
    uint64_t v12 = (void *)[(NSArray *)self->_pollutants copyWithZone:a3];
    [v5 setPollutants:v12];

    v13 = (void *)[(WFAirPollutant *)self->_primaryPollutant copy];
    [v5 setPrimaryPollutant:v13];

    uint64_t v14 = (void *)[(NSLocale *)self->_locale copyWithZone:a3];
    [v5 setLocale:v14];

    [v5 setCategory:self->_category];
    [v5 setTemporarilyUnavailable:self->_temporarilyUnavailable];
    [v5 setScaleIdentifier:self->_scaleIdentifier];
    [v5 setScale:self->_scale];
    [v5 setCurrentScaleCategory:self->_currentScaleCategory];
    [v5 setProviderAttribution:self->_providerAttribution];
    [v5 setLearnMoreURL:self->_learnMoreURL];
  }
  return v5;
}

- (id)description
{
  v15 = NSString;
  v3 = [(WFAirQualityConditions *)self provider];
  id v4 = [(WFAirQualityConditions *)self providerAttribution];
  id v5 = [(WFAirQualityConditions *)self primaryPollutant];
  int64_t v6 = [(WFAirQualityConditions *)self airQualityIndex];
  unint64_t v7 = [(WFAirQualityConditions *)self significance];
  uint64_t v8 = [(WFAirQualityConditions *)self learnMoreURL];
  unint64_t v9 = [(WFAirQualityConditions *)self currentCategoryIndex];
  uint64_t v10 = [(WFAirQualityConditions *)self currentScaleCategory];
  v11 = [(WFAirQualityConditions *)self scaleIdentifier];
  uint64_t v12 = [(WFAirQualityConditions *)self scale];
  v13 = [v15 stringWithFormat:@"<WFAirQualityConditions provider: %@, providerAttribution: %@, primaryPollutant: %@, airQualityIndex: %lu, significance: %lu, learnMoreURL: %@, currentCategoryIndex: %lu, currentScaleCategory: %@, scaleIdentifier: %@, scale: %@>", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (id)debugDescription
{
  v20 = NSString;
  uint64_t v19 = [(WFAirQualityConditions *)self location];
  id v18 = [(WFAirQualityConditions *)self date];
  uint64_t v17 = [(WFAirQualityConditions *)self expirationDate];
  BOOL v16 = [(WFAirQualityConditions *)self isExpired];
  BOOL v15 = [(WFAirQualityConditions *)self temporarilyUnavailable];
  uint64_t v14 = [(WFAirQualityConditions *)self provider];
  v3 = [(WFAirQualityConditions *)self providerAttribution];
  id v4 = [(WFAirQualityConditions *)self pollutants];
  id v5 = [(WFAirQualityConditions *)self primaryPollutant];
  int64_t v13 = [(WFAirQualityConditions *)self airQualityIndex];
  unint64_t v6 = [(WFAirQualityConditions *)self significance];
  unint64_t v7 = [(WFAirQualityConditions *)self learnMoreURL];
  unint64_t v8 = [(WFAirQualityConditions *)self currentCategoryIndex];
  unint64_t v9 = [(WFAirQualityConditions *)self currentScaleCategory];
  uint64_t v10 = [(WFAirQualityConditions *)self scaleIdentifier];
  v11 = [(WFAirQualityConditions *)self scale];
  uint64_t v21 = [v20 stringWithFormat:@"<WFAirQualityConditions location: %@, date: %@, expirationDate: %@, isExpired: %d, temporarilyUnavailable: %d, provider: %@, providerAttribution: %@, pollutants: %@, primaryPollutant: %@, airQualityIndex: %lu, significance: %lu, learnMoreURL: %@, currentCategoryIndex: %lu, currentScaleCategory: %@, scaleIdentifier: %@, scale: %@>", v19, v18, v17, v16, v15, v14, v3, v4, v5, v13, v6, v7, v8, v9, v10, v11];

  return v21;
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)temporarilyUnavailable
{
  return self->_temporarilyUnavailable;
}

- (void)setTemporarilyUnavailable:(BOOL)a3
{
  self->_temporarilyUnavailable = a3;
}

- (NSString)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (WFAirQualityProviderAttribution)providerAttribution
{
  return self->_providerAttribution;
}

- (void)setProviderAttribution:(id)a3
{
}

- (NSString)scaleIdentifier
{
  return self->_scaleIdentifier;
}

- (void)setScaleIdentifier:(id)a3
{
}

- (WFAQIScale)scale
{
  return self->_scale;
}

- (void)setScale:(id)a3
{
}

- (void)setAirQualityIndex:(unint64_t)a3
{
  self->_airQualityIndex = a3;
}

- (WFAQIScaleCategory)currentScaleCategory
{
  return self->_currentScaleCategory;
}

- (void)setCurrentScaleCategory:(id)a3
{
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
}

- (unint64_t)significance
{
  return self->_significance;
}

- (void)setSignificance:(unint64_t)a3
{
  self->_significance = a3;
}

- (NSArray)pollutants
{
  return self->_pollutants;
}

- (void)setPollutants:(id)a3
{
}

- (WFAirPollutant)primaryPollutant
{
  return self->_primaryPollutant;
}

- (void)setPrimaryPollutant:(id)a3
{
}

- (unint64_t)currentCategoryIndex
{
  return self->_currentCategoryIndex;
}

- (void)setCurrentCategoryIndex:(unint64_t)a3
{
  self->_currentCategoryIndex = a3;
}

- (NSString)localizedRecommendation
{
  return self->_localizedRecommendation;
}

- (void)setLocalizedRecommendation:(id)a3
{
}

- (NSString)localizedDisclaimer
{
  return self->_localizedDisclaimer;
}

- (void)setLocalizedDisclaimer:(id)a3
{
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)localizedAirQualityCategory
{
  return self->_localizedAirQualityCategory;
}

- (void)setLocalizedAirQualityCategory:(id)a3
{
}

- (NSString)airQualityScale
{
  return self->_airQualityScale;
}

- (void)setAirQualityScale:(id)a3
{
}

- (unint64_t)localizedAirQualityIndex
{
  return self->_localizedAirQualityIndex;
}

- (void)setLocalizedAirQualityIndex:(unint64_t)a3
{
  self->_localizedAirQualityIndex = a3;
}

- (WFAQIScaleCategory)localizedAirQualityScaleCategory
{
  return self->_localizedAirQualityScaleCategory;
}

- (void)setLocalizedAirQualityScaleCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAirQualityScaleCategory, 0);
  objc_storeStrong((id *)&self->_airQualityScale, 0);
  objc_storeStrong((id *)&self->_localizedAirQualityCategory, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_localizedDisclaimer, 0);
  objc_storeStrong((id *)&self->_localizedRecommendation, 0);
  objc_storeStrong((id *)&self->_primaryPollutant, 0);
  objc_storeStrong((id *)&self->_pollutants, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_currentScaleCategory, 0);
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_scaleIdentifier, 0);
  objc_storeStrong((id *)&self->_providerAttribution, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
@interface PGSingleAssetSuggestion
- (BOOL)containsUnverifiedPersons;
- (BOOL)isInvalid;
- (NSArray)keyAssets;
- (NSArray)reasons;
- (NSArray)representativeAssets;
- (NSArray)suggestedPersonLocalIdentifiers;
- (NSDate)creationDate;
- (NSDate)universalEndDate;
- (NSDate)universalStartDate;
- (NSSet)features;
- (NSString)description;
- (NSString)subtitle;
- (NSString)title;
- (PGSingleAssetSuggestion)initWithType:(unsigned __int16)a3 subtype:(unsigned __int16)a4 asset:(id)a5;
- (double)score;
- (id)recipe;
- (int64_t)version;
- (unint64_t)availableFeatures;
- (unint64_t)relevanceDurationInDays;
- (unsigned)notificationQuality;
- (unsigned)notificationState;
- (unsigned)state;
- (unsigned)subtype;
- (unsigned)type;
- (void)setAvailableFeatures:(unint64_t)a3;
- (void)setIsInvalid:(BOOL)a3;
- (void)setReasons:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setRelevanceDurationInDays:(unint64_t)a3;
- (void)setScore:(double)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PGSingleAssetSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_recipe, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setAvailableFeatures:(unint64_t)a3
{
  self->_availableFeatures = a3;
}

- (unint64_t)availableFeatures
{
  return self->_availableFeatures;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setReasons:(id)a3
{
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setRelevanceDurationInDays:(unint64_t)a3
{
  self->_relevanceDurationInDays = a3;
}

- (unint64_t)relevanceDurationInDays
{
  return self->_relevanceDurationInDays;
}

- (void)setRecipe:(id)a3
{
}

- (id)recipe
{
  return self->_recipe;
}

- (NSSet)features
{
  return self->_features;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)description
{
  unint64_t relevanceDurationInDays = self->_relevanceDurationInDays;
  if (relevanceDurationInDays)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"relevant for %lu days", relevanceDurationInDays);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1F283BC78;
  }
  v11.receiver = self;
  v11.super_class = (Class)PGSingleAssetSuggestion;
  v5 = [(PGSingleAssetSuggestion *)&v11 description];
  v6 = PHSuggestionStringWithType();
  v7 = PHSuggestionStringWithSubtype();
  v8 = [(PHAsset *)self->_asset uuid];
  v9 = [v5 stringByAppendingFormat:@": type=%@, subtype=%@, assetUUID=%@, %@features=%@", v6, v7, v8, v4, self->_features];

  return (NSString *)v9;
}

- (BOOL)containsUnverifiedPersons
{
  return 0;
}

- (NSArray)suggestedPersonLocalIdentifiers
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (unsigned)notificationQuality
{
  return 0;
}

- (NSDate)universalEndDate
{
  return [(PHAsset *)self->_asset creationDate];
}

- (NSDate)universalStartDate
{
  return [(PHAsset *)self->_asset creationDate];
}

- (NSDate)creationDate
{
  return 0;
}

- (NSArray)representativeAssets
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)keyAssets
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_asset)
  {
    v4[0] = self->_asset;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v2;
}

- (unsigned)notificationState
{
  return 0;
}

- (unsigned)state
{
  return 0;
}

- (int64_t)version
{
  return 3;
}

- (PGSingleAssetSuggestion)initWithType:(unsigned __int16)a3 subtype:(unsigned __int16)a4 asset:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PGSingleAssetSuggestion;
  v10 = [(PGSingleAssetSuggestion *)&v13 init];
  objc_super v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_subtype = a4;
    objc_storeStrong((id *)&v10->_asset, a5);
  }

  return v11;
}

@end
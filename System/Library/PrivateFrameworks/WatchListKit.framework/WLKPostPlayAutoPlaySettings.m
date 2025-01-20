@interface WLKPostPlayAutoPlaySettings
- (BOOL)_compareOptional:(id)a3 with:(id)a4;
- (BOOL)_hasValues;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSettings:(id)a3;
- (NSNumber)nextEpisodeSettingValue;
- (NSNumber)recommendedItemsSettingValue;
- (id)_newSettingsMergedWithPreviousSettings:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setNextEpisodeSettingValue:(id)a3;
- (void)setRecommendedItemsSettingValue:(id)a3;
@end

@implementation WLKPostPlayAutoPlaySettings

- (void)setRecommendedItemsSettingValue:(id)a3
{
}

- (void)setNextEpisodeSettingValue:(id)a3
{
}

- (NSNumber)recommendedItemsSettingValue
{
  return self->_recommendedItemsSettingValue;
}

- (NSNumber)nextEpisodeSettingValue
{
  return self->_nextEpisodeSettingValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedItemsSettingValue, 0);

  objc_storeStrong((id *)&self->_nextEpisodeSettingValue, 0);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<WLKPostPlayAutoPlaySettings: %p>, nextEpisode = %@, recommendedItems = %@", self, self->_nextEpisodeSettingValue, self->_recommendedItemsSettingValue];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WLKPostPlayAutoPlaySettings *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(WLKPostPlayAutoPlaySettings *)self isEqualToSettings:v4];
  }

  return v5;
}

- (BOOL)isEqualToSettings:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    nextEpisodeSettingValue = self->_nextEpisodeSettingValue;
    v7 = [v4 nextEpisodeSettingValue];
    if (nextEpisodeSettingValue == v7)
    {
      recommendedItemsSettingValue = self->_recommendedItemsSettingValue;
      v10 = [v5 recommendedItemsSettingValue];
      if (recommendedItemsSettingValue == v10)
      {
        v11 = self->_nextEpisodeSettingValue;
        v12 = [v5 nextEpisodeSettingValue];
        if ([(WLKPostPlayAutoPlaySettings *)self _compareOptional:v11 with:v12])
        {
          v13 = self->_recommendedItemsSettingValue;
          v14 = [v5 recommendedItemsSettingValue];
          BOOL v8 = [(WLKPostPlayAutoPlaySettings *)self _compareOptional:v13 with:v14];
        }
        else
        {
          BOOL v8 = 0;
        }
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_nextEpisodeSettingValue hash];
  return [(NSNumber *)self->_recommendedItemsSettingValue hash] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(WLKPostPlayAutoPlaySettings);
  uint64_t v5 = [(NSNumber *)self->_nextEpisodeSettingValue copy];
  nextEpisodeSettingValue = v4->_nextEpisodeSettingValue;
  v4->_nextEpisodeSettingValue = (NSNumber *)v5;

  uint64_t v7 = [(NSNumber *)self->_recommendedItemsSettingValue copy];
  recommendedItemsSettingValue = v4->_recommendedItemsSettingValue;
  v4->_recommendedItemsSettingValue = (NSNumber *)v7;

  return v4;
}

- (BOOL)_compareOptional:(id)a3 with:(id)a4
{
  if (a3 && a4) {
    return [a3 isEqual:a4];
  }
  else {
    return ((unint64_t)a3 | (unint64_t)a4) == 0;
  }
}

- (BOOL)_hasValues
{
  uint64_t v3 = [(WLKPostPlayAutoPlaySettings *)self nextEpisodeSettingValue];

  if (v3) {
    return 1;
  }
  uint64_t v5 = [(WLKPostPlayAutoPlaySettings *)self recommendedItemsSettingValue];
  BOOL v4 = v5 != 0;

  return v4;
}

- (id)_newSettingsMergedWithPreviousSettings:(id)a3
{
  BOOL v4 = (WLKPostPlayAutoPlaySettings *)a3;
  uint64_t v5 = objc_alloc_init(WLKPostPlayAutoPlaySettings);
  v6 = [(WLKPostPlayAutoPlaySettings *)self nextEpisodeSettingValue];

  uint64_t v7 = self;
  if (v6
    || ([(WLKPostPlayAutoPlaySettings *)v4 nextEpisodeSettingValue],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        uint64_t v7 = v4,
        v8))
  {
    v9 = [(WLKPostPlayAutoPlaySettings *)v7 nextEpisodeSettingValue];
    [(WLKPostPlayAutoPlaySettings *)v5 setNextEpisodeSettingValue:v9];
  }
  v10 = [(WLKPostPlayAutoPlaySettings *)self recommendedItemsSettingValue];

  if (v10
    || ([(WLKPostPlayAutoPlaySettings *)v4 recommendedItemsSettingValue],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        self = v4,
        v11))
  {
    v12 = [(WLKPostPlayAutoPlaySettings *)self recommendedItemsSettingValue];
    [(WLKPostPlayAutoPlaySettings *)v5 setRecommendedItemsSettingValue:v12];
  }
  return v5;
}

@end
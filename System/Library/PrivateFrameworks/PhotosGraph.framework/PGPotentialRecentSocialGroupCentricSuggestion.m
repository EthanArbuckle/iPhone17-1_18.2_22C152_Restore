@interface PGPotentialRecentSocialGroupCentricSuggestion
- (NSArray)assets;
- (NSArray)momentLocalIdentifiers;
- (NSArray)personLocalIdentifiers;
- (NSArray)personWeights;
- (NSDate)notSeenSinceDate;
- (PGPotentialRecentSocialGroupCentricSuggestion)initWithPersonLocalIdentifiers:(id)a3 personWeights:(id)a4 momentLocalIdentifiers:(id)a5 weight:(float)a6 notSeenSinceDate:(id)a7;
- (float)weight;
- (void)setAssets:(id)a3;
- (void)setNotSeenSinceDate:(id)a3;
@end

@implementation PGPotentialRecentSocialGroupCentricSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notSeenSinceDate, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_momentLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_personWeights, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

- (void)setNotSeenSinceDate:(id)a3
{
}

- (NSDate)notSeenSinceDate
{
  return self->_notSeenSinceDate;
}

- (void)setAssets:(id)a3
{
}

- (NSArray)assets
{
  return self->_assets;
}

- (float)weight
{
  return self->_weight;
}

- (NSArray)momentLocalIdentifiers
{
  return self->_momentLocalIdentifiers;
}

- (NSArray)personWeights
{
  return self->_personWeights;
}

- (NSArray)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (PGPotentialRecentSocialGroupCentricSuggestion)initWithPersonLocalIdentifiers:(id)a3 personWeights:(id)a4 momentLocalIdentifiers:(id)a5 weight:(float)a6 notSeenSinceDate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PGPotentialRecentSocialGroupCentricSuggestion;
  v17 = [(PGPotentialRecentSocialGroupCentricSuggestion *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_personLocalIdentifiers, a3);
    objc_storeStrong((id *)&v18->_personWeights, a4);
    objc_storeStrong((id *)&v18->_momentLocalIdentifiers, a5);
    v18->_weight = a6;
    objc_storeStrong((id *)&v18->_notSeenSinceDate, a7);
  }

  return v18;
}

@end
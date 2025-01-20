@interface PGPotentialRecentPersonCentricSuggestion
- (NSArray)assets;
- (NSDate)notSeenSinceDate;
- (NSString)personLocalIdentifier;
- (PGPotentialRecentPersonCentricSuggestion)initWithPersonLocalIdentifier:(id)a3 assets:(id)a4 notSeenSinceDate:(id)a5;
- (PGPotentialRecentPersonCentricSuggestion)initWithPersonLocalIdentifier:(id)a3 assets:(id)a4 relationshipScore:(unint64_t)a5;
- (unint64_t)relationshipScore;
@end

@implementation PGPotentialRecentPersonCentricSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notSeenSinceDate, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
}

- (unint64_t)relationshipScore
{
  return self->_relationshipScore;
}

- (NSDate)notSeenSinceDate
{
  return self->_notSeenSinceDate;
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (PGPotentialRecentPersonCentricSuggestion)initWithPersonLocalIdentifier:(id)a3 assets:(id)a4 notSeenSinceDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGPotentialRecentPersonCentricSuggestion;
  v12 = [(PGPotentialRecentPersonCentricSuggestion *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_personLocalIdentifier, a3);
    objc_storeStrong((id *)&v13->_assets, a4);
    objc_storeStrong((id *)&v13->_notSeenSinceDate, a5);
  }

  return v13;
}

- (PGPotentialRecentPersonCentricSuggestion)initWithPersonLocalIdentifier:(id)a3 assets:(id)a4 relationshipScore:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGPotentialRecentPersonCentricSuggestion;
  id v11 = [(PGPotentialRecentPersonCentricSuggestion *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_personLocalIdentifier, a3);
    objc_storeStrong((id *)&v12->_assets, a4);
    v12->_relationshipScore = a5;
  }

  return v12;
}

@end
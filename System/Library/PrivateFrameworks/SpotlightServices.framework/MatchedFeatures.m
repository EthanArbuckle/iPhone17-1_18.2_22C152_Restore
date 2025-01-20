@interface MatchedFeatures
- (NSArray)matchedTypes;
- (NSMutableArray)matchedPositions;
- (double)characterMatchRatio;
- (double)tokenMatchRatio;
- (id)initMatchedFeaturesTokenIndex:(unint64_t)a3 photoFeatureIndex:(unint64_t)a4 matchedPositions:(id)a5 tokenMatchRatio:(double)a6 characterMatchRatio:(double)a7 matchedTypes:(id)a8;
- (unint64_t)photoFeatureIndex;
- (unint64_t)tokenIndex;
- (void)setCharacterMatchRatio:(double)a3;
- (void)setMatchedPositions:(id)a3;
- (void)setMatchedTypes:(id)a3;
- (void)setPhotoFeatureIndex:(unint64_t)a3;
- (void)setTokenIndex:(unint64_t)a3;
- (void)setTokenMatchRatio:(double)a3;
@end

@implementation MatchedFeatures

- (id)initMatchedFeaturesTokenIndex:(unint64_t)a3 photoFeatureIndex:(unint64_t)a4 matchedPositions:(id)a5 tokenMatchRatio:(double)a6 characterMatchRatio:(double)a7 matchedTypes:(id)a8
{
  id v14 = a5;
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)MatchedFeatures;
  v16 = [(MatchedFeatures *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(MatchedFeatures *)v16 setTokenIndex:a3];
    [(MatchedFeatures *)v17 setPhotoFeatureIndex:a4];
    [(MatchedFeatures *)v17 setMatchedPositions:v14];
    [(MatchedFeatures *)v17 setTokenMatchRatio:a6];
    [(MatchedFeatures *)v17 setCharacterMatchRatio:a7];
    [(MatchedFeatures *)v17 setMatchedTypes:v15];
  }

  return v17;
}

- (unint64_t)tokenIndex
{
  return self->_tokenIndex;
}

- (void)setTokenIndex:(unint64_t)a3
{
  self->_tokenIndex = a3;
}

- (unint64_t)photoFeatureIndex
{
  return self->_photoFeatureIndex;
}

- (void)setPhotoFeatureIndex:(unint64_t)a3
{
  self->_photoFeatureIndex = a3;
}

- (double)tokenMatchRatio
{
  return self->_tokenMatchRatio;
}

- (void)setTokenMatchRatio:(double)a3
{
  self->_tokenMatchRatio = a3;
}

- (double)characterMatchRatio
{
  return self->_characterMatchRatio;
}

- (void)setCharacterMatchRatio:(double)a3
{
  self->_characterMatchRatio = a3;
}

- (NSMutableArray)matchedPositions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMatchedPositions:(id)a3
{
}

- (NSArray)matchedTypes
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMatchedTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedTypes, 0);
  objc_storeStrong((id *)&self->_matchedPositions, 0);
}

@end
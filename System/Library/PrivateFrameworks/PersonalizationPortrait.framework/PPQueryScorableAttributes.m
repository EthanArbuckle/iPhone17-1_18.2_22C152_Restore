@interface PPQueryScorableAttributes
- (NSData)portraitFeatureVector;
- (NSDictionary)portraitNamedEntities;
- (NSNumber)portraitFeatureVectorVersion;
- (NSNumber)portraitStaticScore;
- (void)setPortraitFeatureVector:(id)a3;
- (void)setPortraitFeatureVectorVersion:(id)a3;
- (void)setPortraitNamedEntities:(id)a3;
- (void)setPortraitStaticScore:(id)a3;
@end

@implementation PPQueryScorableAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portraitNamedEntities, 0);
  objc_storeStrong((id *)&self->_portraitFeatureVectorVersion, 0);
  objc_storeStrong((id *)&self->_portraitFeatureVector, 0);
  objc_storeStrong((id *)&self->_portraitStaticScore, 0);
}

- (void)setPortraitNamedEntities:(id)a3
{
}

- (NSDictionary)portraitNamedEntities
{
  return self->_portraitNamedEntities;
}

- (void)setPortraitFeatureVectorVersion:(id)a3
{
}

- (NSNumber)portraitFeatureVectorVersion
{
  return self->_portraitFeatureVectorVersion;
}

- (void)setPortraitFeatureVector:(id)a3
{
}

- (NSData)portraitFeatureVector
{
  return self->_portraitFeatureVector;
}

- (void)setPortraitStaticScore:(id)a3
{
}

- (NSNumber)portraitStaticScore
{
  return self->_portraitStaticScore;
}

@end
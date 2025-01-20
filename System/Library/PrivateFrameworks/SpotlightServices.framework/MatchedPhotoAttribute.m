@interface MatchedPhotoAttribute
- (NSArray)boundingBox;
- (NSMutableArray)totalFeaturesNum;
- (NSMutableArray)types;
- (SSTokenizedString)feature;
- (double)confidence;
- (id)initPhotoFeature:(id)a3 matchedType:(unint64_t)a4 totalFeaturesNum:(id)a5 confidence:(double)a6 boundingBox:(id)a7;
- (unint64_t)tokenLength;
- (unint64_t)tokenNum;
- (void)setBoundingBox:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setFeature:(id)a3;
- (void)setTokenLength:(unint64_t)a3;
- (void)setTokenNum:(unint64_t)a3;
- (void)setTotalFeaturesNum:(id)a3;
- (void)setTypes:(id)a3;
@end

@implementation MatchedPhotoAttribute

- (id)initPhotoFeature:(id)a3 matchedType:(unint64_t)a4 totalFeaturesNum:(id)a5 confidence:(double)a6 boundingBox:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)MatchedPhotoAttribute;
  v15 = [(MatchedPhotoAttribute *)&v24 init];
  v16 = v15;
  if (v15)
  {
    [(MatchedPhotoAttribute *)v15 setFeature:v12];
    v17 = [v12 tokens];
    -[MatchedPhotoAttribute setTokenNum:](v16, "setTokenNum:", [v17 count]);

    v18 = [v12 original];
    -[MatchedPhotoAttribute setTokenLength:](v16, "setTokenLength:", [v18 length]);

    v19 = (void *)MEMORY[0x1E4F1CA48];
    v20 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
    v21 = [v19 arrayWithObject:v20];
    [(MatchedPhotoAttribute *)v16 setTypes:v21];

    v22 = [MEMORY[0x1E4F1CA48] arrayWithObject:v13];
    [(MatchedPhotoAttribute *)v16 setTotalFeaturesNum:v22];

    [(MatchedPhotoAttribute *)v16 setConfidence:a6];
    [(MatchedPhotoAttribute *)v16 setBoundingBox:v14];
  }

  return v16;
}

- (SSTokenizedString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
}

- (unint64_t)tokenNum
{
  return self->_tokenNum;
}

- (void)setTokenNum:(unint64_t)a3
{
  self->_tokenNum = a3;
}

- (unint64_t)tokenLength
{
  return self->_tokenLength;
}

- (void)setTokenLength:(unint64_t)a3
{
  self->_tokenLength = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (NSArray)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(id)a3
{
}

- (NSMutableArray)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
}

- (NSMutableArray)totalFeaturesNum
{
  return self->_totalFeaturesNum;
}

- (void)setTotalFeaturesNum:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalFeaturesNum, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_boundingBox, 0);
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
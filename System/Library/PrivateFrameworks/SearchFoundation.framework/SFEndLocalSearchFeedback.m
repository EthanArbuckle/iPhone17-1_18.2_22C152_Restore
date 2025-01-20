@interface SFEndLocalSearchFeedback
+ (BOOL)supportsSecureCoding;
- (SFEndLocalSearchFeedback)initWithCoder:(id)a3;
- (SFEndLocalSearchFeedback)initWithStartSearch:(id)a3;
- (SFEndLocalSearchFeedback)initWithStartSearch:(id)a3 queryUnderstandingParse:(id)a4;
- (SFEndLocalSearchFeedback)initWithStartSearch:(id)a3 queryUnderstandingParse:(id)a4 l1ToL2ResultCount:(unsigned int)a5 coreSpotlightIndexCount:(unsigned int)a6;
- (SFPhotosRankingInfo)photosRankingInfo;
- (SFQueryUnderstandingParse)quParse;
- (unsigned)coreSpotlightIndexCount;
- (unsigned)l1ToL2ResultCount;
- (void)encodeWithCoder:(id)a3;
- (void)setCoreSpotlightIndexCount:(unsigned int)a3;
- (void)setL1ToL2ResultCount:(unsigned int)a3;
- (void)setPhotosRankingInfo:(id)a3;
- (void)setQuParse:(id)a3;
@end

@implementation SFEndLocalSearchFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosRankingInfo, 0);
  objc_storeStrong((id *)&self->_quParse, 0);
}

- (void)setPhotosRankingInfo:(id)a3
{
}

- (SFPhotosRankingInfo)photosRankingInfo
{
  return self->_photosRankingInfo;
}

- (void)setCoreSpotlightIndexCount:(unsigned int)a3
{
  self->_coreSpotlightIndexCount = a3;
}

- (unsigned)coreSpotlightIndexCount
{
  return self->_coreSpotlightIndexCount;
}

- (void)setL1ToL2ResultCount:(unsigned int)a3
{
  self->_l1ToL2ResultCount = a3;
}

- (unsigned)l1ToL2ResultCount
{
  return self->_l1ToL2ResultCount;
}

- (void)setQuParse:(id)a3
{
}

- (SFQueryUnderstandingParse)quParse
{
  return self->_quParse;
}

- (SFEndLocalSearchFeedback)initWithStartSearch:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFEndLocalSearchFeedback;
  return [(SFEndSearchFeedback *)&v4 initWithStartSearch:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFEndLocalSearchFeedback;
  id v4 = a3;
  [(SFEndSearchFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_quParse, @"query_understanding_parse", v5.receiver, v5.super_class);
  [v4 encodeInt32:self->_l1ToL2ResultCount forKey:@"_l1ToL2ResultCount"];
  [v4 encodeInt32:self->_coreSpotlightIndexCount forKey:@"_coreSpotlightIndexCount"];
}

- (SFEndLocalSearchFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFEndLocalSearchFeedback;
  objc_super v5 = [(SFEndSearchFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"query_understanding_parse"];
    quParse = v5->_quParse;
    v5->_quParse = (SFQueryUnderstandingParse *)v6;

    v5->_l1ToL2ResultCount = [v4 decodeInt32ForKey:@"_l1ToL2ResultCount"];
    v5->_coreSpotlightIndexCount = [v4 decodeInt32ForKey:@"_coreSpotlightIndexCount"];
  }

  return v5;
}

- (SFEndLocalSearchFeedback)initWithStartSearch:(id)a3 queryUnderstandingParse:(id)a4 l1ToL2ResultCount:(unsigned int)a5 coreSpotlightIndexCount:(unsigned int)a6
{
  result = [(SFEndLocalSearchFeedback *)self initWithStartSearch:a3 queryUnderstandingParse:a4];
  if (result)
  {
    result->_l1ToL2ResultCount = a5;
    result->_coreSpotlightIndexCount = a6;
  }
  return result;
}

- (SFEndLocalSearchFeedback)initWithStartSearch:(id)a3 queryUnderstandingParse:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SFEndLocalSearchFeedback;
  v8 = [(SFEndSearchFeedback *)&v11 initWithStartSearch:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_quParse, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
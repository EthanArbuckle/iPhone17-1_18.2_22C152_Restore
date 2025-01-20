@interface SFRankingFeedback
+ (BOOL)supportsSecureCoding;
- (NSArray)hiddenResults;
- (NSArray)sections;
- (NSString)l2ModelVersion;
- (NSString)l2ShadowModelVersion;
- (NSString)l3ModelVersion;
- (SFRankingFeedback)initWithCoder:(id)a3;
- (SFRankingFeedback)initWithSections:(id)a3 blendingDuration:(double)a4;
- (double)blendingDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (int)spotlightQueryIntent;
- (void)encodeWithCoder:(id)a3;
- (void)setBlendingDuration:(double)a3;
- (void)setHiddenResults:(id)a3;
- (void)setL2ModelVersion:(id)a3;
- (void)setL2ShadowModelVersion:(id)a3;
- (void)setL3ModelVersion:(id)a3;
- (void)setSections:(id)a3;
- (void)setSpotlightQueryIntent:(int)a3;
@end

@implementation SFRankingFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenResults, 0);
  objc_storeStrong((id *)&self->_l2ShadowModelVersion, 0);
  objc_storeStrong((id *)&self->_l3ModelVersion, 0);
  objc_storeStrong((id *)&self->_l2ModelVersion, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)setSpotlightQueryIntent:(int)a3
{
  self->_spotlightQueryIntent = a3;
}

- (int)spotlightQueryIntent
{
  return self->_spotlightQueryIntent;
}

- (void)setHiddenResults:(id)a3
{
}

- (NSArray)hiddenResults
{
  return self->_hiddenResults;
}

- (void)setL2ShadowModelVersion:(id)a3
{
}

- (NSString)l2ShadowModelVersion
{
  return self->_l2ShadowModelVersion;
}

- (void)setL3ModelVersion:(id)a3
{
}

- (NSString)l3ModelVersion
{
  return self->_l3ModelVersion;
}

- (void)setL2ModelVersion:(id)a3
{
}

- (NSString)l2ModelVersion
{
  return self->_l2ModelVersion;
}

- (void)setSections:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setBlendingDuration:(double)a3
{
  self->_blendingDuration = a3;
}

- (double)blendingDuration
{
  return self->_blendingDuration;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFRankingFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sections, @"sections", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"blending_duration" forKey:self->_blendingDuration];
  [v4 encodeObject:self->_l2ModelVersion forKey:@"l2ModelVersion"];
  [v4 encodeObject:self->_l3ModelVersion forKey:@"l3ModelVersion"];
  [v4 encodeObject:self->_l2ShadowModelVersion forKey:@"l2ShadowModelVersion"];
  [v4 encodeObject:self->_hiddenResults forKey:@"_hiddenResults"];
  [v4 encodeInt:self->_spotlightQueryIntent forKey:@"_spotlightQueryIntent"];
}

- (SFRankingFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFRankingFeedback;
  objc_super v5 = [(SFFeedback *)&v22 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"sections"];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v10;

    [v4 decodeDoubleForKey:@"blending_duration"];
    v5->_blendingDuration = v12;
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"l2ModelVersion"];
    l2ModelVersion = v5->_l2ModelVersion;
    v5->_l2ModelVersion = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"l3ModelVersion"];
    l3ModelVersion = v5->_l3ModelVersion;
    v5->_l3ModelVersion = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"l2ShadowModelVersion"];
    l2ShadowModelVersion = v5->_l2ShadowModelVersion;
    v5->_l2ShadowModelVersion = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClasses:v9 forKey:@"_hiddenResults"];
    hiddenResults = v5->_hiddenResults;
    v5->_hiddenResults = (NSArray *)v19;

    v5->_spotlightQueryIntent = [v4 decodeIntegerForKey:@"spotlightQueryIntent"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)SFRankingFeedback;
  id v4 = [(SFFeedback *)&v19 copyWithZone:a3];
  objc_super v5 = [(SFRankingFeedback *)self sections];
  uint64_t v6 = [v5 copy];
  uint64_t v7 = (void *)v4[5];
  v4[5] = v6;

  [(SFRankingFeedback *)self blendingDuration];
  v4[4] = v8;
  uint64_t v9 = [(NSString *)self->_l2ModelVersion copy];
  uint64_t v10 = (void *)v4[6];
  v4[6] = v9;

  uint64_t v11 = [(NSString *)self->_l3ModelVersion copy];
  double v12 = (void *)v4[7];
  v4[7] = v11;

  uint64_t v13 = [(NSString *)self->_l2ShadowModelVersion copy];
  v14 = (void *)v4[8];
  v4[8] = v13;

  uint64_t v15 = [(SFRankingFeedback *)self hiddenResults];
  uint64_t v16 = [v15 copy];
  uint64_t v17 = (void *)v4[9];
  v4[9] = v16;

  *((_DWORD *)v4 + 6) = [(SFRankingFeedback *)self spotlightQueryIntent];
  return v4;
}

- (SFRankingFeedback)initWithSections:(id)a3 blendingDuration:(double)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFRankingFeedback;
  uint64_t v7 = [(SFFeedback *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    sections = v7->_sections;
    v7->_sections = (NSArray *)v8;

    v7->_blendingDuration = a4;
    uint64_t v10 = [(NSArray *)v7->_sections firstObject];
    uint64_t v11 = [v10 results];
    double v12 = [v11 firstObject];
    v7->super._queryId = [v12 queryId];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface SFResultRankingFeedback
+ (BOOL)supportsSecureCoding;
- (NSArray)duplicateResults;
- (NSArray)hiddenResults;
- (SFResultRankingFeedback)initWithCoder:(id)a3;
- (SFResultRankingFeedback)initWithResult:(id)a3 hiddenResults:(id)a4 duplicateResults:(id)a5 localResultPosition:(unint64_t)a6;
- (SFSearchResult)result;
- (double)personalizationScore;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)localResultPosition;
- (void)encodeWithCoder:(id)a3;
- (void)setDuplicateResults:(id)a3;
- (void)setHiddenResults:(id)a3;
- (void)setLocalResultPosition:(unint64_t)a3;
- (void)setPersonalizationScore:(double)a3;
- (void)setResult:(id)a3;
@end

@implementation SFResultRankingFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateResults, 0);
  objc_storeStrong((id *)&self->_hiddenResults, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (void)setPersonalizationScore:(double)a3
{
  self->_personalizationScore = a3;
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (void)setLocalResultPosition:(unint64_t)a3
{
  self->_localResultPosition = a3;
}

- (unint64_t)localResultPosition
{
  return self->_localResultPosition;
}

- (void)setDuplicateResults:(id)a3
{
}

- (NSArray)duplicateResults
{
  return self->_duplicateResults;
}

- (void)setHiddenResults:(id)a3
{
}

- (NSArray)hiddenResults
{
  return self->_hiddenResults;
}

- (void)setResult:(id)a3
{
}

- (SFSearchResult)result
{
  return self->_result;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFResultRankingFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_personalizationScore", self->_personalizationScore, v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_localResultPosition forKey:@"_localResultPosition"];
  [v4 encodeObject:self->_result forKey:@"_result"];
  [v4 encodeObject:self->_hiddenResults forKey:@"_hiddenResults"];
  [v4 encodeObject:self->_duplicateResults forKey:@"_duplicateResults"];
}

- (SFResultRankingFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFResultRankingFeedback;
  objc_super v5 = [(SFFeedback *)&v17 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_personalizationScore"];
    v5->_personalizationScore = v6;
    v5->_localResultPosition = [v4 decodeIntegerForKey:@"_localResultPosition"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_result"];
    v8 = v5->_result;
    v5->_result = (SFSearchResult *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_hiddenResults"];
    hiddenResults = v5->_hiddenResults;
    v5->_hiddenResults = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v11 forKey:@"_duplicateResults"];
    duplicateResults = v5->_duplicateResults;
    v5->_duplicateResults = (NSArray *)v14;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SFResultRankingFeedback;
  id v4 = [(SFFeedback *)&v16 copyWithZone:a3];
  objc_super v5 = [(SFResultRankingFeedback *)self result];
  uint64_t v6 = [v5 copy];
  uint64_t v7 = (void *)v4[3];
  v4[3] = v6;

  v8 = [(SFResultRankingFeedback *)self hiddenResults];
  uint64_t v9 = [v8 copy];
  uint64_t v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = [(SFResultRankingFeedback *)self duplicateResults];
  uint64_t v12 = [v11 copy];
  v13 = (void *)v4[5];
  v4[5] = v12;

  v4[6] = [(SFResultRankingFeedback *)self localResultPosition];
  [(SFResultRankingFeedback *)self personalizationScore];
  v4[7] = v14;
  return v4;
}

- (SFResultRankingFeedback)initWithResult:(id)a3 hiddenResults:(id)a4 duplicateResults:(id)a5 localResultPosition:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SFResultRankingFeedback;
  uint64_t v14 = [(SFFeedback *)&v22 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_result, a3);
    uint64_t v16 = [v12 copy];
    hiddenResults = v15->_hiddenResults;
    v15->_hiddenResults = (NSArray *)v16;

    uint64_t v18 = [v13 copy];
    duplicateResults = v15->_duplicateResults;
    v15->_duplicateResults = (NSArray *)v18;

    v15->_localResultPosition = a6;
    [v11 personalizationScore];
    v15->_personalizationScore = v20;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
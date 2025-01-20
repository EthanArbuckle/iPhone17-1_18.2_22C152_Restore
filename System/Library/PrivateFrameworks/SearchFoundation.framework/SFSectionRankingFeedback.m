@interface SFSectionRankingFeedback
+ (BOOL)supportsSecureCoding;
- (NSArray)results;
- (SFResultSection)section;
- (SFSectionRankingFeedback)initWithCoder:(id)a3;
- (SFSectionRankingFeedback)initWithResults:(id)a3 section:(id)a4 localSectionPosition:(unint64_t)a5 personalizationScore:(double)a6;
- (double)personalizationScore;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)localSectionPosition;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalSectionPosition:(unint64_t)a3;
- (void)setPersonalizationScore:(double)a3;
- (void)setResults:(id)a3;
- (void)setSection:(id)a3;
@end

@implementation SFSectionRankingFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (void)setPersonalizationScore:(double)a3
{
  self->_personalizationScore = a3;
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (void)setLocalSectionPosition:(unint64_t)a3
{
  self->_localSectionPosition = a3;
}

- (unint64_t)localSectionPosition
{
  return self->_localSectionPosition;
}

- (void)setSection:(id)a3
{
}

- (SFResultSection)section
{
  return self->_section;
}

- (void)setResults:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFSectionRankingFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_localSectionPosition, @"local_section_position", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_section forKey:@"section"];
  [v4 encodeObject:self->_results forKey:@"results"];
  [v4 encodeDouble:@"client_score" forKey:self->_personalizationScore];
}

- (SFSectionRankingFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFSectionRankingFeedback;
  objc_super v5 = [(SFFeedback *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v5->_localSectionPosition = [v4 decodeIntegerForKey:@"local_section_position"];
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"section"];
    section = v5->_section;
    v5->_section = (SFResultSection *)v10;

    uint64_t v12 = [v4 decodeObjectOfClasses:v9 forKey:@"results"];
    results = v5->_results;
    v5->_results = (NSArray *)v12;

    [v4 decodeDoubleForKey:@"client_score"];
    v5->_personalizationScore = v14;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SFSectionRankingFeedback;
  id v4 = [(SFFeedback *)&v13 copyWithZone:a3];
  objc_super v5 = [(SFSectionRankingFeedback *)self results];
  uint64_t v6 = [v5 copy];
  uint64_t v7 = (void *)v4[3];
  v4[3] = v6;

  uint64_t v8 = [(SFSectionRankingFeedback *)self section];
  uint64_t v9 = [v8 copy];
  uint64_t v10 = (void *)v4[4];
  v4[4] = v9;

  v4[5] = [(SFSectionRankingFeedback *)self localSectionPosition];
  [(SFSectionRankingFeedback *)self personalizationScore];
  v4[6] = v11;
  return v4;
}

- (SFSectionRankingFeedback)initWithResults:(id)a3 section:(id)a4 localSectionPosition:(unint64_t)a5 personalizationScore:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SFSectionRankingFeedback;
  uint64_t v12 = [(SFFeedback *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    results = v12->_results;
    v12->_results = (NSArray *)v13;

    uint64_t v15 = [v11 copy];
    section = v12->_section;
    v12->_section = (SFResultSection *)v15;

    v12->_localSectionPosition = a5;
    v12->_personalizationScore = a6;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
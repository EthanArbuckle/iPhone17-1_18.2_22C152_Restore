@interface FCPersonalizationFavorabilityScores
+ (BOOL)supportsSecureCoding;
- (FCPersonalizationFavorabilityScores)init;
- (FCPersonalizationFavorabilityScores)initWithCoder:(id)a3;
- (FCPersonalizationFavorabilityScores)initWithPBFavorabilityScores:(id)a3;
- (NSDictionary)tagIDToScores;
- (id)scoreForTagID:(id)a3;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)setTagIDToScores:(id)a3;
@end

@implementation FCPersonalizationFavorabilityScores

void __68__FCPersonalizationFavorabilityScores_initWithPBFavorabilityScores___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSNumber;
  id v4 = a2;
  [v4 score];
  objc_msgSend(v3, "numberWithFloat:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v4 tagId];

  objc_msgSend(v2, "fc_safelySetObject:forKey:", v6, v5);
}

void __68__FCPersonalizationFavorabilityScores_initWithPBFavorabilityScores___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) scores];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__FCPersonalizationFavorabilityScores_initWithPBFavorabilityScores___block_invoke_2;
  v6[3] = &unk_1E5B4FDB8;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

- (FCPersonalizationFavorabilityScores)initWithPBFavorabilityScores:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPersonalizationFavorabilityScores;
  id v6 = [(FCPersonalizationFavorabilityScores *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pbFavorabilityScores, a3);
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__FCPersonalizationFavorabilityScores_initWithPBFavorabilityScores___block_invoke;
    v12[3] = &unk_1E5B4BF78;
    id v13 = v5;
    uint64_t v9 = objc_msgSend(v8, "fc_dictionary:", v12);
    tagIDToScores = v7->_tagIDToScores;
    v7->_tagIDToScores = (NSDictionary *)v9;
  }
  return v7;
}

- (FCPersonalizationFavorabilityScores)init
{
  return [(FCPersonalizationFavorabilityScores *)self initWithPBFavorabilityScores:0];
}

- (unint64_t)count
{
  v2 = [(FCPersonalizationFavorabilityScores *)self tagIDToScores];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)scoreForTagID:(id)a3
{
  id v4 = a3;
  id v5 = [(FCPersonalizationFavorabilityScores *)self tagIDToScores];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [(FCPersonalizationFavorabilityScores *)self tagIDToScores];
    v8 = [v7 objectForKeyedSubscript:v4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationFavorabilityScores)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"favorabilityScores"];

  id v6 = [(FCPersonalizationFavorabilityScores *)self initWithPBFavorabilityScores:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  pbFavorabilityScores = self->_pbFavorabilityScores;
  if (pbFavorabilityScores) {
    [a3 encodeObject:pbFavorabilityScores forKey:@"favorabilityScores"];
  }
}

- (NSDictionary)tagIDToScores
{
  return self->_tagIDToScores;
}

- (void)setTagIDToScores:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagIDToScores, 0);
  objc_storeStrong((id *)&self->_pbFavorabilityScores, 0);
}

@end
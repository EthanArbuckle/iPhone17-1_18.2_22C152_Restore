@interface ATXScoreNormalizationArtifactsArchive
+ (BOOL)supportsSecureCoding;
- (ATXScoreNormalizationArtifactsArchive)initWithCoder:(id)a3;
- (ATXScoreNormalizationArtifactsArchive)initWithScoreNormalizationModelsDictionary:(id)a3;
- (NSDictionary)scoreNormalizationModelsDict;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXScoreNormalizationArtifactsArchive

- (ATXScoreNormalizationArtifactsArchive)initWithScoreNormalizationModelsDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXScoreNormalizationArtifactsArchive;
  v6 = [(ATXScoreNormalizationArtifactsArchive *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_scoreNormalizationModelsDict, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(ATXScoreNormalizationArtifactsArchive *)self scoreNormalizationModelsDict];
  v6 = (void *)[v4 initWithScoreNormalizationModelsDictionary:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXScoreNormalizationArtifactsArchive *)self scoreNormalizationModelsDict];
  [v4 encodeObject:v5 forKey:@"scoreNormalizationModelsDict"];
}

- (ATXScoreNormalizationArtifactsArchive)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  objc_super v9 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v10 = [v5 decodeObjectOfClasses:v9 forKey:@"scoreNormalizationModelsDict"];

  if (v10)
  {
    self = [(ATXScoreNormalizationArtifactsArchive *)self initWithScoreNormalizationModelsDictionary:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSDictionary)scoreNormalizationModelsDict
{
  return self->_scoreNormalizationModelsDict;
}

- (void).cxx_destruct
{
}

@end
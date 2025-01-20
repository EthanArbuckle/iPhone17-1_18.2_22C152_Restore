@interface MOEventPortrait
+ (BOOL)supportsSecureCoding;
+ (id)displayNameOfScoredTopics:(id)a3;
+ (void)defineClassCollections;
- (MOEventPortrait)init;
- (MOEventPortrait)initWithCoder:(id)a3;
- (NSDictionary)scoredTopics;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setScoredTopics:(id)a3;
@end

@implementation MOEventPortrait

+ (void)defineClassCollections
{
  if (defineClassCollections_onceToken_0 != -1) {
    dispatch_once(&defineClassCollections_onceToken_0, &__block_literal_global_9);
  }
}

void __41__MOEventPortrait_defineClassCollections__block_invoke()
{
  v0 = (void *)kTopicIdNames;
  kTopicIdNames = (uint64_t)&unk_1F2932410;
}

- (MOEventPortrait)init
{
  v4.receiver = self;
  v4.super_class = (Class)MOEventPortrait;
  v2 = [(MOEventPortrait *)&v4 init];
  if (v2) {
    +[MOEventPortrait defineClassCollections];
  }
  return v2;
}

+ (id)displayNameOfScoredTopics:(id)a3
{
  id v3 = a3;
  objc_super v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MOEventPortrait_displayNameOfScoredTopics___block_invoke;
  v7[3] = &unk_1E6920A30;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __45__MOEventPortrait_displayNameOfScoredTopics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = (void *)kTopicIdNames;
  id v6 = a2;
  v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = *(void **)(a1 + 32);
  if (v7)
  {
    uint64_t v9 = [(id)kTopicIdNames objectForKeyedSubscript:v6];

    id v6 = (id)v9;
  }
  [v8 setObject:v10 forKeyedSubscript:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  scoredTopics = self->_scoredTopics;
  id v4 = a3;
  id v5 = +[MODictionaryEncoder encodeDictionary:scoredTopics];
  [v4 encodeObject:v5 forKey:@"scoredTopics"];
}

- (MOEventPortrait)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MOEventPortrait;
  id v5 = [(MOEventPortrait *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scoredTopics"];
    uint64_t v7 = +[MODictionaryEncoder decodeToDictionary:v6];
    scoredTopics = v5->_scoredTopics;
    v5->_scoredTopics = (NSDictionary *)v7;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOEventPortrait);
  objc_storeStrong((id *)&v4->_scoredTopics, self->_scoredTopics);
  return v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = +[MOEventPortrait displayNameOfScoredTopics:self->_scoredTopics];
  id v5 = (void *)[v3 initWithFormat:@"scoredTopics, %@", v4];

  return v5;
}

- (NSDictionary)scoredTopics
{
  return self->_scoredTopics;
}

- (void)setScoredTopics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
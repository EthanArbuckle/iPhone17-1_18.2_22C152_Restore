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
  if (defineClassCollections_onceToken != -1) {
    dispatch_once(&defineClassCollections_onceToken, &__block_literal_global_0);
  }
}

void __41__MOEventPortrait_defineClassCollections__block_invoke(id a1)
{
  v1 = (void *)kTopicIdNames;
  kTopicIdNames = (uint64_t)&off_1000B82E8;
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
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __45__MOEventPortrait_displayNameOfScoredTopics___block_invoke;
  v6[3] = &unk_1000A4C70;
  id v4 = (id)objc_opt_new();
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

void __45__MOEventPortrait_displayNameOfScoredTopics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  v5 = (void *)kTopicIdNames;
  id v6 = a2;
  id v7 = [v5 objectForKeyedSubscript:v6];

  v8 = *(void **)(a1 + 32);
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
  id v3 = objc_alloc((Class)NSString);
  id v4 = +[MOEventPortrait displayNameOfScoredTopics:self->_scoredTopics];
  id v5 = [v3 initWithFormat:@"scoredTopics, %@", v4];

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
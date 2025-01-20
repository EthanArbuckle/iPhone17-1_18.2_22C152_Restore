@interface FCFeedItemFeature
+ (id)featureForAllArticles;
+ (id)featureForTopicID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)queryable;
- (FCFeedItemFeature)initWithType:(int64_t)a3 key:(id)a4;
- (NSString)key;
- (int64_t)type;
- (unint64_t)hash;
- (void)setQueryable:(BOOL)a3;
@end

@implementation FCFeedItemFeature

+ (id)featureForTopicID:(id)a3
{
  id v3 = a3;
  v4 = [[FCFeedItemFeature alloc] initWithType:1 key:v3];

  return v4;
}

+ (id)featureForAllArticles
{
  if (qword_1EB5D1B48 != -1) {
    dispatch_once(&qword_1EB5D1B48, &__block_literal_global_172);
  }
  v2 = (void *)_MergedGlobals_221;
  return v2;
}

uint64_t __42__FCFeedItemFeature_featureForAllArticles__block_invoke()
{
  v0 = [[FCFeedItemFeature alloc] initWithType:2 key:@"allArticles"];
  uint64_t v1 = _MergedGlobals_221;
  _MergedGlobals_221 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (FCFeedItemFeature)initWithType:(int64_t)a3 key:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCFeedItemFeature;
  v8 = [(FCFeedItemFeature *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_int64_t type = a3;
    objc_storeStrong((id *)&v8->_key, a4);
    int64_t type = v9->_type;
    if (type == 2)
    {
      LOBYTE(type) = 0;
    }
    else if (type != 1)
    {
      goto LABEL_7;
    }
    v9->_queryable = type;
  }
LABEL_7:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  id v7 = [(FCFeedItemFeature *)self key];
  v8 = [v6 key];
  char v9 = [v7 isEqual:v8];

  return v9;
}

- (unint64_t)hash
{
  v2 = [(FCFeedItemFeature *)self key];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)queryable
{
  return self->_queryable;
}

- (void)setQueryable:(BOOL)a3
{
  self->_queryable = a3;
}

- (NSString)key
{
  return self->_key;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end
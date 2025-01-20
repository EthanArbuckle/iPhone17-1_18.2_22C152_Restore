@interface FCArticleTagsExpiration
+ (id)tagsExpirationsFromRecord:(id)a3;
- (FCArticleTagsExpiration)initWithTagsExpiration:(id)a3;
- (NSDate)expireTime;
- (NSString)tagID;
- (id)description;
@end

@implementation FCArticleTagsExpiration

+ (id)tagsExpirationsFromRecord:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v11 = [FCArticleTagsExpiration alloc];
          v12 = -[FCArticleTagsExpiration initWithTagsExpiration:](v11, "initWithTagsExpiration:", v10, (void)v14);
          [v4 addObject:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (FCArticleTagsExpiration)initWithTagsExpiration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCArticleTagsExpiration;
  id v5 = [(FCArticleTagsExpiration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 tagId];
    tagID = v5->_tagID;
    v5->_tagID = (NSString *)v6;

    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "expireUtcTime") / 1000.0);
    expireTime = v5->_expireTime;
    v5->_expireTime = (NSDate *)v8;
  }
  return v5;
}

- (id)description
{
  id v3 = [[FCDescription alloc] initWithObject:self];
  id v4 = [(FCArticleTagsExpiration *)self tagID];
  [(FCDescription *)v3 addField:@"tagID" value:v4];

  id v5 = [(FCArticleTagsExpiration *)self expireTime];
  uint64_t v6 = [v5 description];
  [(FCDescription *)v3 addField:@"expireTime" value:v6];

  uint64_t v7 = [(FCDescription *)v3 descriptionString];

  return v7;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (NSDate)expireTime
{
  return self->_expireTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expireTime, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
}

@end
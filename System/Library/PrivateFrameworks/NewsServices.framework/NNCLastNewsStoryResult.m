@interface NNCLastNewsStoryResult
- (BOOL)isEqual:(id)a3;
- (NNCLastNewsStoryResult)init;
- (NSString)excerpt;
- (NSString)headlineIdentifier;
- (NSString)headlineTitle;
- (NSString)sectionIdentifier;
- (NSString)sectionName;
- (NSString)sourceIdentifier;
- (NSString)sourceName;
- (int64_t)family;
- (unint64_t)hash;
- (unint64_t)headlineIndex;
- (unint64_t)totalHeadlineCount;
- (void)setExcerpt:(id)a3;
- (void)setFamily:(int64_t)a3;
- (void)setHeadlineIdentifier:(id)a3;
- (void)setHeadlineIndex:(unint64_t)a3;
- (void)setHeadlineTitle:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setSectionName:(id)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setSourceName:(id)a3;
- (void)setTotalHeadlineCount:(unint64_t)a3;
@end

@implementation NNCLastNewsStoryResult

- (NNCLastNewsStoryResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)NNCLastNewsStoryResult;
  return [(NNCLastNewsStoryResult *)&v3 init];
}

- (unint64_t)hash
{
  objc_super v3 = [(NNCLastNewsStoryResult *)self headlineIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(NNCLastNewsStoryResult *)self headlineTitle];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(NNCLastNewsStoryResult *)self sectionName];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(NNCLastNewsStoryResult *)self headlineIndex];
  unint64_t v10 = v9 ^ [(NNCLastNewsStoryResult *)self totalHeadlineCount];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(NNCLastNewsStoryResult *)self headlineIdentifier];
    v7 = [v5 headlineIdentifier];
    if (v6 == v7)
    {
      int v11 = 0;
    }
    else
    {
      uint64_t v8 = [(NNCLastNewsStoryResult *)self headlineIdentifier];
      unint64_t v9 = [v5 headlineIdentifier];
      int v10 = [v8 isEqualToString:v9];

      int v11 = v10 ^ 1;
    }

    v13 = [(NNCLastNewsStoryResult *)self headlineTitle];
    v14 = [v5 headlineTitle];
    if (v13 == v14)
    {
      int v18 = 0;
    }
    else
    {
      v15 = [(NNCLastNewsStoryResult *)self headlineTitle];
      v16 = [v5 headlineTitle];
      int v17 = [v15 isEqualToString:v16];

      int v18 = v17 ^ 1;
    }

    v19 = [(NNCLastNewsStoryResult *)self sectionName];
    v20 = [v5 sectionName];
    if (v19 == v20)
    {
      char v24 = 0;
    }
    else
    {
      v21 = [(NNCLastNewsStoryResult *)self sectionName];
      v22 = [v5 sectionName];
      char v23 = [v21 isEqualToString:v22];

      char v24 = v23 ^ 1;
    }

    unint64_t v25 = [(NNCLastNewsStoryResult *)self headlineIndex];
    uint64_t v26 = [v5 headlineIndex];
    unint64_t v27 = [(NNCLastNewsStoryResult *)self totalHeadlineCount];
    uint64_t v28 = [v5 totalHeadlineCount];
    BOOL v12 = 0;
    if (((v11 | v18) & 1) == 0 && (v24 & 1) == 0) {
      BOOL v12 = v25 == v26 && v27 == v28;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (NSString)headlineIdentifier
{
  return self->_headlineIdentifier;
}

- (void)setHeadlineIdentifier:(id)a3
{
}

- (NSString)headlineTitle
{
  return self->_headlineTitle;
}

- (void)setHeadlineTitle:(id)a3
{
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (void)setSectionName:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSString)excerpt
{
  return self->_excerpt;
}

- (void)setExcerpt:(id)a3
{
}

- (unint64_t)headlineIndex
{
  return self->_headlineIndex;
}

- (void)setHeadlineIndex:(unint64_t)a3
{
  self->_headlineIndex = a3;
}

- (unint64_t)totalHeadlineCount
{
  return self->_totalHeadlineCount;
}

- (void)setTotalHeadlineCount:(unint64_t)a3
{
  self->_totalHeadlineCount = a3;
}

- (int64_t)family
{
  return self->_family;
}

- (void)setFamily:(int64_t)a3
{
  self->_family = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excerpt, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionName, 0);
  objc_storeStrong((id *)&self->_headlineTitle, 0);
  objc_storeStrong((id *)&self->_headlineIdentifier, 0);
}

@end
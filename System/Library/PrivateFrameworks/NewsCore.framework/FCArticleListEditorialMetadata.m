@interface FCArticleListEditorialMetadata
- (FCArticleListEditorialMetadata)initWithDictionary:(id)a3;
- (NSDate)publishDate;
- (NSDictionary)articleMetadata;
- (void)setArticleMetadata:(id)a3;
- (void)setPublishDate:(id)a3;
@end

@implementation FCArticleListEditorialMetadata

- (FCArticleListEditorialMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCArticleListEditorialMetadata;
  v5 = [(FCArticleListEditorialMetadata *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"publishDate"];
    if (v6)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "fc_dateFromStringWithISO8601Format:", v6);
      publishDate = v5->_publishDate;
      v5->_publishDate = (NSDate *)v7;
    }
    v9 = [v4 objectForKeyedSubscript:@"articleMetadata"];
    uint64_t v10 = objc_msgSend(v9, "fc_dictionaryByTransformingValuesWithBlock:", &__block_literal_global_148);
    articleMetadata = v5->_articleMetadata;
    v5->_articleMetadata = (NSDictionary *)v10;
  }
  return v5;
}

FCArticleMetadata *__53__FCArticleListEditorialMetadata_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FCArticleMetadata alloc] initWithDictionary:v2];

  return v3;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (void)setPublishDate:(id)a3
{
}

- (NSDictionary)articleMetadata
{
  return self->_articleMetadata;
}

- (void)setArticleMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleMetadata, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
}

@end
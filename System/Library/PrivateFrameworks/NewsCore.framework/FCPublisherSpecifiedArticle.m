@interface FCPublisherSpecifiedArticle
- (FCPublisherSpecifiedArticle)initWithDictionary:(id)a3;
- (NSDate)displayDate;
- (NSString)articleID;
- (NSString)storyType;
- (NSString)title;
- (void)setArticleID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation FCPublisherSpecifiedArticle

- (NSString)articleID
{
  return self->_articleID;
}

- (FCPublisherSpecifiedArticle)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCPublisherSpecifiedArticle;
  v5 = [(FCPublisherSpecifiedArticle *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"articleID"];
    articleID = v5->_articleID;
    v5->_articleID = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;
  }
  return v5;
}

- (NSDate)displayDate
{
  return 0;
}

- (NSString)storyType
{
  return 0;
}

- (void)setArticleID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
}

@end
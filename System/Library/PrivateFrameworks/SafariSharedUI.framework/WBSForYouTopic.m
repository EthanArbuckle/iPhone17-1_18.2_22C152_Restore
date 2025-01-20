@interface WBSForYouTopic
- (NSArray)associatedTopics;
- (NSDate)relevancyDate;
- (NSString)identifier;
- (NSString)title;
- (WBSForYouTopic)initWithTitle:(id)a3 identifier:(id)a4 relevancyDate:(id)a5 source:(unint64_t)a6;
- (unint64_t)source;
- (void)setAssociatedTopics:(id)a3;
- (void)setSource:(unint64_t)a3;
@end

@implementation WBSForYouTopic

- (WBSForYouTopic)initWithTitle:(id)a3 identifier:(id)a4 relevancyDate:(id)a5 source:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSForYouTopic;
  v13 = [(WBSForYouTopic *)&v20 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    title = v13->_title;
    v13->_title = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    objc_storeStrong((id *)&v13->_relevancyDate, a5);
    v13->_source = a6;
    v18 = v13;
  }

  return v13;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)associatedTopics
{
  return self->_associatedTopics;
}

- (void)setAssociatedTopics:(id)a3
{
}

- (NSDate)relevancyDate
{
  return self->_relevancyDate;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevancyDate, 0);
  objc_storeStrong((id *)&self->_associatedTopics, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
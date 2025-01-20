@interface WBSHistoryEntity
- (NSString)identifier;
- (NSString)title;
- (NSURL)url;
- (WBSHistoryEntity)initWithIdentifier:(id)a3 title:(id)a4 url:(id)a5;
@end

@implementation WBSHistoryEntity

- (WBSHistoryEntity)initWithIdentifier:(id)a3 title:(id)a4 url:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSHistoryEntity;
  v11 = [(WBSHistoryEntity *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    title = v11->_title;
    v11->_title = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    url = v11->_url;
    v11->_url = (NSURL *)v16;

    v18 = v11;
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
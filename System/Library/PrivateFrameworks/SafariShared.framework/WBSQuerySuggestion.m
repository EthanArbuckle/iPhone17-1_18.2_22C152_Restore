@interface WBSQuerySuggestion
- (NSString)identifier;
- (NSString)title;
- (WBSQuerySuggestion)init;
- (WBSQuerySuggestion)initWithTitle:(id)a3 identifier:(id)a4 type:(int64_t)a5 tag:(id)a6;
- (id)tag;
- (int64_t)type;
@end

@implementation WBSQuerySuggestion

- (WBSQuerySuggestion)init
{
  return 0;
}

- (WBSQuerySuggestion)initWithTitle:(id)a3 identifier:(id)a4 type:(int64_t)a5 tag:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WBSQuerySuggestion;
  v13 = [(WBSQuerySuggestion *)&v20 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    title = v13->_title;
    v13->_title = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    v13->_type = a5;
    objc_storeStrong(&v13->_tag, a6);
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

- (int64_t)type
{
  return self->_type;
}

- (id)tag
{
  return self->_tag;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tag, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
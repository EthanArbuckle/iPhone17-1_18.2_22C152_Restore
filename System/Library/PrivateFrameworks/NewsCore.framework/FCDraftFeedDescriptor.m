@interface FCDraftFeedDescriptor
- (FCChannelProviding)channel;
- (FCDraftFeedDescriptor)initWithChannel:(id)a3 articleListID:(id)a4 issueListID:(id)a5;
- (NSString)articleListID;
- (NSString)issueListID;
- (id)name;
- (int64_t)feedType;
@end

@implementation FCDraftFeedDescriptor

- (FCDraftFeedDescriptor)initWithChannel:(id)a3 articleListID:(id)a4 issueListID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = NSString;
  v13 = [v9 identifier];
  v14 = [v12 stringWithFormat:@"drafts-%@", v13];

  v22.receiver = self;
  v22.super_class = (Class)FCDraftFeedDescriptor;
  v15 = [(FCFeedDescriptor *)&v22 initWithIdentifier:v14];
  v16 = v15;
  if (v10)
  {
    if (v15)
    {
      objc_storeStrong((id *)&v15->_channel, a3);
      uint64_t v17 = [v10 copy];
      articleListID = v16->_articleListID;
      v16->_articleListID = (NSString *)v17;

      uint64_t v19 = [v11 copy];
      issueListID = (FCDraftFeedDescriptor *)v16->_issueListID;
      v16->_issueListID = (NSString *)v19;
    }
    else
    {
      issueListID = 0;
    }
  }
  else
  {
    issueListID = v15;
    v16 = 0;
  }

  return v16;
}

- (id)name
{
  v2 = FCBundle();
  v3 = [v2 localizedStringForKey:@"Drafts" value:&stru_1EF8299B8 table:0];

  return v3;
}

- (int64_t)feedType
{
  return 14;
}

- (NSString)articleListID
{
  return self->_articleListID;
}

- (NSString)issueListID
{
  return self->_issueListID;
}

- (FCChannelProviding)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_issueListID, 0);
  objc_storeStrong((id *)&self->_articleListID, 0);
}

@end
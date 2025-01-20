@interface FCChannelMembership
- (BOOL)isAllowedToSeeDrafts;
- (BOOL)isEqual:(id)a3;
- (FCChannelMembership)initWithRecord:(id)a3 interestToken:(id)a4;
- (FCInterestToken)interestToken;
- (NSString)channelID;
- (NSString)draftArticleListID;
- (NSString)draftIssueListID;
- (NTPBChannelMembershipRecord)record;
- (unint64_t)hash;
- (void)setInterestToken:(id)a3;
- (void)setRecord:(id)a3;
@end

@implementation FCChannelMembership

- (FCChannelMembership)initWithRecord:(id)a3 interestToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCChannelMembership;
  v9 = [(FCChannelMembership *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_record, a3);
    objc_storeStrong((id *)&v10->_interestToken, a4);
  }

  return v10;
}

- (NSString)channelID
{
  v2 = [(FCChannelMembership *)self record];
  v3 = [v2 channelID];

  return (NSString *)v3;
}

- (BOOL)isAllowedToSeeDrafts
{
  v2 = [(FCChannelMembership *)self record];
  char v3 = [v2 canAccessDrafts];

  return v3;
}

- (NSString)draftArticleListID
{
  v2 = [(FCChannelMembership *)self record];
  char v3 = [v2 draftArticleListID];

  return (NSString *)v3;
}

- (NSString)draftIssueListID
{
  v2 = [(FCChannelMembership *)self record];
  char v3 = [v2 draftIssueListID];

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 channelID];
    id v7 = [(FCChannelMembership *)self channelID];
    if ([v6 isEqualToString:v7]
      && (int v8 = [v5 isAllowedToSeeDrafts],
          v8 == [(FCChannelMembership *)self isAllowedToSeeDrafts]))
    {
      v10 = [v5 draftArticleListID];
      v11 = [(FCChannelMembership *)self draftArticleListID];
      if ([v10 isEqualToString:v11])
      {
        objc_super v12 = [v5 draftIssueListID];
        v13 = [(FCChannelMembership *)self draftIssueListID];
        char v9 = [v12 isEqualToString:v13];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(FCChannelMembership *)self record];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NTPBChannelMembershipRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void)setInterestToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
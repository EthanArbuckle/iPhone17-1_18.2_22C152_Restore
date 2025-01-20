@interface SXIssueCover
- (NSString)issueIdentifier;
- (SXIssueCover)initWithIssueIdentifier:(id)a3;
@end

@implementation SXIssueCover

- (SXIssueCover)initWithIssueIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXIssueCover;
  v5 = [(SXIssueCover *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    issueIdentifier = v5->_issueIdentifier;
    v5->_issueIdentifier = (NSString *)v6;
  }
  return v5;
}

- (NSString)issueIdentifier
{
  return self->_issueIdentifier;
}

- (void).cxx_destruct
{
}

@end
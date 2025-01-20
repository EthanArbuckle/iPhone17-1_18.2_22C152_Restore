@interface ICLiveLinkQueueEventContentReplaced
- (ICLiveLinkQueueEventContentReplaced)initWithStartItemIdentifier:(id)a3;
- (NSString)startItemIdentifier;
- (id)description;
@end

@implementation ICLiveLinkQueueEventContentReplaced

- (void).cxx_destruct
{
}

- (NSString)startItemIdentifier
{
  return self->_startItemIdentifier;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ICLiveLinkQueueEventContentReplaced: %p startItemID=%@>", self, self->_startItemIdentifier];
}

- (ICLiveLinkQueueEventContentReplaced)initWithStartItemIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLiveLinkQueueEventContentReplaced;
  v5 = [(ICLiveLinkQueueEventContentReplaced *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    startItemIdentifier = v5->_startItemIdentifier;
    v5->_startItemIdentifier = (NSString *)v6;
  }
  return v5;
}

@end
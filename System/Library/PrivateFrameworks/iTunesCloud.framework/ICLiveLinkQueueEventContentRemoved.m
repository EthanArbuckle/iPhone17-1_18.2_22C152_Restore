@interface ICLiveLinkQueueEventContentRemoved
- (ICLiveLinkQueueEventContentRemoved)initWithItemIdentifier:(id)a3;
- (NSString)itemIdentifier;
- (id)description;
@end

@implementation ICLiveLinkQueueEventContentRemoved

- (void).cxx_destruct
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ICLiveLinkQueueEventContentRemoved: %p itemIdentifier=%@>", self, self->_itemIdentifier];
}

- (ICLiveLinkQueueEventContentRemoved)initWithItemIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLiveLinkQueueEventContentRemoved;
  v5 = [(ICLiveLinkQueueEventContentRemoved *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;
  }
  return v5;
}

@end
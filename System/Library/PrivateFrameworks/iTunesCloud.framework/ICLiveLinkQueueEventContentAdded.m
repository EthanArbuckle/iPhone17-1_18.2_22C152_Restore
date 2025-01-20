@interface ICLiveLinkQueueEventContentAdded
- (ICLiveLinkQueueEventContentAdded)initWithItemIdentifiers:(id)a3 containerKind:(int64_t)a4 containerIdentifier:(id)a5 containerMediaIdentifier:(id)a6;
- (NSArray)itemIdentifiers;
- (NSString)containerIdentifier;
- (NSString)containerMediaIdentifier;
- (id)description;
- (int64_t)containerKind;
@end

@implementation ICLiveLinkQueueEventContentAdded

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_containerMediaIdentifier, 0);

  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (NSString)containerMediaIdentifier
{
  return self->_containerMediaIdentifier;
}

- (int64_t)containerKind
{
  return self->_containerKind;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (id)description
{
  unint64_t containerKind = self->_containerKind;
  v4 = NSString;
  if (containerKind)
  {
    v5 = _NSStringFromICSharedListeningContainerKind(containerKind);
    v6 = [v4 stringWithFormat:@"<ICLiveLinkQueueEventContentAdded: %p %@(%@)=%@ itemIdentifiers=%@>", self, v5, self->_containerIdentifier, self->_containerMediaIdentifier, self->_itemIdentifiers];
  }
  else
  {
    v6 = [NSString stringWithFormat:@"<ICLiveLinkQueueEventContentAdded: %p unknown itemIdentifiers=%@>", self, self->_itemIdentifiers];
  }

  return v6;
}

- (ICLiveLinkQueueEventContentAdded)initWithItemIdentifiers:(id)a3 containerKind:(int64_t)a4 containerIdentifier:(id)a5 containerMediaIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ICLiveLinkQueueEventContentAdded;
  v13 = [(ICLiveLinkQueueEventContentAdded *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    itemIdentifiers = v13->_itemIdentifiers;
    v13->_itemIdentifiers = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    containerIdentifier = v13->_containerIdentifier;
    v13->_containerIdentifier = (NSString *)v16;

    v13->_unint64_t containerKind = a4;
    uint64_t v18 = [v12 copy];
    containerMediaIdentifier = v13->_containerMediaIdentifier;
    v13->_containerMediaIdentifier = (NSString *)v18;
  }
  return v13;
}

@end
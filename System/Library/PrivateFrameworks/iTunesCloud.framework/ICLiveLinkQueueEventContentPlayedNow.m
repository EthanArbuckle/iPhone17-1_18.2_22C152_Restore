@interface ICLiveLinkQueueEventContentPlayedNow
- (ICLiveLinkQueueEventContentPlayedNow)initWithItemIdentifiers:(id)a3 containerKind:(int64_t)a4 containerIdentifier:(id)a5 containerMediaIdentifier:(id)a6 startItemIdentifier:(id)a7;
- (NSArray)itemIdentifiers;
- (NSString)containerIdentifier;
- (NSString)containerMediaIdentifier;
- (NSString)startItemIdentifier;
- (id)description;
- (int64_t)containerKind;
@end

@implementation ICLiveLinkQueueEventContentPlayedNow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startItemIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_containerMediaIdentifier, 0);

  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

- (NSString)startItemIdentifier
{
  return self->_startItemIdentifier;
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
    v6 = [v4 stringWithFormat:@"<ICLiveLinkQueueEventContentPlayedNow: %p %@(%@)=%@ itemIdentifiers=%@ startItemID=%@>", self, v5, self->_containerIdentifier, self->_containerMediaIdentifier, self->_itemIdentifiers, self->_startItemIdentifier];
  }
  else
  {
    v6 = [NSString stringWithFormat:@"<ICLiveLinkQueueEventContentPlayedNow: %p unknown itemIdentifiers=%@ startItemID=%@>", self, self->_itemIdentifiers, self->_startItemIdentifier];
  }

  return v6;
}

- (ICLiveLinkQueueEventContentPlayedNow)initWithItemIdentifiers:(id)a3 containerKind:(int64_t)a4 containerIdentifier:(id)a5 containerMediaIdentifier:(id)a6 startItemIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)ICLiveLinkQueueEventContentPlayedNow;
  v16 = [(ICLiveLinkQueueEventContentPlayedNow *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    itemIdentifiers = v16->_itemIdentifiers;
    v16->_itemIdentifiers = (NSArray *)v17;

    uint64_t v19 = [v13 copy];
    containerIdentifier = v16->_containerIdentifier;
    v16->_containerIdentifier = (NSString *)v19;

    v16->_unint64_t containerKind = a4;
    uint64_t v21 = [v14 copy];
    containerMediaIdentifier = v16->_containerMediaIdentifier;
    v16->_containerMediaIdentifier = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    startItemIdentifier = v16->_startItemIdentifier;
    v16->_startItemIdentifier = (NSString *)v23;
  }
  return v16;
}

@end
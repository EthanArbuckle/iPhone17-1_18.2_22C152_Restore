@interface ICLiveLinkReactionEvent
- (ICLiveLinkReactionEvent)initWithReaction:(id)a3 reactionIdentifier:(id)a4 itemIdentifier:(id)a5;
- (NSString)itemIdentifier;
- (NSString)reaction;
- (NSString)reactionIdentifier;
- (id)description;
@end

@implementation ICLiveLinkReactionEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_reaction, 0);

  objc_storeStrong((id *)&self->_reactionIdentifier, 0);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)reaction
{
  return self->_reaction;
}

- (NSString)reactionIdentifier
{
  return self->_reactionIdentifier;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ICLiveLinkReactionEvent: %p reaction=\"%@\" reactionID=%@ itemID=%@>", self, self->_reaction, self->_reactionIdentifier, self->_itemIdentifier];
}

- (ICLiveLinkReactionEvent)initWithReaction:(id)a3 reactionIdentifier:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICLiveLinkReactionEvent;
  v11 = [(ICLiveLinkReactionEvent *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    reaction = v11->_reaction;
    v11->_reaction = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    reactionIdentifier = v11->_reactionIdentifier;
    v11->_reactionIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    itemIdentifier = v11->_itemIdentifier;
    v11->_itemIdentifier = (NSString *)v16;
  }
  return v11;
}

@end
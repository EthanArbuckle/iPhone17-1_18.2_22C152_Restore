@interface SharedTripSuggestionsPrefetchContext
- (NSArray)automaticSharingContacts;
- (NSArray)routingToContacts;
- (void)setAutomaticSharingContacts:(id)a3;
- (void)setRoutingToContacts:(id)a3;
@end

@implementation SharedTripSuggestionsPrefetchContext

- (NSArray)automaticSharingContacts
{
  return self->_automaticSharingContacts;
}

- (void)setAutomaticSharingContacts:(id)a3
{
}

- (NSArray)routingToContacts
{
  return self->_routingToContacts;
}

- (void)setRoutingToContacts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingToContacts, 0);

  objc_storeStrong((id *)&self->_automaticSharingContacts, 0);
}

@end
@interface CNContactStore
@end

@implementation CNContactStore

uint64_t __58__CNContactStore_TUSearchUtilities__contactForIdentifier___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)contactForIdentifier__identifierToContactCache;
  contactForIdentifier__identifierToContactCache = (uint64_t)v0;

  v2 = (void *)contactForIdentifier__identifierToContactCache;

  return [v2 setCountLimit:100];
}

uint64_t __61__CNContactStore_TUSearchUtilities__contactForDestinationId___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)contactForDestinationId__destinationIDToContactCache;
  contactForDestinationId__destinationIDToContactCache = (uint64_t)v0;

  v2 = (void *)contactForDestinationId__destinationIDToContactCache;

  return [v2 setCountLimit:100];
}

@end
@interface CNContact(TUClientIDSUtilities)
- (id)allIDSDestinations;
@end

@implementation CNContact(TUClientIDSUtilities)

- (id)allIDSDestinations
{
  v2 = [a1 phoneNumberStrings];
  v3 = [a1 emailAddressStrings];
  uint64_t v4 = [v2 count];
  uint64_t v5 = [v3 count] + v4;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:v5];
  v7 = [v2 arrayByApplyingSelector:sel_IDSFormattedDestinationID];
  [v6 addObjectsFromArray:v7];

  v8 = [v3 arrayByApplyingSelector:sel_IDSFormattedDestinationID];
  [v6 addObjectsFromArray:v8];

  v9 = [v6 array];

  return v9;
}

@end
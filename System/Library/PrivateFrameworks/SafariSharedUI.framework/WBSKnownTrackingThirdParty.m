@interface WBSKnownTrackingThirdParty
- (NSString)ownerName;
- (id)thirdPartyCoalescedWithThirdParty:(id)a3;
- (void)setOwnerName:(id)a3;
@end

@implementation WBSKnownTrackingThirdParty

- (id)thirdPartyCoalescedWithThirdParty:(id)a3
{
  id v4 = a3;
  v5 = [(WBSTrackingCapableThirdParty *)self firstParties];
  v6 = [v4 firstParties];

  v7 = objc_msgSend(v5, "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", v6);
  v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_32];

  id v9 = objc_alloc((Class)objc_opt_class());
  v10 = [(WBSTrackingCapableThirdParty *)self domain];
  v11 = (void *)[v9 initWithDomain:v10 firstParties:v8];

  v12 = [(WBSKnownTrackingThirdParty *)self ownerName];
  [v11 setOwnerName:v12];

  return v11;
}

uint64_t __64__WBSKnownTrackingThirdParty_thirdPartyCoalescedWithThirdParty___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 domain];
  v6 = [v4 domain];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void)setOwnerName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
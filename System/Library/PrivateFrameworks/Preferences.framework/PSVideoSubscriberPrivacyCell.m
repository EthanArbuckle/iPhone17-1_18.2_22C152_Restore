@interface PSVideoSubscriberPrivacyCell
+ (id)_accountStore;
+ (id)identityProviderDisplayName;
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PSVideoSubscriberPrivacyCell

+ (id)_accountStore
{
  if (_accountStore_onceToken != -1) {
    dispatch_once(&_accountStore_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)_accountStore_accountStore;
  return v2;
}

void __45__PSVideoSubscriberPrivacyCell__accountStore__block_invoke()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getVSAccountStoreClass_softClass;
  uint64_t v8 = getVSAccountStoreClass_softClass;
  if (!getVSAccountStoreClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getVSAccountStoreClass_block_invoke;
    v4[3] = &unk_1E5C5D4D8;
    v4[4] = &v5;
    __getVSAccountStoreClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [v1 sharedAccountStore];
  v3 = (void *)_accountStore_accountStore;
  _accountStore_accountStore = v2;
}

+ (id)identityProviderDisplayName
{
  uint64_t v2 = [a1 _accountStore];
  v3 = [v2 firstAccount];
  v4 = [v3 identityProviderDisplayName];

  return v4;
}

+ (int64_t)cellStyle
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___PSVideoSubscriberPrivacyCell;
  id v3 = objc_msgSendSuper2(&v6, sel_cellStyle);
  v4 = [a1 identityProviderDisplayName];

  if (v4) {
    return 3;
  }
  else {
    return (int64_t)v3;
  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSVideoSubscriberPrivacyCell;
  [(PSSwitchTableCell *)&v6 refreshCellContentsWithSpecifier:a3];
  v4 = [(id)objc_opt_class() identityProviderDisplayName];
  uint64_t v5 = [(PSVideoSubscriberPrivacyCell *)self detailTextLabel];
  [v5 setText:v4];
}

@end
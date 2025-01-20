@interface REMAccountPinnedListsContextChangeItem
- (REMAccountChangeItem)accountChangeItem;
- (REMAccountPinnedListsContextChangeItem)initWithAccountChangeItem:(id)a3;
- (REMManualOrdering)unsavedManualOrdering;
- (void)setAccountChangeItem:(id)a3;
- (void)updateManualOrdering:(id)a3;
@end

@implementation REMAccountPinnedListsContextChangeItem

- (REMAccountPinnedListsContextChangeItem)initWithAccountChangeItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountPinnedListsContextChangeItem;
  v6 = [(REMAccountPinnedListsContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountChangeItem, a3);
  }

  return v7;
}

- (REMManualOrdering)unsavedManualOrdering
{
  v2 = [(REMAccountPinnedListsContextChangeItem *)self accountChangeItem];
  v3 = [v2 pinnedListsManualOrdering];

  return (REMManualOrdering *)v3;
}

- (void)updateManualOrdering:(id)a3
{
  id v4 = a3;
  id v5 = [(REMAccountPinnedListsContextChangeItem *)self accountChangeItem];
  [v5 setPinnedListsManualOrdering:v4];
}

- (REMAccountChangeItem)accountChangeItem
{
  return self->_accountChangeItem;
}

- (void)setAccountChangeItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
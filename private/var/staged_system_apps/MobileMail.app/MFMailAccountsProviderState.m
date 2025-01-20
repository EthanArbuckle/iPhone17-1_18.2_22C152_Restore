@interface MFMailAccountsProviderState
- (NSArray)mailAccounts;
- (NSSet)displayedAccountsIdentifiers;
- (NSSet)focusedAccountsIdentifiers;
- (id)initFromProvider:(id)a3;
- (unint64_t)numberOfActiveAccounts;
- (unint64_t)numberOfInactiveAccounts;
- (void)setFocusedAccountsIdentifiers:(id)a3;
@end

@implementation MFMailAccountsProviderState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailAccounts, 0);
  objc_storeStrong((id *)&self->_focusedAccountsIdentifiers, 0);

  objc_storeStrong((id *)&self->_displayedAccountsIdentifiers, 0);
}

- (NSSet)displayedAccountsIdentifiers
{
  return self->_displayedAccountsIdentifiers;
}

- (NSArray)mailAccounts
{
  return self->_mailAccounts;
}

- (unint64_t)numberOfActiveAccounts
{
  return self->_numberOfActiveAccounts;
}

- (unint64_t)numberOfInactiveAccounts
{
  return self->_numberOfInactiveAccounts;
}

- (id)initFromProvider:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MFMailAccountsProviderState;
  v5 = [(MFMailAccountsProviderState *)&v16 init];
  if (v5)
  {
    v5->_numberOfActiveAccounts = (unint64_t)[v4 numberOfActiveAccounts];
    v5->_numberOfInactiveAccounts = (unint64_t)[v4 numberOfInactiveAccounts];
    v6 = [v4 _displayedAccountsIdentifiers];
    v7 = (NSSet *)[v6 copy];
    displayedAccountsIdentifiers = v5->_displayedAccountsIdentifiers;
    v5->_displayedAccountsIdentifiers = v7;

    v9 = [v4 _focusedAccountsIdentifiers];
    v10 = (NSSet *)[v9 copy];
    focusedAccountsIdentifiers = v5->_focusedAccountsIdentifiers;
    v5->_focusedAccountsIdentifiers = v10;

    v12 = [v4 mailAccounts];
    v13 = (NSArray *)[v12 copy];
    mailAccounts = v5->_mailAccounts;
    v5->_mailAccounts = v13;
  }
  return v5;
}

- (NSSet)focusedAccountsIdentifiers
{
  return self->_focusedAccountsIdentifiers;
}

- (void)setFocusedAccountsIdentifiers:(id)a3
{
}

@end
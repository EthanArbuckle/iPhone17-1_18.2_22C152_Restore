@interface PSAccountsLinkSpecifier
- (PSAccountEnumerator)accountEnumerator;
- (PSAccountsLinkSpecifier)initWithDetailClass:(Class)a3;
- (id)_accountsCount:(id)a3;
- (void)setAccountEnumerator:(id)a3;
@end

@implementation PSAccountsLinkSpecifier

- (PSAccountsLinkSpecifier)initWithDetailClass:(Class)a3
{
  v5 = PS_LocalizedStringForSystemPolicy(@"ACCOUNTS");
  v9.receiver = self;
  v9.super_class = (Class)PSAccountsLinkSpecifier;
  v6 = [(PSSpecifier *)&v9 initWithName:v5 target:self set:0 get:sel__accountsCount_ detail:a3 cell:2 edit:0];

  if (v6) {
    v7 = v6;
  }

  return v6;
}

- (id)_accountsCount:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28EE0];
  v4 = (void *)MEMORY[0x1E4F28ED0];
  v5 = +[PSAccountEnumerator sharedEnumerator];
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "visibleAccountCount"));
  v7 = [v3 localizedStringFromNumber:v6 numberStyle:1];

  return v7;
}

- (PSAccountEnumerator)accountEnumerator
{
  return self->_accountEnumerator;
}

- (void)setAccountEnumerator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
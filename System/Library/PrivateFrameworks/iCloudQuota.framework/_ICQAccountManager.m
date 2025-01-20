@interface _ICQAccountManager
- (ACAccountStore)accountStore;
- (_ICQAccountManager)init;
- (_ICQAccountManager)initWithAccountStore:(id)a3;
@end

@implementation _ICQAccountManager

- (ACAccountStore)accountStore
{
  return (ACAccountStore *)objc_getProperty(self, a2, 8, 1);
}

- (_ICQAccountManager)init
{
  v3 = [MEMORY[0x1E4F179C8] defaultStore];
  v4 = [(_ICQAccountManager *)self initWithAccountStore:v3];

  return v4;
}

- (_ICQAccountManager)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ICQAccountManager;
  v6 = [(_ICQAccountManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountStore, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end
@interface SUScriptDonationViewController
- (SUScriptDonationViewController)initWithCharityIdentifier:(id)a3;
- (id)_className;
- (id)newNativeViewController;
@end

@implementation SUScriptDonationViewController

- (SUScriptDonationViewController)initWithCharityIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptDonationViewController;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_charityIdentifier = (NSString *)[a3 copy];
  }
  return v4;
}

- (id)newNativeViewController
{
  uint64_t v3 = ISUIMobileStoreUIFramework();
  v4 = objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(&cfstr_Suuidonationvi.isa, v3)), "initWithCharityIdentifier:", self->_charityIdentifier);
  uint64_t v5 = ISUIMobileStoreUIFramework();
  objc_msgSend(v4, "setClientContext:", objc_msgSend(ISUIWeakLinkedClassForString(&cfstr_Suuiclientcont.isa, v5), "defaultContext"));
  return v4;
}

- (id)_className
{
  return @"iTunesDonationViewController";
}

@end
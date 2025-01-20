@interface NFWalletPresentationEntitlement
- (id)debugDescription;
@end

@implementation NFWalletPresentationEntitlement

- (id)debugDescription
{
  id v3 = objc_alloc((Class)NSString);
  if (self) {
    applicationIdentifier = self->_applicationIdentifier;
  }
  else {
    applicationIdentifier = 0;
  }
  id v5 = [v3 initWithFormat:@"{ appId= %@}", applicationIdentifier];

  return v5;
}

- (void).cxx_destruct
{
}

@end
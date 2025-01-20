@interface SFAuthenticateAccountResult
- (BOOL)isVoiceProfileAvailable;
- (NSArray)authenticatedAccounts;
- (NSArray)keyboards;
- (NSArray)knownHomeUserIdentifiers;
- (NSArray)preferredLanguages;
- (NSString)localeIdentifier;
- (NSString)preferredLanguageCode;
- (SFAuthenticateAccountResult)initWithAuthenticatedAccounts:(id)a3 knownHomeUserIdentifiers:(id)a4 isVoiceProfileAvailable:(BOOL)a5;
- (void)setKeyboards:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setPreferredLanguageCode:(id)a3;
- (void)setPreferredLanguages:(id)a3;
@end

@implementation SFAuthenticateAccountResult

- (SFAuthenticateAccountResult)initWithAuthenticatedAccounts:(id)a3 knownHomeUserIdentifiers:(id)a4 isVoiceProfileAvailable:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SFAuthenticateAccountResult;
  v11 = [(SFAuthenticateAccountResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_authenticatedAccounts, a3);
    objc_storeStrong((id *)&v12->_knownHomeUserIdentifiers, a4);
    v12->_isVoiceProfileAvailable = a5;
  }

  return v12;
}

- (NSString)preferredLanguageCode
{
  return self->_preferredLanguageCode;
}

- (void)setPreferredLanguageCode:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (void)setPreferredLanguages:(id)a3
{
}

- (NSArray)keyboards
{
  return self->_keyboards;
}

- (void)setKeyboards:(id)a3
{
}

- (NSArray)authenticatedAccounts
{
  return self->_authenticatedAccounts;
}

- (NSArray)knownHomeUserIdentifiers
{
  return self->_knownHomeUserIdentifiers;
}

- (BOOL)isVoiceProfileAvailable
{
  return self->_isVoiceProfileAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownHomeUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_authenticatedAccounts, 0);
  objc_storeStrong((id *)&self->_keyboards, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);

  objc_storeStrong((id *)&self->_preferredLanguageCode, 0);
}

@end
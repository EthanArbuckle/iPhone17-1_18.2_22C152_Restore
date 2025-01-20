@interface AKAppleIDAuthenticationContext(PKAdditions)
- (id)pk_AKAppleIDAuthenticationInAppContext;
@end

@implementation AKAppleIDAuthenticationContext(PKAdditions)

- (id)pk_AKAppleIDAuthenticationInAppContext
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = a1;
  }
  else
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F4F100]);
    v3 = [a1 reason];
    [v2 setReason:v3];

    v4 = [a1 DSID];
    [v2 setDSID:v4];

    v5 = [a1 altDSID];
    [v2 setAltDSID:v5];

    v6 = [a1 defaultButtonString];
    [v2 setDefaultButtonString:v6];

    v7 = [a1 title];
    [v2 setTitle:v7];

    v8 = [a1 username];
    [v2 setUsername:v8];

    objc_msgSend(v2, "setMaximumLoginAttempts:", objc_msgSend(a1, "maximumLoginAttempts"));
    objc_msgSend(v2, "setIsEphemeral:", objc_msgSend(a1, "isEphemeral"));
    objc_msgSend(v2, "setShouldOfferSecurityUpgrade:", objc_msgSend(a1, "shouldOfferSecurityUpgrade"));
    v9 = [a1 appProvidedData];
    [v2 setAppProvidedData:v9];

    objc_msgSend(v2, "setServiceType:", objc_msgSend(a1, "serviceType"));
    objc_msgSend(v2, "setIsUsernameEditable:", objc_msgSend(a1, "isUsernameEditable"));
    objc_msgSend(v2, "setAuthenticationType:", objc_msgSend(a1, "authenticationType"));
  }

  return v2;
}

@end
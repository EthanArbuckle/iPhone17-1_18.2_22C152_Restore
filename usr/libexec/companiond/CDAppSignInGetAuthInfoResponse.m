@interface CDAppSignInGetAuthInfoResponse
- (AKAuthorizationRequest)appleIDRequest;
- (AKPasswordRequest)passwordRequest;
- (ASCPublicKeyCredentialAssertionOptions)platformKeyCredentialAssertionOptions;
- (ASCPublicKeyCredentialCreationOptions)platformKeyCredentialRegistrationOptions;
- (CDAppSignInGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (CPSWebRequest)webRequest;
- (NSArray)appDomains;
- (NSData)appIconData;
- (NSNumber)appIconScale;
- (NSString)appBundleIdentifier;
- (NSString)appIdentifier;
- (NSString)appName;
- (NSString)appTeamIdentifier;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setAppDomains:(id)a3;
- (void)setAppIconData:(id)a3;
- (void)setAppIconScale:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAppTeamIdentifier:(id)a3;
- (void)setAppleIDRequest:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setPasswordRequest:(id)a3;
- (void)setPlatformKeyCredentialAssertionOptions:(id)a3;
- (void)setPlatformKeyCredentialRegistrationOptions:(id)a3;
- (void)setWebRequest:(id)a3;
@end

@implementation CDAppSignInGetAuthInfoResponse

- (CDAppSignInGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CDAppSignInGetAuthInfoResponse;
  v5 = [(CDAppSignInGetAuthInfoResponse *)&v43 init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = sub_10001CD14(v4, @"appleIDRequest", (uint64_t)v6);
    appleIDRequest = v5->_appleIDRequest;
    v5->_appleIDRequest = (AKAuthorizationRequest *)v7;

    v9 = self;
    uint64_t v10 = sub_10001CD14(v4, @"passwordRequest", (uint64_t)v9);
    passwordRequest = v5->_passwordRequest;
    v5->_passwordRequest = (AKPasswordRequest *)v10;

    v12 = self;
    uint64_t v13 = sub_10001CD14(v4, @"webRequest", (uint64_t)v12);
    webRequest = v5->_webRequest;
    v5->_webRequest = (CPSWebRequest *)v13;

    v15 = self;
    uint64_t v16 = sub_10001CD14(v4, @"platformKeyCredentialAssertionOptions", (uint64_t)v15);
    platformKeyCredentialAssertionOptions = v5->_platformKeyCredentialAssertionOptions;
    v5->_platformKeyCredentialAssertionOptions = (ASCPublicKeyCredentialAssertionOptions *)v16;

    v18 = self;
    uint64_t v19 = sub_10001CD14(v4, @"platformKeyCredentialRegistrationOptions", (uint64_t)v18);
    platformKeyCredentialRegistrationOptions = v5->_platformKeyCredentialRegistrationOptions;
    v5->_platformKeyCredentialRegistrationOptions = (ASCPublicKeyCredentialCreationOptions *)v19;

    CFStringGetTypeID();
    v21 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = v21;

    CFStringGetTypeID();
    v23 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = v23;

    CFStringGetTypeID();
    v25 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    appTeamIdentifier = v5->_appTeamIdentifier;
    v5->_appTeamIdentifier = v25;

    CFStringGetTypeID();
    v27 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    appName = v5->_appName;
    v5->_appName = v27;

    CFDataGetTypeID();
    v29 = (NSData *)[(id)CFDictionaryGetTypedValue() copy];
    appIconData = v5->_appIconData;
    v5->_appIconData = v29;

    v31 = NSDictionaryGetNSNumber();
    v32 = (NSNumber *)[v31 copy];
    appIconScale = v5->_appIconScale;
    v5->_appIconScale = v32;

    v34 = self;
    v35 = NSDictionaryGetNSArrayOfClass();
    v36 = (NSArray *)[v35 copy];
    appDomains = v5->_appDomains;
    v5->_appDomains = v36;

    CFStringGetTypeID();
    v38 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = v38;

    CFStringGetTypeID();
    v40 = (NSString *)[(id)CFDictionaryGetTypedValue() copy];
    deviceName = v5->_deviceName;
    v5->_deviceName = v40;
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = sub_10001D014((uint64_t)self->_appleIDRequest);
  [v3 setObject:v4 forKeyedSubscript:@"appleIDRequest"];

  v5 = sub_10001D014((uint64_t)self->_passwordRequest);
  [v3 setObject:v5 forKeyedSubscript:@"passwordRequest"];

  v6 = sub_10001D014((uint64_t)self->_webRequest);
  [v3 setObject:v6 forKeyedSubscript:@"webRequest"];

  uint64_t v7 = sub_10001D014((uint64_t)self->_platformKeyCredentialAssertionOptions);
  [v3 setObject:v7 forKeyedSubscript:@"platformKeyCredentialAssertionOptions"];

  v8 = sub_10001D014((uint64_t)self->_platformKeyCredentialRegistrationOptions);
  [v3 setObject:v8 forKeyedSubscript:@"platformKeyCredentialRegistrationOptions"];

  [v3 setObject:self->_appIdentifier forKeyedSubscript:@"appID"];
  [v3 setObject:self->_appBundleIdentifier forKeyedSubscript:@"appBundleID"];
  [v3 setObject:self->_appTeamIdentifier forKeyedSubscript:@"appTeamID"];
  [v3 setObject:self->_appName forKeyedSubscript:@"appName"];
  [v3 setObject:self->_appIconData forKeyedSubscript:@"appIconData"];
  [v3 setObject:self->_appIconScale forKeyedSubscript:@"appIconScale"];
  [v3 setObject:self->_appDomains forKeyedSubscript:@"appDomains"];
  [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v9 = [v3 copy];

  return v9;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_appleIDRequest withName:@"appleIDRequest" skipIfNil:1];
  id v5 = [v3 appendObject:self->_passwordRequest withName:@"passwordRequest" skipIfNil:1];
  id v6 = [v3 appendObject:self->_webRequest withName:@"webRequest" skipIfNil:1];
  id v7 = [v3 appendObject:self->_platformKeyCredentialAssertionOptions withName:@"platformKeyCredentialAssertionOptions" skipIfNil:1];
  id v8 = [v3 appendObject:self->_platformKeyCredentialRegistrationOptions withName:@"platformKeyCredentialRegistrationOptions" skipIfNil:1];
  [v3 appendString:self->_appIdentifier withName:@"appIdentifier" skipIfEmpty:1];
  [v3 appendString:self->_appBundleIdentifier withName:@"appBundleIdentifier" skipIfEmpty:1];
  [v3 appendString:self->_appTeamIdentifier withName:@"appTeamIdentifier" skipIfEmpty:1];
  [v3 appendString:self->_appName withName:@"appName" skipIfEmpty:1];
  id v9 = [v3 appendObject:self->_appIconData withName:@"appIconData" skipIfNil:1];
  id v10 = [v3 appendObject:self->_appIconScale withName:@"appIconScale" skipIfNil:1];
  id v11 = [v3 appendObject:self->_appDomains withName:@"appDomains" skipIfNil:1];
  [v3 appendString:self->_deviceClass withName:@"deviceClass" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  v12 = [v3 build];

  return (NSString *)v12;
}

- (AKAuthorizationRequest)appleIDRequest
{
  return self->_appleIDRequest;
}

- (void)setAppleIDRequest:(id)a3
{
}

- (AKPasswordRequest)passwordRequest
{
  return self->_passwordRequest;
}

- (void)setPasswordRequest:(id)a3
{
}

- (CPSWebRequest)webRequest
{
  return self->_webRequest;
}

- (void)setWebRequest:(id)a3
{
}

- (ASCPublicKeyCredentialAssertionOptions)platformKeyCredentialAssertionOptions
{
  return self->_platformKeyCredentialAssertionOptions;
}

- (void)setPlatformKeyCredentialAssertionOptions:(id)a3
{
}

- (ASCPublicKeyCredentialCreationOptions)platformKeyCredentialRegistrationOptions
{
  return self->_platformKeyCredentialRegistrationOptions;
}

- (void)setPlatformKeyCredentialRegistrationOptions:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSString)appTeamIdentifier
{
  return self->_appTeamIdentifier;
}

- (void)setAppTeamIdentifier:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSData)appIconData
{
  return self->_appIconData;
}

- (void)setAppIconData:(id)a3
{
}

- (NSNumber)appIconScale
{
  return self->_appIconScale;
}

- (void)setAppIconScale:(id)a3
{
}

- (NSArray)appDomains
{
  return self->_appDomains;
}

- (void)setAppDomains:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_appDomains, 0);
  objc_storeStrong((id *)&self->_appIconScale, 0);
  objc_storeStrong((id *)&self->_appIconData, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appTeamIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialRegistrationOptions, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialAssertionOptions, 0);
  objc_storeStrong((id *)&self->_webRequest, 0);
  objc_storeStrong((id *)&self->_passwordRequest, 0);

  objc_storeStrong((id *)&self->_appleIDRequest, 0);
}

@end
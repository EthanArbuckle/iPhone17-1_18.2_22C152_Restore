@interface RMErrorUtilities
+ (BOOL)convertSwiftErrorReference:(id *)a3;
+ (id)_englishDescriptionFormatWithKey:(id)a3;
+ (id)_localizedDescriptionFormatWithKey:(id)a3;
+ (id)_populateDescriptionInUserInfo:(id)a3 descriptionKey:(id)a4;
+ (id)_populateDescriptionInUserInfo:(id)a3 descriptionKey:(id)a4 arguments:(char *)a5;
+ (id)convertSwiftError:(id)a3;
+ (id)createAccountAlreadyExistsErrorWithIdentifier:(id)a3;
+ (id)createAccountMissingErrorWithIdentifier:(id)a3;
+ (id)createAlreadyEnrolledInMDMv1Error;
+ (id)createAssetCannotBeDownloadedErrorWithUnderlyingError:(id)a3;
+ (id)createAssetCannotProcessFileErrorWithUnderlyingError:(id)a3;
+ (id)createAssetContentTypeCannotBeVerifiedError;
+ (id)createAssetHashCannotBeVerifiedError;
+ (id)createAssetInvalidError:(id)a3;
+ (id)createAssetInvalidURLError:(id)a3;
+ (id)createAssetSizeCannotBeVerifiedError;
+ (id)createAssetTypeInvalidError:(id)a3;
+ (id)createBootstrapURINotFound;
+ (id)createCMSDecodeErrorWithStatusCode:(int)a3 reason:(id)a4;
+ (id)createCannotChangeValueErrorForPropertyNamed:(id)a3 onObject:(id)a4;
+ (id)createConnectionNotEntitledWithName:(id)a3;
+ (id)createCouldNotInstallApp;
+ (id)createCouldNotInstallAppWithUnderlyingError:(id)a3;
+ (id)createCouldNotParseURLErrorWithString:(id)a3;
+ (id)createDeclarationNotFoundErrorWithIdentifier:(id)a3;
+ (id)createDeviceIdentityNotFoundError;
+ (id)createDisallowedStatusValueErrorWithKeyPath:(id)a3;
+ (id)createErrorWithCode:(int64_t)a3 userInfo:(id)a4 descriptionKey:(id)a5;
+ (id)createFeatureDisabledError:(id)a3;
+ (id)createHTTPErrorWithStatusCode:(int64_t)a3 reason:(id)a4;
+ (id)createIncorrectPayloadTypeErrorWithExpectedType:(id)a3 actualType:(id)a4;
+ (id)createInternalError;
+ (id)createInternalErrorWithDescription:(id)a3;
+ (id)createInternalErrorWithUnderlyingError:(id)a3;
+ (id)createInvalidPasscodeError;
+ (id)createInvalidStatusValueErrorWithKeyPath:(id)a3;
+ (id)createLicenseNotFound;
+ (id)createMDMRequestFailed:(id)a3;
+ (id)createMDMRequestInvalid:(id)a3;
+ (id)createManagementSourceAlreadyExistsErrorWithAccountIdentifier:(id)a3;
+ (id)createManagementSourceAlreadyExistsErrorWithURI:(id)a3;
+ (id)createManagementSourceNotFoundErrorWithAccountIdentifier:(id)a3;
+ (id)createManagementSourceNotFoundErrorWithIdentifier:(id)a3;
+ (id)createMismatchedValuesErrorForPropertyNamed:(id)a3 onObject:(id)a4 expected:(id)a5 actual:(id)a6;
+ (id)createMissingMandatoryPropertyErrorWithPropertyNamed:(id)a3 onObject:(id)a4;
+ (id)createMissingReferralURLError;
+ (id)createMissingServerResponseItemErrorWithName:(id)a3;
+ (id)createMobileKeyBagErrorWithCode:(int64_t)a3;
+ (id)createMultipleErrorOrReturnTheSingleErrorWithErrors:(id)a3;
+ (id)createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:(id)a3;
+ (id)createNotImplementedErrorForFeature:(id)a3;
+ (id)createOrganizationProofInvalidError;
+ (id)createProfileCannotBeInstalledBySource:(id)a3 source:(id)a4;
+ (id)createProfileCannotFindRemoveProfile:(id)a3;
+ (id)createProfileCannotRemoveOtherProfile:(id)a3;
+ (id)createProfileCannotReplaceOtherProfile:(id)a3;
+ (id)createProfileInvalidErrorWithUnderlyingError:(id)a3;
+ (id)createProfilePayloadInvalidKey:(id)a3 key:(id)a4;
+ (id)createProfilePayloadInvalidKeyItems:(id)a3 key:(id)a4;
+ (id)createProfilePayloadMissingKey:(id)a3 key:(id)a4;
+ (id)createProfilePayloadNotAllowedErrorWithPayloadType:(id)a3;
+ (id)createServiceDiscoveryInvalidUserIdentifierWithReason:(id)a3;
+ (id)createServiceDiscoveryWellKnownFailedWithReason:(id)a3;
+ (id)createServiceDiscoveryWellKnownInvalidWithReason:(id)a3;
+ (id)createStatePreventsSyncingError;
+ (id)createTooManyDeviceManagementSourcesError;
+ (id)createTooManyFailedAuthenticationsError;
+ (id)createTooManyReferralsError;
+ (id)createUnableToEvaluatePredicateErrorWithFormat:(id)a3 reason:(id)a4;
+ (id)createUnableToParsePredicateErrorWithCustomOperator:(id)a3 predicateFormat:(id)a4;
+ (id)createUnableToParsePredicateErrorWithFormat:(id)a3 reason:(id)a4;
+ (id)createUnhandledContentTypeErrorWithContentType:(id)a3;
+ (id)createUnsupportedAuthenticationSchemeErrorWithScheme:(id)a3;
+ (id)createUnsupportedStatusValueErrorWithKeyPath:(id)a3;
+ (id)createUnverifiedDownloadHashErrorWithURL:(id)a3;
+ (id)createUnverifiedDownloadSizeErrorWithURL:(id)a3;
@end

@implementation RMErrorUtilities

+ (id)createErrorWithCode:(int64_t)a3 userInfo:(id)a4 descriptionKey:(id)a5
{
  v6 = [a1 _populateDescriptionInUserInfo:a4 descriptionKey:a5 arguments:&v10];
  v7 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"RMErrorDomain" code:a3 userInfo:v6];

  return v7;
}

+ (id)_populateDescriptionInUserInfo:(id)a3 descriptionKey:(id)a4
{
  v4 = [a1 _populateDescriptionInUserInfo:a3 descriptionKey:a4 arguments:&v7];

  return v4;
}

+ (id)_populateDescriptionInUserInfo:(id)a3 descriptionKey:(id)a4 arguments:(char *)a5
{
  v30[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v28 = a5;
  uint64_t v10 = [a1 _localizedDescriptionFormatWithKey:v9];
  v11 = [a1 _englishDescriptionFormatWithKey:v9];
  v12 = (objc_class *)NSString;
  id v13 = v10;
  id v14 = [v12 alloc];
  v15 = [MEMORY[0x263EFF960] currentLocale];
  v16 = (void *)[v14 initWithFormat:v13 locale:v15 arguments:v28];

  uint64_t v17 = getEnglishDescription_onceToken;
  id v18 = v11;
  if (v17 != -1) {
    dispatch_once(&getEnglishDescription_onceToken, &__block_literal_global_7);
  }
  id v19 = [NSString alloc];
  v20 = (void *)[v19 initWithFormat:v18 locale:getEnglishDescription_enUSPosixLocale arguments:v28];

  v21 = [v9 stringByReplacingOccurrencesOfString:@"_%@" withString:&stru_26D79D728];
  v22 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v23 = *MEMORY[0x263F07F80];
  v29[0] = *MEMORY[0x263F08320];
  v29[1] = v23;
  v30[0] = v16;
  v30[1] = v20;
  v29[2] = @"RMErrorUserInfoKeyDescriptionKey";
  v30[2] = v21;
  v24 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
  v25 = [v22 dictionaryWithDictionary:v24];

  if (v8) {
    [v25 setValuesForKeysWithDictionary:v8];
  }
  v26 = objc_msgSend(v25, "copy", v28, v28);

  return v26;
}

+ (id)_localizedDescriptionFormatWithKey:(id)a3
{
  id v3 = a3;
  v4 = +[RMBundle remoteManagementBundle];
  v5 = [v4 localizedStringForKey:v3 value:&stru_26D79D728 table:0];

  return v5;
}

+ (id)_englishDescriptionFormatWithKey:(id)a3
{
  id v3 = a3;
  v4 = +[RMBundle remoteManagementBundle];
  v5 = [v4 localizedStringForKey:v3 value:&stru_26D79D728 table:0 localization:@"en"];

  return v5;
}

+ (id)createAccountAlreadyExistsErrorWithIdentifier:(id)a3
{
  return (id)[a1 createErrorWithCode:205, 0, @"Error.AccountAlreadyExists_%@", a3 userInfo descriptionKey];
}

+ (id)createAccountMissingErrorWithIdentifier:(id)a3
{
  return (id)[a1 createErrorWithCode:217, 0, @"Error.AccountMissing_%@", a3 userInfo descriptionKey];
}

+ (id)createAlreadyEnrolledInMDMv1Error
{
  return (id)[a1 createErrorWithCode:213 userInfo:0 descriptionKey:@"Error.AlreadyEnrolledInMDMv1"];
}

+ (id)createAssetCannotBeDownloadedErrorWithUnderlyingError:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v9 = *MEMORY[0x263F08608];
    v10[0] = v4;
    v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v7 = [a1 createErrorWithCode:2200 userInfo:v6 descriptionKey:@"Error.AssetCannotBeDownloaded"];
  }
  else
  {
    uint64_t v7 = [a1 createErrorWithCode:2200 userInfo:0 descriptionKey:@"Error.AssetCannotBeDownloaded"];
  }

  return v7;
}

+ (id)createAssetContentTypeCannotBeVerifiedError
{
  return (id)[a1 createErrorWithCode:2201 userInfo:0 descriptionKey:@"Error.AssetContentTypeCannotBeVerified"];
}

+ (id)createAssetSizeCannotBeVerifiedError
{
  return (id)[a1 createErrorWithCode:2202 userInfo:0 descriptionKey:@"Error.AssetSizeCannotBeVerified"];
}

+ (id)createAssetHashCannotBeVerifiedError
{
  return (id)[a1 createErrorWithCode:2203 userInfo:0 descriptionKey:@"Error.AssetHashCannotBeVerified"];
}

+ (id)createAssetCannotProcessFileErrorWithUnderlyingError:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v9 = *MEMORY[0x263F08608];
    v10[0] = v4;
    v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v7 = [a1 createErrorWithCode:2204 userInfo:v6 descriptionKey:@"Error.AssetCannotProcessFile"];
  }
  else
  {
    uint64_t v7 = [a1 createErrorWithCode:2204 userInfo:0 descriptionKey:@"Error.AssetCannotProcessFile"];
  }

  return v7;
}

+ (id)createAssetInvalidError:(id)a3
{
  return (id)[a1 createErrorWithCode:2205, 0, @"Error.AssetInvalid_%@", a3 userInfo descriptionKey];
}

+ (id)createAssetTypeInvalidError:(id)a3
{
  return (id)[a1 createErrorWithCode:2207, 0, @"Error.AssetTypeInvalid_%@", a3 userInfo descriptionKey];
}

+ (id)createAssetInvalidURLError:(id)a3
{
  id v4 = [a3 absoluteString];
  v5 = [a1 createErrorWithCode:2206, 0, @"Error.AssetInvalidURL_%@", v4 userInfo descriptionKey];

  return v5;
}

+ (id)createBootstrapURINotFound
{
  return (id)[a1 createErrorWithCode:207 userInfo:0 descriptionKey:@"Error.BootstrapURINotFound"];
}

+ (id)createCannotChangeValueErrorForPropertyNamed:(id)a3 onObject:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F07F70];
  uint64_t v15 = *MEMORY[0x263EFF190];
  id v16 = a4;
  id v8 = NSDictionary;
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v12 = [a1 _populateDescriptionInUserInfo:v11, @"Error.CannotChangeValue_%@", v10, v15, v16, v17 descriptionKey];

  id v13 = [v6 errorWithDomain:v7 code:1550 userInfo:v12];

  return v13;
}

+ (id)createCMSDecodeErrorWithStatusCode:(int)a3 reason:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v14[2] = *MEMORY[0x263EF8340];
  v13[0] = @"RMCMSDecodeStatusCodeKey";
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  v13[1] = *MEMORY[0x263F08338];
  v14[0] = v8;
  v14[1] = v7;
  id v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v10 = [NSNumber numberWithInt:v4];

  v11 = [a1 createErrorWithCode:102, v9, @"Error.CMSDecodeError_%@", v10, v13[0] userInfo descriptionKey];

  return v11;
}

+ (id)createConnectionNotEntitledWithName:(id)a3
{
  return (id)[a1 createErrorWithCode:2, 0, @"Error.ConnectionNotEntitled_%@", a3 userInfo descriptionKey];
}

+ (id)createCouldNotInstallApp
{
  return (id)[a1 createErrorWithCode:3000 userInfo:0 descriptionKey:@"Error.CouldNotInstallApp"];
}

+ (id)createCouldNotInstallAppWithUnderlyingError:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v9 = *MEMORY[0x263F08608];
    v10[0] = v4;
    v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = [a1 createErrorWithCode:3000 userInfo:v6 descriptionKey:@"Error.CouldNotInstallApp"];
  }
  else
  {
    id v7 = [a1 createErrorWithCode:3000 userInfo:0 descriptionKey:@"Error.CouldNotInstallApp"];
  }

  return v7;
}

+ (id)createCouldNotParseURLErrorWithString:(id)a3
{
  return (id)[a1 createErrorWithCode:210, 0, @"Error.CouldNotParseURL_%@", a3 userInfo descriptionKey];
}

+ (id)createDeclarationNotFoundErrorWithIdentifier:(id)a3
{
  return (id)[a1 createErrorWithCode:216, 0, @"Error.DeclarationNotFound_%@", a3 userInfo descriptionKey];
}

+ (id)createDeviceIdentityNotFoundError
{
  return (id)[a1 createErrorWithCode:100 userInfo:0 descriptionKey:@"Error.DeviceIdentityNotFound"];
}

+ (id)createDisallowedStatusValueErrorWithKeyPath:(id)a3
{
  return (id)[a1 createErrorWithCode:2001, 0, @"Error.DisallowedStatusValue_%@", a3 userInfo descriptionKey];
}

+ (id)createFeatureDisabledError:(id)a3
{
  return (id)[a1 createErrorWithCode:4, 0, @"Error.FeatureDisabled_%@", a3 userInfo descriptionKey];
}

+ (id)createHTTPErrorWithStatusCode:(int64_t)a3 reason:(id)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  v13[0] = @"RMHTTPStatusCodeKey";
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  v13[1] = *MEMORY[0x263F08338];
  v14[0] = v8;
  v14[1] = v7;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v10 = [NSNumber numberWithInteger:a3];

  v11 = [a1 createErrorWithCode:1000, v9, @"Error.HTTPStatus_%@", v10, v13[0] userInfo descriptionKey];

  return v11;
}

+ (id)createIncorrectPayloadTypeErrorWithExpectedType:(id)a3 actualType:(id)a4
{
  return (id)[a1 createErrorWithCode:204, 0, @"Error.IncorrectPayloadType_%@_%@", a3, a4 userInfo descriptionKey];
}

+ (id)createInternalError
{
  return (id)[a1 createErrorWithCode:0 userInfo:0 descriptionKey:@"Error.Internal"];
}

+ (id)createInternalErrorWithDescription:(id)a3
{
  return (id)[a1 createErrorWithCode:0, 0, @"Error.Internal_%@", a3 userInfo descriptionKey];
}

+ (id)createInternalErrorWithUnderlyingError:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v9 = *MEMORY[0x263F08608];
    v10[0] = v4;
    v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = [a1 createErrorWithCode:0 userInfo:v6 descriptionKey:@"Error.Internal"];
  }
  else
  {
    id v7 = [a1 createErrorWithCode:0 userInfo:0 descriptionKey:@"Error.Internal"];
  }

  return v7;
}

+ (id)createInvalidPasscodeError
{
  return (id)[a1 createErrorWithCode:215 userInfo:0 descriptionKey:@"Error.InvalidPasscode"];
}

+ (id)createInvalidStatusValueErrorWithKeyPath:(id)a3
{
  return (id)[a1 createErrorWithCode:2002, 0, @"Error.InvalidStatusValue_%@", a3 userInfo descriptionKey];
}

+ (id)createLicenseNotFound
{
  return (id)[a1 createErrorWithCode:3001 userInfo:0 descriptionKey:@"Error.LicenseNotFound"];
}

+ (id)createManagementSourceNotFoundErrorWithAccountIdentifier:(id)a3
{
  return (id)[a1 createErrorWithCode:200, 0, @"Error.ManagementSourceForAccountNotFound_%@", a3 userInfo descriptionKey];
}

+ (id)createManagementSourceNotFoundErrorWithIdentifier:(id)a3
{
  return (id)[a1 createErrorWithCode:200, 0, @"Error.ManagementSourceNotFound_%@", a3 userInfo descriptionKey];
}

+ (id)createManagementSourceAlreadyExistsErrorWithAccountIdentifier:(id)a3
{
  return (id)[a1 createErrorWithCode:201, 0, @"Error.ManagementSourceAlreadyExists_%@", a3 userInfo descriptionKey];
}

+ (id)createManagementSourceAlreadyExistsErrorWithURI:(id)a3
{
  return (id)[a1 createErrorWithCode:201, 0, @"Error.ManagementSourceAlreadyExists_%@", a3 userInfo descriptionKey];
}

+ (id)createMDMRequestFailed:(id)a3
{
  return (id)[a1 createErrorWithCode:1100, 0, @"Error.MDMRequestFailed_%@", a3 userInfo descriptionKey];
}

+ (id)createMDMRequestInvalid:(id)a3
{
  return (id)[a1 createErrorWithCode:1101, 0, @"Error.MDMRequestInvalid_%@", a3 userInfo descriptionKey];
}

+ (id)createMismatchedValuesErrorForPropertyNamed:(id)a3 onObject:(id)a4 expected:(id)a5 actual:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v10 = *MEMORY[0x263EFF188];
  uint64_t v22 = *MEMORY[0x263EFF190];
  uint64_t v23 = v10;
  id v25 = a4;
  id v26 = a3;
  uint64_t v24 = *MEMORY[0x263EFF198];
  id v27 = a5;
  v11 = NSDictionary;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v11 dictionaryWithObjects:&v25 forKeys:&v22 count:3];
  uint64_t v17 = (void *)MEMORY[0x263F087E8];
  uint64_t v18 = *MEMORY[0x263F07F70];
  id v19 = [a1 _populateDescriptionInUserInfo:v16, @"Error.MismatchedValues_%@_%@_%@", v15, v13, v12, v22, v23, v24, v25, v26, v27, v28 descriptionKey];

  v20 = [v17 errorWithDomain:v18 code:1550 userInfo:v19];

  return v20;
}

+ (id)createMissingMandatoryPropertyErrorWithPropertyNamed:(id)a3 onObject:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263EFF188];
  uint64_t v16 = *MEMORY[0x263EFF190];
  uint64_t v17 = v6;
  id v18 = a4;
  id v19 = a3;
  id v7 = NSDictionary;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 dictionaryWithObjects:&v18 forKeys:&v16 count:2];
  v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = *MEMORY[0x263F07F70];
  id v13 = [a1 _populateDescriptionInUserInfo:v10, @"Error.MissingMandatoryProperty_%@", v9, v16, v17, v18, v19, v20 descriptionKey];
  id v14 = [v11 errorWithDomain:v12 code:1570 userInfo:v13];

  return v14;
}

+ (id)createMissingReferralURLError
{
  return (id)[a1 createErrorWithCode:209 userInfo:0 descriptionKey:@"Error.MissingReferralURL"];
}

+ (id)createMissingServerResponseItemErrorWithName:(id)a3
{
  return (id)[a1 createErrorWithCode:1003, 0, @"Error.MissingServerResponseItem_%@", a3 userInfo descriptionKey];
}

+ (id)createMobileKeyBagErrorWithCode:(int64_t)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = @"RMMobileKeyBagErrorCodeKey";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  v11[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v7 = [NSNumber numberWithInteger:a3];
  id v8 = [a1 createErrorWithCode:101, v6, @"Error.MobileKeyBagError_%@", v7 userInfo descriptionKey];

  return v8;
}

+ (id)createMultipleErrorOrReturnTheSingleErrorWithErrors:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((unint64_t)[v4 count] > 1)
  {
    uint64_t v9 = *MEMORY[0x263EFEFF0];
    uint64_t v6 = (void *)[v4 copy];

    v10[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v5 = [a1 createErrorWithCode:3 userInfo:v7 descriptionKey:@"Error.Multiple"];
  }
  else
  {
    v5 = [v4 firstObject];
  }

  return v5;
}

+ (id)createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:(id)a3
{
  void v13[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ((unint64_t)[v3 count] > 1)
  {
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = *MEMORY[0x263F07F70];
    uint64_t v7 = *MEMORY[0x263F07F80];
    v13[0] = @"Multiple validation errors occurred.";
    uint64_t v8 = *MEMORY[0x263EFEFF0];
    v12[0] = v7;
    v12[1] = v8;
    uint64_t v9 = (void *)[v3 copy];

    v13[1] = v9;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    id v4 = [v5 errorWithDomain:v6 code:1560 userInfo:v10];
  }
  else
  {
    id v4 = [v3 firstObject];
  }

  return v4;
}

+ (id)createNotImplementedErrorForFeature:(id)a3
{
  return (id)[a1 createErrorWithCode:1, 0, @"Error.NotImplemented_%@", a3 userInfo descriptionKey];
}

+ (id)createOrganizationProofInvalidError
{
  return (id)[a1 createErrorWithCode:206 userInfo:0 descriptionKey:@"Error.OrganizationProofInvalid"];
}

+ (id)createProfileCannotBeInstalledBySource:(id)a3 source:(id)a4
{
  return (id)[a1 createErrorWithCode:1208, 0, @"Error.ProfileCannotBeInstalledBySource_%@_%@", a3, a4 userInfo descriptionKey];
}

+ (id)createProfileCannotFindRemoveProfile:(id)a3
{
  return (id)[a1 createErrorWithCode:1207, 0, @"Error.ProfileCannotFindRemoveProfile_%@", a3 userInfo descriptionKey];
}

+ (id)createProfileCannotRemoveOtherProfile:(id)a3
{
  return (id)[a1 createErrorWithCode:1206, 0, @"Error.ProfileCannotRemoveOtherProfile_%@", a3 userInfo descriptionKey];
}

+ (id)createProfileCannotReplaceOtherProfile:(id)a3
{
  return (id)[a1 createErrorWithCode:1205, 0, @"Error.ProfileCannotReplaceOtherProfile_%@", a3 userInfo descriptionKey];
}

+ (id)createProfileInvalidErrorWithUnderlyingError:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v9 = *MEMORY[0x263F08608];
    v10[0] = v4;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v7 = [a1 createErrorWithCode:1200 userInfo:v6 descriptionKey:@"Error.ProfileInvalid"];
  }
  else
  {
    uint64_t v7 = [a1 createErrorWithCode:1200 userInfo:0 descriptionKey:@"Error.ProfileInvalid"];
  }

  return v7;
}

+ (id)createProfilePayloadInvalidKey:(id)a3 key:(id)a4
{
  return (id)[a1 createErrorWithCode:1203, 0, @"Error.ProfilePayloadInvalidKey_%@_%@", a3, a4 userInfo descriptionKey];
}

+ (id)createProfilePayloadInvalidKeyItems:(id)a3 key:(id)a4
{
  return (id)[a1 createErrorWithCode:1204, 0, @"Error.ProfilePayloadInvalidKeyItems_%@_%@", a3, a4 userInfo descriptionKey];
}

+ (id)createProfilePayloadMissingKey:(id)a3 key:(id)a4
{
  return (id)[a1 createErrorWithCode:1202, 0, @"Error.ProfilePayloadMissingKey_%@_%@", a3, a4 userInfo descriptionKey];
}

+ (id)createProfilePayloadNotAllowedErrorWithPayloadType:(id)a3
{
  return (id)[a1 createErrorWithCode:1201, 0, @"Error.ProfilePayloadNotAllowed_%@", a3 userInfo descriptionKey];
}

+ (id)createServiceDiscoveryInvalidUserIdentifierWithReason:(id)a3
{
  return (id)[a1 createErrorWithCode:300, 0, @"Error.ServiceDiscoveryInvalidUserIdentifier_%@", a3 userInfo descriptionKey];
}

+ (id)createServiceDiscoveryWellKnownFailedWithReason:(id)a3
{
  return (id)[a1 createErrorWithCode:301, 0, @"Error.ServiceDiscoveryWellKnownFailed_%@", a3 userInfo descriptionKey];
}

+ (id)createServiceDiscoveryWellKnownInvalidWithReason:(id)a3
{
  return (id)[a1 createErrorWithCode:302, 0, @"Error.ServiceDiscoveryWellKnownInvalid_%@", a3 userInfo descriptionKey];
}

+ (id)createStatePreventsSyncingError
{
  return (id)[a1 createErrorWithCode:214 userInfo:0 descriptionKey:@"Error.StatePreventsSyncing"];
}

+ (id)createTooManyFailedAuthenticationsError
{
  return (id)[a1 createErrorWithCode:211 userInfo:0 descriptionKey:@"Error.TooManyFailedAuthentications"];
}

+ (id)createTooManyReferralsError
{
  return (id)[a1 createErrorWithCode:208 userInfo:0 descriptionKey:@"Error.TooManyReferrals"];
}

+ (id)createTooManyDeviceManagementSourcesError
{
  return (id)[a1 createErrorWithCode:202 userInfo:0 descriptionKey:@"Error.TooManyDeviceManagementSources"];
}

+ (id)createUnableToEvaluatePredicateErrorWithFormat:(id)a3 reason:(id)a4
{
  return (id)[a1 createErrorWithCode:2100, 0, @"Error.UnableToEvaluatePredicate_%@_%@", a3, a4 userInfo descriptionKey];
}

+ (id)createUnableToParsePredicateErrorWithFormat:(id)a3 reason:(id)a4
{
  return (id)[a1 createErrorWithCode:2101, 0, @"Error.UnableToParsePredicate_%@_%@", a3, a4 userInfo descriptionKey];
}

+ (id)createUnableToParsePredicateErrorWithCustomOperator:(id)a3 predicateFormat:(id)a4
{
  return (id)[a1 createErrorWithCode:2102, 0, @"Error.UnableToParsePredicateWithCustomOperator_%@_%@", a4, a3 userInfo descriptionKey];
}

+ (id)createUnhandledContentTypeErrorWithContentType:(id)a3
{
  return (id)[a1 createErrorWithCode:1001, 0, @"Error.UnhandledContentType_%@", a3 userInfo descriptionKey];
}

+ (id)createUnsupportedAuthenticationSchemeErrorWithScheme:(id)a3
{
  return (id)[a1 createErrorWithCode:212, 0, @"Error.UnsupportedAuthenticationScheme_%@", a3 userInfo descriptionKey];
}

+ (id)createUnsupportedStatusValueErrorWithKeyPath:(id)a3
{
  return (id)[a1 createErrorWithCode:2000, 0, @"Error.UnsupportedStatusValue_%@", a3 userInfo descriptionKey];
}

+ (id)createUnverifiedDownloadHashErrorWithURL:(id)a3
{
  id v4 = [a3 absoluteString];
  v5 = [a1 createErrorWithCode:1004, 0, @"Error.UnverifiedDownloadHash_%@", v4 userInfo descriptionKey];

  return v5;
}

+ (id)createUnverifiedDownloadSizeErrorWithURL:(id)a3
{
  id v4 = [a3 absoluteString];
  v5 = [a1 createErrorWithCode:1005, 0, @"Error.UnverifiedDownloadSize_%@", v4 userInfo descriptionKey];

  return v5;
}

+ (id)convertSwiftError:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [v3 localizedDescription];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08320]];

  uint64_t v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = [v3 domain];
  uint64_t v8 = [v3 code];

  uint64_t v9 = [v6 errorWithDomain:v7 code:v8 userInfo:v4];

  return v9;
}

+ (BOOL)convertSwiftErrorReference:(id *)a3
{
  if (a3 && *a3)
  {
    +[RMErrorUtilities convertSwiftError:](RMErrorUtilities, "convertSwiftError:");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1;
}

@end
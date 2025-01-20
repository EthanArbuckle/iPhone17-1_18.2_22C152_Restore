@interface CEMSystemRatingsDeclaration
- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMSystemRatingsDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  CFStringRef v14 = @"countryCode";
  id v6 = a3;
  uint64_t v7 = [(CEMSystemRatingsDeclaration *)self payloadRatingRegion];
  v8 = (void *)v7;
  CFStringRef v9 = &stru_1000CC390;
  if (v7) {
    CFStringRef v9 = (const __CFString *)v7;
  }
  CFStringRef v15 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  CFPreferencesSetAppValue(@"SBParentalControlsMCContentRestrictions", v10, @"com.apple.springboard");
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  v11 = [v6 assetProvidersByPayloadIdentifier];

  v12 = [(CEMSystemRatingsDeclaration *)self dmf_installSynthesizedProfileRequestWithAssetProviders:v11 error:a4];

  return v12;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  return [(CEMSystemRatingsDeclaration *)self dmf_removeSynthesizedProfileRequestWithError:a4];
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0;
}

@end
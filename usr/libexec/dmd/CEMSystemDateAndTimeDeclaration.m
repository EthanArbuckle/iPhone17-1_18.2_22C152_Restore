@interface CEMSystemDateAndTimeDeclaration
- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMSystemDateAndTimeDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  v6 = [a3 assetProvidersByPayloadIdentifier];
  v7 = [(CEMSystemDateAndTimeDeclaration *)self dmf_installSynthesizedProfileRequestWithAssetProviders:v6 error:a4];

  return v7;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  return [(CEMSystemDateAndTimeDeclaration *)self dmf_removeSynthesizedProfileRequestWithError:a4];
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0;
}

@end
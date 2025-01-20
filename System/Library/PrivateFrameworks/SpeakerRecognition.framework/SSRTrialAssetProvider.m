@interface SSRTrialAssetProvider
- (SSRTrialAssetProvider)init;
- (id)installedAssetOfType:(unint64_t)a3 forLanguageCode:(id)a4;
- (unint64_t)getAssetProviderType;
@end

@implementation SSRTrialAssetProvider

- (unint64_t)getAssetProviderType
{
  return 1;
}

- (id)installedAssetOfType:(unint64_t)a3 forLanguageCode:(id)a4
{
  return 0;
}

- (SSRTrialAssetProvider)init
{
  return 0;
}

@end
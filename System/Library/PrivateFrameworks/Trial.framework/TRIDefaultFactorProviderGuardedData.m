@interface TRIDefaultFactorProviderGuardedData
@end

@implementation TRIDefaultFactorProviderGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->containerIds, 0);
  objc_storeStrong((id *)&self->factorProviders, 0);
  objc_storeStrong((id *)&self->namespaceResolver, 0);
}

@end
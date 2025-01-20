@interface TRICellularParameterGuardedData
- (id)description;
@end

@implementation TRICellularParameterGuardedData

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@,bundleId:%@,countryCode:%@>", objc_opt_class(), self->guardedCarrierBundleIdentifier, self->guardedCarrierCountryIsoCode];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->guardedCarrierCountryIsoCode, 0);
  objc_storeStrong((id *)&self->guardedCarrierBundleIdentifier, 0);
}

@end
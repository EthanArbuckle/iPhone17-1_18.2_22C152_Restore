@interface ClimateSensorIntentTypeResolutionResult
+ (BOOL)supportsSecureCoding;
+ (id)confirmationRequiredWithClimateSensorIntentTypeToConfirm:(id)a3;
+ (id)disambiguationWithClimateSensorIntentTypesToDisambiguate:(id)a3;
+ (id)successWithResolvedClimateSensorIntentType:(id)a3;
@end

@implementation ClimateSensorIntentTypeResolutionResult

+ (id)successWithResolvedClimateSensorIntentType:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ClimateSensorIntentTypeResolutionResult;
  [super successWithResolvedObject:a3];

  return v3;
}

+ (id)disambiguationWithClimateSensorIntentTypesToDisambiguate:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ClimateSensorIntentTypeResolutionResult;
  v3 = [super disambiguationWithObjectsToDisambiguate:a3];

  return v3;
}

+ (id)confirmationRequiredWithClimateSensorIntentTypeToConfirm:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ClimateSensorIntentTypeResolutionResult;
  v3 = [super confirmationRequiredWithObjectToConfirm:a3];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
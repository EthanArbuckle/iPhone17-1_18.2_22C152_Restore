@interface DMDFetchDeclarationCapabilitiesOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchDeclarationCapabilitiesOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2CF0;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DMDFetchDeclarationCapabilitiesOperation;
  return [super validateRequest:a3 error:a4];
}

- (unint64_t)queueGroup
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v11 = (id)objc_opt_new();
  v4 = +[DMDConfigurationCapabilities supportedCommandTypes];
  [v11 setSupportedCommands:v4];

  objc_super v5 = +[DMDConfigurationCapabilities supportedAssetTypes];
  [v11 setSupportedAssets:v5];

  v6 = +[DMDConfigurationCapabilities supportedConfigurationTypes];
  [v11 setSupportedConfigurations:v6];

  v7 = +[DMDConfigurationCapabilities supportedEventTypes];
  [v11 setSupportedEvents:v7];

  v8 = +[DMDConfigurationCapabilities supportedActivationTypes];
  [v11 setSupportedActivations:v8];

  v9 = +[DMDConfigurationCapabilities supportedPredicateTypes];
  [v11 setSupportedPredicates:v9];

  v10 = +[DMDConfigurationCapabilities supportedMessageTypes];
  [v11 setSupportedMessages:v10];

  [(DMDFetchDeclarationCapabilitiesOperation *)self endOperationWithResultObject:v11];
}

@end
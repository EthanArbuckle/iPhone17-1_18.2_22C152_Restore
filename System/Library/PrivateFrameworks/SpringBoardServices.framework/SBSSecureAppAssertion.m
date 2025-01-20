@interface SBSSecureAppAssertion
+ (id)acquireSecureAppAssertionWithType:(unint64_t)a3 errorHandler:(id)a4;
+ (id)acquireSecureAppAssertionWithType:(unint64_t)a3 supportedOrientations:(unint64_t)a4 errorHandler:(id)a5;
- (BOOL)_supportsReacquisition;
- (SBSLockScreenContentAssertion)actualAssertion;
- (void)setActualAssertion:(id)a3;
@end

@implementation SBSSecureAppAssertion

+ (id)acquireSecureAppAssertionWithType:(unint64_t)a3 errorHandler:(id)a4
{
  id v6 = a4;
  v7 = SBSIdentifierForSecureAppType(a3);
  v8 = [a1 acquireContentProviderAssertionForType:2 slot:@"App" identifier:v7 configurationObject:0 errorHandler:v6];

  return v8;
}

+ (id)acquireSecureAppAssertionWithType:(unint64_t)a3 supportedOrientations:(unint64_t)a4 errorHandler:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1C9E8];
  v9 = (void *)MEMORY[0x1E4F28ED0];
  id v10 = a5;
  v11 = [v9 numberWithUnsignedInteger:a4];
  v12 = [v8 dictionaryWithObject:v11 forKey:@"SBSLockScreenContentActionConfigurationKeySupportedOrientations"];

  v13 = SBSIdentifierForSecureAppType(a3);
  v14 = [a1 acquireContentProviderAssertionForType:2 slot:@"App" identifier:v13 configurationObject:v12 errorHandler:v10];

  return v14;
}

- (BOOL)_supportsReacquisition
{
  return 1;
}

- (SBSLockScreenContentAssertion)actualAssertion
{
  return self->_actualAssertion;
}

- (void)setActualAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
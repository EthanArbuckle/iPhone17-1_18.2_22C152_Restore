@interface RTManagedConfiguration
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)effectiveBoolValueForSetting:(id)a3;
- (BOOL)isDiagnosticsAndUsageAllowed;
- (BOOL)isFindMyCarAllowed;
- (BOOL)isHealthDataSubmissionAllowed;
- (RTManagedConfigurationObserver)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation RTManagedConfiguration

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[RTManagedConfiguration allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___RTManagedConfiguration;
    return [super allocWithZone:a3];
  }
}

- (BOOL)effectiveBoolValueForSetting:(id)a3
{
  return 0;
}

- (BOOL)isDiagnosticsAndUsageAllowed
{
  return 0;
}

- (BOOL)isFindMyCarAllowed
{
  return 0;
}

- (BOOL)isHealthDataSubmissionAllowed
{
  return 0;
}

- (RTManagedConfigurationObserver)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTManagedConfigurationObserver *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
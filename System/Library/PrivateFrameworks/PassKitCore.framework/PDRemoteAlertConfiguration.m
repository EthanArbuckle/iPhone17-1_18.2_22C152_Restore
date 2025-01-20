@interface PDRemoteAlertConfiguration
- (PDRemoteAlertConfiguration)init;
@end

@implementation PDRemoteAlertConfiguration

- (PDRemoteAlertConfiguration)init
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationContext, 0);
  objc_storeStrong((id *)&self->_configurationContext, 0);
  objc_storeStrong((id *)&self->_definition, 0);
}

@end
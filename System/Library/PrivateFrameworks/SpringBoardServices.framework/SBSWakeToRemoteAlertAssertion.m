@interface SBSWakeToRemoteAlertAssertion
+ (id)acquireWakeToRemoteAlertAssertionWithDefinition:(id)a3 errorHandler:(id)a4;
@end

@implementation SBSWakeToRemoteAlertAssertion

+ (id)acquireWakeToRemoteAlertAssertionWithDefinition:(id)a3 errorHandler:(id)a4
{
  return (id)[a1 acquireContentProviderAssertionForType:2 slot:@"RemoteAlert" identifier:@"RemoteAlert" configurationObject:a3 errorHandler:a4];
}

@end
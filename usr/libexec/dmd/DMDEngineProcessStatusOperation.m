@interface DMDEngineProcessStatusOperation
- (NSString)organizationIdentifier;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
@end

@implementation DMDEngineProcessStatusOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  v4 = +[NSNotificationCenter defaultCenter];
  v5 = [(DMDEngineProcessStatusOperation *)self organizationIdentifier];
  [v4 postNotificationName:@"DMDConfigurationSourceStatusDidChange" object:v5];

  [(DMDEngineProcessStatusOperation *)self setResultObject:0];
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
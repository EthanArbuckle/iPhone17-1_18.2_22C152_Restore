@interface _PBFPosterRoleProcessorTransactionResult
- (NSArray)emittedEvents;
- (NSDictionary)collectionDiffsPerRole;
- (NSDictionary)postCommitActivePosterConfigurationForRole;
- (NSDictionary)preCommitActivePosterConfigurationForRole;
- (NSSet)affectedRoles;
- (void)setAffectedRoles:(id)a3;
- (void)setCollectionDiffsPerRole:(id)a3;
- (void)setEmittedEvents:(id)a3;
- (void)setPostCommitActivePosterConfigurationForRole:(id)a3;
- (void)setPreCommitActivePosterConfigurationForRole:(id)a3;
@end

@implementation _PBFPosterRoleProcessorTransactionResult

- (NSDictionary)collectionDiffsPerRole
{
  return self->_collectionDiffsPerRole;
}

- (void)setCollectionDiffsPerRole:(id)a3
{
}

- (NSSet)affectedRoles
{
  return self->_affectedRoles;
}

- (void)setAffectedRoles:(id)a3
{
}

- (NSDictionary)preCommitActivePosterConfigurationForRole
{
  return self->_preCommitActivePosterConfigurationForRole;
}

- (void)setPreCommitActivePosterConfigurationForRole:(id)a3
{
}

- (NSDictionary)postCommitActivePosterConfigurationForRole
{
  return self->_postCommitActivePosterConfigurationForRole;
}

- (void)setPostCommitActivePosterConfigurationForRole:(id)a3
{
}

- (NSArray)emittedEvents
{
  return self->_emittedEvents;
}

- (void)setEmittedEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emittedEvents, 0);
  objc_storeStrong((id *)&self->_postCommitActivePosterConfigurationForRole, 0);
  objc_storeStrong((id *)&self->_preCommitActivePosterConfigurationForRole, 0);
  objc_storeStrong((id *)&self->_affectedRoles, 0);
  objc_storeStrong((id *)&self->_collectionDiffsPerRole, 0);
}

@end
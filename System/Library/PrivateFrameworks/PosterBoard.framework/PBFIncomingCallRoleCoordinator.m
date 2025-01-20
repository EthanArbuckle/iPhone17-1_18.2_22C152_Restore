@interface PBFIncomingCallRoleCoordinator
- (PBFIncomingCallRoleCoordinator)initWithStorage:(id)a3 modelCoordinatorProvider:(id)a4 providers:(id)a5;
@end

@implementation PBFIncomingCallRoleCoordinator

- (PBFIncomingCallRoleCoordinator)initWithStorage:(id)a3 modelCoordinatorProvider:(id)a4 providers:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F92788];
  v10.receiver = self;
  v10.super_class = (Class)PBFIncomingCallRoleCoordinator;
  return [(PBFPosterRoleCoordinator *)&v10 initWithRole:v8 storage:a3 modelCoordinatorProvider:a4 providers:a5];
}

@end
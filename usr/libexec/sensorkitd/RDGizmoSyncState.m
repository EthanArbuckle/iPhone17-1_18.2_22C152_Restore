@interface RDGizmoSyncState
- (void)dealloc;
@end

@implementation RDGizmoSyncState

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RDGizmoSyncState;
  [(RDGizmoSyncState *)&v3 dealloc];
}

@end
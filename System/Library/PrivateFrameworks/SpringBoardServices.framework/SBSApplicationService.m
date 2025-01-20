@interface SBSApplicationService
- (void)deleteSnapshotsForApplicationIdentifier:(id)a3;
@end

@implementation SBSApplicationService

- (void)deleteSnapshotsForApplicationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSAbstractApplicationService *)self client];
  [v5 deleteSnapshotsForApplicationIdentifier:v4];
}

@end
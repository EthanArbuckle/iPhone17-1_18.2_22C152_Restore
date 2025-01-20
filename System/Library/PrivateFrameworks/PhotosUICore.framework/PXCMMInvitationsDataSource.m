@interface PXCMMInvitationsDataSource
- (id)invitationAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)invitationForObjectID:(id)a3;
- (id)objectIDAtItemIndexPath:(PXSimpleIndexPath *)a3;
@end

@implementation PXCMMInvitationsDataSource

- (id)invitationForObjectID:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXCMMInvitationsDataSourceManager.m", 115, @"Method %s is a responsibility of subclass %@", "-[PXCMMInvitationsDataSource invitationForObjectID:]", v8 object file lineNumber description];

  abort();
}

- (id)objectIDAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXCMMInvitationsDataSourceManager.m", 111, @"Method %s is a responsibility of subclass %@", "-[PXCMMInvitationsDataSource objectIDAtItemIndexPath:]", v7 object file lineNumber description];

  abort();
}

- (id)invitationAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v6[1] = v3;
  v4 = [(PXCMMInvitationsDataSource *)self objectAtIndexPath:v6];
  return v4;
}

@end
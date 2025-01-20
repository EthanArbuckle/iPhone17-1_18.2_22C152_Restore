@interface REMCDHashtagLabel
+ (BOOL)conformsToREMChangeTrackingIdentifiable;
+ (NSString)cdEntityName;
+ (id)fetchRequest;
- (BOOL)didCleanUpManualSortHintOnDeletion;
- (BOOL)didEnqueueApprovalCascade;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForInsert_Swift:(id *)a3;
- (BOOL)wasDeletedDueToUserInitiatedChanges;
- (id)remChangedObjectID;
- (void)didSave;
- (void)didSave_Swift;
- (void)setDidCleanUpManualSortHintOnDeletion:(BOOL)a3;
- (void)setDidEnqueueApprovalCascade:(BOOL)a3;
- (void)setWasDeletedDueToUserInitiatedChanges:(BOOL)a3;
- (void)willSave;
- (void)willSave_Swift;
@end

@implementation REMCDHashtagLabel

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDHashtagLabel"];
}

- (BOOL)validateForInsert:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)REMCDHashtagLabel;
  if (!-[REMCDHashtagLabel validateForInsert:](&v12, "validateForInsert:")) {
    return 0;
  }
  v5 = [(REMCDHashtagLabel *)self accountIdentifier];
  id v6 = [v5 length];

  if (!v6)
  {
    v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100751EAC(self, v7);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  v8 = self;
  unsigned __int8 v9 = [(REMCDHashtagLabel *)v8 validateForInsert_Swift:a3];
  if (a3 && *a3)
  {
    v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100751DB0(v8, (uint64_t *)a3, v10);
    }
  }
  return v9;
}

- (void)willSave
{
  v5.receiver = self;
  v5.super_class = (Class)REMCDHashtagLabel;
  [(REMCDHashtagLabel *)&v5 willSave];
  v3 = [(REMCDHashtagLabel *)self uuidForChangeTracking];

  if (!v3)
  {
    v4 = +[NSUUID UUID];
    [(REMCDHashtagLabel *)self setUuidForChangeTracking:v4];
  }
  if (objc_opt_respondsToSelector()) {
    [(REMCDHashtagLabel *)self willSave_Swift];
  }
}

- (void)didSave
{
  v3.receiver = self;
  v3.super_class = (Class)REMCDHashtagLabel;
  [(REMCDHashtagLabel *)&v3 didSave];
  if (objc_opt_respondsToSelector()) {
    [(REMCDHashtagLabel *)self didSave_Swift];
  }
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDHashtagLabel";
}

+ (BOOL)conformsToREMChangeTrackingIdentifiable
{
  return 1;
}

- (id)remChangedObjectID
{
  objc_super v3 = [(REMCDHashtagLabel *)self uuidForChangeTracking];
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    id v6 = +[REMObjectID objectIDWithUUID:v3 entityName:v5];
  }
  else
  {
    v7 = +[REMLogStore read];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100751FB4(self, v7);
    }

    id v6 = 0;
  }

  return v6;
}

- (BOOL)didCleanUpManualSortHintOnDeletion
{
  return self->didCleanUpManualSortHintOnDeletion;
}

- (void)setDidCleanUpManualSortHintOnDeletion:(BOOL)a3
{
  self->didCleanUpManualSortHintOnDeletion = a3;
}

- (BOOL)wasDeletedDueToUserInitiatedChanges
{
  return self->wasDeletedDueToUserInitiatedChanges;
}

- (void)setWasDeletedDueToUserInitiatedChanges:(BOOL)a3
{
  self->wasDeletedDueToUserInitiatedChanges = a3;
}

- (BOOL)didEnqueueApprovalCascade
{
  return self->didEnqueueApprovalCascade;
}

- (void)setDidEnqueueApprovalCascade:(BOOL)a3
{
  self->didEnqueueApprovalCascade = a3;
}

- (void)willSave_Swift
{
  v2 = self;
  if (![(REMCDHashtagLabel *)v2 didCleanUpManualSortHintOnDeletion])
  {
    [(REMCDHashtagLabel *)v2 setDidCleanUpManualSortHintOnDeletion:1];
    sub_100436E20();
  }
}

- (void)didSave_Swift
{
}

- (BOOL)validateForInsert_Swift:(id *)a3
{
  objc_super v3 = self;
  if (![(REMCDHashtagLabel *)v3 didEnqueueApprovalCascade])
  {
    [(REMCDHashtagLabel *)v3 setDidEnqueueApprovalCascade:1];
    sub_100437F48();
  }

  return 1;
}

@end
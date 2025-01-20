@interface REMRemindersListDataView.AppIntentsSectionsInvocation.BaseList
- (REMObjectID)remObjectID;
@end

@implementation REMRemindersListDataView.AppIntentsSectionsInvocation.BaseList

- (REMObjectID)remObjectID
{
  return (REMObjectID *)*(id *)self->remObjectID;
}

@end
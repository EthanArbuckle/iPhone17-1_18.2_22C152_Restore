@interface REMRemindersListDataView.GroupSectionsInvocation.PolymorphicListItem
- (REMObjectID)remObjectID;
@end

@implementation REMRemindersListDataView.GroupSectionsInvocation.PolymorphicListItem

- (REMObjectID)remObjectID
{
  id v2 = [(id)(*(void *)self->modelObject & 0x7FFFFFFFFFFFFFFFLL) remObjectID];

  return (REMObjectID *)v2;
}

@end
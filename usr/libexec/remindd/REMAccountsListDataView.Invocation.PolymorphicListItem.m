@interface REMAccountsListDataView.Invocation.PolymorphicListItem
- (REMObjectID)remObjectID;
@end

@implementation REMAccountsListDataView.Invocation.PolymorphicListItem

- (REMObjectID)remObjectID
{
  id v2 = [(id)(*(void *)self->modelObject & 0x7FFFFFFFFFFFFFFFLL) remObjectID];

  return (REMObjectID *)v2;
}

@end
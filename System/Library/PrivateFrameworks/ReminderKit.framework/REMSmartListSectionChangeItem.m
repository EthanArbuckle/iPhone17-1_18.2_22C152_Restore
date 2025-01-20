@interface REMSmartListSectionChangeItem
+ (id)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (REMSmartListSectionChangeItem)initWithObjectID:(id)a3 displayName:(id)a4 insertIntoSmartListChangeItem:(id)a5;
- (void)removeFromSmartList;
@end

@implementation REMSmartListSectionChangeItem

- (REMSmartListSectionChangeItem)initWithObjectID:(id)a3 displayName:(id)a4 insertIntoSmartListChangeItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v9)
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "displayName");
    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    NSLog(&cfstr_SIsUnexpectedl.isa, "smartListChangeItem");
    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v12 = [v11 accountID];
  v13 = [REMSmartListSectionStorage alloc];
  v14 = [v11 objectID];
  v15 = [(REMSmartListSectionStorage *)v13 initWithObjectID:v8 accountID:v12 smartListID:v14 displayName:v9];

  v16 = [v11 saveRequest];
  v17 = [v11 accountCapabilities];
  v20.receiver = self;
  v20.super_class = (Class)REMSmartListSectionChangeItem;
  v18 = [(REMBaseSectionChangeItem *)&v20 initWithSaveRequest:v16 storage:v15 accountCapabilities:v17 observeInitialValues:1];

  return v18;
}

- (void)removeFromSmartList
{
}

+ (id)newObjectID
{
  return +[REMBaseSectionStorage newObjectID];
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMBaseSectionStorage objectIDWithUUID:a3];
}

+ (id)cdEntityName
{
  return +[REMSmartListSectionStorage cdEntityName];
}

@end
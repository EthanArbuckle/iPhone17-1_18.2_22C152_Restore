@interface REMListSectionChangeItem
+ (id)cdEntityName;
+ (id)keysToObserve;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (REMListSectionChangeItem)initWithObjectID:(id)a3 displayName:(id)a4 insertIntoListChangeItem:(id)a5;
- (void)removeFromList;
@end

@implementation REMListSectionChangeItem

+ (id)keysToObserve
{
  if (keysToObserve_onceToken != -1) {
    dispatch_once(&keysToObserve_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)keysToObserve___sKeysToObserve;

  return v2;
}

void __41__REMListSectionChangeItem_keysToObserve__block_invoke()
{
  id v2 = +[REMBaseSectionChangeItem keysToObserve];
  uint64_t v0 = [v2 arrayByAddingObjectsFromArray:&unk_1F136C098];
  v1 = (void *)keysToObserve___sKeysToObserve;
  keysToObserve___sKeysToObserve = v0;
}

- (REMListSectionChangeItem)initWithObjectID:(id)a3 displayName:(id)a4 insertIntoListChangeItem:(id)a5
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
    NSLog(&cfstr_SIsUnexpectedl.isa, "listChangeItem");
    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v12 = [v11 accountID];
  v13 = [REMListSectionStorage alloc];
  v14 = [v11 objectID];
  v15 = [(REMListSectionStorage *)v13 initWithObjectID:v8 accountID:v12 listID:v14 displayName:v9];

  v16 = [v11 saveRequest];
  v17 = [v11 accountCapabilities];
  v20.receiver = self;
  v20.super_class = (Class)REMListSectionChangeItem;
  v18 = [(REMBaseSectionChangeItem *)&v20 initWithSaveRequest:v16 storage:v15 accountCapabilities:v17 observeInitialValues:1];

  return v18;
}

- (void)removeFromList
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
  return +[REMListSectionStorage cdEntityName];
}

@end
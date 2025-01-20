@interface REMTemplateSectionChangeItem
+ (id)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (REMTemplateSectionChangeItem)initWithObjectID:(id)a3 displayName:(id)a4 insertIntoTemplateChangeItem:(id)a5;
- (void)removeFromParentTemplate;
@end

@implementation REMTemplateSectionChangeItem

- (REMTemplateSectionChangeItem)initWithObjectID:(id)a3 displayName:(id)a4 insertIntoTemplateChangeItem:(id)a5
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
    NSLog(&cfstr_SIsUnexpectedl.isa, "templateChangeItem");
    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v12 = [v11 accountID];
  v13 = [REMTemplateSectionStorage alloc];
  v14 = [v11 objectID];
  v15 = [(REMTemplateSectionStorage *)v13 initWithObjectID:v8 accountID:v12 parentTemplateID:v14 displayName:v9];

  v16 = [v11 saveRequest];
  v17 = [v11 accountCapabilities];
  v20.receiver = self;
  v20.super_class = (Class)REMTemplateSectionChangeItem;
  v18 = [(REMBaseSectionChangeItem *)&v20 initWithSaveRequest:v16 storage:v15 accountCapabilities:v17 observeInitialValues:1];

  return v18;
}

- (void)removeFromParentTemplate
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
  return +[REMTemplateSectionStorage cdEntityName];
}

@end
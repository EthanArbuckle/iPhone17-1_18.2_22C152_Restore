@interface REMListSection
+ (id)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (REMList)list;
- (REMListSection)initWithStore:(id)a3 list:(id)a4 storage:(id)a5;
@end

@implementation REMListSection

- (REMListSection)initWithStore:(id)a3 list:(id)a4 storage:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 account];
  v13 = [v12 capabilities];
  v16.receiver = self;
  v16.super_class = (Class)REMListSection;
  v14 = [(REMBaseSection *)&v16 initWithStore:v11 accountCapabilities:v13 storage:v10];

  if (v14) {
    objc_storeStrong((id *)&v14->_list, a4);
  }

  return v14;
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

- (REMList)list
{
  return self->_list;
}

- (void).cxx_destruct
{
}

@end
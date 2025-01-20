@interface REMSmartListSection
+ (id)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (REMSmartList)smartList;
- (REMSmartListSection)initWithStore:(id)a3 smartList:(id)a4 storage:(id)a5;
@end

@implementation REMSmartListSection

- (REMSmartListSection)initWithStore:(id)a3 smartList:(id)a4 storage:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 accountCapabilities];
  v15.receiver = self;
  v15.super_class = (Class)REMSmartListSection;
  v13 = [(REMBaseSection *)&v15 initWithStore:v11 accountCapabilities:v12 storage:v10];

  if (v13) {
    objc_storeStrong((id *)&v13->_smartList, a4);
  }

  return v13;
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

- (REMSmartList)smartList
{
  return self->_smartList;
}

- (void).cxx_destruct
{
}

@end
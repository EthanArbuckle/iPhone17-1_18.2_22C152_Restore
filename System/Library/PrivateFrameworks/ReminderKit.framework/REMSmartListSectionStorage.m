@interface REMSmartListSectionStorage
+ (id)cdEntityName;
- (REMSmartListSectionStorage)initWithObjectID:(id)a3 accountID:(id)a4 smartListID:(id)a5 displayName:(id)a6;
- (id)cdKeyToStorageKeyMap;
- (void)setSmartListID:(id)a3;
@end

@implementation REMSmartListSectionStorage

- (void)setSmartListID:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)REMSmartListSectionStorage;
  [(REMBaseSectionStorage *)&v3 setParentID:a3];
}

- (REMSmartListSectionStorage)initWithObjectID:(id)a3 accountID:(id)a4 smartListID:(id)a5 displayName:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)REMSmartListSectionStorage;
  return [(REMBaseSectionStorage *)&v7 initWithObjectID:a3 accountID:a4 parentID:a5 displayName:a6];
}

+ (id)cdEntityName
{
  return @"REMCDSmartListSection";
}

- (id)cdKeyToStorageKeyMap
{
  if (cdSmartListSectionKeyToStorageKeyMap_onceToken != -1) {
    dispatch_once(&cdSmartListSectionKeyToStorageKeyMap_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)cdSmartListSectionKeyToStorageKeyMap_mapping;

  return v2;
}

@end
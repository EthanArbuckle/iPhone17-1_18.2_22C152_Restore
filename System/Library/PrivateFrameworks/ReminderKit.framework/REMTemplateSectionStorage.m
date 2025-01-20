@interface REMTemplateSectionStorage
+ (id)cdEntityName;
- (REMTemplateSectionStorage)initWithObjectID:(id)a3 accountID:(id)a4 parentTemplateID:(id)a5 displayName:(id)a6;
- (id)cdKeyToStorageKeyMap;
- (void)setParentTemplateID:(id)a3;
@end

@implementation REMTemplateSectionStorage

- (void)setParentTemplateID:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)REMTemplateSectionStorage;
  [(REMBaseSectionStorage *)&v3 setParentID:a3];
}

- (REMTemplateSectionStorage)initWithObjectID:(id)a3 accountID:(id)a4 parentTemplateID:(id)a5 displayName:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)REMTemplateSectionStorage;
  return [(REMBaseSectionStorage *)&v7 initWithObjectID:a3 accountID:a4 parentID:a5 displayName:a6];
}

+ (id)cdEntityName
{
  return @"REMCDTemplateSection";
}

- (id)cdKeyToStorageKeyMap
{
  if (cdTemplateSectionKeyToStorageKeyMap_onceToken != -1) {
    dispatch_once(&cdTemplateSectionKeyToStorageKeyMap_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)cdTemplateSectionKeyToStorageKeyMap_mapping;

  return v2;
}

@end
@interface WFToolKitContentPropertyPossibleValuesDefinition
- (Class)contentItemClass;
- (NSString)propertyName;
- (WFToolKitContentPropertyPossibleValuesDefinition)init;
- (void)setContentItemClass:(Class)a3;
- (void)setPropertyName:(id)a3;
@end

@implementation WFToolKitContentPropertyPossibleValuesDefinition

- (Class)contentItemClass
{
  Class result = (Class)ToolKitHelper.ContentPropertyPossibleValuesDefinition.contentItemClass.getter();
  if (result)
  {
    return (Class)swift_getObjCClassFromMetadata();
  }
  return result;
}

- (void)setContentItemClass:(Class)a3
{
  if (a3) {
    uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  }
  else {
    uint64_t ObjCClassMetadata = 0;
  }
  ToolKitHelper.ContentPropertyPossibleValuesDefinition.contentItemClass.setter(ObjCClassMetadata);
}

- (NSString)propertyName
{
  ToolKitHelper.ContentPropertyPossibleValuesDefinition.propertyName.getter();
  NSString v2 = sub_10006F020();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setPropertyName:(id)a3
{
  uint64_t v4 = sub_10006F050();
  uint64_t v6 = v5;
  v7 = self;
  ToolKitHelper.ContentPropertyPossibleValuesDefinition.propertyName.setter(v4, v6);
}

- (WFToolKitContentPropertyPossibleValuesDefinition)init
{
}

- (void).cxx_destruct
{
}

@end
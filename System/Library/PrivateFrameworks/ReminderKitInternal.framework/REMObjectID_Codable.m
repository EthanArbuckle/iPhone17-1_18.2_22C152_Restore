@interface REMObjectID_Codable
+ (BOOL)supportsSecureCoding;
- (REMObjectID_Codable)initWithUUID:(id)a3 entityName:(id)a4;
@end

@implementation REMObjectID_Codable

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMObjectID_Codable)initWithUUID:(id)a3 entityName:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_1A7571BC0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A7571BB0();
  _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v10 = (void *)sub_1A7571B90();
  v11 = (void *)sub_1A75725E0();
  swift_bridgeObjectRelease();
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = [(REMObjectID *)&v14 initWithUUID:v10 entityName:v11];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

@end
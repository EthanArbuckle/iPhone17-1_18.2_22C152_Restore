@interface REMHashtagLabel_Codable
- (REMHashtagLabel_Codable)initWithName:(id)a3;
- (REMHashtagLabel_Codable)initWithName:(id)a3 canonicalName:(id)a4 firstOccurrenceCreationDate:(id)a5 recencyDate:(id)a6 uuidForChangeTracking:(id)a7;
@end

@implementation REMHashtagLabel_Codable

- (REMHashtagLabel_Codable)initWithName:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v5 = (void *)sub_1A75725E0();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(REMHashtagLabel *)&v8 initWithName:v5];

  return v6;
}

- (REMHashtagLabel_Codable)initWithName:(id)a3 canonicalName:(id)a4 firstOccurrenceCreationDate:(id)a5 recencyDate:(id)a6 uuidForChangeTracking:(id)a7
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB704C40);
  MEMORY[0x1F4188790](v10 - 8);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB704C60);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  v18 = (char *)&v26 - v17;
  if (a5)
  {
    sub_1A7571B20();
    uint64_t v20 = sub_1A7571B60();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v18, 0, 1, v20);
  }
  else
  {
    uint64_t v19 = sub_1A7571B60();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  }
  if (a6)
  {
    sub_1A7571B20();
    uint64_t v22 = sub_1A7571B60();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v16, 0, 1, v22);
  }
  else
  {
    uint64_t v21 = sub_1A7571B60();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v16, 1, 1, v21);
  }
  if (a7)
  {
    sub_1A7571BB0();
    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v23 = 1;
  }
  uint64_t v24 = sub_1A7571BC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v12, v23, 1, v24);
  result = (REMHashtagLabel_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
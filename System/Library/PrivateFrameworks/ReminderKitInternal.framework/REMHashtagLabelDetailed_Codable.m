@interface REMHashtagLabelDetailed_Codable
- (REMHashtagLabelDetailed_Codable)initWithName:(id)a3;
- (REMHashtagLabelDetailed_Codable)initWithName:(id)a3 canonicalName:(id)a4 firstOccurrenceCreationDate:(id)a5 recencyDate:(id)a6 uuidForChangeTracking:(id)a7;
@end

@implementation REMHashtagLabelDetailed_Codable

- (REMHashtagLabelDetailed_Codable)initWithName:(id)a3 canonicalName:(id)a4 firstOccurrenceCreationDate:(id)a5 recencyDate:(id)a6 uuidForChangeTracking:(id)a7
{
  v38 = self;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB704C40);
  MEMORY[0x1F4188790](v11 - 8);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB704C60);
  uint64_t v15 = MEMORY[0x1F4188790](v14 - 8);
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  v19 = (char *)&v35 - v18;
  uint64_t v20 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  uint64_t v22 = v21;
  if (a4)
  {
    a4 = (id)_sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
    uint64_t v24 = v23;
    if (a5)
    {
LABEL_3:
      sub_1A7571B20();
      uint64_t v25 = sub_1A7571B60();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v19, 0, 1, v25);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v26 = sub_1A7571B60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v19, 1, 1, v26);
LABEL_6:
  v37 = v17;
  if (!a6)
  {
    uint64_t v31 = sub_1A7571B60();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v17, 1, 1, v31);
    id v32 = a7;
    if (a7) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v33 = sub_1A7571BC0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v13, 1, 1, v33);
    return (REMHashtagLabelDetailed_Codable *)REMHashtagLabelDetailed_Codable.init(name:canonicalName:firstOccurrenceCreationDate:recencyDate:uuidForChangeTracking:)(v20, v22, (uint64_t)a4, v24, (uint64_t)v19, (uint64_t)v37, (uint64_t)v13);
  }
  sub_1A7571B20();
  uint64_t v27 = sub_1A7571B60();
  v28 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56);
  v36 = v13;
  id v29 = a7;
  v28(v17, 0, 1, v27);
  v13 = v36;
  if (!a7) {
    goto LABEL_10;
  }
LABEL_8:
  sub_1A7571BB0();

  uint64_t v30 = sub_1A7571BC0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v13, 0, 1, v30);
  return (REMHashtagLabelDetailed_Codable *)REMHashtagLabelDetailed_Codable.init(name:canonicalName:firstOccurrenceCreationDate:recencyDate:uuidForChangeTracking:)(v20, v22, (uint64_t)a4, v24, (uint64_t)v19, (uint64_t)v37, (uint64_t)v13);
}

- (REMHashtagLabelDetailed_Codable)initWithName:(id)a3
{
  result = (REMHashtagLabelDetailed_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
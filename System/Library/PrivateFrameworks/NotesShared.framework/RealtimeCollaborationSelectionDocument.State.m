@interface RealtimeCollaborationSelectionDocument.State
+ (NSDictionary)CRProperties;
- (_TtCC11NotesShared38RealtimeCollaborationSelectionDocument5State)initWithICCRCoder:(id)a3;
- (_TtCC11NotesShared38RealtimeCollaborationSelectionDocument5State)initWithIdentity:(id)a3 fields:(id)a4;
@end

@implementation RealtimeCollaborationSelectionDocument.State

+ (NSDictionary)CRProperties
{
  _s11NotesShared38RealtimeCollaborationSelectionDocumentC5StateC12crPropertiesSDySSSo12ICCRDataType_pGvgZ_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA386200);
  v2 = (void *)sub_1C3DB9A88();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (_TtCC11NotesShared38RealtimeCollaborationSelectionDocument5State)initWithIdentity:(id)a3 fields:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_1C3DB8B98();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3DB8B58();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA386200);
  sub_1C3DB9A98();
  v10 = (void *)sub_1C3DB8B38();
  v11 = (void *)sub_1C3DB9A88();
  swift_bridgeObjectRelease();
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = [(ICCRObject *)&v14 initWithIdentity:v10 fields:v11];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (_TtCC11NotesShared38RealtimeCollaborationSelectionDocument5State)initWithICCRCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(ICCRObject *)&v5 initWithICCRCoder:a3];
}

@end
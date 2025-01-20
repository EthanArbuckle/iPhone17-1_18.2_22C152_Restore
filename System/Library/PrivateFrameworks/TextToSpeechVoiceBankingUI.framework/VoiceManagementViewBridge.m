@interface VoiceManagementViewBridge
+ (id)makeVoiceManagementViewControllerWithVoiceID:(id)a3 voiceName:(id)a4;
- (VoiceManagementViewBridge)init;
@end

@implementation VoiceManagementViewBridge

+ (id)makeVoiceManagementViewControllerWithVoiceID:(id)a3 voiceName:(id)a4
{
  uint64_t v4 = type metadata accessor for VoiceManagementView();
  MEMORY[0x270FA5388](v4 - 8, v5);
  v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_25F53AD08();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8, v11);
  unint64_t v12 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_25F53ACE8();
  uint64_t v13 = sub_25F53D8E8();
  MEMORY[0x270FA5388](v13, v14);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)&v19 - v12, (char *)&v19 - v12, v8);
  VoiceManagementView.init(voiceID:)((uint64_t)&v19 - v12, v7);
  id v15 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26A7A36E8));
  id v16 = (id)sub_25F53C968();
  v17 = (void *)sub_25F53D8A8();
  objc_msgSend(v16, sel_setTitle_, v17);
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v9 + 8))((char *)&v19 - v12, v8);

  return v16;
}

- (VoiceManagementViewBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VoiceManagementViewBridge();
  return [(VoiceManagementViewBridge *)&v3 init];
}

@end
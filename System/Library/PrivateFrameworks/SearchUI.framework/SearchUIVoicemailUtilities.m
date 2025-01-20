@interface SearchUIVoicemailUtilities
+ (void)pauseVoicemail;
+ (void)playVoicemailWithIdentifier:(NSString *)a3 completionHandler:(id)a4;
+ (void)resumeVoicemail;
- (_TtC8SearchUI26SearchUIVoicemailUtilities)init;
@end

@implementation SearchUIVoicemailUtilities

+ (void)playVoicemailWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_1E46A61C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EAE55DA8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EAE559E0;
  v14[5] = v13;
  v15 = a3;
  sub_1E4693074((uint64_t)v9, (uint64_t)&unk_1EAE559E8, (uint64_t)v14);
  swift_release();
}

+ (void)resumeVoicemail
{
  if (qword_1EAE58040) {
    objc_msgSend((id)qword_1EAE58040, sel_play);
  }
}

+ (void)pauseVoicemail
{
  if (qword_1EAE58040) {
    objc_msgSend((id)qword_1EAE58040, sel_pause);
  }
}

- (_TtC8SearchUI26SearchUIVoicemailUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchUIVoicemailUtilities();
  return [(SearchUIVoicemailUtilities *)&v3 init];
}

@end
@interface GenerativeExperiencesSessionClient
- (_TtC4Sage34GenerativeExperiencesSessionClient)init;
- (void)sessionDidEncounterCompletionErrorFor:(id)a3 generativeError:(id)a4;
- (void)sessionDidEncounterRegistrationErrorFor:(id)a3 documentID:(int64_t)a4 generativeError:(id)a5;
- (void)sessionDidProduceCompletionResponseFor:(id)a3 element:(id)a4 isComplete:(BOOL)a5;
- (void)sessionDidProduceDocumentRegistrationStatusFor:(id)a3 documentID:(int64_t)a4 registrationStatus:(id)a5 isComplete:(BOOL)a6;
- (void)sessionDidProduceOneShotCompletionErrorFor:(id)a3 generativeError:(id)a4;
- (void)sessionDidProduceOneShotCompletionFor:(id)a3 completion:(id)a4;
@end

@implementation GenerativeExperiencesSessionClient

- (void)sessionDidProduceCompletionResponseFor:(id)a3 element:(id)a4 isComplete:(BOOL)a5
{
  uint64_t v7 = sub_25B9EC300();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B9EC2E0();
  id v11 = a4;
  v12 = self;
  sub_25B98E5F0();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)sessionDidProduceDocumentRegistrationStatusFor:(id)a3 documentID:(int64_t)a4 registrationStatus:(id)a5 isComplete:(BOOL)a6
{
  uint64_t v8 = sub_25B9EC300();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B9EC2E0();
  id v12 = a5;
  uint64_t v13 = self;
  sub_25B98E9C0();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)sessionDidEncounterCompletionErrorFor:(id)a3 generativeError:(id)a4
{
}

- (void)sessionDidEncounterRegistrationErrorFor:(id)a3 documentID:(int64_t)a4 generativeError:(id)a5
{
  uint64_t v7 = sub_25B9EC300();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B9EC2E0();
  id v11 = a5;
  id v12 = self;
  sub_25B98EFB0();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)sessionDidProduceOneShotCompletionFor:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_25B9EC300();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B9EC2E0();
  id v10 = a4;
  id v11 = self;
  sub_25B98F29C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)sessionDidProduceOneShotCompletionErrorFor:(id)a3 generativeError:(id)a4
{
}

- (_TtC4Sage34GenerativeExperiencesSessionClient)init
{
}

- (void).cxx_destruct
{
  sub_25B96CA38((uint64_t)self + OBJC_IVAR____TtC4Sage34GenerativeExperiencesSessionClient_client, &qword_26A51BD38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
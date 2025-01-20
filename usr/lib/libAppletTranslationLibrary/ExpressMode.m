@interface ExpressMode
+ (BOOL)applyConfiguration:(id)a3 toSecureElement:(id)a4 inSessionWithAID:(id)a5 hasActivatedApplets:(BOOL *)a6 skipActivations:(BOOL)a7 useLegacyBehavior:(BOOL)a8 error:(id *)a9;
+ (BOOL)getFastPathWithPassInformation:(id)a3 fastPathOut:(BOOL *)a4 useLegacyBehavior:(BOOL)a5 error:(id *)a6;
+ (id)checkCompatibilityWithPassInformation:(id)a3 error:(id *)a4;
+ (id)checkCompatibilityWithPassInformation:(id)a3 useLegacyBehavior:(BOOL)a4 error:(id *)a5;
- (_TtC24AppletTranslationLibrary11ExpressMode)init;
@end

@implementation ExpressMode

+ (id)checkCompatibilityWithPassInformation:(id)a3 useLegacyBehavior:(BOOL)a4 error:(id *)a5
{
  id v6 = a3;
  sub_1CA5ED534((uint64_t)v6, a4);

  sub_1CA5B84AC(0, (unint64_t *)&qword_1EA6083D8);
  v7 = (void *)sub_1CA5FD948();
  swift_bridgeObjectRelease();

  return v7;
}

+ (id)checkCompatibilityWithPassInformation:(id)a3 error:(id *)a4
{
  uint64_t v4 = qword_1EBCB4208;
  id v5 = a3;
  if (v4 != -1) {
    swift_once();
  }
  sub_1CA5CD38C((uint64_t)v5, 1);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  sub_1CA5CB344(v7);

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB4220);
  v8 = (void *)sub_1CA5FD948();
  swift_bridgeObjectRelease();

  return v8;
}

+ (BOOL)getFastPathWithPassInformation:(id)a3 fastPathOut:(BOOL *)a4 useLegacyBehavior:(BOOL)a5 error:(id *)a6
{
  id v8 = a3;
  sub_1CA5ED7C8((uint64_t)v8, (uint64_t)a4, a5);

  return 1;
}

+ (BOOL)applyConfiguration:(id)a3 toSecureElement:(id)a4 inSessionWithAID:(id)a5 hasActivatedApplets:(BOOL *)a6 skipActivations:(BOOL)a7 useLegacyBehavior:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  if (a5)
  {
    id v14 = a3;
    id v15 = a4;
    id v16 = a5;
    uint64_t v17 = sub_1CA5FD598();
    unint64_t v19 = v18;
  }
  else
  {
    id v20 = a3;
    id v21 = a4;
    uint64_t v17 = 0;
    unint64_t v19 = 0xF000000000000000;
  }
  if (qword_1EBCB4208 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_1CA5CD38C((uint64_t)a3, v9);
  sub_1CA5D1BDC(v22, v23, a4, v17, v19, a6, v9, a7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v19 >> 60 != 15)
  {

LABEL_14:
    sub_1CA5B736C(v17, v19);
    return 1;
  }
  processAuxiliaryElements(secureElement:passInformation:)((TransceiverWrapper *)a4, (NSArray)a3);

  if (!v27) {
    goto LABEL_14;
  }
  sub_1CA5B736C(v17, v19);
  if (a9)
  {
    v24 = (void *)sub_1CA5FD4A8();

    id v25 = v24;
    BOOL result = 0;
    *a9 = v24;
  }
  else
  {

    return 0;
  }
  return result;
}

- (_TtC24AppletTranslationLibrary11ExpressMode)init
{
  return (_TtC24AppletTranslationLibrary11ExpressMode *)sub_1CA5DB454();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC24AppletTranslationLibrary11ExpressMode_logger;
  uint64_t v4 = sub_1CA5FD648();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24AppletTranslationLibrary11ExpressMode_userDefaults);
}

@end
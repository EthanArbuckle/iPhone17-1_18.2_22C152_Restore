@interface OpenURLHandler
- (BOOL)isFinished;
- (BOOL)isLoadingSharedWatchURL;
- (BOOL)isRedeemURL:(id)a3;
- (BOOL)openedByDeeplink;
- (NSURL)deferredOpenURL;
- (_TtC8VideosUI14OpenURLHandler)init;
- (id)queryParameterStringfromURL:(id)a3 parameter:(id)a4;
- (void)handleDeferredURLWithAppContext:(id)a3;
- (void)openSharedWatchURL:(id)a3 appContext:(id)a4 completion:(id)a5;
- (void)parseURL:(id)a3 appContext:(id)a4 completion:(id)a5;
- (void)processDeeplink:(id)a3 appContext:(id)a4 completion:(id)a5;
- (void)processEngagementResult:(id)a3 error:(id)a4;
- (void)processEntityWithContextData:(id)a3 appContext:(id)a4;
- (void)processItunesExtrasStoreLink:(id)a3;
- (void)processNonDeeplinkURL:(id)a3 contextData:(id)a4 sharedWatchUrl:(id)a5 appContext:(id)a6 completion:(id)a7;
- (void)processRouterDeeplink:(id)a3 completion:(id)a4;
- (void)saveDeferredURL:(id)a3 completion:(id)a4;
- (void)setDeferredOpenURL:(id)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setIsLoadingSharedWatchURL:(BOOL)a3;
- (void)setOpenedByDeeplink:(BOOL)a3;
@end

@implementation OpenURLHandler

- (_TtC8VideosUI14OpenURLHandler)init
{
  return (_TtC8VideosUI14OpenURLHandler *)sub_1E2D008D4();
}

- (BOOL)isLoadingSharedWatchURL
{
  v2 = self;
  sub_1E2D00ADC();
  char v4 = v3;

  return v4 & 1;
}

- (BOOL)openedByDeeplink
{
  return sub_1E2D00B1C() & 1;
}

- (NSURL)deferredOpenURL
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8F0E0);
  uint64_t v3 = OUTLINED_FUNCTION_7(v2);
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_8_0();
  sub_1E2D00DBC();
  uint64_t v4 = sub_1E38760D8();
  v5 = 0;
  if (OUTLINED_FUNCTION_43_5(v4) != 1)
  {
    v5 = (void *)sub_1E3876028();
    OUTLINED_FUNCTION_34();
    uint64_t v6 = OUTLINED_FUNCTION_83_4();
    v7(v6);
  }
  return (NSURL *)v5;
}

- (void)setDeferredOpenURL:(id)a3
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8F0E0);
  uint64_t v7 = OUTLINED_FUNCTION_7(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_18_2();
  if (a3)
  {
    sub_1E3876088();
    sub_1E38760D8();
    OUTLINED_FUNCTION_297_0();
  }
  else
  {
    sub_1E38760D8();
    OUTLINED_FUNCTION_296_0();
  }
  __swift_storeEnumTagSinglePayload(v3, v8, 1, v9);
  v10 = self;
  sub_1E31D5D80();
}

- (void)setOpenedByDeeplink:(BOOL)a3
{
}

- (BOOL)isFinished
{
  uint64_t v2 = self;
  sub_1E31D5F84();
  char v4 = v3;

  return v4 & 1;
}

- (void)setIsFinished:(BOOL)a3
{
  char v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E31D5FE4();
}

- (void)setIsLoadingSharedWatchURL:(BOOL)a3
{
  char v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E31D60B4();
}

- (BOOL)isRedeemURL:(id)a3
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8F0E0);
  uint64_t v7 = OUTLINED_FUNCTION_7(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_18_2();
  if (a3)
  {
    sub_1E3876088();
    sub_1E38760D8();
    OUTLINED_FUNCTION_297_0();
  }
  else
  {
    sub_1E38760D8();
    OUTLINED_FUNCTION_296_0();
  }
  __swift_storeEnumTagSinglePayload(v3, v8, 1, v9);
  v10 = self;
  sub_1E31D6380();
  char v12 = v11;

  sub_1E2C3BB24(v3, &qword_1EBF8F0E0);
  return v12 & 1;
}

- (id)queryParameterStringfromURL:(id)a3 parameter:(id)a4
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8F0E0);
  uint64_t v9 = OUTLINED_FUNCTION_7(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_8_0();
  if (a3)
  {
    sub_1E3876088();
    sub_1E38760D8();
    OUTLINED_FUNCTION_297_0();
  }
  else
  {
    sub_1E38760D8();
    OUTLINED_FUNCTION_296_0();
  }
  __swift_storeEnumTagSinglePayload(v4, v10, 1, v11);
  sub_1E387C928();
  char v12 = self;
  OUTLINED_FUNCTION_273_0();
  OUTLINED_FUNCTION_169();
  sub_1E31D6B78();
  uint64_t v14 = v13;

  swift_bridgeObjectRelease();
  sub_1E2C3BB24(v4, &qword_1EBF8F0E0);
  if (v14)
  {
    v15 = (void *)sub_1E387C8E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (void)openSharedWatchURL:(id)a3 appContext:(id)a4 completion:(id)a5
{
  OUTLINED_FUNCTION_44_7();
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_294_0();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v8);
  uint64_t v9 = OUTLINED_FUNCTION_151_3();
  sub_1E3876088();
  if (v9)
  {
    *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v9;
    uint64_t v9 = sub_1E31F2454;
  }
  id v10 = v7;
  id v11 = v5;
  OUTLINED_FUNCTION_183_0();
  sub_1E31D7168();
  sub_1E2C5FB90((uint64_t)v9);

  OUTLINED_FUNCTION_107_0();
  v12();
  OUTLINED_FUNCTION_69();
}

- (void)processDeeplink:(id)a3 appContext:(id)a4 completion:(id)a5
{
  OUTLINED_FUNCTION_44_7();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  sub_1E38760D8();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v9);
  id v10 = (uint64_t (*)())OUTLINED_FUNCTION_151_3();
  sub_1E3876088();
  if (v10)
  {
    *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v10;
    id v10 = sub_1E31F25AC;
  }
  id v11 = v8;
  id v12 = v6;
  sub_1E31D7D2C();
  sub_1E2C5FB90((uint64_t)v10);

  OUTLINED_FUNCTION_107_0();
  v13();
  OUTLINED_FUNCTION_69();
}

- (void)processNonDeeplinkURL:(id)a3 contextData:(id)a4 sharedWatchUrl:(id)a5 appContext:(id)a6 completion:(id)a7
{
  OUTLINED_FUNCTION_18();
  uint64_t v8 = v7;
  id v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  v16 = v15;
  sub_1E38760D8();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_8();
  v18 = _Block_copy(v8);
  sub_1E3876088();
  if (v14) {
    sub_1E387C678();
  }
  if (!v12)
  {
    if (!v18) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  sub_1E387C928();
  if (v18)
  {
LABEL_5:
    *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v18;
    v18 = sub_1E31F2454;
  }
LABEL_7:
  id v19 = v16;
  id v20 = v10;
  OUTLINED_FUNCTION_128_0();
  sub_1E31D8AE8();
  sub_1E2C5FB90((uint64_t)v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_72();
  v21();
  OUTLINED_FUNCTION_11();
}

- (void)processRouterDeeplink:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6) {
    *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v6;
  }
  id v7 = a3;
  uint64_t v9 = self;
  OUTLINED_FUNCTION_76_8();
  sub_1E31D97E4();
  uint64_t v8 = OUTLINED_FUNCTION_55_0();
  sub_1E2C5FB90(v8);
}

- (void)saveDeferredURL:(id)a3 completion:(id)a4
{
  sub_1E38760D8();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_13();
  id v7 = _Block_copy(a4);
  sub_1E3876088();
  *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v7;
  uint64_t v8 = self;
  sub_1E31D9E2C();

  swift_release();
  OUTLINED_FUNCTION_142();
  OUTLINED_FUNCTION_111();
  v9();
}

- (void)handleDeferredURLWithAppContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E31DA000();
}

- (void)processEntityWithContextData:(id)a3 appContext:(id)a4
{
  sub_1E387C678();
  id v6 = a4;
  id v7 = self;
  OUTLINED_FUNCTION_166();
  sub_1E31DA250();

  swift_bridgeObjectRelease();
}

- (void)parseURL:(id)a3 appContext:(id)a4 completion:(id)a5
{
  OUTLINED_FUNCTION_44_7();
  id v7 = v6;
  uint64_t v9 = v8;
  OUTLINED_FUNCTION_294_0();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_8();
  uint64_t v11 = _Block_copy(v7);
  sub_1E3876088();
  *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v11;
  id v12 = v9;
  id v13 = v5;
  OUTLINED_FUNCTION_30_0();
  sub_1E31DA980();

  swift_release();
  OUTLINED_FUNCTION_166();
  OUTLINED_FUNCTION_53_0();
  v14();
  OUTLINED_FUNCTION_69();
}

- (void)processEngagementResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  OUTLINED_FUNCTION_166();
  sub_1E31DB734();
}

- (void)processItunesExtrasStoreLink:(id)a3
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8F0E0);
  uint64_t v7 = OUTLINED_FUNCTION_7(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_8();
  if (a3)
  {
    sub_1E3876088();
    sub_1E38760D8();
    OUTLINED_FUNCTION_297_0();
  }
  else
  {
    sub_1E38760D8();
    OUTLINED_FUNCTION_296_0();
  }
  __swift_storeEnumTagSinglePayload(v3, v8, 1, v9);
  uint64_t v10 = self;
  sub_1E31DBF94();

  sub_1E2C3BB24(v3, &qword_1EBF8F0E0);
}

- (void).cxx_destruct
{
  sub_1E2C3BB24((uint64_t)self + OBJC_IVAR____TtC8VideosUI14OpenURLHandler_deferredOpenURL, &qword_1EBF8F0E0);
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8VideosUI14OpenURLHandler_deferredOpenURLCompletion));

  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8VideosUI14OpenURLHandler_deferredAMSDynamicURLCompletion));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
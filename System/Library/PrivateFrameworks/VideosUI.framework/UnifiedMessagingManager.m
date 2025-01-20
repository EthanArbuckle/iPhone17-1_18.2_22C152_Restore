@interface UnifiedMessagingManager
- (_TtC8VideosUI23UnifiedMessagingManager)init;
- (id)getFullorHalfSheetPromptedAt;
- (void)dealloc;
- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
- (void)handleDidBecomeActive;
- (void)handleTabBarChange:(id)a3;
- (void)markFullorHalfSheetPromptAt:(id)a3;
@end

@implementation UnifiedMessagingManager

- (_TtC8VideosUI23UnifiedMessagingManager)init
{
  sub_1E2CC5444();
  return result;
}

- (void)handleDidBecomeActive
{
  v2 = self;
  sub_1E2CF0774();
}

- (void)handleTabBarChange:(id)a3
{
  sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_14();
  sub_1E3875BE8();
  v5 = self;
  sub_1E2CF08B8();

  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_86_0();
  v6();
}

- (void)dealloc
{
  v2 = self;
  sub_1E32CFB00();
}

- (void).cxx_destruct
{
  sub_1E2C3BB24((uint64_t)self + OBJC_IVAR____TtC8VideosUI23UnifiedMessagingManager_fullorhalfSheetPromptedAt, (uint64_t *)&unk_1EBF83FD0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8VideosUI23UnifiedMessagingManager_recentlySearchedBubbleTipViewController);
}

- (id)getFullorHalfSheetPromptedAt
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF83FD0);
  uint64_t v4 = OUTLINED_FUNCTION_7(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_8_0();
  v5 = self;
  sub_1E32D3DD4();

  uint64_t v6 = sub_1E3876228();
  v7 = 0;
  if (OUTLINED_FUNCTION_43_5(v6) != 1)
  {
    v7 = (void *)sub_1E3876188();
    OUTLINED_FUNCTION_34();
    (*(void (**)())(v8 + 8))();
  }
  return v7;
}

- (void)markFullorHalfSheetPromptAt:(id)a3
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF83FD0);
  uint64_t v7 = OUTLINED_FUNCTION_7(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_8();
  if (a3)
  {
    sub_1E38761E8();
    uint64_t v8 = sub_1E3876228();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = sub_1E3876228();
    uint64_t v9 = 1;
  }
  __swift_storeEnumTagSinglePayload(v3, v9, 1, v8);
  v10 = self;
  sub_1E2CF0474();

  sub_1E2C3BB24(v3, (uint64_t *)&unk_1EBF83FD0);
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v14 = self;
  uint64_t v11 = OUTLINED_FUNCTION_54();
  sub_1E32D3FF4(v11, v12, v13, v8);
  _Block_release(v8);
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  sub_1E387C928();
  sub_1E387C928();
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  sub_1E32D4828();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7
{
  OUTLINED_FUNCTION_18();
  uint64_t v8 = v7;
  id v10 = v9;
  uint64_t v12 = v11;
  v14 = _Block_copy(v13);
  uint64_t v15 = sub_1E387C928();
  unint64_t v17 = v16;
  uint64_t v18 = sub_1E387C928();
  unint64_t v20 = v19;
  _Block_copy(v14);
  id v21 = v10;
  id v22 = v8;
  id v23 = v12;
  uint64_t v24 = OUTLINED_FUNCTION_55_0();
  sub_1E32D59CC(v24, v25, v15, v17, v18, v20, (uint64_t)v23, v14);
  _Block_release(v14);

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11();
  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);
  *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v5;
  swift_release();
}

@end
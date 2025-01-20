@interface Router
- (BOOL)dismissViewControllerWithID:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (_TtC8VideosUI6Router)init;
- (void)accountPageViewControllerDidFinish:(id)a3;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5;
- (void)handleNetworkChanges;
- (void)presentAlertWithTitle:(id)a3 message:(id)a4 actions:(id)a5 animated:(BOOL)a6;
- (void)presentRouterDataSource:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 modalPresentationStyle:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
@end

@implementation Router

- (void)dealloc
{
  v2 = self;
  sub_1E37146C4();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBFACCC0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_47();
  v2();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)presentRouterDataSource:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E371A444();
}

- (_TtC8VideosUI6Router)init
{
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E371F744();
}

- (void)handleNetworkChanges
{
  v2 = self;
  sub_1E37230BC();
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 actions:(id)a5 animated:(BOOL)a6
{
  id v7 = a4;
  if (a3)
  {
    sub_1E387C928();
    if (v7) {
      goto LABEL_3;
    }
  }
  else if (a4)
  {
LABEL_3:
    uint64_t v9 = sub_1E387C928();
    id v7 = v10;
    if (!a5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v9 = 0;
  if (a5) {
LABEL_4:
  }
    a5 = (id)sub_1E387CC98();
LABEL_5:
  v11 = self;
  uint64_t v12 = OUTLINED_FUNCTION_166();
  sub_1E3723348(v12, v13, v9, (uint64_t)v7, (uint64_t)a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = OUTLINED_FUNCTION_21_0();
    *(void *)(v9 + 16) = v8;
    v8 = sub_1E3076014;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  uint64_t v12 = self;
  sub_1E3723990(v10, a4, v8, v9);
  uint64_t v11 = OUTLINED_FUNCTION_83_7();
  sub_1E2C5FB90(v11);
}

- (void)presentViewController:(id)a3 modalPresentationStyle:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v10 = _Block_copy(a6);
  if (v10)
  {
    uint64_t v11 = OUTLINED_FUNCTION_21_0();
    *(void *)(v11 + 16) = v10;
    id v10 = sub_1E3076014;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a3;
  unint64_t v13 = self;
  sub_1E3723B4C((uint64_t)v12, a4, a5, (uint64_t)v10, v11);
  sub_1E2C5FB90((uint64_t)v10);
}

- (void)handleAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8F0E0);
  uint64_t v11 = OUTLINED_FUNCTION_7(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_18_2();
  if (a3)
  {
    sub_1E3876088();
    uint64_t v12 = sub_1E38760D8();
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = sub_1E38760D8();
    uint64_t v13 = 1;
  }
  __swift_storeEnumTagSinglePayload(v5, v13, 1, v12);
  if (a4)
  {
    uint64_t v14 = sub_1E387C928();
    a4 = v15;
  }
  else
  {
    uint64_t v14 = 0;
  }
  v16 = self;
  sub_1E3723D00(v5, v14, (uint64_t)a4, a5);

  swift_bridgeObjectRelease();
  sub_1E2BEA270(v5, &qword_1EBF8F0E0);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  if (v5) {
    *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v5;
  }
  id v7 = self;
  sub_1E3723FD4();
  uint64_t v6 = OUTLINED_FUNCTION_55_0();
  sub_1E2C5FB90(v6);
}

- (BOOL)dismissViewControllerWithID:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = (void (*)(void))_Block_copy(a5);
  uint64_t v8 = sub_1E387C928();
  uint64_t v10 = v9;
  if (v7)
  {
    *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v7;
    id v7 = (void (*)(void))sub_1E3070BA0;
  }
  uint64_t v11 = self;
  char v12 = sub_1E37240C0(v8, v10, v5, v7);
  sub_1E2C5FB90((uint64_t)v7);

  swift_bridgeObjectRelease();
  return v12 & 1;
}

@end
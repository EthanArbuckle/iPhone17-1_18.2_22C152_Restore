@interface SCUIScreenTimePasscodeController
+ (BOOL)willScreenTimePasscodeBeRequiredFor:(int64_t)a3;
+ (NSError)cancellationError;
+ (NSError)screenTimeUnavailable;
+ (NSError)wrongPasscodeError;
+ (id)_isScreenTimePasscodeSet:(id *)a3;
+ (void)_checkScreenTimePasscodeFromViewController:(id)a3 completionHandler:(id)a4;
+ (void)askUserForScreenTimePasscodeFrom:(UIViewController *)a3 interventionType:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation SCUIScreenTimePasscodeController

+ (id)_isScreenTimePasscodeSet:(id *)a3
{
  v3 = NSNumber;
  uint64_t v4 = objc_msgSend(MEMORY[0x263F67F58], "settingEnabled", a3);

  return (id)[v3 numberWithBool:v4];
}

+ (void)_checkScreenTimePasscodeFromViewController:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v8 = (void *)getSTCommunicationClientClass_softClass;
  uint64_t v19 = getSTCommunicationClientClass_softClass;
  if (!getSTCommunicationClientClass_softClass)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __getSTCommunicationClientClass_block_invoke;
    v15[3] = &unk_2654AB468;
    v15[4] = &v16;
    __getSTCommunicationClientClass_block_invoke((uint64_t)v15);
    v8 = (void *)v17[3];
  }
  v9 = v8;
  _Block_object_dispose(&v16, 8);
  id v10 = objc_alloc_init(v9);
  if (v10)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __97__SCUIScreenTimePasscodeController__checkScreenTimePasscodeFromViewController_completionHandler___block_invoke;
    v12[3] = &unk_2654AB4C8;
    id v13 = v7;
    id v14 = a1;
    [v10 authenticateForCommunicationConfigurationOverrideWithCompletionHandler:v12];
    v11 = v13;
  }
  else
  {
    v11 = [a1 screenTimeUnavailable];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

void __97__SCUIScreenTimePasscodeController__checkScreenTimePasscodeFromViewController_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 domain];
    if ([v7 isEqual:@"STErrorDomain"])
    {
      uint64_t v8 = [v6 code];

      if (v8 == 51)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = [*(id *)(a1 + 40) cancellationError];
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if (!v12 || ([v12 authenticated] & 1) != 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_11;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = [*(id *)(a1 + 40) wrongPasscodeError];
LABEL_10:
  v11 = (void *)v10;
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v10);

LABEL_11:
}

+ (NSError)wrongPasscodeError
{
  return (NSError *)sub_25C03AD28((uint64_t)a1, (uint64_t)a2, &qword_26A58C980, (void **)&qword_26A58C988);
}

+ (NSError)cancellationError
{
  return (NSError *)sub_25C03AD28((uint64_t)a1, (uint64_t)a2, &qword_26A58C990, (void **)&qword_26A58C998);
}

+ (NSError)screenTimeUnavailable
{
  return (NSError *)sub_25C03AD28((uint64_t)a1, (uint64_t)a2, &qword_26A58C9A0, (void **)qword_26A58C9A8);
}

+ (void)askUserForScreenTimePasscodeFrom:(UIViewController *)a3 interventionType:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5898D0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  uint64_t v14 = sub_25C0EBB08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A5886D8;
  void v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26A5886E8;
  v16[5] = v15;
  v17 = a3;
  sub_25C03C70C((uint64_t)v11, (uint64_t)&unk_26A5886F8, (uint64_t)v16);
  swift_release();
}

+ (BOOL)willScreenTimePasscodeBeRequiredFor:(int64_t)a3
{
  return sub_25C03B394(a3) & 1;
}

@end
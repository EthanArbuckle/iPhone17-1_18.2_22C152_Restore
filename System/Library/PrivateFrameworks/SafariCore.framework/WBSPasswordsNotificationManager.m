@interface WBSPasswordsNotificationManager
+ (WBSPasswordsNotificationManager)sharedNotificationManager;
- (WBSPasswordsNotificationManager)init;
- (WBSPasswordsNotificationManagerDelegate)delegate;
- (id)initIfAvailable;
- (void)removeDeliveredTakeATourNotification;
- (void)requestPermissionToSendNotificationsProvisionally:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)requestStatusWithCompletionHandler:(id)a3;
- (void)scheduleAutomaticallyCreatedPasskeyNotificationWithServiceName:(NSString *)a3 relyingPartyID:(NSString *)a4 userName:(NSString *)a5 credentialID:(NSData *)a6 completionHandler:(id)a7;
- (void)scheduleICloudKeychainSyncingNotification;
- (void)schedulePasswordBreachNotificationRequest:(id)a3 completionHandler:(id)a4;
- (void)schedulePasswordSavedNotificationForSavedAccount:(WBSSavedAccount *)a3 completionHandler:(id)a4;
- (void)schedulePasswordUpdatedNotificationForSavedAccount:(WBSSavedAccount *)a3 completionHandler:(id)a4;
- (void)scheduleTakeATourNotificationIfNeededWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation WBSPasswordsNotificationManager

+ (WBSPasswordsNotificationManager)sharedNotificationManager
{
  if (qword_1E9E58F10 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E9E58F18;
  return (WBSPasswordsNotificationManager *)v2;
}

- (WBSPasswordsNotificationManagerDelegate)delegate
{
  v2 = (void *)MEMORY[0x1BA9BDBF0]((char *)self + OBJC_IVAR___WBSPasswordsNotificationManager_delegate, a2);
  return (WBSPasswordsNotificationManagerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (id)initIfAvailable
{
  return sub_1B7352810();
}

- (WBSPasswordsNotificationManager)init
{
  return (WBSPasswordsNotificationManager *)sub_1B7352950();
}

- (void)requestStatusWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1B735B830;
  *(void *)(v7 + 24) = v5;
  v10[4] = sub_1B735B87C;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1B7352FD8;
  v10[3] = &block_descriptor_109;
  v8 = _Block_copy(v10);
  v9 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_getNotificationSettingsWithCompletionHandler_, v8);
  _Block_release(v8);

  swift_release();
}

- (void)requestPermissionToSendNotificationsProvisionally:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  if (v4) {
    uint64_t v8 = 70;
  }
  else {
    uint64_t v8 = 6;
  }
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter);
  v12[4] = sub_1B735B828;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = sub_1B735317C;
  v12[3] = &block_descriptor_100;
  v10 = _Block_copy(v12);
  v11 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_requestAuthorizationWithOptions_completionHandler_, v8, v10);
  _Block_release(v10);

  swift_release();
}

- (void)schedulePasswordSavedNotificationForSavedAccount:(WBSSavedAccount *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59058);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1B7384180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E9E59120;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E9E59128;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1B73671C4((uint64_t)v9, (uint64_t)&unk_1E9E59130, (uint64_t)v14);
  swift_release();
}

- (void)schedulePasswordUpdatedNotificationForSavedAccount:(WBSSavedAccount *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59058);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1B7384180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E9E590F0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E9E590F8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1B73671C4((uint64_t)v9, (uint64_t)&unk_1E9E59100, (uint64_t)v14);
  swift_release();
}

- (void)scheduleTakeATourNotificationIfNeededWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59058);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1B7384180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E9E590C8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E9E590D0;
  v12[5] = v11;
  v13 = self;
  sub_1B73671C4((uint64_t)v7, (uint64_t)&unk_1E9E590D8, (uint64_t)v12);
  swift_release();
}

- (void)removeDeliveredTakeATourNotification
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter);
  v3 = self;
  id v4 = (id)sub_1B7384130();
  objc_msgSend(v2, sel_removeDeliveredNotificationsWithIdentifiers_, v4);
}

- (void)scheduleICloudKeychainSyncingNotification
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter);
  v3 = self;
  id v4 = sub_1B735A2B8();
  uint64_t v5 = (void *)sub_1B7383FA0();
  id v6 = objc_msgSend(self, sel_requestWithIdentifier_content_trigger_, v5, v4, 0);

  objc_msgSend(v2, sel_addNotificationRequest_withCompletionHandler_, v6, 0);
}

- (void)schedulePasswordBreachNotificationRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter);
  v12[4] = sub_1B735B308;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = sub_1B7355500;
  v12[3] = &block_descriptor_46;
  uint64_t v9 = _Block_copy(v12);
  id v10 = a3;
  v11 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_addNotificationRequest_withCompletionHandler_, v10, v9);
  _Block_release(v9);

  swift_release();
}

- (void)scheduleAutomaticallyCreatedPasskeyNotificationWithServiceName:(NSString *)a3 relyingPartyID:(NSString *)a4 userName:(NSString *)a5 credentialID:(NSData *)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59058);
  MEMORY[0x1F4188790](v13 - 8);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = sub_1B7384180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1E9E59068;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1E9E59070;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  sub_1B73671C4((uint64_t)v15, (uint64_t)&unk_1E9E59078, (uint64_t)v20);
  swift_release();
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = self;
  id v13 = objc_msgSend(v11, sel_request);
  id v14 = objc_msgSend(v13, sel_content);

  id v15 = objc_msgSend(v14, sel_userInfo);
  uint64_t v16 = sub_1B7383F80();

  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_1B735B9BC;
  *(void *)(v17 + 24) = v9;
  swift_retain();
  sub_1B7356350(2, 1, v16, (uint64_t)sub_1B735ADF4, v17);

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_1B735A6D8(v10, (uint64_t)v11, (void (**)(void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void).cxx_destruct
{
  sub_1B735B90C((uint64_t)self + OBJC_IVAR___WBSPasswordsNotificationManager_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter);
}

@end
@interface Client
- (BOOL)registerForPushTokensWithError:(id *)a3;
- (BOOL)registerForSubscriptionPreferencesWithError:(id *)a3;
- (NSString)description;
- (_TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client)init;
- (_TtC11SessionCoreP33_353B8C47142C77ABAD422CF2B8B621406Client)init;
- (_TtC11SessionCoreP33_4CCBD309304C86708E1086DB2B0619886Client)init;
- (_TtC11SessionCoreP33_B02F3357A3D0A8E8DFCA3AAB9BED3E036Client)init;
- (_TtC11SessionCoreP33_F0FA238C64D38D6BA2E43F90C1B188B06Client)init;
- (id)activityDescriptorContentStatesWithError:(id *)a3;
- (id)activityDescriptorForIdentifier:(id)a3;
- (id)activityDescriptorsWithError:(id *)a3;
- (id)requestActivityWithRequest:(id)a3 error:(id *)a4;
- (id)subscribeWithOptions:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)endActivityWithIdentifier:(id)a3 payload:(id)a4 options:(id)a5;
- (void)mockPushWithChannelID:(id)a3 processIdentifier:(id)a4 environmentName:(id)a5 payload:(id)a6 pushPriority:(id)a7 completionHandler:(id)a8;
- (void)mockPushWithToken:(id)a3 processIdentifier:(id)a4 environmentName:(id)a5 payload:(id)a6 pushPriority:(id)a7 completionHandler:(id)a8;
- (void)requestAlertDismissalWithActivityIdentifier:(id)a3;
- (void)unsubscribe;
- (void)updateActivityWithIdentifier:(id)a3 payload:(id)a4;
@end

@implementation Client

- (NSString)description
{
  v2 = self;
  sub_1C7BFBBE4();

  v3 = (void *)sub_1C7D32CD0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  v2 = self;
  sub_1C7BFC0EC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCoreP33_B02F3357A3D0A8E8DFCA3AAB9BED3E036Client_connection));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCoreP33_B02F3357A3D0A8E8DFCA3AAB9BED3E036Client_requestProcessingQueue));
  swift_bridgeObjectRelease();
}

- (_TtC11SessionCoreP33_F0FA238C64D38D6BA2E43F90C1B188B06Client)init
{
  result = (_TtC11SessionCoreP33_F0FA238C64D38D6BA2E43F90C1B188B06Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)mockPushWithToken:(id)a3 processIdentifier:(id)a4 environmentName:(id)a5 payload:(id)a6 pushPriority:(id)a7 completionHandler:(id)a8
{
  v30 = _Block_copy(a8);
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v31 = self;
  uint64_t v19 = sub_1C7D30980();
  unint64_t v21 = v20;

  uint64_t v22 = sub_1C7D32CE0();
  uint64_t v24 = v23;

  uint64_t v25 = sub_1C7D32CE0();
  unint64_t v27 = v26;

  uint64_t v28 = sub_1C7D32C60();
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v30;
  sub_1C7C02BD0(v19, v21, 0, 0, v22, v24, v25, v27, v28, v18, (uint64_t)v31, (void (*)(void *, void *))sub_1C7C0478C, v29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1C7C028F8(v19, v21);
}

- (void)mockPushWithChannelID:(id)a3 processIdentifier:(id)a4 environmentName:(id)a5 payload:(id)a6 pushPriority:(id)a7 completionHandler:(id)a8
{
  v10 = _Block_copy(a8);
  uint64_t v23 = sub_1C7D32CE0();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1C7D32CE0();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1C7D32CE0();
  unint64_t v18 = v17;
  uint64_t v19 = sub_1C7D32C60();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v10;
  id v21 = a7;
  uint64_t v22 = self;
  sub_1C7C02BD0(0, 0xF000000000000000, v23, v12, v13, v15, v16, v18, v19, v21, (uint64_t)v22, (void (*)(void *, void *))sub_1C7C04288, v20);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (id)requestActivityWithRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_1C7D30980();
  unint64_t v9 = v8;

  uint64_t v10 = sub_1C7BFC988();
  unint64_t v12 = v11;

  sub_1C7C028F8(v7, v9);
  uint64_t v13 = (void *)sub_1C7D30970();
  sub_1C7C028F8(v10, v12);
  return v13;
}

- (void)updateActivityWithIdentifier:(id)a3 payload:(id)a4
{
  uint64_t v6 = sub_1C7D30E30();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C7D32CE0();
  uint64_t v12 = v11;
  id v13 = a4;
  uint64_t v14 = self;
  uint64_t v15 = sub_1C7D30980();
  unint64_t v17 = v16;

  unint64_t v18 = (void *)sub_1C7D30970();
  sub_1C7C0441C(&qword_1EBC62720, MEMORY[0x1E4F17BA8]);
  sub_1C7D31860();

  sub_1C7BFD634(v10, v12, (uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_1C7C028F8(v15, v17);

  swift_bridgeObjectRelease();
}

- (void)endActivityWithIdentifier:(id)a3 payload:(id)a4 options:(id)a5
{
  uint64_t v8 = sub_1C7D32CE0();
  uint64_t v10 = v9;
  id v11 = a5;
  uint64_t v12 = self;
  if (a4)
  {
    id v13 = a4;
    a4 = (id)sub_1C7D30980();
    unint64_t v15 = v14;
  }
  else
  {
    unint64_t v15 = 0xF000000000000000;
  }
  uint64_t v16 = sub_1C7D30980();
  unint64_t v18 = v17;

  sub_1C7BFDC24(v8, v10, (uint64_t)a4, v15);
  sub_1C7C028F8(v16, v18);
  sub_1C7C02950((uint64_t)a4, v15);

  swift_bridgeObjectRelease();
}

- (_TtC11SessionCoreP33_353B8C47142C77ABAD422CF2B8B621406Client)init
{
  result = (_TtC11SessionCoreP33_353B8C47142C77ABAD422CF2B8B621406Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)requestAlertDismissalWithActivityIdentifier:(id)a3
{
  sub_1C7D32CE0();
  if (MEMORY[0x1C87C15B0]((char *)self + OBJC_IVAR____TtC11SessionCoreP33_353B8C47142C77ABAD422CF2B8B621406Client_delegate))
  {
    v4 = self;
    sub_1C7CEC6F0();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (_TtC11SessionCoreP33_4CCBD309304C86708E1086DB2B0619886Client)init
{
  result = (_TtC11SessionCoreP33_4CCBD309304C86708E1086DB2B0619886Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)registerForPushTokensWithError:(id *)a3
{
  v3 = self;
  sub_1C7CCDF04();

  return 1;
}

- (_TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client)init
{
  result = (_TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)activityDescriptorsWithError:(id *)a3
{
  uint64_t v4 = sub_1C7D30CC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  sub_1C7CDA348((uint64_t)v7);
  sub_1C7CDDC78(&qword_1EBC63500, MEMORY[0x1E4F17B48]);
  uint64_t v9 = (void *)sub_1C7D31870();
  uint64_t v10 = sub_1C7D30980();
  unint64_t v12 = v11;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v13 = (void *)sub_1C7D30970();
  sub_1C7C028F8(v10, v12);
  return v13;
}

- (id)activityDescriptorForIdentifier:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4FFF70);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v22 - v8;
  uint64_t v10 = sub_1C7D32CE0();
  uint64_t v12 = v11;
  id v13 = self;
  sub_1C7CDAC60(v10, v12, (uint64_t)v9);
  sub_1C7C046B4((uint64_t)v9, (uint64_t)v7, (uint64_t *)&unk_1EA4FFF70);
  uint64_t v14 = sub_1C7D30EA0();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14) == 1)
  {
    sub_1C7C04290((uint64_t)v9, (uint64_t *)&unk_1EA4FFF70);

    swift_bridgeObjectRelease();
    uint64_t v16 = 0;
  }
  else
  {
    sub_1C7CDDC78(&qword_1EBC63D28, MEMORY[0x1E4F17BF8]);
    unint64_t v17 = (void *)sub_1C7D31870();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v14);
    uint64_t v18 = sub_1C7D30980();
    unint64_t v20 = v19;

    sub_1C7C04290((uint64_t)v9, (uint64_t *)&unk_1EA4FFF70);
    swift_bridgeObjectRelease();
    uint64_t v16 = (void *)sub_1C7D30970();
    sub_1C7C028F8(v18, v20);
  }
  return v16;
}

- (id)subscribeWithOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = sub_1C7D30980();
  unint64_t v9 = v8;

  uint64_t v10 = sub_1C7CDB46C();
  unint64_t v12 = v11;

  sub_1C7C028F8(v7, v9);
  id v13 = (void *)sub_1C7D30970();
  sub_1C7C028F8(v10, v12);
  return v13;
}

- (id)activityDescriptorContentStatesWithError:(id *)a3
{
  v3 = self;
  uint64_t v4 = sub_1C7CDB7E8();
  unint64_t v6 = v5;

  uint64_t v7 = (void *)sub_1C7D30970();
  sub_1C7C028F8(v4, v6);
  return v7;
}

- (void)unsubscribe
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC63D50);
  MEMORY[0x1F4188790](v3 - 8);
  unint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = (os_unfair_lock_s *)(*(void **)((char *)&self->super.isa
                                       + OBJC_IVAR____TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client_lock))[2];
  uint64_t v7 = self;
  os_unfair_lock_lock(v6);
  uint64_t v8 = sub_1C7D31190();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client__lock_subscriptionOptions;
  swift_beginAccess();
  sub_1C7CDCCC8((uint64_t)v5, v9);
  swift_endAccess();
  os_unfair_lock_unlock(v6);
}

- (_TtC11SessionCoreP33_B02F3357A3D0A8E8DFCA3AAB9BED3E036Client)init
{
  result = (_TtC11SessionCoreP33_B02F3357A3D0A8E8DFCA3AAB9BED3E036Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)registerForSubscriptionPreferencesWithError:(id *)a3
{
  uint64_t v3 = self;
  sub_1C7CED9BC();

  return 1;
}

@end
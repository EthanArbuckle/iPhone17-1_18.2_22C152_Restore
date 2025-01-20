@interface Client
- (BOOL)addIDToAllowListWithParameters:(id)a3 error:(id *)a4;
- (BOOL)addRecordsWithParameters:(id)a3 error:(id *)a4;
- (BOOL)enableAllowListWithParameters:(id)a3 error:(id *)a4;
- (BOOL)registerClientWithParameters:(id)a3 error:(id *)a4;
- (BOOL)removeFromAllowListWithParameters:(id)a3 error:(id *)a4;
- (BOOL)removeRecordsWithParameters:(id)a3 error:(id *)a4;
- (BOOL)retryStuckRelationshipsAndReturnError:(id *)a3;
- (BOOL)sendMessageWithParameters:(id)a3 error:(id *)a4;
- (BOOL)setAllowListWithParameters:(id)a3 error:(id *)a4;
- (BOOL)setEnabledWithParameters:(id)a3 error:(id *)a4;
- (BOOL)syncAndReturnError:(id *)a3;
- (BOOL)unavailableWithParameters:(id)a3 error:(id *)a4;
- (BOOL)unpairWithParameters:(id)a3 error:(id *)a4;
- (BOOL)unregisterClientWithParameters:(id)a3 error:(id *)a4;
- (NSString)description;
- (_TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client)init;
- (_TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client)init;
- (id)allowListAndReturnError:(id *)a3;
- (id)clientDefinedRecordIDsWithParameters:(id)a3 error:(id *)a4;
- (id)clientDescriptorWithParameters:(id)a3 error:(id *)a4;
- (id)devicesAndReturnError:(id *)a3;
- (id)disableClientWithParameters:(id)a3 error:(id *)a4;
- (id)enableClientWithParameters:(id)a3 error:(id *)a4;
- (id)isAllowListEnabledAndReturnError:(id *)a3;
- (id)isClientEnabledWithParameters:(id)a3 error:(id *)a4;
- (id)isEnabledAndReturnError:(id *)a3;
- (id)localDeviceAndReturnError:(id *)a3;
- (id)localDeviceIDAndReturnError:(id *)a3;
- (id)messagesWithParameters:(id)a3 error:(id *)a4;
- (id)pushTokenWithParameters:(id)a3 error:(id *)a4;
- (id)recordVersionsWithParameters:(id)a3 error:(id *)a4;
- (id)recordsWithParameters:(id)a3 error:(id *)a4;
- (void)pairWithParameters:(id)a3 completion:(id)a4;
- (void)sendMessageExpectingResponseWithParameters:(id)a3 completion:(id)a4;
@end

@implementation Client

- (NSString)description
{
  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client_lock)
                          + 16);
  v3 = self;
  os_unfair_lock_lock(v2);
  sub_25B075E3C(&v6);
  os_unfair_lock_unlock(v2);

  v4 = (void *)sub_25B0F38E8();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client)init
{
  result = (_TtC14ReplicatorCoreP33_0666CD86C1D3D7360744851506CB0C776Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client_connection));
  swift_release();
  sub_25B075E80((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client_delegate);
  swift_bridgeObjectRelease();
}

- (id)isClientEnabledWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F34B8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_25B0F3278();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25B071E54((unint64_t *)&unk_26A4D7C58, MEMORY[0x263F64190]);
  sub_25B0F3148();
  v13 = self;
  sub_25B06627C();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);

  sub_25B071E54((unint64_t *)&unk_26A4D7C00, MEMORY[0x263F640D0]);
  v14 = (void *)sub_25B0F3158();
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  return v14;
}

- (id)enableClientWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F3428();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_25B0F3278();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25B071E54(&qword_26A4D7C50, MEMORY[0x263F64150]);
  sub_25B0F3148();
  v13 = self;
  sub_25B066778();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);

  sub_25B071E54((unint64_t *)&unk_26A4D7C00, MEMORY[0x263F640D0]);
  v14 = (void *)sub_25B0F3158();
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  return v14;
}

- (id)disableClientWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F3448();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_25B0F3278();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25B071E54(&qword_26A4D7BF8, MEMORY[0x263F64160]);
  sub_25B0F3148();
  v13 = self;
  sub_25B066CB8();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);

  sub_25B071E54((unint64_t *)&unk_26A4D7C00, MEMORY[0x263F640D0]);
  v14 = (void *)sub_25B0F3158();
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  return v14;
}

- (BOOL)registerClientWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F3498();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B071E54(&qword_26B33BF08, MEMORY[0x263F64180]);
  sub_25B0F3148();
  uint64_t v9 = self;
  sub_25B0671F8((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (BOOL)unregisterClientWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F34D8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B071E54(&qword_26A4D7BF0, MEMORY[0x263F641A0]);
  sub_25B0F3148();
  uint64_t v9 = self;
  sub_25B067798((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (id)clientDescriptorWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F3518();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_25B0F32D8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25B071E54((unint64_t *)&unk_26B33C250, MEMORY[0x263F641C0]);
  sub_25B0F3148();
  v13 = self;
  sub_25B067E98((uint64_t)v12);
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);

  sub_25B071E54((unint64_t *)&unk_26B33C548, MEMORY[0x263F64100]);
  v14 = (void *)sub_25B0F3158();
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  return v14;
}

- (id)localDeviceIDAndReturnError:(id *)a3
{
  uint64_t v4 = sub_25B0F3298();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_25B068754();

  sub_25B071E54((unint64_t *)&unk_26B33C228, MEMORY[0x263F640E0]);
  uint64_t v9 = (void *)sub_25B0F3158();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (BOOL)addRecordsWithParameters:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_25B068B28((uint64_t)v5);

  return 1;
}

- (BOOL)removeRecordsWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F3478();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B071E54((unint64_t *)&unk_26B33C240, MEMORY[0x263F64170]);
  sub_25B0F3148();
  uint64_t v9 = self;
  sub_25B06902C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (id)recordsWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F33A8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B071E54(&qword_26B33C238, MEMORY[0x263F64120]);
  sub_25B0F3148();
  uint64_t v9 = self;
  uint64_t v10 = (void *)sub_25B06948C((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v10;
}

- (id)recordVersionsWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F34F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_25B0F32B8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25B071E54(&qword_26B33BF10, MEMORY[0x263F641B0]);
  sub_25B0F3148();
  v13 = self;
  sub_25B069924();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);

  sub_25B071E54(&qword_26B33BEF8, MEMORY[0x263F640F0]);
  v14 = (void *)sub_25B0F3158();
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  return v14;
}

- (id)clientDefinedRecordIDsWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F3538();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_25B0F32F8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25B071E54((unint64_t *)&unk_26B33C8B0, MEMORY[0x263F641D0]);
  sub_25B0F3148();
  v13 = self;
  sub_25B069E3C();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);

  sub_25B071E54(&qword_26B33C8A8, MEMORY[0x263F64110]);
  v14 = (void *)sub_25B0F3158();
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  return v14;
}

- (BOOL)syncAndReturnError:(id *)a3
{
  v3 = self;
  sub_25B06A38C();

  return 1;
}

- (id)devicesAndReturnError:(id *)a3
{
  uint64_t v4 = sub_25B0F2A58();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_25B0A1D20();

  sub_25B0A8D10((unint64_t *)&unk_26B33BE48, MEMORY[0x263F63CE0]);
  uint64_t v9 = (void *)sub_25B0F3158();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (BOOL)sendMessageWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F3408();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B071E54(&qword_26A4D7B60, MEMORY[0x263F64140]);
  sub_25B0F3148();
  uint64_t v9 = self;
  sub_25B06A950((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (void)sendMessageExpectingResponseWithParameters:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_25B0F3408();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  sub_25B071E54(&qword_26A4D7B60, MEMORY[0x263F64140]);
  sub_25B0F3148();
  _Block_copy(v10);
  uint64_t v11 = self;
  sub_25B0734E8((uint64_t)v9, (uint64_t)v11, v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)messagesWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F33C8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_25B0F3238();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25B071E54(&qword_26B33BF00, MEMORY[0x263F64130]);
  sub_25B0F3148();
  v13 = self;
  sub_25B06BBDC();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);

  sub_25B071E54((unint64_t *)&unk_26B33BEE8, MEMORY[0x263F640B0]);
  v14 = (void *)sub_25B0F3158();
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  return v14;
}

- (_TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client)init
{
  result = (_TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)localDeviceAndReturnError:(id *)a3
{
  uint64_t v4 = sub_25B0F2AD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  sub_25B0A2060((uint64_t)v7);

  sub_25B0A8D10(&qword_26A4D8020, MEMORY[0x263F63D20]);
  uint64_t v9 = (void *)sub_25B0F3158();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)pushTokenWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F2B78();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_25B0F2AB8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25B0A8D10(&qword_26A4D8000, MEMORY[0x263F63D70]);
  sub_25B0F3148();
  v13 = self;
  sub_25B0A2494((uint64_t)v12);
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);

  sub_25B0A8D10((unint64_t *)&unk_26A4D8008, MEMORY[0x263F63D10]);
  v14 = (void *)sub_25B0F3158();
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  return v14;
}

- (void)pairWithParameters:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_25B0F2BB8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  sub_25B0A8D10(&qword_26A4D7FF8, MEMORY[0x263F63D90]);
  sub_25B0F3148();
  _Block_copy(v10);
  uint64_t v11 = self;
  sub_25B0A8828((uint64_t)v9, (uint64_t)v11, (void (**)(void, void))v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)unpairWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F2BD8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B0A8D10(&qword_26A4D7FE8, MEMORY[0x263F63DA0]);
  sub_25B0F3148();
  uint64_t v9 = self;
  sub_25B0A2B90();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (BOOL)unavailableWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F2B58();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B0A8D10(&qword_26A4D7FE0, MEMORY[0x263F63D60]);
  sub_25B0F3148();
  uint64_t v9 = self;
  sub_25B0A2ECC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (BOOL)retryStuckRelationshipsAndReturnError:(id *)a3
{
  v3 = self;
  sub_25B0A3254();

  return 1;
}

- (id)isEnabledAndReturnError:(id *)a3
{
  uint64_t v4 = sub_25B0F2A78();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  sub_25B0A3420();

  sub_25B0A8D10(&qword_26B33BE58, MEMORY[0x263F63CF0]);
  uint64_t v9 = (void *)sub_25B0F3158();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (BOOL)setEnabledWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_25B0F2B18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B0A8D10(&qword_26B33BE60, MEMORY[0x263F63D40]);
  sub_25B0F3148();
  uint64_t v10 = MEMORY[0x26115E500]((char *)self + OBJC_IVAR____TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client_delegate);
  if (v10)
  {
    uint64_t v11 = self;
    char v12 = sub_25B0F2B08();
    sub_25B0A1238(v12 & 1);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    uint64_t v13 = sub_25B0F1EE8();
    sub_25B0A8D10(&qword_26A4D7FA0, MEMORY[0x263F63A40]);
    v14 = (void *)swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F63A20], v13);
    v16 = self;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

    if (a4)
    {
      v17 = (void *)sub_25B0F1C88();

      id v18 = v17;
      *a4 = v17;
    }
    else
    {
    }
  }
  return v10 != 0;
}

- (BOOL)enableAllowListWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_25B0F2B98();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25B0A8D10(&qword_26A4D7FD8, MEMORY[0x263F63D80]);
  sub_25B0F3148();
  uint64_t v10 = MEMORY[0x26115E500]((char *)self + OBJC_IVAR____TtC14ReplicatorCoreP33_586791E780FEDC6114754B28ABA431B16Client_delegate);
  if (v10)
  {
    uint64_t v11 = self;
    sub_25B0F2B88();
    uint64_t v12 = v10 + OBJC_IVAR____TtC14ReplicatorCore23ReplicatorControlServer_replicator;
    swift_beginAccess();
    __swift_mutable_project_boxed_opaque_existential_1(v12, *(void *)(v12 + 24));
    sub_25B0F2398();
    swift_endAccess();
    swift_unknownObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    uint64_t v13 = sub_25B0F1EE8();
    sub_25B0A8D10(&qword_26A4D7FA0, MEMORY[0x263F63A40]);
    v14 = (void *)swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F63A20], v13);
    v16 = self;
    swift_willThrow();
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);

    if (a4)
    {
      v17 = (void *)sub_25B0F1C88();

      id v18 = v17;
      *a4 = v17;
    }
    else
    {
    }
  }
  return v10 != 0;
}

- (BOOL)setAllowListWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F2BF8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B0A8D10(&qword_26A4D7FD0, MEMORY[0x263F63DB0]);
  sub_25B0F3148();
  uint64_t v9 = self;
  sub_25B0A3C0C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (BOOL)addIDToAllowListWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F2B38();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B0A8D10((unint64_t *)&unk_26A4D7FB0, MEMORY[0x263F63D50]);
  sub_25B0F3148();
  uint64_t v9 = self;
  sub_25B0A3F08();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (BOOL)removeFromAllowListWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_25B0F2B38();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B0A8D10((unint64_t *)&unk_26A4D7FB0, MEMORY[0x263F63D50]);
  sub_25B0F3148();
  uint64_t v9 = self;
  sub_25B0A436C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (id)isAllowListEnabledAndReturnError:(id *)a3
{
  uint64_t v4 = sub_25B0F2AF8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  sub_25B0A47B8();

  sub_25B0A8D10(&qword_26A4D7FA8, MEMORY[0x263F63D30]);
  uint64_t v9 = (void *)sub_25B0F3158();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)allowListAndReturnError:(id *)a3
{
  uint64_t v4 = sub_25B0F2A98();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  sub_25B0A4A98();

  sub_25B0A8D10(&qword_26A4D7F98, MEMORY[0x263F63D00]);
  uint64_t v9 = (void *)sub_25B0F3158();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

@end
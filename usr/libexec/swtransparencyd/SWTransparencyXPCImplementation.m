@interface SWTransparencyXPCImplementation
- (_TtC15swtransparencyd31SWTransparencyXPCImplementation)init;
- (void)clearAllCFUWithCompletion:(id)a3;
- (void)dailyWithCompletion:(id)a3;
- (void)postCFU:(NSString *)a3 completion:(id)a4;
- (void)sysdiagnoseInfoWithCompletion:(id)a3;
- (void)triggerConsistencyVerificationWithCompletion:(id)a3;
- (void)triggerMilestoneRefreshWithCompletion:(id)a3;
- (void)triggerPublicKeybagRefreshWithCompletion:(id)a3;
- (void)verifyProofs:(NSData *)a3 forObject:(NSData *)a4 completion:(id)a5;
- (void)waitStateMachineReadyWithCompletion:(id)a3;
@end

@implementation SWTransparencyXPCImplementation

- (void)triggerMilestoneRefreshWithCompletion:(id)a3
{
  uint64_t v5 = sub_100020378(&qword_100157030);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100158C88;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100158C90;
  v12[5] = v11;
  v13 = self;
  sub_10003E698((uint64_t)v7, (uint64_t)&unk_100158C98, (uint64_t)v12);
  swift_release();
}

- (void)triggerConsistencyVerificationWithCompletion:(id)a3
{
  uint64_t v5 = sub_100020378(&qword_100157030);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100158C68;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100158C70;
  v12[5] = v11;
  v13 = self;
  sub_10003E698((uint64_t)v7, (uint64_t)&unk_100158C78, (uint64_t)v12);
  swift_release();
}

- (void)triggerPublicKeybagRefreshWithCompletion:(id)a3
{
  uint64_t v5 = sub_100020378(&qword_100157030);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100158C48;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100158C50;
  v12[5] = v11;
  v13 = self;
  sub_10003E698((uint64_t)v7, (uint64_t)&unk_100158C58, (uint64_t)v12);
  swift_release();
}

- (void)verifyProofs:(NSData *)a3 forObject:(NSData *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100020378(&qword_100157030);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100158C28;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100158C30;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_10003E698((uint64_t)v11, (uint64_t)&unk_100158C38, (uint64_t)v16);
  swift_release();
}

- (void)sysdiagnoseInfoWithCompletion:(id)a3
{
  uint64_t v5 = sub_100020378(&qword_100157030);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100158C08;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100158C10;
  v12[5] = v11;
  v13 = self;
  sub_10003E698((uint64_t)v7, (uint64_t)&unk_100158C18, (uint64_t)v12);
  swift_release();
}

- (void)postCFU:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100020378(&qword_100157030);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100158BE8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100158BF0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10003E698((uint64_t)v9, (uint64_t)&unk_100158BF8, (uint64_t)v14);
  swift_release();
}

- (void)clearAllCFUWithCompletion:(id)a3
{
  uint64_t v5 = sub_100020378(&qword_100157030);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100158BC8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100158BD0;
  v12[5] = v11;
  v13 = self;
  sub_10003E698((uint64_t)v7, (uint64_t)&unk_100158BD8, (uint64_t)v12);
  swift_release();
}

- (void)waitStateMachineReadyWithCompletion:(id)a3
{
  uint64_t v5 = sub_100020378(&qword_100157030);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100158BA8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100158BB0;
  v12[5] = v11;
  v13 = self;
  sub_10003E698((uint64_t)v7, (uint64_t)&unk_100158BB8, (uint64_t)v12);
  swift_release();
}

- (void)dailyWithCompletion:(id)a3
{
  uint64_t v5 = sub_100020378(&qword_100157030);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100158B80;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100158B88;
  v12[5] = v11;
  v13 = self;
  sub_10003E698((uint64_t)v7, (uint64_t)&unk_100158B90, (uint64_t)v12);
  swift_release();
}

- (_TtC15swtransparencyd31SWTransparencyXPCImplementation)init
{
  result = (_TtC15swtransparencyd31SWTransparencyXPCImplementation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end
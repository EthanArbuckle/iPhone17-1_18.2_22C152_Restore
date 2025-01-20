@interface SMTapToRadarManagerInternal
+ (void)fileRadarWithError:(NSError *)a3 conversationIdentifier:(NSString *)a4 completionHandler:(id)a5;
+ (void)fileRadarWithTitle:(NSString *)a3 description:(NSString *)a4 conversationIdentifier:(NSString *)a5 completionHandler:(id)a6;
- (_TtC13SafetyMonitor27SMTapToRadarManagerInternal)init;
@end

@implementation SMTapToRadarManagerInternal

+ (void)fileRadarWithError:(NSError *)a3 conversationIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3494B8);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  uint64_t v14 = sub_25B758430();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A50E018;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26A50E020;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_25B6FF920((uint64_t)v11, (uint64_t)&unk_26A50E028, (uint64_t)v16);
  swift_release();
}

+ (void)fileRadarWithTitle:(NSString *)a3 description:(NSString *)a4 conversationIdentifier:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3494B8);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = a1;
  uint64_t v16 = sub_25B758430();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26A50DFD8;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_26A50DFE8;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  sub_25B6FF920((uint64_t)v13, (uint64_t)&unk_26A50DFF8, (uint64_t)v18);
  swift_release();
}

- (_TtC13SafetyMonitor27SMTapToRadarManagerInternal)init
{
  result = (_TtC13SafetyMonitor27SMTapToRadarManagerInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC13SafetyMonitor27SMTapToRadarManagerInternal_urlComponents;
  uint64_t v3 = sub_25B757E80();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end
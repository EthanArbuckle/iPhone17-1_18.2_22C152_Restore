@interface HIDVirtualServiceDelegate
- (BOOL)setOutputEvent:(id)a3 forService:(id)a4;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5;
- (_TtC12UniversalHIDP33_77F0A1D2252CCF67CE1080DE620C755225HIDVirtualServiceDelegate)init;
- (id)copyEventMatching:(id)a3 forService:(id)a4;
- (id)propertyForKey:(id)a3 forService:(id)a4;
- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5;
@end

@implementation HIDVirtualServiceDelegate

- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5
{
  if (a3)
  {
    id v7 = a4;
    swift_unknownObjectRetain();
    v8 = self;
    swift_unknownObjectRetain();
    sub_26087B730();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    id v9 = a4;
    swift_unknownObjectRetain();
    v10 = self;
  }
  uint64_t v11 = sub_26087B2B0();
  uint64_t v13 = v12;

  sub_26087B730();
  swift_unknownObjectRelease();
  char v14 = sub_26084E708((uint64_t)v17, v11, v13);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  sub_26084FD20((uint64_t)v17, &qword_26A8B4998);
  return v14 & 1;
}

- (id)propertyForKey:(id)a3 forService:(id)a4
{
  uint64_t v5 = sub_26087B2B0();
  uint64_t v7 = v6;
  swift_unknownObjectRetain();
  v8 = self;
  sub_26087B730();
  swift_unknownObjectRelease();
  sub_26084E8B4(v5, v7, &v17);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  uint64_t v9 = v18;
  if (v18)
  {
    v10 = __swift_project_boxed_opaque_existential_1(&v17, v18);
    uint64_t v11 = *(void *)(v9 - 8);
    MEMORY[0x270FA5388](v10);
    uint64_t v13 = &v16[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(unsigned char *))(v11 + 16))(v13);
    char v14 = (void *)sub_26087BBD0();
    (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v17);
  }
  else
  {
    char v14 = 0;
  }
  return v14;
}

- (id)copyEventMatching:(id)a3 forService:(id)a4
{
  if (a3) {
    sub_26087B1E0();
  }
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_26087B730();
  swift_unknownObjectRelease();
  uint64_t v6 = (void *)OUTLINED_FUNCTION_3();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v8);
  return v6;
}

- (BOOL)setOutputEvent:(id)a3 forService:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  sub_26087B730();
  swift_unknownObjectRelease();
  char v7 = OUTLINED_FUNCTION_5();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v9);
  return v7 & 1;
}

- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5
{
  if (a4) {
    uint64_t v7 = sub_26087B1E0();
  }
  else {
    uint64_t v7 = 0;
  }
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  sub_26087B730();
  swift_unknownObjectRelease();
  nullsub_1(a3, v7, v9);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

- (_TtC12UniversalHIDP33_77F0A1D2252CCF67CE1080DE620C755225HIDVirtualServiceDelegate)init
{
}

- (void).cxx_destruct
{
  sub_26084FD20((uint64_t)self + OBJC_IVAR____TtC12UniversalHIDP33_77F0A1D2252CCF67CE1080DE620C755225HIDVirtualServiceDelegate_logger, (uint64_t *)&unk_26A8B50E0);
  swift_weakDestroy();
}

@end
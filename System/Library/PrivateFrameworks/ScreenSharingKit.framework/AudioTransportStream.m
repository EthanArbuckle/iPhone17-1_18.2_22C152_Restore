@interface AudioTransportStream
- (_TtC16ScreenSharingKit20AudioTransportStream)init;
- (void)dealloc;
- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)streamDidRTCPTimeOut:(id)a3;
- (void)streamDidStop:(id)a3;
@end

@implementation AudioTransportStream

- (void)dealloc
{
  v2 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A537698);
  sub_25BC08968();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for AudioTransportStream();
  [(AudioTransportStream *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_25BB09100(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit20AudioTransportStream_currentState));

  objc_super v3 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20AudioTransportStream_stateStream;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5382E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20AudioTransportStream_stateContinuation;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A537698);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  v7 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20AudioTransportStream_sessionID;
  uint64_t v8 = sub_25BC07818();
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
}

- (_TtC16ScreenSharingKit20AudioTransportStream)init
{
  result = (_TtC16ScreenSharingKit20AudioTransportStream *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)streamDidRTCPTimeOut:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_25BB08BC0(a3);
}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = self;
  id v10 = a5;
  sub_25BB099D4(v6, a5);
}

- (void)streamDidStop:(id)a3
{
  uint64_t v4 = qword_26A536DA0;
  id v10 = a3;
  id v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25BC08058();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A553028);
  v7 = sub_25BC08038();
  os_log_type_t v8 = sub_25BC08B48();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_25BABA000, v7, v8, "Audio stream streamDidStop", v9, 2u);
    MEMORY[0x261172B20](v9, -1, -1);
  }
}

@end
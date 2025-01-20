@interface RegistryCrux
- (void)xpcDeviceID:(id)a3 needsPasscode:(id)a4;
- (void)xpcHasNewOOBKey:(id)a3;
@end

@implementation RegistryCrux

- (void)xpcDeviceID:(id)a3 needsPasscode:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  uint64_t v11 = one-time initialization token for framework;
  id v12 = a4;
  swift_retain();
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  __swift_project_value_buffer(v13, (uint64_t)static Logs.framework);
  v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_258700000, v14, v15, "RegistryCrux: xpcDeviceID", v16, 2u);
    MEMORY[0x25A2CB3A0](v16, -1, -1);
  }
  swift_release();

  outlined destroy of UUID?((uint64_t)v8, &demangling cache variable for type metadata for UUID?);
}

- (void)xpcHasNewOOBKey:(id)a3
{
  if (a3)
  {
    swift_retain();
    id v4 = a3;
    uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v7 = v6;
  }
  else
  {
    swift_retain();
    uint64_t v5 = 0;
    unint64_t v7 = 0xF000000000000000;
  }
  if (one-time initialization token for framework != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Logs.framework);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_258700000, v9, v10, "RegistryCrux: xpcHasNewOOBKey", v11, 2u);
    MEMORY[0x25A2CB3A0](v11, -1, -1);
  }

  outlined consume of Data?(v5, v7);
  swift_release();
}

@end
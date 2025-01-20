@interface PASAnisetteRemoteRequestHandler
- (_TtC21ProximityAppleIDSetup31PASAnisetteRemoteRequestHandler)init;
- (void)dealloc;
@end

@implementation PASAnisetteRemoteRequestHandler

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_2684E29B8;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_22CC9E968();
  __swift_project_value_buffer(v6, (uint64_t)static PASLogger.common);
  v7 = sub_22CC9E948();
  os_log_type_t v8 = sub_22CC9EED8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_22CB88000, v7, v8, "PASAnisetteRemoteRequestHandler deinit", v9, 2u);
    MEMORY[0x230F756C0](v9, -1, -1);
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  [(PASAnisetteRemoteRequestHandler *)&v10 dealloc];
}

- (void).cxx_destruct
{
}

- (_TtC21ProximityAppleIDSetup31PASAnisetteRemoteRequestHandler)init
{
  result = (_TtC21ProximityAppleIDSetup31PASAnisetteRemoteRequestHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
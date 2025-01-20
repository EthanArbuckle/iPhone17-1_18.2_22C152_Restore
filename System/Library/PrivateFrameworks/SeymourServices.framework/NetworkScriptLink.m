@interface NetworkScriptLink
- (_TtC15SeymourServices17NetworkScriptLink)init;
@end

@implementation NetworkScriptLink

- (_TtC15SeymourServices17NetworkScriptLink)init
{
  result = (_TtC15SeymourServices17NetworkScriptLink *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC15SeymourServices17NetworkScriptLink__shrinkJsFootprintEnabled;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD9F1E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SeymourServices17NetworkScriptLink_scriptConfiguration));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices17NetworkScriptLink_dispatchService);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices17NetworkScriptLink_fileStore);
  v5 = (char *)self + OBJC_IVAR____TtC15SeymourServices17NetworkScriptLink_state;

  sub_1D679FBCC((uint64_t)v5);
}

@end
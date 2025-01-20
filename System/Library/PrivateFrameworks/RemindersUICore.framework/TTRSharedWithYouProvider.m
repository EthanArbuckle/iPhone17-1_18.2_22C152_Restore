@interface TTRSharedWithYouProvider
- (_TtC15RemindersUICore24TTRSharedWithYouProvider)init;
- (void)highlightCenterHighlightsDidChange:(id)a3;
@end

@implementation TTRSharedWithYouProvider

- (_TtC15RemindersUICore24TTRSharedWithYouProvider)init
{
  result = (_TtC15RemindersUICore24TTRSharedWithYouProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore24TTRSharedWithYouProvider_invocationQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore24TTRSharedWithYouProvider_backgroundQueue));
  swift_bridgeObjectRelease();
  sub_1B90C337C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15RemindersUICore24TTRSharedWithYouProvider_customFetchShareForSharedList));

  swift_release();
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  uint64_t v4 = qword_1E9EFA250;
  id v10 = a3;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1B996D300();
  __swift_project_value_buffer(v6, (uint64_t)qword_1E9EFD210);
  v7 = sub_1B996D2F0();
  os_log_type_t v8 = sub_1B996F660();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B90A0000, v7, v8, "SharedWithYou: Highlights did change", v9, 2u);
    MEMORY[0x1BA9DB030](v9, -1, -1);
  }
}

@end
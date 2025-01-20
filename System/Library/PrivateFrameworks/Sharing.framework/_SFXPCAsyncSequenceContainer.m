@interface _SFXPCAsyncSequenceContainer
- (_SFXPCAsyncSequenceContainer)init;
- (void)dealloc;
- (void)xpcMakeAsyncIteratorFor:(id)a3 completion:(id)a4;
@end

@implementation _SFXPCAsyncSequenceContainer

- (void)dealloc
{
  v2 = self;
  _SFXPCAsyncSequenceContainer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____SFXPCAsyncSequenceContainer_uuid;
  uint64_t v3 = sub_1A56D4CB8();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)xpcMakeAsyncIteratorFor:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_1A56D4CB8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1A56D4C88();
  _Block_copy(v10);
  v11 = self;
  sub_1A553EDB4((uint64_t)v9, (uint64_t)v11, (void (**)(void, void, void, void))v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_SFXPCAsyncSequenceContainer)init
{
  result = (_SFXPCAsyncSequenceContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
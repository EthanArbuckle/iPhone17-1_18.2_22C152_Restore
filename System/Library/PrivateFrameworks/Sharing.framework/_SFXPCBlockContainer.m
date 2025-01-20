@interface _SFXPCBlockContainer
- (_SFXPCBlockContainer)init;
- (void)dealloc;
- (void)invoke:(id)a3 parametersData:(id)a4 parametersAsyncSequenceContainer:(id)a5 parametersBlocksContainer:(id)a6 sync:(BOOL)a7 completion:(id)a8;
@end

@implementation _SFXPCBlockContainer

- (void)dealloc
{
  v2 = self;
  _SFXPCBlockContainer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____SFXPCBlockContainer_uuid;
  uint64_t v4 = sub_1A56D4CB8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)invoke:(id)a3 parametersData:(id)a4 parametersAsyncSequenceContainer:(id)a5 parametersBlocksContainer:(id)a6 sync:(BOOL)a7 completion:(id)a8
{
  BOOL v24 = a7;
  uint64_t v13 = sub_1A56D4CB8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a8);
  sub_1A56D4C88();
  id v18 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v19 = self;
  uint64_t v20 = sub_1A56D4A78();
  unint64_t v22 = v21;

  _Block_copy(v17);
  sub_1A54F53B4((uint64_t)v16, v20, v22, (uint64_t)a5, (uint64_t)a6, v24, (char *)v19, (void (**)(const void *, void *, id, id, void))v17);
  _Block_release(v17);
  _Block_release(v17);
  sub_1A54EA09C(v20, v22);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (_SFXPCBlockContainer)init
{
  result = (_SFXPCBlockContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
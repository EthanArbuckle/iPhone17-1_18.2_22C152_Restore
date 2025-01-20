@interface _SFXPCAsyncIterator
- (_SFXPCAsyncIterator)init;
- (void)dealloc;
- (void)xpcCancel;
- (void)xpcNextWithCompletion:(id)a3;
@end

@implementation _SFXPCAsyncIterator

- (void)dealloc
{
  v2 = self;
  sub_1A553B0AC();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____SFXPCAsyncIterator_uuid;
  uint64_t v4 = sub_1A56D4CB8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1A553FAD0(*(void **)((char *)&self->super.isa + OBJC_IVAR____SFXPCAsyncIterator_iterator), *(void *)&self->_anon_0[OBJC_IVAR____SFXPCAsyncIterator_iterator], self->iterator[OBJC_IVAR____SFXPCAsyncIterator_iterator]);
  swift_release();

  swift_release();
}

- (void)xpcNextWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1A553EB6C((uint64_t)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)xpcCancel
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____SFXPCAsyncIterator_currentTask))
  {
    v2 = self;
    swift_retain();
    sub_1A56D5528();

    swift_release();
  }
}

- (_SFXPCAsyncIterator)init
{
  result = (_SFXPCAsyncIterator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
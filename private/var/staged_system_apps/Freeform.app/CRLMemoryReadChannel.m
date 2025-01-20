@interface CRLMemoryReadChannel
- (BOOL)isValid;
- (_TtC8Freeform20CRLMemoryReadChannel)init;
- (void)addBarrier:(id)a3;
- (void)readFromOffset:(uint64_t)a3 length:(uint64_t)a4 handler:(void *)aBlock;
- (void)readWithHandler:(id)a3;
- (void)readWithHandlerAndWait:(id)a3;
@end

@implementation CRLMemoryReadChannel

- (void)readFromOffset:(uint64_t)a3 length:(uint64_t)a4 handler:(void *)aBlock
{
  v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a1;
  sub_100B8DBC0(a3, a4, (uint64_t)v9, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)addBarrier:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void (*)(void *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);
}

- (BOOL)isValid
{
  return 1;
}

- (void)readWithHandler:(id)a3
{
  v4 = (void (**)(void *, uint64_t, id, void))_Block_copy(a3);
  v7 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v6 = [(objc_class *)isa crl_dispatchData];

  v4[2](v4, 1, v6, 0);
  _Block_release(v4);
}

- (void)readWithHandlerAndWait:(id)a3
{
  v4 = (void (**)(void *, uint64_t, id, void))_Block_copy(a3);
  v7 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v6 = [(objc_class *)isa crl_dispatchData];

  v4[2](v4, 1, v6, 0);
  _Block_release(v4);
}

- (_TtC8Freeform20CRLMemoryReadChannel)init
{
  result = (_TtC8Freeform20CRLMemoryReadChannel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
@interface MMAssertion
- (MMAssertion)init;
- (MMAssertion)initWithPolicy:(id)a3 description:(id)a4;
- (void)acquireWithCompletionHandler:(id)a3;
- (void)invalidateWithCompletionHandler:(id)a3;
@end

@implementation MMAssertion

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (MMAssertion)initWithPolicy:(id)a3 description:(id)a4
{
  uint64_t v4 = sub_256CEDF48();
  uint64_t v6 = v5;
  uint64_t v7 = sub_256CEDF48();
  return (MMAssertion *)sub_256C873A4(v4, v6, v7, v8);
}

- (void)acquireWithCompletionHandler:(id)a3
{
}

- (void)invalidateWithCompletionHandler:(id)a3
{
}

- (MMAssertion)init
{
}

@end
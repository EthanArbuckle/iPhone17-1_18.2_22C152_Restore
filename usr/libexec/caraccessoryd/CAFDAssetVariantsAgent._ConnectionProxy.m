@interface CAFDAssetVariantsAgent._ConnectionProxy
- (NSString)description;
- (_TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy)init;
- (void)fetchVariantsWithReply:(id)a3;
- (void)invalidate;
- (void)refreshVariants;
@end

@implementation CAFDAssetVariantsAgent._ConnectionProxy

- (NSString)description
{
  swift_getObjectType();
  v3 = self;
  BSServiceConnectionHost.CAFDDescription.getter();

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (_TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy)init
{
  result = (_TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_connection);
}

- (void)invalidate
{
  v2 = self;
  CAFDAssetVariantsAgent._ConnectionProxy.activate()("invalidate proxy %@", (SEL *)&selRef_invalidate);
}

- (void)fetchVariantsWithReply:(id)a3
{
  NSString v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  specialized CAFDAssetVariantsAgent._ConnectionProxy.fetchVariants(reply:)(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)refreshVariants
{
  v2 = self;
  CAFDAssetVariantsAgent._ConnectionProxy.refreshVariants()();
}

@end
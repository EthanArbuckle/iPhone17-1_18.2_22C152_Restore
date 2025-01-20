@interface ProxyConfiguration
- (BOOL)usePrivateRelay;
- (NSString)proxyAutoConfigScript;
- (NSString)proxyHost;
- (_TtC12NewsArticles18ProxyConfiguration)init;
@end

@implementation ProxyConfiguration

- (BOOL)usePrivateRelay
{
  v2 = self;
  char v3 = ProxyConfiguration.usePrivateRelay.getter();

  return v3 & 1;
}

- (NSString)proxyAutoConfigScript
{
  v2 = self;
  ProxyConfiguration.proxyAutoConfigScript.getter();

  char v3 = (void *)sub_1BF7E3998();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)proxyHost
{
  v2 = self;
  ProxyConfiguration.proxyHost.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1BF7E3998();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (_TtC12NewsArticles18ProxyConfiguration)init
{
  result = (_TtC12NewsArticles18ProxyConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NewsArticles18ProxyConfiguration_embedProxyConfiguration));
}

@end
@interface BackgroundTextConsumer
- (id)consumeMailContentWithContext:(id)a3;
- (id)consumeNewsArticleViewsWithContext:(id)a3;
- (id)consumeNotesContentWithContext:(id)a3;
- (id)consumeSafariContentWithContext:(id)a3;
- (id)consumeThirdPartyAppContentWithContext:(id)a3;
- (id)consumerName;
- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3;
@end

@implementation BackgroundTextConsumer

- (id)consumeMailContentWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1CA9CC6C4(v4);

  return v6;
}

- (id)consumeNewsArticleViewsWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  v8 = (void *)sub_1CA9CC814(v4, v6, v7);

  return v8;
}

- (id)consumeNotesContentWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)sub_1CA9CC8A8(v4);

  return v6;
}

- (id)consumeSafariContentWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)sub_1CA9CC940(v4);

  return v6;
}

- (id)consumeThirdPartyAppContentWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  v8 = (void *)sub_1CA9CCA64(v4, v6, v7);

  return v8;
}

- (id)consumerName
{
  sub_1CA9CCBCC();
  v2 = (void *)sub_1CAB4E2A0();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)sub_1CA9CB71C(v4);

  return v6;
}

@end
@interface UnifiedMessagingProvider
- (_TtC8ShelfKit24UnifiedMessagingProvider)init;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation UnifiedMessagingProvider

- (_TtC8ShelfKit24UnifiedMessagingProvider)init
{
  result = (_TtC8ShelfKit24UnifiedMessagingProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();

  swift_release();
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_126234(a4);
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);

  _Block_release(v5);
}

@end
@interface _XPCListenerDelegateTrampoline
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC8SPSharedP33_4DFE191C45A702EAD1213F8D530A798030_XPCListenerDelegateTrampoline)init;
@end

@implementation _XPCListenerDelegateTrampoline

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  swift_unownedRetainStrong();
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  LOBYTE(a3) = sub_1BBBE9F14(v8);

  swift_release();
  return a3 & 1;
}

- (_TtC8SPSharedP33_4DFE191C45A702EAD1213F8D530A798030_XPCListenerDelegateTrampoline)init
{
  result = (_TtC8SPSharedP33_4DFE191C45A702EAD1213F8D530A798030_XPCListenerDelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
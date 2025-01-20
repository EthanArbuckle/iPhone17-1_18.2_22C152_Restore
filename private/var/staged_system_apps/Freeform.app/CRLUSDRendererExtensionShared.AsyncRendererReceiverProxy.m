@interface CRLUSDRendererExtensionShared.AsyncRendererReceiverProxy
- (_TtCO8Freeform29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy)init;
- (void)getUUID:(id)a3;
- (void)loadScene:(id)a3 response:(id)a4;
- (void)performActions:(id)a3 response:(id)a4;
- (void)takeSnapshotAt:(float)a3 response:(id)a4;
- (void)updateScene:(id)a3 response:(id)a4;
@end

@implementation CRLUSDRendererExtensionShared.AsyncRendererReceiverProxy

- (void)getUUID:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1007CD8E0((uint64_t)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)loadScene:(id)a3 response:(id)a4
{
}

- (void)updateScene:(id)a3 response:(id)a4
{
}

- (void)performActions:(id)a3 response:(id)a4
{
}

- (void)takeSnapshotAt:(float)a3 response:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_1007CE380((uint64_t)v7, (void (**)(void, void, void))v6, a3);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtCO8Freeform29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy)init
{
  result = (_TtCO8Freeform29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
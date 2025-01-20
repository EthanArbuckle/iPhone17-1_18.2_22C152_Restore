@interface CRLUSDRenderingExtensionConnector.ViewControllerDelegate
- (_TtCC8Freeform33CRLUSDRenderingExtensionConnectorP33_3F2C14ED993E13602DE61854D66D868F22ViewControllerDelegate)init;
- (void)hostViewController:(id)a3 didBeginHosting:(id)a4;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
@end

@implementation CRLUSDRenderingExtensionConnector.ViewControllerDelegate

- (_TtCC8Freeform33CRLUSDRenderingExtensionConnectorP33_3F2C14ED993E13602DE61854D66D868F22ViewControllerDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self
     + OBJC_IVAR____TtCC8Freeform33CRLUSDRenderingExtensionConnectorP33_3F2C14ED993E13602DE61854D66D868F22ViewControllerDelegate_continuation;
  uint64_t v5 = sub_1005057FC(&qword_10167F0F0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(CRLUSDRenderingExtensionConnector.ViewControllerDelegate *)&v7 init];
}

- (void)hostViewController:(id)a3 didBeginHosting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100A1144C();
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_100A11664((uint64_t)a4);
}

- (void).cxx_destruct
{
}

@end
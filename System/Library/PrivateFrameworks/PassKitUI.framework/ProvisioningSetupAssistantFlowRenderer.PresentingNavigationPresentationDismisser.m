@interface ProvisioningSetupAssistantFlowRenderer.PresentingNavigationPresentationDismisser
- (_TtCC9PassKitUI38ProvisioningSetupAssistantFlowRendererP33_BD58C50EE9B37DCA7685D75FAEB7158241PresentingNavigationPresentationDismisser)init;
- (void)dealloc;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6;
@end

@implementation ProvisioningSetupAssistantFlowRenderer.PresentingNavigationPresentationDismisser

- (void)dealloc
{
  v2 = self;
  sub_19F63F14C(0);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ProvisioningSetupAssistantFlowRenderer.PresentingNavigationPresentationDismisser();
  [(ProvisioningSetupAssistantFlowRenderer.PresentingNavigationPresentationDismisser *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC9PassKitUI38ProvisioningSetupAssistantFlowRendererP33_BD58C50EE9B37DCA7685D75FAEB7158241PresentingNavigationPresentationDismisser_onCompletion);

  sub_19F48BB68(v3);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_19F63F7FC(v8);
}

- (_TtCC9PassKitUI38ProvisioningSetupAssistantFlowRendererP33_BD58C50EE9B37DCA7685D75FAEB7158241PresentingNavigationPresentationDismisser)init
{
  result = (_TtCC9PassKitUI38ProvisioningSetupAssistantFlowRendererP33_BD58C50EE9B37DCA7685D75FAEB7158241PresentingNavigationPresentationDismisser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
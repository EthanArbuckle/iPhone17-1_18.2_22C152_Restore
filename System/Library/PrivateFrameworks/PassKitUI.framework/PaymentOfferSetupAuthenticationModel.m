@interface PaymentOfferSetupAuthenticationModel
- (_TtC9PassKitUI36PaymentOfferSetupAuthenticationModel)init;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
@end

@implementation PaymentOfferSetupAuthenticationModel

- (_TtC9PassKitUI36PaymentOfferSetupAuthenticationModel)init
{
  result = (_TtC9PassKitUI36PaymentOfferSetupAuthenticationModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI36PaymentOfferSetupAuthenticationModel_paymentOffersController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI36PaymentOfferSetupAuthenticationModel_paymentPass));
  sub_19F9F3DC8((uint64_t)self + OBJC_IVAR____TtC9PassKitUI36PaymentOfferSetupAuthenticationModel_redirectURLMatcher, type metadata accessor for PaymentOfferSetupAuthenticationRedirectURLMatcher);
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1F48]), sel_init);

  return v3;
}

@end
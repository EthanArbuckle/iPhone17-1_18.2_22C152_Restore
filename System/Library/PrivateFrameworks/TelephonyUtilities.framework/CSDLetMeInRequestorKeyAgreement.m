@interface CSDLetMeInRequestorKeyAgreement
- (BOOL)isExhausted;
- (CSDLetMeInRequestorKeyAgreement)init;
@end

@implementation CSDLetMeInRequestorKeyAgreement

- (BOOL)isExhausted
{
  v2 = self;
  BOOL v3 = LetMeInRequestorKeyAgreement.isExhausted.getter();

  return v3;
}

- (CSDLetMeInRequestorKeyAgreement)init
{
}

- (void).cxx_destruct
{
  type metadata accessor for P256.KeyAgreement.PrivateKey();
  sub_1001F75FC();
  sub_1001F7664();
  v3();
  sub_100210614((uint64_t)self + OBJC_IVAR___CSDLetMeInRequestorKeyAgreement_requestKey, &qword_100585380);
  sub_100210614((uint64_t)self + OBJC_IVAR___CSDLetMeInRequestorKeyAgreement_responseKey, &qword_100585380);
}

@end
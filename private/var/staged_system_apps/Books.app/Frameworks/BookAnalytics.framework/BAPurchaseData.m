@interface BAPurchaseData
- (BAPurchaseData)init;
- (BAPurchaseData)initWithPurchaseAttemptID:(id)a3 purchaseMethod:(int64_t)a4 isPreorder:(BOOL)a5 pricingParameters:(id)a6;
@end

@implementation BAPurchaseData

- (BAPurchaseData)initWithPurchaseAttemptID:(id)a3 purchaseMethod:(int64_t)a4 isPreorder:(BOOL)a5 pricingParameters:(id)a6
{
  uint64_t v9 = sub_27DDB0();
  uint64_t v11 = v10;
  uint64_t v12 = sub_27DDB0();
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___BAPurchaseData_purchaseAttemptID);
  uint64_t *v13 = v9;
  v13[1] = v11;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAPurchaseData_purchaseMethod) = (Class)a4;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BAPurchaseData_isPreorder) = a5;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___BAPurchaseData_pricingParameters);
  uint64_t *v14 = v12;
  v14[1] = v15;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for BridgedPurchaseData();
  return [(BAPurchaseData *)&v17 init];
}

- (BAPurchaseData)init
{
  result = (BAPurchaseData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
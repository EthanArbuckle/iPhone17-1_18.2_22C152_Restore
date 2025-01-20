@interface BAPurchaseFailData
- (BAPurchaseFailData)init;
- (BAPurchaseFailData)initWithPurchaseFailureReason:(int64_t)a3 errorCode:(id)a4 errorDescription:(id)a5 errorDomain:(id)a6;
@end

@implementation BAPurchaseFailData

- (BAPurchaseFailData)initWithPurchaseFailureReason:(int64_t)a3 errorCode:(id)a4 errorDescription:(id)a5 errorDomain:(id)a6
{
  if (!a5)
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = sub_27DDB0();
  uint64_t v12 = v11;
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v13 = sub_27DDB0();
LABEL_6:
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAPurchaseFailData_purchaseFailureReason) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAPurchaseFailData_errorCode) = (Class)a4;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___BAPurchaseFailData_errorDescription);
  uint64_t *v15 = v10;
  v15[1] = v12;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR___BAPurchaseFailData_errorDomain);
  uint64_t *v16 = v13;
  v16[1] = v14;
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for BridgedPurchaseFailData();
  id v17 = a4;
  return [(BAPurchaseFailData *)&v19 init];
}

- (BAPurchaseFailData)init
{
  result = (BAPurchaseFailData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
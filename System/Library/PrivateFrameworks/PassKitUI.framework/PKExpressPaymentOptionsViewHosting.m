@interface PKExpressPaymentOptionsViewHosting
+ (id)createExpressPaymentOptionsViewHostingControllerWithPass:(id)a3 eligibleExpressUpgradeRequests:(id)a4 currentExpressPassInfo:(id)a5 updateExpressStateHandler:(id)a6;
- (PKExpressPaymentOptionsViewHosting)init;
@end

@implementation PKExpressPaymentOptionsViewHosting

+ (id)createExpressPaymentOptionsViewHostingControllerWithPass:(id)a3 eligibleExpressUpgradeRequests:(id)a4 currentExpressPassInfo:(id)a5 updateExpressStateHandler:(id)a6
{
  v8 = _Block_copy(a6);
  sub_19F48BAC4(0, &qword_1E94A6560);
  unint64_t v9 = sub_1A03B4C58();
  *(void *)(swift_allocObject() + 16) = v8;
  id v10 = a3;
  id v11 = a5;
  sub_19F72FDAC(v10, v9);
  id v12 = v10;
  sub_1A03ADE18();
  sub_1A03B4088();
  id v13 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E94A64C8));
  v14 = (void *)sub_1A03B29C8();

  swift_bridgeObjectRelease();
  swift_release();

  return v14;
}

- (PKExpressPaymentOptionsViewHosting)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExpressPaymentOptionsViewHosting();
  return [(PKExpressPaymentOptionsViewHosting *)&v3 init];
}

@end
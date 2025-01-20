@interface _PKNearbyPeerPaymentReceiverCoordinator
+ (BOOL)nearbyReceiverIsEligible;
- (_PKNearbyPeerPaymentReceiverCoordinator)init;
- (_PKNearbyPeerPaymentReceiverCoordinator)initWithSenderMetadata:(id)a3;
- (void)nearbyReceiverRequiresConfirmationWithContactID:(NSString *)a3 completionHandler:(id)a4;
- (void)recipientMetadataWithAppearanceData:(PKPeerPaymentProfileAppearanceData *)a3 nonce:(NSString *)a4 completionHandler:(id)a5;
- (void)validateTransactionWithResult:(NSData *)a3 completionHandler:(id)a4;
@end

@implementation _PKNearbyPeerPaymentReceiverCoordinator

+ (BOOL)nearbyReceiverIsEligible
{
  _s11PassKitCore36NearbyPeerPaymentReceiverCoordinatorC06nearbyG10IsEligibleSbyFZ_0();
  return v2 & 1;
}

- (_PKNearbyPeerPaymentReceiverCoordinator)initWithSenderMetadata:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1915EEAF0();
  unint64_t v6 = v5;

  v7 = (_PKNearbyPeerPaymentReceiverCoordinator *)sub_190F96C2C(v4, v6);
  sub_190E7872C(v4, v6);
  return v7;
}

- (void)nearbyReceiverRequiresConfirmationWithContactID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92BCC30);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1915EF3A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E92BDF88;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E92BDF90;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_190F96784((uint64_t)v9, (uint64_t)&unk_1E92BDF98, (uint64_t)v14);
  swift_release();
}

- (void)recipientMetadataWithAppearanceData:(PKPeerPaymentProfileAppearanceData *)a3 nonce:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92BCC30);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1915EF3A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E92BDF68;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E92BDF70;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_190F96784((uint64_t)v11, (uint64_t)&unk_1E92BDF78, (uint64_t)v16);
  swift_release();
}

- (void)validateTransactionWithResult:(NSData *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92BCC30);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1915EF3A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E92BDF38;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E92BAF90;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_190F96784((uint64_t)v9, (uint64_t)&unk_1E92BAF98, (uint64_t)v14);
  swift_release();
}

- (_PKNearbyPeerPaymentReceiverCoordinator)init
{
  result = (_PKNearbyPeerPaymentReceiverCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_190E7872C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____PKNearbyPeerPaymentReceiverCoordinator_senderMetadata), *(void *)&self->peerPaymentAccount[OBJC_IVAR____PKNearbyPeerPaymentReceiverCoordinator_senderMetadata]);
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____PKNearbyPeerPaymentReceiverCoordinator____lazy_storage___amountFormatter);
}

@end
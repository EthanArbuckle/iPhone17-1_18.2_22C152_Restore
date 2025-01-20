@interface _PKNearbyPeerPaymentReceiverResponseMetadata
+ (void)receiverDataWithNonce:(id)a3 nearbyMetadata:(id)a4 appearanceData:(id)a5 completion:(id)a6;
- (NSData)serializedData;
- (_PKNearbyPeerPaymentReceiverResponseMetadata)init;
@end

@implementation _PKNearbyPeerPaymentReceiverResponseMetadata

+ (void)receiverDataWithNonce:(id)a3 nearbyMetadata:(id)a4 appearanceData:(id)a5 completion:(id)a6
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92BCC30);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a6);
  uint64_t v13 = sub_1915EF030();
  uint64_t v15 = v14;
  id v16 = a4;
  id v17 = a5;
  uint64_t v18 = sub_1915EEAF0();
  unint64_t v20 = v19;

  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v12;
  uint64_t v22 = sub_1915EF3A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v11, 1, 1, v22);
  v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = v13;
  v23[5] = v15;
  v23[6] = v18;
  v23[7] = v20;
  v23[8] = v17;
  v23[9] = sub_190F53230;
  v23[10] = v21;
  id v24 = v17;
  swift_bridgeObjectRetain();
  sub_190E7C3CC(v18, v20);
  swift_retain();
  sub_190FCD57C((uint64_t)v11, (uint64_t)&unk_1E92BE818, (uint64_t)v23);
  swift_release();
  swift_release();
  sub_190E7872C(v18, v20);
  swift_bridgeObjectRelease();
}

- (NSData)serializedData
{
  swift_getObjectType();
  sub_1915EE750();
  swift_allocObject();
  v3 = self;
  sub_1915EE740();
  sub_190FD0E38((unint64_t *)&unk_1E92BDEF0, v4, (void (*)(uint64_t))type metadata accessor for NearbyPeerPaymentReceiverResponseMetadata);
  uint64_t v5 = sub_1915EE730();
  unint64_t v7 = v6;
  swift_release();

  v8 = (void *)sub_1915EEAE0();
  sub_190E7872C(v5, v7);
  return (NSData *)v8;
}

- (_PKNearbyPeerPaymentReceiverResponseMetadata)init
{
  result = (_PKNearbyPeerPaymentReceiverResponseMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____PKNearbyPeerPaymentReceiverResponseMetadata_receiverImageData);
  unint64_t v4 = *(void *)&self->encryptedData[OBJC_IVAR____PKNearbyPeerPaymentReceiverResponseMetadata_receiverImageData];
  sub_190E14B50(v3, v4);
}

@end
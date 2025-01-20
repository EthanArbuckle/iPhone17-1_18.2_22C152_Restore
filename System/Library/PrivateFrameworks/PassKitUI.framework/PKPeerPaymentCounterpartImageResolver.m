@interface PKPeerPaymentCounterpartImageResolver
- (BOOL)hasCachedImageDataForIdentifier:(id)a3;
- (PKPeerPaymentCounterpartImageResolver)init;
- (id)counterpartImageDataForIdentifier:(id)a3;
- (void)counterpartImageDataForIdentifier:(id)a3 completion:(id)a4;
@end

@implementation PKPeerPaymentCounterpartImageResolver

- (PKPeerPaymentCounterpartImageResolver)init
{
  return (PKPeerPaymentCounterpartImageResolver *)PeerPaymentCounterpartImageResolver.init()();
}

- (BOOL)hasCachedImageDataForIdentifier:(id)a3
{
  sub_1A03B4988();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKPeerPaymentCounterpartImageResolver_cache);
  v5 = self;
  v6 = (void *)sub_1A03B4958();
  id v7 = objc_msgSend(v4, sel_objectForKey_, v6);

  swift_bridgeObjectRelease();
  if (v7) {

  }
  return v7 != 0;
}

- (id)counterpartImageDataForIdentifier:(id)a3
{
  sub_1A03B4988();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKPeerPaymentCounterpartImageResolver_cache);
  v5 = self;
  v6 = (void *)sub_1A03B4958();
  id v7 = objc_msgSend(v4, sel_objectForKey_, v6);

  swift_bridgeObjectRelease();

  return v7;
}

- (void)counterpartImageDataForIdentifier:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A03B4988();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  sub_19F7DC590(v6, v8, (uint64_t)sub_19F533B00, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKPeerPaymentCounterpartImageResolver_replyQueue);
}

@end
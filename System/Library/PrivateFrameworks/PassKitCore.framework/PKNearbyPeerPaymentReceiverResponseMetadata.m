@interface PKNearbyPeerPaymentReceiverResponseMetadata
+ (void)receiverDataWithNonce:(id)a3 nearbyMetadata:(id)a4 appearanceData:(id)a5 completion:(id)a6;
- (PKNearbyPeerPaymentReceiverResponseMetadata)initWithInternalData:(id)a3;
- (id)serializedData;
@end

@implementation PKNearbyPeerPaymentReceiverResponseMetadata

+ (void)receiverDataWithNonce:(id)a3 nearbyMetadata:(id)a4 appearanceData:(id)a5 completion:(id)a6
{
  id v9 = a6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __110__PKNearbyPeerPaymentReceiverResponseMetadata_receiverDataWithNonce_nearbyMetadata_appearanceData_completion___block_invoke;
  v11[3] = &unk_1E56F5790;
  id v12 = v9;
  id v10 = v9;
  +[_PKNearbyPeerPaymentReceiverResponseMetadata receiverDataWithNonce:a3 nearbyMetadata:a4 appearanceData:a5 completion:v11];
}

void __110__PKNearbyPeerPaymentReceiverResponseMetadata_receiverDataWithNonce_nearbyMetadata_appearanceData_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    v4 = [[PKNearbyPeerPaymentReceiverResponseMetadata alloc] initWithInternalData:v3];
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PKNearbyPeerPaymentReceiverResponseMetadata)initWithInternalData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKNearbyPeerPaymentReceiverResponseMetadata;
  v6 = [(PKNearbyPeerPaymentReceiverResponseMetadata *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internalData, a3);
  }

  return v7;
}

- (id)serializedData
{
  return [(_PKNearbyPeerPaymentReceiverResponseMetadata *)self->_internalData serializedData];
}

- (void).cxx_destruct
{
}

@end
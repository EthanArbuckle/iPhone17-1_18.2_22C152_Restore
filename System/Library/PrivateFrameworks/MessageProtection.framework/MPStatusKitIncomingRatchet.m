@interface MPStatusKitIncomingRatchet
- (MPStatusKitIncomingRatchet)initWithData:(id)a3 error:(id *)a4;
- (MPStatusKitIncomingRatchet)initWithIndex:(unsigned __int16)a3 chainKey:(id)a4 signingKey:(id)a5 error:(id *)a6;
- (_TtC17MessageProtection17SKIncomingRatchet)ratchet;
- (id)serializedData;
- (id)signingKeyIdentifier;
- (id)unsealStatusWithIndex:(unsigned __int16)a3 encryptedMessage:(id)a4 authenticating:(id)a5 signature:(id)a6 error:(id *)a7;
- (unint64_t)maxForwardRatchetDelta;
- (void)setRatchet:(id)a3;
@end

@implementation MPStatusKitIncomingRatchet

- (MPStatusKitIncomingRatchet)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPStatusKitIncomingRatchet;
  v7 = [(MPStatusKitIncomingRatchet *)&v11 init];
  if (!v7
    || (v8 = [[_TtC17MessageProtection17SKIncomingRatchet alloc] initWithData:v6 error:a4], [(MPStatusKitIncomingRatchet *)v7 setRatchet:v8], v8, [(MPStatusKitIncomingRatchet *)v7 ratchet], v9 = (MPStatusKitIncomingRatchet *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    v9 = v7;
  }

  return v9;
}

- (MPStatusKitIncomingRatchet)initWithIndex:(unsigned __int16)a3 chainKey:(id)a4 signingKey:(id)a5 error:(id *)a6
{
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPStatusKitIncomingRatchet;
  v12 = [(MPStatusKitIncomingRatchet *)&v16 init];
  if (!v12
    || (v13 = [[_TtC17MessageProtection17SKIncomingRatchet alloc] initWithKey:v10 index:v8 signingKey:v11 error:a6], [(MPStatusKitIncomingRatchet *)v12 setRatchet:v13], v13, [(MPStatusKitIncomingRatchet *)v12 ratchet], v14 = (MPStatusKitIncomingRatchet *)objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    v14 = v12;
  }

  return v14;
}

- (id)unsealStatusWithIndex:(unsigned __int16)a3 encryptedMessage:(id)a4 authenticating:(id)a5 signature:(id)a6 error:(id *)a7
{
  unsigned int v10 = a3;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  v15 = [(MPStatusKitIncomingRatchet *)self ratchet];
  objc_super v16 = [v15 openStatusWithIndex:v10 encryptedMessage:v14 authenticating:v13 signature:v12 error:a7];

  return v16;
}

- (id)serializedData
{
  v2 = [(MPStatusKitIncomingRatchet *)self ratchet];
  v3 = [v2 serializedData];

  return v3;
}

- (id)signingKeyIdentifier
{
  v2 = [(MPStatusKitIncomingRatchet *)self ratchet];
  v3 = [v2 signingKeyIdentifier];

  return v3;
}

- (unint64_t)maxForwardRatchetDelta
{
  return +[SKIncomingRatchet maxForwardRatchetDelta];
}

- (_TtC17MessageProtection17SKIncomingRatchet)ratchet
{
  return self->_ratchet;
}

- (void)setRatchet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
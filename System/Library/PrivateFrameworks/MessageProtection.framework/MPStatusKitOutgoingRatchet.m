@interface MPStatusKitOutgoingRatchet
- (BOOL)ratchetForward;
- (MPStatusKitOutgoingRatchet)init;
- (MPStatusKitOutgoingRatchet)initWithData:(id)a3 error:(id *)a4;
- (_TtC17MessageProtection17SKOutgoingRatchet)ratchet;
- (id)currentSubscriptionKeys;
- (id)sealStatus:(id)a3 authenticating:(id)a4 error:(id *)a5;
- (id)serializedData;
- (id)signingKeyIdentifier;
- (void)setRatchet:(id)a3;
@end

@implementation MPStatusKitOutgoingRatchet

- (MPStatusKitOutgoingRatchet)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPStatusKitOutgoingRatchet;
  v7 = [(MPStatusKitOutgoingRatchet *)&v11 init];
  if (!v7
    || (v8 = [[_TtC17MessageProtection17SKOutgoingRatchet alloc] initWithData:v6 error:a4], [(MPStatusKitOutgoingRatchet *)v7 setRatchet:v8], v8, [(MPStatusKitOutgoingRatchet *)v7 ratchet], v9 = (MPStatusKitOutgoingRatchet *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    v9 = v7;
  }

  return v9;
}

- (MPStatusKitOutgoingRatchet)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPStatusKitOutgoingRatchet;
  v2 = [(MPStatusKitOutgoingRatchet *)&v5 init];
  if (v2)
  {
    v3 = +[SKOutgoingRatchet generate];
    [(MPStatusKitOutgoingRatchet *)v2 setRatchet:v3];
  }
  return v2;
}

- (id)currentSubscriptionKeys
{
  v2 = [(MPStatusKitOutgoingRatchet *)self ratchet];
  v3 = [v2 currentSubscriptionKeys];

  return v3;
}

- (BOOL)ratchetForward
{
  v2 = [(MPStatusKitOutgoingRatchet *)self ratchet];
  char v3 = [v2 ratchetForward];

  return v3;
}

- (id)sealStatus:(id)a3 authenticating:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(MPStatusKitOutgoingRatchet *)self ratchet];
  objc_super v11 = [v10 sealMessage:v9 authenticating:v8 error:a5];

  return v11;
}

- (id)serializedData
{
  v2 = [(MPStatusKitOutgoingRatchet *)self ratchet];
  char v3 = [v2 serializedData];

  return v3;
}

- (id)signingKeyIdentifier
{
  v2 = [(MPStatusKitOutgoingRatchet *)self ratchet];
  char v3 = [v2 signingKeyIdentifier];

  return v3;
}

- (_TtC17MessageProtection17SKOutgoingRatchet)ratchet
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
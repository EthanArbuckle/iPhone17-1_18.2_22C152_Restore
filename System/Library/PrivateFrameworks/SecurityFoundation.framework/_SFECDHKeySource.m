@interface _SFECDHKeySource
- (_SFECDHKeySource)initWithLocalKeyPair:(id)a3 remotePublickKey:(id)a4;
- (_SFECKeyPair)localKeyPair;
- (_SFECPublicKey)remotePublicKey;
- (void)setLocalKeyPair:(id)a3;
- (void)setRemotePublicKey:(id)a3;
@end

@implementation _SFECDHKeySource

- (_SFECDHKeySource)initWithLocalKeyPair:(id)a3 remotePublickKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SFECDHKeySource;
  v9 = [(_SFECDHKeySource *)&v13 init];
  if (v9)
  {
    v10 = objc_alloc_init(SFECDHKeySource_Ivars);
    id ecdhKeySourceInternal = v9->_ecdhKeySourceInternal;
    v9->_id ecdhKeySourceInternal = v10;

    objc_storeStrong((id *)v9->_ecdhKeySourceInternal + 1, a3);
    objc_storeStrong((id *)v9->_ecdhKeySourceInternal + 2, a4);
  }

  return v9;
}

- (_SFECKeyPair)localKeyPair
{
  return (_SFECKeyPair *)*((id *)self->_ecdhKeySourceInternal + 1);
}

- (void)setLocalKeyPair:(id)a3
{
}

- (_SFECPublicKey)remotePublicKey
{
  return (_SFECPublicKey *)*((id *)self->_ecdhKeySourceInternal + 2);
}

- (void)setRemotePublicKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
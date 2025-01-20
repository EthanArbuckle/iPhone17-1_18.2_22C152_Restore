@interface OctagonSelfPeer
- (BOOL)matchesPeer:(id)a3;
- (NSString)description;
- (NSString)peerID;
- (OctagonSelfPeer)initWithPeerID:(id)a3 signingIdentity:(id)a4 encryptionIdentity:(id)a5;
- (_SFECKeyPair)encryptionKey;
- (_SFECKeyPair)signingKey;
- (_SFECPublicKey)publicEncryptionKey;
- (_SFECPublicKey)publicSigningKey;
- (_SFIdentity)encryptionIdentity;
- (_SFIdentity)signingIdentity;
- (void)setEncryptionIdentity:(id)a3;
- (void)setSigningIdentity:(id)a3;
@end

@implementation OctagonSelfPeer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingIdentity, 0);
  objc_storeStrong((id *)&self->_encryptionIdentity, 0);

  objc_storeStrong((id *)&self->_peerID, 0);
}

- (void)setSigningIdentity:(id)a3
{
}

- (_SFIdentity)signingIdentity
{
  return (_SFIdentity *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEncryptionIdentity:(id)a3
{
}

- (_SFIdentity)encryptionIdentity
{
  return (_SFIdentity *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)matchesPeer:(id)a3
{
  uint64_t v4 = [a3 peerID];
  uint64_t v5 = [(OctagonSelfPeer *)self peerID];
  uint64_t v6 = v5 | v4;

  if (v6)
  {
    v8 = [(OctagonSelfPeer *)self peerID];
    unsigned __int8 v7 = [v8 isEqualToString:v4];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (_SFECKeyPair)signingKey
{
  v2 = [(OctagonSelfPeer *)self signingIdentity];
  v3 = [v2 keyPair];

  return (_SFECKeyPair *)v3;
}

- (_SFECKeyPair)encryptionKey
{
  v2 = [(OctagonSelfPeer *)self encryptionIdentity];
  v3 = [v2 keyPair];

  return (_SFECKeyPair *)v3;
}

- (_SFECPublicKey)publicSigningKey
{
  v2 = [(OctagonSelfPeer *)self signingIdentity];
  v3 = [v2 publicKey];

  return (_SFECPublicKey *)v3;
}

- (_SFECPublicKey)publicEncryptionKey
{
  v2 = [(OctagonSelfPeer *)self encryptionIdentity];
  v3 = [v2 publicKey];

  return (_SFECPublicKey *)v3;
}

- (NSString)description
{
  v2 = [(OctagonSelfPeer *)self peerID];
  v3 = +[NSString stringWithFormat:@"<OctagonSelfPeer: %@>", v2];

  return (NSString *)v3;
}

- (OctagonSelfPeer)initWithPeerID:(id)a3 signingIdentity:(id)a4 encryptionIdentity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OctagonSelfPeer;
  v12 = [(OctagonSelfPeer *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_peerID, a3);
    objc_storeStrong((id *)&v13->_signingIdentity, a4);
    objc_storeStrong((id *)&v13->_encryptionIdentity, a5);
  }

  return v13;
}

@end
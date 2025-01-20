@interface TrustedPeersHelperPeer
+ (BOOL)supportsSecureCoding;
- (NSData)encryptionSPKI;
- (NSData)signingSPKI;
- (NSSet)viewList;
- (NSString)peerID;
- (TPPBSecureElementIdentity)secureElementIdentity;
- (TrustedPeersHelperPeer)initWithCoder:(id)a3;
- (TrustedPeersHelperPeer)initWithPeerID:(id)a3 signingSPKI:(id)a4 encryptionSPKI:(id)a5 secureElementIdentity:(id)a6 viewList:(id)a7;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptionSPKI:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setSecureElementIdentity:(id)a3;
- (void)setSigningSPKI:(id)a3;
- (void)setViewList:(id)a3;
@end

@implementation TrustedPeersHelperPeer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureElementIdentity, 0);
  objc_storeStrong((id *)&self->_viewList, 0);
  objc_storeStrong((id *)&self->_encryptionSPKI, 0);
  objc_storeStrong((id *)&self->_signingSPKI, 0);

  objc_storeStrong((id *)&self->_peerID, 0);
}

- (void)setSecureElementIdentity:(id)a3
{
}

- (TPPBSecureElementIdentity)secureElementIdentity
{
  return (TPPBSecureElementIdentity *)objc_getProperty(self, a2, 40, 1);
}

- (void)setViewList:(id)a3
{
}

- (NSSet)viewList
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEncryptionSPKI:(id)a3
{
}

- (NSData)encryptionSPKI
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSigningSPKI:(id)a3
{
}

- (NSData)signingSPKI
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TrustedPeersHelperPeer *)self peerID];
  [v4 encodeObject:v5 forKey:@"peerID"];

  v6 = [(TrustedPeersHelperPeer *)self signingSPKI];
  [v4 encodeObject:v6 forKey:@"signingSPKI"];

  v7 = [(TrustedPeersHelperPeer *)self encryptionSPKI];
  [v4 encodeObject:v7 forKey:@"encryptionSPKI"];

  v8 = [(TrustedPeersHelperPeer *)self secureElementIdentity];
  [v4 encodeObject:v8 forKey:@"seIdentity"];

  id v9 = [(TrustedPeersHelperPeer *)self viewList];
  [v4 encodeObject:v9 forKey:@"viewList"];
}

- (TrustedPeersHelperPeer)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TrustedPeersHelperPeer;
  v5 = [(TrustedPeersHelperPeer *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerID"];
    peerID = v5->_peerID;
    v5->_peerID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signingSPKI"];
    signingSPKI = v5->_signingSPKI;
    v5->_signingSPKI = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionSPKI"];
    encryptionSPKI = v5->_encryptionSPKI;
    v5->_encryptionSPKI = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seIdentity"];
    secureElementIdentity = v5->_secureElementIdentity;
    v5->_secureElementIdentity = (TPPBSecureElementIdentity *)v12;

    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v14 = +[NSArray arrayWithObjects:v20 count:2];
    v15 = +[NSSet setWithArray:v14];
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"viewList"];
    viewList = v5->_viewList;
    v5->_viewList = (NSSet *)v16;
  }
  return v5;
}

- (id)description
{
  v3 = [(TrustedPeersHelperPeer *)self peerID];
  id v4 = [(TrustedPeersHelperPeer *)self signingSPKI];
  v5 = [(TrustedPeersHelperPeer *)self encryptionSPKI];
  uint64_t v6 = [(TrustedPeersHelperPeer *)self secureElementIdentity];
  v7 = [v6 peerIdentifier];
  uint64_t v8 = [v7 base64EncodedStringWithOptions:0];
  id v9 = [(TrustedPeersHelperPeer *)self viewList];
  uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<TPHPeer: %@ %@ %@ se:%@ (%lu views)>", v3, v4, v5, v8, [v9 count]);

  return v10;
}

- (TrustedPeersHelperPeer)initWithPeerID:(id)a3 signingSPKI:(id)a4 encryptionSPKI:(id)a5 secureElementIdentity:(id)a6 viewList:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TrustedPeersHelperPeer;
  v17 = [(TrustedPeersHelperPeer *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_peerID, a3);
    objc_storeStrong((id *)&v18->_signingSPKI, a4);
    objc_storeStrong((id *)&v18->_encryptionSPKI, a5);
    objc_storeStrong((id *)&v18->_secureElementIdentity, a6);
    objc_storeStrong((id *)&v18->_viewList, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
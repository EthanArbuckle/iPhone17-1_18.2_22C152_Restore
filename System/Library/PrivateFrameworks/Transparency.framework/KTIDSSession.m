@interface KTIDSSession
+ (BOOL)supportsSecureCoding;
- (BOOL)markAsVerified:(id *)a3;
- (BOOL)markContactAsVerified:(id)a3 error:(id *)a4;
- (BOOL)peerDisconnected;
- (KTAccountPublicID)peerAccountIdentity;
- (KTIDSSession)init;
- (KTIDSSession)initWithCoder:(id)a3;
- (NSData)jsonObject;
- (NSDate)sessionExpire;
- (NSSet)expectedPeerHandles;
- (NSString)contactIdentifier;
- (NSString)peerHandle;
- (NSString)sasCode;
- (NSString)sessionID;
- (NSString)state;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setExpectedPeerHandles:(id)a3;
- (void)setPeerAccountIdentity:(id)a3;
- (void)setPeerDisconnected:(BOOL)a3;
- (void)setPeerHandle:(id)a3;
- (void)setSasCode:(id)a3;
- (void)setSessionExpire:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setState:(id)a3;
@end

@implementation KTIDSSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v4 = [(KTIDSSession *)self state];
  v5 = [(KTIDSSession *)self peerHandle];
  v6 = [(KTIDSSession *)self peerAccountIdentity];
  v7 = [v6 publicAccountIdentity];
  v8 = [(KTIDSSession *)self sasCode];
  if (v8) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  BOOL v10 = [(KTIDSSession *)self peerDisconnected];
  v11 = @"connected";
  if (v10) {
    v11 = @"disconnected";
  }
  v12 = [v3 stringWithFormat:@"<KTIDSSession: state: %@ handle: %@ peerIdentity: %@ sasCode: %@ %@>", v4, v5, v7, v9, v11];

  return v12;
}

- (KTIDSSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)KTIDSSession;
  v2 = [(KTIDSSession *)&v7 init];
  if (v2)
  {
    id v3 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:16];
    if (SecRandomCopyBytes(0, 0x10uLL, (void *)[v3 mutableBytes])) {
      abort();
    }
    v4 = objc_msgSend(v3, "kt_hexString");
    [(KTIDSSession *)v2 setSessionID:v4];

    [(KTIDSSession *)v2 setState:kTransparencyStaticKeyStateInit];
    v5 = v2;
  }
  return v2;
}

- (BOOL)markAsVerified:(id *)a3
{
  v5 = [(KTIDSSession *)self contactIdentifier];

  if (v5)
  {
    id v6 = [(KTIDSSession *)self contactIdentifier];
    BOOL v7 = [(KTIDSSession *)self markContactAsVerified:v6 error:a3];
  }
  else
  {
    v8 = +[TransparencyError errorWithDomain:@"TransparencyErrorDecode" code:-297 description:@"Static key have not contact identifier, can't mark as verified"];
    id v6 = v8;
    if (a3)
    {
      id v6 = v8;
      BOOL v7 = 0;
      *a3 = v6;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)markContactAsVerified:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = [(KTIDSSession *)self state];
    if ([v7 isEqual:kTransparencyStaticKeyStateCodeAvailable])
    {
      v8 = [(KTIDSSession *)self sasCode];

      if (v8)
      {
        BOOL v9 = 1;
        goto LABEL_11;
      }
    }
    else
    {
    }
    BOOL v10 = @"Static key exchange not complete, can't mark as verified";
    uint64_t v11 = -295;
  }
  else
  {
    BOOL v10 = @"Static key have not contact identifier, can't mark as verified";
    uint64_t v11 = -297;
  }
  id v12 = +[TransparencyError errorWithDomain:@"TransparencyErrorDecode" code:v11 description:v10];
  if (a4)
  {
    id v12 = v12;
    *a4 = v12;
  }

  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  v4 = [(KTIDSSession *)self state];
  [v16 encodeObject:v4 forKey:@"state"];

  v5 = [(KTIDSSession *)self sessionID];
  [v16 encodeObject:v5 forKey:@"sessionID"];

  id v6 = [(KTIDSSession *)self sessionExpire];

  if (v6)
  {
    BOOL v7 = [(KTIDSSession *)self sessionExpire];
    [v16 encodeObject:v7 forKey:@"sessionExpire"];
  }
  v8 = [(KTIDSSession *)self peerHandle];

  if (v8)
  {
    BOOL v9 = [(KTIDSSession *)self peerHandle];
    [v16 encodeObject:v9 forKey:@"peerHandle"];
  }
  BOOL v10 = [(KTIDSSession *)self contactIdentifier];

  if (v10)
  {
    uint64_t v11 = [(KTIDSSession *)self contactIdentifier];
    [v16 encodeObject:v11 forKey:@"contactIdentifier"];
  }
  id v12 = [(KTIDSSession *)self peerAccountIdentity];

  if (v12)
  {
    v13 = [(KTIDSSession *)self peerAccountIdentity];
    [v16 encodeObject:v13 forKey:@"peerAccountIdentity"];
  }
  v14 = [(KTIDSSession *)self sasCode];

  if (v14)
  {
    v15 = [(KTIDSSession *)self sasCode];
    [v16 encodeObject:v15 forKey:@"sasCode"];
  }
  objc_msgSend(v16, "encodeBool:forKey:", -[KTIDSSession peerDisconnected](self, "peerDisconnected"), @"disconnected");
}

- (KTIDSSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KTIDSSession;
  v5 = [(KTIDSSession *)&v15 init];
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
  [(KTIDSSession *)v5 setState:v6];

  BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
  [(KTIDSSession *)v5 setSessionID:v7];

  v8 = [(KTIDSSession *)v5 state];
  if (v8)
  {
    BOOL v9 = [(KTIDSSession *)v5 sessionID];

    if (v9)
    {
      BOOL v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionExpire"];
      [(KTIDSSession *)v5 setSessionExpire:v10];

      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerHandle"];
      [(KTIDSSession *)v5 setPeerHandle:v11];

      id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerAccountIdentity"];
      [(KTIDSSession *)v5 setPeerAccountIdentity:v12];

      v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sasCode"];
      [(KTIDSSession *)v5 setSasCode:v13];

      -[KTIDSSession setPeerDisconnected:](v5, "setPeerDisconnected:", [v4 decodeBoolForKey:@"disconnected"]);
      v8 = v5;
      goto LABEL_6;
    }
LABEL_5:
    v8 = 0;
  }
LABEL_6:

  return v8;
}

- (NSData)jsonObject
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(KTIDSSession *)self sessionID];
  [v3 setObject:v4 forKeyedSubscript:@"sessionID"];

  v5 = [(KTIDSSession *)self state];
  [v3 setObject:v5 forKeyedSubscript:@"state"];

  id v6 = [(KTIDSSession *)self sessionExpire];
  [v3 setObject:v6 forKeyedSubscript:@"expire"];

  BOOL v7 = [(KTIDSSession *)self peerHandle];
  [v3 setObject:v7 forKeyedSubscript:@"peerHandle"];

  v8 = [(KTIDSSession *)self contactIdentifier];
  [v3 setObject:v8 forKeyedSubscript:@"contactIdentifier"];

  BOOL v9 = [(KTIDSSession *)self peerAccountIdentity];
  BOOL v10 = [v9 publicAccountIdentity];
  [v3 setObject:v10 forKeyedSubscript:@"peerAccountIdentity"];

  uint64_t v11 = [(KTIDSSession *)self sasCode];
  [v3 setObject:v11 forKeyedSubscript:@"sasCode"];

  id v12 = objc_msgSend(NSNumber, "numberWithBool:", -[KTIDSSession peerDisconnected](self, "peerDisconnected"));
  [v3 setObject:v12 forKeyedSubscript:@"disconnected"];

  v13 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:1 error:0];

  return (NSData *)v13;
}

- (NSDate)sessionExpire
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSessionExpire:(id)a3
{
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSessionID:(id)a3
{
}

- (NSString)peerHandle
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPeerHandle:(id)a3
{
}

- (NSString)state
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setState:(id)a3
{
}

- (NSString)sasCode
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSasCode:(id)a3
{
}

- (NSSet)expectedPeerHandles
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExpectedPeerHandles:(id)a3
{
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContactIdentifier:(id)a3
{
}

- (BOOL)peerDisconnected
{
  return self->_peerDisconnected;
}

- (void)setPeerDisconnected:(BOOL)a3
{
  self->_peerDisconnected = a3;
}

- (KTAccountPublicID)peerAccountIdentity
{
  return (KTAccountPublicID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPeerAccountIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerAccountIdentity, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_expectedPeerHandles, 0);
  objc_storeStrong((id *)&self->sasCode, 0);
  objc_storeStrong((id *)&self->state, 0);
  objc_storeStrong((id *)&self->peerHandle, 0);
  objc_storeStrong((id *)&self->sessionID, 0);

  objc_storeStrong((id *)&self->sessionExpire, 0);
}

@end
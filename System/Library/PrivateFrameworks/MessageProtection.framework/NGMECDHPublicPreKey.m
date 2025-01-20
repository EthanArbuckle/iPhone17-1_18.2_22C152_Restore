@interface NGMECDHPublicPreKey
- (BOOL)isValidlySignedBy:(id)a3 error:(id *)a4;
- (DHPublicKey)dhKey;
- (NGMECDHPublicPreKey)initWithPublicKey:(id)a3 signature:(id)a4 timestamp:(double)a5;
- (NSData)signature;
- (double)timestamp;
- (id)description;
- (id)initRemotePrekeyWithPublicPrekeyPB:(id)a3 signedBy:(id)a4 error:(id *)a5;
@end

@implementation NGMECDHPublicPreKey

- (id)initRemotePrekeyWithPublicPrekeyPB:(id)a3 signedBy:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [DHPublicKey alloc];
  v11 = [v8 prekey];
  v12 = [(PublicKey *)v10 initWithData:v11 error:a5];

  if (!v12)
  {
    MPLogAndAssignError(100, a5, @"Failed to initialize the DHPublicKey for the prekey.");
    goto LABEL_5;
  }
  v13 = [v8 prekeySignature];
  [v8 timestamp];
  self = -[NGMECDHPublicPreKey initWithPublicKey:signature:timestamp:](self, "initWithPublicKey:signature:timestamp:", v12, v13);

  if (![(NGMECDHPublicPreKey *)self isValidlySignedBy:v9 error:a5])
  {
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  self = self;
  v14 = self;
LABEL_6:

  return v14;
}

- (NGMECDHPublicPreKey)initWithPublicKey:(id)a3 signature:(id)a4 timestamp:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NGMECDHPublicPreKey;
  v11 = [(NGMECDHPublicPreKey *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dhKey, a3);
    objc_storeStrong((id *)&v12->_signature, a4);
    v12->_timestamp = a5;
  }

  return v12;
}

- (BOOL)isValidlySignedBy:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(NGMECDHPublicPreKey *)self signature];
  id v8 = [[NGMPrekeySignatureFormatter alloc] initWithPublicPrekey:self];
  char v9 = [v6 verifySignature:v7 formatter:v8];

  if (v9)
  {
    [(NGMECDHPublicPreKey *)self timestamp];
    if (+[NGMTimeBasedEvaluations validateFetchedPrekeyTimestamp:forEvaluationType:](NGMTimeBasedEvaluations, "validateFetchedPrekeyTimestamp:forEvaluationType:", 2))
    {
      return 1;
    }
    [(NGMECDHPublicPreKey *)self timestamp];
    v11 = @"The ephemeral prekey has expired.";
    if (v13 >= 1554681600.0) {
      uint64_t v12 = 102;
    }
    else {
      uint64_t v12 = 103;
    }
  }
  else
  {
    v11 = @"The prekey was incorrectly signed, rejecting.";
    uint64_t v12 = 101;
  }
  MPLogAndAssignError(v12, a4, v11);
  return 0;
}

- (id)description
{
  v3 = NSString;
  v4 = [(NGMECDHPublicPreKey *)self dhKey];
  v5 = [v4 description];
  [(NGMECDHPublicPreKey *)self timestamp];
  uint64_t v7 = v6;
  id v8 = [(NGMECDHPublicPreKey *)self signature];
  char v9 = [v3 stringWithFormat:@"NGMPublicPreKey with DHKey: %@\n Timestamp:%f \n Signature: %@.", v5, v7, v8];

  return v9;
}

- (DHPublicKey)dhKey
{
  return self->_dhKey;
}

- (NSData)signature
{
  return self->_signature;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_dhKey, 0);
}

@end
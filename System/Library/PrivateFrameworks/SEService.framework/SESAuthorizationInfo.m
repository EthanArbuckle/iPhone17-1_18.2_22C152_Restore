@interface SESAuthorizationInfo
+ (BOOL)supportsSecureCoding;
+ (id)withState:(unsigned __int8)a3 remaningCount:(id)a4 remainingTime:(id)a5 publicKeyIdentifier:(id)a6 authorizationID:(id)a7 anonymizedDSID:(id)a8;
- (NSData)anonymizedDSID;
- (NSData)authorizationID;
- (NSData)publicKeyIdentifier;
- (NSNumber)remainingCount;
- (NSNumber)remainingTime;
- (SESAuthorizationInfo)initWithCoder:(id)a3;
- (id)description;
- (unsigned)state;
- (void)encodeWithCoder:(id)a3;
- (void)setAnonymizedDSID:(id)a3;
- (void)setAuthorizationID:(id)a3;
- (void)setPublicKeyIdentifier:(id)a3;
- (void)setRemainingCount:(id)a3;
- (void)setRemainingTime:(id)a3;
- (void)setState:(unsigned __int8)a3;
@end

@implementation SESAuthorizationInfo

+ (id)withState:(unsigned __int8)a3 remaningCount:(id)a4 remainingTime:(id)a5 publicKeyIdentifier:(id)a6 authorizationID:(id)a7 anonymizedDSID:(id)a8
{
  uint64_t v12 = a3;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = objc_opt_new();
  [v18 setState:v12];
  [v18 setRemainingCount:v17];

  [v18 setRemainingTime:v16];
  [v18 setPublicKeyIdentifier:v15];

  [v18 setAuthorizationID:v14];
  [v18 setAnonymizedDSID:v13];

  return v18;
}

- (id)description
{
  v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"{\n\tstate : %d,\n", -[SESAuthorizationInfo state](self, "state"));
  v4 = [(SESAuthorizationInfo *)self remainingCount];
  [v3 appendFormat:@"\tcount : %@,\n", v4];

  v5 = [(SESAuthorizationInfo *)self remainingTime];
  [v3 appendFormat:@"\ttime : %@,\n", v5];

  v6 = [(SESAuthorizationInfo *)self publicKeyIdentifier];
  [v3 appendFormat:@"\tpkIdentifier : %@,\n", v6];

  v7 = [(SESAuthorizationInfo *)self authorizationID];
  [v3 appendFormat:@"\tauthorizationID : %@,\n", v7];

  v8 = [(SESAuthorizationInfo *)self anonymizedDSID];
  [v3 appendFormat:@"\tanonymizedDSID : %@,\n", v8];

  [v3 appendFormat:@"}"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SESAuthorizationInfo state](self, "state"), @"state");
  v5 = [(SESAuthorizationInfo *)self remainingCount];
  [v4 encodeObject:v5 forKey:@"remainingCount"];

  v6 = [(SESAuthorizationInfo *)self remainingTime];
  [v4 encodeObject:v6 forKey:@"remainingTime"];

  v7 = [(SESAuthorizationInfo *)self publicKeyIdentifier];
  [v4 encodeObject:v7 forKey:@"publicKeyIdentifier"];

  v8 = [(SESAuthorizationInfo *)self authorizationID];
  [v4 encodeObject:v8 forKey:@"authorizationID"];

  id v9 = [(SESAuthorizationInfo *)self anonymizedDSID];
  [v4 encodeObject:v9 forKey:@"anonymizedDSID"];
}

- (SESAuthorizationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SESAuthorizationInfo;
  v5 = [(SESAuthorizationInfo *)&v22 init];
  if (v5)
  {
    v5->_state = [v4 decodeIntForKey:@"state"];
    v6 = [(SESAuthorizationInfo *)v5 remainingCount];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remainingCount"];
    remainingCount = v5->_remainingCount;
    v5->_remainingCount = (NSNumber *)v7;

    id v9 = [(SESAuthorizationInfo *)v5 remainingTime];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remainingTime"];
    remainingTime = v5->_remainingTime;
    v5->_remainingTime = (NSNumber *)v10;

    uint64_t v12 = [(SESAuthorizationInfo *)v5 publicKeyIdentifier];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyIdentifier"];
    publicKeyIdentifier = v5->_publicKeyIdentifier;
    v5->_publicKeyIdentifier = (NSData *)v13;

    id v15 = [(SESAuthorizationInfo *)v5 authorizationID];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationID"];
    authorizationID = v5->_authorizationID;
    v5->_authorizationID = (NSData *)v16;

    v18 = [(SESAuthorizationInfo *)v5 anonymizedDSID];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anonymizedDSID"];
    anonymizedDSID = v5->_anonymizedDSID;
    v5->_anonymizedDSID = (NSData *)v19;
  }
  return v5;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (NSNumber)remainingCount
{
  return self->_remainingCount;
}

- (void)setRemainingCount:(id)a3
{
}

- (NSNumber)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(id)a3
{
}

- (NSData)publicKeyIdentifier
{
  return self->_publicKeyIdentifier;
}

- (void)setPublicKeyIdentifier:(id)a3
{
}

- (NSData)authorizationID
{
  return self->_authorizationID;
}

- (void)setAuthorizationID:(id)a3
{
}

- (NSData)anonymizedDSID
{
  return self->_anonymizedDSID;
}

- (void)setAnonymizedDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymizedDSID, 0);
  objc_storeStrong((id *)&self->_authorizationID, 0);
  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_remainingTime, 0);
  objc_storeStrong((id *)&self->_remainingCount, 0);
}

@end
@interface ICDelegationPlayInfoTokenRequest
- (ICDelegationPlayInfoTokenRequest)initWithDSID:(id)a3 SICData:(id)a4;
- (NSData)SICData;
- (NSData)cloudCredentialsTokenData;
- (NSMutableDictionary)propertyListRepresentation;
- (NSNumber)DSID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCloudCredentialsTokenData:(id)a3;
- (void)setDSID:(id)a3;
- (void)setSICData:(id)a3;
@end

@implementation ICDelegationPlayInfoTokenRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SICData, 0);
  objc_storeStrong((id *)&self->_cloudCredentialsTokenData, 0);

  objc_storeStrong((id *)&self->_DSID, 0);
}

- (void)setSICData:(id)a3
{
}

- (NSData)SICData
{
  return self->_SICData;
}

- (void)setCloudCredentialsTokenData:(id)a3
{
}

- (NSData)cloudCredentialsTokenData
{
  return self->_cloudCredentialsTokenData;
}

- (void)setDSID:(id)a3
{
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSData *)self->_cloudCredentialsTokenData copyWithZone:a3];
    v7 = (void *)v5[2];
    v5[2] = v6;

    uint64_t v8 = [(NSNumber *)self->_DSID copyWithZone:a3];
    v9 = (void *)v5[1];
    v5[1] = v8;

    uint64_t v10 = [(NSData *)self->_SICData copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;
  }
  return v5;
}

- (NSMutableDictionary)propertyListRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  cloudCredentialsTokenData = self->_cloudCredentialsTokenData;
  if (cloudCredentialsTokenData) {
    [v3 setObject:cloudCredentialsTokenData forKey:@"wha-token"];
  }
  DSID = self->_DSID;
  if (DSID) {
    [v4 setObject:DSID forKey:@"dsid"];
  }
  SICData = self->_SICData;
  if (SICData) {
    [v4 setObject:SICData forKey:@"sic"];
  }

  return (NSMutableDictionary *)v4;
}

- (ICDelegationPlayInfoTokenRequest)initWithDSID:(id)a3 SICData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICDelegationPlayInfoTokenRequest;
  uint64_t v8 = [(ICDelegationPlayInfoTokenRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    DSID = v8->_DSID;
    v8->_DSID = (NSNumber *)v9;

    uint64_t v11 = [v7 copy];
    SICData = v8->_SICData;
    v8->_SICData = (NSData *)v11;
  }
  return v8;
}

@end
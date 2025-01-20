@interface SFAuthenticateAccountInfo
- (NSString)altDSID;
- (SFAuthenticateAccountInfo)initWithType:(unsigned int)a3 altDSID:(id)a4;
- (id)description;
- (unsigned)type;
@end

@implementation SFAuthenticateAccountInfo

- (SFAuthenticateAccountInfo)initWithType:(unsigned int)a3 altDSID:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SFAuthenticateAccountInfo;
  v8 = [(SFAuthenticateAccountInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_altDSID, a4);
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@: {type: %d, altDSID=%@}", v5, self->_type, self->_altDSID];

  return v6;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void).cxx_destruct
{
}

@end
@interface _SSKDisplayMonitorIdentityRecord
- (BOOL)didConnectAtInit;
- (FBSDisplayIdentity)displayIdentity;
- (_SSKDisplayMonitorIdentityRecord)initWithIdentity:(id)a3 connectedAtInit:(BOOL)a4;
- (id)description;
@end

@implementation _SSKDisplayMonitorIdentityRecord

- (_SSKDisplayMonitorIdentityRecord)initWithIdentity:(id)a3 connectedAtInit:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SSKDisplayMonitorIdentityRecord;
  v8 = [(_SSKDisplayMonitorIdentityRecord *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_displayIdentity, a3);
    v9->_connectedAtInit = a4;
  }

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_displayIdentity withName:0];
  id v5 = (id)[v3 appendBool:self->_connectedAtInit withName:@"connectedAtInit"];
  v6 = [v3 build];

  return v6;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (BOOL)didConnectAtInit
{
  return self->_connectedAtInit;
}

- (void).cxx_destruct
{
}

@end
@interface SBContinuitySessionLaunchEvent
- (NSData)payload;
- (NSString)type;
- (NSUUID)identifier;
- (SBContinuitySessionLaunchEvent)initWithType:(id)a3 payload:(id)a4;
- (id)description;
@end

@implementation SBContinuitySessionLaunchEvent

- (SBContinuitySessionLaunchEvent)initWithType:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBContinuitySessionLaunchEvent;
  v8 = [(SBContinuitySessionLaunchEvent *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    type = v8->_type;
    v8->_type = (NSString *)v9;

    objc_storeStrong((id *)&v8->_payload, a4);
    uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_type withName:@"type"];
  id v4 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
  v5 = [v3 build];

  return v5;
}

- (NSString)type
{
  return self->_type;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
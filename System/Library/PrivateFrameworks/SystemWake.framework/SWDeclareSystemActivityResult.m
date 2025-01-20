@interface SWDeclareSystemActivityResult
- (SWDeclareSystemActivityResult)initWithReturnValue:(int)a3 assertionID:(unsigned int)a4 systemState:(int)a5;
- (id)description;
- (int)returnValue;
- (int)systemState;
- (unsigned)assertionID;
@end

@implementation SWDeclareSystemActivityResult

- (SWDeclareSystemActivityResult)initWithReturnValue:(int)a3 assertionID:(unsigned int)a4 systemState:(int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SWDeclareSystemActivityResult;
  result = [(SWDeclareSystemActivityResult *)&v9 init];
  if (result)
  {
    result->_returnValue = a3;
    result->_assertionID = a4;
    result->_systemState = a5;
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendInt:self->_returnValue withName:@"returnValue"];
  id v5 = (id)[v3 appendInt:self->_assertionID withName:@"assertionID"];
  id v6 = (id)[v3 appendInt:self->_systemState withName:@"systemState"];
  v7 = [v3 build];

  return v7;
}

- (int)returnValue
{
  return self->_returnValue;
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (int)systemState
{
  return self->_systemState;
}

@end
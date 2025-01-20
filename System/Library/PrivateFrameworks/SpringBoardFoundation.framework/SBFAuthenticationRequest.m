@interface SBFAuthenticationRequest
- (BOOL)skipSEKeepUserDataOperation;
- (BOOL)verifyOnly;
- (NSString)passcode;
- (id)_initWithType:(unint64_t)a3 source:(int64_t)a4 passcode:(id)a5 skipSEKeepUserDataOperation:(BOOL)a6 verifyOnly:(BOOL)a7 handler:(id)a8;
- (id)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)handler;
- (id)initForBiometricAuthenticationWithSource:(int64_t)a3;
- (id)initForBiometricAuthenticationWithSource:(int64_t)a3 handler:(id)a4;
- (id)initForPasscode:(id)a3 source:(int64_t)a4;
- (id)initForPasscode:(id)a3 source:(int64_t)a4 handler:(id)a5;
- (id)initForPasscode:(id)a3 source:(int64_t)a4 skipSEKeepUserDataOperation:(BOOL)a5 handler:(id)a6;
- (id)initForPasscode:(id)a3 source:(int64_t)a4 skipSEKeepUserDataOperation:(BOOL)a5 verifyOnly:(BOOL)a6 handler:(id)a7;
- (id)publicDescription;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)source;
- (unint64_t)type;
@end

@implementation SBFAuthenticationRequest

- (id)_initWithType:(unint64_t)a3 source:(int64_t)a4 passcode:(id)a5 skipSEKeepUserDataOperation:(BOOL)a6 verifyOnly:(BOOL)a7 handler:(id)a8
{
  id v14 = a5;
  id v15 = a8;
  v23.receiver = self;
  v23.super_class = (Class)SBFAuthenticationRequest;
  v16 = [(SBFAuthenticationRequest *)&v23 init];
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    v16->_source = a4;
    uint64_t v18 = [v14 copy];
    passcode = v17->_passcode;
    v17->_passcode = (NSString *)v18;

    uint64_t v20 = [v15 copy];
    id handler = v17->_handler;
    v17->_id handler = (id)v20;

    v17->_skipSEKeepUserDataOperation = a6;
    v17->_verifyOnly = a7;
  }

  return v17;
}

- (id)initForPasscode:(id)a3 source:(int64_t)a4 skipSEKeepUserDataOperation:(BOOL)a5 verifyOnly:(BOOL)a6 handler:(id)a7
{
  return [(SBFAuthenticationRequest *)self _initWithType:1 source:a4 passcode:a3 skipSEKeepUserDataOperation:a5 verifyOnly:a6 handler:a7];
}

- (id)initForPasscode:(id)a3 source:(int64_t)a4 skipSEKeepUserDataOperation:(BOOL)a5 handler:(id)a6
{
  return [(SBFAuthenticationRequest *)self _initWithType:1 source:a4 passcode:a3 skipSEKeepUserDataOperation:a5 verifyOnly:0 handler:a6];
}

- (id)initForPasscode:(id)a3 source:(int64_t)a4 handler:(id)a5
{
  return [(SBFAuthenticationRequest *)self initForPasscode:a3 source:a4 skipSEKeepUserDataOperation:0 handler:a5];
}

- (id)initForPasscode:(id)a3 source:(int64_t)a4
{
  return [(SBFAuthenticationRequest *)self initForPasscode:a3 source:a4 handler:0];
}

- (id)initForBiometricAuthenticationWithSource:(int64_t)a3 handler:(id)a4
{
  return [(SBFAuthenticationRequest *)self _initWithType:2 source:a3 passcode:0 skipSEKeepUserDataOperation:0 verifyOnly:0 handler:a4];
}

- (id)initForBiometricAuthenticationWithSource:(int64_t)a3
{
  return [(SBFAuthenticationRequest *)self initForBiometricAuthenticationWithSource:a3 handler:0];
}

- (id)publicDescription
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendInteger:self->_type withName:@"type"];
  id v5 = (id)[v3 appendInteger:self->_source withName:@"source"];
  v6 = (void *)MEMORY[0x1E4F4F718];
  v7 = (void *)MEMORY[0x18C133210](self->_handler);
  v8 = [v6 builderWithObject:v7];
  v9 = [v8 build];
  [v3 appendString:v9 withName:@"handler"];

  id v10 = (id)[v3 appendBool:self->_passcode != 0 withName:@"hasPasscode"];
  v11 = [v3 build];

  return v11;
}

- (id)description
{
  return [(SBFAuthenticationRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFAuthenticationRequest *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendInteger:self->_type withName:@"type"];
  id v5 = (id)[v3 appendInteger:self->_source withName:@"source"];
  v6 = (void *)MEMORY[0x18C133210](self->_handler);
  id v7 = (id)[v3 appendObject:v6 withName:@"handler"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBFAuthenticationRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)source
{
  return self->_source;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (id)handler
{
  return self->_handler;
}

- (BOOL)skipSEKeepUserDataOperation
{
  return self->_skipSEKeepUserDataOperation;
}

- (BOOL)verifyOnly
{
  return self->_verifyOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
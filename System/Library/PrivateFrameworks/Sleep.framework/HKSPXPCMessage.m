@interface HKSPXPCMessage
- (HKSPXPCMessage)initWithIdentifier:(id)a3 block:(id)a4 options:(unint64_t)a5 errorHandler:(id)a6;
- (NSString)description;
- (NSString)identifier;
- (id)block;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)errorHandler;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)options;
@end

@implementation HKSPXPCMessage

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (unint64_t)options
{
  return self->_options;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (id)block
{
  return self->_block;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (HKSPXPCMessage)initWithIdentifier:(id)a3 block:(id)a4 options:(unint64_t)a5 errorHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HKSPXPCMessage;
  v13 = [(HKSPXPCMessage *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    id block = v13->_block;
    v13->_id block = (id)v16;

    v13->_options = a5;
    uint64_t v18 = [v12 copy];
    id errorHandler = v13->_errorHandler;
    v13->_id errorHandler = (id)v18;

    v20 = v13;
  }

  return v13;
}

- (NSString)description
{
  return (NSString *)[(HKSPXPCMessage *)self descriptionWithMultilinePrefix:&stru_1EFE54160];
}

- (id)succinctDescription
{
  v2 = [(HKSPXPCMessage *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HKSPXPCMessage *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v5 = [(HKSPXPCMessage *)self identifier];
  id v6 = (id)[v4 appendObject:v5 withName:@"identifier"];

  id v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[HKSPXPCMessage options](self, "options") & 1, @"sync");
  id v8 = (id)objc_msgSend(v4, "appendBool:withName:", (-[HKSPXPCMessage options](self, "options") >> 1) & 1, @"retry");
  return v4;
}

@end
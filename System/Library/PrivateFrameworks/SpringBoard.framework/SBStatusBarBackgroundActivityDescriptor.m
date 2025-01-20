@interface SBStatusBarBackgroundActivityDescriptor
- (BOOL)isEqual:(id)a3;
- (NSString)backgroundActivityIdentifier;
- (SBStatusBarBackgroundActivityDescriptor)initWithBackgroundActivityIdentifier:(id)a3 pid:(int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)pid;
- (unint64_t)hash;
@end

@implementation SBStatusBarBackgroundActivityDescriptor

- (SBStatusBarBackgroundActivityDescriptor)initWithBackgroundActivityIdentifier:(id)a3 pid:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBStatusBarBackgroundActivityDescriptor;
  v8 = [(SBStatusBarBackgroundActivityDescriptor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_backgroundActivityIdentifier, a3);
    v9->_pid = a4;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_backgroundActivityIdentifier];
  id v5 = (id)[v3 appendInt64:self->_pid];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBStatusBarBackgroundActivityDescriptor *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int pid = self->_pid;
      if (pid == [(SBStatusBarBackgroundActivityDescriptor *)v5 pid])
      {
        backgroundActivityIdentifier = self->_backgroundActivityIdentifier;
        v8 = [(SBStatusBarBackgroundActivityDescriptor *)v5 backgroundActivityIdentifier];
        char v9 = [(NSString *)backgroundActivityIdentifier isEqualToString:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  backgroundActivityIdentifier = self->_backgroundActivityIdentifier;
  uint64_t pid = self->_pid;
  return (id)[v4 initWithBackgroundActivityIdentifier:backgroundActivityIdentifier pid:pid];
}

- (id)description
{
  return [(SBStatusBarBackgroundActivityDescriptor *)self descriptionWithMultilinePrefix:&stru_1F3084718];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBStatusBarBackgroundActivityDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBStatusBarBackgroundActivityDescriptor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = STBackgroundActivityIdentifierDescription();
  [v3 appendString:v4 withName:@"activity"];

  id v5 = (id)[v3 appendInt64:self->_pid withName:@"pid"];
  return v3;
}

- (NSString)backgroundActivityIdentifier
{
  return self->_backgroundActivityIdentifier;
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
}

@end
@interface SVXClientInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)processName;
- (SVXClientInfo)initWithCoder:(id)a3;
- (SVXClientInfo)initWithProcessIdentifier:(int)a3 processName:(id)a4;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int)processIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXClientInfo

- (void).cxx_destruct
{
}

- (NSString)processName
{
  return self->_processName;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  uint64_t processIdentifier = self->_processIdentifier;
  id v7 = a3;
  v6 = [v4 numberWithInt:processIdentifier];
  [v7 encodeObject:v6 forKey:@"SVXClientInfo::processIdentifier"];

  [v7 encodeObject:self->_processName forKey:@"SVXClientInfo::processName"];
}

- (SVXClientInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXClientInfo::processIdentifier"];
  uint64_t v6 = [v5 intValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXClientInfo::processName"];

  v8 = [(SVXClientInfo *)self initWithProcessIdentifier:v6 processName:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXClientInfo *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int processIdentifier = self->_processIdentifier;
      if (processIdentifier == [(SVXClientInfo *)v5 processIdentifier])
      {
        id v7 = [(SVXClientInfo *)v5 processName];
        processName = self->_processName;
        BOOL v9 = processName == v7 || [(NSString *)processName isEqual:v7];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInt:self->_processIdentifier];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_processName hash] ^ v4;

  return v5;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SVXClientInfo;
  NSUInteger v5 = [(SVXClientInfo *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {int processIdentifier = %d, processName = %@}", v5, self->_processIdentifier, self->_processName];

  return v6;
}

- (id)description
{
  return [(SVXClientInfo *)self _descriptionWithIndent:0];
}

- (SVXClientInfo)initWithProcessIdentifier:(int)a3 processName:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXClientInfo;
  id v7 = [(SVXClientInfo *)&v12 init];
  objc_super v8 = v7;
  if (v7)
  {
    v7->_int processIdentifier = a3;
    uint64_t v9 = [v6 copy];
    processName = v8->_processName;
    v8->_processName = (NSString *)v9;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXClientInfoMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_SVXClientInfoMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    id v6 = [(_SVXClientInfoMutation *)v5 generate];
  }
  else
  {
    id v6 = (void *)[(SVXClientInfo *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, _SVXClientInfoMutation *))a3;
  id v4 = objc_alloc_init(_SVXClientInfoMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  NSUInteger v5 = [(_SVXClientInfoMutation *)v4 generate];

  return v5;
}

@end
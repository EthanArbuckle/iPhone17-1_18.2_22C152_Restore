@interface PDSRegistration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRegistration:(id)a3;
- (NSString)qualifierString;
- (NSString)topicString;
- (PDSRegistration)initWithCoder:(id)a3;
- (PDSRegistration)initWithTopic:(id)a3 pushEnvironment:(char)a4;
- (PDSRegistration)initWithTopic:(id)a3 qualifier:(id)a4 pushEnvironment:(char)a5;
- (char)pushEnvironment;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDSRegistration

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PDSRegistration *)self topicString];
  v6 = [(PDSRegistration *)self qualifierString];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; topic = %@; qual = \"%@\"; env = %d>",
    v4,
    self,
    v5,
    v6,
  v7 = [(PDSRegistration *)self pushEnvironment]);

  return v7;
}

- (NSString)topicString
{
  return self->_topicString;
}

- (NSString)qualifierString
{
  return self->_qualifierString;
}

- (char)pushEnvironment
{
  return self->_pushEnvironment;
}

- (PDSRegistration)initWithTopic:(id)a3 qualifier:(id)a4 pushEnvironment:(char)a5
{
  unsigned int v5 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PDSRegistration.m", 20, @"Invalid parameter not satisfying: %@", @"topic" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PDSRegistration.m", 21, @"Invalid parameter not satisfying: %@", @"qualifier" object file lineNumber description];

LABEL_3:
  if (v5 >= 2)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PDSRegistration.m", 22, @"Invalid parameter not satisfying: %@", @"pushEnvironment == PDSPushEnvironmentSandbox || pushEnvironment == PDSPushEnvironmentProduction" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)PDSRegistration;
  v13 = [(PDSRegistration *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_topicString, a3);
    objc_storeStrong((id *)&v14->_qualifierString, a4);
    v14->_pushEnvironment = v5;
  }

  return v14;
}

- (PDSRegistration)initWithTopic:(id)a3 pushEnvironment:(char)a4
{
  return [(PDSRegistration *)self initWithTopic:a3 qualifier:&stru_26CFD8658 pushEnvironment:a4];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PDSRegistration *)self isEqualToRegistration:v4];

  return v5;
}

- (unint64_t)hash
{
  v3 = [(PDSRegistration *)self topicString];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(PDSRegistration *)self qualifierString];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(PDSRegistration *)self pushEnvironment];

  return v7;
}

- (BOOL)isEqualToRegistration:(id)a3
{
  uint64_t v4 = (PDSRegistration *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    BOOL v5 = [(PDSRegistration *)self qualifierString];
    uint64_t v6 = [(PDSRegistration *)v4 qualifierString];
    if ([v5 isEqualToString:v6])
    {
      unint64_t v7 = [(PDSRegistration *)self topicString];
      v8 = [(PDSRegistration *)v4 topicString];
      if ([v7 isEqualToString:v8])
      {
        int v9 = [(PDSRegistration *)self pushEnvironment];
        BOOL v10 = v9 == [(PDSRegistration *)v4 pushEnvironment];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(PDSRegistration *)self topicString];
  [v6 encodeObject:v4 forKey:@"topic"];

  BOOL v5 = [(PDSRegistration *)self qualifierString];
  [v6 encodeObject:v5 forKey:@"qualifier"];

  objc_msgSend(v6, "encodeInt32:forKey:", -[PDSRegistration pushEnvironment](self, "pushEnvironment"), @"env");
}

- (PDSRegistration)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"qualifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topic"];
  char v7 = [v4 decodeInt32ForKey:@"env"];

  v8 = [(PDSRegistration *)self initWithTopic:v6 qualifier:v5 pushEnvironment:v7];
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualifierString, 0);
  objc_storeStrong((id *)&self->_topicString, 0);
}

@end
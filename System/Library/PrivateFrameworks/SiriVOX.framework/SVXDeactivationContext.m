@interface SVXDeactivationContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)userInfo;
- (SVXButtonEvent)buttonEvent;
- (SVXClientInfo)clientInfo;
- (SVXDeactivationContext)initWithCoder:(id)a3;
- (SVXDeactivationContext)initWithSource:(int64_t)a3 timestamp:(unint64_t)a4 buttonEvent:(id)a5 clientInfo:(id)a6 userInfo:(id)a7 options:(id)a8;
- (SVXDeactivationOptions)options;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)source;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXDeactivationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);

  objc_storeStrong((id *)&self->_buttonEvent, 0);
}

- (SVXDeactivationOptions)options
{
  return self->_options;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (SVXClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (SVXButtonEvent)buttonEvent
{
  return self->_buttonEvent;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)source
{
  return self->_source;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t source = self->_source;
  id v8 = a3;
  v6 = [v4 numberWithInteger:source];
  [v8 encodeObject:v6 forKey:@"SVXDeactivationContext::source"];

  v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  [v8 encodeObject:v7 forKey:@"SVXDeactivationContext::timestamp"];

  [v8 encodeObject:self->_buttonEvent forKey:@"SVXDeactivationContext::buttonEvent"];
  [v8 encodeObject:self->_clientInfo forKey:@"SVXDeactivationContext::clientInfo"];
  [v8 encodeObject:self->_userInfo forKey:@"SVXDeactivationContext::userInfo"];
  [v8 encodeObject:self->_options forKey:@"SVXDeactivationContext::options"];
}

- (SVXDeactivationContext)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeactivationContext::source"];
  uint64_t v25 = [v4 integerValue];

  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeactivationContext::timestamp"];
  uint64_t v24 = [v5 unsignedLongLongValue];

  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeactivationContext::buttonEvent"];
  uint64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeactivationContext::clientInfo"];
  v21 = (void *)MEMORY[0x263EFFA08];
  v22 = (void *)v6;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v21, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
  v17 = [v3 decodeObjectOfClasses:v16 forKey:@"SVXDeactivationContext::userInfo"];

  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeactivationContext::options"];

  v19 = [(SVXDeactivationContext *)self initWithSource:v25 timestamp:v24 buttonEvent:v23 clientInfo:v22 userInfo:v17 options:v18];
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SVXDeactivationContext *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t source = self->_source;
      if (source == [(SVXDeactivationContext *)v5 source]
        && (unint64_t timestamp = self->_timestamp, timestamp == [(SVXDeactivationContext *)v5 timestamp]))
      {
        uint64_t v8 = [(SVXDeactivationContext *)v5 buttonEvent];
        buttonEvent = self->_buttonEvent;
        if (buttonEvent == v8 || [(SVXButtonEvent *)buttonEvent isEqual:v8])
        {
          uint64_t v10 = [(SVXDeactivationContext *)v5 clientInfo];
          clientInfo = self->_clientInfo;
          if (clientInfo == v10 || [(SVXClientInfo *)clientInfo isEqual:v10])
          {
            uint64_t v12 = [(SVXDeactivationContext *)v5 userInfo];
            userInfo = self->_userInfo;
            if (userInfo == v12 || [(NSDictionary *)userInfo isEqual:v12])
            {
              uint64_t v14 = [(SVXDeactivationContext *)v5 options];
              options = self->_options;
              BOOL v16 = options == v14 || [(SVXDeactivationOptions *)options isEqual:v14];
            }
            else
            {
              BOOL v16 = 0;
            }
          }
          else
          {
            BOOL v16 = 0;
          }
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  id v3 = [NSNumber numberWithInteger:self->_source];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(SVXButtonEvent *)self->_buttonEvent hash];
  unint64_t v8 = v7 ^ [(SVXClientInfo *)self->_clientInfo hash];
  uint64_t v9 = v8 ^ [(NSDictionary *)self->_userInfo hash];
  unint64_t v10 = v6 ^ v9 ^ [(SVXDeactivationOptions *)self->_options hash];

  return v10;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)SVXDeactivationContext;
  v5 = [(SVXDeactivationContext *)&v11 description];
  unint64_t source = self->_source;
  if (source > 5) {
    unint64_t v7 = @"(unknown)";
  }
  else {
    unint64_t v7 = off_264552090[source];
  }
  unint64_t v8 = v7;
  v9 = (void *)[v4 initWithFormat:@"%@ {unint64_t source = %@, timestamp = %llu, buttonEvent = %@, clientInfo = %@, userInfo = %@, options = %@}", v5, v8, self->_timestamp, self->_buttonEvent, self->_clientInfo, self->_userInfo, self->_options];

  return v9;
}

- (id)description
{
  return [(SVXDeactivationContext *)self _descriptionWithIndent:0];
}

- (SVXDeactivationContext)initWithSource:(int64_t)a3 timestamp:(unint64_t)a4 buttonEvent:(id)a5 clientInfo:(id)a6 userInfo:(id)a7 options:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)SVXDeactivationContext;
  v18 = [(SVXDeactivationContext *)&v29 init];
  v19 = v18;
  if (v18)
  {
    v18->_unint64_t source = a3;
    v18->_unint64_t timestamp = a4;
    uint64_t v20 = [v14 copy];
    buttonEvent = v19->_buttonEvent;
    v19->_buttonEvent = (SVXButtonEvent *)v20;

    uint64_t v22 = [v15 copy];
    clientInfo = v19->_clientInfo;
    v19->_clientInfo = (SVXClientInfo *)v22;

    uint64_t v24 = [v16 copy];
    userInfo = v19->_userInfo;
    v19->_userInfo = (NSDictionary *)v24;

    uint64_t v26 = [v17 copy];
    options = v19->_options;
    v19->_options = (SVXDeactivationOptions *)v26;
  }
  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXDeactivationContextMutation *))a3;
  if (v4)
  {
    v5 = [[_SVXDeactivationContextMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    uint64_t v6 = [(_SVXDeactivationContextMutation *)v5 generate];
  }
  else
  {
    uint64_t v6 = (void *)[(SVXDeactivationContext *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = (void (**)(id, _SVXDeactivationContextMutation *))a3;
  id v4 = objc_alloc_init(_SVXDeactivationContextMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  v5 = [(_SVXDeactivationContextMutation *)v4 generate];

  return v5;
}

@end
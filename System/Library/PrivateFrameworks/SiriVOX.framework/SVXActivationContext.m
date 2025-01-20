@interface SVXActivationContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFRequestInfo)requestInfo;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)userInfo;
- (SVXActivationContext)initWithCoder:(id)a3;
- (SVXActivationContext)initWithSource:(int64_t)a3 timestamp:(unint64_t)a4 buttonEvent:(id)a5 systemEvent:(id)a6 clientInfo:(id)a7 requestInfo:(id)a8 userInfo:(id)a9;
- (SVXButtonEvent)buttonEvent;
- (SVXClientInfo)clientInfo;
- (SVXSystemEvent)systemEvent;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)source;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXActivationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_systemEvent, 0);

  objc_storeStrong((id *)&self->_buttonEvent, 0);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (AFRequestInfo)requestInfo
{
  return self->_requestInfo;
}

- (SVXClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (SVXSystemEvent)systemEvent
{
  return self->_systemEvent;
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
  [v8 encodeObject:v6 forKey:@"SVXActivationContext::source"];

  v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  [v8 encodeObject:v7 forKey:@"SVXActivationContext::timestamp"];

  [v8 encodeObject:self->_buttonEvent forKey:@"SVXActivationContext::buttonEvent"];
  [v8 encodeObject:self->_systemEvent forKey:@"SVXActivationContext::systemEvent"];
  [v8 encodeObject:self->_clientInfo forKey:@"SVXActivationContext::clientInfo"];
  [v8 encodeObject:self->_requestInfo forKey:@"SVXActivationContext::requestInfo"];
  [v8 encodeObject:self->_userInfo forKey:@"SVXActivationContext::userInfo"];
}

- (SVXActivationContext)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXActivationContext::source"];
  uint64_t v25 = [v4 integerValue];

  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXActivationContext::timestamp"];
  uint64_t v24 = [v5 unsignedLongLongValue];

  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXActivationContext::buttonEvent"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXActivationContext::systemEvent"];
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXActivationContext::clientInfo"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXActivationContext::requestInfo"];
  v20 = (void *)MEMORY[0x263EFFA08];
  uint64_t v19 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v20, "setWithObjects:", v19, v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  v16 = [v3 decodeObjectOfClasses:v15 forKey:@"SVXActivationContext::userInfo"];

  v17 = [(SVXActivationContext *)self initWithSource:v25 timestamp:v24 buttonEvent:v23 systemEvent:v22 clientInfo:v21 requestInfo:v6 userInfo:v16];
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SVXActivationContext *)a3;
  if (self == v4)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t source = self->_source;
      if (source == [(SVXActivationContext *)v5 source]
        && (unint64_t timestamp = self->_timestamp, timestamp == [(SVXActivationContext *)v5 timestamp]))
      {
        uint64_t v8 = [(SVXActivationContext *)v5 buttonEvent];
        buttonEvent = self->_buttonEvent;
        if (buttonEvent == v8 || [(SVXButtonEvent *)buttonEvent isEqual:v8])
        {
          uint64_t v10 = [(SVXActivationContext *)v5 systemEvent];
          systemEvent = self->_systemEvent;
          if (systemEvent == v10 || [(SVXSystemEvent *)systemEvent isEqual:v10])
          {
            uint64_t v12 = [(SVXActivationContext *)v5 clientInfo];
            clientInfo = self->_clientInfo;
            if (clientInfo == v12 || [(SVXClientInfo *)clientInfo isEqual:v12])
            {
              uint64_t v14 = [(SVXActivationContext *)v5 requestInfo];
              requestInfo = self->_requestInfo;
              if (requestInfo == v14 || [(AFRequestInfo *)requestInfo isEqual:v14])
              {
                v16 = [(SVXActivationContext *)v5 userInfo];
                userInfo = self->_userInfo;
                BOOL v18 = userInfo == v16 || [(NSDictionary *)userInfo isEqual:v16];
              }
              else
              {
                BOOL v18 = 0;
              }
            }
            else
            {
              BOOL v18 = 0;
            }
          }
          else
          {
            BOOL v18 = 0;
          }
        }
        else
        {
          BOOL v18 = 0;
        }
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  id v3 = [NSNumber numberWithInteger:self->_source];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(SVXButtonEvent *)self->_buttonEvent hash];
  unint64_t v8 = v7 ^ [(SVXSystemEvent *)self->_systemEvent hash];
  unint64_t v9 = v8 ^ [(SVXClientInfo *)self->_clientInfo hash];
  uint64_t v10 = v6 ^ v9 ^ [(AFRequestInfo *)self->_requestInfo hash];
  unint64_t v11 = v10 ^ [(NSDictionary *)self->_userInfo hash];

  return v11;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)SVXActivationContext;
  v5 = [(SVXActivationContext *)&v11 description];
  unint64_t source = self->_source;
  if (source > 9) {
    unint64_t v7 = @"(unknown)";
  }
  else {
    unint64_t v7 = off_264553510[source];
  }
  unint64_t v8 = v7;
  v9 = (void *)[v4 initWithFormat:@"%@ {unint64_t source = %@, timestamp = %llu, buttonEvent = %@, systemEvent = %@, clientInfo = %@, requestInfo = %@, userInfo = %@}", v5, v8, self->_timestamp, self->_buttonEvent, self->_systemEvent, self->_clientInfo, self->_requestInfo, self->_userInfo];

  return v9;
}

- (id)description
{
  return [(SVXActivationContext *)self _descriptionWithIndent:0];
}

- (SVXActivationContext)initWithSource:(int64_t)a3 timestamp:(unint64_t)a4 buttonEvent:(id)a5 systemEvent:(id)a6 clientInfo:(id)a7 requestInfo:(id)a8 userInfo:(id)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v33.receiver = self;
  v33.super_class = (Class)SVXActivationContext;
  v20 = [(SVXActivationContext *)&v33 init];
  v21 = v20;
  if (v20)
  {
    v20->_unint64_t source = a3;
    v20->_unint64_t timestamp = a4;
    uint64_t v22 = [v15 copy];
    buttonEvent = v21->_buttonEvent;
    v21->_buttonEvent = (SVXButtonEvent *)v22;

    uint64_t v24 = [v16 copy];
    systemEvent = v21->_systemEvent;
    v21->_systemEvent = (SVXSystemEvent *)v24;

    uint64_t v26 = [v17 copy];
    clientInfo = v21->_clientInfo;
    v21->_clientInfo = (SVXClientInfo *)v26;

    uint64_t v28 = [v18 copy];
    requestInfo = v21->_requestInfo;
    v21->_requestInfo = (AFRequestInfo *)v28;

    uint64_t v30 = [v19 copy];
    userInfo = v21->_userInfo;
    v21->_userInfo = (NSDictionary *)v30;
  }
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXActivationContextMutation *))a3;
  if (v4)
  {
    v5 = [[_SVXActivationContextMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    uint64_t v6 = [(_SVXActivationContextMutation *)v5 generate];
  }
  else
  {
    uint64_t v6 = (void *)[(SVXActivationContext *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = (void (**)(id, _SVXActivationContextMutation *))a3;
  id v4 = objc_alloc_init(_SVXActivationContextMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  v5 = [(_SVXActivationContextMutation *)v4 generate];

  return v5;
}

@end
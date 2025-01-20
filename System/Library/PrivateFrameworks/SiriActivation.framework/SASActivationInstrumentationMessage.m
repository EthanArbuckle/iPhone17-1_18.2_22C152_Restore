@interface SASActivationInstrumentationMessage
+ (BOOL)supportsSecureCoding;
- (ACTVSchemaACTVClientEvent)event;
- (BOOL)isEqual:(id)a3;
- (NSUUID)activationEventIdentifier;
- (SASActivationInstrumentationMessage)initWithCoder:(id)a3;
- (SASActivationInstrumentationMessage)initWithEvent:(id)a3 activationEventIdentifier:(id)a4 machAbsoluteTime:(unint64_t)a5;
- (id)description;
- (unint64_t)hash;
- (unint64_t)machAbsoluteTime;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SASActivationInstrumentationMessage

- (SASActivationInstrumentationMessage)initWithEvent:(id)a3 activationEventIdentifier:(id)a4 machAbsoluteTime:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SASActivationInstrumentationMessage;
  v11 = [(SASActivationInstrumentationMessage *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_event, a3);
    uint64_t v13 = [v10 copy];
    activationEventIdentifier = v12->_activationEventIdentifier;
    v12->_activationEventIdentifier = (NSUUID *)v13;

    v12->_machAbsoluteTime = a5;
  }

  return v12;
}

- (id)description
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString alloc];
  v18.receiver = self;
  v18.super_class = (Class)SASActivationInstrumentationMessage;
  v4 = [(SASActivationInstrumentationMessage *)&v18 description];
  id v5 = [NSString alloc];
  v6 = [(ACTVSchemaACTVClientEvent *)self->_event description];
  v7 = (void *)[v5 initWithFormat:@"event = %@", v6];
  v19[0] = v7;
  id v8 = [NSString alloc];
  id v9 = [(NSUUID *)self->_activationEventIdentifier description];
  id v10 = (void *)[v8 initWithFormat:@"activationEventIdentifier = %@", v9];
  v19[1] = v10;
  id v11 = [NSString alloc];
  v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_machAbsoluteTime];
  uint64_t v13 = (void *)[v11 initWithFormat:@"machAbsoluteTime = %@", v12];
  v19[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v15 = [v14 componentsJoinedByString:@", "];
  objc_super v16 = (void *)[v3 initWithFormat:@"%@ {%@}", v4, v15];

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3 = [(ACTVSchemaACTVClientEvent *)self->_event hash];
  uint64_t v4 = [(NSUUID *)self->_activationEventIdentifier hash] ^ v3;
  id v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_machAbsoluteTime];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SASActivationInstrumentationMessage *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t machAbsoluteTime = self->_machAbsoluteTime;
      if (machAbsoluteTime == [(SASActivationInstrumentationMessage *)v5 machAbsoluteTime])
      {
        v7 = [(SASActivationInstrumentationMessage *)v5 event];
        event = self->_event;
        if (event == v7 || [(ACTVSchemaACTVClientEvent *)event isEqual:v7])
        {
          id v9 = [(SASActivationInstrumentationMessage *)v5 activationEventIdentifier];
          activationEventIdentifier = self->_activationEventIdentifier;
          BOOL v11 = activationEventIdentifier == v9
             || [(NSUUID *)activationEventIdentifier isEqual:v9];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASActivationInstrumentationMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASActivationInstrumentationMessage::event"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASActivationInstrumentationMessage::activationEventIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASActivationInstrumentationMessage::machAbsoluteTime"];

  uint64_t v8 = [v7 unsignedLongLongValue];
  id v9 = [(SASActivationInstrumentationMessage *)self initWithEvent:v5 activationEventIdentifier:v6 machAbsoluteTime:v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  event = self->_event;
  id v5 = a3;
  [v5 encodeObject:event forKey:@"SASActivationInstrumentationMessage::event"];
  [v5 encodeObject:self->_activationEventIdentifier forKey:@"SASActivationInstrumentationMessage::activationEventIdentifier"];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_machAbsoluteTime];
  [v5 encodeObject:v6 forKey:@"SASActivationInstrumentationMessage::machAbsoluteTime"];
}

- (ACTVSchemaACTVClientEvent)event
{
  return self->_event;
}

- (NSUUID)activationEventIdentifier
{
  return self->_activationEventIdentifier;
}

- (unint64_t)machAbsoluteTime
{
  return self->_machAbsoluteTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationEventIdentifier, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
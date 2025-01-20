@interface SBButtonConsumerRegistration
- (BOOL)isEqual:(id)a3;
- (SBButtonConsumerClient)client;
- (id)description;
- (int64_t)buttonKind;
- (int64_t)eventPriority;
- (unint64_t)eventMask;
- (unint64_t)hash;
- (void)setButtonKind:(int64_t)a3;
- (void)setClient:(id)a3;
- (void)setEventMask:(unint64_t)a3;
- (void)setEventPriority:(int64_t)a3;
@end

@implementation SBButtonConsumerRegistration

- (unint64_t)hash
{
  v2 = [NSNumber numberWithUnsignedInteger:self->_eventMask];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)buttonKind
{
  return self->_buttonKind;
}

- (SBButtonConsumerClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (SBButtonConsumerClient *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (void)setEventPriority:(int64_t)a3
{
  self->_eventPriority = a3;
}

- (void)setEventMask:(unint64_t)a3
{
  self->_eventMask = a3;
}

- (void)setButtonKind:(int64_t)a3
{
  self->_buttonKind = a3;
}

- (unint64_t)eventMask
{
  return self->_eventMask;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  id v5 = (id)[v3 appendObject:WeakRetained withName:@"client"];

  v6 = NSStringFromSBSHardwareButtonKind();
  id v7 = (id)[v3 appendObject:v6 withName:@"buttonKind"];

  id v8 = (id)[v3 appendUInt64:self->_eventMask withName:@"eventMask"];
  id v9 = (id)[v3 appendInteger:self->_eventPriority withName:@"eventPriority"];
  v10 = [v3 build];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBButtonConsumerRegistration *)a3;
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
      id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
      id v7 = [(SBButtonConsumerRegistration *)v5 client];
      if (WeakRetained == v7
        && (int64_t buttonKind = self->_buttonKind, buttonKind == [(SBButtonConsumerRegistration *)v5 buttonKind])
        && (unint64_t eventMask = self->_eventMask, eventMask == [(SBButtonConsumerRegistration *)v5 eventMask]))
      {
        int64_t eventPriority = self->_eventPriority;
        BOOL v11 = eventPriority == [(SBButtonConsumerRegistration *)v5 eventPriority];
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

- (int64_t)eventPriority
{
  return self->_eventPriority;
}

- (void).cxx_destruct
{
}

@end
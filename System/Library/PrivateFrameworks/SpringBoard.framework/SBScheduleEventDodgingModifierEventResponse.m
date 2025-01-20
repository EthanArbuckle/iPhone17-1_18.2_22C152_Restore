@interface SBScheduleEventDodgingModifierEventResponse
- (NSString)name;
- (SBScheduleEventDodgingModifierEventResponse)initWithName:(id)a3;
- (id)description;
- (unint64_t)type;
@end

@implementation SBScheduleEventDodgingModifierEventResponse

- (SBScheduleEventDodgingModifierEventResponse)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBScheduleEventDodgingModifierEventResponse;
  v5 = [(SBChainableModifierEventResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (unint64_t)type
{
  return 2;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)SBScheduleEventDodgingModifierEventResponse;
  v3 = [(SBDodgingModifierEventResponse *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" %@", self->_name];

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end
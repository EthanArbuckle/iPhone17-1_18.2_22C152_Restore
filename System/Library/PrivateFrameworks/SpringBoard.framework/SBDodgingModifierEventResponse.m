@interface SBDodgingModifierEventResponse
+ (id)newEventResponse;
- (id)description;
- (unint64_t)type;
- (void)setType:(unint64_t)a3;
@end

@implementation SBDodgingModifierEventResponse

+ (id)newEventResponse
{
  return objc_alloc_init(SBDodgingModifierEventResponse);
}

- (unint64_t)type
{
  return 0;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SBDodgingModifierEventResponse;
  v3 = [(SBChainableModifierEventResponse *)&v8 description];
  unint64_t v4 = [(SBDodgingModifierEventResponse *)self type];
  v5 = @"Generic";
  if (v4 == 1) {
    v5 = @"Invalidation";
  }
  if (v4 == 2) {
    v5 = @"ScheduleEvent";
  }
  v6 = [v3 stringByAppendingFormat:@" %@", v5];

  return v6;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end
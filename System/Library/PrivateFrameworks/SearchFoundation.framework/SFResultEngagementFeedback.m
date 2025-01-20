@interface SFResultEngagementFeedback
+ (BOOL)supportsSecureCoding;
- (BOOL)actionEngaged;
- (BOOL)matchesUnengagedSuggestion;
- (SFResultEngagementFeedback)initWithCoder:(id)a3;
- (SFResultEngagementFeedback)initWithResult:(id)a3 actionEngaged:(BOOL)a4 triggerEvent:(unint64_t)a5 destination:(unint64_t)a6;
- (SFResultEngagementFeedback)initWithResult:(id)a3 triggerEvent:(unint64_t)a4 destination:(unint64_t)a5;
- (SFResultEngagementFeedback)initWithResult:(id)a3 triggerEvent:(unint64_t)a4 destination:(unint64_t)a5 actionTarget:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)actionTarget;
- (unint64_t)destination;
- (unint64_t)triggerEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setActionTarget:(unint64_t)a3;
- (void)setDestination:(unint64_t)a3;
- (void)setMatchesUnengagedSuggestion:(BOOL)a3;
- (void)setTriggerEvent:(unint64_t)a3;
@end

@implementation SFResultEngagementFeedback

- (void)setActionTarget:(unint64_t)a3
{
  self->_actionTarget = a3;
}

- (unint64_t)actionTarget
{
  return self->_actionTarget;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setMatchesUnengagedSuggestion:(BOOL)a3
{
  self->_matchesUnengagedSuggestion = a3;
}

- (BOOL)matchesUnengagedSuggestion
{
  return self->_matchesUnengagedSuggestion;
}

- (BOOL)actionEngaged
{
  return self->_actionEngaged;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFResultEngagementFeedback;
  id v4 = a3;
  [(SFResultFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_actionEngaged, @"action_engaged", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_triggerEvent forKey:@"trigger_event"];
  [v4 encodeInteger:self->_destination forKey:@"_destination"];
  [v4 encodeInteger:self->_actionTarget forKey:@"_actionTarget"];
  [v4 encodeBool:self->_matchesUnengagedSuggestion forKey:@"_matchesUnengagedSuggestion"];
}

- (SFResultEngagementFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFResultEngagementFeedback;
  objc_super v5 = [(SFResultFeedback *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_actionEngaged = [v4 decodeBoolForKey:@"action_engaged"];
    v5->_triggerEvent = [v4 decodeIntegerForKey:@"trigger_event"];
    v5->_destination = [v4 decodeIntegerForKey:@"_destination"];
    v5->_actionTarget = [v4 decodeIntegerForKey:@"_actionTarget"];
    v5->_matchesUnengagedSuggestion = [v4 decodeBoolForKey:@"_matchesUnengagedSuggestion"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFResultEngagementFeedback;
  id v4 = [(SFResultFeedback *)&v6 copyWithZone:a3];
  v4[5] = [(SFResultEngagementFeedback *)self triggerEvent];
  v4[6] = [(SFResultEngagementFeedback *)self destination];
  v4[7] = [(SFResultEngagementFeedback *)self actionTarget];
  *((unsigned char *)v4 + 32) = [(SFResultEngagementFeedback *)self actionEngaged];
  *((unsigned char *)v4 + 33) = [(SFResultEngagementFeedback *)self matchesUnengagedSuggestion];
  return v4;
}

- (SFResultEngagementFeedback)initWithResult:(id)a3 triggerEvent:(unint64_t)a4 destination:(unint64_t)a5 actionTarget:(unint64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)SFResultEngagementFeedback;
  result = [(SFResultFeedback *)&v10 initWithResult:a3];
  if (result)
  {
    result->_actionEngaged = 1;
    result->_triggerEvent = a4;
    result->_destination = a5;
    result->_actionTarget = a6;
  }
  return result;
}

- (SFResultEngagementFeedback)initWithResult:(id)a3 triggerEvent:(unint64_t)a4 destination:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)SFResultEngagementFeedback;
  result = [(SFResultFeedback *)&v8 initWithResult:a3];
  if (result)
  {
    result->_actionEngaged = 0;
    result->_triggerEvent = a4;
    result->_destination = a5;
    result->_actionTarget = 0;
  }
  return result;
}

- (SFResultEngagementFeedback)initWithResult:(id)a3 actionEngaged:(BOOL)a4 triggerEvent:(unint64_t)a5 destination:(unint64_t)a6
{
  return [(SFResultEngagementFeedback *)self initWithResult:a3 triggerEvent:a5 destination:a6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
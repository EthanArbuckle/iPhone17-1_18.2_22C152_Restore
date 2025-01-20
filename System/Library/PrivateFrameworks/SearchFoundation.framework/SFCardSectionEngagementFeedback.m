@interface SFCardSectionEngagementFeedback
+ (BOOL)supportsSecureCoding;
- (SFCardSectionEngagementFeedback)initWithCardSection:(id)a3 destination:(id)a4 triggerEvent:(unint64_t)a5 actionCardType:(unint64_t)a6;
- (SFCardSectionEngagementFeedback)initWithCoder:(id)a3;
- (SFPunchout)destination;
- (unint64_t)actionCardType;
- (unint64_t)actionTarget;
- (unint64_t)triggerEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setActionCardType:(unint64_t)a3;
- (void)setActionTarget:(unint64_t)a3;
- (void)setDestination:(id)a3;
- (void)setTriggerEvent:(unint64_t)a3;
@end

@implementation SFCardSectionEngagementFeedback

- (void).cxx_destruct
{
}

- (void)setActionTarget:(unint64_t)a3
{
  self->_actionTarget = a3;
}

- (unint64_t)actionTarget
{
  return self->_actionTarget;
}

- (void)setActionCardType:(unint64_t)a3
{
  self->_actionCardType = a3;
}

- (unint64_t)actionCardType
{
  return self->_actionCardType;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setDestination:(id)a3
{
}

- (SFPunchout)destination
{
  return self->_destination;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFCardSectionEngagementFeedback;
  id v4 = a3;
  [(SFCardSectionFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_triggerEvent, @"trigger_event", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_actionCardType forKey:@"action_type_card"];
  [v4 encodeObject:self->_destination forKey:@"_destination"];
}

- (SFCardSectionEngagementFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCardSectionEngagementFeedback;
  objc_super v5 = [(SFCardSectionFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_triggerEvent = [v4 decodeIntegerForKey:@"trigger_event"];
    v5->_actionCardType = [v4 decodeIntegerForKey:@"action_type_card"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_destination"];
    destination = v5->_destination;
    v5->_destination = (SFPunchout *)v6;
  }
  return v5;
}

- (SFCardSectionEngagementFeedback)initWithCardSection:(id)a3 destination:(id)a4 triggerEvent:(unint64_t)a5 actionCardType:(unint64_t)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFCardSectionEngagementFeedback;
  v12 = [(SFCardSectionFeedback *)&v15 initWithCardSection:a3];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_destination, a4);
    v13->_triggerEvent = a5;
    v13->_actionCardType = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
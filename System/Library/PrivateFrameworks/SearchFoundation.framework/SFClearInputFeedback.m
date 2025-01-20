@interface SFClearInputFeedback
+ (BOOL)supportsSecureCoding;
- (SFClearInputFeedback)initWithCoder:(id)a3;
- (SFClearInputFeedback)initWithEvent:(unint64_t)a3;
- (unint64_t)triggerEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setTriggerEvent:(unint64_t)a3;
@end

@implementation SFClearInputFeedback

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFClearInputFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_triggerEvent, @"_triggerEvent", v5.receiver, v5.super_class);
}

- (SFClearInputFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFClearInputFeedback;
  objc_super v5 = [(SFFeedback *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_triggerEvent = [v4 decodeIntegerForKey:@"_triggerEvent"];
  }

  return v5;
}

- (SFClearInputFeedback)initWithEvent:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFClearInputFeedback;
  result = [(SFFeedback *)&v5 init];
  if (result) {
    result->_triggerEvent = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
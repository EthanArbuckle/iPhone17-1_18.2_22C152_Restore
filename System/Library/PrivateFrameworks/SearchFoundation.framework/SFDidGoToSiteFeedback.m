@interface SFDidGoToSiteFeedback
+ (BOOL)supportsSecureCoding;
- (NSString)input;
- (SFDidGoToSiteFeedback)initWithCoder:(id)a3;
- (SFDidGoToSiteFeedback)initWithInput:(id)a3;
- (unint64_t)triggerEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setInput:(id)a3;
- (void)setTriggerEvent:(unint64_t)a3;
@end

@implementation SFDidGoToSiteFeedback

- (void).cxx_destruct
{
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setInput:(id)a3
{
}

- (NSString)input
{
  return self->_input;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFDidGoToSiteFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_input, @"_input", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_triggerEvent forKey:@"_triggerEvent"];
}

- (SFDidGoToSiteFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFDidGoToSiteFeedback;
  objc_super v5 = [(SFFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_input"];
    input = v5->_input;
    v5->_input = (NSString *)v6;

    v5->_triggerEvent = [v4 decodeIntegerForKey:@"_triggerEvent"];
  }

  return v5;
}

- (SFDidGoToSiteFeedback)initWithInput:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFDidGoToSiteFeedback;
  objc_super v5 = [(SFFeedback *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    input = v5->_input;
    v5->_input = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
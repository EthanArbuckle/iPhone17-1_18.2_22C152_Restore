@interface SFDidGoToSearchFeedback
+ (BOOL)supportsSecureCoding;
- (NSString)input;
- (SFDidGoToSearchFeedback)initWithCoder:(id)a3;
- (SFDidGoToSearchFeedback)initWithInput:(id)a3 endpoint:(unint64_t)a4;
- (unint64_t)endpoint;
- (unint64_t)triggerEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setEndpoint:(unint64_t)a3;
- (void)setInput:(id)a3;
- (void)setTriggerEvent:(unint64_t)a3;
@end

@implementation SFDidGoToSearchFeedback

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

- (void)setEndpoint:(unint64_t)a3
{
  self->_endpoint = a3;
}

- (unint64_t)endpoint
{
  return self->_endpoint;
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
  v5.super_class = (Class)SFDidGoToSearchFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_input, @"_input", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_endpoint forKey:@"endpoint"];
  [v4 encodeInteger:self->_triggerEvent forKey:@"_triggerEvent"];
}

- (SFDidGoToSearchFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFDidGoToSearchFeedback;
  objc_super v5 = [(SFFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_input"];
    input = v5->_input;
    v5->_input = (NSString *)v6;

    v5->_endpoint = [v4 decodeIntegerForKey:@"endpoint"];
    v5->_triggerEvent = [v4 decodeIntegerForKey:@"_triggerEvent"];
  }

  return v5;
}

- (SFDidGoToSearchFeedback)initWithInput:(id)a3 endpoint:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFDidGoToSearchFeedback;
  v7 = [(SFFeedback *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    input = v7->_input;
    v7->_input = (NSString *)v8;

    v7->_endpoint = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
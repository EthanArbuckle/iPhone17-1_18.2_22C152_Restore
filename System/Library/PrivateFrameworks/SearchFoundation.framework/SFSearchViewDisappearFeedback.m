@interface SFSearchViewDisappearFeedback
+ (BOOL)supportsSecureCoding;
- (SFSearchViewDisappearFeedback)initWithCoder:(id)a3;
- (SFSearchViewDisappearFeedback)initWithEvent:(int64_t)a3;
- (int64_t)viewDisappearEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setViewDisappearEvent:(int64_t)a3;
@end

@implementation SFSearchViewDisappearFeedback

- (void)setViewDisappearEvent:(int64_t)a3
{
  self->_viewDisappearEvent = a3;
}

- (int64_t)viewDisappearEvent
{
  return self->_viewDisappearEvent;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFSearchViewDisappearFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_viewDisappearEvent, @"viewDisappearEvent", v5.receiver, v5.super_class);
}

- (SFSearchViewDisappearFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFSearchViewDisappearFeedback;
  objc_super v5 = [(SFFeedback *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_viewDisappearEvent = [v4 decodeIntegerForKey:@"viewDisappearEvent"];
  }

  return v5;
}

- (SFSearchViewDisappearFeedback)initWithEvent:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFSearchViewDisappearFeedback;
  result = [(SFFeedback *)&v5 init];
  if (result) {
    result->_viewDisappearEvent = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
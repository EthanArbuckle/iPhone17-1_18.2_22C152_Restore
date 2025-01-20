@interface SFMapsCardSectionEngagementFeedback
+ (BOOL)supportsSecureCoding;
- (SFMapsCardSectionEngagementFeedback)initWithCoder:(id)a3;
- (SFMapsCardSectionEngagementFeedback)initWithFeedbackType:(int)a3;
- (int)feedbackType;
- (void)encodeWithCoder:(id)a3;
- (void)setFeedbackType:(int)a3;
@end

@implementation SFMapsCardSectionEngagementFeedback

- (void)setFeedbackType:(int)a3
{
  self->_feedbackType = a3;
}

- (int)feedbackType
{
  return self->_feedbackType;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFMapsCardSectionEngagementFeedback;
  id v4 = a3;
  [(SFCardSectionEngagementFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_feedbackType, @"_feedbackType", v5.receiver, v5.super_class);
}

- (SFMapsCardSectionEngagementFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFMapsCardSectionEngagementFeedback;
  objc_super v5 = [(SFCardSectionEngagementFeedback *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_feedbackType = [v4 decodeInt32ForKey:@"_feedbackType"];
  }

  return v5;
}

- (SFMapsCardSectionEngagementFeedback)initWithFeedbackType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFMapsCardSectionEngagementFeedback;
  result = [(SFCardSectionEngagementFeedback *)&v5 initWithCardSection:0 destination:0 triggerEvent:2 actionCardType:2];
  if (result) {
    result->_feedbackType = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface PDPassVerificationPromptNotification
+ (BOOL)supportsSecureCoding;
- (PDPassVerificationPromptNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5;
- (unint64_t)notificationType;
@end

@implementation PDPassVerificationPromptNotification

- (PDPassVerificationPromptNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PDPassVerificationPromptNotification;
  v5 = [(PDGenericUserNotification *)&v8 initWithTitle:a3 message:a4 forPassUniqueIdentifier:a5];
  v6 = v5;
  if (v5)
  {
    [(PDUserNotification *)v5 setReissueBannerOnUpdate:1];
    [(PDUserNotification *)v6 setSuppressionBehavior:0];
  }
  return v6;
}

- (unint64_t)notificationType
{
  return 81;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
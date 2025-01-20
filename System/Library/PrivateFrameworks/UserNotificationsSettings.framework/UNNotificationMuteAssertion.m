@interface UNNotificationMuteAssertion
+ (BOOL)supportsSecureCoding;
- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4;
- (UNNotificationMuteAssertion)initWithCoder:(id)a3;
- (id)_init;
@end

@implementation UNNotificationMuteAssertion

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)UNNotificationMuteAssertion;
  return [(UNNotificationMuteAssertion *)&v3 init];
}

- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNNotificationMuteAssertion)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UNNotificationMuteAssertion;
  return [(UNNotificationMuteAssertion *)&v4 init];
}

@end
@interface UNNotificationSourceMuteAssertion
+ (id)sourceMuteAssertionUntilDate:(id)a3;
- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4;
- (UNNotificationSourceMuteAssertion)initWithCoder:(id)a3;
- (UNNotificationSourceMuteAssertion)initWithExpirationDate:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationSourceMuteAssertion

- (UNNotificationSourceMuteAssertion)initWithExpirationDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNNotificationSourceMuteAssertion;
  v6 = [(UNNotificationMuteAssertion *)&v9 _init];
  v7 = (UNNotificationSourceMuteAssertion *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

+ (id)sourceMuteAssertionUntilDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithExpirationDate:v4];

  return v5;
}

- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF910] now];
  }
  v8 = v7;
  BOOL v9 = [(NSDate *)self->_expirationDate compare:v7] == NSOrderedDescending;

  return v9;
}

- (UNNotificationSourceMuteAssertion)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNNotificationSourceMuteAssertion;
  id v5 = [(UNNotificationMuteAssertion *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UNNotificationSourceMuteAssertion;
  id v4 = a3;
  [(UNNotificationMuteAssertion *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, @"expirationDate", v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
}

@end
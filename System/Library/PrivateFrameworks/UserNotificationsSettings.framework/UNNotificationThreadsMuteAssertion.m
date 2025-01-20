@interface UNNotificationThreadsMuteAssertion
+ (id)threadsMuteAssertionWithExpirationDateByThreadID:(id)a3;
- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4;
- (UNNotificationThreadsMuteAssertion)initWithCoder:(id)a3;
- (UNNotificationThreadsMuteAssertion)initWithExpirationDateByThreadID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationThreadsMuteAssertion

- (UNNotificationThreadsMuteAssertion)initWithExpirationDateByThreadID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNNotificationThreadsMuteAssertion;
  v5 = [(UNNotificationMuteAssertion *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    expirationDateByThreadID = v5->_expirationDateByThreadID;
    v5->_expirationDateByThreadID = (NSDictionary *)v6;
  }
  return v5;
}

+ (id)threadsMuteAssertionWithExpirationDateByThreadID:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithExpirationDateByThreadID:v4];

  return v5;
}

- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    v8 = [(NSDictionary *)self->_expirationDateByThreadID objectForKey:v6];
    if (v8)
    {
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [MEMORY[0x263EFF910] now];
      }
      v11 = v9;
      BOOL v10 = [v8 compare:v9] == 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (UNNotificationThreadsMuteAssertion)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNNotificationThreadsMuteAssertion;
  v5 = [(UNNotificationMuteAssertion *)&v13 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"threadID"];
    expirationDateByThreadID = v5->_expirationDateByThreadID;
    v5->_expirationDateByThreadID = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UNNotificationThreadsMuteAssertion;
  id v4 = a3;
  [(UNNotificationMuteAssertion *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDateByThreadID, @"threadID", v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
}

@end
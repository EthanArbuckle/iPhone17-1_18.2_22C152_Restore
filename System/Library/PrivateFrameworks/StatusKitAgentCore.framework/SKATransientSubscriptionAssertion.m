@interface SKATransientSubscriptionAssertion
+ (id)logger;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransientSubscription:(id)a3;
- (NSString)subscriptionIdentifier;
- (OS_os_activity)osActivity;
- (SKATransientSubscriptionAssertion)initWithSubscriptionIdentifier:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation SKATransientSubscriptionAssertion

- (SKATransientSubscriptionAssertion)initWithSubscriptionIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SKATransientSubscriptionAssertion;
  v5 = [(SKATransientSubscriptionAssertion *)&v12 init];
  if (v5)
  {
    v6 = +[SKATransientSubscriptionAssertion logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Creating TransientSubscriptionAssertion for channel \"%@\"", buf, 0xCu);
    }

    uint64_t v7 = [v4 copy];
    subscriptionIdentifier = v5->_subscriptionIdentifier;
    v5->_subscriptionIdentifier = (NSString *)v7;

    os_activity_t v9 = _os_activity_create(&dword_22480C000, "TransientSubscriptionAssertion", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    osActivity = v5->_osActivity;
    v5->_osActivity = (OS_os_activity *)v9;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(SKATransientSubscriptionAssertion *)self subscriptionIdentifier];
  v6 = [v3 stringWithFormat:@"<%@: %p subscriptionIdentifier = %@", v4, self, v5];;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(SKATransientSubscriptionAssertion *)self isEqualToTransientSubscription:v4];

  return v5;
}

- (BOOL)isEqualToTransientSubscription:(id)a3
{
  id v4 = (SKATransientSubscriptionAssertion *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    v6 = [(SKATransientSubscriptionAssertion *)v4 subscriptionIdentifier];
    if (v6 || self->_subscriptionIdentifier)
    {
      uint64_t v7 = [(SKATransientSubscriptionAssertion *)v5 subscriptionIdentifier];
      char v8 = [v7 isEqualToString:self->_subscriptionIdentifier];
    }
    else
    {
      char v8 = 1;
    }
  }
  return v8;
}

- (unint64_t)hash
{
  v2 = [(SKATransientSubscriptionAssertion *)self subscriptionIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v3 = +[SKATransientSubscriptionAssertion logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    subscriptionIdentifier = self->_subscriptionIdentifier;
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = subscriptionIdentifier;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Deallocing TransientSubscriptionAssertion for channel \"%@\", releasing os_activity", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)SKATransientSubscriptionAssertion;
  [(SKATransientSubscriptionAssertion *)&v5 dealloc];
}

+ (id)logger
{
  if (logger_onceToken_20 != -1) {
    dispatch_once(&logger_onceToken_20, &__block_literal_global_20);
  }
  v2 = (void *)logger__logger_20;
  return v2;
}

uint64_t __43__SKATransientSubscriptionAssertion_logger__block_invoke()
{
  logger__logger_20 = (uint64_t)os_log_create("com.apple.StatusKit", "SKATransientSubscriptionAssertion");
  return MEMORY[0x270F9A758]();
}

- (NSString)subscriptionIdentifier
{
  return self->_subscriptionIdentifier;
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_storeStrong((id *)&self->_subscriptionIdentifier, 0);
}

@end
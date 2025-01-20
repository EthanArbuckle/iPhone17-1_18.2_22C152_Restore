@interface SKAPresenceAssertion
+ (id)logger;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPresenceAssertion:(id)a3;
- (NSString)presenceIdentifier;
- (OS_os_activity)osActivity;
- (SKAPresenceAssertion)initWithPresenceIdentifier:(id)a3 options:(id)a4 payload:(id)a5;
- (SKPresenceOptions)options;
- (SKPresencePayload)payload;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)setPayload:(id)a3;
@end

@implementation SKAPresenceAssertion

- (SKAPresenceAssertion)initWithPresenceIdentifier:(id)a3 options:(id)a4 payload:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SKAPresenceAssertion;
  v11 = [(SKAPresenceAssertion *)&v18 init];
  if (v11)
  {
    v12 = +[SKAPresenceAssertion logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Creating PresenceAssertion for identifier \"%@\"", buf, 0xCu);
    }

    uint64_t v13 = [v8 copy];
    presenceIdentifier = v11->_presenceIdentifier;
    v11->_presenceIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v11->_payload, a5);
    objc_storeStrong((id *)&v11->_options, a4);
    os_activity_t v15 = _os_activity_create(&dword_22480C000, "PresenceAssertion", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    osActivity = v11->_osActivity;
    v11->_osActivity = (OS_os_activity *)v15;
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(SKAPresenceAssertion *)self presenceIdentifier];
  v6 = [(SKAPresenceAssertion *)self options];
  v7 = [v3 stringWithFormat:@"<%@: %p presenceIdentifier = %@ options = %@", v4, self, v5, v6];;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(SKAPresenceAssertion *)self isEqualToPresenceAssertion:v4];

  return v5;
}

- (BOOL)isEqualToPresenceAssertion:(id)a3
{
  id v4 = (SKAPresenceAssertion *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    v6 = [(SKAPresenceAssertion *)v4 presenceIdentifier];
    if (v6 || self->_presenceIdentifier)
    {
      v7 = [(SKAPresenceAssertion *)v5 presenceIdentifier];
      char v8 = [v7 isEqualToString:self->_presenceIdentifier];
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
  v2 = [(SKAPresenceAssertion *)self presenceIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v3 = +[SKAPresenceAssertion logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    presenceIdentifier = self->_presenceIdentifier;
    *(_DWORD *)buf = 138412290;
    v7 = presenceIdentifier;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Deallocing PresenceAssertion for channel \"%@\", releasing os_activity", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)SKAPresenceAssertion;
  [(SKAPresenceAssertion *)&v5 dealloc];
}

+ (id)logger
{
  if (logger_onceToken_1 != -1) {
    dispatch_once(&logger_onceToken_1, &__block_literal_global_1);
  }
  v2 = (void *)logger__logger_1;
  return v2;
}

uint64_t __30__SKAPresenceAssertion_logger__block_invoke()
{
  logger__logger_1 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAPresenceAssertion");
  return MEMORY[0x270F9A758]();
}

- (NSString)presenceIdentifier
{
  return self->_presenceIdentifier;
}

- (SKPresenceOptions)options
{
  return self->_options;
}

- (SKPresencePayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_presenceIdentifier, 0);
}

@end
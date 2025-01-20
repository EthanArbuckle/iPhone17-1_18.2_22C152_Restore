@interface STUserNotificationContext
+ (BOOL)supportsSecureCoding;
- (NSArray)localizedUserNotificationBodyArguments;
- (NSNumber)destinations;
- (NSString)identifier;
- (NSString)notificationBundleIdentifier;
- (STUserNotificationContext)init;
- (STUserNotificationContext)initWithCoder:(id)a3;
- (STUserNotificationContext)initWithIdentifier:(id)a3;
- (UNMutableNotificationContent)notificationContent;
- (UNNotificationTrigger)trigger;
- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)notificationContentWithCompletionBlock:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedUserNotificationBodyArguments:(id)a3;
- (void)setTrigger:(id)a3;
@end

@implementation STUserNotificationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STUserNotificationContext)init
{
  v3 = objc_opt_new();
  v4 = [v3 UUIDString];
  v5 = [(STUserNotificationContext *)self initWithIdentifier:v4];

  return v5;
}

- (STUserNotificationContext)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUserNotificationContext;
  v6 = [(STUserNotificationContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (STUserNotificationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STUserNotificationContext;
  id v5 = [(STUserNotificationContext *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    if (!v5->_identifier)
    {
      v13 = 0;
      goto LABEL_6;
    }
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"localizedUserNotificationBodyArguments"];
    localizedUserNotificationBodyArguments = v5->_localizedUserNotificationBodyArguments;
    v5->_localizedUserNotificationBodyArguments = (NSArray *)v11;
  }
  v13 = v5;
LABEL_6:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_localizedUserNotificationBodyArguments forKey:@"localizedUserNotificationBodyArguments"];
}

- (UNMutableNotificationContent)notificationContent
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x1E4F44640] defaultSound];
  [v2 setSound:v3];

  id v4 = objc_opt_new();
  [v4 setScheme:@"prefs"];
  [v4 setPath:@"root=SCREEN_TIME"];
  id v5 = [v4 URL];

  [v2 setDefaultActionURL:v5];
  [v2 setShouldIgnoreDowntime:1];
  return (UNMutableNotificationContent *)v2;
}

- (void)notificationContentWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [MEMORY[0x1E4F44640] defaultSound];
  [v5 setSound:v6];

  v7 = objc_opt_new();
  [v7 setScheme:@"prefs"];
  [v7 setPath:@"root=SCREEN_TIME"];
  v8 = [v7 URL];

  [v5 setDefaultActionURL:v8];
  [v5 setShouldIgnoreDowntime:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__STUserNotificationContext_notificationContentWithCompletionBlock___block_invoke;
  v11[3] = &unk_1E6BC6D30;
  id v12 = v5;
  id v13 = v4;
  id v9 = v5;
  id v10 = v4;
  [(STUserNotificationContext *)self customizeNotificationContent:v9 withCompletionBlock:v11];
}

uint64_t __68__STUserNotificationContext_notificationContentWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
}

- (NSNumber)destinations
{
  return 0;
}

- (NSString)notificationBundleIdentifier
{
  return (NSString *)@"com.apple.ScreenTimeNotifications";
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)localizedUserNotificationBodyArguments
{
  return self->_localizedUserNotificationBodyArguments;
}

- (void)setLocalizedUserNotificationBodyArguments:(id)a3
{
}

- (UNNotificationTrigger)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_localizedUserNotificationBodyArguments, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
@interface PDGenericUserNotification
+ (BOOL)supportsSecureCoding;
- (NSString)message;
- (NSString)subtitle;
- (NSString)title;
- (PDGenericUserNotification)initWithCoder:(id)a3;
- (PDGenericUserNotification)initWithMessage:(id)a3;
- (PDGenericUserNotification)initWithMessage:(id)a3 forPassUniqueIdentifier:(id)a4;
- (PDGenericUserNotification)initWithTitle:(id)a3 message:(id)a4;
- (PDGenericUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5;
- (PDGenericUserNotification)initWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5;
- (id)_initWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 forPassUniqueIdentifier:(id)a6;
- (id)_initWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 forPassUniqueIdentifier:(id)a6 hashComponents:(id)a7;
- (id)description;
- (id)notificationContentWithDataSource:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDGenericUserNotification

- (PDGenericUserNotification)initWithMessage:(id)a3
{
  return (PDGenericUserNotification *)[(PDGenericUserNotification *)self _initWithTitle:0 subtitle:0 message:a3 forPassUniqueIdentifier:0];
}

- (PDGenericUserNotification)initWithTitle:(id)a3 message:(id)a4
{
  return (PDGenericUserNotification *)[(PDGenericUserNotification *)self _initWithTitle:a3 subtitle:0 message:a4 forPassUniqueIdentifier:0];
}

- (PDGenericUserNotification)initWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5
{
  return (PDGenericUserNotification *)[(PDGenericUserNotification *)self _initWithTitle:a3 subtitle:a4 message:a5 forPassUniqueIdentifier:0];
}

- (PDGenericUserNotification)initWithMessage:(id)a3 forPassUniqueIdentifier:(id)a4
{
  return (PDGenericUserNotification *)[(PDGenericUserNotification *)self _initWithTitle:0 subtitle:0 message:a3 forPassUniqueIdentifier:a4];
}

- (PDGenericUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5
{
  return (PDGenericUserNotification *)[(PDGenericUserNotification *)self _initWithTitle:a3 subtitle:0 message:a4 forPassUniqueIdentifier:a5];
}

- (id)_initWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 forPassUniqueIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[NSMutableArray array];
  [v14 safelyAddObject:v13];
  [v14 safelyAddObject:v12];
  [v14 safelyAddObject:v11];
  [v14 safelyAddObject:v10];
  id v15 = [(PDGenericUserNotification *)self _initWithTitle:v13 subtitle:v12 message:v11 forPassUniqueIdentifier:v10 hashComponents:v14];

  return v15;
}

- (id)_initWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 forPassUniqueIdentifier:(id)a6 hashComponents:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v16 count])
  {
    PKCombinedHash();
    [(PDUserNotification *)self notificationType];
    v17 = +[NSString stringWithFormat:@"%lu", PKIntegerHash()];
    v26.receiver = self;
    v26.super_class = (Class)PDGenericUserNotification;
    v18 = [(PDUserNotification *)&v26 initWithNotificationIdentifier:v17 forPassUniqueIdentifier:v15];
    if (v18)
    {
      v19 = (NSString *)[v12 copy];
      title = v18->_title;
      v18->_title = v19;

      v21 = (NSString *)[v13 copy];
      subtitle = v18->_subtitle;
      v18->_subtitle = v21;

      v23 = (NSString *)[v14 copy];
      message = v18->_message;
      v18->_message = v23;
    }
  }
  else
  {

    v18 = 0;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDGenericUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDGenericUserNotification;
  v5 = [(PDUserNotification *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDGenericUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, @"title", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v4 encodeObject:self->_message forKey:@"message"];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PDGenericUserNotification;
  v3 = [(PDUserNotification *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"[%@ Title: %@, Subtitle: %@, Message: %@]", v3, self->_title, self->_subtitle, self->_message];

  return v4;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDGenericUserNotification;
  id v4 = [(PDUserNotification *)&v6 notificationContentWithDataSource:a3];
  [v4 setTitle:self->_title];
  [v4 setSubtitle:self->_subtitle];
  [v4 setBody:self->_message];
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
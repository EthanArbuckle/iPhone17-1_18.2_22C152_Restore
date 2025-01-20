@interface CRBulletin
+ (NSArray)actions;
+ (UNNotificationCategory)notificationCategory;
+ (id)CARActionWithTitle:(id)a3;
+ (id)CARActionWithURL:(id)a3 title:(id)a4;
- (CRBulletin)init;
- (CRBulletin)initWithTitle:(id)a3 message:(id)a4 destinations:(unint64_t)a5;
- (NSArray)actions;
- (NSString)message;
- (NSString)recordID;
- (NSString)title;
- (UNNotificationRequest)notificationRequest;
- (id)actionHandler;
- (unint64_t)destinations;
- (void)setActionHandler:(id)a3;
- (void)setDestinations:(unint64_t)a3;
@end

@implementation CRBulletin

- (CRBulletin)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRBulletin;
  v2 = [(CRBulletin *)&v7 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    uint64_t v4 = [v3 UUIDString];
    recordID = v2->_recordID;
    v2->_recordID = (NSString *)v4;

    v2->_destinations = 2;
  }
  return v2;
}

- (CRBulletin)initWithTitle:(id)a3 message:(id)a4 destinations:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(CRBulletin *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    objc_storeStrong((id *)&v12->_message, a4);
    v12->_destinations = a5;
  }

  return v12;
}

+ (NSArray)actions
{
  return (NSArray *)&__NSArray0__struct;
}

+ (UNNotificationCategory)notificationCategory
{
  id v3 = objc_alloc((Class)UNMutableNotificationCategory);
  uint64_t v4 = [a1 categoryIdentifier];
  id v5 = [v3 initWithIdentifier:v4];

  v6 = [a1 actions];
  [v5 setActions:v6];

  [v5 setOptions:0];

  return (UNNotificationCategory *)v5;
}

- (NSArray)actions
{
  v2 = objc_opt_class();

  return (NSArray *)[v2 actions];
}

- (UNNotificationRequest)notificationRequest
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(CRBulletin *)self title];
  id v5 = (void *)v4;
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  else {
    CFStringRef v6 = &stru_1000C0798;
  }
  [v3 setTitle:v6];

  uint64_t v7 = [(CRBulletin *)self message];
  v8 = (void *)v7;
  if (v7) {
    CFStringRef v9 = (const __CFString *)v7;
  }
  else {
    CFStringRef v9 = &stru_1000C0798;
  }
  [v3 setBody:v9];

  id v10 = [(id)objc_opt_class() categoryIdentifier];
  [v3 setCategoryIdentifier:v10];

  [v3 setShouldIgnoreDoNotDisturb:1];
  [v3 setShouldSuppressScreenLightUp:1];
  v11 = [(CRBulletin *)self recordID];
  v12 = +[UNNotificationRequest requestWithIdentifier:v11 content:v3 trigger:0 destinations:self->_destinations];

  return (UNNotificationRequest *)v12;
}

+ (id)CARActionWithTitle:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = [v3 uppercaseString];
    id v5 = +[UNNotificationAction actionWithIdentifier:v4 title:v3 options:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)CARActionWithURL:(id)a3 title:(id)a4
{
  uint64_t v4 = 0;
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = [v6 uppercaseString];
    uint64_t v4 = +[UNNotificationAction actionWithIdentifier:v8 title:v6 url:v7];
  }

  return v4;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (unint64_t)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(unint64_t)a3
{
  self->_destinations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_actionHandler, 0);
}

@end
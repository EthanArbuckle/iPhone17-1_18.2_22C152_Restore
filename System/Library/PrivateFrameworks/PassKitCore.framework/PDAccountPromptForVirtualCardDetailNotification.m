@interface PDAccountPromptForVirtualCardDetailNotification
+ (BOOL)supportsSecureCoding;
- (NSString)virtualCardIdentifier;
- (PDAccountPromptForVirtualCardDetailNotification)initWithAccountIdentifier:(id)a3 virtualCardIdentifier:(id)a4 forPassUniqueIdentifier:(id)a5;
- (id)_notificationIdentifierForAccountIdentifier:(id)a3 virtualCardIdentifier:(id)a4;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
@end

@implementation PDAccountPromptForVirtualCardDetailNotification

- (PDAccountPromptForVirtualCardDetailNotification)initWithAccountIdentifier:(id)a3 virtualCardIdentifier:(id)a4 forPassUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = [(PDAccountPromptForVirtualCardDetailNotification *)self _notificationIdentifierForAccountIdentifier:v8 virtualCardIdentifier:v9];
    v15.receiver = self;
    v15.super_class = (Class)PDAccountPromptForVirtualCardDetailNotification;
    v12 = [(PDUserNotification *)&v15 initWithNotificationIdentifier:v11 forPassUniqueIdentifier:v10];

    if (v12)
    {
      v13 = +[NSDate date];
      [(PDUserNotification *)v12 setDate:v13];

      [(PDUserNotification *)v12 setCustomActionVerb:PKUserNotificationActionRouteViewPassDetails];
    }
  }
  else
  {

    v12 = 0;
  }

  return v12;
}

- (id)_notificationIdentifierForAccountIdentifier:(id)a3 virtualCardIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    v7 = +[NSString stringWithFormat:@"%@-%@-promptDetailForVirtualCard", v5, v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)notificationType
{
  return 24;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDAccountPromptForVirtualCardDetailNotification;
  v3 = [(PDUserNotification *)&v6 notificationContentWithDataSource:a3];
  v4 = PKLocalizedFeatureString();
  [v3 setBody:v4];

  return v3;
}

- (NSString)virtualCardIdentifier
{
  return self->_virtualCardIdentifier;
}

- (void).cxx_destruct
{
}

@end
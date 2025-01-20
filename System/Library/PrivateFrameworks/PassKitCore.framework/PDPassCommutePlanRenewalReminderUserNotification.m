@interface PDPassCommutePlanRenewalReminderUserNotification
+ (BOOL)supportsSecureCoding;
- (NSString)message;
- (NSString)title;
- (PDPassCommutePlanRenewalReminderUserNotification)initWithCoder:(id)a3;
- (PDPassCommutePlanRenewalReminderUserNotification)initWithPaymentPass:(id)a3 commutePlan:(id)a4;
- (id)_messageString;
- (id)_titleString;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassCommutePlanRenewalReminderUserNotification

- (PDPassCommutePlanRenewalReminderUserNotification)initWithPaymentPass:(id)a3 commutePlan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 uniqueID];
  v9 = [v7 identifier];
  v10 = [v8 stringByAppendingString:v9];
  v11 = [v10 stringByAppendingString:@"-CommutePlanRenewal"];
  v25.receiver = self;
  v25.super_class = (Class)PDPassCommutePlanRenewalReminderUserNotification;
  v12 = [(PDUserNotification *)&v25 initWithNotificationIdentifier:v11 forPassUniqueIdentifier:v8];

  if (v12)
  {
    uint64_t v13 = PKPassLocalizedStringWithFormat();
    title = v12->_title;
    v12->_title = (NSString *)v13;

    id v15 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v15, "setDateStyle:", 3, 0);
    [v15 setTimeStyle:0];
    [v15 setFormattingContext:1];
    v16 = [v7 expiryDate];
    v17 = [v15 stringFromDate:v16];

    v18 = [v7 title];
    v19 = [v18 value];
    if ([v6 isSuicaPass]) {
      BOOL v20 = [v6 transitCommutePlanType] == (id)1;
    }
    else {
      BOOL v20 = 0;
    }
    if (![v19 length] || v20)
    {
      v21 = [v18 label];

      [v21 length];
    }
    else
    {
      v21 = v19;
    }
    uint64_t v22 = PKPassLocalizedStringWithFormat();
    message = v12->_message;
    v12->_message = (NSString *)v22;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassCommutePlanRenewalReminderUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDPassCommutePlanRenewalReminderUserNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassCommutePlanRenewalReminderUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, @"title", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_message forKey:@"message"];
}

- (unint64_t)notificationType
{
  return 8;
}

- (id)_titleString
{
  return self->_title;
}

- (id)_messageString
{
  return self->_message;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
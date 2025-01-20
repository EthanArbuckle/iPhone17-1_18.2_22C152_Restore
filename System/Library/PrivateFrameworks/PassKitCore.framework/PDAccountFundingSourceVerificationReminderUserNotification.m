@interface PDAccountFundingSourceVerificationReminderUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)_fireDateForVerificationAttempt:(id)a3 withStyle:(unint64_t)a4;
+ (id)identifierForAccountIdentifier:(id)a3 fundingSources:(id)a4 style:(unint64_t)a5;
- (BOOL)isValid;
- (NSArray)fundingSources;
- (PDAccountFundingSourceVerificationReminderUserNotification)initWithAccount:(id)a3 fundingSources:(id)a4 style:(unint64_t)a5;
- (PDAccountFundingSourceVerificationReminderUserNotification)initWithCoder:(id)a3;
- (PKAccount)account;
- (id)_expiryDate;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (unint64_t)style;
- (void)_refreshActionURL;
- (void)encodeWithCoder:(id)a3;
- (void)setFundingSources:(id)a3;
@end

@implementation PDAccountFundingSourceVerificationReminderUserNotification

+ (id)identifierForAccountIdentifier:(id)a3 fundingSources:(id)a4 style:(unint64_t)a5
{
  v7 = objc_msgSend(a4, "firstObject", a3);
  v8 = [v7 fundingDetails];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v8 verificationDetails];
    v10 = [v9 pendingAttempt];

    v11 = [a1 _fireDateForVerificationAttempt:v10 withStyle:a5];
    if (v11)
    {
      v12 = +[NSCalendar currentCalendar];
      v13 = [v12 components:30 fromDate:v11];

      if (v13)
      {
        v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-%ld-%ld-%ld-%ld-%ld", @"FSVerificationReminder", a5, [v13 era], objc_msgSend(v13, "year"), objc_msgSend(v13, "month"), objc_msgSend(v13, "day"));
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_fireDateForVerificationAttempt:(id)a3 withStyle:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSDateComponents);
  v7 = v6;
  if (a4 == 1)
  {
    [v6 setDay:-3];
    uint64_t v8 = [v5 expiryDate];
  }
  else
  {
    if (a4)
    {
      v9 = 0;
      goto LABEL_8;
    }
    [v6 setDay:3];
    uint64_t v8 = [v5 sentDate];
  }
  v9 = (void *)v8;
  if (v8)
  {
    v10 = +[NSCalendar currentCalendar];
    v11 = [v10 components:62 fromDate:v9];
    [v11 setHour:17];
    uint32_t v12 = arc4random_uniform(0x3840u);
    v13 = [v10 dateFromComponents:v11];

    v14 = [v10 dateByAddingComponents:v7 toDate:v13 options:0];

    v9 = [v14 dateByAddingTimeInterval:(double)v12];
  }
LABEL_8:

  return v9;
}

- (PDAccountFundingSourceVerificationReminderUserNotification)initWithAccount:(id)a3 fundingSources:(id)a4 style:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9 && [v10 count])
  {
    uint32_t v12 = [v9 accountIdentifier];
    v13 = [(id)objc_opt_class() identifierForAccountIdentifier:v12 fundingSources:v11 style:a5];
    v14 = [v11 firstObject];
    v15 = [v14 fundingDetails];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = v13;
      v27 = v12;
      v16 = objc_opt_class();
      v17 = [v15 verificationDetails];
      v18 = [v17 pendingAttempt];
      v19 = [v16 _fireDateForVerificationAttempt:v18 withStyle:a5];

      v20 = +[NSDate now];
      id v21 = [v20 compare:v19];

      if (v21 == (id)1)
      {
        v22 = 0;
        v13 = v26;
        uint32_t v12 = v27;
      }
      else
      {
        v28.receiver = self;
        v28.super_class = (Class)PDAccountFundingSourceVerificationReminderUserNotification;
        v13 = v26;
        uint32_t v12 = v27;
        v23 = [(PDUserNotification *)&v28 initWithNotificationIdentifier:v26 forAccountIdentifier:v27];
        v24 = v23;
        if (v23)
        {
          objc_storeStrong((id *)&v23->_account, a3);
          v24->_style = a5;
          objc_storeStrong((id *)&v24->_fundingSources, a4);
          [(PDAccountFundingSourceVerificationReminderUserNotification *)v24 _refreshActionURL];
          [(PDUserNotification *)v24 setDate:v19];
          [(PDUserNotification *)v24 setReissueBannerOnUpdate:0];
        }
        self = v24;
        v22 = self;
      }
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (unint64_t)notificationType
{
  return 78;
}

- (BOOL)isValid
{
  v2 = [(PDAccountFundingSourceVerificationReminderUserNotification *)self _expiryDate];
  if (v2 && (PKIsMac() & 1) == 0)
  {
    v4 = +[NSDate now];
    BOOL v3 = [v4 compare:v2] != (id)1;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)notificationContentWithDataSource:(id)a3
{
  account = self->_account;
  id v5 = a3;
  [(PKAccount *)account feature];
  NSUInteger v6 = [(NSArray *)self->_fundingSources count];
  v20.receiver = self;
  v20.super_class = (Class)PDAccountFundingSourceVerificationReminderUserNotification;
  v7 = [(PDUserNotification *)&v20 notificationContentWithDataSource:v5];

  unint64_t style = self->_style;
  if (style != 1)
  {
    if (!style)
    {
      id v9 = PKLocalizedFeatureString();
      [v7 setTitle:v9];

      id v10 = PKLocalizedFeatureString();
      objc_msgSend(v7, "setSubtitle:", v10, v6);

      v11 = PKLocalizedFeatureString();
      objc_msgSend(v7, "setBody:", v11, v6);

      [v7 setInterruptionLevel:UNNotificationInterruptionLevelDefault];
    }
    goto LABEL_6;
  }
  uint64_t v12 = [(PDAccountFundingSourceVerificationReminderUserNotification *)self _expiryDate];
  if (v12)
  {
    v13 = (void *)v12;
    NSUInteger v19 = v6;
    v14 = PKLocalizedFeatureString();
    objc_msgSend(v7, "setTitle:", v14, v19);

    v15 = PKMediumDayAndLongMonthStringFromDate();
    v16 = PKLocalizedFeatureString();
    objc_msgSend(v7, "setBody:", v16, v15);

    [v7 setInterruptionLevel:2];
LABEL_6:
    id v17 = v7;
    goto LABEL_7;
  }
  id v17 = 0;
LABEL_7:

  return v17;
}

- (id)applicationMessageContent
{
  if (self->_style == 1)
  {
    [(PKAccount *)self->_account feature];
    BOOL v3 = [(PDAccountFundingSourceVerificationReminderUserNotification *)self _expiryDate];
    if (v3)
    {
      [(NSArray *)self->_fundingSources count];
      v4 = PKLocalizedFeatureString();
      v14 = PKMediumDayAndLongMonthStringFromDate();
      id v5 = PKLocalizedFeatureString();

      NSUInteger v6 = [(PDUserNotification *)self accountIdentifier];
      v7 = [@"PDSavingsAccountApplicationMessageGroupIdentifier" stringByAppendingString:v6];

      id v8 = +[PKApplicationMessageGroupDescriptor createForIdentifier:v7 withSingularSummary:v4 pluralSummary:v4];
      id v9 = [(PDUserNotification *)self actionURL];
      id v10 = +[PKApplicationMessageActionURL createWithURL:v9];
      v11 = +[PDUserNotification applicationMessageIconForFeature:5];
      id v12 = +[PKApplicationMessageContentDefault createWithGroup:v8 action:v10 icon:v11 title:v4 body:v5];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFundingSourceVerificationReminderUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDAccountFundingSourceVerificationReminderUserNotification;
  id v5 = [(PDUserNotification *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    account = v5->_account;
    v5->_account = (PKAccount *)v6;

    uint64_t v8 = objc_opt_class();
    id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"fundingSources"];
    fundingSources = v5->_fundingSources;
    v5->_fundingSources = (NSArray *)v10;

    v5->_unint64_t style = (unint64_t)[v4 decodeIntegerForKey:@"style"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountFundingSourceVerificationReminderUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_account, @"account", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_fundingSources forKey:@"fundingSources"];
  [v4 encodeInteger:self->_style forKey:@"style"];
}

- (id)_expiryDate
{
  v2 = [(NSArray *)self->_fundingSources firstObject];
  BOOL v3 = [v2 fundingDetails];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 verificationDetails];
    objc_super v5 = [v4 pendingAttempt];
    uint64_t v6 = [v5 expiryDate];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_refreshActionURL
{
  id v7 = +[NSString stringWithFormat:@"%@/%@", PKURLActionRouteSavings, PKURLActionRouteSavingsBankVerification];
  if ((id)[(NSArray *)self->_fundingSources count] == (id)1)
  {
    BOOL v3 = [(NSArray *)self->_fundingSources firstObject];
    id v4 = [v3 identifier];
    uint64_t v5 = [v7 stringByAppendingFormat:@"/%@", v4];

    id v6 = (id)v5;
  }
  else
  {
    id v6 = v7;
  }
  id v8 = v6;
  [(PDUserNotification *)self setCustomActionRoute:v6];
}

- (void)setFundingSources:(id)a3
{
  id v4 = (NSArray *)a3;
  BOOL v5 = [(NSArray *)self->_fundingSources count] < 2;
  BOOL v6 = [(NSArray *)v4 count] > 1;
  fundingSources = self->_fundingSources;
  self->_fundingSources = v4;

  if (((v5 ^ v6) & 1) == 0)
  {
    [(PDAccountFundingSourceVerificationReminderUserNotification *)self _refreshActionURL];
  }
}

- (PKAccount)account
{
  return self->_account;
}

- (NSArray)fundingSources
{
  return self->_fundingSources;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fundingSources, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
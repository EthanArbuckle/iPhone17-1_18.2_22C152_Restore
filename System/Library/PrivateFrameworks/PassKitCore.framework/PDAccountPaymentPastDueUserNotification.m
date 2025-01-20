@interface PDAccountPaymentPastDueUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (BOOL)needsNotificationSettings;
- (BOOL)useGenericMessaging;
- (PDAccountPaymentPastDueUserNotification)initWithCoder:(id)a3;
- (PDAccountPaymentPastDueUserNotification)initWithPassUniqueIdentifier:(id)a3 account:(id)a4;
- (id)_messageString;
- (id)_title;
- (id)notificationContentWithDataSource:(id)a3;
- (int64_t)_variantForDay:(int64_t)a3 cycle:(int64_t)a4;
- (int64_t)variant;
- (unint64_t)featureIdentifier;
- (unint64_t)notificationType;
- (void)_updateForNextPastDueNotificationForAccount:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setVariant:(int64_t)a3;
@end

@implementation PDAccountPaymentPastDueUserNotification

- (PDAccountPaymentPastDueUserNotification)initWithPassUniqueIdentifier:(id)a3 account:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (!a3 || !v6)
  {

LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  v15.receiver = self;
  v15.super_class = (Class)PDAccountPaymentPastDueUserNotification;
  v8 = [(PDUserNotification *)&v15 initWithNotificationIdentifier:@"accountPaymentPastDue" forPassUniqueIdentifier:a3];
  [(PDAccountPaymentPastDueUserNotification *)v8 _updateForNextPastDueNotificationForAccount:v7];
  v9 = [(PDUserNotification *)v8 date];

  if (!v9)
  {
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[PDAccountPaymentPastDueUserNotification initWithPassUniqueIdentifier:account:]";
      v11 = "Skipping %s: date is nil";
      v12 = v10;
      uint32_t v13 = 12;
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (![(PDAccountPaymentPastDueUserNotification *)v8 isValid])
  {
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[PDAccountPaymentPastDueUserNotification initWithPassUniqueIdentifier:account:]";
      __int16 v18 = 2112;
      v19 = v8;
      v11 = "Skipping %s: notification is invalid: %@";
      v12 = v10;
      uint32_t v13 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
LABEL_13:

  return v8;
}

- (void)_updateForNextPastDueNotificationForAccount:(id)a3
{
  id v4 = a3;
  v5 = +[NSDate date];
  id v6 = [v4 creditDetails];
  v7 = [v6 accountSummary];

  v8 = [v7 pastDueAmount];
  v9 = v8;
  if (v8 && objc_msgSend(v8, "pk_isPositiveNumber") && objc_msgSend(v4, "state") != (id)3)
  {
    uint64_t v10 = (uint64_t)[v7 cyclesPastDue];
    if (v10 >= 6)
    {
      __int16 v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Ignoring: Account is 6 months or more past due.", buf, 2u);
      }
    }
    else
    {
      uint64_t v49 = v10;
      v11 = +[NSTimeZone systemTimeZone];
      v12 = [v4 creditDetails];
      uint32_t v13 = [v12 productTimeZone];

      v46 = v13;
      id v14 = [v13 secondsFromGMT];
      v47 = v11;
      id v15 = [v11 secondsFromGMT];
      id v16 = objc_alloc((Class)NSArray);
      v44 = self;
      if ((uint64_t)v14 >= (uint64_t)v15) {
        id v17 = objc_msgSend(v16, "initWithObjects:", &off_10078B1C0, &off_10078B1D8, &off_10078B1F0, &off_10078B208, &off_10078B220, 0);
      }
      else {
        id v17 = objc_msgSend(v16, "initWithObjects:", &off_10078B238, &off_10078B250, &off_10078B268, &off_10078B280, &off_10078B298, 0);
      }
      v19 = v17;
      v20 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
      v21 = [v20 components:240 fromDate:v5];
      v22 = (char *)[v21 day];
      uint64_t v23 = (uint64_t)[v21 hour];
      id v24 = [v21 minute];
      v45 = v21;
      id v25 = [v21 second];
      if (v23 == 12 && v24 == 0 && v25 == 0) {
        v28 = v22;
      }
      else {
        v28 = v22 + 1;
      }
      if (v23 >= 12) {
        v22 = v28;
      }
      v48 = v20;
      v50 = [v20 components:14 fromDate:v5];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v29 = v19;
      id v30 = [v29 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v53;
LABEL_23:
        uint64_t v33 = 0;
        while (1)
        {
          if (*(void *)v53 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = (char *)[*(id *)(*((void *)&v52 + 1) + 8 * v33) integerValue];
          if ((uint64_t)v22 <= (uint64_t)v34) {
            break;
          }
          if (v31 == (id)++v33)
          {
            id v31 = [v29 countByEnumeratingWithState:&v52 objects:v57 count:16];
            if (v31) {
              goto LABEL_23;
            }
            goto LABEL_29;
          }
        }
        uint64_t v35 = (uint64_t)v34;

        if (v35 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_31;
        }
        v38 = v50;
        [v50 setDay:v35];
        v39 = v44;
        v37 = v48;
      }
      else
      {
LABEL_29:

LABEL_31:
        v36 = PKStartOfNextMonth();
        v37 = v48;
        v38 = [v48 components:30 fromDate:v36];

        uint64_t v35 = 1;
        v39 = v44;
      }
      v51 = v38;
      [v38 setHour:12];
      __int16 v18 = [v37 dateFromComponents:v38];
      v39->_featureIdentifier = (unint64_t)[v4 feature];
      v40 = [v4 accountIdentifier];
      [(PDUserNotification *)v39 setAccountIdentifier:v40];

      v41 = [v4 creditDetails];
      v42 = [v41 accountSummary];
      v39->_useGenericMessaging = [v42 requiresDebtCollectionNotices];

      v39->_variant = [(PDAccountPaymentPastDueUserNotification *)v39 _variantForDay:v35 cycle:v49];
      [(PDUserNotification *)v39 setPreventAutomaticDismissal:1];
      [(PDUserNotification *)v39 setDate:v18];
      v43 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"accountPaymentPastDue-%ld-%ld-%ld-%ld", [v51 year], objc_msgSend(v51, "month"), objc_msgSend(v51, "day"), v49);
      [(PDUserNotification *)v39 setNotificationIdentifier:v43];
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountPaymentPastDueUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PDAccountPaymentPastDueUserNotification;
  v5 = [(PDUserNotification *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_variant = (int64_t)[v4 decodeIntegerForKey:@"variant"];
    v5->_useGenericMessaging = [v4 decodeBoolForKey:@"useGenericMessaging"];
    v5->_featureIdentifier = (unint64_t)[v4 decodeIntegerForKey:@"accountFeatureIdentifier"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountPaymentPastDueUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_variant, @"variant", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_useGenericMessaging forKey:@"useGenericMessaging"];
  [v4 encodeInteger:self->_featureIdentifier forKey:@"accountFeatureIdentifier"];
}

- (int64_t)_variantForDay:(int64_t)a3 cycle:(int64_t)a4
{
  if (self->_useGenericMessaging) {
    return 0;
  }
  if (a4)
  {
    uint64_t v5 = 10;
    if ((unint64_t)(a3 - 27) >= 2) {
      uint64_t v5 = -1;
    }
    if ((unint64_t)(a3 - 21) >= 2) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 8;
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xE) {
      uint64_t v7 = 6;
    }
    else {
      uint64_t v7 = v6;
    }
    if ((unint64_t)(a3 - 7) >= 2) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 4;
    }
    if ((unint64_t)(a3 - 1) >= 2) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = 2;
    }
    if (a4 <= 4) {
      return v9;
    }
    else {
      return 11;
    }
  }
  else
  {
    uint64_t v10 = 9;
    if ((unint64_t)(a3 - 27) >= 2) {
      uint64_t v10 = -1;
    }
    if ((unint64_t)(a3 - 21) >= 2) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 7;
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xE) {
      uint64_t v12 = 5;
    }
    else {
      uint64_t v12 = v11;
    }
    if ((unint64_t)(a3 - 7) >= 2) {
      int64_t v13 = v12;
    }
    else {
      int64_t v13 = 3;
    }
    if ((unint64_t)(a3 - 1) >= 2) {
      return v13;
    }
    else {
      return 1;
    }
  }
}

- (id)_messageString
{
  if (self->_useGenericMessaging)
  {
    self->_variant = 0;
LABEL_3:
    PDDeviceSpecificLocalizedStringKeyForKey();
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_4:
    PKLocalizedFeatureString();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_FOURTEEN_MONTH_TWO_THROUGH_FIVE";
    switch(self->_variant)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        goto LABEL_3;
      case 6:
        goto LABEL_4;
      case 7:
        v2 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_TWENTY_ONE_FIRST_MONTH";
        goto LABEL_4;
      case 8:
        v2 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_TWENTY_ONE_MONTH_TWO_THROUGH_FIVE";
        goto LABEL_4;
      case 9:
        v2 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_TWENTY_SEVEN_FIRST_MONTH";
        goto LABEL_4;
      case 0xALL:
        v2 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_TWENTY_SEVEN_MONTH_TWO_THROUGH_FIVE";
        goto LABEL_4;
      case 0xBLL:
        v2 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_ALL_DAYS_MONTH_SIX";
        goto LABEL_4;
      default:
        id v3 = 0;
        break;
    }
  }
  return v3;
}

- (id)_title
{
  v2 = PKLocalizedFeatureString();
  return v2;
}

- (BOOL)isValid
{
  id v3 = [(PDUserNotification *)self accountIdentifier];
  if (!v3 || self->_variant == -1)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v4 = [(PDAccountPaymentPastDueUserNotification *)self _messageString];
    BOOL v5 = [v4 length] != 0;
  }
  return v5;
}

- (unint64_t)notificationType
{
  return 29;
}

- (BOOL)needsNotificationSettings
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PDAccountPaymentPastDueUserNotification;
  id v4 = a3;
  BOOL v5 = [(PDUserNotification *)&v12 notificationContentWithDataSource:v4];
  uint64_t v6 = objc_msgSend(v4, "notificationSettings", v12.receiver, v12.super_class);

  BOOL v7 = self->_useGenericMessaging || [v6 showPreviewsSetting] == 0;
  self->_useGenericMessaging = v7;
  uint64_t v8 = [(PDAccountPaymentPastDueUserNotification *)self _title];
  [v5 setSubtitle:v8];

  int64_t v9 = [(PDAccountPaymentPastDueUserNotification *)self _messageString];
  [v5 setBody:v9];

  uint64_t v10 = [(PDUserNotification *)self date];
  [v5 setDate:v10];

  [v5 setInterruptionLevel:2];
  return v5;
}

- (BOOL)useGenericMessaging
{
  return self->_useGenericMessaging;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(int64_t)a3
{
  self->_variant = a3;
}

@end
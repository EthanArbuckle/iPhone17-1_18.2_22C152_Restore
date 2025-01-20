@interface PDPassAccountEventUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasSummaryTile;
- (BOOL)isValid;
- (BOOL)requiresDebtCollectionNotices;
- (BOOL)shouldShowNotification;
- (NSString)transactionSourceIdentifier;
- (PDPassAccountEventUserNotification)initWithCoder:(id)a3;
- (PDPassAccountEventUserNotification)initWithPassUniqueIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 accountEvent:(id)a5 featureIdentifier:(unint64_t)a6 requiresDebtCollectionNotices:(BOOL)a7;
- (PKAccountEvent)accountEvent;
- (id)_accountEventApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4;
- (id)_accountEventApplicationMessageGroupDescriptor;
- (id)_messageString;
- (id)_subtitleString;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)featureIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassAccountEventUserNotification

- (PDPassAccountEventUserNotification)initWithPassUniqueIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 accountEvent:(id)a5 featureIdentifier:(unint64_t)a6 requiresDebtCollectionNotices:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = v14;
  if (v12 && v14)
  {
    v16 = [v14 identifier];
    v30.receiver = self;
    v30.super_class = (Class)PDPassAccountEventUserNotification;
    v17 = [(PDUserNotification *)&v30 initWithNotificationIdentifier:v16 forPassUniqueIdentifier:v12];

    if (v17)
    {
      p_accountEvent = (id *)&v17->_accountEvent;
      objc_storeStrong((id *)&v17->_accountEvent, a5);
      v17->_featureIdentifier = a6;
      v17->_requiresDebtCollectionNotices = a7;
      p_transactionSourceIdentifier = (id *)&v17->_transactionSourceIdentifier;
      objc_storeStrong((id *)&v17->_transactionSourceIdentifier, a4);
      v20 = [(PKAccountEvent *)v17->_accountEvent date];
      [(PDUserNotification *)v17 setDate:v20];

      if ([(PKAccountEvent *)v17->_accountEvent type] == (id)4)
      {
        v21 = [*p_accountEvent items];
        v22 = [v21 anyObject];

        v23 = [v22 activityIdentifier];
        id v24 = objc_alloc_init((Class)NSMutableDictionary);
        if ([v23 length])
        {
          [(PDUserNotification *)v17 setCustomActionRoute:PKUserNotificationActionRouteViewTransaction];
          [v24 setObject:v23 forKey:PKUserNotificationActionQueryItemTransactionIdentifier];
          if ([*p_transactionSourceIdentifier length]) {
            [v24 setObject:*p_transactionSourceIdentifier forKey:PKUserNotificationActionQueryItemTransactionSourceIdentifier];
          }
          v25 = [v24 copy];
          [(PDUserNotification *)v17 setCustomActionQueryParameters:v25];
        }
        else
        {
          v25 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v22;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Missing activity identifier in dispute %@", buf, 0xCu);
          }
        }
      }
      if ([*p_accountEvent type] == (id)13)
      {
        v26 = [*p_accountEvent items];
        v27 = [v26 anyObject];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v27 reason] == (id)1)
        {
          v28 = +[NSString stringWithFormat:@"https://%@/%@/%@/%@", PKWalletUniversalLinkHostName, PKURLActionRouteAppleCardPaymentPass, PKURLActionRouteCreditPaymentPass, PKURLActionRouteCreditPaymentPassNumbers];
          [(PDUserNotification *)v17 setCustomActionURLString:v28];
        }
      }
    }
  }
  else
  {

    v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassAccountEventUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDPassAccountEventUserNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountEvent"];
    accountEvent = v5->_accountEvent;
    v5->_accountEvent = (PKAccountEvent *)v6;

    v5->_featureIdentifier = (unint64_t)[v4 decodeIntegerForKey:@"accountFeatureIdentifier"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionSourceIdentifier"];
    transactionSourceIdentifier = v5->_transactionSourceIdentifier;
    v5->_transactionSourceIdentifier = (NSString *)v8;

    v5->_requiresDebtCollectionNotices = [v4 decodeBoolForKey:@"debtCollectionNotices"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassAccountEventUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionSourceIdentifier, @"transactionSourceIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_accountEvent forKey:@"accountEvent"];
  [v4 encodeInteger:self->_featureIdentifier forKey:@"accountFeatureIdentifier"];
  [v4 encodeBool:self->_requiresDebtCollectionNotices forKey:@"debtCollectionNotices"];
}

- (unint64_t)notificationType
{
  return 17;
}

- (BOOL)isValid
{
  if ([(PDPassAccountEventUserNotification *)self shouldShowNotification])
  {
    id v4 = [(PKAccountEvent *)self->_accountEvent expirationDate];
    if (v4
      && ([(PKAccountEvent *)self->_accountEvent expirationDate],
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 timeIntervalSinceNow],
          v5 <= 0.0))
    {
      BOOL v6 = 0;
    }
    else
    {
      v7 = [(PKAccountEvent *)self->_accountEvent date];
      [v7 timeIntervalSinceNow];
      BOOL v6 = fabs(v8) <= 43200.0;

      if (!v4)
      {
LABEL_8:

        return v6;
      }
    }

    goto LABEL_8;
  }
  return 0;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PDPassAccountEventUserNotification;
  id v4 = [(PDUserNotification *)&v9 notificationContentWithDataSource:a3];
  if ([(PKAccountEvent *)self->_accountEvent type] == (id)17) {
    [v4 setInterruptionLevel:2];
  }
  double v5 = [(PDPassAccountEventUserNotification *)self _subtitleString];
  [v4 setSubtitle:v5];

  BOOL v6 = [(PDPassAccountEventUserNotification *)self _messageString];
  [v4 setBody:v6];

  v7 = [(PKAccountEvent *)self->_accountEvent date];
  [v4 setDate:v7];

  return v4;
}

- (id)applicationMessageContent
{
  if ([(PDPassAccountEventUserNotification *)self _hasSummaryTile])
  {
    v3 = [(PDPassAccountEventUserNotification *)self _subtitleString];
    id v4 = [(PDPassAccountEventUserNotification *)self _messageString];
    double v5 = [(PDPassAccountEventUserNotification *)self _accountEventApplicationMessageContentWithTitleText:v3 messageText:v4];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (BOOL)_hasSummaryTile
{
  if ([(PKAccountEvent *)self->_accountEvent type] != (id)12) {
    return 0;
  }
  v3 = [(PKAccountEvent *)self->_accountEvent items];
  id v4 = [v3 anyObject];

  unint64_t v5 = (unint64_t)[v4 shippingStatus];
  BOOL v7 = v5 < 5 && (v5 & 0x1F) == 3;

  return v7;
}

- (id)_accountEventApplicationMessageGroupDescriptor
{
  v2 = PKLocalizedFeatureString();
  id v3 = +[PKApplicationMessageGroupDescriptor createForIdentifier:@"PDPassAccountEventApplicationMessageGroupIdentifier" withSingularSummary:v2 pluralSummary:v2];

  return v3;
}

- (id)_accountEventApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PDPassAccountEventUserNotification *)self _accountEventApplicationMessageGroupDescriptor];
  objc_super v9 = [(PDUserNotification *)self actionURL];
  id v10 = +[PKApplicationMessageActionURL createWithURL:v9];
  objc_super v11 = +[PDUserNotification applicationMessageIconForFeature:2];
  id v12 = +[PKApplicationMessageContentDefault createWithGroup:v8 action:v10 icon:v11 title:v7 body:v6];

  return v12;
}

- (BOOL)shouldShowNotification
{
  unsigned int v3 = [(PKAccountEvent *)self->_accountEvent blockNotification];
  if ((v3 & 1) != 0
    || [(PKAccountEvent *)self->_accountEvent updateReasonIsInitialDownload])
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        CFStringRef v5 = @"YES";
      }
      else {
        CFStringRef v5 = @"NO";
      }
      id v6 = [(PKAccountEvent *)self->_accountEvent updateReasonsDescription];
      int v18 = 138412546;
      CFStringRef v19 = v5;
      __int16 v20 = 2112;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Preventing event notification, block: %@, update reasons %@", (uint8_t *)&v18, 0x16u);
    }
    goto LABEL_9;
  }
  LOBYTE(v7) = 1;
  switch((unint64_t)[(PKAccountEvent *)self->_accountEvent type])
  {
    case 1uLL:
    case 2uLL:
    case 5uLL:
    case 8uLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
      objc_super v9 = [(PKAccountEvent *)self->_accountEvent items];
      id v10 = [v9 anyObject];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 reason] == (id)1) {
        goto LABEL_14;
      }
      goto LABEL_29;
    case 4uLL:
      objc_super v11 = [(PKAccountEvent *)self->_accountEvent items];
      id v10 = [v11 anyObject];

      if (!v10)
      {
        LOBYTE(v7) = 0;
        goto LABEL_27;
      }
      id v7 = [v10 activityIdentifier];

      if (!v7) {
        goto LABEL_27;
      }
      if ((char *)[v10 status] - 3 <= (char *)2
        && ((unint64_t)[v10 activityType] | 4) == 5)
      {
        LOBYTE(v7) = 1;
LABEL_27:

        return (char)v7;
      }
LABEL_29:

LABEL_9:
      LOBYTE(v7) = 0;
      return (char)v7;
    case 6uLL:
    case 7uLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      return (char)v7;
    case 0xBuLL:
      id v12 = [(PKAccountEvent *)self->_accountEvent items];
      id v10 = [v12 anyObject];

      if ([v10 reason] != (id)7) {
        goto LABEL_29;
      }
      id v13 = [v10 updatedPhysicalCards];
      id v14 = [v13 firstObject];
      v15 = [v14 latestOrderActivity];

      if (!v15 || (char *)[v15 activity] - 3 >= (char *)2)
      {

        goto LABEL_29;
      }

LABEL_14:
LABEL_25:
      LOBYTE(v7) = 1;
      return (char)v7;
    case 0xCuLL:
      v16 = [(PKAccountEvent *)self->_accountEvent items];
      v17 = [v16 anyObject];

      [v17 shippingStatus];
      goto LABEL_25;
    default:
      goto LABEL_9;
  }
}

- (id)_subtitleString
{
  unsigned int v3 = 0;
  switch((unint64_t)[(PKAccountEvent *)self->_accountEvent type])
  {
    case 1uLL:
    case 5uLL:
    case 8uLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
      id v4 = [(PKAccountEvent *)self->_accountEvent items];
      CFStringRef v5 = [v4 anyObject];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [v5 reason] != (id)1) {
        goto LABEL_15;
      }
      goto LABEL_12;
    case 4uLL:
    case 6uLL:
    case 7uLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      unsigned int v3 = PKLocalizedFeatureString();
      goto LABEL_16;
    case 0xBuLL:
      id v6 = [(PKAccountEvent *)self->_accountEvent items];
      CFStringRef v5 = [v6 anyObject];

      if ([v5 reason] != (id)7) {
        goto LABEL_15;
      }
      id v7 = [v5 updatedPhysicalCards];
      double v8 = [v7 firstObject];
      objc_super v9 = [v8 latestOrderActivity];

      if (v9 && ((id v10 = [v9 activity], v10 == (id)3) || v10 == (id)4))
      {
        unsigned int v3 = PKLocalizedFeatureString();

LABEL_13:
      }
      else
      {

LABEL_15:
        unsigned int v3 = 0;
      }
LABEL_16:
      return v3;
    case 0xCuLL:
      objc_super v11 = [(PKAccountEvent *)self->_accountEvent items];
      CFStringRef v5 = [v11 anyObject];

      if ((char *)[v5 shippingStatus] - 1 > (char *)3) {
        goto LABEL_15;
      }
LABEL_12:
      unsigned int v3 = PKLocalizedFeatureString();
      goto LABEL_13;
    default:
      goto LABEL_16;
  }
}

- (id)_messageString
{
  unsigned int v3 = 0;
  switch((unint64_t)[(PKAccountEvent *)self->_accountEvent type])
  {
    case 1uLL:
    case 5uLL:
    case 8uLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
      id v4 = [(PKAccountEvent *)self->_accountEvent items];
      CFStringRef v5 = [v4 anyObject];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [v5 reason] != (id)1) {
        goto LABEL_21;
      }
      goto LABEL_10;
    case 4uLL:
      id v6 = [(PKAccountEvent *)self->_accountEvent items];
      CFStringRef v5 = [v6 anyObject];

      id v7 = objc_alloc_init((Class)NSDateFormatter);
      [v7 setDateStyle:2];
      double v8 = [v5 openDate];
      objc_super v9 = [v7 stringFromDate:v8];
      goto LABEL_8;
    case 6uLL:
      id v10 = [(PKAccountEvent *)self->_accountEvent items];
      CFStringRef v5 = [v10 anyObject];

      id v7 = [v5 currencyAmount];
      if (!v7) {
        goto LABEL_22;
      }
      double v8 = [v5 currencyAmount];
      objc_super v9 = [v8 minimalFormattedStringValue];
LABEL_8:
      unsigned int v3 = PKLocalizedFeatureString();

      goto LABEL_24;
    case 7uLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      CFStringRef v5 = PDDeviceSpecificLocalizedStringKeyForKey();
LABEL_10:
      unsigned int v3 = PKLocalizedFeatureString();
      goto LABEL_25;
    case 0xBuLL:
      objc_super v11 = [(PKAccountEvent *)self->_accountEvent items];
      CFStringRef v5 = [v11 anyObject];

      if ([v5 reason] != (id)7) {
        goto LABEL_21;
      }
      id v12 = [v5 updatedPhysicalCards];
      id v13 = [v12 firstObject];
      id v7 = [v13 latestOrderActivity];

      if (v7 && ((id v14 = [v7 activity], v14 == (id)3) || v14 == (id)4))
      {
LABEL_22:
        uint64_t v17 = PKLocalizedFeatureString();
LABEL_23:
        unsigned int v3 = (void *)v17;
LABEL_24:
      }
      else
      {

LABEL_21:
        unsigned int v3 = 0;
      }
LABEL_25:

LABEL_26:
      return v3;
    case 0xCuLL:
      v15 = [(PKAccountEvent *)self->_accountEvent items];
      CFStringRef v5 = [v15 anyObject];

      switch((unint64_t)[v5 shippingStatus])
      {
        case 1uLL:
          v16 = [v5 estimatedDeliveryDate];

          if (!v16) {
            goto LABEL_10;
          }
          id v7 = [v5 formattedEstimatedDeliveryDate];
          uint64_t v17 = PKLocalizedFeatureString();
          break;
        case 2uLL:
        case 3uLL:
        case 4uLL:
          goto LABEL_10;
        default:
          goto LABEL_21;
      }
      goto LABEL_23;
    default:
      goto LABEL_26;
  }
}

- (PKAccountEvent)accountEvent
{
  return self->_accountEvent;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (BOOL)requiresDebtCollectionNotices
{
  return self->_requiresDebtCollectionNotices;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_accountEvent, 0);
}

@end
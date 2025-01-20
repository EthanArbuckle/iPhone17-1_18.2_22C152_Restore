@interface PDUserNotification
+ (BOOL)allowReinsertionAfterDismissal;
+ (BOOL)supportsCoalescing;
+ (BOOL)supportsSecureCoding;
+ (id)applicationMessageIconForFeature:(unint64_t)a3;
- (BOOL)allowPresentationOverPass;
- (BOOL)applicationMessageBadge;
- (BOOL)isActive;
- (BOOL)isCashFamilyNotification;
- (BOOL)isServiceNotification;
- (BOOL)isSuppressed;
- (BOOL)isValid;
- (BOOL)needsNotificationSettings;
- (BOOL)playsSound;
- (BOOL)preventAutomaticDismissal;
- (BOOL)reissueBannerOnUpdate;
- (NSDate)date;
- (NSDictionary)customActionQueryParameters;
- (NSString)accountIdentifier;
- (NSString)customActionRoute;
- (NSString)customActionTitle;
- (NSString)customActionURLString;
- (NSString)customActionVerb;
- (NSString)notificationIdentifier;
- (NSString)passUniqueIdentifier;
- (PDUserNotification)initWithCoder:(id)a3;
- (PDUserNotification)initWithNotificationIdentifier:(id)a3 forAccountIdentifier:(id)a4;
- (PDUserNotification)initWithNotificationIdentifier:(id)a3 forPassUniqueIdentifier:(id)a4;
- (PKApplicationMessageContent)applicationMessageContent;
- (id)_payLaterApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4;
- (id)_payLaterApplicationMessageGroupDescriptor;
- (id)actionURL;
- (id)description;
- (id)notificationContentWithDataSource:(id)a3;
- (int64_t)assetType;
- (unint64_t)coalesceWithExistingUserNotification:(id)a3;
- (unint64_t)familyNotificationType;
- (unint64_t)insertionRequirements;
- (unint64_t)notificationType;
- (unint64_t)suppressionBehavior;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAllowPresentationOverPass:(BOOL)a3;
- (void)setApplicationMessageBadge:(BOOL)a3;
- (void)setApplicationMessageContent:(id)a3;
- (void)setAssetType:(int64_t)a3;
- (void)setCustomActionQueryParameters:(id)a3;
- (void)setCustomActionRoute:(id)a3;
- (void)setCustomActionTitle:(id)a3;
- (void)setCustomActionURLString:(id)a3;
- (void)setCustomActionVerb:(id)a3;
- (void)setDate:(id)a3;
- (void)setFamilyNotificationType:(unint64_t)a3;
- (void)setInsertionRequirements:(unint64_t)a3;
- (void)setIsServiceNotification:(BOOL)a3;
- (void)setNotificationIdentifier:(id)a3;
- (void)setPlaysSound:(BOOL)a3;
- (void)setPreventAutomaticDismissal:(BOOL)a3;
- (void)setReissueBannerOnUpdate:(BOOL)a3;
- (void)setSuppressed:(BOOL)a3;
- (void)setSuppressionBehavior:(unint64_t)a3;
- (void)updatePassNameForNotificationContent:(id)a3 dataSource:(id)a4;
@end

@implementation PDUserNotification

- (PDUserNotification)initWithNotificationIdentifier:(id)a3 forPassUniqueIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PDUserNotification;
  v9 = [(PDUserNotification *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationIdentifier, a3);
    v11 = (NSString *)[v8 copy];
    passUniqueIdentifier = v10->_passUniqueIdentifier;
    v10->_passUniqueIdentifier = v11;

    uint64_t v13 = +[NSDate date];
    date = v10->_date;
    v10->_date = (NSDate *)v13;

    v10->_active = 1;
  }

  return v10;
}

- (PDUserNotification)initWithNotificationIdentifier:(id)a3 forAccountIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PDUserNotification;
  v9 = [(PDUserNotification *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationIdentifier, a3);
    v11 = (NSString *)[v8 copy];
    accountIdentifier = v10->_accountIdentifier;
    v10->_accountIdentifier = v11;

    uint64_t v13 = +[NSDate date];
    date = v10->_date;
    v10->_date = (NSDate *)v13;

    v10->_active = 1;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PDUserNotification;
  v5 = [(PDUserNotification *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationIdentifier"];
    notificationIdentifier = v5->_notificationIdentifier;
    v5->_notificationIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customActionRoute"];
    customActionRoute = v5->_customActionRoute;
    v5->_customActionRoute = (NSString *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"customActionQueryParameters"];
    customActionQueryParameters = v5->_customActionQueryParameters;
    v5->_customActionQueryParameters = (NSDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customActionTitle"];
    customActionTitle = v5->_customActionTitle;
    v5->_customActionTitle = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v18;

    v5->_insertionRequirements = (unint64_t)[v4 decodeIntegerForKey:@"insertionRequirements"];
    v5->_suppressionBehavior = (unint64_t)[v4 decodeIntegerForKey:@"suppressionBehavior"];
    v5->_allowPresentationOverPass = [v4 decodeBoolForKey:@"allowPresentationOverPass"];
    v5->_reissueBannerOnUpdate = [v4 decodeBoolForKey:@"reissueBannerOnUpdate"];
    v5->_active = [v4 decodeBoolForKey:@"active"];
    v5->_suppressed = [v4 decodeBoolForKey:@"suppressed"];
    v5->_playsSound = [v4 decodeBoolForKey:@"playsSound"];
    v5->_preventAutomaticDismissal = [v4 decodeBoolForKey:@"preventAutomaticDismissal"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationMessageContent"];
    applicationMessageContent = v5->_applicationMessageContent;
    v5->_applicationMessageContent = (PKApplicationMessageContent *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v22;

    v5->_assetType = (int64_t)[v4 decodeIntegerForKey:@"assetType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  notificationIdentifier = self->_notificationIdentifier;
  id v5 = a3;
  [v5 encodeObject:notificationIdentifier forKey:@"notificationIdentifier"];
  [v5 encodeObject:self->_passUniqueIdentifier forKey:@"passUniqueIdentifier"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeObject:self->_customActionRoute forKey:@"customActionRoute"];
  [v5 encodeObject:self->_customActionQueryParameters forKey:@"customActionQueryParameters"];
  [v5 encodeObject:self->_customActionTitle forKey:@"customActionTitle"];
  [v5 encodeInteger:self->_insertionRequirements forKey:@"insertionRequirements"];
  [v5 encodeInteger:self->_suppressionBehavior forKey:@"suppressionBehavior"];
  [v5 encodeBool:self->_allowPresentationOverPass forKey:@"allowPresentationOverPass"];
  [v5 encodeBool:self->_reissueBannerOnUpdate forKey:@"reissueBannerOnUpdate"];
  [v5 encodeBool:self->_active forKey:@"active"];
  [v5 encodeBool:self->_suppressed forKey:@"suppressed"];
  [v5 encodeBool:self->_playsSound forKey:@"playsSound"];
  [v5 encodeBool:self->_preventAutomaticDismissal forKey:@"preventAutomaticDismissal"];
  [v5 encodeObject:self->_applicationMessageContent forKey:@"applicationMessageContent"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeInteger:self->_assetType forKey:@"assetType"];
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)PDUserNotification;
  v3 = [(PDUserNotification *)&v16 description];
  notificationIdentifier = self->_notificationIdentifier;
  id v5 = [(PDUserNotification *)self passUniqueIdentifier];
  date = self->_date;
  unint64_t suppressionBehavior = self->_suppressionBehavior;
  if (suppressionBehavior > 2) {
    CFStringRef v8 = @"unknown";
  }
  else {
    CFStringRef v8 = off_100744180[suppressionBehavior];
  }
  if (self->_suppressed) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  if (self->_active) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  if (self->_preventAutomaticDismissal) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  if (self->_reissueBannerOnUpdate) {
    CFStringRef v12 = @"YES";
  }
  else {
    CFStringRef v12 = @"NO";
  }
  uint64_t v13 = [(PDUserNotification *)self accountIdentifier];
  uint64_t v14 = +[NSString stringWithFormat:@"[%@ Notification Identifier: %@, Pass Identifier: %@, Date: %@, Active: %@, Suppressed: %@, Suppression Behavior: %@, Prevents Automatic Dismissal: %@, reissueBannerOnUpdate: %@, Account Identifier: %@]", v3, notificationIdentifier, v5, date, v10, v9, v8, v11, v12, v13];

  return v14;
}

- (BOOL)isCashFamilyNotification
{
  return (id)[(PDUserNotification *)self familyNotificationType] == (id)1;
}

- (unint64_t)familyNotificationType
{
  return 0;
}

+ (BOOL)allowReinsertionAfterDismissal
{
  return 1;
}

+ (BOOL)supportsCoalescing
{
  return 0;
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)notificationType
{
  return 0;
}

- (unint64_t)coalesceWithExistingUserNotification:(id)a3
{
  return 0;
}

- (id)actionURL
{
  unsigned int v3 = +[PKWalletVisibility isWalletVisible];
  id v4 = [(PDUserNotification *)self customActionURLString];
  id v5 = [v4 length];
  if (v5)
  {
    id v6 = [objc_alloc((Class)NSURLComponents) initWithString:v4];
    if (v3)
    {
LABEL_3:
      id v7 = [v6 queryItems];
      BOOL v8 = [v7 count] == 0;

      goto LABEL_6;
    }
  }
  else
  {
    id v6 = 0;
    if (v3) {
      goto LABEL_3;
    }
  }
  BOOL v8 = 0;
LABEL_6:
  id v9 = objc_alloc((Class)NSMutableDictionary);
  CFStringRef v10 = [(PDUserNotification *)self customActionQueryParameters];
  id v11 = [v9 initWithDictionary:v10];

  CFStringRef v12 = [(PDUserNotification *)self notificationIdentifier];
  [v11 setObject:v12 forKey:PKUserNotificationQueryItemApplicationMessageContentIdentifier];

  if (![v11 count])
  {
    uint64_t v13 = &stru_10075AAD8;
    if (v5) {
      goto LABEL_8;
    }
LABEL_10:
    objc_super v16 = [(PDUserNotification *)self customActionRoute];
    if (![v16 length])
    {
      v17 = [(PDUserNotification *)self passUniqueIdentifier];
      if (![v17 length])
      {
        id v30 = [v11 count];

        if (!v30)
        {
          v15 = 0;
          goto LABEL_36;
        }
LABEL_14:
        uint64_t v18 = @"prefs:root=PASSBOOK";
        if (v3)
        {
          uint64_t v18 = @"shoebox://";
          v19 = @"%@%@%@";
        }
        else
        {
          v19 = @"%@&path=%@%@";
        }
        uint64_t v20 = v18;
        v21 = v19;
        uint64_t v22 = [(PDUserNotification *)self customActionRoute];
        v23 = (void *)v22;
        v24 = (void *)PKUserNotificationActionRouteViewPass;
        if (v22) {
          v24 = (void *)v22;
        }
        id v25 = v24;

        v26 = [(PDUserNotification *)self passUniqueIdentifier];
        if (v26
          && ([v25 isEqualToString:PKUserNotificationActionRouteViewTransaction] & 1) == 0
          && ([v25 containsString:PKURLActionRoutePeerPaymentPass] & 1) == 0
          && ([v25 containsString:PKURLActionRouteCreditPaymentPass] & 1) == 0
          && ([v25 containsString:PKUserNotificationActionRoutePayLaterViewFinancingPlan] & 1) == 0)
        {
          unsigned __int8 v33 = [v25 containsString:PKURLActionRouteSavings];

          if (v33)
          {
LABEL_34:
            uint64_t v14 = PKStringWithValidatedFormat();

            v15 = +[NSURL URLWithString:](NSURL, "URLWithString:", v14, v20, v25, v13);

            goto LABEL_35;
          }
          v26 = +[NSCharacterSet alphanumericCharacterSet];
          v32 = [(PDUserNotification *)self passUniqueIdentifier];
          v34 = [v32 stringByAddingPercentEncodingWithAllowedCharacters:v26];

          if (v3)
          {
            id v27 = [v25 stringByAppendingPathComponent:v34];

            id v25 = [(PDUserNotification *)self customActionVerb];
            if (v25)
            {
              uint64_t v28 = [v27 stringByAppendingPathComponent:v25];

              id v27 = (id)v28;
            }
            v29 = v34;
          }
          else
          {
            v29 = v34;
            id v27 = v34;
          }

          id v25 = v27;
        }

        goto LABEL_34;
      }
    }
    goto LABEL_14;
  }
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  char v44 = 1;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_100020A6C;
  v41 = sub_100021028;
  id v42 = objc_alloc_init((Class)NSMutableArray);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10027D3E0;
  v35[3] = &unk_1007440F8;
  BOOL v36 = v8;
  v35[4] = v43;
  v35[5] = &v37;
  [v11 enumerateKeysAndObjectsUsingBlock:v35];
  uint64_t v13 = [(id)v38[5] componentsJoinedByString:&stru_10075AAD8];
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(v43, 8);
  if (!v5) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v14 = +[NSString stringWithFormat:@"%@%@", v4, v13];
  v15 = +[NSURL URLWithString:v14];
LABEL_35:

LABEL_36:
  return v15;
}

+ (id)applicationMessageIconForFeature:(unint64_t)a3
{
  CFURLRef v3 = 0;
  id v4 = 0;
  switch(a3)
  {
    case 1uLL:
      id v5 = PKPassKitUIBundle();
      id v6 = v5;
      CFStringRef v7 = @"AppleCashIcon";
      goto LABEL_7;
    case 2uLL:
      id v5 = PKPassKitUIBundle();
      id v6 = v5;
      CFStringRef v7 = @"AppleCardIcon";
      goto LABEL_7;
    case 3uLL:
      BOOL v8 = PKPassKitUIBundle();
      id v9 = +[PKImage imageNamed:@"PayLater_welcome_icon" inBundle:v8];

      CFURLRef v3 = 0;
      if (!v9) {
        goto LABEL_5;
      }
      goto LABEL_9;
    case 5uLL:
      id v5 = PKPassKitUIBundle();
      id v6 = v5;
      CFStringRef v7 = @"SAVINGS_Icon";
LABEL_7:
      CFURLRef v3 = [v5 URLForResource:v7 withExtension:@"pdf"];

      id v4 = CGPDFDocumentCreateWithURL(v3);
      if (v4)
      {
        +[PKApplicationMessageIcon maximumSizeForStyle:0];
        PKScreenScale();
        id v9 = PKGetImageFromPDFDocument();
        CGPDFDocumentRelease(v4);
        if (v9)
        {
LABEL_9:
          id v10 = +[PKImageDescriptorBitmap createForImage:v9 withTintColor:0];
          id v4 = (CGPDFDocument *)+[PKApplicationMessageIcon createWithImage:v10 style:0];
        }
        else
        {
LABEL_5:
          id v4 = 0;
        }
      }
      break;
    default:
      break;
  }

  return v4;
}

- (id)notificationContentWithDataSource:(id)a3
{
  id v4 = objc_alloc_init((Class)UNMutableNotificationContent);
  id v5 = [(PDUserNotification *)self actionURL];
  [v4 setDefaultActionURL:v5];

  id v6 = [(PDUserNotification *)self customActionTitle];

  if (v6)
  {
    CFStringRef v7 = [(PDUserNotification *)self customActionTitle];
    [v4 setDefaultActionTitle:v7];
  }
  [v4 setDate:self->_date];
  [v4 setShouldPreventNotificationDismissalAfterDefaultAction:self->_preventAutomaticDismissal];
  if (self->_playsSound)
  {
    BOOL v8 = +[UNNotificationSound soundWithAlertType:20];
    [v4 setSound:v8];
  }
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = [(PDUserNotification *)self passUniqueIdentifier];

  if (v10)
  {
    id v11 = [(PDUserNotification *)self passUniqueIdentifier];
    [v9 setObject:v11 forKeyedSubscript:PKPassbookBulletinPassUniqueIdentifierKey];

    [(PDUserNotification *)self allowPresentationOverPass];
  }
  if ([(PDUserNotification *)self isCashFamilyNotification]) {
    [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:PKUserNotificationIsCashFamilyNotificationKey];
  }
  [v4 setUserInfo:v9];

  return v4;
}

- (unint64_t)insertionRequirements
{
  return self->_insertionRequirements;
}

- (void)setInsertionRequirements:(unint64_t)a3
{
  self->_insertionRequirements = a3;
}

- (unint64_t)suppressionBehavior
{
  return self->_suppressionBehavior;
}

- (void)setSuppressionBehavior:(unint64_t)a3
{
  self->_unint64_t suppressionBehavior = a3;
}

- (BOOL)allowPresentationOverPass
{
  return self->_allowPresentationOverPass;
}

- (void)setAllowPresentationOverPass:(BOOL)a3
{
  self->_allowPresentationOverPass = a3;
}

- (BOOL)reissueBannerOnUpdate
{
  return self->_reissueBannerOnUpdate;
}

- (void)setReissueBannerOnUpdate:(BOOL)a3
{
  self->_reissueBannerOnUpdate = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isSuppressed
{
  return self->_suppressed;
}

- (void)setSuppressed:(BOOL)a3
{
  self->_suppressed = a3;
}

- (BOOL)needsNotificationSettings
{
  return self->_needsNotificationSettings;
}

- (BOOL)playsSound
{
  return self->_playsSound;
}

- (void)setPlaysSound:(BOOL)a3
{
  self->_playsSound = a3;
}

- (BOOL)preventAutomaticDismissal
{
  return self->_preventAutomaticDismissal;
}

- (void)setPreventAutomaticDismissal:(BOOL)a3
{
  self->_preventAutomaticDismissal = a3;
}

- (BOOL)isServiceNotification
{
  return self->_isServiceNotification;
}

- (void)setIsServiceNotification:(BOOL)a3
{
  self->_isServiceNotification = a3;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (NSString)notificationIdentifier
{
  return self->_notificationIdentifier;
}

- (void)setNotificationIdentifier:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)customActionRoute
{
  return self->_customActionRoute;
}

- (void)setCustomActionRoute:(id)a3
{
}

- (NSString)customActionVerb
{
  return self->_customActionVerb;
}

- (void)setCustomActionVerb:(id)a3
{
}

- (NSString)customActionURLString
{
  return self->_customActionURLString;
}

- (void)setCustomActionURLString:(id)a3
{
}

- (NSDictionary)customActionQueryParameters
{
  return self->_customActionQueryParameters;
}

- (void)setCustomActionQueryParameters:(id)a3
{
}

- (NSString)customActionTitle
{
  return self->_customActionTitle;
}

- (void)setCustomActionTitle:(id)a3
{
}

- (PKApplicationMessageContent)applicationMessageContent
{
  return self->_applicationMessageContent;
}

- (void)setApplicationMessageContent:(id)a3
{
}

- (BOOL)applicationMessageBadge
{
  return self->_applicationMessageBadge;
}

- (void)setApplicationMessageBadge:(BOOL)a3
{
  self->_applicationMessageBadge = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (int64_t)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(int64_t)a3
{
  self->_assetType = a3;
}

- (void)setFamilyNotificationType:(unint64_t)a3
{
  self->_familyNotificationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationMessageContent, 0);
  objc_storeStrong((id *)&self->_customActionTitle, 0);
  objc_storeStrong((id *)&self->_customActionQueryParameters, 0);
  objc_storeStrong((id *)&self->_customActionURLString, 0);
  objc_storeStrong((id *)&self->_customActionVerb, 0);
  objc_storeStrong((id *)&self->_customActionRoute, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_notificationIdentifier, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

- (void)updatePassNameForNotificationContent:(id)a3 dataSource:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  CFStringRef v7 = [(PDUserNotification *)self passUniqueIdentifier];
  BOOL v8 = [v6 passWithUniqueIdentifier:v7];

  id v9 = [v8 localizedDescription];
  id v10 = [v8 notificationCenterTitle];
  id v11 = [v9 caseInsensitiveCompare:v10];

  if (v11) {
    [v12 setTitle:v9];
  }
}

- (id)_payLaterApplicationMessageGroupDescriptor
{
  v2 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_SUMMARY");
  id v3 = +[PKApplicationMessageGroupDescriptor createForIdentifier:@"PayLaterApplicationMessageGroupIdentifier" withSingularSummary:v2 pluralSummary:v2];

  return v3;
}

- (id)_payLaterApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(PDUserNotification *)self _payLaterApplicationMessageGroupDescriptor];
  id v9 = [(PDUserNotification *)self actionURL];
  id v10 = +[PKApplicationMessageActionURL createWithURL:v9];
  id v11 = +[PDUserNotification applicationMessageIconForFeature:3];
  id v12 = +[PKApplicationMessageContentDefault createWithGroup:v8 action:v10 icon:v11 title:v7 body:v6];

  return v12;
}

@end
@interface PDPassExpressModeEnabledUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)promotionActive;
- (NSDate)promoteEndDate;
- (PDPassExpressModeEnabledUserNotification)initWithCoder:(id)a3;
- (PDPassExpressModeEnabledUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5;
- (PDPassExpressModeEnabledUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 hideDisableAction:(unint64_t)a6 promoteDuration:(double)a7;
- (id)initAsUnpromotedReplacementForNotification:(id)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)hideDisableAction;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassExpressModeEnabledUserNotification

- (PDPassExpressModeEnabledUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 hideDisableAction:(unint64_t)a6 promoteDuration:(double)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init((Class)NSMutableArray);
  [v15 safelyAddObject:v14];
  [v15 safelyAddObject:v13];
  [v15 safelyAddObject:v12];
  v16 = +[NSNumber numberWithUnsignedInteger:a6];
  [v15 safelyAddObject:v16];

  v17 = +[NSNumber numberWithDouble:a7];
  [v15 safelyAddObject:v17];

  v18 = [(PDGenericUserNotification *)self _initWithTitle:v14 subtitle:0 message:v13 forPassUniqueIdentifier:v12 hashComponents:v15];
  if (v18)
  {
    [(PDUserNotification *)v18 setCustomActionRoute:PKUserNotificationActionRouteViewPass];
    [(PDUserNotification *)v18 setCustomActionVerb:PKUserNotificationActionRouteViewPassExpressPromotion];
    v18->_hideDisableAction = a6;
    if (a6)
    {
      CFStringRef v19 = @"true";
      if (a6 != 1) {
        CFStringRef v19 = 0;
      }
      if (a6 == 2) {
        CFStringRef v19 = @"false";
      }
      uint64_t v25 = PKUserNotificationActionQueryItemExpressModeEnabledHideDisableAction;
      CFStringRef v26 = v19;
      v20 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      [(PDUserNotification *)v18 setCustomActionQueryParameters:v20];
    }
    if (a7 > 0.0)
    {
      v21 = [(PDUserNotification *)v18 date];
      uint64_t v22 = [v21 dateByAddingTimeInterval:a7];
      promoteEndDate = v18->_promoteEndDate;
      v18->_promoteEndDate = (NSDate *)v22;
    }
  }

  return v18;
}

- (id)initAsUnpromotedReplacementForNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  v6 = [v4 message];
  v7 = [v4 passUniqueIdentifier];
  v8 = -[PDPassExpressModeEnabledUserNotification initWithTitle:message:forPassUniqueIdentifier:hideDisableAction:promoteDuration:](self, "initWithTitle:message:forPassUniqueIdentifier:hideDisableAction:promoteDuration:", v5, v6, v7, [v4 hideDisableAction], 0.0);

  if (v8)
  {
    v9 = [v4 date];
    [(PDUserNotification *)v8 setDate:v9];

    [(PDUserNotification *)v8 setSuppressionBehavior:2];
    v10 = [v4 customActionQueryParameters];
    [(PDUserNotification *)v8 setCustomActionQueryParameters:v10];
  }
  return v8;
}

- (PDPassExpressModeEnabledUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5
{
  return [(PDPassExpressModeEnabledUserNotification *)self initWithTitle:a3 message:a4 forPassUniqueIdentifier:a5 hideDisableAction:0 promoteDuration:0.0];
}

- (BOOL)promotionActive
{
  promoteEndDate = self->_promoteEndDate;
  if (promoteEndDate)
  {
    v3 = +[NSDate date];
    LOBYTE(promoteEndDate) = (id)[(NSDate *)promoteEndDate compare:v3] == (id)1;
  }
  return (char)promoteEndDate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassExpressModeEnabledUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PDPassExpressModeEnabledUserNotification;
  v5 = [(PDGenericUserNotification *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hideDisableAction"];
    v5->_hideDisableAction = (unint64_t)[v6 integerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"promotionEndDate"];
    promoteEndDate = v5->_promoteEndDate;
    v5->_promoteEndDate = (NSDate *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDPassExpressModeEnabledUserNotification;
  id v4 = a3;
  [(PDGenericUserNotification *)&v6 encodeWithCoder:v4];
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_hideDisableAction, v6.receiver, v6.super_class);
  [v4 encodeObject:v5 forKey:@"hideDisableAction"];

  [v4 encodeObject:self->_promoteEndDate forKey:@"promotionEndDate"];
}

- (unint64_t)notificationType
{
  v2 = [(PDPassExpressModeEnabledUserNotification *)self promoteEndDate];

  if (v2) {
    return 32;
  }
  else {
    return 28;
  }
}

- (id)notificationContentWithDataSource:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassExpressModeEnabledUserNotification;
  v3 = [(PDGenericUserNotification *)&v5 notificationContentWithDataSource:a3];
  return v3;
}

- (unint64_t)hideDisableAction
{
  return self->_hideDisableAction;
}

- (NSDate)promoteEndDate
{
  return self->_promoteEndDate;
}

- (void).cxx_destruct
{
}

@end
@interface CSDPTTServiceUpdatePushBudget
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCSDPTTServiceUpdatePushBudget:(id)a3;
- (CSDPTTServiceUpdatePushBudget)initWithApplicationBundleIdentifier:(id)a3 budgetStartTime:(id)a4 serviceUpdatesDelivered:(int64_t)a5;
- (CSDPTTServiceUpdatePushBudget)initWithCoder:(id)a3;
- (NSDate)budgetStartTime;
- (NSString)applicationBundleIdentifier;
- (id)archivedDataWithError:(id *)a3;
- (int64_t)serviceUpdatesDelivered;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setBudgetStartTime:(id)a3;
- (void)setServiceUpdatesDelivered:(int64_t)a3;
@end

@implementation CSDPTTServiceUpdatePushBudget

- (CSDPTTServiceUpdatePushBudget)initWithApplicationBundleIdentifier:(id)a3 budgetStartTime:(id)a4 serviceUpdatesDelivered:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CSDPTTServiceUpdatePushBudget;
  v10 = [(CSDPTTServiceUpdatePushBudget *)&v16 init];
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        v11 = (NSString *)[v8 copy];
        applicationBundleIdentifier = v10->_applicationBundleIdentifier;
        v10->_applicationBundleIdentifier = v11;

        v13 = (NSDate *)[v9 copy];
        budgetStartTime = v10->_budgetStartTime;
        v10->_budgetStartTime = v13;

        v10->_serviceUpdatesDelivered = a5;
        goto LABEL_5;
      }
    }
    else
    {
      +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"%s: parameter '%@' cannot be nil", "-[CSDPTTServiceUpdatePushBudget initWithApplicationBundleIdentifier:budgetStartTime:serviceUpdatesDelivered:]", @"applicationBundleIdentifier");
      if (v9) {
        goto LABEL_4;
      }
    }
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"%s: parameter '%@' cannot be nil", "-[CSDPTTServiceUpdatePushBudget initWithApplicationBundleIdentifier:budgetStartTime:serviceUpdatesDelivered:]", @"budgetStartTime");
    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  id v5 = a3;
  v6 = NSStringFromSelector("applicationBundleIdentifier");
  [v5 encodeObject:applicationBundleIdentifier forKey:v6];

  budgetStartTime = self->_budgetStartTime;
  id v8 = NSStringFromSelector("budgetStartTime");
  [v5 encodeObject:budgetStartTime forKey:v8];

  uint64_t serviceUpdatesDelivered_low = LODWORD(self->_serviceUpdatesDelivered);
  NSStringFromSelector("serviceUpdatesDelivered");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInt:serviceUpdatesDelivered_low forKey:v10];
}

- (CSDPTTServiceUpdatePushBudget)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSDPTTServiceUpdatePushBudget;
  id v5 = [(CSDPTTServiceUpdatePushBudget *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("applicationBundleIdentifier");
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector("budgetStartTime");
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    budgetStartTime = v5->_budgetStartTime;
    v5->_budgetStartTime = (NSDate *)v12;

    v14 = NSStringFromSelector("serviceUpdatesDelivered");
    v5->_serviceUpdatesDelivered = (int)[v4 decodeIntForKey:v14];
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_applicationBundleIdentifier hash];
  return (unint64_t)[(NSDate *)self->_budgetStartTime hash] ^ v3 ^ self->_serviceUpdatesDelivered;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CSDPTTServiceUpdatePushBudget *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(CSDPTTServiceUpdatePushBudget *)self isEqualToCSDPTTServiceUpdatePushBudget:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToCSDPTTServiceUpdatePushBudget:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 applicationBundleIdentifier];
  if (TUObjectsAreEqualOrNil())
  {
    uint64_t v6 = [v4 budgetStartTime];
    if (TUObjectsAreEqualOrNil())
    {
      id serviceUpdatesDelivered = self->_serviceUpdatesDelivered;
      BOOL v8 = serviceUpdatesDelivered == [v4 serviceUpdatesDelivered];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)archivedDataWithError:(id *)a3
{
  return +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, v3, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 unarchivedObjectClasses];
  BOOL v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v7 fromData:v6 error:a4];

  return v8;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSDate)budgetStartTime
{
  return self->_budgetStartTime;
}

- (void)setBudgetStartTime:(id)a3
{
}

- (int64_t)serviceUpdatesDelivered
{
  return self->_serviceUpdatesDelivered;
}

- (void)setServiceUpdatesDelivered:(int64_t)a3
{
  self->_id serviceUpdatesDelivered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budgetStartTime, 0);

  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

@end
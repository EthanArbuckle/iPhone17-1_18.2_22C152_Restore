@interface TPSAnalyticsEventContentEligibilityMet
+ (BOOL)supportsSecureCoding;
+ (id)eventWithContentID:(id)a3 bundleID:(id)a4 eligibleContext:(id)a5 displayType:(unint64_t)a6 usageFlags:(unint64_t)a7 date:(id)a8;
- (NSArray)eligibleContext;
- (NSString)bundleID;
- (NSString)contentID;
- (TPSAnalyticsEventContentEligibilityMet)initWithCoder:(id)a3;
- (id)_initWithContentID:(id)a3 bundleID:(id)a4 eligibleContext:(id)a5 displayType:(unint64_t)a6 usageFlags:(unint64_t)a7 date:(id)a8;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (unint64_t)displayType;
- (unint64_t)usageFlags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSAnalyticsEventContentEligibilityMet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventContentEligibilityMet)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TPSAnalyticsEventContentEligibilityMet;
  v5 = [(TPSAnalyticsEvent *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentID"];
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"eligibleContext"];
    eligibleContext = v5->_eligibleContext;
    v5->_eligibleContext = (NSArray *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayType"];
    v5->_displayType = [v15 unsignedIntegerValue];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usageFlags"];
    v5->_usageFlags = [v16 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSAnalyticsEventContentEligibilityMet;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentID, @"contentID", v7.receiver, v7.super_class);
  [v4 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v4 encodeObject:self->_eligibleContext forKey:@"eligibleContext"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_displayType];
  [v4 encodeObject:v5 forKey:@"displayType"];

  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_usageFlags];
  [v4 encodeObject:v6 forKey:@"usageFlags"];
}

- (id)_initWithContentID:(id)a3 bundleID:(id)a4 eligibleContext:(id)a5 displayType:(unint64_t)a6 usageFlags:(unint64_t)a7 date:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsEventContentEligibilityMet;
  objc_super v18 = [(TPSAnalyticsEvent *)&v21 initWithDate:a8];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contentID, a3);
    objc_storeStrong((id *)&v19->_bundleID, a4);
    objc_storeStrong((id *)&v19->_eligibleContext, a5);
    v19->_displayType = a6;
    v19->_usageFlags = a7;
  }

  return v19;
}

+ (id)eventWithContentID:(id)a3 bundleID:(id)a4 eligibleContext:(id)a5 displayType:(unint64_t)a6 usageFlags:(unint64_t)a7 date:(id)a8
{
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  objc_super v18 = (void *)[objc_alloc((Class)a1) _initWithContentID:v17 bundleID:v16 eligibleContext:v15 displayType:a6 usageFlags:a7 date:v14];

  return v18;
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"content_eligible"];
}

- (id)mutableAnalyticsEventRepresentation
{
  return 0;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSArray)eligibleContext
{
  return self->_eligibleContext;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (unint64_t)usageFlags
{
  return self->_usageFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibleContext, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end
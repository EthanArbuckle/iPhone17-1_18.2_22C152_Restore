@interface REMTemplatePublicLinkConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval;
- (BOOL)shouldIncludeAlarmTriggersBasedOnLocationOrVehicle;
- (BOOL)shouldIncludeContactsHandleData;
- (BOOL)shouldIncludeHashtags;
- (REMTemplatePublicLinkConfiguration)initWithCoder:(id)a3;
- (REMTemplatePublicLinkConfiguration)initWithShouldIncludeHashtags:(BOOL)a3 shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:(BOOL)a4 shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMTemplatePublicLinkConfiguration

- (REMTemplatePublicLinkConfiguration)initWithShouldIncludeHashtags:(BOOL)a3 shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:(BOOL)a4 shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)REMTemplatePublicLinkConfiguration;
  result = [(REMTemplatePublicLinkConfiguration *)&v9 init];
  if (result)
  {
    result->_shouldIncludeHashtags = a3;
    result->_shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval = a4;
    result->_shouldIncludeAlarmTriggersBasedOnLocationOrVehicle = a5;
  }
  return result;
}

- (BOOL)shouldIncludeContactsHandleData
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[REMTemplatePublicLinkConfiguration shouldIncludeHashtags](self, "shouldIncludeHashtags"));
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[REMTemplatePublicLinkConfiguration shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval](self, "shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval"));
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[REMTemplatePublicLinkConfiguration shouldIncludeAlarmTriggersBasedOnLocationOrVehicle](self, "shouldIncludeAlarmTriggersBasedOnLocationOrVehicle"));
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[REMTemplatePublicLinkConfiguration shouldIncludeContactsHandleData](self, "shouldIncludeContactsHandleData"));
  objc_super v9 = [v3 stringWithFormat:@"<%@: %p shouldIncludeHashtags: %@, shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval: %@, shouldIncludeAlarmTriggersBasedOnLocationOrVehicle: %@, shouldIncludeContactsHandleData: %@>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int v5 = [(REMTemplatePublicLinkConfiguration *)self shouldIncludeHashtags],
        v5 == [v4 shouldIncludeHashtags])
    && (int v6 = -[REMTemplatePublicLinkConfiguration shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval](self, "shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval"), v6 == [v4 shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval]))
  {
    BOOL v9 = [(REMTemplatePublicLinkConfiguration *)self shouldIncludeAlarmTriggersBasedOnLocationOrVehicle];
    int v7 = v9 ^ [v4 shouldIncludeAlarmTriggersBasedOnLocationOrVehicle] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [REMTemplatePublicLinkConfiguration alloc];
  BOOL v5 = [(REMTemplatePublicLinkConfiguration *)self shouldIncludeHashtags];
  BOOL v6 = [(REMTemplatePublicLinkConfiguration *)self shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval];
  BOOL v7 = [(REMTemplatePublicLinkConfiguration *)self shouldIncludeAlarmTriggersBasedOnLocationOrVehicle];

  return [(REMTemplatePublicLinkConfiguration *)v4 initWithShouldIncludeHashtags:v5 shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:v6 shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTemplatePublicLinkConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"shouldIncludeHashtags"];
  uint64_t v6 = [v4 decodeBoolForKey:@"shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval"];
  uint64_t v7 = [v4 decodeBoolForKey:@"shouldIncludeAlarmTriggersBasedOnLocationOrVehicle"];

  return [(REMTemplatePublicLinkConfiguration *)self initWithShouldIncludeHashtags:v5 shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:v6 shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:v7];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplatePublicLinkConfiguration shouldIncludeHashtags](self, "shouldIncludeHashtags"), @"shouldIncludeHashtags");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplatePublicLinkConfiguration shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval](self, "shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval"), @"shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplatePublicLinkConfiguration shouldIncludeAlarmTriggersBasedOnLocationOrVehicle](self, "shouldIncludeAlarmTriggersBasedOnLocationOrVehicle"), @"shouldIncludeAlarmTriggersBasedOnLocationOrVehicle");
}

- (BOOL)shouldIncludeHashtags
{
  return self->_shouldIncludeHashtags;
}

- (BOOL)shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval
{
  return self->_shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval;
}

- (BOOL)shouldIncludeAlarmTriggersBasedOnLocationOrVehicle
{
  return self->_shouldIncludeAlarmTriggersBasedOnLocationOrVehicle;
}

@end
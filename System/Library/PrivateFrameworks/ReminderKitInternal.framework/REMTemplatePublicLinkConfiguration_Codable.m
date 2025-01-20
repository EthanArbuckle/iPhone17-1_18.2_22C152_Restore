@interface REMTemplatePublicLinkConfiguration_Codable
+ (BOOL)supportsSecureCoding;
- (REMTemplatePublicLinkConfiguration_Codable)initWithShouldIncludeHashtags:(BOOL)a3 shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:(BOOL)a4 shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:(BOOL)a5;
@end

@implementation REMTemplatePublicLinkConfiguration_Codable

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTemplatePublicLinkConfiguration_Codable)initWithShouldIncludeHashtags:(BOOL)a3 shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:(BOOL)a4 shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  return [(REMTemplatePublicLinkConfiguration *)&v9 initWithShouldIncludeHashtags:v7 shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:v6 shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:v5];
}

@end
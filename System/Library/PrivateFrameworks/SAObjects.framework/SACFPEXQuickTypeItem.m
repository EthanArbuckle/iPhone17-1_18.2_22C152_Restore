@interface SACFPEXQuickTypeItem
+ (id)quickTypeItem;
- (NSArray)fields;
- (NSArray)itemFlags;
- (NSDate)startDate;
- (NSString)label;
- (NSString)name;
- (NSString)originatingBundleId;
- (NSString)originatingWebsiteURL;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFields:(id)a3;
- (void)setItemFlags:(id)a3;
- (void)setLabel:(id)a3;
- (void)setName:(id)a3;
- (void)setOriginatingBundleId:(id)a3;
- (void)setOriginatingWebsiteURL:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SACFPEXQuickTypeItem

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow.local.pex";
}

- (id)encodedClassName
{
  return @"QuickTypeItem";
}

+ (id)quickTypeItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)fields
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"fields"];
}

- (void)setFields:(id)a3
{
}

- (NSArray)itemFlags
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"itemFlags"];
}

- (void)setItemFlags:(id)a3
{
}

- (NSString)label
{
  return (NSString *)[(AceObject *)self propertyForKey:@"label"];
}

- (void)setLabel:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (NSString)originatingBundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"originatingBundleId"];
}

- (void)setOriginatingBundleId:(id)a3
{
}

- (NSString)originatingWebsiteURL
{
  return (NSString *)[(AceObject *)self propertyForKey:@"originatingWebsiteURL"];
}

- (void)setOriginatingWebsiteURL:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"startDate"];
}

- (void)setStartDate:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end
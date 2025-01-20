@interface SACFPEXQuery
+ (id)query;
- (BOOL)requiresResponse;
- (NSArray)criteriaFields;
- (NSArray)people;
- (NSArray)recipients;
- (NSNumber)queryTimeOut;
- (NSString)criteriaSemanticTag;
- (NSString)criteriaSubType;
- (NSString)criteriaTimeType;
- (NSString)criteriaType;
- (NSString)label;
- (NSString)localeIdentifier;
- (NSString)socialLabelType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)queryLimit;
- (void)setCriteriaFields:(id)a3;
- (void)setCriteriaSemanticTag:(id)a3;
- (void)setCriteriaSubType:(id)a3;
- (void)setCriteriaTimeType:(id)a3;
- (void)setCriteriaType:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setPeople:(id)a3;
- (void)setQueryLimit:(int64_t)a3;
- (void)setQueryTimeOut:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSocialLabelType:(id)a3;
@end

@implementation SACFPEXQuery

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow.local.pex";
}

- (id)encodedClassName
{
  return @"Query";
}

+ (id)query
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)criteriaFields
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"criteriaFields"];
}

- (void)setCriteriaFields:(id)a3
{
}

- (NSString)criteriaSemanticTag
{
  return (NSString *)[(AceObject *)self propertyForKey:@"criteriaSemanticTag"];
}

- (void)setCriteriaSemanticTag:(id)a3
{
}

- (NSString)criteriaSubType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"criteriaSubType"];
}

- (void)setCriteriaSubType:(id)a3
{
}

- (NSString)criteriaTimeType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"criteriaTimeType"];
}

- (void)setCriteriaTimeType:(id)a3
{
}

- (NSString)criteriaType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"criteriaType"];
}

- (void)setCriteriaType:(id)a3
{
}

- (NSString)label
{
  return (NSString *)[(AceObject *)self propertyForKey:@"label"];
}

- (void)setLabel:(id)a3
{
}

- (NSString)localeIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"localeIdentifier"];
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSArray)people
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"people"];
}

- (void)setPeople:(id)a3
{
}

- (int64_t)queryLimit
{
  return AceObjectIntegerForProperty(self, @"queryLimit");
}

- (void)setQueryLimit:(int64_t)a3
{
}

- (NSNumber)queryTimeOut
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"queryTimeOut"];
}

- (void)setQueryTimeOut:(id)a3
{
}

- (NSArray)recipients
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"recipients"];
}

- (void)setRecipients:(id)a3
{
}

- (NSString)socialLabelType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"socialLabelType"];
}

- (void)setSocialLabelType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
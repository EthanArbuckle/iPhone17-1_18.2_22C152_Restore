@interface SAAceCorrection
+ (id)aceCorrection;
- (NSData)correctionEntryData;
- (NSString)debugString;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCorrectionEntryData:(id)a3;
- (void)setDebugString:(id)a3;
@end

@implementation SAAceCorrection

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AceCorrection";
}

+ (id)aceCorrection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)correctionEntryData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"correctionEntryData"];
}

- (void)setCorrectionEntryData:(id)a3
{
}

- (NSString)debugString
{
  return (NSString *)[(AceObject *)self propertyForKey:@"debugString"];
}

- (void)setDebugString:(id)a3
{
}

@end
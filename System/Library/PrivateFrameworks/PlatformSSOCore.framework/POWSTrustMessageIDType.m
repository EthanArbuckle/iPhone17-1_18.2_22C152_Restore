@interface POWSTrustMessageIDType
+ (id)definition;
- (NSString)stringValue;
- (id)description;
- (void)setStringValue:(id)a3;
@end

@implementation POWSTrustMessageIDType

+ (id)definition
{
  v2 = objc_opt_new();
  [v2 setContentPropertyName:@"stringValue" type:objc_opt_class()];
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:self];
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
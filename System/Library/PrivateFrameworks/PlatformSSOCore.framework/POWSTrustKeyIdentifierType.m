@interface POWSTrustKeyIdentifierType
+ (id)definition;
- (NSString)ValueType;
- (NSString)stringValue;
- (id)description;
- (void)setStringValue:(id)a3;
- (void)setValueType:(id)a3;
@end

@implementation POWSTrustKeyIdentifierType

+ (id)definition
{
  v2 = objc_opt_new();
  [v2 addAttributeWithName:@"ValueType" type:objc_opt_class()];
  [v2 setContentPropertyName:@"stringValue" type:objc_opt_class()];
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:self];
}

- (NSString)ValueType
{
  return self->_ValueType;
}

- (void)setValueType:(id)a3
{
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
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_ValueType, 0);
}

@end
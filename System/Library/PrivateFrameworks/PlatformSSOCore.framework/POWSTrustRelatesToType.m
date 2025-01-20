@interface POWSTrustRelatesToType
+ (id)definition;
- (NSString)mustUnderstand;
- (NSString)stringValue;
- (id)description;
- (void)setMustUnderstand:(id)a3;
- (void)setStringValue:(id)a3;
@end

@implementation POWSTrustRelatesToType

+ (id)definition
{
  v2 = objc_opt_new();
  [v2 setContentPropertyName:@"stringValue" type:objc_opt_class()];
  [v2 addAttributeWithName:@"mustUnderstand" type:objc_opt_class() namespaceURI:@"http://www.w3.org/2003/05/soap-envelope"];
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

- (NSString)mustUnderstand
{
  return self->_mustUnderstand;
}

- (void)setMustUnderstand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mustUnderstand, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
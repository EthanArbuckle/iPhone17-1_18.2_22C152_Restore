@interface POSOAPCode
+ (id)definition;
- (NSString)Value;
- (NSString)description;
- (POSOAPSubcode)Subcode;
- (void)setSubcode:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation POSOAPCode

+ (id)definition
{
  v2 = objc_opt_new();
  [v2 addElementWithName:@"Value" namespaceURI:@"http://www.w3.org/2003/05/soap-envelope" type:objc_opt_class()];
  [v2 addElementWithName:@"Subcode" namespaceURI:@"http://www.w3.org/2003/05/soap-envelope" type:objc_opt_class()];
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:self];
}

- (NSString)Value
{
  return self->_Value;
}

- (void)setValue:(id)a3
{
}

- (POSOAPSubcode)Subcode
{
  return self->_Subcode;
}

- (void)setSubcode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Subcode, 0);
  objc_storeStrong((id *)&self->_Value, 0);
}

@end
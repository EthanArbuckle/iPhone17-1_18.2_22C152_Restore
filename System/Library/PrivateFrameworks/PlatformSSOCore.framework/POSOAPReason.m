@interface POSOAPReason
+ (id)definition;
- (NSString)description;
- (POSOAPText)Text;
- (void)setText:(id)a3;
@end

@implementation POSOAPReason

+ (id)definition
{
  v2 = objc_opt_new();
  [v2 addElementWithName:@"Text" namespaceURI:@"http://www.w3.org/2003/05/soap-envelope" type:objc_opt_class()];
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:self];
}

- (POSOAPText)Text
{
  return self->_Text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface POSOAPFault
+ (id)definition;
- (NSString)description;
- (NSString)faultactor;
- (NSString)faultcode;
- (NSString)faultstring;
- (POSOAPCode)Code;
- (POSOAPFaultDetail)detail;
- (POSOAPReason)Reason;
- (void)setCode:(id)a3;
- (void)setDetail:(id)a3;
- (void)setFaultactor:(id)a3;
- (void)setFaultcode:(id)a3;
- (void)setFaultstring:(id)a3;
- (void)setReason:(id)a3;
@end

@implementation POSOAPFault

+ (id)definition
{
  v2 = objc_opt_new();
  [v2 addElementWithName:@"faultactor" namespaceURI:0 type:objc_opt_class()];
  [v2 addElementWithName:@"faultcode" namespaceURI:0 type:objc_opt_class()];
  [v2 addElementWithName:@"faultstring" namespaceURI:0 type:objc_opt_class()];
  [v2 addElementWithName:@"Code" namespaceURI:@"http://www.w3.org/2003/05/soap-envelope" type:objc_opt_class()];
  [v2 addElementWithName:@"Reason" namespaceURI:@"http://www.w3.org/2003/05/soap-envelope" type:objc_opt_class()];
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:self];
}

- (POSOAPFaultDetail)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
}

- (NSString)faultactor
{
  return self->_faultactor;
}

- (void)setFaultactor:(id)a3
{
}

- (NSString)faultcode
{
  return self->_faultcode;
}

- (void)setFaultcode:(id)a3
{
}

- (NSString)faultstring
{
  return self->_faultstring;
}

- (void)setFaultstring:(id)a3
{
}

- (POSOAPCode)Code
{
  return self->_Code;
}

- (void)setCode:(id)a3
{
}

- (POSOAPReason)Reason
{
  return self->_Reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Reason, 0);
  objc_storeStrong((id *)&self->_Code, 0);
  objc_storeStrong((id *)&self->_faultstring, 0);
  objc_storeStrong((id *)&self->_faultcode, 0);
  objc_storeStrong((id *)&self->_faultactor, 0);
  objc_storeStrong((id *)&self->_detail, 0);
}

@end
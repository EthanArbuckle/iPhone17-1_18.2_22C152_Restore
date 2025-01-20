@interface FRHTMLStrippingXMLDelegate
- (FRHTMLStrippingXMLDelegate)init;
- (NSMutableArray)strings;
- (NSString)strippedString;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)setStrings:(id)a3;
@end

@implementation FRHTMLStrippingXMLDelegate

- (FRHTMLStrippingXMLDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)FRHTMLStrippingXMLDelegate;
  v2 = [(FRHTMLStrippingXMLDelegate *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    strings = v2->_strings;
    v2->_strings = v3;
  }
  return v2;
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5 = a4;
  id v6 = [(FRHTMLStrippingXMLDelegate *)self strings];
  [v6 addObject:v5];
}

- (NSString)strippedString
{
  v2 = [(FRHTMLStrippingXMLDelegate *)self strings];
  v3 = [v2 componentsJoinedByString:&stru_1000CABC0];

  return (NSString *)v3;
}

- (NSMutableArray)strings
{
  return self->_strings;
}

- (void)setStrings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
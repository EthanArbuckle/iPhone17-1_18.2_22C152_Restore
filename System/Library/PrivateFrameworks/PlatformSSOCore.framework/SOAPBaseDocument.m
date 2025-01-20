@interface SOAPBaseDocument
- (NSData)XMLData;
- (NSString)XMLString;
- (id)XMLDataWithOptions:(unint64_t)a3;
- (id)XMLStringWithOptions:(unint64_t)a3;
@end

@implementation SOAPBaseDocument

- (NSData)XMLData
{
  return (NSData *)[(SOAPBaseDocument *)self XMLDataWithOptions:0];
}

- (id)XMLDataWithOptions:(unint64_t)a3
{
  v3 = [(SOAPBaseDocument *)self XMLStringWithOptions:a3];
  v4 = [v3 dataUsingEncoding:4];

  return v4;
}

- (NSString)XMLString
{
  return (NSString *)[(SOAPBaseDocument *)self XMLStringWithOptions:0];
}

- (id)XMLStringWithOptions:(unint64_t)a3
{
  return 0;
}

@end
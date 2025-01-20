@interface PKDocumentRequest
- (DIAttributeDocument)documentAttribute;
- (NSString)countryCode;
- (unint64_t)documentType;
- (void)setCountryCode:(id)a3;
- (void)setDocumentAttribute:(id)a3;
- (void)setDocumentType:(unint64_t)a3;
@end

@implementation PKDocumentRequest

- (unint64_t)documentType
{
  return self->_documentType;
}

- (void)setDocumentType:(unint64_t)a3
{
  self->_documentType = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (DIAttributeDocument)documentAttribute
{
  return self->_documentAttribute;
}

- (void)setDocumentAttribute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentAttribute, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
@interface CRLWPNumberAttachment
- (NSString)numberFormat;
- (id)stringEquivalent;
- (id)stringEquivalentWithNumberProvider:(id)a3;
- (id)stringWithNumber:(unint64_t)a3;
- (void)setNumberFormat:(id)a3;
- (void)setStringValue:(id)a3 forPasteboardController:(id)a4;
@end

@implementation CRLWPNumberAttachment

- (id)stringEquivalent
{
  if (self->_stringValue) {
    return self->_stringValue;
  }
  else {
    return &stru_101538650;
  }
}

- (id)stringEquivalentWithNumberProvider:(id)a3
{
  return &stru_101538650;
}

- (id)stringWithNumber:(unint64_t)a3
{
  return &stru_101538650;
}

- (void)setStringValue:(id)a3 forPasteboardController:(id)a4
{
}

- (NSString)numberFormat
{
  return self->_numberFormat;
}

- (void)setNumberFormat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormat, 0);

  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
@interface CACTextInsertionSpecifier
- (AXElement)axElement;
- (NSDictionary)recognizedParams;
- (NSString)commandIdentifier;
- (NSString)insertedCategoryID;
- (NSString)insertedString;
- (_NSRange)insertedRange;
- (void)setAxElement:(id)a3;
- (void)setCommandIdentifier:(id)a3;
- (void)setInsertedCategoryID:(id)a3;
- (void)setInsertedRange:(_NSRange)a3;
- (void)setInsertedString:(id)a3;
- (void)setRecognizedParams:(id)a3;
@end

@implementation CACTextInsertionSpecifier

- (NSString)insertedString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInsertedString:(id)a3
{
}

- (_NSRange)insertedRange
{
  objc_copyStruct(v4, &self->_insertedRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setInsertedRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_insertedRange, &v3, 16, 1, 0);
}

- (AXElement)axElement
{
  return (AXElement *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAxElement:(id)a3
{
}

- (NSString)commandIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCommandIdentifier:(id)a3
{
}

- (NSDictionary)recognizedParams
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecognizedParams:(id)a3
{
}

- (NSString)insertedCategoryID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInsertedCategoryID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedCategoryID, 0);
  objc_storeStrong((id *)&self->_recognizedParams, 0);
  objc_storeStrong((id *)&self->_commandIdentifier, 0);
  objc_storeStrong((id *)&self->_axElement, 0);
  objc_storeStrong((id *)&self->_insertedString, 0);
}

@end
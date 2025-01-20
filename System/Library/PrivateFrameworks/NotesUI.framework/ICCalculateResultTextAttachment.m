@interface ICCalculateResultTextAttachment
- (NSString)expression;
- (NSString)localizedError;
- (_NSRange)expressionRangeInTextStorage;
- (id)calculateDocumentController;
@end

@implementation ICCalculateResultTextAttachment

- (NSString)expression
{
  v3 = [(ICCalculateResultTextAttachment *)self calculateDocumentController];
  v4 = [(ICAbstractTextAttachment *)self attachment];
  v5 = [v3 expressionStringForResultAttachment:v4];

  return (NSString *)v5;
}

- (_NSRange)expressionRangeInTextStorage
{
  v3 = [(ICCalculateResultTextAttachment *)self calculateDocumentController];
  v4 = [(ICAbstractTextAttachment *)self attachment];
  uint64_t v5 = [v3 expressionRangeForResultAttachment:v4];
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (NSString)localizedError
{
  v3 = [(ICCalculateResultTextAttachment *)self calculateDocumentController];
  v4 = [(ICAbstractTextAttachment *)self attachment];
  uint64_t v5 = [v3 errorStringForResultAttachment:v4];

  return (NSString *)v5;
}

- (id)calculateDocumentController
{
  v2 = [(ICAbstractTextAttachment *)self attachment];
  v3 = [v2 note];
  v4 = [v3 calculateDocumentController];

  return v4;
}

@end
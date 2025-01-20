@interface SCRO2DBrailleElement
- (SCRO2DBrailleElement)initWithIdentifier:(unint64_t)a3 linesRange:(_NSRange)a4;
- (_NSRange)linesRange;
- (unint64_t)identifier;
- (void)setIdentifier:(unint64_t)a3;
- (void)setLinesRange:(_NSRange)a3;
@end

@implementation SCRO2DBrailleElement

- (SCRO2DBrailleElement)initWithIdentifier:(unint64_t)a3 linesRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v11.receiver = self;
  v11.super_class = (Class)SCRO2DBrailleElement;
  v7 = [(SCRO2DBrailleElement *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_identifier = a3;
    v7->_linesRange.NSUInteger location = location;
    v7->_linesRange.NSUInteger length = length;
    v9 = v7;
  }

  return v8;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (_NSRange)linesRange
{
  NSUInteger length = self->_linesRange.length;
  NSUInteger location = self->_linesRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLinesRange:(_NSRange)a3
{
  self->_linesRange = a3;
}

@end
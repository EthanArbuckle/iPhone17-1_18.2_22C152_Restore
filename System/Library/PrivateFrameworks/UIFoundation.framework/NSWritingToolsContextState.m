@interface NSWritingToolsContextState
+ (_NSRange)contextRangeForString:(id)a3 proposedRange:(_NSRange)a4;
- (NSAttributedString)contextString;
- (NSWritingToolsContextState)init;
- (NSWritingToolsContextState)initWithContextString:(id)a3 contextLocation:(unint64_t)a4 proposedRange:(_NSRange)a5;
- (NSWritingToolsContextState)initWithDocumentString:(id)a3 proposedRange:(_NSRange)a4;
- (_NSRange)contextRange;
- (_NSRange)proposedRange;
- (void)dealloc;
- (void)setContextRange:(_NSRange)a3;
- (void)setContextString:(id)a3;
- (void)setProposedRange:(_NSRange)a3;
@end

@implementation NSWritingToolsContextState

+ (_NSRange)contextRangeForString:(id)a3 proposedRange:(_NSRange)a4
{
  uint64_t v5 = objc_msgSend(a3, "paragraphRangeForRange:", a4.location, a4.length);
  uint64_t v7 = v6;
  uint64_t v8 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  if (v5)
  {
    v9 = (void *)v8;
    uint64_t v10 = v5 + v7++;
    --v5;
    while (objc_msgSend(v9, "characterIsMember:", objc_msgSend(a3, "characterAtIndex:", v5)))
    {
      ++v7;
      if (--v5 == -1)
      {
        uint64_t v5 = 0;
        goto LABEL_7;
      }
    }
  }
  uint64_t v10 = v7;
LABEL_7:

  NSUInteger v11 = objc_msgSend(a3, "paragraphRangeForRange:", v5, v10);
  result.length = v12;
  result.location = v11;
  return result;
}

- (NSWritingToolsContextState)init
{
  return 0;
}

- (NSWritingToolsContextState)initWithContextString:(id)a3 contextLocation:(unint64_t)a4 proposedRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v13.receiver = self;
  v13.super_class = (Class)NSWritingToolsContextState;
  uint64_t v10 = [(NSWritingToolsContextState *)&v13 init];
  if (v10)
  {
    unint64_t v11 = [a3 length];
    [(NSWritingToolsContextState *)v10 setContextString:a3];
    -[NSWritingToolsContextState setContextRange:](v10, "setContextRange:", a4, v11);
    -[NSWritingToolsContextState setProposedRange:](v10, "setProposedRange:", location, length);
    if (location > v11 || location + length > v11) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, @"NSWritingToolsContextState.m", 55, @"proposedRange is not a subset of the contextRange.");
    }
  }
  return v10;
}

- (NSWritingToolsContextState)initWithDocumentString:(id)a3 proposedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v8 = objc_msgSend((id)objc_opt_class(), "contextRangeForString:proposedRange:", objc_msgSend(a3, "string"), a4.location, a4.length);
  uint64_t v10 = objc_msgSend(a3, "attributedSubstringFromRange:", v8, v9);

  return -[NSWritingToolsContextState initWithContextString:contextLocation:proposedRange:](self, "initWithContextString:contextLocation:proposedRange:", v10, v8, location - v8, length);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSWritingToolsContextState;
  [(NSWritingToolsContextState *)&v3 dealloc];
}

- (NSAttributedString)contextString
{
  return self->_contextString;
}

- (void)setContextString:(id)a3
{
}

- (_NSRange)contextRange
{
  NSUInteger length = self->_contextRange.length;
  NSUInteger location = self->_contextRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setContextRange:(_NSRange)a3
{
  self->_contextRange = a3;
}

- (_NSRange)proposedRange
{
  NSUInteger length = self->_proposedRange.length;
  NSUInteger location = self->_proposedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setProposedRange:(_NSRange)a3
{
  self->_proposedRange = a3;
}

@end
@interface UIWritingToolsCoordinatorContext
- (NSAttributedString)attributedString;
- (NSUUID)identifier;
- (UIWritingToolsCoordinatorContext)initWithAttributedString:(id)a3 range:(_NSRange)a4;
- (WTContext)_wtContext;
- (_NSRange)evaluatedRange;
- (_NSRange)range;
- (_NSRange)resolvedRange;
- (id)description;
- (void)_setEvaluatedRange:(_NSRange)a3;
- (void)_setWTContext:(id)a3;
@end

@implementation UIWritingToolsCoordinatorContext

- (UIWritingToolsCoordinatorContext)initWithAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIWritingToolsCoordinatorContext;
  v8 = [(UIWritingToolsCoordinatorContext *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB74F8]), "initWithAttributedText:range:", v7, location, length);
    wtContext = v8->_wtContext;
    v8->_wtContext = (WTContext *)v9;

    v8->_proposedRange.NSUInteger location = location;
    v8->_proposedRange.NSUInteger length = length;
    v8->_resolvedRange = (_NSRange)xmmword_186B93450;
  }

  return v8;
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)[(WTContext *)self->_wtContext attributedText];
}

- (_NSRange)range
{
  NSUInteger length = self->_proposedRange.length;
  NSUInteger location = self->_proposedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSUUID)identifier
{
  return (NSUUID *)[(WTContext *)self->_wtContext uuid];
}

- (void)_setEvaluatedRange:(_NSRange)a3
{
  self->_resolvedRange = a3;
}

- (_NSRange)evaluatedRange
{
  NSUInteger length = self->_resolvedRange.length;
  NSUInteger location = self->_resolvedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)_setWTContext:(id)a3
{
  id v5 = a3;
  v6 = [v5 uuid];
  id v7 = [(WTContext *)self->_wtContext uuid];
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {
  }
  else
  {
    v10 = v9;
    if (v8 && v9)
    {
      char v11 = [v8 isEqual:v9];

      if (v11) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIWritingToolsCoordinatorContext.m" lineNumber:58 description:@"Updating UIWritingToolsCoordinatorContext with mismatched WTContext"];
  }

LABEL_8:
  wtContext = self->_wtContext;
  self->_wtContext = (WTContext *)v5;
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)UIWritingToolsCoordinatorContext;
  v3 = [(UIWritingToolsCoordinatorContext *)&v16 description];
  uint64_t v4 = [(UIWritingToolsCoordinatorContext *)self range];
  [(UIWritingToolsCoordinatorContext *)self range];
  v6 = objc_msgSend(v3, "stringByAppendingFormat:", @" range={%lu,%lu}", v4, v5);

  if (self->_resolvedRange.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [v6 stringByAppendingString:@" no resolved range,"];
LABEL_6:
    char v11 = (void *)v7;

    v6 = v11;
    goto LABEL_7;
  }
  uint64_t v8 = [(UIWritingToolsCoordinatorContext *)self range];
  NSUInteger length = self->_resolvedRange.length;
  if (v8 != self->_resolvedRange.location || v9 != length)
  {
    uint64_t v7 = objc_msgSend(v6, "stringByAppendingFormat:", @" resolvedRange={%lu,%lu}", self->_resolvedRange.location, length);
    goto LABEL_6;
  }
LABEL_7:
  objc_super v12 = [(UIWritingToolsCoordinatorContext *)self attributedString];
  v13 = [v12 string];
  v14 = [v6 stringByAppendingFormat:@" text=%@", v13];

  return v14;
}

- (WTContext)_wtContext
{
  return self->_wtContext;
}

- (_NSRange)resolvedRange
{
  NSUInteger length = self->_resolvedRange.length;
  NSUInteger location = self->_resolvedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
}

@end
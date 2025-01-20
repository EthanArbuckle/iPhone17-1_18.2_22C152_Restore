@interface NSWritingToolsContext
- (NSAttributedString)attributedString;
- (NSString)description;
- (NSUUID)identifier;
- (NSWritingToolsContext)initWithAttributedString:(id)a3 range:(_NSRange)a4;
- (_NSRange)evaluatedRange;
- (_NSRange)range;
- (void)_setEvaluatedRange:(_NSRange)a3;
@end

@implementation NSWritingToolsContext

- (NSWritingToolsContext)initWithAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NSWritingToolsContext;
  v8 = [(NSWritingToolsContext *)&v15 init];
  v9 = (NSWritingToolsContext *)v8;
  if (v8)
  {
    *((void *)v8 + 3) = location;
    *((void *)v8 + 4) = length;
    *(_OWORD *)(v8 + 40) = xmmword_18E5F72A0;
    uint64_t v10 = [v7 copy];
    attributedString = v9->_attributedString;
    v9->_attributedString = (NSAttributedString *)v10;

    uint64_t v12 = -[NSWritingToolsContext _uuidForNewWritingToolsContextFromRange:attributedText:](v9, "_uuidForNewWritingToolsContextFromRange:attributedText:", location, length, v9->_attributedString);
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v12;
  }
  return v9;
}

- (void)_setEvaluatedRange:(_NSRange)a3
{
  self->_evaluatedRange = a3;
}

- (NSString)description
{
  v13.receiver = self;
  v13.super_class = (Class)NSWritingToolsContext;
  v3 = [(NSWritingToolsContext *)&v13 description];
  v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" range={%lu,%lu}", self->_range.location, self->_range.length);

  NSUInteger location = self->_evaluatedRange.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [v4 stringByAppendingString:@" no evaluated range,"];
LABEL_6:
    v8 = (void *)v6;

    v4 = v8;
    goto LABEL_7;
  }
  NSUInteger length = self->_evaluatedRange.length;
  if (self->_range.location != location || self->_range.length != length)
  {
    uint64_t v6 = objc_msgSend(v4, "stringByAppendingFormat:", @" evaluatedRange={%lu,%lu}", self->_evaluatedRange.location, length);
    goto LABEL_6;
  }
LABEL_7:
  v9 = [(NSWritingToolsContext *)self attributedText];
  uint64_t v10 = [v9 string];
  v11 = [v4 stringByAppendingFormat:@" text=%@", v10];

  return (NSString *)v11;
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 8, 1);
}

- (_NSRange)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (_NSRange)evaluatedRange
{
  objc_copyStruct(v4, &self->_evaluatedRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
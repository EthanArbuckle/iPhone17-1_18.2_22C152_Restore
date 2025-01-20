@interface TTSStringTransformation
- (NSString)replacement;
- (TTSStringTransformation)initWithRange:(_NSRange)a3 andReplacement:(id)a4;
- (_NSRange)finalRange;
- (_NSRange)range;
- (int64_t)sizeDelta;
- (unint64_t)offsetFromEnd;
- (void)setFinalRange:(_NSRange)a3;
- (void)setOffsetFromEnd:(unint64_t)a3;
- (void)setRange:(_NSRange)a3;
- (void)setReplacement:(id)a3;
@end

@implementation TTSStringTransformation

- (TTSStringTransformation)initWithRange:(_NSRange)a3 andReplacement:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TTSStringTransformation;
  v9 = [(TTSStringTransformation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_range.NSUInteger location = location;
    v9->_range.NSUInteger length = length;
    objc_storeStrong((id *)&v9->_replacement, a4);
  }

  return v10;
}

- (int64_t)sizeDelta
{
  v6 = objc_msgSend_replacement(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_length(v6, v7, v8, v9, v10);
  objc_msgSend_range(self, v12, v13, v14, v15);
  int64_t v17 = v11 - v16;

  return v17;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)replacement
{
  return self->_replacement;
}

- (void)setReplacement:(id)a3
{
}

- (unint64_t)offsetFromEnd
{
  return self->_offsetFromEnd;
}

- (void)setOffsetFromEnd:(unint64_t)a3
{
  self->_offsetFromEnd = a3;
}

- (_NSRange)finalRange
{
  NSUInteger length = self->_finalRange.length;
  NSUInteger location = self->_finalRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setFinalRange:(_NSRange)a3
{
  self->_finalRange = a3;
}

- (void).cxx_destruct
{
}

@end
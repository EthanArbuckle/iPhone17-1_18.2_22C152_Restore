@interface TSDTextRange
+ (id)textRangeWithRange:(_NSRange)a3;
+ (id)textRangeWithRange:(_NSRange)a3 eolAffinity:(BOOL)a4 preferredStartPosition:(float)a5 preferredEndPosition:(float)a6;
- (BOOL)isAtEndOfLine;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (TSDTextRange)initWithRange:(_NSRange)a3;
- (TSDTextRange)initWithRange:(_NSRange)a3 eolAffinity:(BOOL)a4 preferredStartPosition:(float)a5 preferredEndPosition:(float)a6;
- (_NSRange)range;
- (float)preferredEndPosition;
- (float)preferredStartPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)end;
- (id)start;
- (void)setIsAtEndOfLine:(BOOL)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation TSDTextRange

+ (id)textRangeWithRange:(_NSRange)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithRange:", a3.location, a3.length);

  return v3;
}

+ (id)textRangeWithRange:(_NSRange)a3 eolAffinity:(BOOL)a4 preferredStartPosition:(float)a5 preferredEndPosition:(float)a6
{
  BOOL v8 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = objc_alloc((Class)a1);
  *(float *)&double v12 = a5;
  *(float *)&double v13 = a6;
  v14 = objc_msgSend(v11, "initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", location, length, v8, v12, v13);

  return v14;
}

- (TSDTextRange)initWithRange:(_NSRange)a3
{
  LODWORD(v3) = 2143289344;
  LODWORD(v4) = 2143289344;
  return -[TSDTextRange initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:](self, "initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", a3.location, a3.length, 0, v3, v4);
}

- (TSDTextRange)initWithRange:(_NSRange)a3 eolAffinity:(BOOL)a4 preferredStartPosition:(float)a5 preferredEndPosition:(float)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v12.receiver = self;
  v12.super_class = (Class)TSDTextRange;
  result = [(TSDTextRange *)&v12 init];
  if (result)
  {
    result->_range.NSUInteger location = location;
    result->_range.NSUInteger length = length;
    result->_eolAffinity = a4;
    result->_preferredStartPosition = a5;
    result->_preferredEndPosition = a6;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL eolAffinity = self->_eolAffinity;
  *(float *)&double v6 = self->_preferredStartPosition;
  *(float *)&double v7 = self->_preferredEndPosition;
  NSUInteger location = self->_range.location;
  NSUInteger length = self->_range.length;

  return (id)objc_msgSend(v4, "initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", location, length, eolAffinity, v6, v7);
}

- (id)start
{
  if (self->_range.location == 0x7FFFFFFFFFFFFFFFLL) {
    return +[TSDTextPosition textPositionWithCharIndex:0];
  }
  *(float *)&double v2 = self->_preferredStartPosition;
  return +[TSDTextPosition textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](TSDTextPosition, "textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", v2);
}

- (id)end
{
  NSUInteger location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL) {
    return +[TSDTextPosition textPositionWithCharIndex:0];
  }
  NSUInteger length = self->_range.length;
  NSUInteger v6 = length + location;
  if (length) {
    BOOL eolAffinity = 0;
  }
  else {
    BOOL eolAffinity = self->_eolAffinity;
  }
  *(float *)&double v2 = self->_preferredEndPosition;
  return +[TSDTextPosition textPositionWithCharIndex:v6 eolAffinity:eolAffinity preferredPosition:0 isPreferredStart:v2];
}

- (BOOL)isEmpty
{
  return self->_range.length == 0;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4)
  {
    NSUInteger length = self->_range.length;
    if (self->_range.location == *(void *)(v4 + 16) && length == *(void *)(v4 + 24))
    {
      if (length) {
        LOBYTE(v4) = 1;
      }
      else {
        LOBYTE(v4) = self->_eolAffinity == *(unsigned __int8 *)(v4 + 32);
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (BOOL)isAtEndOfLine
{
  return self->_eolAffinity;
}

- (void)setIsAtEndOfLine:(BOOL)a3
{
  self->_BOOL eolAffinity = a3;
}

- (float)preferredStartPosition
{
  return self->_preferredStartPosition;
}

- (float)preferredEndPosition
{
  return self->_preferredEndPosition;
}

@end
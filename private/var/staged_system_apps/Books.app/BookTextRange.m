@interface BookTextRange
+ (id)textRangeWithRange:(_NSRange)a3;
+ (id)textRangeWithRange:(_NSRange)a3 eolAffinity:(BOOL)a4 preferredStartPosition:(float)a5 preferredEndPosition:(float)a6;
- (BOOL)isAtEndOfLine;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BookTextRange)initWithRange:(_NSRange)a3;
- (BookTextRange)initWithRange:(_NSRange)a3 eolAffinity:(BOOL)a4 preferredStartPosition:(float)a5 preferredEndPosition:(float)a6;
- (_NSRange)range;
- (float)preferredEndPosition;
- (float)preferredStartPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)end;
- (id)start;
- (void)setIsAtEndOfLine:(BOOL)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation BookTextRange

+ (id)textRangeWithRange:(_NSRange)a3
{
  id v3 = [objc_alloc((Class)a1) initWithRange:a3.location, a3.length];

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
  id v14 = [v11 initWithRange:location, length, v8, v12, v13];

  return v14;
}

- (BookTextRange)initWithRange:(_NSRange)a3
{
  LODWORD(v3) = 2143289344;
  LODWORD(v4) = 2143289344;
  return -[BookTextRange initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:](self, "initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", a3.location, a3.length, 0, v3, v4);
}

- (BookTextRange)initWithRange:(_NSRange)a3 eolAffinity:(BOOL)a4 preferredStartPosition:(float)a5 preferredEndPosition:(float)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v12.receiver = self;
  v12.super_class = (Class)BookTextRange;
  result = [(BookTextRange *)&v12 init];
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
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  BOOL eolAffinity = self->_eolAffinity;
  *(float *)&double v6 = self->_preferredStartPosition;
  *(float *)&double v7 = self->_preferredEndPosition;
  NSUInteger location = self->_range.location;
  NSUInteger length = self->_range.length;

  return [v4 initWithRange:location, length, eolAffinity, v6, v7];
}

- (id)start
{
  if (self->_range.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[BookTextPosition textPositionWithCharIndex:0];
  }
  else
  {
    *(float *)&double v2 = self->_preferredStartPosition;
    +[BookTextPosition textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](BookTextPosition, "textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", v2);
  double v3 = };

  return v3;
}

- (id)end
{
  NSUInteger location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = +[BookTextPosition textPositionWithCharIndex:0];
  }
  else
  {
    NSUInteger length = self->_range.length;
    NSUInteger v6 = length + location;
    if (length) {
      BOOL eolAffinity = 0;
    }
    else {
      BOOL eolAffinity = self->_eolAffinity;
    }
    *(float *)&double v2 = self->_preferredEndPosition;
    id v4 = +[BookTextPosition textPositionWithCharIndex:v6 eolAffinity:eolAffinity preferredPosition:0 isPreferredStart:v2];
  }

  return v4;
}

- (BOOL)isEmpty
{
  return self->_range.length == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = __IMAccessibilityCastAsClass();
  if (v5
    && ((NSUInteger length = self->_range.length, self->_range.location == *(void *)(v5 + 8))
      ? (BOOL v7 = length == *(void *)(v5 + 16))
      : (BOOL v7 = 0),
        v7))
  {
    if (length) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = self->_eolAffinity == *(unsigned __int8 *)(v5 + 24);
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v8.NSUInteger location = (NSUInteger)[(BookTextRange *)self range];
  id v4 = NSStringFromRange(v8);
  uint64_t v5 = +[NSString stringWithFormat:@"<%@ %p %@>", v3, self, v4];

  return v5;
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
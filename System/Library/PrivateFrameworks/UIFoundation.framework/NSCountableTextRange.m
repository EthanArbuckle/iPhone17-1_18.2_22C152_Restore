@interface NSCountableTextRange
+ (BOOL)isBaseClassTestingMode;
+ (NSCountableTextRange)documentRange;
+ (void)setBaseClassTestingMode:(BOOL)a3;
- (BOOL)containsLocation:(id)a3;
- (BOOL)intersectsWithTextRange:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEndingAtEOD;
- (BOOL)isEqualToTextRange:(id)a3;
- (BOOL)isNotEmpty;
- (NSCountableTextRange)initWithLocation:(id)a3 endLocation:(id)a4;
- (NSCountableTextRange)initWithRange:(_NSRange)a3;
- (NSString)type;
- (_NSRange)range;
- (id)debugDescription;
- (id)textRangeByFormingUnionWithTextRange:(id)a3;
- (id)textRangeByIntersectingWithTextRange:(id)a3;
- (unint64_t)hash;
@end

@implementation NSCountableTextRange

- (BOOL)isNotEmpty
{
  return self->_range.length != 0;
}

- (BOOL)containsLocation:(id)a3
{
  if (!__NSBaseClassDebugging
    && (objc_opt_respondsToSelector() & 1) != 0
    && (v5 = (void *)[a3 type],
        [v5 isEqualToString:NSTextLocationTypeCountable]))
  {
    unint64_t v6 = [a3 characterIndex];
    BOOL v7 = [(NSCountableTextRange *)self isEndingAtEOD];
    NSUInteger location = self->_range.location;
    if (v7)
    {
      return v6 >= location;
    }
    else
    {
      BOOL v11 = v6 >= location;
      NSUInteger v10 = v6 - location;
      BOOL v11 = !v11 || v10 >= self->_range.length;
      return !v11;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NSCountableTextRange;
    return [(NSTextRange *)&v12 containsLocation:a3];
  }
}

- (BOOL)isEndingAtEOD
{
  return self->_range.length > 0x7FFFFFFFFFFFFFFELL;
}

- (NSCountableTextRange)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location >= 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = objc_opt_class();
    v16.NSUInteger location = location;
    v16.NSUInteger length = length;
    [v6 raise:v7, @"-[%@ initWithRange:] initialized with invalid range %@", v8, NSStringFromRange(v16) format];
  }
  v9 = [[NSCountableTextLocation alloc] initWithIndex:location];
  if (length)
  {
    if (length < 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v10 = [[NSCountableTextLocation alloc] initWithIndex:location + length];
    }
    else {
      NSUInteger v10 = +[NSCountableTextLocation endOfDocumentLocation];
    }
    BOOL v11 = v10;
  }
  else
  {
    BOOL v11 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)NSCountableTextRange;
  objc_super v12 = [(NSTextRange *)&v15 initWithLocation:v9 endLocation:v11];
  v13 = v12;
  if (v12)
  {
    v12->_range.NSUInteger location = location;
    v12->_range.NSUInteger length = length;
  }

  return v13;
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

- (BOOL)isEmpty
{
  return self->_range.length == 0;
}

- (id)textRangeByIntersectingWithTextRange:(id)a3
{
  if (__NSBaseClassDebugging
    || (objc_opt_respondsToSelector() & 1) == 0
    || (v5 = (void *)[a3 type],
        ![v5 isEqualToString:NSTextLocationTypeCountable]))
  {
    v20.receiver = self;
    v20.super_class = (Class)NSCountableTextRange;
    return [(NSTextRange *)&v20 textRangeByIntersectingWithTextRange:a3];
  }
  NSUInteger v6 = [a3 range];
  NSUInteger v8 = v7;
  if ([(NSCountableTextRange *)self isEndingAtEOD])
  {
    int v9 = [a3 isEndingAtEOD];
    NSUInteger location = self->_range.location;
    if (v9)
    {
      if (location <= v6) {
        BOOL v11 = a3;
      }
      else {
        BOOL v11 = self;
      }
      objc_super v12 = v11;
      goto LABEL_27;
    }
    if (location <= v6) {
      goto LABEL_26;
    }
    NSUInteger length = v6 + v8 - location;
    NSUInteger v15 = self->_range.location;
  }
  else
  {
    v22.NSUInteger location = v6;
    v22.NSUInteger length = v8;
    NSRange v14 = NSIntersectionRange(self->_range, v22);
    NSUInteger v15 = v14.location;
    NSUInteger length = v14.length;
    NSUInteger location = self->_range.location;
  }
  if (location != v15 || self->_range.length != length)
  {
    if ([a3 range] != v15 || v18 != length)
    {
      if (!length) {
        return 0;
      }
      objc_super v12 = (NSCountableTextRange *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:", v15, length);
      goto LABEL_27;
    }
LABEL_26:
    objc_super v12 = (NSCountableTextRange *)a3;
    goto LABEL_27;
  }
  objc_super v12 = self;
LABEL_27:

  return v12;
}

- (BOOL)isEqualToTextRange:(id)a3
{
  if (!__NSBaseClassDebugging
    && (objc_opt_respondsToSelector() & 1) != 0
    && (v5 = (void *)[a3 type],
        [v5 isEqualToString:NSTextLocationTypeCountable]))
  {
    p_range = &self->_range;
    return p_range->location == [a3 range] && p_range->length == v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NSCountableTextRange;
    return [(NSTextRange *)&v10 isEqualToTextRange:a3];
  }
}

- (NSString)type
{
  return (NSString *)NSTextLocationTypeCountable;
}

- (id)textRangeByFormingUnionWithTextRange:(id)a3
{
  if (__NSBaseClassDebugging
    || (objc_opt_respondsToSelector() & 1) == 0
    || (v5 = (void *)[a3 type],
        ![v5 isEqualToString:NSTextLocationTypeCountable]))
  {
    v18.receiver = self;
    v18.super_class = (Class)NSCountableTextRange;
    return [(NSTextRange *)&v18 textRangeByFormingUnionWithTextRange:a3];
  }
  NSUInteger location = [a3 range];
  if (![(NSCountableTextRange *)self isEndingAtEOD])
  {
    v20.NSUInteger location = [a3 range];
    v20.NSUInteger length = v12;
    NSRange v13 = NSUnionRange(self->_range, v20);
    NSUInteger location = v13.location;
    NSUInteger length = v13.length;
    NSUInteger v8 = self->_range.location;
    goto LABEL_14;
  }
  int v7 = [a3 isEndingAtEOD];
  NSUInteger v8 = self->_range.location;
  if (v7)
  {
    if (v8 >= location) {
      int v9 = a3;
    }
    else {
      int v9 = self;
    }
    objc_super v10 = v9;
    goto LABEL_25;
  }
  if (v8 > location)
  {
    NSUInteger length = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
    if (v8 != location || self->_range.length != length)
    {
      if ([a3 range] == location && v16 == length) {
        objc_super v10 = (NSCountableTextRange *)a3;
      }
      else {
        objc_super v10 = (NSCountableTextRange *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:", location, length);
      }
      goto LABEL_25;
    }
  }
  objc_super v10 = self;
LABEL_25:

  return v10;
}

+ (BOOL)isBaseClassTestingMode
{
  return __NSBaseClassDebugging;
}

+ (void)setBaseClassTestingMode:(BOOL)a3
{
  __NSBaseClassDebugging = a3;
}

+ (NSCountableTextRange)documentRange
{
  if (documentRange_onceToken != -1) {
    dispatch_once(&documentRange_onceToken, &__block_literal_global_159);
  }
  return (NSCountableTextRange *)documentRange_textRange;
}

NSCountableTextRange *__37__NSCountableTextRange_documentRange__block_invoke()
{
  _NSRange result = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", 0, 0x7FFFFFFFFFFFFFFFLL);
  documentRange_textRange = (uint64_t)result;
  return result;
}

- (id)debugDescription
{
  NSUInteger length = self->_range.length;
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6.NSUInteger location = [(NSCountableTextRange *)self range];
  if (length > 0x7FFFFFFFFFFFFFFELL) {
    return (id)[v4 stringWithFormat:@"%@: {%lu, <EOD>}", v5, v6.location];
  }
  else {
    return (id)[v4 stringWithFormat:@"%@: %@", v5, NSStringFromRange(v6)];
  }
}

- (NSCountableTextRange)initWithLocation:(id)a3 endLocation:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    int v7 = (void *)[a3 type];
    if ([v7 isEqualToString:NSTextLocationTypeCountable])
    {
      if (!a4)
      {
        unint64_t v10 = [a3 characterIndex];
        goto LABEL_10;
      }
      if (objc_opt_respondsToSelector())
      {
        NSUInteger v8 = (void *)[a4 type];
        if ([v8 isEqualToString:NSTextLocationTypeCountable])
        {
          unint64_t v9 = [a4 characterIndex];
          if (v9 >= [a3 characterIndex])
          {
            unint64_t v10 = [a3 characterIndex];
            goto LABEL_8;
          }
        }
      }
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"-[%@ initWithLocation:endLocation:] initialized with locations {%@ %@}", objc_opt_class(), a3, a4 format];
  unint64_t v10 = [a3 characterIndex];
  if (a4)
  {
LABEL_8:
    id v11 = a4;
    goto LABEL_11;
  }
LABEL_10:
  id v11 = a3;
LABEL_11:
  unint64_t v12 = [v11 characterIndex];
  uint64_t v13 = v12 - v10;
  if (v12 >= 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v12 >= v10) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v12 >= v10) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = 0;
  }

  return -[NSCountableTextRange initWithRange:](self, "initWithRange:", v14, v15);
}

- (unint64_t)hash
{
  return self->_range.length + self->_range.location;
}

- (BOOL)intersectsWithTextRange:(id)a3
{
  if (!__NSBaseClassDebugging
    && (objc_opt_respondsToSelector() & 1) != 0
    && (uint64_t v5 = (void *)[a3 type],
        [v5 isEqualToString:NSTextLocationTypeCountable]))
  {
    if ([(NSCountableTextRange *)self isEndingAtEOD])
    {
      if ([a3 isEndingAtEOD])
      {
        return 1;
      }
      else
      {
        uint64_t v8 = [a3 range];
        return v8 + v9 > self->_range.location;
      }
    }
    else
    {
      v11.NSUInteger location = [a3 range];
      v11.NSUInteger length = v7;
      return NSIntersectionRange((NSRange)self[24], v11).length != 0;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NSCountableTextRange;
    return [(NSTextRange *)&v10 intersectsWithTextRange:a3];
  }
}

@end
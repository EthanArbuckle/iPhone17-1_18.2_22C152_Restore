@interface _UITextViewRestorableScrollPosition
+ (_UITextViewRestorableScrollPosition)restorableScrollPositionWithDictionary:(id)a3;
+ (_UITextViewRestorableScrollPosition)restorableScrollPositionWithRange:(_NSRange)a3;
+ (id)restorableScrollPositionForStateRestoration:(id)a3;
+ (id)restorableScrollPositionForTextView:(id)a3;
- (_NSRange)range;
- (_UITextViewRestorableScrollPosition)initWithCoder:(id)a3;
- (_UITextViewRestorableScrollPosition)initWithTextView:(id)a3;
- (_UITextViewRestorableScrollPosition)initWithTextViewForStateRestoration:(id)a3;
- (double)offsetWithinLine;
- (id)debugDescription;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UITextViewRestorableScrollPosition

+ (id)restorableScrollPositionForTextView:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithTextView:v4];

  return v5;
}

- (_UITextViewRestorableScrollPosition)initWithTextView:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UITextViewRestorableScrollPosition;
  v5 = [(_UITextViewRestorableScrollPosition *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 _visibleRangeWithLayout:1];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL
      || (NSUInteger v7 = v6, [v4 contentOffset], fabs(v8) <= 2.22044605e-16)
      && ([v4 _documentRangeEqualToViewportRange] & 1) != 0)
    {

      v5 = 0;
    }
    else
    {
      objc_msgSend(v4, "_rectForScrollToVisible:", v7, 1);
      double v10 = v9;
      v5->_range.location = v7;
      v5->_range.length = 1;
      [v4 contentOffset];
      v5->_offsetInLine = v11 - v10;
    }
  }

  return v5;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (double)offsetWithinLine
{
  return self->_offsetInLine;
}

+ (id)restorableScrollPositionForStateRestoration:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithTextViewForStateRestoration:v4];

  return v5;
}

+ (_UITextViewRestorableScrollPosition)restorableScrollPositionWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = objc_alloc_init((Class)a1);
  v5[1] = location;
  v5[2] = length;
  return (_UITextViewRestorableScrollPosition *)v5;
}

+ (_UITextViewRestorableScrollPosition)restorableScrollPositionWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (double *)objc_alloc_init((Class)a1);
  uint64_t v6 = [v4 objectForKey:@"UILocation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *((void *)v5 + 1) = [v6 integerValue];
  }
  NSUInteger v7 = [v4 objectForKey:@"UILength"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *((void *)v5 + 2) = [v7 integerValue];
  }
  double v8 = [v4 objectForKey:@"UIOffset"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 floatValue];
    v5[3] = v9;
  }

  return (_UITextViewRestorableScrollPosition *)v5;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  id v4 = [NSNumber numberWithInteger:self->_range.location];
  [v3 setObject:v4 forKey:@"UILocation"];

  v5 = [NSNumber numberWithInteger:self->_range.length];
  [v3 setObject:v5 forKey:@"UILength"];

  double offsetInLine = self->_offsetInLine;
  *(float *)&double offsetInLine = offsetInLine;
  NSUInteger v7 = [NSNumber numberWithFloat:offsetInLine];
  [v3 setObject:v7 forKey:@"UIOffset"];

  return v3;
}

- (_UITextViewRestorableScrollPosition)initWithTextViewForStateRestoration:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UITextViewRestorableScrollPosition;
  v5 = [(_UITextViewRestorableScrollPosition *)&v15 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 _visibleRangeWithLayout:1];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v9 = v6;
    NSUInteger v10 = v7;
    objc_msgSend(v4, "_contentOffsetForScrollToVisible:", v6, v7);
    double v12 = v11;
    v5->_range.NSUInteger location = v9;
    v5->_range.NSUInteger length = v10;
    [v4 contentOffset];
    v5->_double offsetInLine = v13 - v12;
LABEL_5:
    double v8 = v5;
    goto LABEL_6;
  }
  double v8 = 0;
LABEL_6:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSUInteger location = self->_range.location;
  id v6 = a3;
  [v6 encodeInteger:location forKey:@"UILocation"];
  [v6 encodeInteger:self->_range.length forKey:@"UILength"];
  double offsetInLine = self->_offsetInLine;
  *(float *)&double offsetInLine = offsetInLine;
  [v6 encodeFloat:@"UIOffset" forKey:offsetInLine];
}

- (_UITextViewRestorableScrollPosition)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextViewRestorableScrollPosition;
  v5 = [(_UITextViewRestorableScrollPosition *)&v8 init];
  if (v5)
  {
    v5->_range.NSUInteger location = [v4 decodeIntegerForKey:@"UILocation"];
    v5->_range.NSUInteger length = [v4 decodeIntegerForKey:@"UILength"];
    [v4 decodeFloatForKey:@"UIOffset"];
    v5->_double offsetInLine = v6;
  }

  return v5;
}

- (id)debugDescription
{
  v8.receiver = self;
  v8.super_class = (Class)_UITextViewRestorableScrollPosition;
  v3 = [(_UITextViewRestorableScrollPosition *)&v8 debugDescription];
  v10.NSUInteger location = [(_UITextViewRestorableScrollPosition *)self range];
  id v4 = NSStringFromRange(v10);
  [(_UITextViewRestorableScrollPosition *)self offsetWithinLine];
  float v6 = [v3 stringByAppendingFormat:@" { %@ + %f }", v4, v5];

  return v6;
}

@end
@interface TextFirstLineCharacterRangeFinder
- (CGSize)textSize;
- (TextFirstLineCharacterRangeFinder)init;
- (_NSRange)_assertRange:(_NSRange)a3 isIncludedInRange:(_NSRange)a4;
- (_NSRange)firstLineCharacterRangeInText:(id)a3;
- (_NSRange)lastLineCharacterRangeInText:(id)a3;
- (id)lineRangesForText:(id)a3;
- (void)setTextSize:(CGSize)a3;
@end

@implementation TextFirstLineCharacterRangeFinder

- (TextFirstLineCharacterRangeFinder)init
{
  v6.receiver = self;
  v6.super_class = (Class)TextFirstLineCharacterRangeFinder;
  v2 = [(TextFirstLineCharacterRangeFinder *)&v6 init];
  if (v2)
  {
    v3 = (NSLayoutManager *)objc_alloc_init((Class)NSLayoutManager);
    layoutManager = v2->_layoutManager;
    v2->_layoutManager = v3;
  }
  return v2;
}

- (void)setTextSize:(CGSize)a3
{
  if (self->_textSize.width != a3.width || self->_textSize.height != a3.height)
  {
    self->_textSize = a3;
    cachedAttributedString = self->_cachedAttributedString;
    self->_cachedAttributedString = 0;

    cachedRanges = self->_cachedRanges;
    self->_cachedRanges = 0;

    textContainer = self->_textContainer;
    if (textContainer)
    {
      double width = self->_textSize.width;
      double height = self->_textSize.height;
      -[NSTextContainer setSize:](textContainer, "setSize:", width, height);
    }
    else
    {
      v10 = [objc_alloc((Class)NSTextContainer) initWithSize:self->_textSize.width, self->_textSize.height];
      v11 = self->_textContainer;
      self->_textContainer = v10;

      [(NSTextContainer *)self->_textContainer setLineFragmentPadding:0.0];
      layoutManager = self->_layoutManager;
      v13 = self->_textContainer;
      [(NSLayoutManager *)layoutManager addTextContainer:v13];
    }
  }
}

- (id)lineRangesForText:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_cachedAttributedString] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cachedAttributedString, a3);
    textStorage = self->_textStorage;
    if (textStorage)
    {
      if (self->_cachedAttributedString) {
        -[NSTextStorage setAttributedString:](textStorage, "setAttributedString:");
      }
    }
    else
    {
      v7 = (NSTextStorage *)[objc_alloc((Class)NSTextStorage) initWithAttributedString:self->_cachedAttributedString];
      v8 = self->_textStorage;
      self->_textStorage = v7;

      [(NSTextStorage *)self->_textStorage addLayoutManager:self->_layoutManager];
    }
    id v9 = [v5 length];
    NSUInteger v10 = [(NSLayoutManager *)self->_layoutManager numberOfGlyphs];
    v11 = (NSArray *)objc_opt_new();
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    if (v10)
    {
      NSUInteger v12 = 0;
      do
      {
        [(NSLayoutManager *)self->_layoutManager lineFragmentRectForGlyphAtIndex:v12 effectiveRange:&v21];
        NSUInteger v12 = v22 + v21;
        id v13 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self->_layoutManager, "characterRangeForGlyphRange:actualGlyphRange:");
        id v15 = -[TextFirstLineCharacterRangeFinder _assertRange:isIncludedInRange:](self, "_assertRange:isIncludedInRange:", v13, v14, 0, v9);
        v17 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v15, v16);
        [(NSArray *)v11 addObject:v17];
      }
      while (v12 < v10);
    }
    cachedRanges = self->_cachedRanges;
    self->_cachedRanges = v11;
  }
  v19 = self->_cachedRanges;

  return v19;
}

- (_NSRange)_assertRange:(_NSRange)a3 isIncludedInRange:(_NSRange)a4
{
  if (a3.location <= a4.location) {
    NSUInteger location = a4.location;
  }
  else {
    NSUInteger location = a3.location;
  }
  if (location + a3.length <= a4.location + a4.length) {
    NSUInteger length = a3.length;
  }
  else {
    NSUInteger length = a4.location + a4.length - location;
  }
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)firstLineCharacterRangeInText:(id)a3
{
  v3 = [(TextFirstLineCharacterRangeFinder *)self lineRangesForText:a3];
  v4 = [v3 firstObject];
  id v5 = [v4 rangeValue];
  NSUInteger v7 = v6;

  NSUInteger v8 = (NSUInteger)v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (_NSRange)lastLineCharacterRangeInText:(id)a3
{
  v3 = [(TextFirstLineCharacterRangeFinder *)self lineRangesForText:a3];
  v4 = [v3 lastObject];
  id v5 = [v4 rangeValue];
  NSUInteger v7 = v6;

  NSUInteger v8 = (NSUInteger)v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (CGSize)textSize
{
  double width = self->_textSize.width;
  double height = self->_textSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_cachedRanges, 0);

  objc_storeStrong((id *)&self->_cachedAttributedString, 0);
}

@end
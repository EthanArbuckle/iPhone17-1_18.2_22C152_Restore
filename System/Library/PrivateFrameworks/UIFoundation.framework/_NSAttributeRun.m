@interface _NSAttributeRun
- (_NSAttributeRun)initWithTextStorage:(id)a3 range:(_NSRange)a4;
- (_NSRange)range;
- (void)dealloc;
- (void)restoreAttributesOfTextStorage:(id)a3;
@end

@implementation _NSAttributeRun

- (_NSAttributeRun)initWithTextStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  v14.receiver = self;
  v14.super_class = (Class)_NSAttributeRun;
  v7 = [(_NSAttributeRun *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_range.NSUInteger location = location;
    v7->_range.NSUInteger length = length;
    v7->_attributesArray = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", -[_NSAttributeRun zone](v7, "zone")), "init");
    if (location < location + length)
    {
      NSUInteger v9 = location;
      do
      {
        uint64_t v10 = objc_msgSend(a3, "attributesAtIndex:longestEffectiveRange:inRange:", v9, &v15, location, length);
        v11 = [_NSAttributes alloc];
        v12 = -[_NSAttributes initWithAttributes:range:](v11, "initWithAttributes:range:", v10, v15, v16);
        [(NSMutableArray *)v8->_attributesArray addObject:v12];

        v9 += v16;
      }
      while (v9 < location + length);
    }
  }
  return v8;
}

- (void)dealloc
{
  self->_attributesArray = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSAttributeRun;
  [(_NSAttributeRun *)&v3 dealloc];
}

- (void)restoreAttributesOfTextStorage:(id)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_attributesArray count];
  [a3 beginEditing];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_attributesArray, "objectAtIndex:", i), "setAttributesInTextStorage:", a3);
  }

  [a3 endEditing];
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end
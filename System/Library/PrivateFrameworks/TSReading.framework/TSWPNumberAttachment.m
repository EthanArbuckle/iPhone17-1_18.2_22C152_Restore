@interface TSWPNumberAttachment
- (NSString)stringValue;
- (id)copyWithContext:(id)a3;
- (id)stringEquivalent;
- (id)stringEquivalentWithLayoutParent:(id)a3;
- (id)stringWithNumber:(unint64_t)a3;
- (int)numberFormat;
- (void)dealloc;
- (void)setNumberFormat:(int)a3;
- (void)setStringValue:(id)a3;
@end

@implementation TSWPNumberAttachment

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPNumberAttachment;
  [(TSWPNumberAttachment *)&v3 dealloc];
}

- (id)copyWithContext:(id)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[TSWPNumberAttachment zone](self, "zone")), "initWithContext:", a3);
  [v4 setNumberFormat:self->_numberFormat];
  [v4 setStringValue:self->_stringValue];
  return v4;
}

- (id)stringEquivalent
{
  if (![(TSWPNumberAttachment *)self stringValue]) {
    return &stru_26D688A48;
  }

  return [(TSWPNumberAttachment *)self stringValue];
}

- (id)stringEquivalentWithLayoutParent:(id)a3
{
  if (a3)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPNumberAttachment stringEquivalentWithLayoutParent:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPNumberAttachment.mm"), 152, @"Expected protocol support.");
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPNumberAttachment stringEquivalentWithLayoutParent:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPNumberAttachment.mm"), 153, @"Expected protocol support.");
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = [a3 pageCountForAttachment:self];
    }
    else {
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = [a3 pageNumberForAttachment:self];
    }
    else {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    return [(TSWPTextualAttachment *)self stringWithPageNumber:v11 pageCount:v9 charIndex:0];
  }
  else
  {
    return [(TSWPNumberAttachment *)self stringEquivalent];
  }
}

- (id)stringWithNumber:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = a3;
  }
  -[TSWPNumberAttachment setStringValue:](self, "setStringValue:", objc_msgSend(NSString, "stringForValue:withPageNumberFormat:", v4, -[TSWPNumberAttachment numberFormat](self, "numberFormat")));

  return [(TSWPNumberAttachment *)self stringValue];
}

- (int)numberFormat
{
  return self->_numberFormat;
}

- (void)setNumberFormat:(int)a3
{
  self->_numberFormat = a3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

@end
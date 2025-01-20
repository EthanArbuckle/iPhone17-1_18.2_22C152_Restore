@interface TSWPRubyField
- (BOOL)allowsEditing;
- (BOOL)canCopy:(_NSRange)a3;
- (NSString)baseText;
- (NSString)rubyText;
- (TSWPRubyField)initWithContext:(id)a3 rubyText:(id)a4;
- (id)copyWithContext:(id)a3;
- (int)baseTextScript;
- (int)elementKind;
- (int)styleAttributeArrayKind;
- (unsigned)attributeArrayKind;
- (void)dealloc;
- (void)setRubyText:(id)a3;
@end

@implementation TSWPRubyField

- (TSWPRubyField)initWithContext:(id)a3 rubyText:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSWPRubyField;
  v5 = [(TSWPSmartField *)&v8 initWithContext:a3];
  v6 = v5;
  if (v5) {
    [(TSWPRubyField *)v5 setRubyText:a4];
  }
  return v6;
}

- (id)copyWithContext:(id)a3
{
  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[TSWPRubyField zone](self, "zone"));
  v6 = [(TSWPRubyField *)self rubyText];

  return (id)[v5 initWithContext:a3 rubyText:v6];
}

- (void)dealloc
{
  self->_rubyText = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPRubyField;
  [(TSWPSmartField *)&v3 dealloc];
}

- (void)setRubyText:(id)a3
{
  [(TSPObject *)self willModify];
  v5 = (NSString *)[a3 copy];

  self->_rubyText = v5;
  v6 = [(TSWPSmartField *)self parentStorage];

  [(TSWPStorage *)v6 smartFieldDidChange:self];
}

- (NSString)baseText
{
  result = [(TSWPSmartField *)self parentStorage];
  if (result)
  {
    v4 = [(TSWPSmartField *)self parentStorage];
    uint64_t v6 = [(TSWPSmartField *)self range];
    return (NSString *)-[TSWPStorage substringWithRange:](v4, "substringWithRange:", v6, v5);
  }
  return result;
}

- (int)baseTextScript
{
  v2 = [(TSWPRubyField *)self baseText];

  return [(NSString *)v2 contentsScript];
}

- (int)elementKind
{
  return 4096;
}

- (unsigned)attributeArrayKind
{
  return 7;
}

- (int)styleAttributeArrayKind
{
  return 7;
}

- (BOOL)allowsEditing
{
  return 1;
}

- (BOOL)canCopy:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v5 = [(TSWPSmartField *)self range];
  return location <= v5 && location + length >= v5 + v6;
}

- (NSString)rubyText
{
  return self->_rubyText;
}

@end
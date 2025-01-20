@interface TSWPEquationLayoutContext
- (BOOL)isEqual:(id)a3;
- (TSWPEquationLayoutContext)initWithTextAttributes:(__CFDictionary *)a3 columnWidth:(double)a4;
- (__CFString)baseFontName;
- (double)baseFontSize;
- (double)columnWidth;
- (double)containerWidth;
- (double)fontSize;
- (void)dealloc;
- (void)setColumnWidth:(double)a3;
- (void)setFontSize:(double)a3;
@end

@implementation TSWPEquationLayoutContext

- (TSWPEquationLayoutContext)initWithTextAttributes:(__CFDictionary *)a3 columnWidth:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TSWPEquationLayoutContext;
  v6 = [(TSWPEquationLayoutContext *)&v10 init];
  if (v6)
  {
    Value = (const __CTFont *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x263F039A0]);
    if (Value)
    {
      v8 = Value;
      v6->_fontSize = CTFontGetSize(Value);
      v6->_fontName = (__CFString *)CTFontCopyPostScriptName(v8);
    }
    v6->_columnWidth = a4;
  }
  return v6;
}

- (void)dealloc
{
  fontName = self->_fontName;
  if (fontName) {
    CFRelease(fontName);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPEquationLayoutContext;
  [(TSWPEquationLayoutContext *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  objc_super v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    [v4 fontSize];
    if (v6 == self->_fontSize)
    {
      [v5 columnWidth];
      LOBYTE(v4) = v7 == self->_columnWidth;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (double)baseFontSize
{
  return self->_fontSize;
}

- (__CFString)baseFontName
{
  return self->_fontName;
}

- (double)containerWidth
{
  return self->_columnWidth;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)columnWidth
{
  return self->_columnWidth;
}

- (void)setColumnWidth:(double)a3
{
  self->_columnWidth = a3;
}

@end
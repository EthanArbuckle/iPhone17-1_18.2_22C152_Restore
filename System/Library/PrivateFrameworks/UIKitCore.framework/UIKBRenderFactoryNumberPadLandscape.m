@interface UIKBRenderFactoryNumberPadLandscape
- (CGPoint)centerColumnLetterOffset;
- (CGPoint)centerColumnNumberOffset;
- (CGPoint)deleteGlyphOffset;
- (CGPoint)dictationGlyphOffset;
- (CGPoint)leftColumnLetterOffset;
- (CGPoint)leftColumnNumberOffset;
- (CGPoint)loneZeroOffset;
- (CGPoint)rightColumnLetterOffset;
- (CGPoint)rightColumnNumberOffset;
- (CGPoint)specialSymbolOffset;
- (double)letterFontSize;
- (double)numberFontSize;
- (void)_customizeSymbolStyle:(id)a3 secondaryStyle:(id)a4 forKey:(id)a5 contents:(id)a6;
@end

@implementation UIKBRenderFactoryNumberPadLandscape

- (double)numberFontSize
{
  return 27.0;
}

- (double)letterFontSize
{
  return 10.0;
}

- (CGPoint)deleteGlyphOffset
{
  double v2 = 1.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationGlyphOffset
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)leftColumnNumberOffset
{
  double v2 = 0.0;
  double v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)leftColumnLetterOffset
{
  double v2 = 16.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)centerColumnNumberOffset
{
  double v2 = 0.0;
  double v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)centerColumnLetterOffset
{
  double v2 = 16.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightColumnNumberOffset
{
  double v2 = 0.0;
  double v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightColumnLetterOffset
{
  double v2 = 16.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)loneZeroOffset
{
  double v2 = 0.0;
  double v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)specialSymbolOffset
{
  double v2 = 0.0;
  double v3 = 5.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_customizeSymbolStyle:(id)a3 secondaryStyle:(id)a4 forKey:(id)a5 contents:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UIKBRenderFactoryNumberPadLandscape;
  [(UIKBRenderFactoryNumberPad *)&v17 _customizeSymbolStyle:a3 secondaryStyle:v10 forKey:v11 contents:a6];
  if ([(UIKBRenderFactory *)self keyIsRightToLeftSensitive:v11])
  {
    [v10 textOffset];
    double v13 = -v12;
    [v10 textOffset];
    [v10 setTextOffset:v13];
    uint64_t v14 = 2;
  }
  else
  {
    uint64_t v14 = 0;
  }
  [v10 setAlignment:v14];
  v15 = [v11 name];
  int v16 = [v15 containsString:@"-Arabic-Digit-"];

  if (v16) {
    [v10 setKerning:-1.0];
  }
}

@end
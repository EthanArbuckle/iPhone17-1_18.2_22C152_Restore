@interface TVRPasscodeField
- (BOOL)acceptsFloatingKeyboard;
- (BOOL)acceptsSplitKeyboard;
- (BOOL)canBecomeFirstResponder;
- (BOOL)enablesReturnKeyAutomatically;
- (BOOL)hasText;
- (BOOL)isSecureTextEntry;
- (BOOL)useSystemColors;
- (CGSize)_contentSize;
- (NSMutableString)mutablePasscode;
- (NSString)text;
- (TVRCPINEntryAttributes)PINEntryattributes;
- (TVRPasscodeField)initWithFrame:(CGRect)a3;
- (double)_contentWidthWithDotSize:(double)a3 entrySpacing:(double)a4 groupSpacing:(double)a5;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (int64_t)returnKeyType;
- (int64_t)spellCheckingType;
- (void)clear;
- (void)deleteBackward;
- (void)drawRect:(CGRect)a3;
- (void)insertText:(id)a3;
- (void)setMutablePasscode:(id)a3;
- (void)setPINEntryattributes:(id)a3;
- (void)setText:(id)a3;
- (void)setUseSystemColors:(BOOL)a3;
@end

@implementation TVRPasscodeField

- (TVRPasscodeField)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TVRPasscodeField;
  v3 = -[TVRPasscodeField initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F7C9D0]) initWithDigitCount:4];
    PINEntryattributes = v3->_PINEntryattributes;
    v3->_PINEntryattributes = (TVRCPINEntryAttributes *)v4;

    v6 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    mutablePasscode = v3->_mutablePasscode;
    v3->_mutablePasscode = v6;

    v8 = [MEMORY[0x263F825C8] clearColor];
    [(TVRPasscodeField *)v3 setBackgroundColor:v8];

    [(TVRPasscodeField *)v3 setContentMode:3];
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  [(TVRPasscodeField *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(TVRPasscodeField *)self _contentSize];
  double v13 = v12;
  double v15 = v14;
  v41.origin.x = v5;
  v41.origin.y = v7;
  v41.size.width = v9;
  v41.size.height = v11;
  if (v13 <= CGRectGetWidth(v41) + -50.0)
  {
    double v17 = 25.0;
    double v19 = 22.0;
    double v39 = 50.0;
  }
  else
  {
    v42.origin.x = v5;
    v42.origin.y = v7;
    v42.size.width = v9;
    v42.size.height = v11;
    CGFloat v16 = (CGRectGetWidth(v42) + -50.0) / v13;
    double v15 = v16 * 22.0;
    double v17 = v16 * 25.0;
    double v39 = v16 * 50.0;
    -[TVRPasscodeField _contentWidthWithDotSize:entrySpacing:groupSpacing:](self, "_contentWidthWithDotSize:entrySpacing:groupSpacing:", v16 * 22.0, v16 * 25.0);
    double v13 = v18;
    double v19 = v15;
  }
  v43.origin.x = v5;
  v43.origin.y = v7;
  v43.size.width = v9;
  v43.size.height = v11;
  double Width = CGRectGetWidth(v43);
  v44.origin.x = v5;
  v44.origin.y = v7;
  v44.size.width = v9;
  v44.size.height = v11;
  double Height = CGRectGetHeight(v44);
  CurrentContext = UIGraphicsGetCurrentContext();
  if ([(TVRPasscodeField *)self useSystemColors]) {
    [MEMORY[0x263F825C8] labelColor];
  }
  else {
  id v22 = [MEMORY[0x263F825C8] whiteColor];
  }
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v22 CGColor]);

  uint64_t v40 = [(TVRCPINEntryAttributes *)self->_PINEntryattributes numberOfDigitGroups];
  if (v40)
  {
    uint64_t v23 = 0;
    unint64_t v24 = 0;
    float v25 = (Width - v13) * 0.5;
    float v26 = (Height - v15) * 0.5;
    double v27 = floorf(v25);
    double v28 = floorf(v26);
    float v29 = (v19 + -4.0) * 0.5;
    double v30 = floorf(v29) + v28;
    double v31 = v19 + v17;
    double v32 = v39 - v17;
    do
    {
      uint64_t v33 = -[TVRCPINEntryAttributes numberOfDigitsInGroup:](self->_PINEntryattributes, "numberOfDigitsInGroup:", v23, *(void *)&Width);
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = v33;
        unint64_t v36 = v24;
        do
        {
          if (v36 >= [(NSMutableString *)self->_mutablePasscode length])
          {
            v37 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", v27, v30, v19, 4.0, 3.0);
            [v37 fill];
          }
          else
          {
            v45.origin.x = v27;
            v45.origin.y = v28;
            v45.size.width = v19;
            v45.size.height = v19;
            CGContextFillEllipseInRect(CurrentContext, v45);
          }
          double v27 = v31 + v27;
          ++v36;
          --v35;
        }
        while (v35);
        v24 += v34;
      }
      double v27 = v32 + v27;
      ++v23;
    }
    while (v23 != v40);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSString)text
{
  v2 = (void *)[(NSMutableString *)self->_mutablePasscode copy];
  return (NSString *)v2;
}

- (void)setText:(id)a3
{
  double v4 = &stru_26DB4CAE0;
  if (a3) {
    double v4 = (__CFString *)a3;
  }
  double v8 = v4;
  if ([(TVRCPINEntryAttributes *)self->_PINEntryattributes totalDigitCount]
    && (unint64_t v5 = [(__CFString *)v8 length],
        v5 > [(TVRCPINEntryAttributes *)self->_PINEntryattributes totalDigitCount]))
  {
    uint64_t v6 = [(__CFString *)v8 substringToIndex:[(TVRCPINEntryAttributes *)self->_PINEntryattributes totalDigitCount] - 1];

    id v7 = (id)v6;
  }
  else
  {
    id v7 = v8;
  }
  id v9 = v7;
  if (([(NSMutableString *)self->_mutablePasscode isEqualToString:v7] & 1) == 0)
  {
    [(NSMutableString *)self->_mutablePasscode setString:v9];
    [(TVRPasscodeField *)self setNeedsDisplay];
  }
}

- (void)clear
{
  [(NSMutableString *)self->_mutablePasscode setString:&stru_26DB4CAE0];
  [(TVRPasscodeField *)self setNeedsDisplay];
}

- (void)setPINEntryattributes:(id)a3
{
  double v4 = (TVRCPINEntryAttributes *)a3;
  if (self->_PINEntryattributes != v4)
  {
    id v7 = v4;
    if (v4) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = (TVRCPINEntryAttributes *)[objc_alloc(MEMORY[0x263F7C9D0]) initWithDigitCount:4];
    }
    PINEntryattributes = self->_PINEntryattributes;
    self->_PINEntryattributes = v5;

    [(TVRPasscodeField *)self setNeedsDisplay];
    double v4 = v7;
  }
}

- (CGSize)_contentSize
{
  [(TVRPasscodeField *)self _contentWidthWithDotSize:22.0 entrySpacing:25.0 groupSpacing:50.0];
  double v3 = 22.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_contentWidthWithDotSize:(double)a3 entrySpacing:(double)a4 groupSpacing:(double)a5
{
  unint64_t v9 = [(TVRCPINEntryAttributes *)self->_PINEntryattributes totalDigitCount];
  uint64_t v10 = [(TVRCPINEntryAttributes *)self->_PINEntryattributes numberOfDigitGroups];
  return (double)(v9 - v10) * a4 + (double)v9 * a3 + (double)(unint64_t)(v10 - 1) * a5;
}

- (BOOL)hasText
{
  return [(NSMutableString *)self->_mutablePasscode length] != 0;
}

- (void)insertText:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(NSMutableString *)self->_mutablePasscode length];
  uint64_t v5 = [v6 length];
  if ([(TVRPasscodeField *)self isEnabled]
    && [v6 length]
    && v5 + v4 <= (unint64_t)[(TVRCPINEntryAttributes *)self->_PINEntryattributes totalDigitCount])
  {
    [(NSMutableString *)self->_mutablePasscode appendString:v6];
    [(TVRPasscodeField *)self setNeedsDisplay];
    [(TVRPasscodeField *)self sendActionsForControlEvents:0x20000];
  }
}

- (void)deleteBackward
{
  if ([(TVRPasscodeField *)self isEnabled]
    && [(NSMutableString *)self->_mutablePasscode length])
  {
    -[NSMutableString deleteCharactersInRange:](self->_mutablePasscode, "deleteCharactersInRange:", [(NSMutableString *)self->_mutablePasscode length] - 1, 1);
    [(TVRPasscodeField *)self setNeedsDisplay];
    [(TVRPasscodeField *)self sendActionsForControlEvents:0x20000];
  }
}

- (int64_t)autocapitalizationType
{
  return 0;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (BOOL)enablesReturnKeyAutomatically
{
  return 1;
}

- (int64_t)keyboardType
{
  return 11;
}

- (int64_t)keyboardAppearance
{
  return 1;
}

- (int64_t)returnKeyType
{
  return 9;
}

- (BOOL)isSecureTextEntry
{
  return 1;
}

- (BOOL)acceptsSplitKeyboard
{
  return 0;
}

- (BOOL)acceptsFloatingKeyboard
{
  return 0;
}

- (TVRCPINEntryAttributes)PINEntryattributes
{
  return self->_PINEntryattributes;
}

- (BOOL)useSystemColors
{
  return self->_useSystemColors;
}

- (void)setUseSystemColors:(BOOL)a3
{
  self->_useSystemColors = a3;
}

- (NSMutableString)mutablePasscode
{
  return self->_mutablePasscode;
}

- (void)setMutablePasscode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePasscode, 0);
  objc_storeStrong((id *)&self->_PINEntryattributes, 0);
}

@end
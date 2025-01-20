@interface VSTwoFactorDigitView
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)firstRectForRange:(id)a3;
- (NSArray)digits;
- (NSDictionary)markedTextStyle;
- (NSString)codeText;
- (NSString)textContentType;
- (UITextInputDelegate)inputDelegate;
- (UITextInputTokenizer)tokenizer;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (VSTwoFactorDigitView)initWithDigitCount:(unint64_t)a3;
- (VSTwoFactorDigitViewDelegate)delegate;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)selectionRectsForRange:(id)a3;
- (id)textInRange:(id)a3;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)autocapitalizationType;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)keyboardType;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)returnKeyType;
- (unint64_t)digitCount;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)setAutocapitalizationType:(int64_t)a3;
- (void)setCodeText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDigits:(id)a3;
- (void)setInputDelegate:(id)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setMarkedTextStyle:(id)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)setTextContentType:(id)a3;
- (void)setupDigitViews;
@end

@implementation VSTwoFactorDigitView

- (VSTwoFactorDigitView)initWithDigitCount:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VSTwoFactorDigitView;
  v4 = [(VSTwoFactorDigitView *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_digitCount = a3;
    v4->_keyboardType = 4;
    v4->_returnKeyType = 11;
    objc_storeStrong((id *)&v4->_textContentType, (id)*MEMORY[0x263F1D6F0]);
    [(VSTwoFactorDigitView *)v5 setupDigitViews];
    [(VSTwoFactorDigitView *)v5 addTarget:v5 action:sel_onTouchUpInside_ forControlEvents:64];
  }
  return v5;
}

- (void)setCodeText:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24 = v4;
  if (v4)
  {
    v5 = v4;
    unint64_t v6 = [(VSTwoFactorDigitView *)self digitCount];
    unint64_t v7 = [v5 length];
    if (v6 >= v7) {
      unint64_t v6 = v7;
    }
    v8 = [v5 substringToIndex:v6];

    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [codeText substringToIndex:index] parameter must not be nil."];
    }
    v9 = [v5 substringToIndex:v6];
  }
  else
  {
    v9 = &stru_26F361E90;
  }
  unint64_t v10 = [(__CFString *)v9 length];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v23 = self;
  v11 = [(VSTwoFactorDigitView *)self digits];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([(__CFString *)v9 length])
        {
          v18 = &stru_26F361E90;
          if (v14 + i < v10)
          {
            __int16 v25 = 0;
            __int16 v25 = -[__CFString characterAtIndex:](v9, "characterAtIndex:");
            v18 = [NSString stringWithCharacters:&v25 length:1];
          }
        }
        else
        {
          v18 = &stru_26F361E90;
        }
        v19 = [v17 label];
        [v19 setText:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      v14 += i;
    }
    while (v13);
  }

  objc_storeStrong((id *)&v23->_codeText, v9);
  v23->_hasText = v10 != 0;
  v20 = [(VSTwoFactorDigitView *)v23 delegate];
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v21 = (void *)[(__CFString *)v9 copy];
    [v20 twoFactorDigitView:v23 textDidChange:v21];
  }
  uint64_t v22 = [(__CFString *)v9 length];
  if (v22 == [(VSTwoFactorDigitView *)v23 digitCount]) {
    [(VSTwoFactorDigitView *)v23 resignFirstResponder];
  }
}

- (BOOL)canBecomeFirstResponder
{
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23F9AB000, v2, OS_LOG_TYPE_DEFAULT, "Will become first responder.", v4, 2u);
  }

  return 1;
}

- (void)setupDigitViews
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v4 = [(VSTwoFactorDigitView *)self digitCount];
  unint64_t v5 = v4;
  if (v4)
  {
    unint64_t v6 = v4;
    do
    {
      unint64_t v7 = objc_alloc_init(VSDigitView);
      [(VSDigitView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v3 addObject:v7];
      [(VSTwoFactorDigitView *)self addSubview:v7];

      --v6;
    }
    while (v6);
  }
  [(VSTwoFactorDigitView *)self setDigits:v3];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v27 = v5;
    id v11 = 0;
    uint64_t v12 = *(void *)v29;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v11;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
        v16 = [v15 topAnchor];
        v17 = [(VSTwoFactorDigitView *)self topAnchor];
        v18 = [v16 constraintEqualToAnchor:v17];
        [v18 setActive:1];

        v19 = [v15 bottomAnchor];
        v20 = [(VSTwoFactorDigitView *)self bottomAnchor];
        v21 = [v19 constraintEqualToAnchor:v20];
        [v21 setActive:1];

        uint64_t v22 = [v15 leftAnchor];
        if (v14)
        {
          v23 = [v14 rightAnchor];
          [v22 constraintEqualToAnchor:v23 constant:10.0];
        }
        else
        {
          v23 = [(VSTwoFactorDigitView *)self leftAnchor];
          [v22 constraintEqualToAnchor:v23];
        v24 = };
        [v24 setActive:1];

        id v11 = v15;
        ++v13;
        uint64_t v14 = v11;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);

    unint64_t v5 = v27;
  }

  __int16 v25 = [(VSTwoFactorDigitView *)self widthAnchor];
  long long v26 = [v25 constraintEqualToConstant:(double)v5 * 50.0 + -10.0];
  [v26 setActive:1];
}

- (void)deleteBackward
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    unint64_t v7 = "-[VSTwoFactorDigitView deleteBackward]";
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v6, 0xCu);
  }

  unint64_t v4 = [(VSTwoFactorDigitView *)self codeText];
  if ([v4 length])
  {
    unint64_t v5 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
    [(VSTwoFactorDigitView *)self setCodeText:v5];
  }
}

- (void)insertText:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(VSTwoFactorDigitView *)self codeText];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    unint64_t v7 = [MEMORY[0x263F08708] alphanumericCharacterSet];
    uint64_t v8 = [v7 invertedSet];

    uint64_t v9 = [(VSTwoFactorDigitView *)self codeText];
    uint64_t v10 = (void *)[v9 copy];
    id v11 = [v10 componentsSeparatedByCharactersInSet:v8];
    uint64_t v12 = [v11 componentsJoinedByString:&stru_26F361E90];

    if (!v12) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [[[[self codeText] copy] componentsSeparatedByCharactersInSet:removalCharacters] componentsJoinedByString:@\"\"] parameter must not be nil."];
    }
    uint64_t v13 = [(VSTwoFactorDigitView *)self codeText];
    uint64_t v14 = (void *)[v13 copy];
    uint64_t v15 = [v14 componentsSeparatedByCharactersInSet:v8];
    v16 = [v15 componentsJoinedByString:&stru_26F361E90];
  }
  else
  {
    v16 = &stru_26F361E90;
  }
  v17 = [(__CFString *)v16 stringByAppendingString:v4];
  if ([(VSTwoFactorDigitView *)self autocapitalizationType])
  {
    uint64_t v18 = [v17 uppercaseString];

    v17 = (void *)v18;
  }
  v19 = VSDefaultLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    v21 = v17;
    _os_log_impl(&dword_23F9AB000, v19, OS_LOG_TYPE_DEFAULT, "Will set updated text to: %@", (uint8_t *)&v20, 0xCu);
  }

  [(VSTwoFactorDigitView *)self setCodeText:v17];
}

- (UITextRange)selectedTextRange
{
  return 0;
}

- (id)textInRange:(id)a3
{
  return 0;
}

- (UITextRange)markedTextRange
{
  return 0;
}

- (UITextPosition)beginningOfDocument
{
  id v2 = objc_alloc_init(MEMORY[0x263F1CAB8]);
  return (UITextPosition *)v2;
}

- (UITextPosition)endOfDocument
{
  id v2 = objc_alloc_init(MEMORY[0x263F1CAB8]);
  return (UITextPosition *)v2;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return 0;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return 0;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return 0;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return -1;
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return 0;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)hasText
{
  return self->_hasText;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (void)setTextContentType:(id)a3
{
}

- (UITextInputDelegate)inputDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  return (UITextInputDelegate *)WeakRetained;
}

- (void)setInputDelegate:(id)a3
{
}

- (UITextInputTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (NSDictionary)markedTextStyle
{
  return self->_markedTextStyle;
}

- (void)setMarkedTextStyle:(id)a3
{
}

- (VSTwoFactorDigitViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSTwoFactorDigitViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)digitCount
{
  return self->_digitCount;
}

- (NSString)codeText
{
  return self->_codeText;
}

- (NSArray)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_codeText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_markedTextStyle, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_destroyWeak((id *)&self->_inputDelegate);
  objc_storeStrong((id *)&self->_textContentType, 0);
}

@end
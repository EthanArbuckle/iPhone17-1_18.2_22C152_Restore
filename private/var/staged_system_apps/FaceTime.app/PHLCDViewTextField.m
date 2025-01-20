@interface PHLCDViewTextField
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isUserInteractionEnabled;
- (NSCharacterSet)specialDialerCharacters;
- (NSString)previousTextSuggestion;
- (PHLCDViewTextField)initWithFrame:(CGRect)a3;
- (PHLCDViewTextFieldDelegate)lcdViewTextFieldDelegate;
- (void)_textFieldDidUpdate:(id)a3;
- (void)dealloc;
- (void)deleteBackward;
- (void)reformatText;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)setLcdViewTextFieldDelegate:(id)a3;
- (void)setPreviousTextSuggestion:(id)a3;
- (void)setSpecialDialerCharacters:(id)a3;
- (void)setText:(id)a3;
@end

@implementation PHLCDViewTextField

- (PHLCDViewTextField)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PHLCDViewTextField;
  v3 = -[PHLCDViewTextField initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"_textFieldDidUpdate:" name:UITextFieldTextDidChangeNotification object:v3];

    v5 = +[NSCharacterSet unicodeDirectionalCharactersSet];
    v6 = (NSCharacterSet *)[v5 mutableCopy];

    v7 = +[NSCharacterSet characterSetWithCharactersInString:@" -./()"];
    [(NSCharacterSet *)v6 formUnionWithCharacterSet:v7];

    specialDialerCharacters = v3->_specialDialerCharacters;
    v3->_specialDialerCharacters = v6;

    v9 = [(PHLCDViewTextField *)v3 textInputTraits];
    [v9 setContentsIsSingleValue:1];

    [(PHLCDViewTextField *)v3 setNonEditingLinebreakMode:3];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHLCDViewTextField;
  [(PHLCDViewTextField *)&v4 dealloc];
}

- (void)reformatText
{
  v3 = [(PHLCDViewTextField *)self text];
  if ([v3 length])
  {
    if ([(PHLCDViewTextField *)self isEditing]) {
      [(PHLCDViewTextField *)self selectionRange];
    }
    unint64_t v13 = 0;
    objc_super v4 = [(PHLCDViewTextField *)self previousTextSuggestion];
    v5 = TUNetworkCountryCode();
    if (v5)
    {
      CFStringRef v6 = (const __CFString *)_PNCopyFormattedNumberSuggestionForDigitsWithCountry();
    }
    else
    {
      v7 = TUHomeCountryCode();
      CFStringRef v6 = (const __CFString *)_PNCopyFormattedNumberSuggestionForDigitsWithCountry();
    }
    if (v6)
    {
      v8 = TUNetworkCountryCode();
      if (v8)
      {
        v9 = (void *)PNCreateFormattedStringWithCountry();
      }
      else
      {
        v10 = TUHomeCountryCode();
        v9 = (void *)PNCreateFormattedStringWithCountry();
      }
      if (([v3 isEqualToString:v9] & 1) == 0)
      {
        v12.receiver = self;
        v12.super_class = (Class)PHLCDViewTextField;
        [(PHLCDViewTextField *)&v12 setText:v9];
        if ([(PHLCDViewTextField *)self isEditing])
        {
          unint64_t Length = v13;
          if (Length > CFStringGetLength(v6)) {
            unint64_t Length = CFStringGetLength(v6);
          }
          -[PHLCDViewTextField setSelectionRange:](self, "setSelectionRange:", Length + 1, 0);
        }
      }
      [(PHLCDViewTextField *)self setPreviousTextSuggestion:v9];
      CFRelease(v6);
    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)isUserInteractionEnabled
{
  return 1;
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHLCDViewTextField;
  [(PHLCDViewTextField *)&v4 setText:a3];
  [(PHLCDViewTextField *)self reformatText];
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PHLCDViewTextField;
  [(PHLCDViewTextField *)&v5 replaceRange:a3 withText:a4];
  [(PHLCDViewTextField *)self reformatText];
}

- (void)deleteBackward
{
  v3 = [(PHLCDViewTextField *)self selectedTextRange];
  unsigned int v4 = [v3 isEmpty];

  if (v4)
  {
    objc_super v5 = [(PHLCDViewTextField *)self beginningOfDocument];
    CFStringRef v6 = [(PHLCDViewTextField *)self selectedTextRange];
    v7 = [v6 end];
    v8 = [(PHLCDViewTextField *)self textRangeFromPosition:v5 toPosition:v7];
    v9 = [(PHLCDViewTextField *)self textInRange:v8];

    v10 = [(PHLCDViewTextField *)self specialDialerCharacters];
    objc_super v11 = [v10 invertedSet];
    objc_super v12 = (char *)[v9 rangeOfCharacterFromSet:v11 options:4];

    unint64_t v13 = [(PHLCDViewTextField *)self beginningOfDocument];
    v14 = [(PHLCDViewTextField *)self positionFromPosition:v13 offset:v12 + 1];

    v15 = [(PHLCDViewTextField *)self textRangeFromPosition:v14 toPosition:v14];
    [(PHLCDViewTextField *)self setSelectedTextRange:v15];
    v16.receiver = self;
    v16.super_class = (Class)PHLCDViewTextField;
    [(PHLCDViewTextField *)&v16 deleteBackward];
  }
  else
  {
    v9 = [(PHLCDViewTextField *)self selectedTextRange];
    [(PHLCDViewTextField *)self replaceRange:v9 withText:&stru_1000A3488];
  }

  [(PHLCDViewTextField *)self reformatText];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PHLCDViewTextField;
  BOOL v5 = [(PHLCDViewTextField *)&v7 canPerformAction:a3 withSender:a4];
  return NSSelectorFromString(@"_define:") != a3 && v5;
}

- (void)_textFieldDidUpdate:(id)a3
{
  p_lcdViewTextFieldDelegate = &self->_lcdViewTextFieldDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lcdViewTextFieldDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_lcdViewTextFieldDelegate);
    v8 = [(PHLCDViewTextField *)self text];
    [v7 textField:self didUpdateString:v8];
  }
  id v12 = [(PHLCDViewTextField *)self selectedTextRange];
  if ([v12 isEmpty])
  {
    v9 = [v12 end];
    v10 = [(PHLCDViewTextField *)self endOfDocument];
    unsigned int v11 = [v9 isEqual:v10];

    if (v11) {
      [(PHLCDViewTextField *)self endEditing:1];
    }
  }
  [(PHLCDViewTextField *)self reformatText];
}

- (PHLCDViewTextFieldDelegate)lcdViewTextFieldDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lcdViewTextFieldDelegate);

  return (PHLCDViewTextFieldDelegate *)WeakRetained;
}

- (void)setLcdViewTextFieldDelegate:(id)a3
{
}

- (NSCharacterSet)specialDialerCharacters
{
  return self->_specialDialerCharacters;
}

- (void)setSpecialDialerCharacters:(id)a3
{
}

- (NSString)previousTextSuggestion
{
  return self->_previousTextSuggestion;
}

- (void)setPreviousTextSuggestion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTextSuggestion, 0);
  objc_storeStrong((id *)&self->_specialDialerCharacters, 0);

  objc_destroyWeak((id *)&self->_lcdViewTextFieldDelegate);
}

@end
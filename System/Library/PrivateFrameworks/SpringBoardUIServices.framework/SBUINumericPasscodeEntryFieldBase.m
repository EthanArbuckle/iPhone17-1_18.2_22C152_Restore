@interface SBUINumericPasscodeEntryFieldBase
+ (BOOL)_shouldResetAutoAcceptWhenMaxNumbersMetInResignFirstResponder;
- (BOOL)_hasMaxDigitsSpecified;
- (BOOL)allowsNewlineAcceptance;
- (BOOL)autoAcceptWhenMaxNumbersMet;
- (BOOL)resignFirstResponder;
- (BOOL)shouldInsertPasscodeText:(id)a3;
- (SBUINumericPasscodeEntryFieldBase)initWithDefaultSizeAndLightStyle:(BOOL)a3;
- (unint64_t)maxNumbersAllowed;
- (void)_appendString:(id)a3;
- (void)_deleteLastCharacter;
- (void)_reallyAppendString:(id)a3;
- (void)setAllowsNewlineAcceptance:(BOOL)a3;
- (void)setAutoAcceptWhenMaxNumbersMet:(BOOL)a3;
- (void)setMaxNumbersAllowed:(unint64_t)a3;
@end

@implementation SBUINumericPasscodeEntryFieldBase

- (SBUINumericPasscodeEntryFieldBase)initWithDefaultSizeAndLightStyle:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBUINumericPasscodeEntryFieldBase;
  v3 = [(SBUIPasscodeEntryField *)&v9 initWithDefaultSizeAndLightStyle:a3];
  if (v3)
  {
    v4 = (NSMutableCharacterSet *)objc_alloc_init(MEMORY[0x1E4F28E58]);
    numericTrimmingSet = v3->_numericTrimmingSet;
    v3->_numericTrimmingSet = v4;

    v6 = v3->_numericTrimmingSet;
    v7 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    [(NSMutableCharacterSet *)v6 formUnionWithCharacterSet:v7];

    v3->_allowsNewlineAcceptance = 0;
    v3->_maxNumbersAllowed = -1;
    v3->_autoAcceptWhenMaxNumbersMet = 1;
  }
  return v3;
}

- (void)setAllowsNewlineAcceptance:(BOOL)a3
{
  if (self->_allowsNewlineAcceptance != a3)
  {
    self->_allowsNewlineAcceptance = a3;
    numericTrimmingSet = self->_numericTrimmingSet;
    if (a3)
    {
      id v4 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      -[NSMutableCharacterSet formUnionWithCharacterSet:](numericTrimmingSet, "formUnionWithCharacterSet:");
    }
    else
    {
      id v4 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
      -[NSMutableCharacterSet formIntersectionWithCharacterSet:](numericTrimmingSet, "formIntersectionWithCharacterSet:");
    }
  }
}

- (BOOL)resignFirstResponder
{
  if ([(id)objc_opt_class() _shouldResetAutoAcceptWhenMaxNumbersMetInResignFirstResponder]) {
    [(SBUINumericPasscodeEntryFieldBase *)self setAutoAcceptWhenMaxNumbersMet:1];
  }
  v4.receiver = self;
  v4.super_class = (Class)SBUINumericPasscodeEntryFieldBase;
  return [(SBUIPasscodeEntryField *)&v4 resignFirstResponder];
}

- (BOOL)shouldInsertPasscodeText:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBUINumericPasscodeEntryFieldBase;
  if ([(SBUIPasscodeEntryField *)&v7 shouldInsertPasscodeText:v4]) {
    char v5 = [v4 isSingleCharacterAndMemberOfSet:self->_numericTrimmingSet];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)_deleteLastCharacter
{
  id v5 = [(SBUIPasscodeEntryField *)self _textField];
  v3 = [v5 text];
  if ([v3 length])
  {
    id v4 = [v3 _stringByTrimmingLastCharacter];
    [v5 setText:v4];

    [(SBUIPasscodeEntryField *)self notePasscodeFieldTextDidChange];
  }
}

- (void)_appendString:(id)a3
{
  id v9 = a3;
  id v4 = [(SBUIPasscodeEntryField *)self stringValue];
  uint64_t v5 = [v4 length];

  if (![(SBUINumericPasscodeEntryFieldBase *)self _hasMaxDigitsSpecified])
  {
    if (!v5
      || ![v9 isNewline]
      || ![(SBUINumericPasscodeEntryFieldBase *)self allowsNewlineAcceptance])
    {
      [(SBUINumericPasscodeEntryFieldBase *)self _reallyAppendString:v9];
      goto LABEL_12;
    }
LABEL_10:
    [(SBUIPasscodeEntryField *)self notePasscodeFieldDidAcceptEntry];
    goto LABEL_12;
  }
  if ([v9 length] + v5 <= self->_maxNumbersAllowed) {
    [(SBUINumericPasscodeEntryFieldBase *)self _reallyAppendString:v9];
  }
  if (self->_autoAcceptWhenMaxNumbersMet)
  {
    v6 = [(SBUIPasscodeEntryField *)self stringValue];
    unint64_t v7 = [v6 length];
    unint64_t maxNumbersAllowed = self->_maxNumbersAllowed;

    if (v7 >= maxNumbersAllowed) {
      goto LABEL_10;
    }
  }
LABEL_12:
}

+ (BOOL)_shouldResetAutoAcceptWhenMaxNumbersMetInResignFirstResponder
{
  return 1;
}

- (void)_reallyAppendString:(id)a3
{
  id v8 = a3;
  id v4 = [(SBUIPasscodeEntryField *)self _textField];
  uint64_t v5 = [v4 text];
  if (v5)
  {
    v6 = v5;
    id v7 = [v5 stringByAppendingString:v8];
  }
  else
  {
    id v7 = v8;
  }
  [v4 setText:v7];
  [(SBUIPasscodeEntryField *)self notePasscodeFieldTextDidChange];
}

- (BOOL)_hasMaxDigitsSpecified
{
  return self->_maxNumbersAllowed != -1;
}

- (BOOL)allowsNewlineAcceptance
{
  return self->_allowsNewlineAcceptance;
}

- (unint64_t)maxNumbersAllowed
{
  return self->_maxNumbersAllowed;
}

- (void)setMaxNumbersAllowed:(unint64_t)a3
{
  self->_unint64_t maxNumbersAllowed = a3;
}

- (BOOL)autoAcceptWhenMaxNumbersMet
{
  return self->_autoAcceptWhenMaxNumbersMet;
}

- (void)setAutoAcceptWhenMaxNumbersMet:(BOOL)a3
{
  self->_autoAcceptWhenMaxNumbersMet = a3;
}

- (void).cxx_destruct
{
}

@end
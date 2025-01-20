@interface TIMathSymbolPunctuationController
- (BOOL)converted;
- (BOOL)enabled;
- (BOOL)replaceAfterNumerals;
- (BOOL)updateInputString:(id)a3;
- (NSString)decimalSeparator;
- (TIMathSymbolPunctuationController)init;
- (id)mathSymbolPunctuationedStringForInputString:(id)a3;
- (void)reset;
- (void)setDecimalSeparator:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInputString:(id)a3;
- (void)setReplaceAfterNumerals:(BOOL)a3;
@end

@implementation TIMathSymbolPunctuationController

- (void).cxx_destruct
{
}

- (BOOL)converted
{
  return self->_converted;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setReplaceAfterNumerals:(BOOL)a3
{
  self->_replaceAfterNumerals = a3;
}

- (BOOL)replaceAfterNumerals
{
  return self->_replaceAfterNumerals;
}

- (void)setDecimalSeparator:(id)a3
{
}

- (NSString)decimalSeparator
{
  return self->_decimalSeparator;
}

- (id)mathSymbolPunctuationedStringForInputString:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (!v5)
  {
    v17 = 0;
    goto LABEL_31;
  }
  unint64_t v10 = v5;
  MEMORY[0x1F4188790](v5, v6, v7, v8, v9);
  v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  [v4 getCharacters:v12];
  BOOL v13 = [(TIMathSymbolPunctuationController *)self updateInputString:v4];
  if (v13 != [(TIMathSymbolPunctuationController *)self replaceAfterNumerals]
    || !self->_state
    || !self->_enabled)
  {
LABEL_28:
    LOBYTE(v16) = 0;
    goto LABEL_29;
  }
  if (!self->_replaceAfterNumerals)
  {
    uint64_t v14 = *(unsigned __int16 *)&v12[2 * v10 - 2];
    v15 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    int v16 = [v15 characterIsMember:v14];

    if (!v16)
    {
      v17 = 0;
      goto LABEL_35;
    }
  }
  if (v10 >= 2 && self->_state == 2)
  {
    if (v10 == 2) {
      int v16 = 1;
    }
    else {
      int v16 = IsNumeric(*(unsigned __int16 *)&v12[2 * v10 - 6]);
    }
  }
  else
  {
    int v16 = 0;
  }
  int64_t location = self->_location;
  if (v10 >= location + 1 && self->_state == 1)
  {
    uint64_t v19 = *(unsigned __int16 *)&v12[2 * location - 2];
    v20 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    LODWORD(v19) = [v20 characterIsMember:v19];

    if (v19)
    {
      if (self->_replaceAfterNumerals || IsNumeric(*(unsigned __int16 *)&v12[2 * self->_location + 2])) {
        int v16 = 1;
      }
    }
  }
  int64_t v21 = self->_location;
  if (v10 > v21 + 3
    && self->_state == 3
    && (uint64_t v22 = *(unsigned __int16 *)&v12[2 * v21 - 2],
        [MEMORY[0x1E4F28B88] decimalDigitCharacterSet],
        v23 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v22) = [v23 characterIsMember:v22],
        v23,
        v22)
    && IsNumeric(*(unsigned __int16 *)&v12[2 * self->_location + 2])
    && IsNumeric(*(unsigned __int16 *)&v12[2 * self->_location + 4])
    && (IsNumeric(*(unsigned __int16 *)&v12[2 * self->_location + 6]) & 1) != 0
    || v16)
  {
    unint64_t v24 = self->_location;
    if (v24 < [v4 length])
    {
      int64_t v25 = self->_location;
      LOBYTE(v16) = 1;
      v26 = [NSString stringWithCharacters:&self->_replacementCharacter length:1];
      v17 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v25, 1, v26);

LABEL_35:
      self->_state = 0;
      goto LABEL_30;
    }
    goto LABEL_28;
  }
LABEL_29:
  v17 = 0;
LABEL_30:
  self->_converted = v16;
LABEL_31:

  return v17;
}

- (BOOL)updateInputString:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = (char *)v14 - ((2 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    [v4 getCharacters:v7];
    BOOL v8 = 0;
    int64_t v9 = v6 - 1;
    unsigned int v10 = *(unsigned __int16 *)&v7[2 * v9];
    unsigned __int16 v11 = 8722;
    unint64_t v12 = 2;
    if (v10 <= 0xFF0B)
    {
      if (*(unsigned __int16 *)&v7[2 * v9] > 0x3001u)
      {
        if (v10 != 12290)
        {
          if (v10 != 12540) {
            goto LABEL_30;
          }
          goto LABEL_28;
        }
LABEL_21:
        if (v9 && [(NSString *)self->_decimalSeparator isEqualToString:@"."])
        {
          unsigned __int16 v11 = 46;
          goto LABEL_27;
        }
        goto LABEL_29;
      }
      if (v10 == 58) {
        goto LABEL_19;
      }
      if (v10 == 12289) {
        goto LABEL_12;
      }
    }
    else
    {
      if (*(unsigned __int16 *)&v7[2 * v9] > 0xFF60u)
      {
        if (v10 == 65392) {
          goto LABEL_28;
        }
        if (v10 != 65380)
        {
          if (v10 != 65377) {
            goto LABEL_30;
          }
          goto LABEL_21;
        }
LABEL_12:
        if (!v9) {
          goto LABEL_29;
        }
        unsigned __int16 v11 = 44;
        unint64_t v12 = 3;
LABEL_28:
        self->_state = v12;
        self->_int64_t location = v9;
        BOOL v8 = 1;
        self->_replacementCharacter = v11;
        goto LABEL_30;
      }
      if (v10 == 65292)
      {
        if (v9 && [(NSString *)self->_decimalSeparator isEqualToString:@","])
        {
          unsigned __int16 v11 = 44;
          goto LABEL_27;
        }
        goto LABEL_29;
      }
      if (v10 == 65306)
      {
LABEL_19:
        if (v9)
        {
          unsigned __int16 v11 = 58;
LABEL_27:
          unint64_t v12 = 1;
          goto LABEL_28;
        }
LABEL_29:
        BOOL v8 = 0;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_30:

  return v8;
}

- (void)setInputString:(id)a3
{
  id v4 = a3;
  [(TIMathSymbolPunctuationController *)self reset];
  [(TIMathSymbolPunctuationController *)self updateInputString:v4];
}

- (void)reset
{
  self->_state = 0;
  self->_enabled = 1;
}

- (TIMathSymbolPunctuationController)init
{
  v7.receiver = self;
  v7.super_class = (Class)TIMathSymbolPunctuationController;
  v2 = [(TIMathSymbolPunctuationController *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v4 = [v3 decimalSeparator];
    decimalSeparator = v2->_decimalSeparator;
    v2->_decimalSeparator = (NSString *)v4;

    v2->_enabled = 1;
  }
  return v2;
}

@end
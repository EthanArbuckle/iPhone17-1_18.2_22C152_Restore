@interface TISmartPunctuationController
+ (id)_chineseContextualVariantMapping;
- (BOOL)smartDashesEnabled;
- (BOOL)smartQuotesEnabled;
- (TISmartPunctuationController)init;
- (TISmartPunctuationOptions)smartPunctuationOptions;
- (id)_alternatingStringForInputString:(id)a3 isLockedInput:(BOOL)a4 hasMarkedText:(BOOL)a5;
- (id)_checkInput:(id)a3 forContextualChinesePunctuationInDocumentState:(id)a4;
- (id)_checkInput:(id)a3 forContextualDashesInDocumentState:(id)a4;
- (id)_checkInput:(id)a3 forContextualEllipsesInDocumentState:(id)a4;
- (id)_checkInput:(id)a3 forContextualQuotesInDocumentState:(id)a4;
- (id)smartPunctuationOutputForInput:(id)a3 isLockedInput:(BOOL)a4 documentState:(id)a5;
- (id)smartPunctuationResultsForString:(id)a3;
- (id)smartPunctuationedStringForString:(id)a3;
- (unint64_t)autoQuoteType;
- (void)_initializeDashCharacterSetsIfNecessary;
- (void)_initializeQuoteCharacterSetsIfNecessary;
- (void)reset;
- (void)setAutoQuoteType:(unint64_t)a3;
- (void)setSmartDashesEnabled:(BOOL)a3;
- (void)setSmartPunctuationOptions:(id)a3;
- (void)setSmartQuotesEnabled:(BOOL)a3;
@end

@implementation TISmartPunctuationController

- (void)setSmartQuotesEnabled:(BOOL)a3
{
  self->_smartQuotesEnabled = a3;
}

- (void)setSmartDashesEnabled:(BOOL)a3
{
  self->_smartDashesEnabled = a3;
}

- (void)reset
{
  *(_WORD *)&self->_leftSingleQuotationMarkInserted = 0;
}

- (unint64_t)autoQuoteType
{
  return self->_autoQuoteType;
}

- (void)setSmartPunctuationOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartPunctuationOptions, 0);
  objc_storeStrong((id *)&self->_emDashCharacterSet, 0);
  objc_storeStrong((id *)&self->_enDashCharacterSet, 0);
  objc_storeStrong((id *)&self->_dashCharacterSet, 0);
  objc_storeStrong((id *)&self->_bookTitleMarkCharacterSet, 0);
  objc_storeStrong((id *)&self->_cornerBracketCharacterSet, 0);
  objc_storeStrong((id *)&self->_dutchApostropheFollowingSet, 0);
  objc_storeStrong((id *)&self->_germanApostrophePrecedingSet, 0);
  objc_storeStrong((id *)&self->_openerCharacterSet, 0);
  objc_storeStrong((id *)&self->_punctuationCharacterSet, 0);
  objc_storeStrong((id *)&self->_decimalDigitCharacterSet, 0);
  objc_storeStrong((id *)&self->_whitespaceAndNewlineCharacterSet, 0);

  objc_storeStrong((id *)&self->_alphanumericCharacterSet, 0);
}

- (TISmartPunctuationOptions)smartPunctuationOptions
{
  return self->_smartPunctuationOptions;
}

- (void)setAutoQuoteType:(unint64_t)a3
{
  self->_autoQuoteType = a3;
}

- (BOOL)smartDashesEnabled
{
  return self->_smartDashesEnabled;
}

- (BOOL)smartQuotesEnabled
{
  return self->_smartQuotesEnabled;
}

- (id)_checkInput:(id)a3 forContextualEllipsesInDocumentState:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"."]
    && ([v5 contextBeforeInput],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 hasSuffix:@".."],
        v6,
        v7))
  {
    v8 = objc_alloc_init(TIKeyboardOutput);
    [(TIKeyboardOutput *)v8 deleteBackward:2];
    [(TIKeyboardOutput *)v8 insertText:@"…"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_checkInput:(id)a3 forContextualDashesInDocumentState:(id)a4
{
  id v6 = a4;
  if (![a3 isEqualToString:@"-"]) {
    goto LABEL_18;
  }
  [(TISmartPunctuationController *)self _initializeDashCharacterSetsIfNecessary];
  int v7 = [v6 contextBeforeInput];
  uint64_t v8 = [v7 length];

  v9 = [v6 contextBeforeInput];
  uint64_t v10 = objc_msgSend(v9, "rangeOfCharacterFromSet:options:range:", self->_dashCharacterSet, 12, 0, v8);
  unint64_t v12 = v11;

  v13 = [v6 contextBeforeInput];
  uint64_t v40 = objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", self->_enDashCharacterSet, 12, 0, v8);
  uint64_t v15 = v14;

  v16 = [v6 contextBeforeInput];
  uint64_t v41 = objc_msgSend(v16, "rangeOfCharacterFromSet:options:range:", self->_emDashCharacterSet, 12, 0, v8);
  uint64_t v18 = v17;

  if (v10 && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    do
    {
      v19 = objc_msgSend(v6, "contextBeforeInput", v40);
      uint64_t v20 = objc_msgSend(v19, "rangeOfCharacterFromSet:options:range:", self->_dashCharacterSet, 12, v10 - 1, 1);
      uint64_t v22 = v21;

      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v23 = 0;
      }
      else
      {
        uint64_t v10 = v20;
        uint64_t v23 = v22;
      }
      v12 += v23;
    }
    while (v20 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0);
  }
  if (v12)
  {
    v25 = [v6 contextBeforeInput];
    BOOL v26 = v12 + v10 == [v25 length];

    if (v15) {
      goto LABEL_14;
    }
LABEL_27:
    BOOL v29 = 0;
    if (!v18) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  BOOL v26 = 0;
  if (!v15) {
    goto LABEL_27;
  }
LABEL_14:
  uint64_t v27 = v40 + v15;
  v28 = objc_msgSend(v6, "contextBeforeInput", v40);
  BOOL v29 = v27 == [v28 length];

  if (v18)
  {
LABEL_15:
    v30 = objc_msgSend(v6, "contextBeforeInput", v40);
    LODWORD(v18) = v41 + v18 == [v30 length];
  }
LABEL_16:
  if (!v26 && !v29 && !v18)
  {
LABEL_18:
    v31 = 0;
    goto LABEL_40;
  }
  char v32 = !v26;
  if (v12 != 1) {
    char v32 = 1;
  }
  if ((v32 & 1) == 0)
  {
    v33 = [v6 contextBeforeInput];
    v34 = [v33 substringToIndex:v10];

    if (-[NSCharacterSet characterIsMember:](self->_decimalDigitCharacterSet, "characterIsMember:", (unsigned __int16)[v34 _lastLongCharacter]))
    {
      uint64_t v35 = 8211;
    }
    else
    {
      uint64_t v35 = 8212;
    }

LABEL_38:
    uint64_t v36 = 1;
    goto LABEL_39;
  }
  if (v26 && v12 > 1) {
    uint64_t v36 = 2;
  }
  else {
    uint64_t v36 = 1;
  }
  if ((!v26 || v12 <= 1) && !v29)
  {
    char v37 = v18 ^ 1;
    if (v12 != 1) {
      char v37 = 1;
    }
    if (v37) {
      goto LABEL_18;
    }
    uint64_t v35 = 8212;
    goto LABEL_38;
  }
  uint64_t v35 = 8212;
LABEL_39:
  v31 = objc_alloc_init(TIKeyboardOutput);
  [(TIKeyboardOutput *)v31 deleteBackward:v36];
  v38 = [NSString _stringWithUnichar:v35];
  [(TIKeyboardOutput *)v31 insertText:v38];

LABEL_40:

  return v31;
}

- (id)_checkInput:(id)a3 forContextualChinesePunctuationInDocumentState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"「"]) {
    int v8 = 1;
  }
  else {
    int v8 = [v6 isEqualToString:@"」"];
  }
  if ([v6 isEqualToString:@"《"]) {
    int v9 = 1;
  }
  else {
    int v9 = [v6 isEqualToString:@"》"];
  }
  uint64_t v10 = [(TISmartPunctuationController *)self smartPunctuationOptions];
  unint64_t v11 = [v10 locale];
  unint64_t v12 = [v11 localeIdentifier];
  int v13 = [v12 isEqualToString:@"zh-Hans"];

  if (v8) {
    int v14 = v13;
  }
  else {
    int v14 = v9;
  }
  if (v14 == 1)
  {
    [(TISmartPunctuationController *)self _initializeQuoteCharacterSetsIfNecessary];
    uint64_t v15 = 80;
    if (v8) {
      uint64_t v15 = 72;
    }
    id v16 = *(id *)((char *)&self->super.isa + v15);
    uint64_t v17 = [v7 contextBeforeInput];
    uint64_t v18 = [v17 rangeOfCharacterFromSet:v16 options:4];
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v21 = objc_msgSend(v17, "substringWithRange:", v18, v19);
      uint64_t v22 = [(id)objc_opt_class() _chineseContextualVariantMapping];
      uint64_t v23 = [v22 objectForKeyedSubscript:v6];
      v24 = [v23 objectForKeyedSubscript:v21];

      if (v24)
      {
        uint64_t v20 = objc_alloc_init(TIKeyboardOutput);
        [(TIKeyboardOutput *)v20 insertText:v24];
      }
      else
      {
        uint64_t v20 = 0;
      }
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

- (id)_checkInput:(id)a3 forContextualQuotesInDocumentState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 rangeOfString:@"'"];
  uint64_t v10 = v8;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [v6 rangeOfString:@"\""];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v13 = 0;
      goto LABEL_35;
    }
    uint64_t v15 = v11;
    uint64_t v14 = v12;
  }
  else
  {
    uint64_t v14 = v9;
    uint64_t v15 = v8;
  }
  id v16 = [(TISmartPunctuationController *)self smartPunctuationOptions];
  if (v16)
  {
    uint64_t v17 = v16;
    [(TISmartPunctuationController *)self _initializeQuoteCharacterSetsIfNecessary];
    uint64_t v18 = [v7 contextBeforeInput];
    uint64_t v19 = (void *)v18;
    if (v18) {
      uint64_t v20 = (__CFString *)v18;
    }
    else {
      uint64_t v20 = &stru_1EDBDCE38;
    }
    uint64_t v21 = [v6 substringToIndex:v15];
    [(__CFString *)v20 stringByAppendingString:v21];
    v23 = uint64_t v22 = v15;

    uint64_t v53 = v22;
    uint64_t v54 = v14;
    v24 = [v6 substringFromIndex:v22 + v14];
    id v55 = v7;
    uint64_t v25 = [v7 contextAfterInput];
    BOOL v26 = (void *)v25;
    if (v25) {
      uint64_t v27 = (__CFString *)v25;
    }
    else {
      uint64_t v27 = &stru_1EDBDCE38;
    }
    v28 = [v24 stringByAppendingString:v27];

    unsigned __int16 v29 = [v23 _lastLongCharacter];
    v52 = v28;
    unsigned __int16 v50 = [v28 _firstLongCharacter];
    uint64_t v51 = [v23 length];
    BOOL v30 = [(NSCharacterSet *)self->_whitespaceAndNewlineCharacterSet characterIsMember:v29];
    BOOL v31 = [(NSCharacterSet *)self->_openerCharacterSet characterIsMember:v29];
    char v32 = [v17 leftSingleQuote];
    [v23 rangeOfString:v32 options:12];
    uint64_t v49 = v33;

    v34 = [v17 leftDoubleQuote];
    [v23 rangeOfString:v34 options:12];
    uint64_t v36 = v35;

    BOOL v37 = [(NSCharacterSet *)self->_alphanumericCharacterSet characterIsMember:v29];
    BOOL v38 = [(NSCharacterSet *)self->_alphanumericCharacterSet characterIsMember:v50];
    if (v51) {
      int v39 = v30;
    }
    else {
      int v39 = 1;
    }
    int v40 = v39 | v31;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v49) {
        int v40 = 1;
      }
      smartPunctuationOptions = self->_smartPunctuationOptions;
      if (v40 == 1) {
        [(TISmartPunctuationOptions *)smartPunctuationOptions leftDoubleQuote];
      }
      else {
      uint64_t v42 = [(TISmartPunctuationOptions *)smartPunctuationOptions rightDoubleQuote];
      }
    }
    else
    {
      if (v36) {
        int v40 = 1;
      }
      if (v40 != 1)
      {
        int v45 = v37 && v38;
        v46 = self->_smartPunctuationOptions;
        id v7 = v55;
        uint64_t v44 = v54;
        if (v45 == 1) {
          [(TISmartPunctuationOptions *)v46 apostrophe];
        }
        else {
        v43 = [(TISmartPunctuationOptions *)v46 rightSingleQuote];
        }
        goto LABEL_33;
      }
      uint64_t v42 = [(TISmartPunctuationOptions *)self->_smartPunctuationOptions leftSingleQuote];
    }
    v43 = (void *)v42;
    id v7 = v55;
    uint64_t v44 = v54;
LABEL_33:
    v47 = objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", v53, v44, v43, v49);

    int v13 = objc_alloc_init(TIKeyboardOutput);
    [(TIKeyboardOutput *)v13 insertText:v47];

    id v16 = v17;
    goto LABEL_34;
  }
  int v13 = 0;
LABEL_34:

LABEL_35:

  return v13;
}

- (id)_alternatingStringForInputString:(id)a3 isLockedInput:(BOOL)a4 hasMarkedText:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = @"\"";
  if (([v8 containsString:@"\""] & 1) == 0)
  {
    int v13 = [v8 containsString:@"'"];
    if (v13)
    {
      char v11 = 0;
      char v10 = 0;
    }
    else
    {
      char v11 = [v8 containsString:@"“"];
      if (v11 & 1) != 0 || ([v8 containsString:@"”"])
      {
        int v13 = 0;
        char v10 = v11 ^ 1;
        p_leftDoubleQuotationMarkInserted = &self->_leftDoubleQuotationMarkInserted;
        goto LABEL_17;
      }
      if ([v8 containsString:@"‘"])
      {
        char v10 = 0;
        char v11 = 1;
      }
      else
      {
        if (![v8 containsString:@"’"]) {
          goto LABEL_6;
        }
        char v11 = 0;
        char v10 = 1;
      }
    }
    if (!a5)
    {
      uint64_t v9 = @"'";
      uint64_t v12 = @"’";
      uint64_t v14 = 8;
      uint64_t v15 = @"‘";
      goto LABEL_11;
    }
LABEL_6:
    id v16 = 0;
    goto LABEL_22;
  }
  char v10 = 0;
  char v11 = 0;
  uint64_t v12 = @"”";
  int v13 = 1;
  uint64_t v14 = 9;
  uint64_t v15 = @"“";
LABEL_11:
  p_leftDoubleQuotationMarkInserted = (BOOL *)self + v14;
  if (v13 && !v6)
  {
    if (*p_leftDoubleQuotationMarkInserted) {
      uint64_t v18 = v12;
    }
    else {
      uint64_t v18 = v15;
    }
    id v16 = [v8 stringByReplacingOccurrencesOfString:v9 withString:v18];
    char v11 = !*p_leftDoubleQuotationMarkInserted;
    goto LABEL_21;
  }
LABEL_17:
  id v16 = 0;
  if ((v11 & 1) == 0 && (v10 & 1) == 0)
  {
    id v16 = 0;
    if ((v13 & v6) != 1) {
      goto LABEL_22;
    }
    char v11 = 0;
  }
LABEL_21:
  BOOL *p_leftDoubleQuotationMarkInserted = v11;
LABEL_22:

  return v16;
}

- (id)smartPunctuationOutputForInput:(id)a3 isLockedInput:(BOOL)a4 documentState:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v8
    || ![(TISmartPunctuationController *)self smartQuotesEnabled]
    && ![(TISmartPunctuationController *)self smartDashesEnabled])
  {
    char v11 = 0;
    goto LABEL_27;
  }
  if ([(TISmartPunctuationController *)self smartQuotesEnabled])
  {
    if ([(TISmartPunctuationController *)self autoQuoteType] != 2 || v6)
    {
      if ([(TISmartPunctuationController *)self autoQuoteType] == 1)
      {
        uint64_t v12 = [v9 markedText];
        int v13 = -[TISmartPunctuationController _alternatingStringForInputString:isLockedInput:hasMarkedText:](self, "_alternatingStringForInputString:isLockedInput:hasMarkedText:", v8, v6, [v12 length] != 0);

        if (v13)
        {
          char v10 = objc_alloc_init(TIKeyboardOutput);
          [(TIKeyboardOutput *)v10 insertText:v13];
        }
        else
        {
          char v10 = 0;
        }
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = [(TISmartPunctuationController *)self _checkInput:v8 forContextualQuotesInDocumentState:v9];
    }
    if (!v10 && !v6)
    {
      char v10 = [(TISmartPunctuationController *)self _checkInput:v8 forContextualChinesePunctuationInDocumentState:v9];
    }
    if (![(TISmartPunctuationController *)self smartDashesEnabled])
    {
      char v11 = 0;
      uint64_t v14 = 0;
      if (!v10) {
        goto LABEL_27;
      }
      goto LABEL_25;
    }
LABEL_21:
    uint64_t v14 = [(TISmartPunctuationController *)self _checkInput:v8 forContextualDashesInDocumentState:v9];
    char v11 = [(TISmartPunctuationController *)self _checkInput:v8 forContextualEllipsesInDocumentState:v9];
    if (!v10)
    {
      if (!v14) {
        goto LABEL_27;
      }
      uint64_t v15 = v14;
      goto LABEL_26;
    }
LABEL_25:
    uint64_t v15 = v10;

    char v11 = v14;
LABEL_26:

    char v11 = v15;
    goto LABEL_27;
  }
  char v10 = 0;
  char v11 = 0;
  if ([(TISmartPunctuationController *)self smartDashesEnabled]) {
    goto LABEL_21;
  }
LABEL_27:

  return v11;
}

- (id)smartPunctuationedStringForString:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && ([(TISmartPunctuationController *)self smartQuotesEnabled]
     || [(TISmartPunctuationController *)self smartDashesEnabled]))
  {
    uint64_t v25 = (void *)[v4 mutableCopy];
    uint64_t v27 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-'\""];
    uint64_t v5 = [v4 length];
    if (v5)
    {
      uint64_t v6 = v5;
      BOOL v26 = self;
      while (1)
      {
        uint64_t v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v27, 4, 0, v6);
        if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_12;
        }
        uint64_t v9 = v7;
        uint64_t v10 = v8;
        uint64_t v11 = [v4 substringToIndex:v7];
        uint64_t v12 = [v4 substringFromIndex:v9 + v10];
        int v13 = objc_msgSend(v4, "substringWithRange:", v9, v10);
        uint64_t v14 = +[TIDocumentState documentStateWithContextBefore:v11 selectedText:0 contextAfter:v12];
        uint64_t v15 = [(TISmartPunctuationController *)self smartPunctuationOutputForInput:v13 isLockedInput:0 documentState:v14];
        id v16 = [v15 insertionText];
        v28 = (void *)v11;
        if (![v16 length]) {
          goto LABEL_10;
        }
        [v15 insertionText];
        v18 = id v17 = v4;
        char v19 = [v18 isEqualToString:v13];

        id v4 = v17;
        if ((v19 & 1) == 0) {
          break;
        }
LABEL_11:
        uint64_t v6 = v9 - [v15 deletionCount];

        self = v26;
        if (!v6) {
          goto LABEL_12;
        }
      }
      uint64_t v20 = v9 - [v15 deletionCount];
      uint64_t v21 = [v15 deletionCount] + v10;
      id v16 = [v15 insertionText];
      uint64_t v22 = v21;
      id v4 = v17;
      objc_msgSend(v25, "replaceCharactersInRange:withString:", v20, v22, v16);
LABEL_10:

      goto LABEL_11;
    }
LABEL_12:

    id v23 = v25;
  }
  else
  {
    id v23 = v4;
  }

  return v23;
}

- (id)smartPunctuationResultsForString:(id)a3
{
  id v4 = a3;
  if ([(TISmartPunctuationController *)self smartQuotesEnabled]
    || [(TISmartPunctuationController *)self smartDashesEnabled])
  {
    id v25 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v27 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-'\""];
    uint64_t v5 = [v4 length];
    if (v5)
    {
      uint64_t v6 = v5;
      BOOL v26 = self;
      while (1)
      {
        uint64_t v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v27, 4, 0, v6);
        if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_11;
        }
        uint64_t v9 = v7;
        uint64_t v10 = v8;
        uint64_t v11 = [v4 substringToIndex:v7];
        uint64_t v12 = [v4 substringFromIndex:v9 + v10];
        int v13 = objc_msgSend(v4, "substringWithRange:", v9, v10);
        uint64_t v14 = +[TIDocumentState documentStateWithContextBefore:v11 selectedText:0 contextAfter:v12];
        uint64_t v15 = [(TISmartPunctuationController *)self smartPunctuationOutputForInput:v13 isLockedInput:0 documentState:v14];
        id v16 = [v15 insertionText];
        v28 = (void *)v11;
        if (![v16 length]) {
          goto LABEL_9;
        }
        [v15 insertionText];
        v18 = id v17 = v4;
        char v19 = [v18 isEqualToString:v13];

        id v4 = v17;
        if ((v19 & 1) == 0) {
          break;
        }
LABEL_10:
        uint64_t v6 = v9 - [v15 deletionCount];

        self = v26;
        if (!v6) {
          goto LABEL_11;
        }
      }
      uint64_t v20 = v9 - [v15 deletionCount];
      uint64_t v21 = [v15 deletionCount] + v10;
      id v22 = objc_alloc(MEMORY[0x1E4F29030]);
      id v23 = [v15 insertionText];
      id v16 = objc_msgSend(v22, "initWithRange:replacementString:", v20, v21, v23);

      id v4 = v17;
      [v25 addObject:v16];
LABEL_9:

      goto LABEL_10;
    }
LABEL_11:
  }
  else
  {
    id v25 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v25;
}

- (void)_initializeDashCharacterSetsIfNecessary
{
  if (!self->_decimalDigitCharacterSet)
  {
    v3 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    decimalDigitCharacterSet = self->_decimalDigitCharacterSet;
    self->_decimalDigitCharacterSet = v3;
  }
  if (!self->_dashCharacterSet)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-"];
    dashCharacterSet = self->_dashCharacterSet;
    self->_dashCharacterSet = v5;
  }
  if (!self->_enDashCharacterSet)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"–"];
    enDashCharacterSet = self->_enDashCharacterSet;
    self->_enDashCharacterSet = v7;
  }
  if (!self->_emDashCharacterSet)
  {
    self->_emDashCharacterSet = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"—"];
    MEMORY[0x1F41817F8]();
  }
}

- (void)_initializeQuoteCharacterSetsIfNecessary
{
  if (!self->_alphanumericCharacterSet)
  {
    v3 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
    alphanumericCharacterSet = self->_alphanumericCharacterSet;
    self->_alphanumericCharacterSet = v3;
  }
  if (!self->_whitespaceAndNewlineCharacterSet)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    whitespaceAndNewlineCharacterSet = self->_whitespaceAndNewlineCharacterSet;
    self->_whitespaceAndNewlineCharacterSet = v5;
  }
  if (!self->_decimalDigitCharacterSet)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    decimalDigitCharacterSet = self->_decimalDigitCharacterSet;
    self->_decimalDigitCharacterSet = v7;
  }
  if (!self->_punctuationCharacterSet)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    punctuationCharacterSet = self->_punctuationCharacterSet;
    self->_punctuationCharacterSet = v9;
  }
  if (!self->_openerCharacterSet)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28B88];
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"([{</@-=%C%C"), 8211, 8212;
    int v13 = [v11 characterSetWithCharactersInString:v12];
    openerCharacterSet = self->_openerCharacterSet;
    self->_openerCharacterSet = v13;
  }
  if (!self->_germanApostrophePrecedingSet)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"sxzSXZ"];
    germanApostrophePrecedingSet = self->_germanApostrophePrecedingSet;
    self->_germanApostrophePrecedingSet = v15;
  }
  if (!self->_dutchApostropheFollowingSet)
  {
    id v17 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"nstNST"];
    dutchApostropheFollowingSet = self->_dutchApostropheFollowingSet;
    self->_dutchApostropheFollowingSet = v17;
  }
  if (!self->_cornerBracketCharacterSet)
  {
    char v19 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"「」『』"];
    cornerBracketCharacterSet = self->_cornerBracketCharacterSet;
    self->_cornerBracketCharacterSet = v19;
  }
  if (!self->_bookTitleMarkCharacterSet)
  {
    self->_bookTitleMarkCharacterSet = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"《》〈〉"];
    MEMORY[0x1F41817F8]();
  }
}

- (TISmartPunctuationController)init
{
  v3.receiver = self;
  v3.super_class = (Class)TISmartPunctuationController;
  result = [(TISmartPunctuationController *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_smartQuotesEnabled = 257;
    result->_autoQuoteType = 2;
  }
  return result;
}

+ (id)_chineseContextualVariantMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__TISmartPunctuationController__chineseContextualVariantMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_chineseContextualVariantMapping___onceToken != -1) {
    dispatch_once(&_chineseContextualVariantMapping___onceToken, block);
  }
  v2 = (void *)_chineseContextualVariantMapping___chineseContextualVariantMapping;

  return v2;
}

void __64__TISmartPunctuationController__chineseContextualVariantMapping__block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  v1 = [v4 pathForResource:@"ChineseContextualVariantMapping" ofType:@"plist"];
  if (v1)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v1];
    objc_super v3 = (void *)_chineseContextualVariantMapping___chineseContextualVariantMapping;
    _chineseContextualVariantMapping___chineseContextualVariantMapping = v2;
  }
}

@end
@interface WBSCreditCardFormatter
+ (id)_formattedStringForNormalizedNumber:(id)a3 showCreditCardNumber:(BOOL)a4 showLastFourDigits:(BOOL)a5 isVirtualCard:(BOOL)a6;
+ (id)formattedStringForNormalizedNumber:(id)a3 showCreditCardNumber:(BOOL)a4;
- (BOOL)allowsUnknownCardTypes;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7;
- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5;
- (BOOL)isVirtualCard;
- (BOOL)showCreditCardNumber;
- (BOOL)showLastFourDigits;
- (_NSRange)_normalizedSelectionRangeForFormattedCreditCardNumber:(id)a3 withOriginalSelectionRange:(_NSRange)a4;
- (_NSRange)_selectionRangeInFormattedCreditCardNumber:(id)a3 forNormalizedSelectionRange:(_NSRange)a4 inNormalizedCreditCardNumber:(id)a5;
- (id)stringForObjectValue:(id)a3;
- (void)setAllowsUnknownCardTypes:(BOOL)a3;
- (void)setIsVirtualCard:(BOOL)a3;
- (void)setShowCreditCardNumber:(BOOL)a3;
- (void)setShowLastFourDigits:(BOOL)a3;
@end

@implementation WBSCreditCardFormatter

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = +[WBSCreditCardFormatter _formattedStringForNormalizedNumber:v4 showCreditCardNumber:[(WBSCreditCardFormatter *)self showCreditCardNumber] showLastFourDigits:[(WBSCreditCardFormatter *)self showLastFourDigits] isVirtualCard:[(WBSCreditCardFormatter *)self isVirtualCard]];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v7 = a4;
  if ([v7 length])
  {
    v8 = WBSNormalizedCreditCardNumber();
    if (v8
      && ([(WBSCreditCardFormatter *)self allowsUnknownCardTypes]
       || WBSCreditCardTypeFromNumber()))
    {
      if (a3) {
        *a3 = v8;
      }
      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 length];
  if (v8)
  {
    BOOL v9 = WBSNormalizedCreditCardNumber();
    if (v9)
    {
      if (a4)
      {
        id v10 = +[WBSCreditCardFormatter _formattedStringForNormalizedNumber:v9 showCreditCardNumber:1 showLastFourDigits:[(WBSCreditCardFormatter *)self showLastFourDigits] isVirtualCard:[(WBSCreditCardFormatter *)self isVirtualCard]];
LABEL_7:
        *a4 = v10;
      }
    }
    else if (a4)
    {
      id v10 = 0;
      goto LABEL_7;
    }
  }
  return v8 == 0;
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v12 = a5;
  uint64_t v13 = [*a3 length];
  if (v13)
  {
    v14 = WBSNormalizedCreditCardNumber();
    if (v14)
    {
      uint64_t v15 = -[WBSCreditCardFormatter _normalizedSelectionRangeForFormattedCreditCardNumber:withOriginalSelectionRange:](self, "_normalizedSelectionRangeForFormattedCreditCardNumber:withOriginalSelectionRange:", *a3, a4->location, a4->length);
      uint64_t v17 = v16;
      id v18 = +[WBSCreditCardFormatter _formattedStringForNormalizedNumber:v14 showCreditCardNumber:1 showLastFourDigits:[(WBSCreditCardFormatter *)self showLastFourDigits] isVirtualCard:[(WBSCreditCardFormatter *)self isVirtualCard]];
      *a3 = v18;
      a4->NSUInteger location = -[WBSCreditCardFormatter _selectionRangeInFormattedCreditCardNumber:forNormalizedSelectionRange:inNormalizedCreditCardNumber:](self, "_selectionRangeInFormattedCreditCardNumber:forNormalizedSelectionRange:inNormalizedCreditCardNumber:", v18, v15, v17, v14);
      a4->NSUInteger length = v19;
    }
    else
    {
      *a3 = (id)[v12 copy];
      a4->NSUInteger location = location;
      a4->NSUInteger length = length;
    }
  }
  return v13 == 0;
}

+ (id)formattedStringForNormalizedNumber:(id)a3 showCreditCardNumber:(BOOL)a4
{
  id v4 = +[WBSCreditCardFormatter _formattedStringForNormalizedNumber:a3 showCreditCardNumber:a4 showLastFourDigits:0 isVirtualCard:0];
  v5 = v4;
  if (!v4) {
    id v4 = &stru_1EFBE3CF8;
  }
  v6 = v4;

  return v6;
}

+ (id)_formattedStringForNormalizedNumber:(id)a3 showCreditCardNumber:(BOOL)a4 showLastFourDigits:(BOOL)a5 isVirtualCard:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  unint64_t v10 = [v9 length];
  if (!v10)
  {
    uint64_t v13 = 0;
    goto LABEL_24;
  }
  uint64_t v11 = v10 - 4;
  if (v10 <= 4 && v6 && !a4)
  {
    id v12 = [@"•••• •••• •••• ••••" substringToIndex:objc_msgSend(@"•••• •••• •••• ••••", "length") - v10];
    uint64_t v13 = [v12 stringByAppendingString:v9];

    goto LABEL_24;
  }
  if (v7)
  {
    if (v10 > 3)
    {
      uint64_t v14 = 4;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v14 = v10;
    }
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __116__WBSCreditCardFormatter__formattedStringForNormalizedNumber_showCreditCardNumber_showLastFourDigits_isVirtualCard___block_invoke;
  v32 = &unk_1E5C9A548;
  BOOL v37 = a4;
  unint64_t v34 = v10;
  uint64_t v35 = v11;
  uint64_t v36 = v14;
  id v15 = v9;
  id v33 = v15;
  uint64_t v16 = (void (**)(void, void, void))MEMORY[0x1AD0C4F80](&v29);
  uint64_t v17 = WBSCreditCardTypeFromNumberAllowingPartialMatch();
  if (v17 == 4)
  {
    if ([v15 length] == 14)
    {
      id v18 = (void *)MEMORY[0x1E4F1C978];
      NSUInteger v19 = v16[2](v16, 0, 4);
      v20 = v16[2](v16, 4, 6);
      v16[2](v16, 10, 4);
      goto LABEL_17;
    }
LABEL_18:
    NSUInteger v19 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v23 = [v15 length];
    if (v23)
    {
      unint64_t v24 = v23;
      for (unint64_t i = 0; i < v24; i += 4)
      {
        uint64_t v26 = v16[2](v16, i, 4);
        if (!v26) {
          break;
        }
        v27 = (void *)v26;
        [v19 addObject:v26];
      }
    }
    uint64_t v13 = [v19 componentsJoinedByString:@" "];
    goto LABEL_23;
  }
  if (v17 != 3) {
    goto LABEL_18;
  }
  id v18 = (void *)MEMORY[0x1E4F1C978];
  NSUInteger v19 = v16[2](v16, 0, 4);
  v20 = v16[2](v16, 4, 6);
  v16[2](v16, 10, 5);
  v21 = LABEL_17:;
  v22 = objc_msgSend(v18, "arrayWithObjects:", v19, v20, v21, 0, v29, v30, v31, v32);
  uint64_t v13 = [v22 componentsJoinedByString:@" "];

LABEL_23:
LABEL_24:

  return v13;
}

id __116__WBSCreditCardFormatter__formattedStringForNormalizedNumber_showCreditCardNumber_showLastFourDigits_isVirtualCard___block_invoke(uint64_t a1, NSUInteger a2, NSUInteger a3)
{
  NSUInteger v3 = *(void *)(a1 + 40);
  if (v3 <= a2)
  {
    id v8 = 0;
  }
  else
  {
    if (a2 + a3 <= v3) {
      NSUInteger v6 = a3;
    }
    else {
      NSUInteger v6 = v3 - a2;
    }
    if (*(unsigned char *)(a1 + 64) || (NSUInteger v7 = *(void *)(a1 + 48), v7 < a2))
    {
      objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, v6);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7 >= v6 + a2) {
        NSUInteger v10 = v6;
      }
      else {
        NSUInteger v10 = v7 - a2;
      }
      uint64_t v11 = [&stru_1EFBE3CF8 stringByPaddingToLength:v10 withString:@"•" startingAtIndex:0];
      v15.NSUInteger location = a2;
      v15.NSUInteger length = v6;
      NSRange v12 = NSIntersectionRange(v15, *(NSRange *)(a1 + 48));
      if (v12.length)
      {
        uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v12.location, v12.length);
        id v8 = [v11 stringByAppendingString:v13];
      }
      else
      {
        id v8 = v11;
      }
    }
  }
  return v8;
}

- (_NSRange)_normalizedSelectionRangeForFormattedCreditCardNumber:(id)a3 withOriginalSelectionRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  NSUInteger v7 = location + length;
  id v8 = WBSAllowedCreditCardNumberSeparatorCharacters();
  if (location + length)
  {
    NSUInteger v9 = 0;
    NSUInteger v10 = location;
    do
    {
      int v11 = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", v9));
      NSUInteger v12 = length - 1;
      NSUInteger v13 = v10 - 1;
      if (v9 > location) {
        NSUInteger v13 = v10;
      }
      else {
        NSUInteger v12 = length;
      }
      if (v11)
      {
        NSUInteger length = v12;
        NSUInteger v10 = v13;
      }
      ++v9;
    }
    while (v7 != v9);
  }
  else
  {
    NSUInteger v10 = location;
  }

  NSUInteger v14 = v10;
  NSUInteger v15 = length;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

- (_NSRange)_selectionRangeInFormattedCreditCardNumber:(id)a3 forNormalizedSelectionRange:(_NSRange)a4 inNormalizedCreditCardNumber:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  if (location == [v9 length])
  {
    uint64_t v10 = [v8 length];
    NSUInteger v11 = 0;
  }
  else
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v21[3] = 0;
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3010000000;
    NSUInteger v19 = &unk_1A6DD304D;
    long long v20 = xmmword_1A6D5EE80;
    uint64_t v12 = [v8 length];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __126__WBSCreditCardFormatter__selectionRangeInFormattedCreditCardNumber_forNormalizedSelectionRange_inNormalizedCreditCardNumber___block_invoke;
    v15[3] = &unk_1E5C9A570;
    v15[4] = v21;
    v15[5] = &v16;
    v15[6] = location;
    v15[7] = length;
    objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v12, 515, v15);
    uint64_t v10 = v17[4];
    NSUInteger v11 = v17[5];
    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(v21, 8);
  }

  NSUInteger v13 = v10;
  NSUInteger v14 = v11;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

void *__126__WBSCreditCardFormatter__selectionRangeInFormattedCreditCardNumber_forNormalizedSelectionRange_inNormalizedCreditCardNumber___block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v7 = *(void *)(result[4] + 8);
  uint64_t v8 = *(void *)(v7 + 24);
  *(void *)(v7 + 24) = v8 + a4;
  uint64_t v9 = *(void *)(result[5] + 8);
  if (*(void *)(v9 + 32) == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v10 = result[6];
    if (v10 > *(void *)(*(void *)(result[4] + 8) + 24)) {
      return result;
    }
    *(void *)(v9 + 32) = a3 - v8 + v10;
  }
  unint64_t v11 = result[7] + result[6];
  if (v11 <= *(void *)(*(void *)(result[4] + 8) + 24))
  {
    *(void *)(*(void *)(result[5] + 8) + 40) = a3
                                                     + v11
                                                     - (v8
                                                      + *(void *)(*(void *)(result[5] + 8) + 32));
    *a7 = 1;
  }
  return result;
}

- (BOOL)showLastFourDigits
{
  return self->_showLastFourDigits;
}

- (void)setShowLastFourDigits:(BOOL)a3
{
  self->_showLastFourDigits = a3;
}

- (BOOL)showCreditCardNumber
{
  return self->_showCreditCardNumber;
}

- (void)setShowCreditCardNumber:(BOOL)a3
{
  self->_showCreditCardNumber = a3;
}

- (BOOL)allowsUnknownCardTypes
{
  return self->_allowsUnknownCardTypes;
}

- (void)setAllowsUnknownCardTypes:(BOOL)a3
{
  self->_allowsUnknownCardTypes = a3;
}

- (BOOL)isVirtualCard
{
  return self->_isVirtualCard;
}

- (void)setIsVirtualCard:(BOOL)a3
{
  self->_isVirtualCard = a3;
}

@end
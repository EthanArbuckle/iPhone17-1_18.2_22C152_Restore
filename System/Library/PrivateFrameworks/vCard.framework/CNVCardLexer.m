@interface CNVCardLexer
+ (id)returnDelimiterData;
+ (id)singleByteTokens;
+ (id)utf16Tokens;
- (BOOL)_applyNextStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6 maximumValueLength:(unint64_t)a7 intoString:(id)a8;
- (BOOL)advancePastEOL;
- (BOOL)advancePastEOLSingle;
- (BOOL)advancePastEOLUnicode;
- (BOOL)advanceToEOL;
- (BOOL)advanceToEOLSingle;
- (BOOL)advanceToEOLUnicode;
- (BOOL)advanceToToken:(int)a3 throughTypes:(int64_t)a4;
- (BOOL)advancedPastToken:(int)a3;
- (BOOL)atEOF;
- (CNVCardLexer)initWithData:(id)a3;
- (_NSRange)emptyRangeStartingAtCursor;
- (_NSRange)expandRange:(_NSRange)a3 untilNextByteIs:(id)a4;
- (_NSRange)rangeWithLength:(unint64_t)a3 lTrim:(unint64_t)a4 rTrim:(unint64_t)a5;
- (id)clipAtGraphemeClusters:(id)a3 maximumValueLength:(unint64_t)a4 addEllipsisIfClipped:(BOOL)a5;
- (id)dataWithRange:(_NSRange)a3;
- (id)nextArraySeperatedByToken:(int)a3 stoppingAt:(int)a4 inEncoding:(unint64_t)a5 maximumValueLength:(unint64_t)a6;
- (id)nextBase64Data;
- (id)nextBase64Line:(BOOL *)a3;
- (id)nextEscapedCharacter;
- (id)nextQuotedPrintableData;
- (id)nextQuotedStringValueInEncoding:(unint64_t)a3;
- (id)nextSingleByteBase64Line:(BOOL *)a3;
- (id)nextSingleByteStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6 maximumValueLength:(unint64_t)a7;
- (id)nextStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6 maximumValueLength:(unint64_t)a7;
- (id)nextUnicodeBase64Line:(BOOL *)a3;
- (id)nextUnicodeStringStopTokens:(int)a3 quotedPrintable:(BOOL)a4 trim:(BOOL)a5 maximumValueLength:(unint64_t)a6;
- (id)os_log;
- (id)stringByRoundingData:(id)a3 toNextWholeCharacterUsingEncoding:(unint64_t)a4 prefixLength:(unint64_t)a5 suffixLength:(unint64_t)a6 maximumValueLength:(unint64_t)a7;
- (id)stringFromData:(id)a3 encoding:(unint64_t)a4 prefixLength:(unint64_t)a5 suffixLength:(unint64_t)a6;
- (id)stringFromSubData:(id)a3 encoding:(unint64_t)a4;
- (id)stringWithRange:(_NSRange)a3 encoding:(unint64_t)a4;
- (id)tokenSetForLength:(int64_t)a3;
- (id)trimData:(id)a3 withPrefixLength:(unint64_t)a4 suffixLength:(unint64_t)a5;
- (id)unicodeStringByRoundingData:(id)a3 toNextWholeCharacterUsingEncoding:(unint64_t)a4 prefixLength:(unint64_t)a5 suffixLength:(unint64_t)a6 maximumValueLength:(unint64_t)a7;
- (int)nextTokenPeek:(BOOL)a3;
- (int)nextTokenPeek:(BOOL)a3 length:(int64_t)a4;
- (int)nextTokenPeekSingle:(BOOL)a3 length:(int64_t)a4;
- (int)nextTokenPeekUnicode:(BOOL)a3 length:(int64_t)a4;
- (int)peekAtNextToken;
- (int)readNextToken;
- (int)tokenAtCursor;
- (int)tokenAtCursorIgnoringLineFolding;
- (int64_t)advanceToSingleByteString;
- (int64_t)advanceToString;
- (int64_t)advanceToUnicodeString;
- (int64_t)errorCount;
- (unint64_t)cursor;
- (unsigned)charAtPosition:(unint64_t)a3 withOffset:(int64_t)a4;
- (void)advanceToPeekPoint;
- (void)appendDataInRange:(_NSRange)a3 toData:(id)a4;
- (void)appendNextEscapedCharacterToData:(id)a3;
- (void)appendNextQuotedPrintableDataToData:(id)a3;
- (void)skipToStopTokens:(int)a3;
- (void)unicodeSkipToStopTokens:(int)a3;
@end

@implementation CNVCardLexer

+ (id)singleByteTokens
{
  if (singleByteTokens_cn_once_token_1 != -1) {
    dispatch_once(&singleByteTokens_cn_once_token_1, &__block_literal_global_5);
  }
  v2 = (void *)singleByteTokens_cn_once_object_1;
  return v2;
}

uint64_t __32__CNVCardLexer_singleByteTokens__block_invoke()
{
  singleByteTokens_cn_once_object_1 = buildTokenTable(0);
  return MEMORY[0x1F41817F8]();
}

+ (id)utf16Tokens
{
  if (utf16Tokens_cn_once_token_2 != -1) {
    dispatch_once(&utf16Tokens_cn_once_token_2, &__block_literal_global_2);
  }
  v2 = (void *)utf16Tokens_cn_once_object_2;
  return v2;
}

uint64_t __27__CNVCardLexer_utf16Tokens__block_invoke()
{
  utf16Tokens_cn_once_object_2 = buildTokenTable(1);
  return MEMORY[0x1F41817F8]();
}

+ (id)returnDelimiterData
{
  if (returnDelimiterData_cn_once_token_3 != -1) {
    dispatch_once(&returnDelimiterData_cn_once_token_3, &__block_literal_global_4_0);
  }
  v2 = (void *)returnDelimiterData_cn_once_object_3;
  return v2;
}

uint64_t __35__CNVCardLexer_returnDelimiterData__block_invoke()
{
  returnDelimiterData_cn_once_object_3 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:"\n" length:1];
  return MEMORY[0x1F41817F8]();
}

- (id)os_log
{
  if (os_log_cn_once_token_4 != -1) {
    dispatch_once(&os_log_cn_once_token_4, &__block_literal_global_7);
  }
  v2 = (void *)os_log_cn_once_object_4;
  return v2;
}

uint64_t __22__CNVCardLexer_os_log__block_invoke()
{
  os_log_cn_once_object_4 = (uint64_t)os_log_create("com.apple.contacts.vcard", "lexer");
  return MEMORY[0x1F41817F8]();
}

- (CNVCardLexer)initWithData:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNVCardLexer;
  v5 = [(CNVCardLexer *)&v18 init];
  if (v5 && (unint64_t v6 = [v4 length], v5->_length = v6, v6 >= 0xB))
  {
    uint64_t v8 = [v4 mutableCopy];
    data = v5->_data;
    v5->_data = (NSMutableData *)v8;

    v5->_bytes = (char *)[(NSMutableData *)v5->_data mutableBytes];
    v5->_unicode = 0;
    uint64_t v10 = +[CNVCardDataAnalyzer analyzeData:v4];
    if ((v10 | 0x4000000) == 0x94000100)
    {
      v5->_unicode = 1;
      if (v10 == 2483028224)
      {
        unint64_t length = v5->_length;
        if (length >= 2)
        {
          unint64_t v13 = length >> 1;
          bytes = v5->_bytes;
          do
          {
            *(_WORD *)bytes = bswap32(*(unsigned __int16 *)bytes) >> 16;
            bytes += 2;
            --v13;
          }
          while (v13);
        }
      }
    }
    if (v11) {
      v5->_cursor = 2;
    }
    if (v5->_unicode) {
      +[CNVCardLexer utf16Tokens];
    }
    else {
    uint64_t v15 = +[CNVCardLexer singleByteTokens];
    }
    activeTokenSets = v5->_activeTokenSets;
    v5->_activeTokenSets = (NSArray *)v15;

    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)cursor
{
  return self->_cursor;
}

- (int64_t)errorCount
{
  return self->_errorCount;
}

- (id)tokenSetForLength:(int64_t)a3
{
  int64_t v5 = a3 - 1;
  if (unint64_t)(a3 - 1) <= 6 && ((0x55u >> v5))
  {
    unint64_t v6 = -[NSArray objectAtIndex:](self->_activeTokenSets, "objectAtIndex:", qword_1DC1B8450[v5], v3);
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v6;
}

- (int)nextTokenPeekSingle:(BOOL)a3 length:(int64_t)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  p_unint64_t cursor = (uint64_t *)&self->_cursor;
  unint64_t cursor = self->_cursor;
  self->_peekedPoint = cursor;
  unint64_t length = self->_length;
  if (a4 <= 0) {
    unint64_t v9 = 7;
  }
  else {
    unint64_t v9 = a4;
  }
  BOOL v10 = cursor >= length;
  if (cursor >= length) {
    int v11 = 65537;
  }
  else {
    int v11 = 0;
  }
  if (v10)
  {
    BOOL v27 = 1;
    int v13 = 90;
    if (a3) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  unint64_t v12 = 1;
  do
  {
    int v13 = self->_bytes[cursor];
    *(_WORD *)&v35[v12 - 1] = v13;
    CFArrayRef v14 = [(CNVCardLexer *)self tokenSetForLength:v12];
    if (v14)
    {
      CFArrayRef v15 = v14;
      CFIndex Count = CFArrayGetCount(v14);
      if (Count >= 1)
      {
        CFIndex v17 = Count;
        CFIndex v18 = 0;
        while (2)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v15, v18);
          v20 = (unsigned __int8 *)ValueAtIndex[1];
          v21 = v35;
          do
          {
            while (1)
            {
              int v23 = *v20++;
              int v22 = v23;
              int v25 = *v21++;
              int v24 = v25;
              if (v25 != v22) {
                break;
              }
              if (!v22) {
                goto LABEL_22;
              }
            }
          }
          while ((v24 - 97) <= 0x19 && v24 && v22 == (v24 - 32));
          if (!v24)
          {
LABEL_22:
            int v11 = *(_DWORD *)ValueAtIndex;
            goto LABEL_23;
          }
          if (++v18 != v17) {
            continue;
          }
          break;
        }
      }
    }
    int v11 = 0;
LABEL_23:
    unint64_t v26 = self->_length;
    unint64_t cursor = self->_peekedPoint + 1;
    self->_peekedPoint = cursor;
    BOOL v27 = cursor >= v26;
    BOOL v28 = v27 || v12++ >= v9;
  }
  while (!v28 && v11 == 0);
  if (!a3) {
LABEL_33:
  }
    *p_unint64_t cursor = cursor;
LABEL_34:
  if (a4) {
    BOOL v30 = 0;
  }
  else {
    BOOL v30 = v11 == 0;
  }
  char v31 = !v30 || v27;
  if (v30) {
    int result = 65537;
  }
  else {
    int result = v11;
  }
  if ((v31 & 1) == 0)
  {
    v33 = [(CNVCardLexer *)self os_log];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[CNVCardLexer nextTokenPeekSingle:length:](p_cursor, v13, v33);
    }

    ++self->_errorCount;
    return 65538;
  }
  return result;
}

- (int)nextTokenPeekUnicode:(BOOL)a3 length:(int64_t)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  unint64_t cursor = self->_cursor;
  self->_peekedPoint = cursor;
  if (a4 <= 0) {
    int64_t v7 = 7;
  }
  else {
    int64_t v7 = a4;
  }
  unint64_t length = self->_length;
  BOOL v9 = cursor >= length;
  if (cursor >= length) {
    int v10 = 65537;
  }
  else {
    int v10 = 0;
  }
  if (v9)
  {
    int v15 = 0;
    int v33 = 0;
    BOOL v30 = 1;
    if (a3) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  uint64_t v11 = 1;
  do
  {
    bytes = self->_bytes;
    int v13 = bytes[cursor];
    unint64_t v14 = cursor + 1;
    self->_peekedPoint = v14;
    int v15 = bytes[v14];
    v16 = &v44[v11];
    *(v16 - 1) = v15 | ((_WORD)v13 << 8);
    _WORD *v16 = 0;
    CFArrayRef v17 = [(CNVCardLexer *)self tokenSetForLength:v11];
    if (v17)
    {
      CFArrayRef v18 = v17;
      CFIndex Count = CFArrayGetCount(v17);
      if (Count)
      {
        CFIndex v20 = Count;
        CFIndex v21 = 0;
        while (2)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v18, v21);
          int v23 = (unsigned __int16 *)ValueAtIndex[1];
          int v24 = v44;
          while (1)
          {
            while (1)
            {
              int v26 = *v23++;
              int v25 = v26;
              int v28 = *v24++;
              int v27 = v28;
              if (v28 != v25) {
                break;
              }
              if (!v25) {
                goto LABEL_22;
              }
            }
            if ((v27 - 97) > 0x19) {
              break;
            }
            if (v25 != (v27 - 32)) {
              goto LABEL_20;
            }
          }
          if (!v27)
          {
LABEL_22:
            int v10 = *(_DWORD *)ValueAtIndex;
            goto LABEL_23;
          }
LABEL_20:
          if (++v21 != v20) {
            continue;
          }
          break;
        }
      }
    }
    int v10 = 0;
LABEL_23:
    unint64_t v29 = self->_length;
    unint64_t cursor = self->_peekedPoint + 1;
    self->_peekedPoint = cursor;
    BOOL v30 = cursor >= v29;
    BOOL v31 = !v30 && v11++ < v7;
  }
  while (v31 && v10 == 0);
  int v33 = v13 << 8;
  if (!a3) {
LABEL_33:
  }
    self->_unint64_t cursor = cursor;
LABEL_34:
  if (a4) {
    BOOL v34 = 0;
  }
  else {
    BOOL v34 = v10 == 0;
  }
  char v35 = !v34 || v30;
  if (v34) {
    int result = 65537;
  }
  else {
    int result = v10;
  }
  if ((v35 & 1) == 0)
  {
    v37 = [(CNVCardLexer *)self os_log];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      unint64_t v38 = self->_cursor;
      *(_DWORD *)buf = 134218240;
      unint64_t v41 = v38;
      __int16 v42 = 1024;
      int v43 = v33 | v15;
      _os_log_error_impl(&dword_1DC18F000, v37, OS_LOG_TYPE_ERROR, "vCard Syntax Error, character %ld : %C", buf, 0x12u);
    }

    ++self->_errorCount;
    return 65538;
  }
  return result;
}

- (int)peekAtNextToken
{
  return [(CNVCardLexer *)self nextTokenPeek:1];
}

- (int)readNextToken
{
  return [(CNVCardLexer *)self nextTokenPeek:0];
}

- (int)nextTokenPeek:(BOOL)a3
{
  return [(CNVCardLexer *)self nextTokenPeek:a3 length:0];
}

- (int)nextTokenPeek:(BOOL)a3 length:(int64_t)a4
{
  if (self->_unicode) {
    return [(CNVCardLexer *)self nextTokenPeekUnicode:a3 length:a4];
  }
  else {
    return [(CNVCardLexer *)self nextTokenPeekSingle:a3 length:a4];
  }
}

- (id)nextQuotedPrintableData
{
  bytes = self->_bytes;
  unint64_t cursor = self->_cursor;
  unsigned int v4 = bytes[cursor];
  unint64_t v5 = cursor + 1;
  self->_unint64_t cursor = cursor + 1;
  if (v4 == 61)
  {
    unint64_t v5 = cursor + 4;
    if (cursor + 4 >= self->_length || bytes[cursor + 2] != 13 || bytes[cursor + 3] != 10) {
      goto LABEL_12;
    }
    self->_unint64_t cursor = v5;
    unsigned int v4 = bytes[v5];
  }
  if (v4 == 13 || v4 == 10)
  {
    [(CNVCardLexer *)self advancePastEOL];
    goto LABEL_12;
  }
  unsigned int v9 = bytes[v5];
  if (v9 != 61) {
    goto LABEL_21;
  }
  unint64_t v10 = v5 + 3;
  if (v5 + 3 >= self->_length || (uint64_t v11 = &bytes[v5], v11[1] != 13) || v11[2] != 10)
  {
LABEL_12:
    int64_t v7 = 0;
    goto LABEL_13;
  }
  self->_unint64_t cursor = v10;
  unsigned int v9 = bytes[v10];
  unint64_t v5 = v10;
LABEL_21:
  if (v4 <= 0x40) {
    char v12 = 64;
  }
  else {
    char v12 = 9;
  }
  char v13 = v12 + v4;
  if (v9 <= 0x40) {
    char v14 = -48;
  }
  else {
    char v14 = -55;
  }
  if (v9 > 0x60) {
    char v14 = -87;
  }
  char v15 = v9 + 16 * v13 + v14;
  char v22 = v15;
  unint64_t v16 = v5 + 1;
  self->_unint64_t cursor = v5 + 1;
  if (v15 == 92)
  {
    if (v16 < self->_length)
    {
      char v22 = bytes[v16];
      self->_unint64_t cursor = v5 + 2;
    }
    goto LABEL_46;
  }
  if (v15 != 13 || v5 + 3 >= self->_length)
  {
LABEL_46:
    int64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v22 length:1];
    goto LABEL_13;
  }
  if (bytes[v16] == 61)
  {
    unsigned int v17 = bytes[v5 + 2];
    unsigned int v18 = bytes[v5 + 3];
    if (v17 <= 0x40) {
      char v19 = 64;
    }
    else {
      char v19 = 9;
    }
    char v20 = v19 + v17;
    if (v18 <= 0x40) {
      char v21 = -48;
    }
    else {
      char v21 = -55;
    }
    if (v18 > 0x60) {
      char v21 = -87;
    }
    if ((v21 + v18 + 16 * v20) == 10) {
      self->_unint64_t cursor = v5 + 4;
    }
  }
  int64_t v7 = +[CNVCardLexer returnDelimiterData];
LABEL_13:
  return v7;
}

- (id)nextEscapedCharacter
{
  if ([(CNVCardLexer *)self advancedPastToken:0x8000]) {
    [(CNVCardLexer *)self advancedPastToken:0x4000];
  }
  bytes = self->_bytes;
  unint64_t cursor = self->_cursor;
  int v5 = bytes[cursor];
  char v14 = bytes[cursor];
  unint64_t v6 = cursor + 1;
  self->_unint64_t cursor = cursor + 1;
  BOOL unicode = self->_unicode;
  if (self->_unicode)
  {
    int v5 = bytes[v6];
    char v14 = bytes[v6];
    self->_unint64_t cursor = cursor + 2;
  }
  if (v5 == 110)
  {
    LOBYTE(v5) = 10;
    char v14 = 10;
  }
  if (unicode)
  {
    v13[0] = 0;
    v13[1] = v5;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9B8];
    unsigned int v9 = v13;
    uint64_t v10 = 2;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9B8];
    unsigned int v9 = &v14;
    uint64_t v10 = 1;
  }
  uint64_t v11 = [v8 dataWithBytes:v9 length:v10];
  return v11;
}

- (id)nextSingleByteStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6 maximumValueLength:(unint64_t)a7
{
  BOOL v7 = a6;
  BOOL v42 = a4;
  if ((a5 & 0x80) != 0 && self->_bytes[self->_cursor] == 34)
  {
    unsigned int v9 = [(CNVCardLexer *)self nextQuotedStringValueInEncoding:a3];
    goto LABEL_40;
  }
  uint64_t v10 = [(CNVCardLexer *)self emptyRangeStartingAtCursor];
  unint64_t v12 = v11;
  CFArrayRef v13 = [(CNVCardLexer *)self tokenSetForLength:1];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v43[1] = 0;
  unint64_t cursor = self->_cursor;
  if (cursor >= self->_length)
  {
LABEL_38:
    unsigned int v9 = 0;
    self->_unint64_t cursor = self->_peekedPoint;
    goto LABEL_39;
  }
  uint64_t v16 = 0;
  uint64_t v39 = 0;
  char v17 = 1;
  while (1)
  {
    v43[0] = self->_bytes[cursor];
    CFIndex Count = CFArrayGetCount(v13);
    if (Count < 1)
    {
LABEL_17:
      int v28 = 0;
      if (!v7) {
        goto LABEL_23;
      }
    }
    else
    {
      CFIndex v19 = Count;
      CFIndex v20 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v13, v20);
        char v22 = (unsigned __int8 *)ValueAtIndex[1];
        int v23 = v43;
        do
        {
          while (1)
          {
            int v25 = *v22++;
            int v24 = v25;
            int v27 = *v23++;
            int v26 = v27;
            if (v27 != v24) {
              break;
            }
            if (!v24) {
              goto LABEL_19;
            }
          }
        }
        while ((v26 - 97) <= 0x19 && v26 && v24 == (v26 - 32));
        if (v26)
        {
          if (++v20 != v19) {
            continue;
          }
          goto LABEL_17;
        }
        break;
      }
LABEL_19:
      int v28 = *(_DWORD *)ValueAtIndex;
      if (!v7) {
        goto LABEL_23;
      }
    }
    if ((v28 & 0x4000) != 0) {
      break;
    }
    v17 &= (v28 & a5) != 0;
    if ((v28 & a5) == 0) {
      uint64_t v16 = 0;
    }
LABEL_23:
    if (v42 && v28 == 1025)
    {
      -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", v10, v12, v14);
      [(CNVCardLexer *)self appendNextQuotedPrintableDataToData:v14];
    }
    else
    {
      if (v28 != 513) {
        goto LABEL_33;
      }
      -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", v10, v12, v14);
      [(CNVCardLexer *)self appendNextEscapedCharacterToData:v14];
    }
    uint64_t v10 = [(CNVCardLexer *)self emptyRangeStartingAtCursor];
    unint64_t v12 = v29;
LABEL_37:
    unint64_t cursor = self->_cursor;
    if (cursor >= self->_length) {
      goto LABEL_38;
    }
  }
  BOOL v30 = (v17 & 1) == 0;
  char v17 = (v17 & 1) != 0;
  uint64_t v31 = v39;
  if (!v30) {
    uint64_t v31 = v39 + 1;
  }
  uint64_t v39 = v31;
  if (v30) {
    ++v16;
  }
LABEL_33:
  if ((v28 & a5) != 0)
  {
    -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", v10, v12, v14);
    int v33 = [(CNVCardLexer *)self stringFromData:v14 encoding:v38 prefixLength:v39 suffixLength:v16];
    unsigned int v9 = [(CNVCardLexer *)self clipAtGraphemeClusters:v33 maximumValueLength:a7 addEllipsisIfClipped:1];

    goto LABEL_39;
  }
  if (a7 == -1 || v12 < a7 + 20)
  {
    ++v12;
    ++self->_cursor;
    goto LABEL_37;
  }
  -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", v10, v12, v14);
  BOOL v34 = [(CNVCardLexer *)self stringByRoundingData:v14 toNextWholeCharacterUsingEncoding:v38 prefixLength:v39 suffixLength:v16 maximumValueLength:a7];
  uint64_t v35 = [v34 stringByAppendingString:@"…"];
  uint64_t v36 = (void *)v35;
  if (v35) {
    v37 = (__CFString *)v35;
  }
  else {
    v37 = @"…";
  }
  unsigned int v9 = v37;

  ++self->_cursor;
  [(CNVCardLexer *)self skipToStopTokens:a5];
LABEL_39:

LABEL_40:
  return v9;
}

- (void)skipToStopTokens:(int)a3
{
  CFArrayRef theArray = [(CNVCardLexer *)self tokenSetForLength:1];
  v18[1] = 0;
  for (i = self->_cursor; i < self->_length; self->_unint64_t cursor = i)
  {
    v18[0] = self->_bytes[i];
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v8);
        uint64_t v10 = (unsigned __int8 *)ValueAtIndex[1];
        unint64_t v11 = v18;
        do
        {
          while (1)
          {
            int v13 = *v10++;
            int v12 = v13;
            int v15 = *v11++;
            int v14 = v15;
            if (v15 != v12) {
              break;
            }
            if (!v12) {
              goto LABEL_15;
            }
          }
        }
        while ((v14 - 97) <= 0x19 && v14 && v12 == (v14 - 32));
        if (!v14)
        {
LABEL_15:
          int v16 = *(_DWORD *)ValueAtIndex;
          goto LABEL_16;
        }
        if (++v8 != v7) {
          continue;
        }
        break;
      }
    }
    int v16 = 0;
LABEL_16:
    if ((v16 & a3) != 0) {
      break;
    }
    unint64_t i = self->_cursor + 1;
  }
}

- (void)appendDataInRange:(_NSRange)a3 toData:(id)a4
{
}

- (void)appendNextQuotedPrintableDataToData:(id)a3
{
  ++self->_cursor;
  id v4 = a3;
  id v5 = [(CNVCardLexer *)self nextQuotedPrintableData];
  [v4 appendData:v5];
}

- (void)appendNextEscapedCharacterToData:(id)a3
{
  ++self->_cursor;
  id v4 = a3;
  id v5 = [(CNVCardLexer *)self nextEscapedCharacter];
  [v4 appendData:v5];
}

- (_NSRange)emptyRangeStartingAtCursor
{
  NSUInteger cursor = self->_cursor;
  NSUInteger v3 = 0;
  result.unint64_t length = v3;
  result.location = cursor;
  return result;
}

- (id)stringByRoundingData:(id)a3 toNextWholeCharacterUsingEncoding:(unint64_t)a4 prefixLength:(unint64_t)a5 suffixLength:(unint64_t)a6 maximumValueLength:(unint64_t)a7
{
  id v12 = a3;
  int v13 = [(CNVCardLexer *)self stringFromData:v12 encoding:a4 prefixLength:a5 suffixLength:a6];
  if (!v13)
  {
    uint64_t v16 = [v12 length];
    if (v16)
    {
      uint64_t v17 = v16 - 1;
      do
      {
        unsigned int v18 = objc_msgSend(v12, "subdataWithRange:", 0, v17);
        int v13 = [(CNVCardLexer *)self stringFromData:v18 encoding:a4 prefixLength:a5 suffixLength:a6];

        BOOL v20 = v17-- != 0;
      }
      while (!v13 && v20);
    }
    else
    {
      int v13 = 0;
    }
  }
  int v14 = [(CNVCardLexer *)self clipAtGraphemeClusters:v13 maximumValueLength:a7 addEllipsisIfClipped:0];

  return v14;
}

- (id)clipAtGraphemeClusters:(id)a3 maximumValueLength:(unint64_t)a4 addEllipsisIfClipped:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  CFIndex v8 = v7;
  if (a4 == -1 || [v7 length] <= a4)
  {
    id v12 = v8;
  }
  else
  {
    uint64_t v9 = objc_msgSend(v8, "rangeOfComposedCharacterSequencesForRange:", 0, a4);
    unint64_t v11 = objc_msgSend(v8, "substringWithRange:", v9, v10);
    id v12 = v11;
    if (v5)
    {
      uint64_t v13 = [v11 stringByAppendingString:@"…"];

      id v12 = (id)v13;
    }
  }

  return v12;
}

- (id)unicodeStringByRoundingData:(id)a3 toNextWholeCharacterUsingEncoding:(unint64_t)a4 prefixLength:(unint64_t)a5 suffixLength:(unint64_t)a6 maximumValueLength:(unint64_t)a7
{
  uint64_t v9 = [(CNVCardLexer *)self stringFromData:a3 encoding:a4 prefixLength:a5 suffixLength:a6];
  uint64_t v10 = [(CNVCardLexer *)self clipAtGraphemeClusters:v9 maximumValueLength:a7 addEllipsisIfClipped:0];

  return v10;
}

- (id)stringFromData:(id)a3 encoding:(unint64_t)a4 prefixLength:(unint64_t)a5 suffixLength:(unint64_t)a6
{
  CFIndex v8 = [(CNVCardLexer *)self trimData:a3 withPrefixLength:a5 suffixLength:a6];
  uint64_t v9 = [(CNVCardLexer *)self stringFromSubData:v8 encoding:a4];

  return v9;
}

- (id)trimData:(id)a3 withPrefixLength:(unint64_t)a4 suffixLength:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = v8;
  if (a5 | a4)
  {
    uint64_t v10 = -[CNVCardLexer rangeWithLength:lTrim:rTrim:](self, "rangeWithLength:lTrim:rTrim:", [v8 length], a4, a5);
    objc_msgSend(v9, "subdataWithRange:", v10, v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = v8;
  }
  uint64_t v13 = v12;

  return v13;
}

- (_NSRange)rangeWithLength:(unint64_t)a3 lTrim:(unint64_t)a4 rTrim:(unint64_t)a5
{
  NSUInteger v6 = a3 - (a4 + a5);
  result.unint64_t length = v6;
  result.location = a4;
  return result;
}

- (id)stringFromSubData:(id)a3 encoding:(unint64_t)a4
{
  if (a4 == 4000100)
  {
    id v4 = a3;
    uint64_t v5 = +[CNVCardData stringFromUTF7Data:v4];
  }
  else
  {
    id v7 = (objc_class *)NSString;
    id v4 = a3;
    uint64_t v5 = [[v7 alloc] initWithData:v4 encoding:a4];
  }
  id v8 = (void *)v5;

  return v8;
}

- (id)nextQuotedStringValueInEncoding:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend(@"\", "dataUsingEncoding:"");
  uint64_t v6 = -[CNVCardLexer expandRange:untilNextByteIs:](self, "expandRange:untilNextByteIs:", [v5 length] + self->_cursor, 0, v5);
  uint64_t v8 = v7;
  uint64_t v9 = [MEMORY[0x1E4F1CA58] data];
  -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", v6, v8, v9);
  self->_NSUInteger cursor = v6 + v8 + [v5 length];
  uint64_t v10 = [(CNVCardLexer *)self stringFromSubData:v9 encoding:a3];

  return v10;
}

- (_NSRange)expandRange:(_NSRange)a3 untilNextByteIs:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v8 = [v7 length];
  uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:&self->_bytes[location + length] length:v8 freeWhenDone:0];
  if (location + length < self->_length)
  {
    while (([v9 isEqualToData:v7] & 1) == 0)
    {
      uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:&self->_bytes[location + v8 + length] length:v8 freeWhenDone:0];

      uint64_t v9 = v11;
      length += v8;
      NSUInteger v10 = length;
      if (location + length >= self->_length) {
        goto LABEL_6;
      }
    }
  }
  NSUInteger v10 = length;
  uint64_t v11 = v9;
LABEL_6:

  NSUInteger v12 = location;
  NSUInteger v13 = v10;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (id)nextUnicodeStringStopTokens:(int)a3 quotedPrintable:(BOOL)a4 trim:(BOOL)a5 maximumValueLength:(unint64_t)a6
{
  BOOL v6 = a5;
  BOOL v42 = a4;
  if ((a3 & 0x80) != 0)
  {
    bytes = self->_bytes;
    unint64_t cursor = self->_cursor;
    if (!bytes[cursor] && bytes[cursor + 1] == 34)
    {
      NSUInteger v10 = [(CNVCardLexer *)self nextQuotedStringValueInEncoding:2415919360];
      goto LABEL_42;
    }
  }
  else
  {
    unint64_t cursor = self->_cursor;
  }
  CFArrayRef v11 = [(CNVCardLexer *)self tokenSetForLength:1];
  NSUInteger v12 = [MEMORY[0x1E4F1CA58] data];
  __int16 v44 = 0;
  unint64_t v13 = self->_cursor;
  if (v13 >= self->_length)
  {
LABEL_40:
    NSUInteger v10 = 0;
    self->_unint64_t cursor = self->_peekedPoint;
    goto LABEL_41;
  }
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  unint64_t v38 = 2 * a6 + 20;
  uint64_t v39 = 0;
  char v16 = 1;
  while (1)
  {
    uint64_t v17 = &self->_bytes[v13];
    v43[1] = *v17;
    v43[0] = v17[1];
    CFIndex Count = CFArrayGetCount(v11);
    if (Count)
    {
      CFIndex v19 = Count;
      CFIndex v20 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v11, v20);
        char v22 = (unsigned __int16 *)ValueAtIndex[1];
        int v23 = (unsigned __int16 *)v43;
        while (1)
        {
          while (1)
          {
            int v25 = *v22++;
            int v24 = v25;
            int v27 = *v23++;
            int v26 = v27;
            if (v27 != v24) {
              break;
            }
            if (!v24) {
              goto LABEL_21;
            }
          }
          if ((v26 - 97) > 0x19) {
            break;
          }
          if (v24 != (v26 - 32)) {
            goto LABEL_18;
          }
        }
        if (v26)
        {
LABEL_18:
          if (++v20 != v19) {
            continue;
          }
          goto LABEL_19;
        }
        break;
      }
LABEL_21:
      int v28 = *(_DWORD *)ValueAtIndex;
      if (!v6) {
        goto LABEL_25;
      }
    }
    else
    {
LABEL_19:
      int v28 = 0;
      if (!v6) {
        goto LABEL_25;
      }
    }
    if ((v28 & 0x4000) != 0) {
      break;
    }
    v16 &= (v28 & a3) != 0;
    if ((v28 & a3) == 0) {
      uint64_t v15 = 0;
    }
LABEL_25:
    if (v42 && v28 == 1025)
    {
      ++self->_cursor;
      -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", cursor, v14, v12);
      [(CNVCardLexer *)self appendNextQuotedPrintableDataToData:v12];
    }
    else
    {
      if (v28 != 513) {
        goto LABEL_35;
      }
      ++self->_cursor;
      -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", cursor, v14, v12);
      [(CNVCardLexer *)self appendNextEscapedCharacterToData:v12];
    }
    unint64_t cursor = [(CNVCardLexer *)self emptyRangeStartingAtCursor];
    uint64_t v14 = v29;
LABEL_39:
    unint64_t v13 = self->_cursor;
    if (v13 >= self->_length) {
      goto LABEL_40;
    }
  }
  uint64_t v30 = v39;
  BOOL v31 = (v16 & 1) == 0;
  char v16 = (v16 & 1) != 0;
  if (!v31) {
    uint64_t v30 = v39 + 2;
  }
  uint64_t v39 = v30;
  if (v31) {
    v15 += 2;
  }
LABEL_35:
  if ((v28 & a3) != 0)
  {
    -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", cursor, v14, v12);
    int v33 = [(CNVCardLexer *)self stringFromData:v12 encoding:2415919360 prefixLength:v39 suffixLength:v15];
    NSUInteger v10 = [(CNVCardLexer *)self clipAtGraphemeClusters:v33 maximumValueLength:a6 addEllipsisIfClipped:1];

    goto LABEL_41;
  }
  if (a6 == -1 || v14 != v38)
  {
    v14 += 2;
    self->_cursor += 2;
    goto LABEL_39;
  }
  -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", cursor, v38, v12);
  BOOL v34 = [(CNVCardLexer *)self unicodeStringByRoundingData:v12 toNextWholeCharacterUsingEncoding:2415919360 prefixLength:v39 suffixLength:v15 maximumValueLength:a6];
  uint64_t v35 = [v34 stringByAppendingString:@"…"];
  uint64_t v36 = (void *)v35;
  if (v35) {
    v37 = (__CFString *)v35;
  }
  else {
    v37 = @"…";
  }
  NSUInteger v10 = v37;

  self->_cursor += 2;
  [(CNVCardLexer *)self unicodeSkipToStopTokens:a3];
LABEL_41:

LABEL_42:
  return v10;
}

- (void)unicodeSkipToStopTokens:(int)a3
{
  CFArrayRef theArray = [(CNVCardLexer *)self tokenSetForLength:1];
  __int16 v20 = 0;
  for (i = self->_cursor; i < self->_length; self->_unint64_t cursor = i)
  {
    BOOL v6 = &self->_bytes[i];
    v19[1] = *v6;
    v19[0] = v6[1];
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count)
    {
      CFIndex v8 = Count;
      CFIndex v9 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v9);
        CFArrayRef v11 = (unsigned __int16 *)ValueAtIndex[1];
        NSUInteger v12 = (unsigned __int16 *)v19;
        while (1)
        {
          while (1)
          {
            int v14 = *v11++;
            int v13 = v14;
            int v16 = *v12++;
            int v15 = v16;
            if (v16 != v13) {
              break;
            }
            if (!v13) {
              goto LABEL_15;
            }
          }
          if ((v15 - 97) > 0x19) {
            break;
          }
          if (v13 != (v15 - 32)) {
            goto LABEL_13;
          }
        }
        if (!v15)
        {
LABEL_15:
          int v17 = *(_DWORD *)ValueAtIndex;
          goto LABEL_16;
        }
LABEL_13:
        if (++v9 != v8) {
          continue;
        }
        break;
      }
    }
    int v17 = 0;
LABEL_16:
    if ((v17 & a3) != 0) {
      break;
    }
    unint64_t i = self->_cursor + 2;
  }
}

- (BOOL)_applyNextStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6 maximumValueLength:(unint64_t)a7 intoString:(id)a8
{
  BOOL v9 = a6;
  uint64_t v10 = *(void *)&a5;
  BOOL v11 = a4;
  id v14 = a8;
  if (self->_unicode)
  {
    int v15 = [(CNVCardLexer *)self nextUnicodeStringStopTokens:v10 quotedPrintable:v11 trim:v9 maximumValueLength:a7];
    objc_msgSend(v14, "_cn_appendNonNilString:", v15);
    if (([(CNVCardLexer *)self nextTokenPeekUnicode:1 length:1] & 0x8000) != 0)
    {
      [(CNVCardLexer *)self advancePastEOL];
      if (([(CNVCardLexer *)self nextTokenPeekUnicode:1 length:1] & 0x4000) == 0)
      {
        BOOL v16 = 0;
        unint64_t v17 = self->_cursor - 2;
LABEL_9:
        self->_unint64_t cursor = v17;
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else
  {
    int v15 = [(CNVCardLexer *)self nextSingleByteStringInEncoding:a3 quotedPrintable:v11 stopTokens:v10 trim:v9 maximumValueLength:a7];
    objc_msgSend(v14, "_cn_appendNonNilString:", v15);
    if (([(CNVCardLexer *)self nextTokenPeekSingle:1 length:1] & 0x8000) != 0)
    {
      [(CNVCardLexer *)self advancePastEOL];
      if (([(CNVCardLexer *)self nextTokenPeekSingle:1 length:1] & 0x4000) == 0)
      {
        BOOL v16 = 0;
        unint64_t v17 = self->_cursor - 1;
        goto LABEL_9;
      }
LABEL_10:
      [(CNVCardLexer *)self advanceToPeekPoint];
      BOOL v16 = 1;
      goto LABEL_11;
    }
  }
  BOOL v16 = 0;
LABEL_11:

  return v16;
}

- (id)nextStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6 maximumValueLength:(unint64_t)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  BOOL v10 = a4;
  int v13 = [MEMORY[0x1E4F28E78] string];
  unint64_t cursor = self->_cursor;
  while (1)
  {
    BOOL v15 = [(CNVCardLexer *)self _applyNextStringInEncoding:a3 quotedPrintable:v10 stopTokens:v9 trim:0 maximumValueLength:a7 intoString:v13];
    unint64_t v16 = self->_cursor;
    if (v15 && v16 <= cursor) {
      break;
    }
    unint64_t cursor = self->_cursor;
    if (!v15)
    {
      if (!v8) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  unsigned int v18 = [(CNVCardLexer *)self os_log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
    -[CNVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:](cursor, v16, v18);
  }

  if (v8) {
LABEL_6:
  }
    objc_msgSend(v13, "_cn_trim");
LABEL_7:
  return v13;
}

- (int)tokenAtCursor
{
  unint64_t cursor = self->_cursor;
  CFArrayRef v4 = [(CNVCardLexer *)self tokenSetForLength:1];
  CFArrayRef v5 = v4;
  if (!self->_unicode)
  {
    v26[1] = 0;
    v26[0] = self->_bytes[cursor];
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v17 = Count;
      CFIndex v18 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v18);
        CFIndex v19 = (unsigned __int8 *)ValueAtIndex[1];
        __int16 v20 = v26;
        do
        {
          while (1)
          {
            int v22 = *v19++;
            int v21 = v22;
            int v24 = *v20++;
            int v23 = v24;
            if (v24 != v21) {
              break;
            }
            if (!v21) {
              goto LABEL_26;
            }
          }
        }
        while ((v23 - 97) <= 0x19 && v23 && v21 == (v23 - 32));
        if (!v23)
        {
LABEL_26:
          LODWORD(v7) = *(_DWORD *)ValueAtIndex;
          goto LABEL_27;
        }
        if (++v18 != v17) {
          continue;
        }
        break;
      }
    }
    goto LABEL_25;
  }
  __int16 v28 = 0;
  BOOL v6 = &self->_bytes[cursor];
  v27[1] = *v6;
  v27[0] = v6[1];
  CFIndex v7 = CFArrayGetCount(v4);
  if (v7)
  {
    for (CFIndex i = 0; i != v7; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
      BOOL v10 = (unsigned __int16 *)ValueAtIndex[1];
      BOOL v11 = (unsigned __int16 *)v27;
      while (1)
      {
        while (1)
        {
          int v13 = *v10++;
          int v12 = v13;
          int v15 = *v11++;
          int v14 = v15;
          if (v15 != v12) {
            break;
          }
          if (!v12) {
            goto LABEL_26;
          }
        }
        if ((v14 - 97) > 0x19) {
          break;
        }
        if (v12 != (v14 - 32)) {
          goto LABEL_12;
        }
      }
      if (!v14) {
        goto LABEL_26;
      }
LABEL_12:
      ;
    }
LABEL_25:
    LODWORD(v7) = 0;
  }
LABEL_27:

  return v7;
}

- (unsigned)charAtPosition:(unint64_t)a3 withOffset:(int64_t)a4
{
  bytes = self->_bytes;
  if (self->_unicode) {
    return bswap32(*(unsigned __int16 *)&bytes[2 * a4 + a3]) >> 16;
  }
  else {
    LOWORD(v5) = bytes[a4 + a3];
  }
  return v5;
}

- (id)stringWithRange:(_NSRange)a3 encoding:(unint64_t)a4
{
  int v5 = -[CNVCardLexer dataWithRange:](self, "dataWithRange:", a3.location, a3.length);
  BOOL v6 = (void *)[[NSString alloc] initWithData:v5 encoding:a4];

  return v6;
}

- (id)dataWithRange:(_NSRange)a3
{
  NSUInteger v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:&self->_bytes[a3.location] length:a3.length freeWhenDone:0];
  return v3;
}

- (id)nextArraySeperatedByToken:(int)a3 stoppingAt:(int)a4 inEncoding:(unint64_t)a5 maximumValueLength:(unint64_t)a6
{
  BOOL v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
  [v11 removeAllObjects];
  while (([(CNVCardLexer *)self tokenAtCursorIgnoringLineFolding] & a4) == 0)
  {
    if (self->_cursor >= self->_length) {
      break;
    }
    int v12 = [(CNVCardLexer *)self nextStringInEncoding:a5 quotedPrintable:0 stopTokens:a4 | a3 trim:1 maximumValueLength:a6];
    int v13 = v12;
    if (v12 && [v12 length]) {
      [v11 addObject:v13];
    }
    if (([(CNVCardLexer *)self tokenAtCursor] & a3) != 0)
    {
      if (self->_unicode) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 1;
      }
      self->_cursor += v14;
    }
  }
  return v11;
}

- (int)tokenAtCursorIgnoringLineFolding
{
  int result = [(CNVCardLexer *)self tokenAtCursor];
  if ((result & 0x8000) != 0)
  {
    unint64_t cursor = self->_cursor;
    [(CNVCardLexer *)self advancePastEOL];
    if (([(CNVCardLexer *)self nextTokenPeek:1 length:1] & 0x4000) != 0) {
      [(CNVCardLexer *)self advanceToPeekPoint];
    }
    else {
      self->_unint64_t cursor = cursor;
    }
    return [(CNVCardLexer *)self tokenAtCursor];
  }
  return result;
}

- (id)nextUnicodeBase64Line:(BOOL *)a3
{
  int v5 = [MEMORY[0x1E4F1CA58] data];
  CFArrayRef v6 = [(CNVCardLexer *)self tokenSetForLength:1];
  __int16 v23 = 0;
  for (i = self->_cursor; i < self->_length; self->_unint64_t cursor = i)
  {
    bytes = self->_bytes;
    v22[1] = bytes[i];
    unint64_t v9 = i + 1;
    self->_unint64_t cursor = v9;
    v22[0] = bytes[v9];
    CFIndex Count = CFArrayGetCount(v6);
    if (Count)
    {
      CFIndex v11 = Count;
      CFIndex v12 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, v12);
        uint64_t v14 = (unsigned __int16 *)ValueAtIndex[1];
        int v15 = (unsigned __int16 *)v22;
        while (1)
        {
          while (1)
          {
            int v17 = *v14++;
            int v16 = v17;
            int v19 = *v15++;
            int v18 = v19;
            if (v19 != v16) {
              break;
            }
            if (!v16) {
              goto LABEL_15;
            }
          }
          if ((v18 - 97) > 0x19) {
            break;
          }
          if (v16 != (v18 - 32)) {
            goto LABEL_13;
          }
        }
        if (v18)
        {
LABEL_13:
          if (++v12 != v11) {
            continue;
          }
          goto LABEL_17;
        }
        break;
      }
LABEL_15:
      int v20 = *(_DWORD *)ValueAtIndex;
      if (*(_DWORD *)ValueAtIndex == 1025)
      {
        *a3 = 1;
        goto LABEL_20;
      }
      if (!v20) {
        goto LABEL_17;
      }
      if ((v20 & 0x8000) != 0)
      {
        --self->_cursor;
        break;
      }
    }
    else
    {
LABEL_17:
      [v5 appendBytes:v22 length:1];
    }
LABEL_20:
    unint64_t i = self->_cursor + 1;
  }

  return v5;
}

- (id)nextSingleByteBase64Line:(BOOL *)a3
{
  int v5 = [MEMORY[0x1E4F1CA58] data];
  CFArrayRef v6 = [(CNVCardLexer *)self tokenSetForLength:1];
  v20[1] = 0;
  for (i = self->_cursor; i < self->_length; self->_unint64_t cursor = i)
  {
    v20[0] = self->_bytes[i];
    CFIndex Count = CFArrayGetCount(v6);
    if (Count < 1)
    {
LABEL_17:
      [v5 appendBytes:v20 length:1];
    }
    else
    {
      CFIndex v9 = Count;
      CFIndex v10 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, v10);
        CFIndex v12 = (unsigned __int8 *)ValueAtIndex[1];
        int v13 = v20;
        do
        {
          while (1)
          {
            int v15 = *v12++;
            int v14 = v15;
            int v17 = *v13++;
            int v16 = v17;
            if (v17 != v14) {
              break;
            }
            if (!v14) {
              goto LABEL_15;
            }
          }
        }
        while ((v16 - 97) <= 0x19 && v16 && v14 == (v16 - 32));
        if (v16)
        {
          if (++v10 != v9) {
            continue;
          }
          goto LABEL_17;
        }
        break;
      }
LABEL_15:
      int v18 = *(_DWORD *)ValueAtIndex;
      if (*(_DWORD *)ValueAtIndex == 1025)
      {
        *a3 = 1;
        goto LABEL_20;
      }
      if (!v18) {
        goto LABEL_17;
      }
      if ((v18 & 0x8000) != 0) {
        break;
      }
    }
LABEL_20:
    unint64_t i = self->_cursor + 1;
  }

  return v5;
}

- (id)nextBase64Line:(BOOL *)a3
{
  if (self->_unicode) {
    [(CNVCardLexer *)self nextUnicodeBase64Line:a3];
  }
  else {
  NSUInteger v3 = [(CNVCardLexer *)self nextSingleByteBase64Line:a3];
  }
  return v3;
}

- (id)nextBase64Data
{
  char v9 = 0;
  NSUInteger v3 = [MEMORY[0x1E4F1CA58] data];
  CFArrayRef v4 = 0;
  do
  {
    int v5 = v4;
    CFArrayRef v4 = [(CNVCardLexer *)self nextBase64Line:&v9];

    if (!v4) {
      break;
    }
    [v3 appendData:v4];
    CFArrayRef v6 = +[CNVCardLexer returnDelimiterData];
    [v3 appendData:v6];

    unint64_t cursor = self->_cursor;
    [(CNVCardLexer *)self advanceToEOL];
    [(CNVCardLexer *)self advancePastEOL];
    if (![(CNVCardLexer *)self advanceToString])
    {
      char v9 = 1;
      self->_unint64_t cursor = cursor;
      break;
    }
  }
  while (!v9);

  return v3;
}

- (void)advanceToPeekPoint
{
  self->_unint64_t cursor = self->_peekedPoint;
}

- (int64_t)advanceToUnicodeString
{
  CFArrayRef v3 = [(CNVCardLexer *)self tokenSetForLength:1];
  __int16 v21 = 0;
  unint64_t cursor = self->_cursor;
  self->_peekedPoint = cursor;
  if (cursor >= self->_length)
  {
LABEL_17:
    int64_t v5 = 0;
  }
  else
  {
    int64_t v5 = 0;
    while (1)
    {
      bytes = self->_bytes;
      v20[1] = bytes[cursor];
      unint64_t v7 = cursor + 1;
      self->_peekedPoint = v7;
      v20[0] = bytes[v7];
      CFIndex Count = CFArrayGetCount(v3);
      if (!Count) {
        break;
      }
      CFIndex v9 = Count;
      CFIndex v10 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, v10);
        CFIndex v12 = (unsigned __int16 *)ValueAtIndex[1];
        int v13 = (unsigned __int16 *)v20;
        while (1)
        {
          while (1)
          {
            int v15 = *v12++;
            int v14 = v15;
            int v17 = *v13++;
            int v16 = v17;
            if (v17 != v14) {
              break;
            }
            if (!v14) {
              goto LABEL_15;
            }
          }
          if ((v16 - 97) > 0x19) {
            break;
          }
          if (v14 != (v16 - 32)) {
            goto LABEL_13;
          }
        }
        if (v16)
        {
LABEL_13:
          if (++v10 != v9) {
            continue;
          }
          goto LABEL_18;
        }
        break;
      }
LABEL_15:
      if ((*((unsigned char *)ValueAtIndex + 1) & 0x40) == 0) {
        break;
      }
      ++v5;
      unint64_t length = self->_length;
      unint64_t cursor = self->_peekedPoint + 1;
      self->_peekedPoint = cursor;
      if (cursor >= length) {
        goto LABEL_17;
      }
    }
LABEL_18:
    unint64_t cursor = self->_peekedPoint - 1;
    self->_peekedPoint = cursor;
  }
  self->_unint64_t cursor = cursor;

  return v5;
}

- (int64_t)advanceToSingleByteString
{
  CFArrayRef v3 = [(CNVCardLexer *)self tokenSetForLength:1];
  v18[1] = 0;
  unint64_t cursor = self->_cursor;
  self->_peekedPoint = cursor;
  if (cursor >= self->_length)
  {
LABEL_17:
    int64_t v5 = 0;
  }
  else
  {
    int64_t v5 = 0;
    while (1)
    {
      v18[0] = self->_bytes[cursor];
      CFIndex Count = CFArrayGetCount(v3);
      if (Count < 1) {
        break;
      }
      CFIndex v7 = Count;
      CFIndex v8 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, v8);
        CFIndex v10 = (unsigned __int8 *)ValueAtIndex[1];
        CFIndex v11 = v18;
        do
        {
          while (1)
          {
            int v13 = *v10++;
            int v12 = v13;
            int v15 = *v11++;
            int v14 = v15;
            if (v15 != v12) {
              break;
            }
            if (!v12) {
              goto LABEL_15;
            }
          }
        }
        while ((v14 - 97) <= 0x19 && v14 && v12 == (v14 - 32));
        if (v14)
        {
          if (++v8 != v7) {
            continue;
          }
          goto LABEL_18;
        }
        break;
      }
LABEL_15:
      if ((*((unsigned char *)ValueAtIndex + 1) & 0x40) == 0) {
        break;
      }
      ++v5;
      unint64_t length = self->_length;
      unint64_t cursor = self->_peekedPoint + 1;
      self->_peekedPoint = cursor;
      if (cursor >= length) {
        goto LABEL_17;
      }
    }
LABEL_18:
    unint64_t cursor = self->_peekedPoint;
  }
  self->_unint64_t cursor = cursor;

  return v5;
}

- (int64_t)advanceToString
{
  if (self->_unicode) {
    return [(CNVCardLexer *)self advanceToUnicodeString];
  }
  else {
    return [(CNVCardLexer *)self advanceToSingleByteString];
  }
}

- (BOOL)advanceToToken:(int)a3 throughTypes:(int64_t)a4
{
  int v7 = 0;
  while (v7 != a3)
  {
    int v8 = [(CNVCardLexer *)self readNextToken];
    if (v8 == a3) {
      break;
    }
    int v7 = v8;
    BOOL result = 0;
    BOOL v11 = (v7 & a4) == 0 && a4 != 0;
    if ((v7 - 65537) < 2 || v11) {
      return result;
    }
  }
  return 1;
}

- (BOOL)advanceToEOLUnicode
{
  unint64_t length = self->_length;
  unint64_t cursor = self->_cursor;
  if (cursor >= length) {
    return 0;
  }
  bytes = self->_bytes;
  while (1)
  {
    unsigned int v5 = __rev16(*(unsigned __int16 *)&bytes[cursor]);
    if (v5 == 10 || v5 == 13) {
      break;
    }
    cursor += 2;
    self->_unint64_t cursor = cursor;
    if (cursor >= length) {
      return 0;
    }
  }
  return 1;
}

- (BOOL)advanceToEOLSingle
{
  unint64_t length = self->_length;
  unint64_t cursor = self->_cursor;
  if (cursor >= length)
  {
    return 0;
  }
  else
  {
    bytes = self->_bytes;
    BOOL v5 = 1;
    do
    {
      int v6 = bytes[cursor];
      if (v6 == 10 || v6 == 13) {
        break;
      }
      self->_unint64_t cursor = ++cursor;
      BOOL v5 = cursor < length;
    }
    while (length != cursor);
  }
  return v5;
}

- (BOOL)advanceToEOL
{
  if (self->_unicode) {
    return [(CNVCardLexer *)self advanceToEOLUnicode];
  }
  else {
    return [(CNVCardLexer *)self advanceToEOLSingle];
  }
}

- (BOOL)advancePastEOLUnicode
{
  CFArrayRef v3 = [(CNVCardLexer *)self tokenSetForLength:1];
  __int16 v21 = 0;
  unint64_t cursor = self->_cursor;
  self->_peekedPoint = cursor;
  unint64_t length = self->_length;
  while (1)
  {
    if (cursor >= length)
    {
      BOOL v18 = 0;
      goto LABEL_19;
    }
    bytes = self->_bytes;
    v20[1] = bytes[cursor];
    unint64_t v7 = cursor + 1;
    self->_peekedPoint = v7;
    v20[0] = bytes[v7];
    CFIndex Count = CFArrayGetCount(v3);
    if (!Count) {
      break;
    }
    CFIndex v9 = Count;
    CFIndex v10 = 0;
    while (2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v3, v10);
      int v12 = (unsigned __int16 *)ValueAtIndex[1];
      int v13 = (unsigned __int16 *)v20;
      while (1)
      {
        while (1)
        {
          int v15 = *v12++;
          int v14 = v15;
          int v17 = *v13++;
          int v16 = v17;
          if (v17 != v14) {
            break;
          }
          if (!v14) {
            goto LABEL_15;
          }
        }
        if ((v16 - 97) > 0x19) {
          break;
        }
        if (v14 != (v16 - 32)) {
          goto LABEL_13;
        }
      }
      if (v16)
      {
LABEL_13:
        if (++v10 != v9) {
          continue;
        }
        goto LABEL_18;
      }
      break;
    }
LABEL_15:
    if ((*((unsigned char *)ValueAtIndex + 1) & 0x80) == 0) {
      break;
    }
    unint64_t length = self->_length;
    unint64_t cursor = self->_peekedPoint + 1;
    self->_peekedPoint = cursor;
  }
LABEL_18:
  unint64_t cursor = self->_peekedPoint - 1;
  self->_peekedPoint = cursor;
  BOOL v18 = 1;
LABEL_19:
  self->_unint64_t cursor = cursor;

  return v18;
}

- (BOOL)advancePastEOLSingle
{
  self->_peekedPoint = self->_cursor;
  CFArrayRef v3 = [(CNVCardLexer *)self tokenSetForLength:1];
  v18[1] = 0;
  unint64_t length = self->_length;
  for (unint64_t i = self->_peekedPoint; ; self->_peekedPoint = i)
  {
    if (i >= length)
    {
      BOOL v16 = 0;
      goto LABEL_19;
    }
    v18[0] = self->_bytes[i];
    CFIndex Count = CFArrayGetCount(v3);
    if (Count < 1) {
      break;
    }
    CFIndex v7 = Count;
    CFIndex v8 = 0;
    while (2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v3, v8);
      CFIndex v10 = (unsigned __int8 *)ValueAtIndex[1];
      BOOL v11 = v18;
      do
      {
        while (1)
        {
          int v13 = *v10++;
          int v12 = v13;
          int v15 = *v11++;
          int v14 = v15;
          if (v15 != v12) {
            break;
          }
          if (!v12) {
            goto LABEL_15;
          }
        }
      }
      while ((v14 - 97) <= 0x19 && v14 && v12 == (v14 - 32));
      if (v14)
      {
        if (++v8 != v7) {
          continue;
        }
        goto LABEL_18;
      }
      break;
    }
LABEL_15:
    if ((*((unsigned char *)ValueAtIndex + 1) & 0x80) == 0) {
      break;
    }
    unint64_t length = self->_length;
    unint64_t i = self->_peekedPoint + 1;
  }
LABEL_18:
  unint64_t i = self->_peekedPoint;
  BOOL v16 = 1;
LABEL_19:
  self->_unint64_t cursor = i;

  return v16;
}

- (BOOL)advancePastEOL
{
  if (self->_unicode) {
    return [(CNVCardLexer *)self advancePastEOLUnicode];
  }
  else {
    return [(CNVCardLexer *)self advancePastEOLSingle];
  }
}

- (BOOL)atEOF
{
  unint64_t length = self->_length;
  return !length || self->_cursor >= length;
}

- (BOOL)advancedPastToken:(int)a3
{
  unint64_t cursor = self->_cursor;
  unint64_t v4 = cursor;
  if (cursor < self->_length)
  {
    while (([(CNVCardLexer *)self tokenAtCursor] & a3) != 0)
    {
      if (self->_unicode) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 1;
      }
      unint64_t v4 = self->_cursor + v7;
      self->_unint64_t cursor = v4;
      if (v4 >= self->_length) {
        return v4 > cursor;
      }
    }
    unint64_t v4 = self->_cursor;
  }
  return v4 > cursor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTokenSets, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)nextTokenPeekSingle:(os_log_t)log length:.cold.1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl(&dword_1DC18F000, log, OS_LOG_TYPE_ERROR, "vCard syntax error, character %ld : %c", (uint8_t *)&v4, 0x12u);
}

- (void)nextStringInEncoding:(os_log_t)log quotedPrintable:stopTokens:trim:maximumValueLength:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1DC18F000, log, OS_LOG_TYPE_FAULT, "Cursor did not move (%lu --> %lu), but lexar did not detect a value boundary", (uint8_t *)&v3, 0x16u);
}

@end
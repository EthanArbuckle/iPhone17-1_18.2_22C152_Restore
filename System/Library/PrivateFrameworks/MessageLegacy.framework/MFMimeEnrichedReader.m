@interface MFMimeEnrichedReader
+ (__CFCharacterSet)parenSet;
+ (__CFCharacterSet)punctuationSet;
- (id)currentFont;
- (id)description;
- (int)readTokenInto:(id *)a3;
- (void)appendNewLine:(id)a3;
- (void)appendStringToBuffer:(id)a3;
- (void)beginCommand:(id)a3;
- (void)closeUpQuoting;
- (void)convertEnrichedString:(id)a3 intoOutputString:(id)a4;
- (void)convertRichTextString:(id)a3 intoOutputString:(id)a4;
- (void)dealloc;
- (void)endCommand:(id)a3;
- (void)handleNoParameterCommand:(id *)a3;
- (void)mismatchError:(id)a3;
- (void)nowWouldBeAGoodTimeToAppendToTheAttributedString;
- (void)parseParameterString:(id)a3;
- (void)resetStateWithString:(id)a3 outputString:(id)a4;
- (void)setWantsHTML:(BOOL)a3;
- (void)setupFontStackEntry:(_CommandStackEntry *)a3;
@end

@implementation MFMimeEnrichedReader

+ (__CFCharacterSet)punctuationSet
{
  result = (__CFCharacterSet *)punctuationSet_puncSet;
  if (!punctuationSet_puncSet)
  {
    result = CFCharacterSetCreateWithCharactersInString(0, @" <>\n");
    punctuationSet_puncSet = (uint64_t)result;
  }
  return result;
}

+ (__CFCharacterSet)parenSet
{
  result = (__CFCharacterSet *)parenSet_parenSet;
  if (!parenSet_parenSet)
  {
    result = CFCharacterSetCreateWithCharactersInString(0, @"<>");
    parenSet_parenSet = (uint64_t)result;
  }
  return result;
}

- (void)setWantsHTML:(BOOL)a3
{
  *((unsigned char *)self + 212) = *((unsigned char *)self + 212) & 0xFE | !a3;
}

- (void)mismatchError:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl(&dword_1CFCFE000, v4, OS_LOG_TYPE_INFO, "Ignoring unmatched </%@> command", (uint8_t *)&v5, 0xCu);
  }
}

- (void)dealloc
{
  prependHTML = self->_prependHTML;
  if (prependHTML) {
    CFRelease(prependHTML);
  }
  postpendHTML = self->_postpendHTML;
  if (postpendHTML) {
    CFRelease(postpendHTML);
  }
  if (self->_commandStack)
  {
    while (_releaseTopStackEntry((uint64_t)self))
      ;
    CFRelease(self->_commandStack);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFMimeEnrichedReader;
  [(MFMimeEnrichedReader *)&v5 dealloc];
}

- (void)appendStringToBuffer:(id)a3
{
  id v3 = a3;
  if ((*((unsigned char *)self + 211) & 0x40) != 0 && [a3 hasPrefix:@"\n"]) {
    id v3 = (id)[v3 substringFromIndex:1];
  }
  [(NSMutableString *)self->_outputBuffer appendString:v3];
  *((unsigned char *)self + 211) &= ~0x40u;
}

- (void)resetStateWithString:(id)a3 outputString:(id)a4
{
  self->_outputString = a4;
  if (a3) {
    CFIndex Length = CFStringGetLength((CFStringRef)a3);
  }
  else {
    CFIndex Length = 0;
  }
  self->_inputCFIndex Length = Length;
  self->_inputBuffer.theString = (__CFString *)a3;
  self->_inputBuffer.rangeToBuffer.location = 0;
  self->_inputBuffer.rangeToBuffer.length = Length;
  CharactersPtr = (unsigned __int16 *)CFStringGetCharactersPtr((CFStringRef)a3);
  CStringPtr = 0;
  self->_inputBuffer.directUniCharBuffer = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
  }
  self->_inputBuffer.directCStringBuffer = CStringPtr;
  self->_inputBuffer.bufferedRangeEnd = 0;
  self->_currentIndex = 0;
  self->_inputBuffer.bufferedRangeStart = 0;
  *((unsigned char *)self + 211) &= ~0x80u;
  if (self->_commandStack)
  {
    while (_releaseTopStackEntry((uint64_t)self))
      ;
  }
  self->_commandStack = CFArrayCreateMutable(0, 0, 0);

  self->_outputBuffer = (NSMutableString *)objc_opt_new();
}

- (void)nowWouldBeAGoodTimeToAppendToTheAttributedString
{
  if (*((unsigned char *)self + 212))
  {
    [self->_outputString appendString:self->_outputBuffer];
    outputBuffer = self->_outputBuffer;
    [(NSMutableString *)outputBuffer setString:&stru_1F265CF90];
    return;
  }
  if (![(NSMutableString *)self->_outputBuffer length]) {
    return;
  }
  if (!self->_prependHTML) {
    self->_prependHTML = CFStringCreateMutable(0, 0);
  }
  if (!self->_postpendHTML) {
    self->_postpendHTML = CFStringCreateMutable(0, 0);
  }
  CFIndex Count = CFArrayGetCount(self->_commandStack);
  if (Count < 1)
  {
    int v5 = 0;
  }
  else
  {
    CFIndex v4 = Count;
    int v5 = 0;
    int v6 = 0;
    CFIndex v7 = 0;
    int v8 = 0;
    do
    {
      ValueAtIndex = (id **)CFArrayGetValueAtIndex(self->_commandStack, v7);
      if ([**ValueAtIndex isEqualToString:@"underline"])
      {
        if (v6)
        {
          ++v6;
        }
        else
        {
          CFStringAppendCString(self->_prependHTML, "<U>", 0x8000100u);
          CFStringInsert(self->_postpendHTML, 0, @"</U>");
          int v6 = 1;
        }
      }
      else if ([**ValueAtIndex isEqualToString:@"excerpt"])
      {
        ++v5;
      }
      else if ([**ValueAtIndex isEqualToString:@"superscript"])
      {
        ++v8;
      }
      else
      {
        v8 -= [**ValueAtIndex isEqualToString:@"subscript"];
      }
      ++v7;
    }
    while (v4 != v7);
    if (v8 <= 0)
    {
      if ((v8 & 0x80000000) == 0) {
        goto LABEL_27;
      }
      CFStringRef v10 = @"</SUB>";
      v11 = "<SUB>";
    }
    else
    {
      CFStringRef v10 = @"</SUP>";
      v11 = "<SUP>";
    }
    CFStringAppendCString(self->_prependHTML, v11, 0x8000100u);
    CFStringInsert(self->_postpendHTML, 0, v10);
  }
LABEL_27:
  CFStringRef v13 = [(MFMimeEnrichedReader *)self currentFont];
  CFIndex v14 = _currentAttributeOfType((uint64_t)self, 2);
  CFIndex v15 = _currentAttributeOfType((uint64_t)self, 3);
  if ((unint64_t)v13 | v14)
  {
    v16 = (void *)v15;
    CFStringAppendCString(self->_prependHTML, "<SPAN style=\"", 0x8000100u);
    if (v13)
    {
      CFStringAppend(self->_prependHTML, v13);
      CFStringAppendCString(self->_prependHTML, "; ", 0x8000100u);
    }
    if (v14) {
      CFStringAppendFormat(self->_prependHTML, 0, @"color: %s; ", [(id)v14 UTF8String]);
    }
    if (v16) {
      CFStringAppendFormat(self->_prependHTML, 0, @"font-size: %dpt; ", [v16 intValue]);
    }
    CFStringAppendCString(self->_prependHTML, "\">", 0x8000100u);
    CFStringAppendCString(self->_postpendHTML, "</SPAN>", 0x8000100u);
  }
  int v17 = v5 - self->_lastQuoteLevel;
  if (v17 < 1)
  {
    if (v17 < 0)
    {
      int v18 = 0;
      do
      {
        CFStringInsert(self->_prependHTML, 0, @"</BLOCKQUOTE>");
        --v18;
      }
      while (v18 > v17);
    }
  }
  else
  {
    do
    {
      CFStringInsert(self->_prependHTML, 0, @"<BLOCKQUOTE type=\"cite\">");
      --v17;
    }
    while (v17);
  }
  self->_lastQuoteLevel = v5;
  if (CFStringGetLength(self->_prependHTML)) {
    [self->_outputString appendString:self->_prependHTML];
  }
  outputString = (__CFString *)self->_outputString;
  uint64_t v20 = [(NSMutableString *)self->_outputBuffer length];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v41 = 0u;
  v21 = self->_outputBuffer;
  v48 = v21;
  uint64_t v51 = 0;
  int64_t v52 = v20;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)v21);
  CStringPtr = 0;
  v49 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)v21, 0x600u);
  }
  v50 = CStringPtr;
  int64_t v53 = 0;
  int64_t v54 = 0;
  if (v20)
  {
    uint64_t v24 = 0;
    char v25 = 0;
    int64_t v26 = 0;
    uint64_t v27 = 64;
    do
    {
      if ((unint64_t)v26 >= 4) {
        uint64_t v28 = 4;
      }
      else {
        uint64_t v28 = v26;
      }
      UniChar chars = 0;
      if ((v26 & 0x8000000000000000) == 0)
      {
        int64_t v29 = v52;
        if (v52 > v26)
        {
          if (v49)
          {
            UniChar v30 = v49[v26 + v51];
          }
          else if (v50)
          {
            UniChar v30 = v50[v51 + v26];
          }
          else
          {
            if (v54 <= v26 || (int64_t v31 = v53, v53 > v26))
            {
              uint64_t v32 = -v28;
              uint64_t v33 = v28 + v24;
              uint64_t v34 = v27 - v28;
              int64_t v35 = v26 + v32;
              int64_t v36 = v35 + 64;
              if (v35 + 64 >= v52) {
                int64_t v36 = v52;
              }
              int64_t v53 = v35;
              int64_t v54 = v36;
              if (v52 >= v34) {
                int64_t v29 = v34;
              }
              v56.length = v29 + v33;
              v56.location = v35 + v51;
              CFStringGetCharacters((CFStringRef)v48, v56, buffer);
              int64_t v31 = v53;
            }
            UniChar v30 = buffer[v26 - v31];
          }
          UniChar chars = v30;
          if (v30 > 0x25u)
          {
            switch(v30)
            {
              case '&':
                v37 = outputString;
                CFStringRef v38 = @"&amp;";
                goto LABEL_79;
              case '>':
                v37 = outputString;
                CFStringRef v38 = @"&gt;";
                goto LABEL_79;
              case '<':
                v37 = outputString;
                CFStringRef v38 = @"&lt;";
LABEL_79:
                CFStringAppend(v37, v38);
                goto LABEL_80;
            }
          }
          else
          {
            switch(v30)
            {
              case 9u:
                v37 = outputString;
                CFStringRef v38 = @"&nbsp;&nbsp;&nbsp;&nbsp;";
                goto LABEL_79;
              case 0xAu:
                v37 = outputString;
                CFStringRef v38 = @"<br/>";
                goto LABEL_79;
              case 0x20u:
                if ((v25 & 1) == 0)
                {
                  char v25 = 1;
                  CFStringAppendCharacters(outputString, &chars, 1);
                  goto LABEL_81;
                }
                v37 = outputString;
                CFStringRef v38 = @"&nbsp;";
                goto LABEL_79;
            }
          }
        }
      }
      CFStringAppendCharacters(outputString, &chars, 1);
LABEL_80:
      char v25 = 0;
LABEL_81:
      ++v26;
      --v24;
      ++v27;
    }
    while (v20 != v26);
  }
  if (CFStringGetLength(self->_postpendHTML)) {
    [self->_outputString appendString:self->_postpendHTML];
  }
  CFStringReplaceAll(self->_prependHTML, &stru_1F265CF90);
  CFStringReplaceAll(self->_postpendHTML, &stru_1F265CF90);
  CFStringReplaceAll((CFMutableStringRef)self->_outputBuffer, &stru_1F265CF90);
}

- (void)closeUpQuoting
{
  if (self->_lastQuoteLevel >= 1)
  {
    int v3 = 0;
    do
    {
      [self->_outputString appendString:@"</BLOCKQUOTE>"];
      ++v3;
    }
    while (v3 < self->_lastQuoteLevel);
  }
}

- (void)handleNoParameterCommand:(id *)a3
{
  if ([a3->var0 isEqualToString:@"param"])
  {
    CFCharacterSetRef v5 = (const __CFCharacterSet *)[(id)objc_opt_class() parenSet];
    CFStringRef Token = _copyNextToken((uint64_t)self, v5);
    if (Token) {
      [(MFMimeEnrichedReader *)self parseParameterString:Token];
    }
    MEMORY[0x1F41817F8]();
  }
  else
  {
    if ([a3->var0 isEqualToString:@"comment"])
    {
      *((unsigned char *)self + 211) |= 0x80u;
      return;
    }
    if ([a3->var0 isEqualToString:@"lt"])
    {
      outputBuffer = self->_outputBuffer;
      int v8 = @"&lt;";
    }
    else if ([a3->var0 isEqualToString:@"np"])
    {
      outputBuffer = self->_outputBuffer;
      int v8 = @"\f";
    }
    else
    {
      if (![a3->var0 isEqualToString:@"nl"]) {
        return;
      }
      outputBuffer = self->_outputBuffer;
      int v8 = @"\n";
    }
    [(NSMutableString *)outputBuffer appendString:v8];
  }
}

- (void)setupFontStackEntry:(_CommandStackEntry *)a3
{
  if (!a3) {
    -[MFMimeEnrichedReader setupFontStackEntry:]();
  }
  if ([*(id *)a3->var0 isEqualToString:@"bold"])
  {
    CFCharacterSetRef v5 = @"font-weight: bold";
LABEL_6:
    int v6 = v5;
LABEL_18:
    a3->var1 = v6;
    return;
  }
  if ([*(id *)a3->var0 isEqualToString:@"italic"])
  {
    CFCharacterSetRef v5 = @"font-style: italic";
    goto LABEL_6;
  }
  CFIndex v7 = (void *)_currentAttributeOfType((uint64_t)self, 3);
  if (v7)
  {
    [v7 floatValue];
    float v9 = v8;
  }
  else
  {
    float v9 = 12.0;
  }
  float v10 = 2.0;
  if ([*(id *)a3->var0 isEqualToString:@"bigger"]) {
    goto LABEL_17;
  }
  float v10 = 1.0;
  if ([*(id *)a3->var0 isEqualToString:@"x-tad-bigger"]) {
    goto LABEL_17;
  }
  if ([*(id *)a3->var0 isEqualToString:@"smaller"])
  {
    float v10 = -2.0;
    float v11 = 8.0;
  }
  else
  {
    if (![*(id *)a3->var0 isEqualToString:@"x-tad-smaller"]) {
      return;
    }
    float v10 = -1.0;
    float v11 = 7.0;
  }
  if (v9 >= v11)
  {
LABEL_17:
    id v12 = objc_alloc(NSNumber);
    *(float *)&double v13 = v9 + v10;
    int v6 = (__CFString *)[v12 initWithFloat:v13];
    goto LABEL_18;
  }
}

- (void)beginCommand:(id)a3
{
  CFCharacterSetRef v5 = &gCommandSpecTable;
  while ([a3 compare:*v5 options:1])
  {
    v5 += 2;
    if (v5 >= &__block_descriptor_40_e8_32o_e24_v16__0__NSNotification_8ls32l8) {
      return;
    }
  }
  unsigned int v6 = *((unsigned __int8 *)v5 + 8);
  if ((v6 & 4) != 0)
  {
    outputBuffer = self->_outputBuffer;
    if (![outputBuffer length]) {
      outputBuffer = self->_outputString;
    }
    if ([outputBuffer length]
      && objc_msgSend(outputBuffer, "characterAtIndex:", objc_msgSend(outputBuffer, "length") - 1) != 10)
    {
      [(NSMutableString *)self->_outputBuffer appendString:@"\n"];
    }
  }
  if ((v6 & 2) != 0) {
    [(MFMimeEnrichedReader *)self nowWouldBeAGoodTimeToAppendToTheAttributedString];
  }
  if (v6)
  {
    float v8 = (id **)malloc_type_malloc(0x10uLL, 0xE00402B90B96AuLL);
    *float v8 = (id *)v5;
    v8[1] = 0;
  }
  else
  {
    float v8 = 0;
  }
  int v9 = (v6 >> 3) & 3;
  if (v9 == 3 || v9 == 1)
  {
    [(MFMimeEnrichedReader *)self setupFontStackEntry:v8];
  }
  else if (!v9)
  {
    [(MFMimeEnrichedReader *)self handleNoParameterCommand:v5];
  }
  if (v8)
  {
    CFArrayAppendValue(self->_commandStack, v8);
    if ([**v8 isEqualToString:@"nofill"]) {
      *((_DWORD *)self + 52) = *((_DWORD *)self + 52) & 0xC0000000 | (*((_DWORD *)self + 52) + 1) & 0x3FFFFFFF;
    }
  }
}

- (void)endCommand:(id)a3
{
  CFCharacterSetRef v5 = &gCommandSpecTable;
  while ([a3 compare:*v5 options:1])
  {
    v5 += 2;
    if (v5 >= &__block_descriptor_40_e8_32o_e24_v16__0__NSNotification_8ls32l8) {
      return;
    }
  }
  char v6 = *((unsigned char *)v5 + 8);
  if ((v6 & 2) != 0) {
    [(MFMimeEnrichedReader *)self nowWouldBeAGoodTimeToAppendToTheAttributedString];
  }
  if (v6)
  {
    CFIndex v7 = (id **)_peekCommandStackEntry((uint64_t)self);
    if (v7 && ![**v7 compare:a3 options:1])
    {
      _releaseTopStackEntry((uint64_t)self);
    }
    else
    {
      [(MFMimeEnrichedReader *)self mismatchError:a3];
    }
  }
}

- (void)parseParameterString:(id)a3
{
  CFIndex v4 = (id **)_peekCommandStackEntry((uint64_t)self);
  if (v4)
  {
    CFCharacterSetRef v5 = v4;
    if (((_BYTE)(*v4)[1] & 0x18) != 0 && !v4[1])
    {
      if (![**v4 isEqualToString:@"color"])
      {
        if ([**v5 isEqualToString:@"fontfamily"])
        {
          double v13 = (id *)(id)[@"font-family: " stringByAppendingString:a3];
        }
        else
        {
          if (![**v5 isEqualToString:@"x-fontsize"]) {
            return;
          }
          [a3 floatValue];
          if (v14 >= 0.0) {
            float v15 = v14;
          }
          else {
            float v15 = 0.0;
          }
          id v16 = objc_alloc(NSNumber);
          *(float *)&double v17 = v15;
          double v13 = (id *)[v16 initWithFloat:v17];
        }
LABEL_22:
        v5[1] = v13;
        return;
      }
      [a3 rangeOfString:@","];
      if (v6)
      {
        uint64_t v19 = 0;
        int v18 = 0;
        CFIndex v7 = (void *)[MEMORY[0x1E4F28FE8] scannerWithString:a3];
        if (![v7 scanHexInt:(char *)&v19 + 4]) {
          goto LABEL_19;
        }
        a3 = 0;
        if ([v7 scanString:@"," intoString:0])
        {
          if (![v7 scanHexInt:&v19]) {
            goto LABEL_19;
          }
          a3 = 0;
          if ([v7 scanString:@"," intoString:0])
          {
            if ([v7 scanHexInt:&v18])
            {
              LODWORD(v8) = HIDWORD(v19);
              *(double *)&unint64_t v9 = (double)v8 * 0.0000152587891 * 255.0;
              uint64_t v10 = (int)*(double *)&v9;
              LODWORD(v9) = v19;
              *(double *)&unint64_t v11 = (double)v9 * 0.0000152587891 * 255.0;
              uint64_t v12 = (int)*(double *)&v11;
              LODWORD(v11) = v18;
              a3 = (id)[NSString stringWithFormat:@"rgba(%d, %d, %d, 1)", v10, v12, (int)((double)v11 * 0.0000152587891 * 255.0)];
              goto LABEL_20;
            }
LABEL_19:
            a3 = 0;
          }
        }
      }
LABEL_20:
      if (!a3) {
        return;
      }
      double v13 = (id *)a3;
      goto LABEL_22;
    }
  }
}

- (id)currentFont
{
  id result = (id)_currentAttributeOfType((uint64_t)self, 1);
  if (!result) {
    return @"font-face: Helvetica";
  }
  return result;
}

- (void)appendNewLine:(id)a3
{
}

- (int)readTokenInto:(id *)a3
{
  CFCharacterSetRef v5 = (const __CFCharacterSet *)[(id)objc_opt_class() punctuationSet];
  CFStringRef Token = (__CFString *)_copyNextToken((uint64_t)self, v5);
  if (Token)
  {
    CFIndex v7 = Token;
    if ([(__CFString *)Token isEqualToString:@"\n"])
    {
      int64_t currentIndex = self->_currentIndex;

      if ((*((_DWORD *)self + 52) & 0x3FFFFFFF) != 0)
      {
        v43.location = self->_currentIndex;
        v43.int64_t length = currentIndex - v43.location;
        CFIndex v7 = (__CFString *)CFStringCreateWithSubstring(0, self->_inputBuffer.theString, v43);
      }
      else
      {
        CFIndex v7 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
        if (currentIndex >= self->_inputLength || currentIndex < 0)
        {
LABEL_34:
          v21 = @" ";

          int v9 = 2;
          CFIndex v7 = v21;
          goto LABEL_78;
        }
        uint64_t v14 = 1;
        while (1)
        {
          int64_t length = self->_inputBuffer.rangeToBuffer.length;
          if (length <= currentIndex) {
            break;
          }
          directUniCharBuffer = self->_inputBuffer.directUniCharBuffer;
          if (directUniCharBuffer)
          {
            unsigned __int16 v17 = directUniCharBuffer[self->_inputBuffer.rangeToBuffer.location + currentIndex];
          }
          else
          {
            directCStringBuffer = self->_inputBuffer.directCStringBuffer;
            if (directCStringBuffer)
            {
              unsigned __int16 v17 = directCStringBuffer[self->_inputBuffer.rangeToBuffer.location + currentIndex];
            }
            else
            {
              if (self->_inputBuffer.bufferedRangeEnd <= currentIndex
                || (int64_t bufferedRangeStart = self->_inputBuffer.bufferedRangeStart, bufferedRangeStart > currentIndex))
              {
                int64_t v20 = currentIndex - 4;
                if ((unint64_t)currentIndex < 4) {
                  int64_t v20 = 0;
                }
                if (v20 + 64 < length) {
                  int64_t length = v20 + 64;
                }
                self->_inputBuffer.int64_t bufferedRangeStart = v20;
                self->_inputBuffer.bufferedRangeEnd = length;
                v40.location = self->_inputBuffer.rangeToBuffer.location + v20;
                v40.int64_t length = length - v20;
                CFStringGetCharacters(self->_inputBuffer.theString, v40, self->_inputBuffer.buffer);
                int64_t bufferedRangeStart = self->_inputBuffer.bufferedRangeStart;
              }
              unsigned __int16 v17 = self->_inputBuffer.buffer[currentIndex - bufferedRangeStart];
            }
          }
          if (v17 != 10) {
            break;
          }
          [(MFMimeEnrichedReader *)self appendNewLine:v7];
          ++v14;
          if (++currentIndex >= self->_inputLength) {
            goto LABEL_35;
          }
        }
        if (v14 == 1) {
          goto LABEL_34;
        }
LABEL_35:
        self->_int64_t currentIndex = currentIndex;
      }
      int v9 = 2;
LABEL_78:
      *a3 = v7;
      return v9;
    }
    if (![(__CFString *)v7 isEqualToString:@"<"])
    {
      int v9 = 1;
      goto LABEL_78;
    }

    CFIndex v10 = self->_currentIndex;
    if (v10 < self->_inputLength && (v10 & 0x8000000000000000) == 0)
    {
      int64_t v11 = self->_inputBuffer.rangeToBuffer.length;
      if (v11 > v10)
      {
        uint64_t v12 = self->_inputBuffer.directUniCharBuffer;
        if (v12)
        {
          unsigned __int16 v13 = v12[self->_inputBuffer.rangeToBuffer.location + v10];
        }
        else
        {
          v22 = self->_inputBuffer.directCStringBuffer;
          if (v22)
          {
            unsigned __int16 v13 = v22[self->_inputBuffer.rangeToBuffer.location + v10];
          }
          else
          {
            if (self->_inputBuffer.bufferedRangeEnd <= v10 || (int64_t v23 = self->_inputBuffer.bufferedRangeStart, v23 > v10))
            {
              int64_t v24 = v10 - 4;
              if ((unint64_t)v10 < 4) {
                int64_t v24 = 0;
              }
              if (v24 + 64 < v11) {
                int64_t v11 = v24 + 64;
              }
              self->_inputBuffer.int64_t bufferedRangeStart = v24;
              self->_inputBuffer.bufferedRangeEnd = v11;
              v41.location = self->_inputBuffer.rangeToBuffer.location + v24;
              v41.int64_t length = v11 - v24;
              CFStringGetCharacters(self->_inputBuffer.theString, v41, self->_inputBuffer.buffer);
              int64_t v23 = self->_inputBuffer.bufferedRangeStart;
            }
            unsigned __int16 v13 = self->_inputBuffer.buffer[v10 - v23];
          }
        }
        if (v13 == 47)
        {
          CFIndex v10 = self->_currentIndex + 1;
          self->_int64_t currentIndex = v10;
          int v9 = 4;
LABEL_52:
          inputCFIndex Length = self->_inputLength;
          if (v10 < inputLength)
          {
            CFIndex v27 = -v10;
            CFIndex v28 = v10 + 64;
            while (1)
            {
              if ((unint64_t)v10 >= 4) {
                uint64_t v29 = 4;
              }
              else {
                uint64_t v29 = v10;
              }
              if ((v10 & 0x8000000000000000) == 0)
              {
                int64_t v30 = self->_inputBuffer.rangeToBuffer.length;
                if (v30 > v10)
                {
                  int64_t v31 = self->_inputBuffer.directUniCharBuffer;
                  if (v31)
                  {
                    unsigned __int16 v32 = v31[v10 + self->_inputBuffer.rangeToBuffer.location];
                  }
                  else
                  {
                    uint64_t v33 = self->_inputBuffer.directCStringBuffer;
                    if (v33)
                    {
                      unsigned __int16 v32 = v33[self->_inputBuffer.rangeToBuffer.location + v10];
                    }
                    else
                    {
                      if (self->_inputBuffer.bufferedRangeEnd <= v10
                        || (int64_t v34 = self->_inputBuffer.bufferedRangeStart, v34 > v10))
                      {
                        uint64_t v35 = v29 + v27;
                        int64_t v36 = v28 - v29;
                        int64_t v37 = v10 - v29;
                        int64_t v38 = v37 + 64;
                        if (v37 + 64 >= v30) {
                          int64_t v38 = self->_inputBuffer.rangeToBuffer.length;
                        }
                        self->_inputBuffer.int64_t bufferedRangeStart = v37;
                        self->_inputBuffer.bufferedRangeEnd = v38;
                        if (v30 >= v36) {
                          int64_t v30 = v36;
                        }
                        v42.int64_t length = v30 + v35;
                        v42.location = v37 + self->_inputBuffer.rangeToBuffer.location;
                        CFStringGetCharacters(self->_inputBuffer.theString, v42, self->_inputBuffer.buffer);
                        int64_t v34 = self->_inputBuffer.bufferedRangeStart;
                      }
                      unsigned __int16 v32 = self->_inputBuffer.buffer[v10 - v34];
                    }
                  }
                  if (v32 == 62)
                  {
LABEL_74:
                    int64_t v25 = v10;
                    CFIndex v10 = self->_currentIndex;
                    goto LABEL_76;
                  }
                  inputCFIndex Length = self->_inputLength;
                }
              }
              ++v10;
              --v27;
              ++v28;
              if (v10 >= inputLength) {
                goto LABEL_74;
              }
            }
          }
          int64_t v25 = v10;
LABEL_76:
          v44.int64_t length = v25 - v10;
          v44.location = v10;
          CFIndex v7 = (__CFString *)CFStringCreateWithSubstring(0, self->_inputBuffer.theString, v44);
          goto LABEL_77;
        }
        if (v13 == 60)
        {
          int64_t v25 = self->_currentIndex;
          int v9 = 1;
          CFIndex v7 = @"<";
LABEL_77:
          self->_int64_t currentIndex = v25 + 1;
          goto LABEL_78;
        }
        CFIndex v10 = self->_currentIndex;
      }
    }
    int v9 = 3;
    goto LABEL_52;
  }
  return 0;
}

- (void)convertRichTextString:(id)a3 intoOutputString:(id)a4
{
  id v8 = 0;
  [(MFMimeEnrichedReader *)self resetStateWithString:a3 outputString:a4];
  id v5 = 0;
  int v6 = 0;
  while (1)
  {
    int v7 = [(MFMimeEnrichedReader *)self readTokenInto:&v8];
    if (v7 == 3)
    {
      [(MFMimeEnrichedReader *)self beginCommand:v8];
      goto LABEL_15;
    }
    if (v7 == 4)
    {
      [(MFMimeEnrichedReader *)self endCommand:v8];
      goto LABEL_15;
    }
    if (!v7) {
      break;
    }
    if ((*((char *)self + 211) & 0x80000000) == 0)
    {
      if ([v8 isEqual:@"\n"])
      {
        v6 |= [v5 isEqual:@" "] ^ 1;
      }
      else
      {
        if ((v6 & 1) != 0
          && ([v8 isEqual:@" "] & 1) == 0
          && ([v5 isEqual:@" "] & 1) == 0)
        {
          [(MFMimeEnrichedReader *)self appendStringToBuffer:@" "];
        }
        [(MFMimeEnrichedReader *)self appendStringToBuffer:v8];
        int v6 = 0;
      }
    }
LABEL_15:

    id v5 = v8;
  }

  [(MFMimeEnrichedReader *)self nowWouldBeAGoodTimeToAppendToTheAttributedString];
  [(MFMimeEnrichedReader *)self closeUpQuoting];
}

- (void)convertEnrichedString:(id)a3 intoOutputString:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  id v14 = 0;
  [(MFMimeEnrichedReader *)self resetStateWithString:a3 outputString:a4];
  char v8 = 1;
  while (1)
  {
    int v9 = [(MFMimeEnrichedReader *)self readTokenInto:&v14];
    if (v9 == 3)
    {
      [(MFMimeEnrichedReader *)self beginCommand:v14];
      goto LABEL_12;
    }
    if (v9 == 4)
    {
      [(MFMimeEnrichedReader *)self endCommand:v14];
      goto LABEL_12;
    }
    if (!v9) {
      break;
    }
    if ((*((char *)self + 211) & 0x80000000) == 0)
    {
      if (v9 != 2 || (v8 & 1) == 0 || ([v14 isEqual:@" "] & 1) == 0) {
        [(MFMimeEnrichedReader *)self appendStringToBuffer:v14];
      }
      char v8 = 0;
    }
LABEL_12:
  }
  [(MFMimeEnrichedReader *)self nowWouldBeAGoodTimeToAppendToTheAttributedString];
  [(MFMimeEnrichedReader *)self closeUpQuoting];
  CFIndex v10 = MFLogGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v11 = CFAbsoluteTimeGetCurrent() - Current;
    inputCFIndex Length = self->_inputLength;
    uint64_t v13 = [self->_outputString length];
    *(_DWORD *)buf = 134218496;
    CFAbsoluteTime v16 = v11;
    __int16 v17 = 2048;
    int64_t v18 = inputLength;
    __int16 v19 = 2048;
    uint64_t v20 = v13;
    _os_log_impl(&dword_1CFCFE000, v10, OS_LOG_TYPE_INFO, "elapsed time %gs (input length=%ld, output length=%lu)", buf, 0x20u);
  }
}

- (id)description
{
  int v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p", objc_opt_class(), self];
  commandStack = self->_commandStack;
  if (commandStack)
  {
    CFIndex Count = CFArrayGetCount(commandStack);
    objc_msgSend(v3, "appendFormat:", @"\n\t_commandStack = %p (%ld entries):", self->_commandStack, Count);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->_commandStack, i);
        [v3 appendFormat:@"\n\t\t[%@ parameter=%@]", *(void *)*ValueAtIndex, ValueAtIndex[1]];
      }
    }
  }
  if (self->_outputBuffer) {
    [v3 appendFormat:@"\n\t_outputBuffer=%@", self->_outputBuffer];
  }
  if (self->_outputString) {
    [v3 appendFormat:@"\n\t_outputString=%@", self->_outputString];
  }
  [v3 appendString:@">\n-------------------------------------------------------------------\n"];
  return v3;
}

- (void)setupFontStackEntry:.cold.1()
{
  __assert_rtn("-[MFMimeEnrichedReader setupFontStackEntry:]", "MimeEnrichedReader.m", 505, "NULL != stackEntry");
}

@end
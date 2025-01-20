@interface _MFFormatFlowedWriter
+ (id)newWithPlainTextDocument:(id)a3 encoding:(unsigned int)a4;
- (BOOL)addedTrailingSpaces;
- (id)outputString;
- (id)quotedString;
- (unint64_t)_findLineBreakInRange:(_NSRange)a3 maxCharWidthCount:(unint64_t)a4 endIsURL:(BOOL)a5;
- (void)_outputQuotedParagraph:(id)a3 range:(_NSRange)a4 withQuoteLevel:(unsigned int)a5;
- (void)dealloc;
@end

@implementation _MFFormatFlowedWriter

+ (id)newWithPlainTextDocument:(id)a3 encoding:(unsigned int)a4
{
  uint64_t v6 = [objc_allocWithZone((Class)a1) init];
  *(void *)(v6 + 8) = a3;
  *(_DWORD *)(v6 + 16) = a4;
  return (id)v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MFFormatFlowedWriter;
  [(_MFFormatFlowedWriter *)&v3 dealloc];
}

- (unint64_t)_findLineBreakInRange:(_NSRange)a3 maxCharWidthCount:(unint64_t)a4 endIsURL:(BOOL)a5
{
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL && a3.length != 0)
  {
    BOOL v8 = a5;
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v40 = 0u;
    lineString = self->_lineString;
    CFStringRef theString = (CFStringRef)lineString;
    _NSRange v50 = a3;
    CharactersPtr = CFStringGetCharactersPtr((CFStringRef)lineString);
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr((CFStringRef)lineString, 0x600u);
    }
    v38 = self;
    uint64_t v51 = 0;
    int64_t v52 = 0;
    v49 = CStringPtr;
    if (a4)
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        if (v14 < 0 || (NSUInteger v16 = v50.length, (uint64_t)v50.length <= v14))
        {
          UChar32 v20 = 0;
          goto LABEL_16;
        }
        v17 = (UniChar *)CharactersPtr;
        if (CharactersPtr) {
          break;
        }
        if (!v49)
        {
          if (v52 <= v14 || (uint64_t v30 = v51, v51 > v14))
          {
            uint64_t v31 = v14 - 4;
            if ((unint64_t)v14 < 4) {
              uint64_t v31 = 0;
            }
            if (v31 + 64 < (uint64_t)v50.length) {
              NSUInteger v16 = v31 + 64;
            }
            uint64_t v51 = v31;
            int64_t v52 = v16;
            v53.NSUInteger location = v50.location + v31;
            v53.NSUInteger length = v16 - v31;
            CFStringGetCharacters(theString, v53, buffer);
            uint64_t v30 = v51;
          }
          NSUInteger v18 = v14 - v30;
          v17 = buffer;
          goto LABEL_14;
        }
        UniChar v19 = v49[v50.location + v14];
LABEL_24:
        UChar32 v20 = v19;
        if ((v19 & 0xFC00) == 0xD800 && v14 < length - 1)
        {
          uint64_t v23 = v14 + 1;
          NSUInteger v24 = v50.length;
          if ((uint64_t)v50.length <= v14 + 1)
          {
            UniChar v27 = 0;
          }
          else
          {
            v25 = (UniChar *)CharactersPtr;
            if (CharactersPtr)
            {
              NSUInteger v26 = v50.location + v23;
              goto LABEL_31;
            }
            if (v49)
            {
              UniChar v27 = v49[v50.location + v23];
            }
            else
            {
              if (v52 <= v23 || (uint64_t v32 = v51, v51 > v23))
              {
                uint64_t v33 = v14 - 3;
                if ((unint64_t)v14 < 3) {
                  uint64_t v33 = 0;
                }
                if (v33 + 64 < (uint64_t)v50.length) {
                  NSUInteger v24 = v33 + 64;
                }
                uint64_t v51 = v33;
                int64_t v52 = v24;
                v54.NSUInteger location = v50.location + v33;
                v54.NSUInteger length = v24 - v33;
                CFStringGetCharacters(theString, v54, buffer);
                uint64_t v32 = v51;
              }
              NSUInteger v26 = v23 - v32;
              v25 = buffer;
LABEL_31:
              UniChar v27 = v25[v26];
            }
          }
          int v28 = v27 & 0xFC00;
          int v29 = (v20 << 10) + v27 - 56613888;
          if (v28 == 56320)
          {
            UChar32 v20 = v29;
            ++v14;
          }
        }
LABEL_16:
        if (((u_getIntPropertyValue(v20, UCHAR_EAST_ASIAN_WIDTH) - 3) & 0xFFFFFFFD) != 0) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = 2;
        }
        v15 += v21;
        if (++v14 >= length || v15 >= a4) {
          goto LABEL_55;
        }
      }
      NSUInteger v18 = v50.location + v14;
LABEL_14:
      UniChar v19 = v17[v18];
      goto LABEL_24;
    }
    unint64_t v15 = 0;
    uint64_t v14 = 0;
LABEL_55:
    if (v8 && v15 <= a4)
    {
      return location + length;
    }
    else
    {
      v34 = v38;
      NSUInteger v35 = [(NSMutableString *)v38->_lineString length] - location;
      unint64_t v36 = [(NSMutableString *)v34->_lineString length];
      if (location + v14 + 1 < v36) {
        uint64_t v37 = location + v14 + 1;
      }
      else {
        uint64_t v37 = v36;
      }
      return -[NSMutableString mf_lineBreakBeforeIndex:withinRange:](v34->_lineString, "mf_lineBreakBeforeIndex:withinRange:", v37, location, v35);
    }
  }
  return result;
}

- (void)_outputQuotedParagraph:(id)a3 range:(_NSRange)a4 withQuoteLevel:(unsigned int)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (a4.length) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = a5 == 0;
  }
  char v9 = v8;
  v10 = @" \n";
  if ((*((unsigned char *)self + 40) & 1) == 0) {
    v10 = @"\n";
  }
  CFRange v53 = v10;
  lineString = self->_lineString;
  if (lineString) {
    [(NSMutableString *)lineString setString:&stru_1F265CF90];
  }
  else {
    self->_lineString = (NSMutableString *)[objc_allocWithZone(MEMORY[0x1E4F28E78]) initWithCapacity:72];
  }
  if (a5)
  {
    uint64_t v12 = a5;
    do
    {
      [(NSMutableString *)self->_lineString appendString:@">"];
      --v12;
    }
    while (v12);
    unint64_t v13 = 72 - a5;
  }
  else
  {
    unint64_t v13 = 72;
  }
  char v50 = v9;
  if (length > v13 && (uint64_t v14 = objc_msgSend(a3, "substringWithRange:", location, length)) != 0)
  {
    uint64_t v15 = v14;
    if (_weakDDURLifierClass_onceToken != -1) {
      dispatch_once(&_weakDDURLifierClass_onceToken, &__block_literal_global_2);
    }
    NSUInteger v16 = (void *)[(id)_weakDDURLifierClass_sDDURLifierClass urlMatchesForString:v15];
  }
  else
  {
    NSUInteger v16 = 0;
  }
  outputString = self->_outputString;
  if (outputString)
  {
    NSUInteger v59 = length + location;
    if (location < length + location)
    {
      NSUInteger v51 = ~location;
      CFIndex v18 = location;
      NSUInteger v49 = location;
      while (1)
      {
        if (a5
          || objc_msgSend(a3, "rangeOfString:options:range:", @" ", 8, v18, length) != 0x7FFFFFFFFFFFFFFFLL
          || objc_msgSend(a3, "rangeOfString:options:range:", @"From ", 8, v18, length) != 0x7FFFFFFFFFFFFFFFLL
          || objc_msgSend(a3, "rangeOfString:options:range:", @">", 8, v18, length) != 0x7FFFFFFFFFFFFFFFLL)
        {
          [(NSMutableString *)self->_lineString appendString:@" "];
        }
        NSUInteger v52 = length;
        unint64_t v19 = [(NSMutableString *)self->_lineString length];
        NSUInteger v58 = location;
        NSUInteger v55 = location - v19;
        unint64_t v20 = location - v19 + 72;
        *(_OWORD *)buf = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        uint64_t v21 = [v16 countByEnumeratingWithState:buf objects:v64 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          unint64_t v23 = v20 + v51;
          uint64_t v24 = *(void *)v61;
LABEL_33:
          uint64_t v25 = 0;
          while (1)
          {
            if (*(void *)v61 != v24) {
              objc_enumerationMutation(v16);
            }
            NSUInteger v26 = *(void **)(*(void *)&buf[8] + 8 * v25);
            unint64_t v27 = [v26 range];
            if (v27 <= v23 && v27 + v28 > v23) {
              break;
            }
            if (v22 == ++v25)
            {
              uint64_t v22 = [v16 countByEnumeratingWithState:buf objects:v64 count:16];
              if (v22) {
                goto LABEL_33;
              }
              goto LABEL_49;
            }
          }
          if (!v26) {
            goto LABEL_49;
          }
          uint64_t v30 = [v26 range];
          unint64_t v32 = v31 + v49 + v30;
          if (v32 <= v20) {
            goto LABEL_49;
          }
          NSUInteger v33 = v58;
          if (v19 - v58 + v32 <= 0x3E6) {
            unint64_t v20 = v31 + v49 + v30;
          }
          else {
            unint64_t v20 = v55 + 998;
          }
          unsigned int v54 = 1;
        }
        else
        {
LABEL_49:
          unsigned int v54 = 0;
          NSUInteger v33 = v58;
        }
        if (v20 >= v59) {
          unint64_t v34 = v59;
        }
        else {
          unint64_t v34 = v20;
        }
        v66.NSUInteger length = v34 - v33;
        v66.NSUInteger location = v18;
        CFStringRef v35 = CFStringCreateWithSubstring(0, (CFStringRef)a3, v66);
        [(NSMutableString *)self->_lineString appendString:v35];
        CFRelease(v35);
        if ((unint64_t)[(NSMutableString *)self->_lineString length] >= 0x49)
        {
          unint64_t v36 = NSZoneMalloc(0, [(NSMutableString *)self->_lineString length]);
          [(NSMutableString *)self->_lineString length];
          uint64_t v37 = 998;
        }
        else
        {
          unint64_t v36 = v64;
          uint64_t v37 = 72;
        }
        [(NSMutableString *)self->_lineString length];
        unint64_t Bytes = MFStringGetBytes();
        if (Bytes < [(NSMutableString *)self->_lineString length]) {
          unint64_t Bytes = [(NSMutableString *)self->_lineString rangeOfComposedCharacterSequenceAtIndex:Bytes];
        }
        if (v36 != v64) {
          NSZoneFree(0, v36);
        }
        if (Bytes <= v19)
        {

          self->_outputString = 0;
          return;
        }
        if (Bytes == [(NSMutableString *)self->_lineString length] && v59 <= v20)
        {
          NSUInteger v39 = v58;
          goto LABEL_80;
        }
        unint64_t v40 = -[_MFFormatFlowedWriter _findLineBreakInRange:maxCharWidthCount:endIsURL:](self, "_findLineBreakInRange:maxCharWidthCount:endIsURL:", v19, Bytes - v19, v37 - v19, v54);
        if (v40 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_76;
        }
        if (v40 != v19) {
          break;
        }
        if (v54) {
          goto LABEL_76;
        }
        unint64_t v41 = objc_msgSend((id)objc_msgSend(a3, "substringWithRange:", v18, v52), "mf_nextWordFromIndex:forward:", 0, 1);
        if (v41 == 0x7FFFFFFFFFFFFFFFLL || v41 > 998 - v19) {
          goto LABEL_76;
        }
        uint64_t v42 = objc_msgSend(a3, "substringWithRange:", v18, v41);
        -[NSMutableString deleteCharactersInRange:](self->_lineString, "deleteCharactersInRange:", v19, [(NSMutableString *)self->_lineString length] - v19);
        [(NSMutableString *)self->_lineString appendString:v42];
        long long v43 = NSZoneMalloc(0, 0x3E6uLL);
        [(NSMutableString *)self->_lineString length];
        uint64_t v44 = MFStringGetBytes();
        uint64_t v45 = [(NSMutableString *)self->_lineString length];
        if (v44 == v45) {
          unint64_t Bytes = v44;
        }
        NSZoneFree(0, v43);
        unint64_t v46 = Bytes - v19;
        NSUInteger v39 = v58;
        unint64_t v34 = v46 + v58;
        if (v44 != v45) {
          goto LABEL_78;
        }
LABEL_80:
        if (!self->_outputString) {
          return;
        }
        unint64_t v48 = v34 - v39 + v19;
        if (v48 < [(NSMutableString *)self->_lineString length]) {
          -[NSMutableString deleteCharactersInRange:](self->_lineString, "deleteCharactersInRange:", v34 - v39 + v19, [(NSMutableString *)self->_lineString length] - v48);
        }
        [(NSMutableString *)self->_outputString appendString:self->_lineString];
        NSUInteger length = v59 - v34;
        if (v59 != v34) {
          [(NSMutableString *)self->_outputString appendString:v53];
        }
        if ([(NSMutableString *)self->_lineString length] > (unint64_t)a5) {
          -[NSMutableString deleteCharactersInRange:](self->_lineString, "deleteCharactersInRange:", a5, [(NSMutableString *)self->_lineString length] - a5);
        }
        outputString = self->_outputString;
        if (!outputString) {
          return;
        }
        CFIndex v18 = v34;
        NSUInteger location = v34;
        if (v59 <= v34) {
          goto LABEL_89;
        }
      }
      if (v40 < v19)
      {
        v47 = MFLogGeneral();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CFCFE000, v47, OS_LOG_TYPE_INFO, "Bad line break index", buf, 2u);
        }
LABEL_76:
        unint64_t v40 = Bytes;
      }
      unint64_t v34 = v55 + v40;
      NSUInteger v39 = v58;
LABEL_78:
      if ((*((unsigned char *)self + 40) & 1) == 0)
      {
        [(NSMutableString *)self->_outputString replaceOccurrencesOfString:@" \n", @"  \n", 0, 0, [(NSMutableString *)self->_outputString length] withString options range];
        *((unsigned char *)self + 40) |= 1u;
        CFRange v53 = @" \n";
      }
      goto LABEL_80;
    }
LABEL_89:
    if ((v50 & 1) == 0) {
      [(NSMutableString *)outputString appendString:self->_lineString];
    }
  }
}

- (id)outputString
{
  outputString = self->_outputString;
  if (!outputString)
  {
    unint64_t v5 = [(MFPlainTextDocument *)self->_inputDocument fragmentCount];
    id v17 = 0;
    unsigned int v16 = 0;
    outputString = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    self->_outputString = outputString;
    if (v5)
    {
      uint64_t v6 = 0;
      while (1)
      {
        if (!outputString) {
          return (id)[(NSMutableString *)outputString copyWithZone:0];
        }
        [(MFPlainTextDocument *)self->_inputDocument getString:&v17 quoteLevel:&v16 ofFragmentAtIndex:v6];
        uint64_t v7 = [v17 length];
        if (v7) {
          break;
        }
LABEL_21:
        ++v6;
        outputString = self->_outputString;
        if (v6 == v5) {
          return (id)[(NSMutableString *)outputString copyWithZone:0];
        }
      }
      unint64_t v8 = v7;
      unint64_t v9 = 0;
      while (1)
      {
        if (!self->_outputString) {
          goto LABEL_21;
        }
        unint64_t v14 = 0;
        unint64_t v15 = 0;
        unint64_t v13 = 0;
        objc_msgSend(v17, "getLineStart:end:contentsEnd:forRange:", &v15, &v14, &v13, v9, 0);
        uint64_t v10 = objc_msgSend(v17, "rangeOfString:options:range:", @"-- ", 8, v15, v13 - v15);
        unint64_t v11 = v13;
        if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        do
        {
          unint64_t v12 = v11;
          if (v11 <= v15) {
            break;
          }
          --v11;
        }
        while ([v17 characterAtIndex:v12 - 1] == 32);
        if (v13 == v12) {
          goto LABEL_18;
        }
        if (v13 != v14)
        {
          unint64_t v13 = v12;
LABEL_18:
          -[_MFFormatFlowedWriter _outputQuotedParagraph:range:withQuoteLevel:](self, "_outputQuotedParagraph:range:withQuoteLevel:", v17, v15, v12 - v15, v16);
          if (v13 != v14) {
            [(NSMutableString *)self->_outputString appendString:@"\n"];
          }
          goto LABEL_20;
        }
        -[_MFFormatFlowedWriter _outputQuotedParagraph:range:withQuoteLevel:](self, "_outputQuotedParagraph:range:withQuoteLevel:", v17, v15, v12 + 1 - v15, v16);
        if (v13 - v12 >= 2)
        {
          [(NSMutableString *)self->_outputString appendString:@"\n"];
          -[_MFFormatFlowedWriter _outputQuotedParagraph:range:withQuoteLevel:](self, "_outputQuotedParagraph:range:withQuoteLevel:", v17, v12 + 1, ~v12 + v13, v16);
        }
LABEL_20:
        unint64_t v9 = v14;
        if (v14 >= v8) {
          goto LABEL_21;
        }
      }
      unint64_t v12 = v13;
      goto LABEL_18;
    }
  }
  return (id)[(NSMutableString *)outputString copyWithZone:0];
}

- (id)quotedString
{
  quotedString = self->_quotedString;
  if (!quotedString)
  {
    unint64_t v5 = [(MFPlainTextDocument *)self->_inputDocument fragmentCount];
    id v15 = 0;
    unsigned int v14 = 0;
    quotedString = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    self->_quotedString = quotedString;
    if (v5)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (!quotedString) {
          break;
        }
        [(MFPlainTextDocument *)self->_inputDocument getString:&v15 quoteLevel:&v14 ofFragmentAtIndex:i];
        uint64_t v7 = [v15 length];
        if (v7)
        {
          unint64_t v8 = v7;
          unint64_t v9 = 0;
          do
          {
            if (!self->_quotedString) {
              break;
            }
            unint64_t v12 = 0;
            uint64_t v13 = 0;
            uint64_t v11 = 0;
            objc_msgSend(v15, "getLineStart:end:contentsEnd:forRange:", &v13, &v12, &v11, v9, 0);
            if (v14)
            {
              unint64_t v10 = v14 + 1;
              do
              {
                [(NSMutableString *)self->_quotedString appendString:@">"];
                --v10;
              }
              while (v10 > 1);
              [(NSMutableString *)self->_quotedString appendString:@" "];
            }
            -[NSMutableString appendString:](self->_quotedString, "appendString:", objc_msgSend(v15, "substringWithRange:", v13, v12 - v13));
            unint64_t v9 = v12;
          }
          while (v12 < v8);
        }
        quotedString = self->_quotedString;
      }
    }
  }
  return (id)[(NSMutableString *)quotedString copyWithZone:0];
}

- (BOOL)addedTrailingSpaces
{
  return *((unsigned char *)self + 40) & 1;
}

@end
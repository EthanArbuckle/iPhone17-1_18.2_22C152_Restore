@interface _MFFormatFlowedWriter
+ (id)newWithPlainTextDocument:(id)a3 encoding:(unsigned int)a4;
- (BOOL)addedTrailingSpaces;
- (id)outputString;
- (id)quotedString;
- (unint64_t)_findLineBreakInRange:(_NSRange)a3 maxCharWidthCount:(unint64_t)a4 endIsURL:(BOOL)a5;
- (void)_outputQuotedParagraph:(id)a3 range:(_NSRange)a4 withQuoteLevel:(unsigned int)a5;
@end

@implementation _MFFormatFlowedWriter

+ (id)newWithPlainTextDocument:(id)a3 encoding:(unsigned int)a4
{
  id v6 = a3;
  uint64_t v7 = [objc_allocWithZone((Class)a1) init];
  v8 = *(void **)(v7 + 8);
  *(void *)(v7 + 8) = v6;

  *(_DWORD *)(v7 + 16) = a4;
  return (id)v7;
}

- (unint64_t)_findLineBreakInRange:(_NSRange)a3 maxCharWidthCount:(unint64_t)a4 endIsURL:(BOOL)a5
{
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL && a3.length != 0)
  {
    BOOL v8 = a5;
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v46 = v12;
    long long v47 = v12;
    long long v44 = v12;
    long long v45 = v12;
    long long v42 = v12;
    long long v43 = v12;
    *(_OWORD *)buffer = v12;
    long long v41 = v12;
    lineString = self->_lineString;
    CFStringRef theString = (CFStringRef)lineString;
    _NSRange v51 = a3;
    CharactersPtr = CFStringGetCharactersPtr((CFStringRef)lineString);
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr((CFStringRef)lineString, 0x600u);
    }
    v39 = self;
    uint64_t v52 = 0;
    int64_t v53 = 0;
    v50 = CStringPtr;
    if (a4)
    {
      uint64_t v15 = 0;
      unint64_t v16 = 0;
      while (1)
      {
        if (v15 < 0 || (NSUInteger v17 = v51.length, (uint64_t)v51.length <= v15))
        {
          UChar32 v21 = 0;
          goto LABEL_16;
        }
        v18 = (UniChar *)CharactersPtr;
        if (CharactersPtr) {
          break;
        }
        if (!v50)
        {
          if (v53 <= v15 || (uint64_t v31 = v52, v52 > v15))
          {
            uint64_t v32 = v15 - 4;
            if ((unint64_t)v15 < 4) {
              uint64_t v32 = 0;
            }
            if (v32 + 64 < (uint64_t)v51.length) {
              NSUInteger v17 = v32 + 64;
            }
            uint64_t v52 = v32;
            int64_t v53 = v17;
            v54.NSUInteger location = v51.location + v32;
            v54.NSUInteger length = v17 - v32;
            CFStringGetCharacters(theString, v54, buffer);
            uint64_t v31 = v52;
          }
          NSUInteger v19 = v15 - v31;
          v18 = buffer;
          goto LABEL_14;
        }
        UniChar v20 = v50[v51.location + v15];
LABEL_24:
        UChar32 v21 = v20;
        if ((v20 & 0xFC00) == 0xD800 && v15 < length - 1)
        {
          uint64_t v24 = v15 + 1;
          NSUInteger v25 = v51.length;
          if ((uint64_t)v51.length <= v15 + 1)
          {
            UniChar v28 = 0;
          }
          else
          {
            v26 = (UniChar *)CharactersPtr;
            if (CharactersPtr)
            {
              NSUInteger v27 = v51.location + v24;
              goto LABEL_31;
            }
            if (v50)
            {
              UniChar v28 = v50[v51.location + v24];
            }
            else
            {
              if (v53 <= v24 || (uint64_t v33 = v52, v52 > v24))
              {
                uint64_t v34 = v15 - 3;
                if ((unint64_t)v15 < 3) {
                  uint64_t v34 = 0;
                }
                if (v34 + 64 < (uint64_t)v51.length) {
                  NSUInteger v25 = v34 + 64;
                }
                uint64_t v52 = v34;
                int64_t v53 = v25;
                v55.NSUInteger location = v51.location + v34;
                v55.NSUInteger length = v25 - v34;
                CFStringGetCharacters(theString, v55, buffer);
                uint64_t v33 = v52;
              }
              NSUInteger v27 = v24 - v33;
              v26 = buffer;
LABEL_31:
              UniChar v28 = v26[v27];
            }
          }
          int v29 = v28 & 0xFC00;
          int v30 = (v21 << 10) + v28 - 56613888;
          if (v29 == 56320)
          {
            UChar32 v21 = v30;
            ++v15;
          }
        }
LABEL_16:
        if (((u_getIntPropertyValue(v21, UCHAR_EAST_ASIAN_WIDTH) - 3) & 0xFFFFFFFD) != 0) {
          uint64_t v22 = 1;
        }
        else {
          uint64_t v22 = 2;
        }
        v16 += v22;
        if (++v15 >= length || v16 >= a4) {
          goto LABEL_55;
        }
      }
      NSUInteger v19 = v51.location + v15;
LABEL_14:
      UniChar v20 = v18[v19];
      goto LABEL_24;
    }
    unint64_t v16 = 0;
    uint64_t v15 = 0;
LABEL_55:
    if (v8 && v16 <= a4)
    {
      return location + length;
    }
    else
    {
      v35 = v39;
      NSUInteger v36 = [(NSMutableString *)v39->_lineString length] - location;
      unint64_t v37 = [(NSMutableString *)v35->_lineString length];
      if (location + v15 + 1 < v37) {
        uint64_t v38 = location + v15 + 1;
      }
      else {
        uint64_t v38 = v37;
      }
      return -[NSMutableString mf_lineBreakBeforeIndex:withinRange:](v35->_lineString, "mf_lineBreakBeforeIndex:withinRange:", v38, location, v36);
    }
  }
  return result;
}

- (void)_outputQuotedParagraph:(id)a3 range:(_NSRange)a4 withQuoteLevel:(unsigned int)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  str = (__CFString *)a3;
  unsigned int v58 = a5;
  if (length) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = a5 == 0;
  }
  char v10 = v9;
  if (*((unsigned char *)self + 40)) {
    v11 = @" \n";
  }
  else {
    v11 = @"\n";
  }
  v56 = v11;
  lineString = self->_lineString;
  if (lineString)
  {
    [(NSMutableString *)lineString setString:&stru_1EFF11268];
  }
  else
  {
    v13 = (NSMutableString *)[objc_allocWithZone(MEMORY[0x1E4F28E78]) initWithCapacity:72];
    v14 = self->_lineString;
    self->_lineString = v13;
  }
  if (a5)
  {
    uint64_t v15 = a5;
    do
    {
      [(NSMutableString *)self->_lineString appendString:@">"];
      --v15;
    }
    while (v15);
  }
  if (length <= 72 - (unint64_t)a5)
  {
    v57 = 0;
  }
  else
  {
    unint64_t v16 = -[__CFString substringWithRange:](str, "substringWithRange:", location, length);
    if (v16)
    {
      if (_weakDDURLifierClass_onceToken != -1) {
        dispatch_once(&_weakDDURLifierClass_onceToken, &__block_literal_global_4);
      }
      v57 = [ (id) _weakDDURLifierClass_sDDURLifierClass urlMatchesForString:v16];
    }
    else
    {
      v57 = 0;
    }
  }
  outputString = self->_outputString;
  if (outputString)
  {
    char v53 = v10;
    unint64_t v64 = length + location;
    if (location < length + location)
    {
      NSUInteger v54 = location;
      NSUInteger v55 = ~location;
      NSUInteger v62 = location;
      unint64_t v65 = location;
      while (1)
      {
        if (v58
          || -[__CFString rangeOfString:options:range:](str, "rangeOfString:options:range:", @" ", 8, v62, length) != 0x7FFFFFFFFFFFFFFFLL|| -[__CFString rangeOfString:options:range:](str, "rangeOfString:options:range:", @"From ", 8, v62, length) != 0x7FFFFFFFFFFFFFFFLL|| -[__CFString rangeOfString:options:range:](str, "rangeOfString:options:range:", @">", 8, v62,
               length) != 0x7FFFFFFFFFFFFFFFLL)
        {
          [(NSMutableString *)self->_lineString appendString:@" "];
        }
        unint64_t v18 = [(NSMutableString *)self->_lineString length];
        id v19 = v57;
        *(_OWORD *)buf = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:buf objects:v70 count:16];
        unint64_t v59 = v65 - v18;
        NSUInteger v60 = length;
        unint64_t v22 = v65 - v18 + 72;
        if (v21)
        {
          unint64_t v23 = v22 + v55;
          uint64_t v24 = *(void *)v67;
          while (2)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v67 != v24) {
                objc_enumerationMutation(v20);
              }
              v26 = *(void **)(*(void *)&buf[8] + 8 * i);
              unint64_t v27 = [v26 range];
              if (v27 <= v23 && v27 + v28 > v23)
              {
                id v63 = v26;
                goto LABEL_45;
              }
            }
            uint64_t v21 = [v20 countByEnumeratingWithState:buf objects:v70 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }
        id v63 = 0;
LABEL_45:

        if (v63 && (uint64_t v30 = [v63 range], v32 = v31 + v54 + v30, v32 > v22))
        {
          if (v18 - v65 + v32 <= 0x3E6) {
            unint64_t v22 = v31 + v54 + v30;
          }
          else {
            unint64_t v22 = v59 + 998;
          }
          uint64_t v33 = 1;
        }
        else
        {
          uint64_t v33 = 0;
        }
        v34.NSUInteger location = v65;
        if (v22 >= v64) {
          uint64_t v35 = v64;
        }
        else {
          uint64_t v35 = v22;
        }
        v34.NSUInteger length = v35 - v65;
        CFStringRef v36 = CFStringCreateWithSubstring(0, str, v34);
        [(NSMutableString *)self->_lineString appendString:v36];
        CFRelease(v36);
        unint64_t v71 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v37 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v70[2] = v37;
        v70[3] = v37;
        v70[0] = v37;
        v70[1] = v37;
        if ((unint64_t)[(NSMutableString *)self->_lineString length] >= 0x49)
        {
          uint64_t v38 = NSZoneMalloc(0, [(NSMutableString *)self->_lineString length]);
          [(NSMutableString *)self->_lineString length];
          uint64_t v39 = 998;
        }
        else
        {
          uint64_t v38 = v70;
          uint64_t v39 = 72;
        }
        [(NSMutableString *)self->_lineString length];
        unint64_t Bytes = MFStringGetBytes();
        if (Bytes < [(NSMutableString *)self->_lineString length]) {
          unint64_t Bytes = [(NSMutableString *)self->_lineString rangeOfComposedCharacterSequenceAtIndex:Bytes];
        }
        if (v38 != v70) {
          NSZoneFree(0, v38);
        }
        if (Bytes <= v18)
        {
          long long v41 = self->_outputString;
          self->_outputString = 0;

          NSUInteger length = v60;
          uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
          unint64_t v65 = v64;
          goto LABEL_67;
        }
        if (Bytes == [(NSMutableString *)self->_lineString length] && v64 <= v22)
        {
          NSUInteger length = v60;
          goto LABEL_67;
        }
        unint64_t v43 = -[_MFFormatFlowedWriter _findLineBreakInRange:maxCharWidthCount:endIsURL:](self, "_findLineBreakInRange:maxCharWidthCount:endIsURL:", v18, Bytes - v18, v39 - v18, v33);
        NSUInteger length = v60;
        if (v43 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_80;
        }
        if (v43 != v18) {
          break;
        }
        if (v33) {
          goto LABEL_80;
        }
        long long v45 = -[__CFString substringWithRange:](str, "substringWithRange:", v62, v60);
        unint64_t v46 = objc_msgSend(v45, "mf_nextWordFromIndex:forward:", 0, 1);
        if (v46 == 0x7FFFFFFFFFFFFFFFLL || v46 > 998 - v18)
        {

          uint64_t v35 = v59 + Bytes;
          goto LABEL_82;
        }
        long long v47 = -[__CFString substringWithRange:](str, "substringWithRange:", v62, v46);
        -[NSMutableString deleteCharactersInRange:](self->_lineString, "deleteCharactersInRange:", v18, [(NSMutableString *)self->_lineString length] - v18);
        [(NSMutableString *)self->_lineString appendString:v47];
        v48 = NSZoneMalloc(0, 0x3E6uLL);
        [(NSMutableString *)self->_lineString length];
        uint64_t v49 = MFStringGetBytes();
        uint64_t v50 = [(NSMutableString *)self->_lineString length];
        NSZoneFree(0, v48);
        BOOL v51 = v49 == v50;
        if (v49 == v50) {
          unint64_t Bytes = v49;
        }

        NSUInteger length = v60;
        uint64_t v35 = Bytes - v18 + v65;
        if (!v51) {
          goto LABEL_82;
        }
LABEL_67:
        if (self->_outputString)
        {
          unint64_t v42 = v35 - v65 + v18;
          if (v42 < [(NSMutableString *)self->_lineString length]) {
            -[NSMutableString deleteCharactersInRange:](self->_lineString, "deleteCharactersInRange:", v42, [(NSMutableString *)self->_lineString length] - v42);
          }
          [(NSMutableString *)self->_outputString appendString:self->_lineString];
          NSUInteger length = v64 - v35;
          if (v64 != v35) {
            [(NSMutableString *)self->_outputString appendString:v56];
          }
          if ([(NSMutableString *)self->_lineString length] > (unint64_t)v58) {
            -[NSMutableString deleteCharactersInRange:](self->_lineString, "deleteCharactersInRange:", v58, [(NSMutableString *)self->_lineString length] - v58);
          }
          unint64_t v65 = v35;
          NSUInteger v62 = v35;
        }

        outputString = self->_outputString;
        if (!outputString) {
          goto LABEL_99;
        }
        unint64_t v64 = length + v62;
        if (v65 >= length + v62) {
          goto LABEL_97;
        }
      }
      if (v43 < v18)
      {
        uint64_t v52 = MFLogGeneral();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7EFF000, v52, OS_LOG_TYPE_INFO, "Bad line break index", buf, 2u);
        }

LABEL_80:
        unint64_t v43 = Bytes;
      }
      uint64_t v35 = v59 + v43;
LABEL_82:
      if ((*((unsigned char *)self + 40) & 1) == 0)
      {

        long long v44 = self->_outputString;
        [(NSMutableString *)v44 length];
        -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v44, "replaceOccurrencesOfString:withString:options:range:");
        *((unsigned char *)self + 40) |= 1u;
        v56 = @" \n";
      }
      goto LABEL_67;
    }
LABEL_97:
    if ((v53 & 1) == 0) {
      [(NSMutableString *)outputString appendString:self->_lineString];
    }
  }
LABEL_99:
}

- (id)outputString
{
  outputString = self->_outputString;
  if (!outputString)
  {
    unint64_t v4 = [(MFPlainTextDocument *)self->_inputDocument fragmentCount];
    unsigned int v21 = -1431655766;
    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v6 = self->_outputString;
    self->_outputString = v5;

    unint64_t v18 = v4;
    if (v4)
    {
      uint64_t v7 = 0;
      id v8 = 0;
      do
      {
        BOOL v9 = v8;
        if (!self->_outputString) {
          break;
        }
        inputDocument = self->_inputDocument;
        id v20 = v8;
        [(MFPlainTextDocument *)inputDocument getString:&v20 quoteLevel:&v21 ofFragmentAtIndex:v7];
        id v8 = v20;

        unint64_t v11 = [v8 length];
        if (v11)
        {
          uint64_t v12 = 0;
          while (1)
          {
            if (!self->_outputString) {
              goto LABEL_21;
            }
            memset(v19, 170, sizeof(v19));
            objc_msgSend(v8, "getLineStart:end:contentsEnd:forRange:", &v19[2], &v19[1], v19, v12, 0);
            uint64_t v13 = objc_msgSend(v8, "rangeOfString:options:range:", @"-- ", 8, v19[2], v19[0] - v19[2]);
            unint64_t v14 = v19[0];
            if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            do
            {
              unint64_t v15 = v14;
              if (v14 <= v19[2]) {
                break;
              }
              --v14;
            }
            while ([v8 characterAtIndex:v15 - 1] == 32);
            if (v19[0] == v15) {
              goto LABEL_16;
            }
            if (v19[0] != v19[1])
            {
              v19[0] = v15;
LABEL_16:
              -[_MFFormatFlowedWriter _outputQuotedParagraph:range:withQuoteLevel:](self, "_outputQuotedParagraph:range:withQuoteLevel:", v8, v19[2], v15 - v19[2], v21, v18);
              if (v19[0] != v19[1]) {
                [(NSMutableString *)self->_outputString appendString:@"\n"];
              }
              goto LABEL_18;
            }
            -[_MFFormatFlowedWriter _outputQuotedParagraph:range:withQuoteLevel:](self, "_outputQuotedParagraph:range:withQuoteLevel:", v8, v19[2], v15 + 1 - v19[2], v21);
            if (v19[0] - v15 >= 2)
            {
              [(NSMutableString *)self->_outputString appendString:@"\n"];
              -[_MFFormatFlowedWriter _outputQuotedParagraph:range:withQuoteLevel:](self, "_outputQuotedParagraph:range:withQuoteLevel:", v8, v15 + 1, ~v15 + v19[0], v21);
            }
LABEL_18:
            uint64_t v12 = v19[1];
            if (v19[1] >= v11) {
              goto LABEL_21;
            }
          }
          unint64_t v15 = v19[0];
          goto LABEL_16;
        }
LABEL_21:
        ++v7;
      }
      while (v7 != v18);
    }
    outputString = self->_outputString;
  }
  unint64_t v16 = (void *)[(NSMutableString *)outputString copy];
  return v16;
}

- (id)quotedString
{
  quotedString = self->_quotedString;
  if (!quotedString)
  {
    unint64_t v4 = [(MFPlainTextDocument *)self->_inputDocument fragmentCount];
    unsigned int v20 = -1431655766;
    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v6 = self->_quotedString;
    self->_quotedString = v5;

    if (v4)
    {
      uint64_t v7 = 0;
      id v8 = 0;
      do
      {
        BOOL v9 = v8;
        if (!self->_quotedString) {
          break;
        }
        inputDocument = self->_inputDocument;
        id v19 = v8;
        [(MFPlainTextDocument *)inputDocument getString:&v19 quoteLevel:&v20 ofFragmentAtIndex:v7];
        id v8 = v19;

        unint64_t v11 = [v8 length];
        if (v11)
        {
          uint64_t v12 = 0;
          do
          {
            if (!self->_quotedString) {
              break;
            }
            memset(v18, 170, sizeof(v18));
            objc_msgSend(v8, "getLineStart:end:contentsEnd:forRange:", &v18[2], &v18[1], v18, v12, 0);
            if (v20)
            {
              uint64_t v13 = v20 + 1;
              do
              {
                [(NSMutableString *)self->_quotedString appendString:@">"];
                --v13;
              }
              while (v13 > 1);
              [(NSMutableString *)self->_quotedString appendString:@" "];
            }
            unint64_t v14 = self->_quotedString;
            unint64_t v15 = objc_msgSend(v8, "substringWithRange:", v18[2], v18[1] - v18[2]);
            [(NSMutableString *)v14 appendString:v15];

            uint64_t v12 = v18[1];
          }
          while (v18[1] < v11);
        }
        ++v7;
      }
      while (v7 != v4);
    }
    quotedString = self->_quotedString;
  }
  unint64_t v16 = (void *)[(NSMutableString *)quotedString copy];
  return v16;
}

- (BOOL)addedTrailingSpaces
{
  return *((unsigned char *)self + 40) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineString, 0);
  objc_storeStrong((id *)&self->_quotedString, 0);
  objc_storeStrong((id *)&self->_outputString, 0);
  objc_storeStrong((id *)&self->_inputDocument, 0);
}

@end
@interface MSVPropertyListEncoder
- (MSVPropertyListEncoder)init;
- (MSVPropertyListEncoder)initWithOutputFileHandle:(id)a3;
- (NSData)BOOLFalseTagData;
- (NSData)BOOLTrueTagData;
- (NSData)arrayClosingTagData;
- (NSData)arrayOpeningTagData;
- (NSData)dataClosingTagData;
- (NSData)dataOpeningTagData;
- (NSData)dictionaryClosingTagData;
- (NSData)dictionaryOpeningTagData;
- (NSData)keyClosingTagData;
- (NSData)keyOpeningTagData;
- (NSData)stringClosingTagData;
- (NSData)stringOpeningTagData;
- (NSData)tabPrefixData;
- (NSDateFormatter)dateFormatter;
- (NSFileHandle)outputFileHandle;
- (NSMutableArray)containerStack;
- (NSMutableData)outputBuffer;
- (NSMutableString)tabPrefix;
- (void)_addObject:(id)a3;
- (void)_decrementTabPrefix;
- (void)_encodeData:(id)a3;
- (void)_encodeDate:(id)a3;
- (void)_encodeNumber:(id)a3;
- (void)_encodeString:(id)a3;
- (void)_flushOutputBuffer;
- (void)_incrementTabPrefix;
- (void)_startArray;
- (void)_startDictionary;
- (void)_writeData:(id)a3;
- (void)_writeDictionaryKey:(id)a3;
- (void)_writeString:(id)a3;
- (void)addObject:(id)a3;
- (void)close;
- (void)endArray;
- (void)endDictionary;
- (void)setContainerStack:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setOutputBuffer:(id)a3;
- (void)setOutputFileHandle:(id)a3;
- (void)setTabPrefix:(id)a3;
- (void)setTabPrefixData:(id)a3;
- (void)startArray;
- (void)startArrayForKey:(id)a3;
- (void)startDictionaryForKey:(id)a3;
@end

@implementation MSVPropertyListEncoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabPrefixData, 0);
  objc_storeStrong((id *)&self->_tabPrefix, 0);
  objc_storeStrong((id *)&self->_containerStack, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_outputBuffer, 0);
  objc_storeStrong((id *)&self->_outputFileHandle, 0);
  objc_storeStrong((id *)&self->_BOOLFalseTagData, 0);
  objc_storeStrong((id *)&self->_BOOLTrueTagData, 0);
  objc_storeStrong((id *)&self->_dataClosingTagData, 0);
  objc_storeStrong((id *)&self->_dataOpeningTagData, 0);
  objc_storeStrong((id *)&self->_stringClosingTagData, 0);
  objc_storeStrong((id *)&self->_stringOpeningTagData, 0);
  objc_storeStrong((id *)&self->_keyClosingTagData, 0);
  objc_storeStrong((id *)&self->_keyOpeningTagData, 0);
  objc_storeStrong((id *)&self->_dictionaryClosingTagData, 0);
  objc_storeStrong((id *)&self->_dictionaryOpeningTagData, 0);
  objc_storeStrong((id *)&self->_arrayClosingTagData, 0);
  objc_storeStrong((id *)&self->_arrayOpeningTagData, 0);
}

- (void)setTabPrefixData:(id)a3
{
}

- (NSData)tabPrefixData
{
  return self->_tabPrefixData;
}

- (void)setTabPrefix:(id)a3
{
}

- (NSMutableString)tabPrefix
{
  return self->_tabPrefix;
}

- (void)setContainerStack:(id)a3
{
}

- (NSMutableArray)containerStack
{
  return self->_containerStack;
}

- (void)setDateFormatter:(id)a3
{
}

- (void)setOutputBuffer:(id)a3
{
}

- (NSMutableData)outputBuffer
{
  return self->_outputBuffer;
}

- (void)setOutputFileHandle:(id)a3
{
}

- (NSFileHandle)outputFileHandle
{
  return self->_outputFileHandle;
}

- (void)_writeString:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v4 = (__CFString *)a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", -[__CFString length](v4, "length"));
  uint64_t v6 = [(__CFString *)v4 length];
  CFStringRef theString = v4;
  uint64_t v36 = 0;
  int64_t v37 = v6;
  CharactersPtr = CFStringGetCharactersPtr(v4);
  CStringPtr = 0;
  v34 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v26 = 0u;
  int64_t v38 = 0;
  int64_t v39 = 0;
  v35 = CStringPtr;
  if (v6)
  {
    v24 = self;
    uint64_t v9 = 0;
    int64_t v10 = 0;
    int64_t v11 = 0;
    uint64_t v12 = 64;
    while (1)
    {
      if ((unint64_t)v10 >= 4) {
        uint64_t v13 = 4;
      }
      else {
        uint64_t v13 = v10;
      }
      if (v10 < 0 || (uint64_t v14 = v37, v37 <= v10))
      {
        unsigned __int16 v15 = 0;
      }
      else
      {
        if (v34)
        {
          unsigned __int16 v15 = v34[v10 + v36];
        }
        else if (v35)
        {
          unsigned __int16 v15 = v35[v36 + v10];
        }
        else
        {
          if (v39 <= v10 || (int64_t v16 = v38, v38 > v10))
          {
            uint64_t v17 = v13 + v9;
            uint64_t v18 = v12 - v13;
            int64_t v19 = v10 - v13;
            int64_t v20 = v19 + 64;
            if (v19 + 64 >= v37) {
              int64_t v20 = v37;
            }
            int64_t v38 = v19;
            int64_t v39 = v20;
            if (v37 >= v18) {
              uint64_t v14 = v18;
            }
            v42.length = v14 + v17;
            v42.location = v19 + v36;
            CFStringGetCharacters(theString, v42, buffer);
            int64_t v16 = v38;
          }
          unsigned __int16 v15 = buffer[v10 - v16];
        }
        if (v11 >= 62 && (v15 & 0xFC00) == 0xD800)
        {
          _MSVPropertyListEncoderAppendCharacters(v5, v40, v11);
          int64_t v11 = 0;
        }
        switch(v15)
        {
          case '&':
            if (v11) {
              _MSVPropertyListEncoderAppendCharacters(v5, v40, v11);
            }
            v21 = v5;
            v22 = "&amp;";
            uint64_t v23 = 5;
LABEL_41:
            [v21 appendBytes:v22 length:v23];
LABEL_42:
            int64_t v11 = 0;
            goto LABEL_43;
          case '>':
            if (v11) {
              _MSVPropertyListEncoderAppendCharacters(v5, v40, v11);
            }
            v21 = v5;
            v22 = "&gt;";
            goto LABEL_37;
          case '<':
            if (v11) {
              _MSVPropertyListEncoderAppendCharacters(v5, v40, v11);
            }
            v21 = v5;
            v22 = "&lt;";
LABEL_37:
            uint64_t v23 = 4;
            goto LABEL_41;
        }
      }
      v40[v11++] = v15;
      if (v11 == 64)
      {
        _MSVPropertyListEncoderAppendCharacters(v5, v40, 0x40uLL);
        goto LABEL_42;
      }
LABEL_43:
      ++v10;
      --v9;
      ++v12;
      if (v6 == v10)
      {
        self = v24;
        if (v11) {
          _MSVPropertyListEncoderAppendCharacters(v5, v40, v11);
        }
        break;
      }
    }
  }

  [(MSVPropertyListEncoder *)self _writeData:v5];
}

- (void)_writeDictionaryKey:(id)a3
{
  id v4 = a3;
  v5 = [(MSVPropertyListEncoder *)self tabPrefixData];
  [(MSVPropertyListEncoder *)self _writeData:v5];

  uint64_t v6 = [(MSVPropertyListEncoder *)self keyOpeningTagData];
  [(MSVPropertyListEncoder *)self _writeData:v6];

  [(MSVPropertyListEncoder *)self _writeString:v4];
  id v7 = [(MSVPropertyListEncoder *)self keyClosingTagData];
  [(MSVPropertyListEncoder *)self _writeData:v7];
}

- (void)_decrementTabPrefix
{
  v3 = [(MSVPropertyListEncoder *)self tabPrefix];
  id v4 = [(MSVPropertyListEncoder *)self tabPrefix];
  objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);

  id v6 = [(MSVPropertyListEncoder *)self tabPrefix];
  v5 = [v6 dataUsingEncoding:4];
  [(MSVPropertyListEncoder *)self setTabPrefixData:v5];
}

- (void)_incrementTabPrefix
{
  v3 = [(MSVPropertyListEncoder *)self tabPrefix];
  [v3 appendString:@"\t"];

  id v5 = [(MSVPropertyListEncoder *)self tabPrefix];
  id v4 = [v5 dataUsingEncoding:4];
  [(MSVPropertyListEncoder *)self setTabPrefixData:v4];
}

- (void)_startDictionary
{
  v3 = [(MSVPropertyListEncoder *)self tabPrefixData];
  [(MSVPropertyListEncoder *)self _writeData:v3];

  id v4 = [(MSVPropertyListEncoder *)self dictionaryOpeningTagData];
  [(MSVPropertyListEncoder *)self _writeData:v4];

  id v5 = [(MSVPropertyListEncoder *)self containerStack];
  [v5 addObject:objc_opt_class()];

  [(MSVPropertyListEncoder *)self _incrementTabPrefix];
}

- (void)_startArray
{
  v3 = [(MSVPropertyListEncoder *)self tabPrefixData];
  [(MSVPropertyListEncoder *)self _writeData:v3];

  id v4 = [(MSVPropertyListEncoder *)self arrayOpeningTagData];
  [(MSVPropertyListEncoder *)self _writeData:v4];

  id v5 = [(MSVPropertyListEncoder *)self containerStack];
  [v5 addObject:objc_opt_class()];

  [(MSVPropertyListEncoder *)self _incrementTabPrefix];
}

- (void)_encodeData:(id)a3
{
  id v20 = a3;
  id v4 = [(MSVPropertyListEncoder *)self tabPrefix];
  if ((unint64_t)[(__CFString *)v4 length] >= 9)
  {

    id v4 = @"\t\t\t\t\t\t\t\t";
  }
  id v5 = [(__CFString *)v4 dataUsingEncoding:4];
  id v6 = [@"\n" dataUsingEncoding:4];
  int64_t v19 = v4;
  uint64_t v7 = [(__CFString *)v4 length];
  v8 = [(MSVPropertyListEncoder *)self tabPrefixData];
  [(MSVPropertyListEncoder *)self _writeData:v8];

  uint64_t v9 = [(MSVPropertyListEncoder *)self dataOpeningTagData];
  [(MSVPropertyListEncoder *)self _writeData:v9];

  int64_t v10 = [v20 base64EncodedStringWithOptions:0];
  unint64_t v11 = [v10 length];
  if ([v10 length])
  {
    unint64_t v12 = 0;
    unint64_t v13 = 76 - 8 * v7;
    do
    {
      if (v13 >= v11) {
        unint64_t v14 = v11;
      }
      else {
        unint64_t v14 = v13;
      }
      unsigned __int16 v15 = objc_msgSend(v10, "substringWithRange:", v12, v14);
      [(MSVPropertyListEncoder *)self _writeData:v5];
      int64_t v16 = [v15 dataUsingEncoding:4];
      [(MSVPropertyListEncoder *)self _writeData:v16];

      [(MSVPropertyListEncoder *)self _writeData:v6];
      v11 -= v14;

      v12 += v13;
    }
    while (v12 < [v10 length]);
  }
  uint64_t v17 = [(MSVPropertyListEncoder *)self tabPrefixData];
  [(MSVPropertyListEncoder *)self _writeData:v17];

  uint64_t v18 = [(MSVPropertyListEncoder *)self dataClosingTagData];
  [(MSVPropertyListEncoder *)self _writeData:v18];
}

- (void)_encodeDate:(id)a3
{
  id v4 = a3;
  id v5 = [(MSVPropertyListEncoder *)self tabPrefixData];
  [(MSVPropertyListEncoder *)self _writeData:v5];

  id v8 = [(MSVPropertyListEncoder *)self dateFormatter];
  id v6 = [v8 stringFromDate:v4];

  uint64_t v7 = [v6 dataUsingEncoding:4];
  [(MSVPropertyListEncoder *)self _writeData:v7];
}

- (void)_encodeNumber:(id)a3
{
  id v4 = a3;
  CFTypeID v5 = CFGetTypeID(v4);
  if (v5 != CFBooleanGetTypeID())
  {
    if (CFNumberIsFloatType((CFNumberRef)v4))
    {
      double valuePtr = 0.0;
      CFNumberGetValue((CFNumberRef)v4, kCFNumberFloat64Type, &valuePtr);
      double v6 = valuePtr;
      if (valuePtr == 0.0)
      {
        uint64_t v7 = @"<real>0.0</real>\n";
LABEL_18:
        id v8 = -[__CFString dataUsingEncoding:](v7, "dataUsingEncoding:", 4, v6);

        goto LABEL_19;
      }
      double v10 = fabs(valuePtr);
      unint64_t v11 = @"<real>-infinity</real>\n";
      if (valuePtr > 0.0) {
        unint64_t v11 = @"<real>+infinity</real>\n";
      }
      if (v10 == INFINITY) {
        uint64_t v7 = v11;
      }
      else {
        uint64_t v7 = 0;
      }
      if (v10 == INFINITY) {
        goto LABEL_18;
      }
      CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, @"<real>%.*g</real>\n", 17, *(void *)&valuePtr);
    }
    else
    {
      CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, @"<integer>%@</integer>\n", v4);
    }
    uint64_t v7 = (__CFString *)v9;
    goto LABEL_18;
  }
  if (CFBooleanGetValue((CFBooleanRef)v4)) {
    [(MSVPropertyListEncoder *)self BOOLTrueTagData];
  }
  else {
  id v8 = [(MSVPropertyListEncoder *)self BOOLFalseTagData];
  }
LABEL_19:
  unint64_t v12 = [(MSVPropertyListEncoder *)self tabPrefixData];
  [(MSVPropertyListEncoder *)self _writeData:v12];

  [(MSVPropertyListEncoder *)self _writeData:v8];
}

- (void)_encodeString:(id)a3
{
  id v4 = a3;
  CFTypeID v5 = [(MSVPropertyListEncoder *)self tabPrefixData];
  [(MSVPropertyListEncoder *)self _writeData:v5];

  double v6 = [(MSVPropertyListEncoder *)self stringOpeningTagData];
  [(MSVPropertyListEncoder *)self _writeData:v6];

  [(MSVPropertyListEncoder *)self _writeString:v4];
  id v7 = [(MSVPropertyListEncoder *)self stringClosingTagData];
  [(MSVPropertyListEncoder *)self _writeData:v7];
}

- (void)_addObject:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MSVPropertyListEncoder *)self _encodeString:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MSVPropertyListEncoder *)self _encodeNumber:v5];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MSVPropertyListEncoder *)self _encodeDate:v5];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(MSVPropertyListEncoder *)self _encodeData:v5];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(MSVPropertyListEncoder *)self _startDictionary];
            id v6 = v5;
            id v7 = [v6 allKeys];
            id v8 = [v7 sortedArrayUsingSelector:sel_compare_];

            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            id v9 = v8;
            uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v26;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v26 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
                  unsigned __int16 v15 = [v6 objectForKey:v14];
                  [(MSVPropertyListEncoder *)self setObject:v15 forKey:v14];
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
              }
              while (v11);
            }

            [(MSVPropertyListEncoder *)self endDictionary];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v20 = [MEMORY[0x1E4F28B00] currentHandler];
              [v20 handleFailureInMethod:a2, self, @"MSVPropertyListEncoder.m", 299, @"Cannot encode object of type %@", objc_opt_class() object file lineNumber description];

              goto LABEL_29;
            }
            [(MSVPropertyListEncoder *)self _startArray];
            id v6 = v5;
            long long v21 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            uint64_t v16 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v22;
              do
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v22 != v18) {
                    objc_enumerationMutation(v6);
                  }
                  [(MSVPropertyListEncoder *)self addObject:*(void *)(*((void *)&v21 + 1) + 8 * j)];
                }
                uint64_t v17 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
              }
              while (v17);
            }
            [(MSVPropertyListEncoder *)self endArray];
          }
        }
      }
    }
  }
LABEL_29:
}

- (void)_flushOutputBuffer
{
  v3 = [(MSVPropertyListEncoder *)self outputFileHandle];
  id v4 = [(MSVPropertyListEncoder *)self outputBuffer];
  [v3 writeData:v4];

  id v5 = [(MSVPropertyListEncoder *)self outputBuffer];
  [v5 setLength:0];
}

- (void)_writeData:(id)a3
{
  id v8 = a3;
  id v4 = [(MSVPropertyListEncoder *)self outputBuffer];
  uint64_t v5 = [v4 length];
  unint64_t v6 = [v8 length] + v5;

  if (v6 > 0x2000) {
    [(MSVPropertyListEncoder *)self _flushOutputBuffer];
  }
  id v7 = [(MSVPropertyListEncoder *)self outputBuffer];
  [v7 appendData:v8];
}

- (NSData)BOOLFalseTagData
{
  BOOLFalseTagData = self->_BOOLFalseTagData;
  if (!BOOLFalseTagData)
  {
    id v4 = [@"<false/>\n" dataUsingEncoding:4];
    uint64_t v5 = self->_BOOLFalseTagData;
    self->_BOOLFalseTagData = v4;

    BOOLFalseTagData = self->_BOOLFalseTagData;
  }
  return BOOLFalseTagData;
}

- (NSData)BOOLTrueTagData
{
  BOOLTrueTagData = self->_BOOLTrueTagData;
  if (!BOOLTrueTagData)
  {
    id v4 = [@"<true/>\n" dataUsingEncoding:4];
    uint64_t v5 = self->_BOOLTrueTagData;
    self->_BOOLTrueTagData = v4;

    BOOLTrueTagData = self->_BOOLTrueTagData;
  }
  return BOOLTrueTagData;
}

- (NSData)dataClosingTagData
{
  dataClosingTagData = self->_dataClosingTagData;
  if (!dataClosingTagData)
  {
    id v4 = [@"</data>\n" dataUsingEncoding:4];
    uint64_t v5 = self->_dataClosingTagData;
    self->_dataClosingTagData = v4;

    dataClosingTagData = self->_dataClosingTagData;
  }
  return dataClosingTagData;
}

- (NSData)dataOpeningTagData
{
  dataOpeningTagData = self->_dataOpeningTagData;
  if (!dataOpeningTagData)
  {
    id v4 = [@"<data>\n" dataUsingEncoding:4];
    uint64_t v5 = self->_dataOpeningTagData;
    self->_dataOpeningTagData = v4;

    dataOpeningTagData = self->_dataOpeningTagData;
  }
  return dataOpeningTagData;
}

- (NSData)stringClosingTagData
{
  stringClosingTagData = self->_stringClosingTagData;
  if (!stringClosingTagData)
  {
    id v4 = [@"</string>\n" dataUsingEncoding:4];
    uint64_t v5 = self->_stringClosingTagData;
    self->_stringClosingTagData = v4;

    stringClosingTagData = self->_stringClosingTagData;
  }
  return stringClosingTagData;
}

- (NSData)stringOpeningTagData
{
  stringOpeningTagData = self->_stringOpeningTagData;
  if (!stringOpeningTagData)
  {
    id v4 = [@"<string>" dataUsingEncoding:4];
    uint64_t v5 = self->_stringOpeningTagData;
    self->_stringOpeningTagData = v4;

    stringOpeningTagData = self->_stringOpeningTagData;
  }
  return stringOpeningTagData;
}

- (NSData)keyClosingTagData
{
  keyClosingTagData = self->_keyClosingTagData;
  if (!keyClosingTagData)
  {
    id v4 = [@"</key>\n" dataUsingEncoding:4];
    uint64_t v5 = self->_keyClosingTagData;
    self->_keyClosingTagData = v4;

    keyClosingTagData = self->_keyClosingTagData;
  }
  return keyClosingTagData;
}

- (NSData)keyOpeningTagData
{
  keyOpeningTagData = self->_keyOpeningTagData;
  if (!keyOpeningTagData)
  {
    id v4 = [@"<key>" dataUsingEncoding:4];
    uint64_t v5 = self->_keyOpeningTagData;
    self->_keyOpeningTagData = v4;

    keyOpeningTagData = self->_keyOpeningTagData;
  }
  return keyOpeningTagData;
}

- (NSData)dictionaryClosingTagData
{
  dictionaryClosingTagData = self->_dictionaryClosingTagData;
  if (!dictionaryClosingTagData)
  {
    id v4 = [@"</dict>\n" dataUsingEncoding:4];
    uint64_t v5 = self->_dictionaryClosingTagData;
    self->_dictionaryClosingTagData = v4;

    dictionaryClosingTagData = self->_dictionaryClosingTagData;
  }
  return dictionaryClosingTagData;
}

- (NSData)dictionaryOpeningTagData
{
  dictionaryOpeningTagData = self->_dictionaryOpeningTagData;
  if (!dictionaryOpeningTagData)
  {
    id v4 = [@"<dict>\n" dataUsingEncoding:4];
    uint64_t v5 = self->_dictionaryOpeningTagData;
    self->_dictionaryOpeningTagData = v4;

    dictionaryOpeningTagData = self->_dictionaryOpeningTagData;
  }
  return dictionaryOpeningTagData;
}

- (NSData)arrayClosingTagData
{
  arrayClosingTagData = self->_arrayClosingTagData;
  if (!arrayClosingTagData)
  {
    id v4 = [@"</array>\n" dataUsingEncoding:4];
    uint64_t v5 = self->_arrayClosingTagData;
    self->_arrayClosingTagData = v4;

    arrayClosingTagData = self->_arrayClosingTagData;
  }
  return arrayClosingTagData;
}

- (NSData)arrayOpeningTagData
{
  arrayOpeningTagData = self->_arrayOpeningTagData;
  if (!arrayOpeningTagData)
  {
    id v4 = [@"<array>\n" dataUsingEncoding:4];
    uint64_t v5 = self->_arrayOpeningTagData;
    self->_arrayOpeningTagData = v4;

    arrayOpeningTagData = self->_arrayOpeningTagData;
  }
  return arrayOpeningTagData;
}

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    [(NSDateFormatter *)v4 setDateFormat:@"'<date>'yyyy-MM-dd'T'HH:mm:ss'Z</date>\n'"];
    uint64_t v5 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSDateFormatter *)v4 setLocale:v5];

    unint64_t v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
    [(NSDateFormatter *)v4 setTimeZone:v6];

    id v7 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (void)close
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [(MSVPropertyListEncoder *)self containerStack];
  uint64_t v5 = (void *)[v4 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v6 = [v5 reverseObjectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (v11 == objc_opt_class())
        {
          [(MSVPropertyListEncoder *)self endArray];
        }
        else if (v11 == objc_opt_class())
        {
          [(MSVPropertyListEncoder *)self endDictionary];
        }
        else
        {
          uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
          [v12 handleFailureInMethod:a2, self, @"MSVPropertyListEncoder.m", 147, @"Invalid container type: %@", v11 object file lineNumber description];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  unint64_t v13 = [@"</plist>\n" dataUsingEncoding:4];
  [(MSVPropertyListEncoder *)self _writeData:v13];

  [(MSVPropertyListEncoder *)self _flushOutputBuffer];
  uint64_t v14 = [(MSVPropertyListEncoder *)self outputFileHandle];
  [v14 closeFile];
}

- (void)endDictionary
{
  id v4 = [(MSVPropertyListEncoder *)self containerStack];
  uint64_t v5 = [v4 lastObject];
  uint64_t v6 = objc_opt_class();

  if (v5 != (void *)v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MSVPropertyListEncoder.m" lineNumber:128 description:@"Can only end a dictionary if the current parent is a dictionary"];
  }
  uint64_t v7 = [(MSVPropertyListEncoder *)self containerStack];
  [v7 removeLastObject];

  [(MSVPropertyListEncoder *)self _decrementTabPrefix];
  uint64_t v8 = [(MSVPropertyListEncoder *)self tabPrefixData];
  [(MSVPropertyListEncoder *)self _writeData:v8];

  id v10 = [(MSVPropertyListEncoder *)self dictionaryClosingTagData];
  [(MSVPropertyListEncoder *)self _writeData:v10];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v12 = a4;
  id v7 = a3;
  uint64_t v8 = [(MSVPropertyListEncoder *)self containerStack];
  uint64_t v9 = [v8 lastObject];
  uint64_t v10 = objc_opt_class();

  if (v9 != (void *)v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MSVPropertyListEncoder.m" lineNumber:121 description:@"Can only set an object for a key if the current parent is a dictionary"];
  }
  [(MSVPropertyListEncoder *)self _writeDictionaryKey:v12];
  [(MSVPropertyListEncoder *)self _addObject:v7];
}

- (void)startDictionaryForKey:(id)a3
{
  id v9 = a3;
  uint64_t v5 = [(MSVPropertyListEncoder *)self containerStack];
  uint64_t v6 = [v5 lastObject];
  uint64_t v7 = objc_opt_class();

  if (v6 != (void *)v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSVPropertyListEncoder.m" lineNumber:113 description:@"Can only start a dictionary for a key if the current parent is a dictionary"];
  }
  [(MSVPropertyListEncoder *)self _writeDictionaryKey:v9];
  [(MSVPropertyListEncoder *)self _startDictionary];
}

- (void)endArray
{
  id v4 = [(MSVPropertyListEncoder *)self containerStack];
  uint64_t v5 = [v4 lastObject];
  uint64_t v6 = objc_opt_class();

  if (v5 != (void *)v6)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MSVPropertyListEncoder.m" lineNumber:99 description:@"Can only end an array if the current parent is an array."];
  }
  uint64_t v7 = [(MSVPropertyListEncoder *)self containerStack];
  [v7 removeLastObject];

  [(MSVPropertyListEncoder *)self _decrementTabPrefix];
  uint64_t v8 = [(MSVPropertyListEncoder *)self tabPrefixData];
  [(MSVPropertyListEncoder *)self _writeData:v8];

  id v10 = [(MSVPropertyListEncoder *)self arrayClosingTagData];
  [(MSVPropertyListEncoder *)self _writeData:v10];
}

- (void)addObject:(id)a3
{
  id v9 = a3;
  uint64_t v5 = [(MSVPropertyListEncoder *)self containerStack];
  uint64_t v6 = [v5 lastObject];
  uint64_t v7 = objc_opt_class();

  if (v6 != (void *)v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSVPropertyListEncoder.m" lineNumber:93 description:@"Can only add an object if the current parent is an array."];
  }
  [(MSVPropertyListEncoder *)self _addObject:v9];
}

- (void)startArrayForKey:(id)a3
{
  id v9 = a3;
  uint64_t v5 = [(MSVPropertyListEncoder *)self containerStack];
  uint64_t v6 = [v5 lastObject];
  uint64_t v7 = objc_opt_class();

  if (v6 != (void *)v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSVPropertyListEncoder.m" lineNumber:85 description:@"Can only start an array for a key if the current parent is a dictionary"];
  }
  [(MSVPropertyListEncoder *)self _writeDictionaryKey:v9];
  [(MSVPropertyListEncoder *)self _startArray];
}

- (void)startArray
{
  id v4 = [(MSVPropertyListEncoder *)self containerStack];
  uint64_t v5 = [v4 lastObject];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = [(MSVPropertyListEncoder *)self containerStack];
    uint64_t v8 = [v7 lastObject];
    uint64_t v9 = objc_opt_class();

    if (v8 == (void *)v9) {
      goto LABEL_5;
    }
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"MSVPropertyListEncoder.m" lineNumber:79 description:@"Can only start an array as the root object or if the current parent is an array. To stream an array into the value of a dictionary key use startArrayForKey:"];
  }

LABEL_5:
  [(MSVPropertyListEncoder *)self _startArray];
}

- (MSVPropertyListEncoder)init
{
  return [(MSVPropertyListEncoder *)self initWithOutputFileHandle:0];
}

- (MSVPropertyListEncoder)initWithOutputFileHandle:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MSVPropertyListEncoder;
  uint64_t v6 = [(MSVPropertyListEncoder *)&v16 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputFileHandle, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:0x2000];
    outputBuffer = v7->_outputBuffer;
    v7->_outputBuffer = (NSMutableData *)v8;

    id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    containerStack = v7->_containerStack;
    v7->_containerStack = v10;

    id v12 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    tabPrefix = v7->_tabPrefix;
    v7->_tabPrefix = v12;

    uint64_t v14 = [@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n" dataUsingEncoding:4];
    [(MSVPropertyListEncoder *)v7 _writeData:v14];
  }
  return v7;
}

@end
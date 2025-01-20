@interface MFProgressiveMimeParser
- (MFProgressiveMimeParser)initWithBodyData:(id)a3 topLevelHeaders:(id)a4 headersToPreserve:(id)a5;
- (id)_currentBoundary;
- (id)context;
- (id)currentPart;
- (id)data;
- (id)topLevelPart;
- (void)_continueParsing;
- (void)_continueParsingBody;
- (void)_continueParsingHeaders;
- (void)_continueParsingStartOfPart;
- (void)_initializeTopLevelPartWithHeaders:(id)a3;
- (void)_reportError:(id)a3;
- (void)noteDataLengthChanged:(unsigned int)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MFProgressiveMimeParser

- (MFProgressiveMimeParser)initWithBodyData:(id)a3 topLevelHeaders:(id)a4 headersToPreserve:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MFProgressiveMimeParser;
  v12 = [(MFProgressiveMimeParser *)&v15 init];
  v13 = v12;
  if (v12)
  {
    if (v9 && v10)
    {
      objc_storeStrong((id *)&v12->_data, a3);
      v13->_lastLength = [v9 length];
      objc_storeStrong((id *)&v13->_preserveHeaders, a5);
      [(MFProgressiveMimeParser *)v13 _initializeTopLevelPartWithHeaders:v10];
    }
    else
    {

      v13 = 0;
    }
  }

  return v13;
}

- (void)setDelegate:(id)a3
{
  id v5 = a3;
  if (self->_delegate != v5)
  {
    id v9 = v5;
    objc_storeStrong(&self->_delegate, a3);
    *(unsigned char *)&self->_parserFlags = *(unsigned char *)&self->_parserFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_parserFlags = *(unsigned char *)&self->_parserFlags & 0xFD | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_parserFlags = *(unsigned char *)&self->_parserFlags & 0xFB | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 8;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_parserFlags = *(unsigned char *)&self->_parserFlags & 0xF7 | v8;
    id v5 = v9;
  }
}

- (void)setContext:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (void)noteDataLengthChanged:(unsigned int)a3
{
  if (self->_lastLength < a3)
  {
    unint64_t v4 = a3;
    if ([(NSMutableData *)self->_data length] >= a3)
    {
      self->_lastLength = v4;
      [(MFProgressiveMimeParser *)self _continueParsing];
    }
    else
    {
      [(MFProgressiveMimeParser *)self _reportError:@"Data is not as long as reported"];
    }
  }
}

- (id)topLevelPart
{
  return self->_topLevelPart;
}

- (id)currentPart
{
  return self->_currentPart;
}

- (id)data
{
  return self->_data;
}

- (void)_initializeTopLevelPartWithHeaders:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (MFMimePart *)objc_alloc_init(MEMORY[0x1E4F73530]);
  topLevelPart = self->_topLevelPart;
  self->_topLevelPart = v5;

  char v7 = [v4 objectForKey:*MEMORY[0x1E4F60698]];
  char v8 = v7;
  if (v7)
  {
    strlen((const char *)[v7 cStringUsingEncoding:4]);
    if ((MFMimePartParseContentTypeHeader() & 1) == 0) {
      [(MFProgressiveMimeParser *)self _reportError:@"Unable to parse Content-type header in top-level part"];
    }
  }
  else
  {
    [(MFProgressiveMimeParser *)self _reportError:@"No Content-type header found in top-level part"];
  }
  uint64_t v9 = [v4 objectForKey:*MEMORY[0x1E4F60690]];

  if (v9) {
    [(MFMimePart *)self->_topLevelPart setContentTransferEncoding:v9];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = self->_preserveHeaders;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    v13 = (void *)v9;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);

        v13 = (void *)v15;
        if (v15) {
          MFMimePartSetValueForPreservedHeader();
        }
      }
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
  else
  {
    v13 = (void *)v9;
  }

  -[MFMimePart setRange:](self->_topLevelPart, "setRange:", 0, 0);
  objc_storeStrong((id *)&self->_currentPart, self->_topLevelPart);
  char parserFlags = (char)self->_parserFlags;
  *(unsigned char *)&self->_char parserFlags = parserFlags & 0x8F | 0x30;
  if (parserFlags) {
    [self->_delegate progressiveMimeParser:self beganMimePart:self->_topLevelPart];
  }
}

- (void)_continueParsingStartOfPart
{
  uint64_t v3 = [(NSMutableData *)self->_data bytes];
  unint64_t cursor = self->_cursor;
  int v5 = *(unsigned __int8 *)(v3 + cursor);
  if ((v5 | 0x20) == 0x2D)
  {
    if (cursor - self->_lastLength < 2) {
      return;
    }
    if (v5 == 13)
    {
      if (*(unsigned char *)(cursor + v3 + 1) == 10) {
        self->_unint64_t cursor = cursor + 2;
      }
    }
    else if (v5 == 45 && *(unsigned char *)(cursor + v3 + 1) == 45)
    {
      self->_unint64_t cursor = cursor + 2;
      if ((*(unsigned char *)&self->_parserFlags & 2) != 0)
      {
        [self->_delegate progressiveMimeParser:self finishedMimePart:self->_currentPart];
        currentBoundary = self->_currentBoundary;
        self->_currentBoundary = 0;
      }
      char v7 = [(MFMimePart *)self->_currentPart parentPart];
      currentPart = self->_currentPart;
      self->_currentPart = v7;

      *(unsigned char *)&self->_char parserFlags = *(unsigned char *)&self->_parserFlags & 0x8F | 0x40;
      return;
    }
  }
  id obj = objc_alloc_init(MEMORY[0x1E4F73530]);
  objc_msgSend(obj, "setRange:", self->_cursor, 0);
  [(MFMimePart *)self->_currentPart addSubpart:obj];
  objc_storeStrong((id *)&self->_currentPart, obj);
  char parserFlags = (char)self->_parserFlags;
  *(unsigned char *)&self->_char parserFlags = parserFlags & 0x8F | 0x20;
  if (parserFlags) {
    [self->_delegate progressiveMimeParser:self beganMimePart:self->_currentPart];
  }
}

- (void)_continueParsingHeaders
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_lastLength - self->_cursor >= 4)
  {
    uint64_t v3 = -[NSMutableData mf_rangeOfCString:options:range:](self->_data, "mf_rangeOfCString:options:range:", "\r\n\r\n", 0);
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_unint64_t cursor = self->_lastLength;
    }
    else
    {
      self->_unint64_t cursor = v3 + v4;
      unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v15 = [(NSMutableData *)self->_data bytes];
      [(MFMimePart *)self->_currentPart range];
      if (MFMimeDataGetRangeOfHeader())
      {
        if (*(unsigned char *)(v20 + v21 + v15 - 1) == 13) {
          --v21;
        }
        MFMimePartParseContentTypeHeader();
      }
      if (MFMimeDataGetRangeOfHeader())
      {
        if (*(unsigned char *)(v20 + v21 + v15 - 1) == 13) {
          --v21;
        }
        MFMimePartParseContentDispositionHeader();
      }
      if (MFMimeDataGetRangeOfHeader())
      {
        if (*(unsigned char *)(v20 + v21 + v15 - 1) == 13) {
          --v21;
        }
        int v5 = MFMimeDataCreateStringFromHeaderBytes();
        [(MFMimePart *)self->_currentPart setContentTransferEncoding:v5];
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      char v6 = self->_preserveHeaders;
      char v7 = 0;
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v17;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            if (MFMimeDataGetRangeOfHeader())
            {
              if (*(unsigned char *)(v20 + v21 + v15 - 1) == 13) {
                --v21;
              }
              uint64_t v11 = MFMimeDataCreateStringFromHeaderBytes();

              char v7 = (void *)v11;
              MFMimePartSetValueForPreservedHeader();
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
        }
        while (v8);
      }

      -[MFMimePart setRange:](self->_currentPart, "setRange:", self->_cursor, 0);
      *(unsigned char *)&self->_char parserFlags = *(unsigned char *)&self->_parserFlags & 0x8F | 0x30;
      uint64_t v12 = [(MFMimePart *)self->_currentPart type];
      int v13 = [v12 isEqualToString:@"multipart"];

      if (v13)
      {
        currentBoundary = self->_currentBoundary;
        self->_currentBoundary = 0;
      }
    }
  }
}

- (id)_currentBoundary
{
  currentBoundary = self->_currentBoundary;
  if (!currentBoundary)
  {
    uint64_t v4 = self->_currentPart;
    int v5 = [(MFMimePart *)v4 bodyParameterForKey:@"boundary"];
    char v6 = v5;
    if (v5)
    {
      char v7 = (const char *)[v5 cStringUsingEncoding:1];
      size_t v8 = strlen(v7);
      uint64_t v9 = (NSData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v8 + 4];
      [(NSData *)v9 mf_appendCString:"\r\n--"];
      [(NSData *)v9 appendBytes:v7 length:v8];
      uint64_t v10 = self->_currentBoundary;
      self->_currentBoundary = v9;
    }
    if (!self->_currentBoundary)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
      uint64_t v12 = self->_currentBoundary;
      self->_currentBoundary = v11;
    }
    currentBoundary = self->_currentBoundary;
  }
  return currentBoundary;
}

- (void)_continueParsingBody
{
  id v31 = [(MFProgressiveMimeParser *)self _currentBoundary];
  unint64_t cursor = self->_cursor;
  unint64_t lastLength = self->_lastLength;
  uint64_t v5 = [(NSMutableData *)self->_data bytes];
  if (!v31)
  {
    id v31 = 0;
LABEL_23:
    uint64_t v21 = [(MFMimePart *)self->_currentPart range];
    -[MFMimePart setRange:](self->_currentPart, "setRange:", v21, self->_cursor - v21);
    char parserFlags = (char)self->_parserFlags;
    if ((parserFlags & 0x70) == 0x30)
    {
      *(unsigned char *)&self->_char parserFlags = parserFlags & 0x8F | 0x40;
      if ((parserFlags & 4) != 0) {
        [self->_delegate progressiveMimeParser:self beganDataForMimePart:self->_currentPart];
      }
    }
    goto LABEL_39;
  }
  char v6 = [MEMORY[0x1E4F1CA98] null];
  char v7 = [v31 isEqual:v6];
  size_t v8 = lastLength - cursor;

  if (cursor) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v8 >= 3;
  }
  if (v9) {
    char v10 = v7;
  }
  else {
    char v10 = 1;
  }
  if (v10)
  {
    if (v7) {
      goto LABEL_23;
    }
  }
  else
  {
    id v32 = v31;
    uint64_t v11 = [v32 bytes];
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:freeWhenDone:", v11 + 2, objc_msgSend(v32, "length") - 2, 0);

    id v31 = (id)v12;
  }
  unint64_t v13 = [v31 length];
  if (v8 < v13
    || (uint64_t v15 = -[NSMutableData mf_rangeOfData:options:range:](self->_data, "mf_rangeOfData:options:range:", v31, 0, cursor, lastLength - cursor), v15 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v31 = v31;
    uint64_t v16 = [v31 bytes];
    if (v13 < v8) {
      size_t v8 = v13;
    }
    if ((uint64_t)v8 <= 0)
    {
LABEL_21:
      unint64_t v20 = self->_lastLength;
    }
    else
    {
      long long v17 = (const void *)v16;
      unint64_t v18 = v5 + lastLength;
      long long v19 = (char *)(v5 + lastLength - v8);
      while (memcmp(v19, v17, v8))
      {
        ++v19;
        --v8;
        if ((unint64_t)v19 >= v18) {
          goto LABEL_21;
        }
      }
      unint64_t v20 = self->_lastLength - v8;
    }
    self->_unint64_t cursor = v20;
    goto LABEL_23;
  }
  uint64_t v23 = v14;
  uint64_t v24 = [(MFMimePart *)self->_currentPart range];
  if (v15 == v24 || v15 == 0) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = v15 - v24;
  }
  -[MFMimePart setRange:](self->_currentPart, "setRange:", v24, v26);
  if ((*(unsigned char *)&self->_parserFlags & 0x74) == 0x34) {
    [self->_delegate progressiveMimeParser:self beganDataForMimePart:self->_currentPart];
  }
  v27 = [(MFMimePart *)self->_currentPart type];
  char v28 = [v27 isEqualToString:@"multipart"];

  if ((v28 & 1) == 0)
  {
    if ((*(unsigned char *)&self->_parserFlags & 2) != 0) {
      [self->_delegate progressiveMimeParser:self finishedMimePart:self->_currentPart];
    }
    v29 = [(MFMimePart *)self->_currentPart parentPart];
    currentPart = self->_currentPart;
    self->_currentPart = v29;
  }
  self->_unint64_t cursor = v15 + v23;
  *(unsigned char *)&self->_char parserFlags = *(unsigned char *)&self->_parserFlags & 0x8F | 0x10;
LABEL_39:
}

- (void)_continueParsing
{
  if (self->_cursor < self->_lastLength)
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = v3;
      unint64_t v3 = ((unint64_t)*(unsigned char *)&self->_parserFlags >> 4) & 7;
      if (v4 == v3) {
        break;
      }
      if ((v3 - 3) < 2)
      {
        [(MFProgressiveMimeParser *)self _continueParsingBody];
      }
      else if (v3 == 2)
      {
        [(MFProgressiveMimeParser *)self _continueParsingHeaders];
      }
      else if (v3 == 1)
      {
        [(MFProgressiveMimeParser *)self _continueParsingStartOfPart];
      }
      else
      {
        uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parser state (%d)", ((unint64_t)*(unsigned char *)&self->_parserFlags >> 4) & 7);
        [(MFProgressiveMimeParser *)self _reportError:v5];
      }
    }
    while (self->_cursor < self->_lastLength);
  }
}

- (void)_reportError:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_parserFlags & 8) != 0)
  {
    id delegate = self->_delegate;
    id v7 = v4;
    char v6 = +[MFError errorWithDomain:@"ProgressiveMimeParseErrorDomain" code:-1 localizedDescription:v4];
    [delegate progressiveMimeParser:self failedWithError:v6];

    id v4 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBoundary, 0);
  objc_storeStrong((id *)&self->_currentPart, 0);
  objc_storeStrong((id *)&self->_topLevelPart, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_preserveHeaders, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
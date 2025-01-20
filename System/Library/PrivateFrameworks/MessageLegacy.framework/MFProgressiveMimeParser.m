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
- (void)dealloc;
- (void)noteDataLengthChanged:(unsigned int)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MFProgressiveMimeParser

- (MFProgressiveMimeParser)initWithBodyData:(id)a3 topLevelHeaders:(id)a4 headersToPreserve:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MFProgressiveMimeParser;
  v8 = [(MFProgressiveMimeParser *)&v11 init];
  v9 = v8;
  if (v8)
  {
    if (a3 && a4)
    {
      v8->_data = (NSMutableData *)a3;
      v9->_lastLength = [a3 length];
      v9->_preserveHeaders = (NSArray *)a5;
      [(MFProgressiveMimeParser *)v9 _initializeTopLevelPartWithHeaders:a4];
    }
    else
    {
      [(MFProgressiveMimeParser *)v8 dealloc];
      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFProgressiveMimeParser;
  [(MFProgressiveMimeParser *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = a3;
    *(unsigned char *)&self->_parserFlags = *(unsigned char *)&self->_parserFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_parserFlags = *(unsigned char *)&self->_parserFlags & 0xFD | v4;
    if (objc_opt_respondsToSelector()) {
      char v5 = 4;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_parserFlags = *(unsigned char *)&self->_parserFlags & 0xFB | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 8;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_parserFlags = *(unsigned char *)&self->_parserFlags & 0xF7 | v6;
  }
}

- (void)setContext:(id)a3
{
  self->_context = a3;
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
  v2 = self->_data;
  return v2;
}

- (void)_initializeTopLevelPartWithHeaders:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_topLevelPart = (MFMimePart *)objc_alloc_init(MEMORY[0x1E4F73530]);
  char v5 = (void *)[a3 objectForKey:*MEMORY[0x1E4F60698]];
  if (v5)
  {
    strlen((const char *)[v5 cStringUsingEncoding:4]);
    if (MFMimePartParseContentTypeHeader()) {
      goto LABEL_6;
    }
    char v6 = @"Unable to parse Content-type header in top-level part";
  }
  else
  {
    char v6 = @"No Content-type header found in top-level part";
  }
  [(MFProgressiveMimeParser *)self _reportError:v6];
LABEL_6:
  uint64_t v7 = [a3 objectForKey:*MEMORY[0x1E4F60690]];
  if (v7) {
    [(MFMimePart *)self->_topLevelPart setContentTransferEncoding:v7];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  preserveHeaders = self->_preserveHeaders;
  uint64_t v9 = [(NSArray *)preserveHeaders countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(preserveHeaders);
        }
        if ([a3 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)]) {
          MFMimePartSetValueForPreservedHeader();
        }
      }
      uint64_t v10 = [(NSArray *)preserveHeaders countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
  -[MFMimePart setRange:](self->_topLevelPart, "setRange:", 0, 0);
  self->_currentPart = self->_topLevelPart;
  char parserFlags = (char)self->_parserFlags;
  *(unsigned char *)&self->_char parserFlags = parserFlags & 0x8F | 0x30;
  if (parserFlags) {
    objc_msgSend(self->_delegate, "progressiveMimeParser:beganMimePart:", self);
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

        self->_currentBoundary = 0;
      }
      self->_currentPart = (MFMimePart *)[(MFMimePart *)self->_currentPart parentPart];
      *(unsigned char *)&self->_char parserFlags = *(unsigned char *)&self->_parserFlags & 0x8F | 0x40;
      return;
    }
  }
  char v6 = (MFMimePart *)objc_alloc_init(MEMORY[0x1E4F73530]);
  -[MFMimePart setRange:](v6, "setRange:", self->_cursor, 0);
  [(MFMimePart *)self->_currentPart addSubpart:v6];

  self->_currentPart = v6;
  char parserFlags = (char)self->_parserFlags;
  *(unsigned char *)&self->_char parserFlags = parserFlags & 0x8F | 0x20;
  if (parserFlags)
  {
    id delegate = self->_delegate;
    [delegate progressiveMimeParser:self beganMimePart:v6];
  }
}

- (void)_continueParsingHeaders
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
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
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v5 = [(NSMutableData *)self->_data bytes];
      [(MFMimePart *)self->_currentPart range];
      if (MFMimeDataGetRangeOfHeader())
      {
        if (*(unsigned char *)(v17 + v18 + v5 - 1) == 13) {
          --v18;
        }
        MFMimePartParseContentTypeHeader();
      }
      if (MFMimeDataGetRangeOfHeader())
      {
        if (*(unsigned char *)(v17 + v18 + v5 - 1) == 13) {
          --v18;
        }
        MFMimePartParseContentDispositionHeader();
      }
      if (MFMimeDataGetRangeOfHeader())
      {
        if (*(unsigned char *)(v17 + v18 + v5 - 1) == 13) {
          --v18;
        }
        StringFromHeaderBytes = (void *)MFMimeDataCreateStringFromHeaderBytes();
        [(MFMimePart *)self->_currentPart setContentTransferEncoding:StringFromHeaderBytes];
      }
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      preserveHeaders = self->_preserveHeaders;
      uint64_t v8 = [(NSArray *)preserveHeaders countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(preserveHeaders);
            }
            if (MFMimeDataGetRangeOfHeader())
            {
              if (*(unsigned char *)(v17 + v18 + v5 - 1) == 13) {
                --v18;
              }
              v12 = (void *)MFMimeDataCreateStringFromHeaderBytes();
              MFMimePartSetValueForPreservedHeader();
            }
          }
          uint64_t v9 = [(NSArray *)preserveHeaders countByEnumeratingWithState:&v13 objects:v19 count:16];
        }
        while (v9);
      }
      -[MFMimePart setRange:](self->_currentPart, "setRange:", self->_cursor, 0);
      *(unsigned char *)&self->_char parserFlags = *(unsigned char *)&self->_parserFlags & 0x8F | 0x30;
      if (objc_msgSend((id)-[MFMimePart type](self->_currentPart, "type"), "isEqualToString:", @"multipart"))
      {

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
    uint64_t v4 = (void *)[(MFMimePart *)self->_currentPart bodyParameterForKey:@"boundary"];
    if (!v4)
    {
      currentBoundary = self->_currentBoundary;
      if (currentBoundary) {
        return currentBoundary;
      }
      goto LABEL_4;
    }
    uint64_t v5 = (const char *)[v4 cStringUsingEncoding:1];
    size_t v6 = strlen(v5);
    currentBoundary = (NSData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v6 + 4];
    [(NSData *)currentBoundary mf_appendCString:"\r\n--"];
    [(NSData *)currentBoundary appendBytes:v5 length:v6];
    self->_currentBoundary = currentBoundary;
    if (!currentBoundary)
    {
LABEL_4:
      currentBoundary = (NSData *)(id)[MEMORY[0x1E4F1CA98] null];
      self->_currentBoundary = currentBoundary;
    }
  }
  return currentBoundary;
}

- (void)_continueParsingBody
{
  id v29 = [(MFProgressiveMimeParser *)self _currentBoundary];
  unint64_t cursor = self->_cursor;
  unint64_t lastLength = self->_lastLength;
  uint64_t v5 = [(NSMutableData *)self->_data bytes];
  if (!v29)
  {
    id v29 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = v5;
  size_t v7 = lastLength - cursor;
  int v8 = objc_msgSend(v29, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
  if (cursor) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v7 >= 3;
  }
  if (v9) {
    int v10 = v8;
  }
  else {
    int v10 = 1;
  }
  if (v10)
  {
    if ((v8 & 1) == 0)
    {
      uint64_t v11 = v29;
      goto LABEL_14;
    }
LABEL_12:
    int v12 = 0;
    goto LABEL_24;
  }
  uint64_t v13 = [v29 bytes];
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:freeWhenDone:", v13 + 2, objc_msgSend(v29, "length") - 2, 0);
LABEL_14:
  id v29 = v11;
  unint64_t v14 = [v11 length];
  if (v7 >= v14)
  {
    uint64_t v15 = -[NSMutableData mf_rangeOfData:options:range:](self->_data, "mf_rangeOfData:options:range:", v29, 0, cursor, lastLength - cursor);
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v24 = v15;
      uint64_t v25 = v16;
      uint64_t v26 = [(MFMimePart *)self->_currentPart range];
      if (v24 == v26 || v24 == 0) {
        uint64_t v28 = 0;
      }
      else {
        uint64_t v28 = v24 - v26;
      }
      -[MFMimePart setRange:](self->_currentPart, "setRange:", v26, v28);
      if ((*(unsigned char *)&self->_parserFlags & 0x74) == 0x34) {
        [self->_delegate progressiveMimeParser:self beganDataForMimePart:self->_currentPart];
      }
      if ((objc_msgSend((id)-[MFMimePart type](self->_currentPart, "type"), "isEqualToString:", @"multipart") & 1) == 0)
      {
        if ((*(unsigned char *)&self->_parserFlags & 2) != 0) {
          [self->_delegate progressiveMimeParser:self finishedMimePart:self->_currentPart];
        }
        self->_currentPart = (MFMimePart *)[(MFMimePart *)self->_currentPart parentPart];
      }
      self->_unint64_t cursor = v24 + v25;
      *(unsigned char *)&self->_char parserFlags = *(unsigned char *)&self->_parserFlags & 0x8F | 0x10;
      if ((v10 & 1) == 0) {
        goto LABEL_28;
      }
      return;
    }
  }
  int v12 = v10 ^ 1;
  if (v14 < v7) {
    size_t v7 = v14;
  }
  uint64_t v17 = [v29 bytes];
  if (-(uint64_t)v7 < 0)
  {
    uint64_t v18 = (const void *)v17;
    unint64_t v19 = v6 + lastLength;
    uint64_t v20 = (char *)(v6 + lastLength - v7);
    while (memcmp(v20, v18, v7))
    {
      ++v20;
      --v7;
      if ((unint64_t)v20 >= v19) {
        goto LABEL_22;
      }
    }
    unint64_t v21 = self->_lastLength - v7;
  }
  else
  {
LABEL_22:
    unint64_t v21 = self->_lastLength;
  }
  self->_unint64_t cursor = v21;
LABEL_24:
  uint64_t v22 = [(MFMimePart *)self->_currentPart range];
  -[MFMimePart setRange:](self->_currentPart, "setRange:", v22, self->_cursor - v22);
  char parserFlags = (char)self->_parserFlags;
  if ((parserFlags & 0x70) == 0x30)
  {
    *(unsigned char *)&self->_char parserFlags = parserFlags & 0x8F | 0x40;
    if ((parserFlags & 4) != 0) {
      [self->_delegate progressiveMimeParser:self beganDataForMimePart:self->_currentPart];
    }
  }
  if (v12)
  {
LABEL_28:
  }
}

- (void)_continueParsing
{
  if (self->_cursor < self->_lastLength)
  {
    int v3 = 0;
    do
    {
      int v4 = v3;
      int v3 = (*(unsigned char *)&self->_parserFlags >> 4) & 7;
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
        -[MFProgressiveMimeParser _reportError:](self, "_reportError:", objc_msgSend(NSString, "stringWithFormat:", @"Invalid parser state (%d)", (*(unsigned char *)&self->_parserFlags >> 4) & 7));
      }
    }
    while (self->_cursor < self->_lastLength);
  }
}

- (void)_reportError:(id)a3
{
  if ((*(unsigned char *)&self->_parserFlags & 8) != 0)
  {
    id delegate = self->_delegate;
    uint64_t v5 = +[MFError errorWithDomain:@"ProgressiveMimeParseErrorDomain" code:-1 localizedDescription:a3];
    [delegate progressiveMimeParser:self failedWithError:v5];
  }
}

@end
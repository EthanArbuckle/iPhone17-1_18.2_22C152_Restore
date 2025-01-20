@interface CHCSVParser
- (BOOL)_parseComment;
- (BOOL)_parseDelimiter;
- (BOOL)_parseEscapedField;
- (BOOL)_parseField;
- (BOOL)_parseNewline;
- (BOOL)_parseRecord;
- (BOOL)_parseUnescapedField;
- (BOOL)recognizesBackslashesAsEscapes;
- (BOOL)recognizesComments;
- (BOOL)recognizesLeadingEqualSign;
- (BOOL)sanitizesFields;
- (BOOL)trimsWhitespace;
- (CHCSVParser)initWithCSVString:(id)a3;
- (CHCSVParser)initWithContentsOfCSVFile:(id)a3;
- (CHCSVParser)initWithContentsOfCSVFile:(id)a3 delimiter:(unsigned __int16)a4;
- (CHCSVParser)initWithContentsOfCSVURL:(id)a3;
- (CHCSVParser)initWithContentsOfDelimitedURL:(id)a3 delimiter:(unsigned __int16)a4;
- (CHCSVParser)initWithDelimitedString:(id)a3 delimiter:(unsigned __int16)a4;
- (CHCSVParser)initWithInputStream:(id)a3 usedEncoding:(unint64_t *)a4 delimiter:(unsigned __int16)a5;
- (CHCSVParserDelegate)delegate;
- (unint64_t)totalBytesRead;
- (unsigned)_peekCharacter;
- (unsigned)_peekPeekCharacter;
- (void)_advance;
- (void)_beginComment;
- (void)_beginDocument;
- (void)_beginField;
- (void)_beginRecord;
- (void)_endComment;
- (void)_endDocument;
- (void)_endField;
- (void)_endRecord;
- (void)_error;
- (void)_loadMoreIfNecessary;
- (void)_parseFieldWhitespace;
- (void)_sniffEncoding;
- (void)cancelParsing;
- (void)dealloc;
- (void)parse;
- (void)setDelegate:(id)a3;
- (void)setRecognizesBackslashesAsEscapes:(BOOL)a3;
- (void)setRecognizesComments:(BOOL)a3;
- (void)setRecognizesLeadingEqualSign:(BOOL)a3;
- (void)setSanitizesFields:(BOOL)a3;
- (void)setTotalBytesRead:(unint64_t)a3;
- (void)setTrimsWhitespace:(BOOL)a3;
@end

@implementation CHCSVParser

- (CHCSVParser)initWithCSVString:(id)a3
{
  return [(CHCSVParser *)self initWithDelimitedString:a3 delimiter:44];
}

- (CHCSVParser)initWithDelimitedString:(id)a3 delimiter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  v6 = (void *)MEMORY[0x1E4F1CA10];
  v7 = [a3 dataUsingEncoding:4];
  v8 = [v6 inputStreamWithData:v7];

  v9 = [(CHCSVParser *)self initWithInputStream:v8 usedEncoding:0 delimiter:v4];
  return v9;
}

- (CHCSVParser)initWithContentsOfCSVURL:(id)a3
{
  return [(CHCSVParser *)self initWithContentsOfDelimitedURL:a3 delimiter:44];
}

- (CHCSVParser)initWithContentsOfDelimitedURL:(id)a3 delimiter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  v6 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:a3];
  v7 = [(CHCSVParser *)self initWithInputStream:v6 usedEncoding:0 delimiter:v4];

  return v7;
}

- (CHCSVParser)initWithInputStream:(id)a3 usedEncoding:(unint64_t *)a4 delimiter:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v10 = a3;
  if (v10)
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"CHCSVParser.m", 85, @"Invalid parameter not satisfying: %@", @"stream" object file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"CHCSVParser.m", 86, @"Invalid parameter not satisfying: %@", @"delimiter" object file lineNumber description];

LABEL_3:
  v11 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  int v12 = [v11 characterIsMember:v5];

  if (v12)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"CHCSVParser.m" lineNumber:87 description:@"The field delimiter may not be a newline"];
  }
  if (v5 == 34)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"CHCSVParser.m" lineNumber:88 description:@"The field delimiter may not be a double quote"];
  }
  v31.receiver = self;
  v31.super_class = (Class)CHCSVParser;
  v13 = [(CHCSVParser *)&v31 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_stream, a3);
    [(NSInputStream *)v14->_stream open];
    v15 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    stringBuffer = v14->_stringBuffer;
    v14->_stringBuffer = v15;

    v17 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    string = v14->_string;
    v14->_string = v17;

    v14->_delimiter = v5;
    v14->_nextIndex = 0;
    *(_WORD *)&v14->_recognizesBackslashesAsEscapes = 0;
    v14->_sanitizesFields = 0;
    v19 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    sanitizedField = v14->_sanitizedField;
    v14->_sanitizedField = v19;

    v14->_trimsWhitespace = 0;
    v14->_recognizesLeadingEqualSign = 0;
    v21 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    v22 = (void *)[v21 mutableCopy];

    v23 = objc_msgSend(NSString, "stringWithFormat:", @"%c%C", 34, v14->_delimiter);
    [v22 addCharactersInString:v23];
    uint64_t v24 = [v22 invertedSet];
    validFieldCharacters = v14->_validFieldCharacters;
    v14->_validFieldCharacters = (NSCharacterSet *)v24;

    if (a4)
    {
      if (*a4)
      {
        v14->_streamEncoding = *a4;
      }
      else
      {
        [(CHCSVParser *)v14 _sniffEncoding];
        *a4 = v14->_streamEncoding;
      }
    }
    else
    {
      [(CHCSVParser *)v14 _sniffEncoding];
    }
  }
  return v14;
}

- (void)dealloc
{
  [(NSInputStream *)self->_stream close];
  v3.receiver = self;
  v3.super_class = (Class)CHCSVParser;
  [(CHCSVParser *)&v3 dealloc];
}

- (void)setRecognizesBackslashesAsEscapes:(BOOL)a3
{
  self->_recognizesBackslashesAsEscapes = a3;
  if (self->_delimiter == 92 && a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Cannot recognize backslashes as escapes when using '\\' as the delimiter"];
  }
}

- (void)setRecognizesComments:(BOOL)a3
{
  self->_recognizesComments = a3;
  if (self->_delimiter == 35 && a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Cannot recognize comments when using '#' as the delimiter"];
  }
}

- (void)setRecognizesLeadingEqualSign:(BOOL)a3
{
  self->_recognizesLeadingEqualSign = a3;
  if (self->_delimiter == 61 && a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Cannot recognize leading equal sign when using '=' as the delimiter"];
  }
}

- (void)_sniffEncoding
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  NSInteger v3 = [(NSInputStream *)self->_stream read:&v11 maxLength:512];
  if ((unint64_t)(v3 - 1) > 0x1FF)
  {
    unint64_t v7 = 4;
  }
  else
  {
    unint64_t v4 = v3;
    [(NSMutableData *)self->_stringBuffer appendBytes:&v11 length:v3];
    [(CHCSVParser *)self setTotalBytesRead:[(CHCSVParser *)self totalBytesRead] + v4];
    BOOL v6 = v4 >= 4 && v11 == 0 && v12 == 0;
    if (v6 && v13 == 254 && v14 == 255)
    {
      unint64_t v7 = 2550137088;
LABEL_26:
      uint64_t v8 = 4;
LABEL_27:
      -[NSMutableData replaceBytesInRange:withBytes:length:](self->_stringBuffer, "replaceBytesInRange:withBytes:length:", 0, v8, 0, 0);
      goto LABEL_28;
    }
    if (v4 >= 4 && v11 == 255 && v12 == 254 && !v13 && !v14)
    {
      unint64_t v7 = 2617245952;
      goto LABEL_26;
    }
    if (v4 >= 4 && v11 == 27 && v12 == 36 && v13 == 41 && v14 == 67)
    {
      unint64_t v7 = CFStringConvertEncodingToNSStringEncoding(0x840u);
      goto LABEL_26;
    }
    if (v4 >= 2 && v11 == 254 && v12 == 255)
    {
      unint64_t v7 = 2415919360;
LABEL_37:
      uint64_t v8 = 2;
      goto LABEL_27;
    }
    if (v4 >= 2 && v11 == 255 && v12 == 254)
    {
      unint64_t v7 = 2483028224;
      goto LABEL_37;
    }
    if (v4 >= 3 && v11 == 239 && v12 == 187 && v13 == 191)
    {
      unint64_t v7 = 4;
      uint64_t v8 = 3;
      goto LABEL_27;
    }
    uint64_t v9 = 0;
    unint64_t v7 = 4;
    while (1)
    {
      id v10 = (void *)[[NSString alloc] initWithBytes:&v11 length:v4 + v9 encoding:4];
      if (v10) {
        break;
      }
      if (--v9 == -4)
      {
        NSLog(&cfstr_UnableToDeterm.isa);
        unint64_t v7 = 30;
        break;
      }
    }
  }
LABEL_28:
  self->_streamEncoding = v7;
}

- (void)_loadMoreIfNecessary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(NSMutableString *)self->_string length];
  unint64_t v4 = v3 / 3;
  if (v3 / 3 <= 0xA) {
    unint64_t v4 = 10;
  }
  if (v4 + self->_nextIndex >= v3 && [(NSInputStream *)self->_stream hasBytesAvailable])
  {
    uint64_t v5 = [(NSInputStream *)self->_stream read:v10 maxLength:512];
    if (v5 >= 1)
    {
      uint64_t v6 = v5;
      [(NSMutableData *)self->_stringBuffer appendBytes:v10 length:v5];
      [(CHCSVParser *)self setTotalBytesRead:[(CHCSVParser *)self totalBytesRead] + v6];
    }
  }
  if ([(NSMutableData *)self->_stringBuffer length])
  {
    NSUInteger v7 = [(NSMutableData *)self->_stringBuffer length];
    if (v7)
    {
      while (1)
      {
        uint64_t v8 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", -[NSMutableData bytes](self->_stringBuffer, "bytes"), v7, self->_streamEncoding);
        if (v8) {
          break;
        }
        if (!--v7) {
          goto LABEL_13;
        }
      }
      uint64_t v9 = (void *)v8;
      [(NSMutableString *)self->_string appendString:v8];
    }
LABEL_13:
    -[NSMutableData replaceBytesInRange:withBytes:length:](self->_stringBuffer, "replaceBytesInRange:withBytes:length:", 0, v7, 0, 0);
  }
}

- (void)_advance
{
}

- (unsigned)_peekCharacter
{
  [(CHCSVParser *)self _loadMoreIfNecessary];
  unint64_t nextIndex = self->_nextIndex;
  if (nextIndex >= [(NSMutableString *)self->_string length]) {
    return 0;
  }
  string = self->_string;
  unint64_t v5 = self->_nextIndex;
  return [(NSMutableString *)string characterAtIndex:v5];
}

- (unsigned)_peekPeekCharacter
{
  [(CHCSVParser *)self _loadMoreIfNecessary];
  unint64_t v3 = self->_nextIndex + 1;
  if (v3 >= [(NSMutableString *)self->_string length]) {
    return 0;
  }
  string = self->_string;
  return [(NSMutableString *)string characterAtIndex:v3];
}

- (void)parse
{
  unint64_t v3 = (void *)MEMORY[0x1AD0C4CF0](self, a2);
  [(CHCSVParser *)self _beginDocument];
  self->_currentRecord = 0;
  while ([(CHCSVParser *)self _parseRecord])
    ;
  if (self->_error) {
    [(CHCSVParser *)self _error];
  }
  else {
    [(CHCSVParser *)self _endDocument];
  }
}

- (void)cancelParsing
{
  self->_cancelled = 1;
}

- (BOOL)_parseRecord
{
  for (i = self; [(CHCSVParser *)self _peekCharacter] == 35 && i->_recognizesComments; self = i)
    [(CHCSVParser *)i _parseComment];
  if ([(CHCSVParser *)i _peekCharacter])
  {
    unint64_t v3 = (void *)MEMORY[0x1AD0C4CF0]();
    [(CHCSVParser *)i _beginRecord];
    while ([(CHCSVParser *)i _parseField] && [(CHCSVParser *)i _parseDelimiter])
      ;
    [(CHCSVParser *)i _endRecord];
  }
  BOOL v4 = [(CHCSVParser *)i _parseNewline];
  if (v4)
  {
    if (i->_error) {
      LOBYTE(v4) = 0;
    }
    else {
      LOBYTE(v4) = [(CHCSVParser *)i _peekCharacter] != 0;
    }
  }
  return v4;
}

- (BOOL)_parseNewline
{
  if (self->_cancelled) {
    return 0;
  }
  uint64_t v4 = [(CHCSVParser *)self _peekCharacter];
  int v5 = [(CHCSVParser *)self _peekPeekCharacter];
  if (v4 == 13 && v5 == 10)
  {
    [(CHCSVParser *)self _advance];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    int v7 = [v6 characterIsMember:v4];

    if (!v7) {
      return 0;
    }
  }
  [(CHCSVParser *)self _advance];
  return 1;
}

- (BOOL)_parseComment
{
  [(CHCSVParser *)self _advance];
  unint64_t v3 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  [(CHCSVParser *)self _beginComment];
  while (1)
  {
    uint64_t v4 = [(CHCSVParser *)self _peekCharacter];
    if (v4 == 92 && self->_recognizesBackslashesAsEscapes)
    {
      while (1)
        [(CHCSVParser *)self _advance];
    }
    char v5 = [v3 characterIsMember:v4];
    if (!v4 || (v5 & 1) != 0) {
      break;
    }
    [(CHCSVParser *)self _advance];
  }
  [(CHCSVParser *)self _endComment];
  BOOL v6 = [(CHCSVParser *)self _parseNewline];

  return v6;
}

- (void)_parseFieldWhitespace
{
  id v3 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  while ([(CHCSVParser *)self _peekCharacter])
  {
    if (!objc_msgSend(v3, "characterIsMember:", -[CHCSVParser _peekCharacter](self, "_peekCharacter"))
      || [(CHCSVParser *)self _peekCharacter] == self->_delimiter)
    {
      break;
    }
    if (!self->_trimsWhitespace) {
      [(NSMutableString *)self->_sanitizedField appendFormat:@"%C", [(CHCSVParser *)self _peekCharacter]];
    }
    [(CHCSVParser *)self _advance];
  }
}

- (BOOL)_parseField
{
  if (self->_cancelled) {
    return 0;
  }
  [(CHCSVParser *)self _beginField];
  [(CHCSVParser *)self _parseFieldWhitespace];
  if ([(CHCSVParser *)self _peekCharacter] == 34)
  {
LABEL_4:
    if ([(CHCSVParser *)self _parseEscapedField]) {
      goto LABEL_14;
    }
    return 0;
  }
  if (self->_recognizesLeadingEqualSign
    && [(CHCSVParser *)self _peekCharacter] == 61
    && [(CHCSVParser *)self _peekPeekCharacter] == 34)
  {
    [(CHCSVParser *)self _advance];
    goto LABEL_4;
  }
  BOOL v4 = [(CHCSVParser *)self _parseUnescapedField];
  BOOL v5 = v4;
  if (self->_trimsWhitespace)
  {
    sanitizedField = self->_sanitizedField;
    int v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v8 = [(NSMutableString *)sanitizedField stringByTrimmingCharactersInSet:v7];

    [(NSMutableString *)self->_sanitizedField setString:v8];
    if (v5) {
      goto LABEL_14;
    }
    return 0;
  }
  if (!v4) {
    return 0;
  }
LABEL_14:
  [(CHCSVParser *)self _parseFieldWhitespace];
  [(CHCSVParser *)self _endField];
  return 1;
}

- (BOOL)_parseEscapedField
{
  [(CHCSVParser *)self _advance];
  id v3 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  int v4 = [(CHCSVParser *)self _peekCharacter];
  if (v4)
  {
    char v5 = 0;
    while (1)
    {
      uint64_t v6 = (unsigned __int16)v4;
      if (v5) {
        goto LABEL_10;
      }
      if ((unsigned __int16)v4 != 92 || !self->_recognizesBackslashesAsEscapes) {
        break;
      }
      [(CHCSVParser *)self _advance];
      char v5 = 1;
LABEL_12:
      int v4 = [(CHCSVParser *)self _peekCharacter];
      if (!v4) {
        goto LABEL_17;
      }
    }
    if ([(NSCharacterSet *)self->_validFieldCharacters characterIsMember:(unsigned __int16)v4]
      || ([v3 characterIsMember:v6] & 1) != 0
      || v6 == self->_delimiter)
    {
LABEL_10:
      [(NSMutableString *)self->_sanitizedField appendFormat:@"%C", v6];
    }
    else
    {
      if (v6 != 34 || [(CHCSVParser *)self _peekPeekCharacter] != 34) {
        goto LABEL_17;
      }
      [(NSMutableString *)self->_sanitizedField appendFormat:@"%C", 34];
      [(CHCSVParser *)self _advance];
    }
    [(CHCSVParser *)self _advance];
    char v5 = 0;
    goto LABEL_12;
  }
LABEL_17:
  int v7 = [(CHCSVParser *)self _peekCharacter];
  if (v7 == 34) {
    [(CHCSVParser *)self _advance];
  }

  return v7 == 34;
}

- (BOOL)_parseUnescapedField
{
  id v3 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  int v4 = [(CHCSVParser *)self _peekCharacter];
  if (v4)
  {
    char v5 = 0;
    while (1)
    {
      uint64_t v6 = (unsigned __int16)v4;
      if (v5) {
        goto LABEL_9;
      }
      if ((unsigned __int16)v4 != 92 || !self->_recognizesBackslashesAsEscapes) {
        break;
      }
      [(CHCSVParser *)self _advance];
      char v5 = 1;
LABEL_10:
      int v4 = [(CHCSVParser *)self _peekCharacter];
      if (!v4) {
        goto LABEL_11;
      }
    }
    if (([v3 characterIsMember:(unsigned __int16)v4] & 1) != 0 || v6 == self->_delimiter) {
      goto LABEL_11;
    }
LABEL_9:
    [(NSMutableString *)self->_sanitizedField appendFormat:@"%C", v6];
    [(CHCSVParser *)self _advance];
    char v5 = 0;
    goto LABEL_10;
  }
LABEL_11:

  return 1;
}

- (BOOL)_parseDelimiter
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CHCSVParser *)self _peekCharacter];
  uint64_t v4 = v3;
  int delimiter = self->_delimiter;
  if (v3 == delimiter)
  {
    [(CHCSVParser *)self _advance];
  }
  else if (v3)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    char v7 = [v6 characterIsMember:v4];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Unexpected delimiter. Expected '%C' (0x%X), but got '%C' (0x%X)", self->_delimiter, self->_delimiter, -[CHCSVParser _peekCharacter](self, "_peekCharacter"), -[CHCSVParser _peekCharacter](self, "_peekCharacter")];
      id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = *MEMORY[0x1E4F28568];
      v15[0] = v8;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      uint64_t v11 = (NSError *)[v9 initWithDomain:@"com.davedelong.csv" code:1 userInfo:v10];
      error = self->_error;
      self->_error = v11;
    }
  }
  return v4 == delimiter;
}

- (void)_beginDocument
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(CHCSVParserDelegate *)delegate parserDidBeginDocument:self];
  }
}

- (void)_endDocument
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(CHCSVParserDelegate *)delegate parserDidEndDocument:self];
  }
}

- (void)_beginRecord
{
  if (!self->_cancelled)
  {
    self->_fieldIndex = 0;
    ++self->_currentRecord;
    if (objc_opt_respondsToSelector())
    {
      delegate = self->_delegate;
      unint64_t currentRecord = self->_currentRecord;
      [(CHCSVParserDelegate *)delegate parser:self didBeginLine:currentRecord];
    }
  }
}

- (void)_endRecord
{
  if (!self->_cancelled && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    unint64_t currentRecord = self->_currentRecord;
    [(CHCSVParserDelegate *)delegate parser:self didEndLine:currentRecord];
  }
}

- (void)_beginField
{
  if (!self->_cancelled)
  {
    [(NSMutableString *)self->_sanitizedField setString:&stru_1EFBE3CF8];
    self->_fieldRange.location = self->_nextIndex;
  }
}

- (void)_endField
{
  if (!self->_cancelled)
  {
    self->_fieldRange.length = self->_nextIndex - self->_fieldRange.location;
    if (self->_sanitizesFields)
    {
      id v6 = (id)[(NSMutableString *)self->_sanitizedField copy];
    }
    else
    {
      -[NSMutableString substringWithRange:](self->_string, "substringWithRange:");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      if (self->_trimsWhitespace)
      {
        uint64_t v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        uint64_t v4 = [v6 stringByTrimmingCharactersInSet:v3];

        id v6 = (id)v4;
      }
    }
    if (objc_opt_respondsToSelector()) {
      [(CHCSVParserDelegate *)self->_delegate parser:self didReadField:v6 atIndex:self->_fieldIndex];
    }
    -[NSMutableString replaceCharactersInRange:withString:](self->_string, "replaceCharactersInRange:withString:", 0, self->_fieldRange.length + self->_fieldRange.location, &stru_1EFBE3CF8);
    int64_t v5 = self->_fieldIndex + 1;
    self->_unint64_t nextIndex = 0;
    self->_fieldIndex = v5;
  }
}

- (void)_beginComment
{
  if (!self->_cancelled) {
    self->_fieldRange.location = self->_nextIndex;
  }
}

- (void)_endComment
{
  if (!self->_cancelled)
  {
    self->_fieldRange.length = self->_nextIndex - self->_fieldRange.location;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = -[NSMutableString substringWithRange:](self->_string, "substringWithRange:", self->_fieldRange.location, self->_fieldRange.length);
      [(CHCSVParserDelegate *)self->_delegate parser:self didReadComment:v3];
    }
    -[NSMutableString replaceCharactersInRange:withString:](self->_string, "replaceCharactersInRange:withString:", 0, self->_fieldRange.length + self->_fieldRange.location, &stru_1EFBE3CF8);
    self->_unint64_t nextIndex = 0;
  }
}

- (void)_error
{
  if (!self->_cancelled && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    error = self->_error;
    [(CHCSVParserDelegate *)delegate parser:self didFailWithError:error];
  }
}

- (CHCSVParserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CHCSVParserDelegate *)a3;
}

- (BOOL)sanitizesFields
{
  return self->_sanitizesFields;
}

- (void)setSanitizesFields:(BOOL)a3
{
  self->_sanitizesFields = a3;
}

- (BOOL)trimsWhitespace
{
  return self->_trimsWhitespace;
}

- (void)setTrimsWhitespace:(BOOL)a3
{
  self->_trimsWhitespace = a3;
}

- (BOOL)recognizesBackslashesAsEscapes
{
  return self->_recognizesBackslashesAsEscapes;
}

- (BOOL)recognizesComments
{
  return self->_recognizesComments;
}

- (BOOL)recognizesLeadingEqualSign
{
  return self->_recognizesLeadingEqualSign;
}

- (unint64_t)totalBytesRead
{
  return self->_totalBytesRead;
}

- (void)setTotalBytesRead:(unint64_t)a3
{
  self->_totalBytesRead = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sanitizedField, 0);
  objc_storeStrong((id *)&self->_validFieldCharacters, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_stringBuffer, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (CHCSVParser)initWithContentsOfCSVFile:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  int64_t v5 = [(CHCSVParser *)self initWithContentsOfCSVURL:v4];

  return v5;
}

- (CHCSVParser)initWithContentsOfCSVFile:(id)a3 delimiter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  char v7 = [(CHCSVParser *)self initWithContentsOfDelimitedURL:v6 delimiter:v4];

  return v7;
}

@end
@interface CHCSVWriter
- (CHCSVWriter)initWithOutputStream:(id)a3 encoding:(unint64_t)a4 delimiter:(unsigned __int16)a5;
- (id)initForWritingToCSVFile:(id)a3;
- (void)_finishLineIfNecessary;
- (void)_writeData:(id)a3;
- (void)_writeDelimiter;
- (void)_writeString:(id)a3;
- (void)closeStream;
- (void)dealloc;
- (void)finishLine;
- (void)writeComment:(id)a3;
- (void)writeField:(id)a3;
- (void)writeLineOfFields:(id)a3;
- (void)writeLineWithDictionary:(id)a3;
@end

@implementation CHCSVWriter

- (id)initForWritingToCSVFile:(id)a3
{
  v4 = [MEMORY[0x1E4F1CAA8] outputStreamToFileAtPath:a3 append:0];
  v5 = [(CHCSVWriter *)self initWithOutputStream:v4 encoding:4 delimiter:44];

  return v5;
}

- (CHCSVWriter)initWithOutputStream:(id)a3 encoding:(unint64_t)a4 delimiter:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  id v9 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CHCSVWriter;
  v10 = [(CHCSVWriter *)&v28 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_stream, a3);
    v11->_streamEncoding = a4;
    if (![(NSOutputStream *)v11->_stream streamStatus]) {
      [(NSOutputStream *)v11->_stream open];
    }
    v12 = [@"a" dataUsingEncoding:v11->_streamEncoding];
    v13 = [@"aa" dataUsingEncoding:v11->_streamEncoding];
    uint64_t v14 = [v12 length];
    if ([v13 length] != 2 * v14)
    {
      uint64_t v15 = objc_msgSend(v12, "subdataWithRange:", 0, objc_msgSend(v12, "length") - objc_msgSend(v13, "length") + objc_msgSend(v12, "length"));
      bom = v11->_bom;
      v11->_bom = (NSData *)v15;

      [(CHCSVWriter *)v11 _writeData:v11->_bom];
    }
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v5);
    v18 = [v17 dataUsingEncoding:v11->_streamEncoding];
    if ([(NSData *)v11->_bom length])
    {
      objc_msgSend(v18, "subdataWithRange:", -[NSData length](v11->_bom, "length"), objc_msgSend(v18, "length") - -[NSData length](v11->_bom, "length"));
      v19 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = v18;
    }
    delimiter = v11->_delimiter;
    v11->_delimiter = v19;

    v21 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    v22 = (void *)[v21 mutableCopy];

    [v22 addCharactersInString:v17];
    [v22 addCharactersInString:@"\""];
    uint64_t v23 = [v22 copy];
    illegalCharacters = v11->_illegalCharacters;
    v11->_illegalCharacters = (NSCharacterSet *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
    firstLineKeys = v11->_firstLineKeys;
    v11->_firstLineKeys = (NSMutableArray *)v25;
  }
  return v11;
}

- (void)dealloc
{
  [(CHCSVWriter *)self closeStream];
  v3.receiver = self;
  v3.super_class = (Class)CHCSVWriter;
  [(CHCSVWriter *)&v3 dealloc];
}

- (void)_writeData:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    id v4 = v5;
    -[NSOutputStream write:maxLength:](self->_stream, "write:maxLength:", [v4 bytes], objc_msgSend(v4, "length"));
  }
}

- (void)_writeString:(id)a3
{
  id v6 = [a3 dataUsingEncoding:self->_streamEncoding];
  if ([(NSData *)self->_bom length])
  {
    uint64_t v4 = objc_msgSend(v6, "subdataWithRange:", -[NSData length](self->_bom, "length"), objc_msgSend(v6, "length") - -[NSData length](self->_bom, "length"));

    id v5 = (id)v4;
  }
  else
  {
    id v5 = v6;
  }
  id v7 = v5;
  [(CHCSVWriter *)self _writeData:v5];
}

- (void)_writeDelimiter
{
}

- (void)writeField:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_currentField)
  {
    [(CHCSVWriter *)self _writeDelimiter];
    id v4 = v7;
  }
  if (self->_currentLine)
  {
    if (v4)
    {
LABEL_5:
      id v5 = [v4 description];
      goto LABEL_8;
    }
  }
  else
  {
    [(NSMutableArray *)self->_firstLineKeys addObject:v7];
    id v4 = v7;
    if (v7) {
      goto LABEL_5;
    }
  }
  id v5 = &stru_1EFBE3CF8;
LABEL_8:
  if ([(__CFString *)v5 rangeOfCharacterFromSet:self->_illegalCharacters] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(__CFString *)v5 stringByReplacingOccurrencesOfString:@"\" withString:@"\"\"];

    id v5 = [NSString stringWithFormat:@"\"%@\"", v6];
  }
  [(CHCSVWriter *)self _writeString:v5];
  ++self->_currentField;
}

- (void)finishLine
{
  self->_currentField = 0;
}

- (void)_finishLineIfNecessary
{
  if (self->_currentField) {
    [(CHCSVWriter *)self finishLine];
  }
}

- (void)writeLineOfFields:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CHCSVWriter *)self _finishLineIfNecessary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CHCSVWriter writeField:](self, "writeField:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(CHCSVWriter *)self finishLine];
}

- (void)writeLineWithDictionary:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_currentLine) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Cannot write a dictionary unless a line of keys has already been given"];
  }
  [(CHCSVWriter *)self _finishLineIfNecessary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_firstLineKeys;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        [(CHCSVWriter *)self writeField:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(CHCSVWriter *)self finishLine];
}

- (void)writeComment:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CHCSVWriter *)self _finishLineIfNecessary];
  id v5 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [NSString stringWithFormat:@"#%@\n", *(void *)(*((void *)&v13 + 1) + 8 * v11)];
        [(CHCSVWriter *)self _writeString:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)closeStream
{
  [(NSOutputStream *)self->_stream close];
  stream = self->_stream;
  self->_stream = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstLineKeys, 0);
  objc_storeStrong((id *)&self->_illegalCharacters, 0);
  objc_storeStrong((id *)&self->_bom, 0);
  objc_storeStrong((id *)&self->_delimiter, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
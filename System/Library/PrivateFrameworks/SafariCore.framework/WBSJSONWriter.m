@interface WBSJSONWriter
+ (void)initialize;
- (BOOL)_checkCurrentState:(id)a3 doesNotContainKey:(id)a4 error:(id *)a5;
- (BOOL)_checkHasNoRootWithError:(id *)a3;
- (BOOL)_writeBuffer:(const char *)a3 length:(int64_t)a4 error:(id *)a5;
- (BOOL)_writeCommaIfNeededForState:(id)a3 error:(id *)a4;
- (BOOL)_writeConstantASCIIString:(const char *)a3 error:(id *)a4;
- (BOOL)_writeData:(id)a3 error:(id *)a4;
- (BOOL)_writeObjectKey:(id)a3 error:(id *)a4;
- (BOOL)_writePrettyPrintedData:(id)a3 forEntry:(id)a4 error:(id *)a5;
- (BOOL)_writeString:(id)a3 error:(id *)a4;
- (BOOL)addEntry:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)appendAndBeginArrayWithError:(id *)a3;
- (BOOL)appendAndBeginObjectWithError:(id *)a3;
- (BOOL)appendEntry:(id)a3 error:(id *)a4;
- (BOOL)beginArrayForKey:(id)a3 error:(id *)a4;
- (BOOL)beginArrayWithError:(id *)a3;
- (BOOL)beginObjectForKey:(id)a3 error:(id *)a4;
- (BOOL)beginObjectWithError:(id *)a3;
- (BOOL)closeCurrentEntryWithError:(id *)a3;
- (BOOL)finishEncodingWithError:(id *)a3;
- (NSFileHandle)fileHandle;
- (NSOutputStream)outputStream;
- (WBSJSONWriter)initWithFileHandle:(id)a3;
- (WBSJSONWriter)initWithFileHandle:(id)a3 options:(unint64_t)a4;
- (WBSJSONWriter)initWithOutputStream:(id)a3;
- (WBSJSONWriter)initWithOutputStream:(id)a3 options:(unint64_t)a4;
- (id)_currentEntryStateOfKind:(int64_t)a3 error:(id *)a4;
- (id)_dataForJSONObject:(id)a3 error:(id *)a4;
- (id)_prefixStringForCurrentDepth;
- (int64_t)currentDepth;
- (int64_t)currentEntryKind;
- (unint64_t)options;
@end

@implementation WBSJSONWriter

+ (void)initialize
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:"\n" length:1 freeWhenDone:0];
  v3 = (void *)newLineData;
  newLineData = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:"null" length:4 freeWhenDone:0];
  v5 = (void *)nullLiteralData;
  nullLiteralData = v4;
}

- (WBSJSONWriter)initWithOutputStream:(id)a3
{
  return [(WBSJSONWriter *)self initWithOutputStream:a3 options:0];
}

- (WBSJSONWriter)initWithOutputStream:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSJSONWriter;
  v8 = [(WBSJSONWriter *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_outputStream, a3);
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    stateStack = v9->_stateStack;
    v9->_stateStack = (NSMutableArray *)v10;

    v9->_options = a4;
    v12 = v9;
  }

  return v9;
}

- (WBSJSONWriter)initWithFileHandle:(id)a3
{
  return [(WBSJSONWriter *)self initWithFileHandle:a3 options:0];
}

- (WBSJSONWriter)initWithFileHandle:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSJSONWriter;
  v8 = [(WBSJSONWriter *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fileHandle, a3);
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    stateStack = v9->_stateStack;
    v9->_stateStack = (NSMutableArray *)v10;

    v9->_options = a4;
    v12 = v9;
  }

  return v9;
}

- (int64_t)currentDepth
{
  return [(NSMutableArray *)self->_stateStack count];
}

- (int64_t)currentEntryKind
{
  if (![(NSMutableArray *)self->_stateStack count])
  {
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"No entry" userInfo:0];
    objc_exception_throw(v6);
  }
  v3 = [(NSMutableArray *)self->_stateStack lastObject];
  int64_t v4 = [v3 kind];

  return v4;
}

- (BOOL)beginObjectWithError:(id *)a3
{
  BOOL v5 = -[WBSJSONWriter _checkHasNoRootWithError:](self, "_checkHasNoRootWithError:");
  if (v5)
  {
    BOOL v5 = [(WBSJSONWriter *)self _writeConstantASCIIString:"{" error:a3];
    if (v5)
    {
      stateStack = self->_stateStack;
      id v7 = [[_WBSJSONEntryState alloc] initWithKind:0];
      [(NSMutableArray *)stateStack addObject:v7];

      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)addEntry:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(WBSJSONWriter *)self _currentEntryStateOfKind:0 error:a5];
  if (v10
    && [(WBSJSONWriter *)self _checkCurrentState:v10 doesNotContainKey:v9 error:a5])
  {
    v11 = [(WBSJSONWriter *)self _dataForJSONObject:v8 error:a5];
    if (v11 && [(WBSJSONWriter *)self _writeCommaIfNeededForState:v10 error:a5])
    {
      if (self->_options)
      {
        if ([(WBSJSONWriter *)self _writeConstantASCIIString:"\n" error:a5])
        {
          v13 = [(WBSJSONWriter *)self _prefixStringForCurrentDepth];
          if ([(WBSJSONWriter *)self _writeString:v13 error:a5]
            && [(WBSJSONWriter *)self _writeObjectKey:v9 error:a5]
            && [(WBSJSONWriter *)self _writeConstantASCIIString:" : " error:a5])
          {
            [v10 addKey:v9];
            BOOL v12 = [(WBSJSONWriter *)self _writePrettyPrintedData:v11 forEntry:v8 error:a5];
          }
          else
          {
            BOOL v12 = 0;
          }

          goto LABEL_16;
        }
      }
      else if ([(WBSJSONWriter *)self _writeObjectKey:v9 error:a5] {
             && [(WBSJSONWriter *)self _writeConstantASCIIString:":" error:a5])
      }
      {
        [v10 addKey:v9];
        BOOL v12 = [(WBSJSONWriter *)self _writeData:v11 error:a5];
LABEL_16:

        goto LABEL_17;
      }
    }
    BOOL v12 = 0;
    goto LABEL_16;
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)beginObjectForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(WBSJSONWriter *)self _currentEntryStateOfKind:0 error:a4];
  if (v7
    && [(WBSJSONWriter *)self _checkCurrentState:v7 doesNotContainKey:v6 error:a4]&& [(WBSJSONWriter *)self _writeCommaIfNeededForState:v7 error:a4])
  {
    if (self->_options)
    {
      objc_msgSend(@"\n", "stringByPaddingToLength:withString:startingAtIndex:", (2 * -[WBSJSONWriter currentDepth](self, "currentDepth")) | 1, @" ", 0);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (![(WBSJSONWriter *)self _writeString:v8 error:a4]) {
        goto LABEL_15;
      }
    }
    else
    {
      id v8 = &stru_1F105D3F0;
    }
    if ([(WBSJSONWriter *)self _writeObjectKey:v6 error:a4])
    {
      v11 = (self->_options & 1) != 0 ? " : {" : ":{";
      if ([(WBSJSONWriter *)self _writeConstantASCIIString:v11 error:a4])
      {
        [v7 addKey:v6];
        stateStack = self->_stateStack;
        v13 = [[_WBSJSONEntryState alloc] initWithKind:0];
        [(NSMutableArray *)stateStack addObject:v13];

        BOOL v9 = 1;
LABEL_16:

        goto LABEL_7;
      }
    }
LABEL_15:
    BOOL v9 = 0;
    goto LABEL_16;
  }
  BOOL v9 = 0;
LABEL_7:

  return v9;
}

- (BOOL)beginArrayForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(WBSJSONWriter *)self _currentEntryStateOfKind:0 error:a4];
  if (v7
    && [(WBSJSONWriter *)self _checkCurrentState:v7 doesNotContainKey:v6 error:a4]&& [(WBSJSONWriter *)self _writeCommaIfNeededForState:v7 error:a4]&& ((self->_options & 1) == 0|| [(WBSJSONWriter *)self _writeConstantASCIIString:"\n" error:a4]&& ([(WBSJSONWriter *)self _prefixStringForCurrentDepth], v12 = objc_claimAutoreleasedReturnValue(), v13 = [(WBSJSONWriter *)self _writeString:v12 error:a4], v12, v13))&& [(WBSJSONWriter *)self _writeObjectKey:v6 error:a4]&& ((self->_options & 1) != 0 ? (id v8 = " : [") : (id v8 = ":["), [(WBSJSONWriter *)self _writeConstantASCIIString:v8 error:a4]))
  {
    [v7 addKey:v6];
    stateStack = self->_stateStack;
    BOOL v10 = 1;
    v11 = [[_WBSJSONEntryState alloc] initWithKind:1];
    [(NSMutableArray *)stateStack addObject:v11];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)beginArrayWithError:(id *)a3
{
  if (!-[WBSJSONWriter _checkHasNoRootWithError:](self, "_checkHasNoRootWithError:")
    || ![(WBSJSONWriter *)self _writeConstantASCIIString:"[" error:a3])
  {
    return 0;
  }
  stateStack = self->_stateStack;
  BOOL v6 = 1;
  id v7 = [[_WBSJSONEntryState alloc] initWithKind:1];
  [(NSMutableArray *)stateStack addObject:v7];

  return v6;
}

- (BOOL)appendEntry:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(WBSJSONWriter *)self _currentEntryStateOfKind:1 error:a4];
  if (v7)
  {
    id v8 = [(WBSJSONWriter *)self _dataForJSONObject:v6 error:a4];
    if (v8 && [(WBSJSONWriter *)self _writeCommaIfNeededForState:v7 error:a4])
    {
      if ((self->_options & 1) == 0)
      {
        [v7 addEntry];
        BOOL v9 = [(WBSJSONWriter *)self _writeData:v8 error:a4];
LABEL_9:
        BOOL v10 = v9;
LABEL_11:

        goto LABEL_12;
      }
      v11 = NSString;
      BOOL v12 = [(WBSJSONWriter *)self _prefixStringForCurrentDepth];
      BOOL v13 = [v11 stringWithFormat:@"\n%@", v12];
      BOOL v14 = [(WBSJSONWriter *)self _writeString:v13 error:a4];

      if (v14)
      {
        [v7 addEntry];
        BOOL v9 = [(WBSJSONWriter *)self _writePrettyPrintedData:v8 forEntry:v6 error:a4];
        goto LABEL_9;
      }
    }
    BOOL v10 = 0;
    goto LABEL_11;
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)appendAndBeginObjectWithError:(id *)a3
{
  BOOL v5 = [(WBSJSONWriter *)self _currentEntryStateOfKind:1 error:a3];
  if (v5
    && [(WBSJSONWriter *)self _writeCommaIfNeededForState:v5 error:a3]
    && ((self->_options & 1) == 0
     || [(WBSJSONWriter *)self _writeConstantASCIIString:"\n" error:a3]
     && ([(WBSJSONWriter *)self _prefixStringForCurrentDepth],
         id v6 = objc_claimAutoreleasedReturnValue(),
         BOOL v7 = [(WBSJSONWriter *)self _writeString:v6 error:a3],
         v6,
         v7))
    && [(WBSJSONWriter *)self _writeConstantASCIIString:"{" error:a3])
  {
    [v5 addEntry];
    stateStack = self->_stateStack;
    BOOL v9 = [[_WBSJSONEntryState alloc] initWithKind:0];
    [(NSMutableArray *)stateStack addObject:v9];

    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)appendAndBeginArrayWithError:(id *)a3
{
  BOOL v5 = [(WBSJSONWriter *)self _currentEntryStateOfKind:1 error:a3];
  if (v5
    && [(WBSJSONWriter *)self _writeCommaIfNeededForState:v5 error:a3]
    && ((self->_options & 1) == 0
     || [(WBSJSONWriter *)self _writeConstantASCIIString:"\n" error:a3]
     && ([(WBSJSONWriter *)self _prefixStringForCurrentDepth],
         id v6 = objc_claimAutoreleasedReturnValue(),
         BOOL v7 = [(WBSJSONWriter *)self _writeString:v6 error:a3],
         v6,
         v7))
    && [(WBSJSONWriter *)self _writeConstantASCIIString:"[" error:a3])
  {
    [v5 addEntry];
    stateStack = self->_stateStack;
    BOOL v9 = 1;
    BOOL v10 = [[_WBSJSONEntryState alloc] initWithKind:1];
    [(NSMutableArray *)stateStack addObject:v10];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)closeCurrentEntryWithError:(id *)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(NSMutableArray *)self->_stateStack lastObject];
  id v6 = v5;
  if (v5)
  {
    if (self->_options)
    {
      if (![v5 numberOfEntries]
        && ![(WBSJSONWriter *)self _writeConstantASCIIString:"\n" error:a3])
      {
        goto LABEL_16;
      }
      if (![(WBSJSONWriter *)self _writeConstantASCIIString:"\n" error:a3]) {
        goto LABEL_16;
      }
      [(NSMutableArray *)self->_stateStack removeLastObject];
      v11 = [(WBSJSONWriter *)self _prefixStringForCurrentDepth];
      [(NSMutableArray *)self->_stateStack addObject:v6];
      BOOL v12 = [(WBSJSONWriter *)self _writeString:v11 error:a3];

      if (!v12) {
        goto LABEL_16;
      }
    }
    uint64_t v7 = [v6 kind];
    if (v7)
    {
      if (v7 == 1
        && ![(WBSJSONWriter *)self _writeConstantASCIIString:"]" error:a3])
      {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    if ([(WBSJSONWriter *)self _writeConstantASCIIString:"}" error:a3])
    {
LABEL_15:
      [(NSMutableArray *)self->_stateStack removeLastObject];
      LOBYTE(a3) = 1;
      goto LABEL_17;
    }
LABEL_16:
    LOBYTE(a3) = 0;
    goto LABEL_17;
  }
  if (a3)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F285A0];
    v14[0] = *MEMORY[0x1E4F28568];
    v14[1] = v9;
    v15[0] = @"JSON serialization was not started";
    v15[1] = @"Call -beginObjectWithError: or -beginArrayWithError: first.";
    BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    *a3 = [v8 errorWithDomain:@"com.apple.Safari.Core.WBSJSONWriterErrorDomain" code:1 userInfo:v10];

    goto LABEL_16;
  }
LABEL_17:

  return (char)a3;
}

- (BOOL)finishEncodingWithError:(id *)a3
{
  do
    BOOL v5 = [(WBSJSONWriter *)self closeCurrentEntryWithError:a3];
  while (v5 && [(NSMutableArray *)self->_stateStack count]);
  return v5;
}

- (BOOL)_checkHasNoRootWithError:(id *)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(NSMutableArray *)self->_stateStack count];
  uint64_t v5 = v4;
  if (a3 && v4)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @"JSON serialization has already started";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    *a3 = [v6 errorWithDomain:@"com.apple.Safari.Core.WBSJSONWriterErrorDomain" code:2 userInfo:v7];
  }
  return v5 == 0;
}

- (BOOL)_checkCurrentState:(id)a3 doesNotContainKey:(id)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int v8 = [a3 containsKey:v7];
  char v9 = v8;
  if (a5 && v8)
  {
    BOOL v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = [NSString stringWithFormat:@"Key '%@' was already added to the current object", v7, *MEMORY[0x1E4F28568]];
    v15[0] = v11;
    BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a5 = [v10 errorWithDomain:@"com.apple.Safari.Core.WBSJSONWriterErrorDomain" code:5 userInfo:v12];
  }
  return v9 ^ 1;
}

- (id)_currentEntryStateOfKind:(int64_t)a3 error:(id *)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = [(NSMutableArray *)self->_stateStack lastObject];
  id v7 = v6;
  if (!v6)
  {
    if (!a4) {
      goto LABEL_13;
    }
    int v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F285A0];
    v22[0] = *MEMORY[0x1E4F28568];
    v22[1] = v9;
    v23[0] = @"JSON serialization was not started";
    v23[1] = @"Call -beginObjectWithError: or -beginArrayWithError: first.";
    BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    v11 = v8;
    uint64_t v12 = 1;
    goto LABEL_11;
  }
  if ([v6 kind] == a3)
  {
    a4 = v7;
    goto LABEL_13;
  }
  if (a4)
  {
    if (a3)
    {
      if (a3 != 1)
      {
LABEL_12:
        a4 = 0;
        goto LABEL_13;
      }
      BOOL v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F285A0];
      v20[0] = *MEMORY[0x1E4F28568];
      v20[1] = v14;
      v21[0] = @"Expecting an object entry and got an array entry";
      v21[1] = @"Call -addEntry:forKey:error: or -beginObjectForKey:error:, or -beginArrayForKey:error: instead.";
      BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      v11 = v13;
      uint64_t v12 = 4;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F285A0];
      v18[0] = *MEMORY[0x1E4F28568];
      v18[1] = v16;
      v19[0] = @"Expecting an array entry and got an object entry";
      v19[1] = @"Call -appendEntry:error: or -appendAndBeginObjectWithError:, or -appendAndBeginArrayWithError: instead.";
      BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
      v11 = v15;
      uint64_t v12 = 3;
    }
LABEL_11:
    *a4 = [v11 errorWithDomain:@"com.apple.Safari.Core.WBSJSONWriterErrorDomain" code:v12 userInfo:v10];

    goto LABEL_12;
  }
LABEL_13:

  return a4;
}

- (BOOL)_writeCommaIfNeededForState:(id)a3 error:(id *)a4
{
  if (![a3 numberOfEntries]) {
    return 1;
  }
  return -[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", ",", a4);
}

- (id)_prefixStringForCurrentDepth
{
  int64_t v2 = [(WBSJSONWriter *)self currentDepth];
  if (v2)
  {
    CFIndex v3 = 2 * v2;
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2 * v2);
    CFStringPad(Mutable, @" ", v3, 0);
  }
  else
  {
    Mutable = &stru_1F105D3F0;
  }
  return Mutable;
}

- (BOOL)_writePrettyPrintedData:(id)a3 forEntry:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(WBSJSONWriter *)self _prefixStringForCurrentDepth];
  if (objc_opt_respondsToSelector())
  {
    if ([v9 count])
    {
      uint64_t v11 = [v8 length];
      if (v11)
      {
        uint64_t v12 = 0;
        while (1)
        {
          uint64_t v13 = objc_msgSend(v8, "rangeOfData:options:range:", newLineData, 0, v12, v11);
          if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          uint64_t v15 = v13 + v14;
          uint64_t v16 = objc_msgSend(v8, "subdataWithRange:", v12, v13 + v14 - v12);
          BOOL v17 = [(WBSJSONWriter *)self _writeData:v16 error:a5];

          if (!v17 || ![(WBSJSONWriter *)self _writeString:v10 error:a5])
          {
            BOOL v19 = 0;
            goto LABEL_20;
          }
          uint64_t v18 = [v8 length];
          uint64_t v12 = v15;
          uint64_t v11 = v18 - v15;
          if (v18 == v15) {
            goto LABEL_18;
          }
        }
        uint64_t v15 = v12;
      }
      else
      {
        uint64_t v15 = 0;
      }
LABEL_18:
      v20 = objc_msgSend(v8, "subdataWithRange:", v15, v11);
      BOOL v21 = [(WBSJSONWriter *)self _writeData:v20 error:a5];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [NSString stringWithFormat:@"[\n\n%@]", v10];
      }
      else {
      v20 = [NSString stringWithFormat:@"{\n\n%@}", v10];
      }
      BOOL v21 = [(WBSJSONWriter *)self _writeString:v20 error:a5];
    }
    BOOL v19 = v21;
  }
  else
  {
    BOOL v19 = [(WBSJSONWriter *)self _writeData:v8 error:a5];
  }
LABEL_20:

  return v19;
}

- (id)_dataForJSONObject:(id)a3 error:(id *)a4
{
  v12[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1BA9BCF20]();
    unint64_t v8 = self->_options | 4;
    v12[0] = 0;
    id v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:v8 error:v12];
    id v10 = v12[0];
    if (a4) {
      *a4 = v10;
    }
  }
  else
  {
    id v9 = (id)nullLiteralData;
  }

  return v9;
}

- (BOOL)_writeObjectKey:(id)a3 error:(id *)a4
{
  id v6 = -[WBSJSONWriter _dataForJSONObject:error:](self, "_dataForJSONObject:error:", a3);
  if (v6) {
    BOOL v7 = [(WBSJSONWriter *)self _writeData:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_writeString:(id)a3 error:(id *)a4
{
  id v6 = (__CFString *)a3;
  CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
  if (CStringPtr || (CStringPtr = CFStringGetCStringPtr(v6, 0x8000100u)) != 0)
  {
    BOOL v8 = [(WBSJSONWriter *)self _writeBuffer:CStringPtr length:strlen(CStringPtr) error:a4];
  }
  else
  {
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, 0x8000100u, 0);
    BOOL v8 = [(WBSJSONWriter *)self _writeData:ExternalRepresentation error:a4];
  }
  return v8;
}

- (BOOL)_writeConstantASCIIString:(const char *)a3 error:(id *)a4
{
  size_t v7 = strlen(a3);
  return [(WBSJSONWriter *)self _writeBuffer:a3 length:v7 error:a4];
}

- (BOOL)_writeData:(id)a3 error:(id *)a4
{
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    id v6 = a3;
    BOOL v7 = [(NSFileHandle *)fileHandle writeData:v6 error:a4];

    return v7;
  }
  else
  {
    id v10 = a3;
    uint64_t v11 = [v10 bytes];
    uint64_t v12 = [v10 length];

    return [(WBSJSONWriter *)self _writeBuffer:v11 length:v12 error:a4];
  }
}

- (BOOL)_writeBuffer:(const char *)a3 length:(int64_t)a4 error:(id *)a5
{
  int64_t v6 = a4;
  BOOL v7 = a3;
  v17[1] = *MEMORY[0x1E4F143B8];
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    if (write([(NSFileHandle *)fileHandle fileDescriptor], a3, a4) == -1)
    {
      if (a5)
      {
        id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:512 userInfo:0];
        BOOL result = 0;
        *a5 = v10;
        return result;
      }
      return 0;
    }
    return 1;
  }
  if (!a4) {
    return 1;
  }
  while ([(NSOutputStream *)self->_outputStream hasSpaceAvailable])
  {
    NSInteger v12 = [(NSOutputStream *)self->_outputStream write:v7 maxLength:v6];
    v7 += v12;
    v6 -= v12;
    if (!v6) {
      return 1;
    }
  }
  if (a5)
  {
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"Cannot write more data to the output stream";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v14 = (void *)[v13 mutableCopy];

    uint64_t v15 = [(NSOutputStream *)self->_outputStream streamError];
    [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F28A50]];

    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Safari.Core.WBSJSONWriterErrorDomain" code:6 userInfo:v14];
  }
  return 0;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateStack, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
}

@end
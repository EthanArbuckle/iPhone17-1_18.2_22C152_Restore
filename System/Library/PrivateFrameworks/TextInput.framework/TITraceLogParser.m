@interface TITraceLogParser
- (BOOL)parseIntegerHeader:(id)a3 headerValue:(int64_t *)a4 withScanner:(id)a5;
- (BOOL)parseStringHeader:(id)a3 headerValue:(id *)a4 withScanner:(id)a5;
- (TITraceLogParsingDelegate)delegate;
- (id)convertStringToContext:(id)a3;
- (id)extractBeamSearchContextStringFromLogText:(id)a3;
- (id)parseTraceLogContextFromLogText:(id)a3 andPriorContext:(id)a4;
- (id)parseTraceRecordWithScanner:(id)a3 andPriorContext:(id)a4;
- (unint64_t)version;
- (void)parseTraceLogContent:(id)a3;
- (void)parseTraceLogHeaderWithScanner:(id)a3;
- (void)parseTraceRecordsWithScanner:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation TITraceLogParser

- (void).cxx_destruct
{
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setDelegate:(id)a3
{
}

- (TITraceLogParsingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TITraceLogParsingDelegate *)WeakRetained;
}

- (id)parseTraceRecordWithScanner:(id)a3 andPriorContext:(id)a4
{
  id v6 = a4;
  id v18 = 0;
  id v7 = a3;
  [v7 scanUpToString:@"\n\n" intoString:&v18];
  id v8 = v18;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
  [v7 scanString:@"\n\n" intoString:0];
  id v17 = 0;
  [v7 scanUpToString:@"RECORD ID: " intoString:&v17];

  id v10 = v17;
  if ([v10 length])
  {
    uint64_t v11 = objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "length") - 1);

    id v10 = (id)v11;
  }
  v12 = [(TITraceLogParser *)self parseTraceLogContextFromLogText:v10 andPriorContext:v6];
  v13 = [[TITraceLogRecord alloc] initWithRecordUUID:v9 context:v12 logText:v10 logVersion:[(TITraceLogParser *)self version]];
  v14 = [(TITraceLogParser *)self delegate];

  if (v14)
  {
    v15 = [(TITraceLogParser *)self delegate];
    [v15 traceRecordParsed:v13];
  }

  return v12;
}

- (id)parseTraceLogContextFromLogText:(id)a3 andPriorContext:(id)a4
{
  id v6 = a4;
  id v7 = [(TITraceLogParser *)self extractBeamSearchContextStringFromLogText:a3];
  if (!v7
    || ([(TITraceLogParser *)self convertStringToContext:v7],
        (id v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = v6;
  }

  return v8;
}

- (id)convertStringToContext:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"CONTEXT: "])
  {
    v4 = objc_msgSend(v3, "componentsSeparatedByString:", @"(");
    v5 = (void *)MEMORY[0x1E4F28FE8];
    id v6 = [v4 objectAtIndexedSubscript:0];
    id v7 = [v5 scannerWithString:v6];

    [v7 scanString:@"CONTEXT: " intoString:0];
    id v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\n"]);
    v9 = (void *)MEMORY[0x1E4F28FE8];
    id v10 = [v4 objectAtIndexedSubscript:1];
    uint64_t v11 = [v10 stringByTrimmingCharactersInSet:v8];
    v12 = [v9 scannerWithString:v11];

    v13 = [MEMORY[0x1E4F1CA48] array];
    if (([v7 isAtEnd] & 1) == 0)
    {
      v21 = v8;
      v22 = v4;
      v14 = 0;
      v15 = 0;
      while ((objc_msgSend(v12, "isAtEnd", v21, v22) & 1) == 0)
      {
        id v24 = v15;
        [v7 scanUpToString:@" " intoString:&v24];
        id v16 = v24;

        id v23 = v14;
        [v12 scanUpToString:@" " intoString:&v23];
        id v17 = v23;

        id v18 = [[TITraceLogRecordContextEntry alloc] initWithToken:v16 wordID:v17];
        [v13 addObject:v18];

        v14 = v17;
        v15 = v16;
        if ([v7 isAtEnd]) {
          goto LABEL_9;
        }
      }
      id v16 = v15;
      id v17 = v14;
LABEL_9:

      id v8 = v21;
      v4 = v22;
    }
    v19 = (void *)[v13 copy];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)extractBeamSearchContextStringFromLogText:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28FE8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithString:v4];

  id v6 = 0;
  if ([v5 scanUpToString:@"CONTEXT: " intoString:0])
  {
    id v8 = 0;
    [v5 scanUpToString:@"INPUT NODE:" intoString:&v8];
    id v6 = v8;
  }

  return v6;
}

- (void)parseTraceRecordsWithScanner:(id)a3
{
  id v6 = a3;
  [v6 scanString:@"RECORD ID: " intoString:0];
  id v4 = [MEMORY[0x1E4F1C978] array];
  if ([v6 isAtEnd])
  {
    v5 = v4;
  }
  else
  {
    do
    {
      v5 = [(TITraceLogParser *)self parseTraceRecordWithScanner:v6 andPriorContext:v4];

      [v6 scanString:@"RECORD ID: " intoString:0];
      id v4 = v5;
    }
    while (![v6 isAtEnd]);
  }
}

- (BOOL)parseIntegerHeader:(id)a3 headerValue:(int64_t *)a4 withScanner:(id)a5
{
  id v7 = a5;
  int v8 = [v7 scanString:a3 intoString:0];
  if (v8)
  {
    [v7 scanInteger:a4];
    [v7 scanString:@"\n" intoString:0];
  }

  return v8;
}

- (BOOL)parseStringHeader:(id)a3 headerValue:(id *)a4 withScanner:(id)a5
{
  id v7 = a5;
  int v8 = [v7 scanString:a3 intoString:0];
  if (v8)
  {
    [v7 scanUpToString:@"\n" intoString:a4];
    [v7 scanString:@"\n" intoString:0];
  }

  return v8;
}

- (void)parseTraceLogHeaderWithScanner:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v12 = 0;
  if ([(TITraceLogParser *)self parseIntegerHeader:@"Version: " headerValue:&v12 withScanner:v4])
  {
    [(TITraceLogParser *)self setVersion:v12];
  }
  BOOL v5 = [(TITraceLogParser *)self parseStringHeader:@"Date: " headerValue:0 withScanner:v4];
  unint64_t v6 = [(TITraceLogParser *)self version];
  uint64_t v7 = v6;
  if (v5)
  {
    if (v6 <= 1) {
      uint64_t v7 = 1;
    }
    [(TITraceLogParser *)self setVersion:v7];
    [(TITraceLogParser *)self parseStringHeader:@"iOS version: " headerValue:0 withScanner:v4];
  }
  else
  {
    [(TITraceLogParser *)self setVersion:v6];
  }
  [v4 scanUpToString:@"RECORD ID: " intoString:0];
  int v8 = [(TITraceLogParser *)self delegate];

  if (v8)
  {
    v9 = [(TITraceLogParser *)self delegate];
    v13 = @"Version";
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TITraceLogParser version](self, "version"));
    v14[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v9 traceHeaderParsed:v11];
  }
}

- (void)parseTraceLogContent:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28FE8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithString:v5];

  [v6 setCharactersToBeSkipped:0];
  [(TITraceLogParser *)self parseTraceLogHeaderWithScanner:v6];
  [(TITraceLogParser *)self parseTraceRecordsWithScanner:v6];
}

@end
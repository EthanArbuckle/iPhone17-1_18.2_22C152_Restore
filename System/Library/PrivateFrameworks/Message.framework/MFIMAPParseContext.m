@interface MFIMAPParseContext
+ (BOOL)hadWarningOrError;
+ (void)resetWarningOrError;
- (BOOL)getNumber:(unint64_t *)a3;
- (BOOL)isValid;
- (BOOL)literalWithResponseConsumer:(id)a3 section:(id)a4;
- (BOOL)match:(const char *)a3;
- (BOOL)match:(const char *)a3 upToSpecial:(const char *)a4;
- (BOOL)parseSpace;
- (MFIMAPParseContext)initWithConnection:(id)a3 response:(id)a4 start:(const char *)a5 end:(const char *)a6;
- (__CFArray)copyArrayAllowingNulls:(BOOL)a3;
- (const)end;
- (const)nextSeparator;
- (const)start;
- (id)connection;
- (id)copyAString;
- (id)copyArray;
- (id)copyAtom;
- (id)copyDateTime;
- (id)copyLiteral;
- (id)copyLiteralString;
- (id)copyMessageSet;
- (id)copyNilOrString;
- (id)copyNumber;
- (id)copyQuotedString;
- (id)copyStringFrom:(const char *)a3 to:(const char *)a4 withCaseOption:(int64_t)a5;
- (id)response;
- (unsigned)lookAhead;
- (void)dealloc;
- (void)emitError:(id)a3;
- (void)emitWarning:(id)a3;
- (void)increment;
- (void)logReadChars;
- (void)setEnd:(const char *)a3;
- (void)setStart:(const char *)a3;
@end

@implementation MFIMAPParseContext

+ (BOOL)hadWarningOrError
{
  return sHadWarningOrError;
}

+ (void)resetWarningOrError
{
  sHadWarningOrError = 0;
}

- (MFIMAPParseContext)initWithConnection:(id)a3 response:(id)a4 start:(const char *)a5 end:(const char *)a6
{
  v12.receiver = self;
  v12.super_class = (Class)MFIMAPParseContext;
  v10 = [(MFIMAPParseContext *)&v12 init];
  if (v10)
  {
    v10->_connection = (MFIMAPConnection *)a3;
    v10->_response = (MFIMAPResponse *)a4;
    v10->_start = a5;
    v10->_originalStart = a5;
    v10->_originalEnd = a6;
    v10->_end = a6;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFIMAPParseContext;
  [(MFIMAPParseContext *)&v3 dealloc];
}

- (id)connection
{
  return self->_connection;
}

- (id)response
{
  return self->_response;
}

- (const)start
{
  return self->_start;
}

- (void)setStart:(const char *)a3
{
  if (self->_originalStart > a3) {
    -[MFIMAPParseContext setStart:]();
  }
  self->_start = a3;
}

- (void)increment
{
}

- (const)end
{
  return self->_end;
}

- (void)setEnd:(const char *)a3
{
  if (self->_originalEnd < a3) {
    -[MFIMAPParseContext setEnd:]();
  }
  self->_end = a3;
}

- (BOOL)isValid
{
  return !self->_invalid;
}

- (void)emitWarning:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    response = self->_response;
    id v7 = [(MFIMAPParseContext *)self copyStringFrom:self->_start to:self->_end withCaseOption:0];
    int v8 = 138412802;
    v9 = response;
    __int16 v10 = 2112;
    id v11 = a3;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_INFO, "*** Warning while parsing %@: %@\nRemaining text: <%@>", (uint8_t *)&v8, 0x20u);
  }
  sHadWarningOrError = 1;
}

- (void)emitError:(id)a3
{
  if (![+[MFActivityMonitor currentMonitor] error])
  {
    v5 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1033 localizedDescription:&stru_1EFF11268];
    [+[MFActivityMonitor currentMonitor] setError:v5];
    -[MFError setMoreInfo:](v5, "setMoreInfo:", [NSString stringWithFormat:@"Error while parsing IMAP response %@: %@\nRemaining text: <%@>", self->_response, a3, -[MFIMAPParseContext copyStringFrom:to:withCaseOption:](self, "copyStringFrom:to:withCaseOption:", self->_start, self->_end, 0)]);
  }
  self->_invalid = 1;
  self->_end = self->_start;
  sHadWarningOrError = 1;
}

- (void)logReadChars
{
  end = self->_end;
  if (end > self->_lastLoggedChar)
  {
    [(MFConnection *)self->_connection logReadChars:self->_start length:end - self->_start];
    self->_lastLoggedChar = self->_end;
  }
}

- (id)copyAtom
{
  start = self->_start;
  end = self->_end;
  if (start >= end) {
    return 0;
  }
  uint64_t v5 = 0;
  v6 = self->_start;
  while ((start[v5] & 0x80000000) == 0)
  {
    if (((*(_DWORD *)((char *)mf_isIMAPAtom_atomicMask + (((unint64_t)start[v5] >> 3) & 0x1C)) >> start[v5]) & 1) == 0)
    {
      v6 = &start[v5];
      break;
    }
    ++v6;
    if (end - start == ++v5)
    {
      v6 = self->_end;
      break;
    }
  }
  if (v6 <= start) {
    return 0;
  }
  id result = -[MFIMAPParseContext copyStringFrom:to:withCaseOption:](self, "copyStringFrom:to:withCaseOption:");
  self->_start = v6;
  return result;
}

- (BOOL)getNumber:(unint64_t *)a3
{
  unsigned int v5 = [(MFIMAPParseContext *)self lookAhead];
  unsigned int v6 = v5 - 48;
  if (v5 - 48 <= 9)
  {
    unint64_t v7 = 0;
    uint64_t v8 = v5;
    do
    {
      unint64_t v7 = v8 + 10 * v7 - 48;
      ++self->_start;
      unsigned int v9 = [(MFIMAPParseContext *)self lookAhead];
      uint64_t v8 = v9;
    }
    while (v9 - 48 < 0xA);
    *a3 = v7;
  }
  return v6 < 0xA;
}

- (id)copyNumber
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  if (![(MFIMAPParseContext *)self getNumber:&v4]) {
    return 0;
  }
  id v2 = objc_allocWithZone(MEMORY[0x1E4F28ED0]);
  return (id)[v2 initWithUnsignedLongLong:v4];
}

- (BOOL)match:(const char *)a3
{
  size_t v5 = strlen(a3);
  start = self->_start;
  unint64_t v7 = (const char *)(self->_end - start);
  BOOL v9 = !strncasecmp(start, a3, v5) && (unint64_t)v7 >= v5;
  if (v9) {
    self->_start = &start[v5];
  }
  return v9;
}

- (BOOL)match:(const char *)a3 upToSpecial:(const char *)a4
{
  if (!a4 || &self->_start[strlen(a3)] != a4) {
    return 0;
  }
  return [(MFIMAPParseContext *)self match:a3];
}

- (id)copyLiteral
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F734A8]);
  unint64_t v4 = objc_alloc_init(MFIMAPResponseConsumer);
  [(MFIMAPResponseConsumer *)v4 addConsumer:v3 forSection:0];
  BOOL v5 = [(MFIMAPParseContext *)self literalWithResponseConsumer:v4 section:0];
  id v6 = 0;
  if (v5)
  {
    [(MFIMAPResponseConsumer *)v4 done];
    id v6 = (id)[v3 data];
  }

  return v6;
}

- (BOOL)literalWithResponseConsumer:(id)a3 section:(id)a4
{
  LODWORD(v7) = [(MFIMAPParseContext *)self match:"{"];
  if (!v7) {
    return v7;
  }
  uint64_t v8 = +[MFActivityMonitor currentMonitor];
  unint64_t v26 = 0;
  uint64_t v9 = [(MFActivityMonitor *)v8 expectedLength];
  unsigned int v10 = [(MFIMAPConnection *)self->_connection literalChunkSize];
  if ([(MFIMAPParseContext *)self getNumber:&v26])
  {
    if (![(MFIMAPParseContext *)self match:"}"])
    {
      id v11 = @"Expected right curly brace";
      goto LABEL_8;
    }
    if (![(MFIMAPParseContext *)self match:""])
    {
      id v11 = @"Expected end-of-line";
LABEL_8:
      [(MFIMAPParseContext *)self emitWarning:v11];
    }
  }
  else
  {
    [(MFIMAPParseContext *)self emitError:@"Expected number in literal"];
  }
  unint64_t v12 = v26;
  if (v26)
  {
    if (v9) {
      unint64_t v13 = v26;
    }
    else {
      unint64_t v13 = 0;
    }
    float v14 = (float)v13;
    unint64_t v15 = v26;
    while (1)
    {
      unint64_t v16 = v15 >= v10 ? v10 : v15;
      id v17 = [(MFIMAPConnection *)self->_connection _readDataOfLength:v16];
      if (!v17) {
        break;
      }
      id v18 = v17;
      unint64_t v19 = [v17 length];
      BOOL v20 = v15 == v19;
      BOOL v21 = v15 > v19;
      v15 -= v19;
      if (!v21)
      {
        if (!v20) {
          [(MFIMAPParseContext *)self emitWarning:@"Ignoring extra bytes read during literal"];
        }
        unint64_t v15 = 0;
      }
      [a3 appendData:v18 forSection:a4];
      if (v9) {
        [(MFActivityMonitor *)v8 setPercentDone:(float)((float)(v12 - v15) / v14)];
      }
      if (!v15) {
        goto LABEL_27;
      }
    }
    [(MFIMAPParseContext *)self emitError:@"Read failure"];
    [a3 done];
  }
LABEL_27:
  if (!self->_invalid)
  {
    id v22 = [(MFIMAPConnection *)self->_connection _readDataOfLength:-1];
    if (v22)
    {
      v23 = v22;
      v24 = (const char *)[v22 bytes];
      self->_originalStart = v24;
      self->_start = v24;
      uint64_t v7 = [v23 length];
      self->_originalEnd = &v24[v7];
      self->_end = &v24[v7];
      LOBYTE(v7) = 1;
      return v7;
    }
    [(MFIMAPParseContext *)self emitError:@"Read failure"];
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (id)copyLiteralString
{
  id result = [(MFIMAPParseContext *)self copyLiteral];
  if (result)
  {
    id v4 = result;
    id v5 = -[MFIMAPParseContext copyStringFrom:to:withCaseOption:](self, "copyStringFrom:to:withCaseOption:", [result bytes], objc_msgSend(v4, "bytes") + objc_msgSend(v4, "length"), 0);

    return v5;
  }
  return result;
}

- (id)copyQuotedString
{
  if ([(MFIMAPParseContext *)self match:"\""])
  {
    start = self->_start;
    end = self->_end;
    if (start >= end)
    {
      if (start <= end) {
        uint64_t v8 = self->_start;
      }
      else {
        uint64_t v8 = self->_end;
      }
    }
    else
    {
      int v5 = 0;
      id v6 = self->_start;
      do
      {
        int v7 = *(unsigned __int8 *)v6;
        if (v7 == 92)
        {
          if (v6 + 1 == end) {
            break;
          }
          v6 += 2;
          ++v5;
        }
        else
        {
          if (v7 == 34) {
            break;
          }
          ++v6;
        }
      }
      while (v6 < end);
      if (v6 <= end) {
        uint64_t v8 = v6;
      }
      else {
        uint64_t v8 = self->_end;
      }
      if (v5)
      {
        uint64_t v9 = malloc_type_malloc(v8 - &start[v5], 0x30FB3D74uLL);
        unsigned int v10 = self->_start;
        id v11 = v9;
        while (v10 < v8)
        {
          if (*v10 == 92) {
            ++v10;
          }
          char v12 = *v10++;
          *v11++ = v12;
        }
        id v13 = [(MFIMAPParseContext *)self copyStringFrom:v9 to:v11 withCaseOption:0];
        self->_start = v10;
        free(v9);
        goto LABEL_25;
      }
    }
    id v13 = -[MFIMAPParseContext copyStringFrom:to:withCaseOption:](self, "copyStringFrom:to:withCaseOption:");
    self->_start = v8;
LABEL_25:
    [(MFIMAPParseContext *)self match:"\""];
    return v13;
  }
  return 0;
}

- (id)copyNilOrString
{
  id v3 = [(MFIMAPParseContext *)self copyQuotedString];
  if (!v3)
  {
    id v3 = [(MFIMAPParseContext *)self copyLiteralString];
    if (!v3)
    {
      id v3 = [(MFIMAPParseContext *)self copyAtom];
      if (![v3 caseInsensitiveCompare:@"NIL"])
      {

        return 0;
      }
    }
  }
  return v3;
}

- (id)copyAString
{
  id result = [(MFIMAPParseContext *)self copyAtom];
  if (!result)
  {
    id result = [(MFIMAPParseContext *)self copyQuotedString];
    if (!result)
    {
      return [(MFIMAPParseContext *)self copyLiteralString];
    }
  }
  return result;
}

- (id)copyDateTime
{
  id result = [(MFIMAPParseContext *)self copyQuotedString];
  if (result)
  {
    id v3 = result;
    pthread_mutex_lock(&copyDateTime___dateFormatterLock);
    id v4 = (void *)copyDateTime___dateFormatter;
    if (!copyDateTime___dateFormatter)
    {
      copyDateTime___dateFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28C10]);
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA20], "ef_posixLocale");
      [(id)copyDateTime___dateFormatter setLocale:v5];
      [(id)copyDateTime___dateFormatter setDateFormat:@"d-MMM-yyyy H:mm:ss ZZZ"];
      id v4 = (void *)copyDateTime___dateFormatter;
    }
    id v6 = (id)[v4 dateFromString:v3];
    pthread_mutex_unlock(&copyDateTime___dateFormatterLock);

    return v6;
  }
  return result;
}

- (__CFArray)copyArrayAllowingNulls:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(MFIMAPParseContext *)self match:"(")]
    return 0;
  if (v3) {
    uint64_t v5 = (const CFArrayCallBacks *)&kNullOrCFTypeArrayCallBacks;
  }
  else {
    uint64_t v5 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  }
  Mutable = CFArrayCreateMutable(0, 0, v5);
  if (![(MFIMAPParseContext *)self match:"]"))
  {
    do
    {
      int v7 = [(MFIMAPParseContext *)self copyArrayAllowingNulls:v3];
      if (!v7)
      {
        int v7 = [(MFIMAPParseContext *)self copyNumber];
        if (!v7)
        {
          uint64_t v8 = [(MFIMAPParseContext *)self copyAtom];
          if (v8)
          {
            int v7 = v8;
            if (v3 && ![(__CFArray *)v8 caseInsensitiveCompare:@"NIL"])
            {

              int v7 = 0;
            }
          }
          else
          {
            int v7 = [(MFIMAPParseContext *)self copyQuotedString];
            if (!v7)
            {
              int v7 = [(MFIMAPParseContext *)self copyLiteralString];
              if (!v7)
              {
                [(MFIMAPParseContext *)self emitWarning:@"Can't parse array contents"];
                return Mutable;
              }
            }
          }
        }
      }
      [(MFIMAPParseContext *)self parseSpace];
      CFArrayAppendValue(Mutable, v7);
      if (v7) {
    }
      }
    while (![(MFIMAPParseContext *)self match:"]"));
  }
  return Mutable;
}

- (id)copyArray
{
  return [(MFIMAPParseContext *)self copyArrayAllowingNulls:0];
}

- (id)copyMessageSet
{
  BOOL v3 = [(MFIMAPParseContext *)self start];
  unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
  if ([(MFIMAPParseContext *)self getNumber:&v6])
  {
    do
    {
      int v4 = [(MFIMAPParseContext *)self lookAhead];
      if (v4 != 58 && v4 != 44) {
        break;
      }
      [(MFIMAPParseContext *)self increment];
    }
    while ([(MFIMAPParseContext *)self getNumber:&v6]);
  }
  if ([(MFIMAPParseContext *)self start] <= v3) {
    return 0;
  }
  else {
    return [(MFIMAPParseContext *)self copyStringFrom:v3 to:[(MFIMAPParseContext *)self start] withCaseOption:0];
  }
}

- (id)copyStringFrom:(const char *)a3 to:(const char *)a4 withCaseOption:(int64_t)a5
{
  int v7 = a3;
  int64_t v8 = a4 - a3;
  uint64_t v9 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)a3, a4 - a3, 0x600u, 0);
  if (a5 == 1 && v7 < a4)
  {
    uint64_t v10 = MEMORY[0x1E4F14390];
    do
    {
      unsigned int v11 = *v7;
      if ((v11 & 0x80000000) != 0)
      {
        if (__maskrune(v11, 0x1000uLL))
        {
LABEL_10:
          CFIndex Length = CFStringGetLength(v9);
          MutableCopy = CFStringCreateMutableCopy(0, Length, v9);
          CFStringUppercase(MutableCopy, 0);

          return MutableCopy;
        }
      }
      else if ((*(_DWORD *)(v10 + 4 * v11 + 60) & 0x1000) != 0)
      {
        goto LABEL_10;
      }
      ++v7;
      --v8;
    }
    while (v8);
  }
  return v9;
}

- (BOOL)parseSpace
{
  int v3 = [(MFIMAPParseContext *)self lookAhead];
  int v4 = v3;
  while (v3 == 32)
  {
    ++self->_start;
    int v3 = [(MFIMAPParseContext *)self lookAhead];
  }
  return v4 == 32;
}

- (unsigned)lookAhead
{
  start = (unsigned __int8 *)self->_start;
  if ((const char *)start >= self->_end) {
    return 0;
  }
  else {
    return *start;
  }
}

- (const)nextSeparator
{
  id result = self->_start;
  end = self->_end;
  if (result < end)
  {
    int64_t v5 = end - result;
    while (*result != 32)
    {
      ++result;
      if (!--v5) {
        return end;
      }
    }
  }
  return result;
}

- (void)setStart:.cold.1()
{
  __assert_rtn("-[MFIMAPParseContext setStart:]", "MFIMAPParseContext.m", 105, "start >= _originalStart && \"Should not put the start before the original start.\"");
}

- (void)setEnd:.cold.1()
{
  __assert_rtn("-[MFIMAPParseContext setEnd:]", "MFIMAPParseContext.m", 118, "end <= _originalEnd && \"Should not put the end past the original end.\"");
}

@end
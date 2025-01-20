@interface BRCDumpContext
+ (id)highlightedString:(id)a3 type:(int64_t)a4 context:(id)a5;
+ (id)nowDateFromContext:(id)a3;
+ (id)stringFromByteCount:(int64_t)a3 context:(id)a4;
+ (id)stringFromByteCount:(int64_t)a3 showActualByteCount:(BOOL)a4 suffix:(id)a5 context:(id)a6;
+ (id)stringFromCount:(int64_t)a3 context:(id)a4;
+ (id)stringFromCount:(int64_t)a3 showActualCount:(BOOL)a4 suffix:(id)a5 isByteCount:(BOOL)a6 context:(id)a7;
+ (id)stringFromDueDate:(id)a3 allowsPast:(BOOL)a4 context:(id)a5;
+ (id)stringFromDueStamp:(int64_t)a3 allowsPast:(BOOL)a4 context:(id)a5;
+ (id)stringFromError:(id)a3 context:(id)a4;
+ (id)stringFromErrorString:(id)a3 context:(id)a4;
+ (id)stringFromInterval:(double)a3 context:(id)a4;
+ (id)stringFromItemAsString:(id)a3 context:(id)a4;
+ (id)stringFromItemID:(id)a3 context:(id)a4;
+ (id)stringFromOperationUUID:(unsigned __int8)a3[16] context:(id)a4;
+ (id)stringFromThrottleState:(int)a3 context:(id)a4;
+ (int64_t)nowFromContext:(id)a3;
- (BOOL)dumpTrackedPendingDownloads;
- (BOOL)isCancelled;
- (BOOL)liveDaemon;
- (BOOL)newLineAfterWrite;
- (BOOL)onlyActiveStuff;
- (BOOL)shouldKeepDumpingWithItemCount:(unsigned int)a3 includeAllItems:(BOOL)a4;
- (BOOL)verbose;
- (BRCDumpContext)initWithDumper:(id)a3;
- (BRCDumpContext)initWithFile:(__sFILE *)a3 db:(id)a4;
- (NSString)indentationBaseString;
- (PQLConnection)db;
- (__sFILE)fp;
- (brc_task_tracker)taskTracker;
- (id)highlightedString:(id)a3 type:(int64_t)a4;
- (void)popIndentation;
- (void)pushIndentation;
- (void)setDumpTrackedPendingDownloads:(BOOL)a3;
- (void)setIndentationBaseString:(id)a3;
- (void)setLiveDaemon:(BOOL)a3;
- (void)setNewLineAfterWrite:(BOOL)a3;
- (void)setOnlyActiveStuff:(BOOL)a3;
- (void)setTaskTracker:(id)a3;
- (void)setVerbose:(BOOL)a3;
- (void)writeEmptyLine;
- (void)writeLineWithFormat:(id)a3;
@end

@implementation BRCDumpContext

+ (id)highlightedString:(id)a3 type:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  v8 = v7;
  if (a5)
  {
    id v9 = [a5 highlightedString:v7 type:a4];
  }
  else
  {
    id v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (id)stringFromThrottleState:(int)a3 context:(id)a4
{
  id v5 = a4;
  v6 = [NSString stringWithUTF8String:BRCPrettyPrintEnum()];
  id v7 = v6;
  if (v5 && a3)
  {
    if (a3 == 1) {
      uint64_t v8 = 7;
    }
    else {
      uint64_t v8 = 3;
    }
    id v9 = [v5 highlightedString:v6 type:v8];
  }
  else
  {
    id v9 = v6;
  }
  v10 = v9;

  return v10;
}

+ (id)stringFromItemAsString:(id)a3 context:(id)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    id v7 = NSString;
    id v8 = a4;
    id v9 = [v7 stringWithFormat:@"<%@>", v6];

    v10 = [v8 highlightedString:v9 type:5];
  }
  else
  {
    id v9 = v5;
    v10 = v9;
  }

  return v10;
}

+ (id)nowDateFromContext:(id)a3
{
  if (a3)
  {
    id v3 = *((id *)a3 + 3);
  }
  else
  {
    id v3 = [MEMORY[0x263EFF910] date];
  }
  return v3;
}

+ (int64_t)nowFromContext:(id)a3
{
  id v3 = [a1 nowDateFromContext:a3];
  [v3 timeIntervalSince1970];
  int64_t v4 = brc_interval_to_nsec();

  return v4;
}

+ (id)stringFromItemID:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "debugItemIDStringWithVerbose:", objc_msgSend(v5, "verbose"));

  if (v5)
  {
    id v8 = +[BRCDumpContext stringFromItemAsString:v7 context:v5];
  }
  else
  {
    id v8 = v7;
  }
  id v9 = v8;

  return v9;
}

+ (id)stringFromOperationUUID:(unsigned __int8)a3[16] context:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  memset(out, 0, 37);
  uuid_unparse(a3, out);
  if (v5)
  {
    out[8] = 0;
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"(%s)", out);
    id v7 = +[BRCDumpContext highlightedString:v6 type:5 context:v5];
  }
  else
  {
    id v7 = [NSString stringWithUTF8String:out];
  }

  return v7;
}

+ (id)stringFromErrorString:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = [a4 highlightedString:v5 type:3];
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

+ (id)stringFromError:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = [a3 description];
  if (v5)
  {
    uint64_t v7 = [v5 highlightedString:v6 type:3];

    id v6 = (void *)v7;
  }

  return v6;
}

+ (id)stringFromDueDate:(id)a3 allowsPast:(BOOL)a4 context:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  [a3 timeIntervalSince1970];
  id v9 = [a1 stringFromDueStamp:brc_interval_to_nsec() allowsPast:v5 context:v8];

  return v9;
}

+ (id)stringFromDueStamp:(int64_t)a3 allowsPast:(BOOL)a4 context:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  int64_t v8 = +[BRCDumpContext nowFromContext:v7];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8 < a3)
    {
      brc_interval_from_nsec();
      +[BRCDumpContext stringFromInterval:context:](BRCDumpContext, "stringFromInterval:context:", v7);
      id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v7) {
        goto LABEL_10;
      }
      goto LABEL_12;
    }
    if (v5)
    {
      if (!a3) {
        goto LABEL_2;
      }
      uint64_t v10 = NSString;
      brc_interval_from_nsec();
      v11 = +[BRCDumpContext stringFromInterval:context:](BRCDumpContext, "stringFromInterval:context:", v7);
      id v9 = [v10 stringWithFormat:@"%@ ago", v11];

      if (v7) {
        goto LABEL_12;
      }
    }
    else
    {
      id v9 = @"ready";
      if (v7) {
        goto LABEL_12;
      }
    }
LABEL_10:
    v12 = v9;
    goto LABEL_13;
  }
LABEL_2:
  id v9 = @"never";
  if (!v7) {
    goto LABEL_10;
  }
LABEL_12:
  v12 = [v7 highlightedString:v9 type:6];
LABEL_13:
  v13 = v12;

  return v13;
}

+ (id)stringFromInterval:(double)a3 context:(id)a4
{
  double v4 = fabs(a3);
  unint64_t v5 = (unint64_t)v4;
  if ((unint64_t)v4 < 0xE10)
  {
    if (v5 < 0x3C)
    {
      double v9 = v4 - (double)(unint64_t)v4;
      unint64_t v10 = (unint64_t)(v9 * 1000.0);
      int64_t v8 = @"s";
      v11 = @"us";
      if (v10 <= 0xA)
      {
        unint64_t v12 = (unint64_t)(v9 * 1000000.0) % 0x3E8;
      }
      else
      {
        v11 = @"ms";
        unint64_t v12 = (unint64_t)(v9 * 1000.0);
      }
      if (v10 <= 0xA) {
        unint64_t v13 = 0;
      }
      else {
        unint64_t v13 = (unint64_t)(v9 * 1000000.0) % 0x3E8;
      }
      if (v5)
      {
        unint64_t v6 = v5;
      }
      else
      {
        int64_t v8 = v11;
        unint64_t v6 = v12;
      }
      if (v5) {
        unint64_t v7 = (unint64_t)(v9 * 1000.0);
      }
      else {
        unint64_t v7 = v13;
      }
    }
    else
    {
      unint64_t v6 = v5 / 0x3C;
      unint64_t v7 = (unsigned __int16)(1000 * ((unsigned __int16)v5 % 0x3Cu)) / 0x3Cu;
      int64_t v8 = @"m";
    }
  }
  else
  {
    unint64_t v6 = v5 / 0xE10;
    unint64_t v7 = 1000 * (v5 % 0xE10) / 0xE10;
    int64_t v8 = @"h";
  }
  return (id)[NSString stringWithFormat:@"%llu.%llu%@", v6, (v7 + 5) / 0xA, v8];
}

+ (id)stringFromCount:(int64_t)a3 showActualCount:(BOOL)a4 suffix:(id)a5 isByteCount:(BOOL)a6 context:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v11 = a5;
  id v12 = a7;
  if (a3 >= 0) {
    unint64_t v13 = a3;
  }
  else {
    unint64_t v13 = -a3;
  }
  if (v13 <= 0x3E7)
  {
    if (a3 >= 0) {
      v14 = @"%lld %@";
    }
    else {
      v14 = @"-%lld %@";
    }
    v15 = &stru_26F3822F0;
    if (v8) {
      v15 = @"bytes";
    }
    v16 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", v14, v13, v15);
    goto LABEL_39;
  }
  if (v13 > 0xF423F)
  {
    if (v13 >= 0x3B9ACA00)
    {
      v20 = (void *)MEMORY[0x263F089D8];
      if (v13 > 0x2540BE3FFLL)
      {
        if (a3 >= 0) {
          v25 = @"%lld %@";
        }
        else {
          v25 = @"-%lld %@";
        }
        v26 = @"GB";
        if (!v8) {
          v26 = @"billions";
        }
        objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", v25, v13 / 0x3B9ACA00, v26);
        goto LABEL_37;
      }
      if (a3 >= 0) {
        v21 = @"%.2f %@";
      }
      else {
        v21 = @"-%.2f %@";
      }
      double v22 = (double)(uint64_t)v13 * 0.000000001;
      v23 = @"billion";
      v24 = @"GB";
    }
    else
    {
      v20 = (void *)MEMORY[0x263F089D8];
      if (a3 >= 0) {
        v21 = @"%.1f %@";
      }
      else {
        v21 = @"-%.1f %@";
      }
      double v22 = (float)((float)(uint64_t)v13 * 0.000001);
      v23 = @"million";
      v24 = @"MB";
    }
    if (v8) {
      v23 = v24;
    }
    objc_msgSend(v20, "stringWithFormat:", v21, *(void *)&v22, v23);
  }
  else
  {
    if (a3 >= 0) {
      v17 = @"%lld %@";
    }
    else {
      v17 = @"-%lld %@";
    }
    unint64_t v18 = v13 / 0x3E8uLL;
    v19 = @"thousand";
    if (v8) {
      v19 = @"KB";
    }
    objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", v17, v18, v19);
  }
  v27 = LABEL_37:;
  v16 = v27;
  if (v9) {
    objc_msgSend(v27, "appendFormat:", @" (%lld)", a3);
  }
LABEL_39:
  if (v11) {
    [v16 appendString:v11];
  }
  if (v12)
  {
    id v28 = [v12 highlightedString:v16 type:2];
  }
  else
  {
    id v28 = v16;
  }
  v29 = v28;

  return v29;
}

+ (id)stringFromByteCount:(int64_t)a3 showActualByteCount:(BOOL)a4 suffix:(id)a5 context:(id)a6
{
  return (id)[a1 stringFromCount:a3 showActualCount:a4 suffix:a5 isByteCount:1 context:a6];
}

+ (id)stringFromByteCount:(int64_t)a3 context:(id)a4
{
  return (id)[a1 stringFromCount:a3 showActualCount:1 suffix:0 isByteCount:1 context:a4];
}

+ (id)stringFromCount:(int64_t)a3 context:(id)a4
{
  return (id)[a1 stringFromCount:a3 showActualCount:1 suffix:0 isByteCount:0 context:a4];
}

- (BRCDumpContext)initWithFile:(__sFILE *)a3 db:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BRCDumpContext;
  BOOL v8 = [(BRCDumpContext *)&v16 init];
  BOOL v9 = v8;
  if (v8)
  {
    v8->_fp = a3;
    objc_storeStrong((id *)&v8->_db, a4);
    indentationBaseString = v9->_indentationBaseString;
    v9->_indentationBaseString = (NSString *)@"    ";

    uint64_t v11 = [MEMORY[0x263EFF910] date];
    nowDate = v9->_nowDate;
    v9->_nowDate = (NSDate *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F32578]) initWithFile:a3 forceColor:0];
    dumper = v9->_dumper;
    v9->_dumper = (BRCDumper *)v13;

    v9->_newLineAfterWrite = 1;
  }

  return v9;
}

- (BRCDumpContext)initWithDumper:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCDumpContext;
  unint64_t v6 = [(BRCDumpContext *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    indentationBaseString = v6->_indentationBaseString;
    v6->_indentationBaseString = (NSString *)@"    ";

    objc_storeStrong((id *)&v7->_dumper, a3);
    uint64_t v9 = [MEMORY[0x263EFF910] date];
    nowDate = v7->_nowDate;
    v7->_nowDate = (NSDate *)v9;

    v7->_newLineAfterWrite = 1;
  }

  return v7;
}

- (BOOL)isCancelled
{
  taskTracker = self->_taskTracker;
  if (taskTracker) {
    LOBYTE(taskTracker) = brc_task_tracker_is_cancelled(taskTracker);
  }
  return (char)taskTracker;
}

- (void)writeLineWithFormat:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v18 = 0;
  id v5 = [(NSString *)self->_indentationBaseString UTF8String];
  unint64_t v18 = &v21;
  unint64_t v6 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v21];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = objc_msgSend(v6, "componentsSeparatedByString:", @"\n", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (self->_indentation >= 1)
        {
          int64_t v13 = 0;
          do
          {
            fputs(v5, self->_fp);
            ++v13;
          }
          while (v13 < self->_indentation);
        }
        fputs((const char *)[v12 UTF8String], self->_fp);
        if (self->_newLineAfterWrite) {
          fputc(10, self->_fp);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)writeEmptyLine
{
}

- (BOOL)shouldKeepDumpingWithItemCount:(unsigned int)a3 includeAllItems:(BOOL)a4
{
  if (a3 >= 0x3E9 && !a4)
  {
    id v5 = @"\n- too many items, stopping -\n";
LABEL_7:
    [(BRCDumpContext *)self writeLineWithFormat:v5];
    return 0;
  }
  if (self && [(BRCDumpContext *)self isCancelled])
  {
    id v5 = @"- cancelled -";
    goto LABEL_7;
  }
  return 1;
}

- (id)highlightedString:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x263F089D8] string];
  int64_t v8 = a4 - 1;
  if ((unint64_t)(a4 - 1) > 6)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 9;
  }
  else
  {
    uint64_t v9 = dword_23FD342EC[v8];
    uint64_t v10 = dword_23FD34308[v8];
  }
  uint64_t v11 = [(BRCDumper *)self->_dumper startStringForFgColor:v10 bgColor:9 attr:v9];
  objc_super v12 = [(BRCDumper *)self->_dumper stringForReset];
  if (v11) {
    [v7 appendString:v11];
  }
  [v7 appendString:v6];
  if (v12) {
    [v7 appendString:v12];
  }

  return v7;
}

- (void)pushIndentation
{
}

- (void)popIndentation
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _indentation > 0%@", (uint8_t *)&v2, 0xCu);
}

- (__sFILE)fp
{
  return self->_fp;
}

- (PQLConnection)db
{
  return self->_db;
}

- (NSString)indentationBaseString
{
  return self->_indentationBaseString;
}

- (void)setIndentationBaseString:(id)a3
{
}

- (BOOL)liveDaemon
{
  return self->_liveDaemon;
}

- (void)setLiveDaemon:(BOOL)a3
{
  self->_liveDaemon = a3;
}

- (BOOL)onlyActiveStuff
{
  return self->_onlyActiveStuff;
}

- (void)setOnlyActiveStuff:(BOOL)a3
{
  self->_onlyActiveStuff = a3;
}

- (BOOL)dumpTrackedPendingDownloads
{
  return self->_dumpTrackedPendingDownloads;
}

- (void)setDumpTrackedPendingDownloads:(BOOL)a3
{
  self->_dumpTrackedPendingDownloads = a3;
}

- (brc_task_tracker)taskTracker
{
  return self->_taskTracker;
}

- (void)setTaskTracker:(id)a3
{
}

- (BOOL)newLineAfterWrite
{
  return self->_newLineAfterWrite;
}

- (void)setNewLineAfterWrite:(BOOL)a3
{
  self->_newLineAfterWrite = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_indentationBaseString, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_nowDate, 0);
  objc_storeStrong((id *)&self->_dumper, 0);
}

@end
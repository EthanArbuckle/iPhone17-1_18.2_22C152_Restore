@interface FPOutputFormatterText
- (void)configureForMultipleOutputs;
- (void)endAtTime:(id)a3;
- (void)endProcessHeader:(id)a3;
- (void)printGlobalAuxData:(id)a3;
- (void)printHeader;
- (void)printProcessAuxData:(id)a3 forProcess:(id)a4;
- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5;
- (void)printProcessHeader:(id)a3;
- (void)printProcessTotal:(id)a3 forProcess:(id)a4;
- (void)printProcessesWithWarnings:(id)a3 processesWithErrors:(id)a4 globalErrors:(id)a5;
- (void)printSharedCache:(id)a3 categories:(id)a4 sharedWith:(id)a5 total:(id *)a6;
- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7;
- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5;
- (void)printVmmapLikeOutputForProcess:(id)a3 regions:(id)a4;
- (void)startAtTime:(id)a3;
@end

@implementation FPOutputFormatterText

- (void)configureForMultipleOutputs
{
  self->_multipleOutputs = 1;
}

- (void)startAtTime:(id)a3
{
  self->_processCount = 0;
  if (self->_multipleOutputs)
  {
    dateFormatter = self->_dateFormatter;
    sub_100018C74((double *)a3);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [(NSISO8601DateFormatter *)dateFormatter stringFromDate:v11];
    char v6 = [v5 UTF8String];
    sub_100019F44((uint64_t)self, 0, 0, "Time: %s\n", v7, v8, v9, v10, v6);
  }
}

- (void)printVmmapLikeOutputForProcess:(id)a3 regions:(id)a4
{
  self->_verbose = 1;
  output = self->_output;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 displayString];
  fprintf(output, "%s\n\n", (const char *)[v9 UTF8String]);

  int64_t options = self->_options;
  id v11 = "     SWP";
  if ((options & 2) == 0) {
    id v11 = "";
  }
  v12 = "    WIRE";
  if ((self->_options & 1) == 0) {
    v12 = "";
  }
  fprintf(self->_output, "           start                end  [object-id]     VRT     DRT%*s     CLN     RCL%*s   tag (detail)\n", 4 * (options & 2), v11, 8 * (self->_options & 1), v12);
  int64_t v13 = self->_options;
  v14 = "   -----";
  if ((v13 & 2) != 0) {
    v15 = "   -----";
  }
  else {
    v15 = "";
  }
  if ((self->_options & 1) == 0) {
    v14 = "";
  }
  fprintf(self->_output, "      ----------         ---------- ------------   -----   -----%*s   -----   -----%*s   ------------\n", 4 * (v13 & 2), v15, 8 * (self->_options & 1), v14);
  id v16 = [v8 pageSize];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001A230;
  v17[3] = &unk_100029E38;
  v17[4] = self;
  v17[5] = v16;
  [v7 fp_enumerateObjectsWithBatchSize:128 usingBlock:v17];

  fputc(10, self->_output);
}

- (void)printHeader
{
  if (self && !sub_1000113C4())
  {
    sub_10001B920((uint64_t)self, "VM Object Dirty Analysis: Enabled\n", v3, v4, v5, v6, v7, v8, v10);
  }
}

- (void)printProcessHeader:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  int processCount = self->_processCount;
  if (processCount != 2) {
    self->_int processCount = processCount + 1;
  }
  orderedProcesses = self->_orderedProcesses;
  uint64_t v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 pid]);
  [(NSMutableArray *)orderedProcesses addObject:v8];

  self->_pageSize = (unint64_t)[v5 pageSize];
  sub_100019F44((uint64_t)self, v5, 1, "%s%s%s%*s%s%s%*s%s%s\n", v9, v10, v11, v12, (char)"==========");
  id v13 = [v5 displayString];
  LOBYTE(v8) = [v13 UTF8String];
  [v5 is64bit];
  [v5 isTranslated];
  sub_100019F44((uint64_t)self, v5, 1, "%s: %s-bit%s", v14, v15, v16, v17, (char)v8);

  v18 = [v5 warnings];
  v19 = [v5 errors];
  if ([v18 count])
  {
    sub_100019F44((uint64_t)self, v5, 1, "\nWarnings were encountered while examining the process.\n", v20, v21, v22, v23, v46);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v24 = v18;
    id v25 = [v24 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v52;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v52 != v27) {
            objc_enumerationMutation(v24);
          }
          [*(id *)(*((void *)&v51 + 1) + 8 * i) UTF8String];
          sub_100019F44((uint64_t)self, v5, 1, "%s%s\n", v29, v30, v31, v32, (char)"    ");
        }
        id v26 = [v24 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v26);
    }
  }
  if ([v19 count])
  {
    sub_100019F44((uint64_t)self, v5, 1, "\nErrors were encountered while examining the process. Results may be incomplete or incorrect.\n", v33, v34, v35, v36, v46);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v37 = v19;
    id v38 = [v37 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v48;
      do
      {
        for (j = 0; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v48 != v40) {
            objc_enumerationMutation(v37);
          }
          [*(id *)(*((void *)&v47 + 1) + 8 * (void)j) UTF8String];
          sub_100019F44((uint64_t)self, v5, 1, "%s%s\n", v42, v43, v44, v45, (char)"    ");
        }
        id v39 = [v37 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v39);
    }
  }
}

- (void)printProcessTotal:(id)a3 forProcess:(id)a4
{
  id v6 = a4;
  sub_10001AA8C(self, (uint64_t)[a3 longLongValue]);
  id v11 = objc_claimAutoreleasedReturnValue();
  [v11 UTF8String];
  [v6 pageSize];
  sub_100019F44((uint64_t)self, v6, 1, "%sFootprint: %s (%lu bytes per page)\n", v7, v8, v9, v10, (char)"    ");
}

- (void)endProcessHeader:(id)a3
{
  sub_100019F44((uint64_t)self, a3, 1, "%s%s%s%*s%s%s%*s%s%s\n\n", v3, v4, v5, v6, (char)"==========");
}

- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5
{
  int64_t summaryFormat = self->_summaryFormat;
  id v25 = a5;
  id v22 = a3;
  [@"Dirty" UTF8String];
  if ((self->_options & 2) != 0) {
    [(NSString *)self->_swappedColumnName UTF8String];
  }
  [@"Clean" UTF8String];
  [@"Reclaimable" UTF8String];
  if (self->_options) {
    [(NSString *)self->_wiredColumnName UTF8String];
  }
  [@"Regions" UTF8String];
  [@"Category" UTF8String];
  if (summaryFormat == 1) {
    char v11 = 7;
  }
  else {
    char v11 = 11;
  }
  sub_100019F44((uint64_t)self, v25, 1, "%*s%*s%*s%*s%*s %10s    %s\n", v7, v8, v9, v10, v11);
  if (self->_summaryFormat == 1) {
    char v16 = 7;
  }
  else {
    char v16 = 11;
  }
  sub_100019F44((uint64_t)self, v25, 1, "%*s%*s%*s%*s%*s %10s    %s\n", v12, v13, v14, v15, v16);
  sub_10001AE5C((uint64_t)self, v22, v25);

  sub_10001B0A0(self, a4, v25);
  sub_100019F44((uint64_t)self, v25, 1, "\n", v17, v18, v19, v20, v21);
}

- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7
{
  id v60 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 processes];
  uint64_t v13 = (char *)[v12 count] - (v11 != 0);

  uint64_t v14 = [v10 processes];
  id v15 = [v14 count];

  v59 = v10;
  if ((unint64_t)v15 < 0x15)
  {
    sub_100019F44((uint64_t)self, v11, 1, "Shared with", v16, v17, v18, v19, v54);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v20 = [v10 processes];
    id v21 = [v20 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v62;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v62 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = *(id *)(*((void *)&v61 + 1) + 8 * i);
          if (v25 != v11)
          {
            id v26 = [v25 displayString];
            char v27 = [v26 UTF8String];
            sub_100019F44((uint64_t)self, v11, 1, " %s", v28, v29, v30, v31, v27);

            if (--v13) {
              sub_100019F44((uint64_t)self, v11, 1, ",", v32, v33, v34, v35, v55);
            }
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v61 objects:v65 count:16];
      }
      while (v22);
    }

    sub_100019F44((uint64_t)self, v11, 1, ":\n", v36, v37, v38, v39, v55);
  }
  else
  {
    sub_100019F44((uint64_t)self, v11, 1, "Shared with %lu processes:\n", v16, v17, v18, v19, (char)v13);
  }
  int64_t summaryFormat = self->_summaryFormat;
  [@"Dirty" UTF8String];
  if ((self->_options & 2) != 0) {
    [(NSString *)self->_swappedColumnName UTF8String];
  }
  [@"Clean" UTF8String];
  [@"Reclaimable" UTF8String];
  if (self->_options) {
    [(NSString *)self->_wiredColumnName UTF8String];
  }
  [@"Regions" UTF8String];
  [@"Category" UTF8String];
  if (summaryFormat == 1) {
    char v44 = 7;
  }
  else {
    char v44 = 11;
  }
  sub_100019F44((uint64_t)self, v11, 1, "%*s%*s%*s%*s%*s %10s    %s\n", v40, v41, v42, v43, v44);
  if (self->_summaryFormat == 1) {
    char v49 = 7;
  }
  else {
    char v49 = 11;
  }
  sub_100019F44((uint64_t)self, v11, 1, "%*s%*s%*s%*s%*s %10s    %s\n", v45, v46, v47, v48, v49);
  sub_10001AE5C((uint64_t)self, v60, v11);
  sub_10001B0A0(self, a7, v11);
  sub_100019F44((uint64_t)self, v11, 1, "\n", v50, v51, v52, v53, v56);
}

- (void)printSharedCache:(id)a3 categories:(id)a4 sharedWith:(id)a5 total:(id *)a6
{
  id v9 = a5;
  id v34 = a4;
  id v10 = a3;
  sub_10001B920((uint64_t)self, "%s%s%s%*s%s%s%*s%s%s\n", v11, v12, v13, v14, v15, v16, (uint64_t)"==========");
  if (v10) {
    uint64_t v17 = (void *)v10[2];
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  id v19 = [v18 UUIDString];
  id v20 = [v19 UTF8String];
  sub_10001B920((uint64_t)self, "Shared Cache %s\n", v21, v22, v23, v24, v25, v26, (uint64_t)v20);

  sub_10001B920((uint64_t)self, "%s%s%s%*s%s%s%*s%s%s\n\n", v27, v28, v29, v30, v31, v32, (uint64_t)"==========");
  [(FPOutputFormatterText *)self printSharedCategories:v34 sharedWith:v9 forProcess:0 hasProcessView:0 total:a6];
}

- (void)printProcessAuxData:(id)a3 forProcess:(id)a4
{
  if (a3)
  {
    id v11 = a4;
    sub_10001BADC(self, a3, v11);
    sub_100019F44((uint64_t)self, v11, 1, "\n", v6, v7, v8, v9, v10);
  }
}

- (void)printProcessesWithWarnings:(id)a3 processesWithErrors:(id)a4 globalErrors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v69 = v10;
  id v70 = v8;
  if ([v8 count])
  {
    sub_10001B920((uint64_t)self, "\nWarnings were encountered while examining the following processes:\n", v11, v12, v13, v14, v15, v16, v68);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v17 = v8;
    id v18 = [v17 countByEnumeratingWithState:&v79 objects:v85 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v80;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v80 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          id v23 = [v22 name];
          [v23 UTF8String];
          sub_100019F44((uint64_t)self, v22, 1, "%s%s\n", v24, v25, v26, v27, (char)"    ");
        }
        id v19 = [v17 countByEnumeratingWithState:&v79 objects:v85 count:16];
      }
      while (v19);
    }

    id v10 = v69;
    id v8 = v70;
  }
  if ([v9 count])
  {
    sub_10001B920((uint64_t)self, "\nErrors were encountered while examining the following processes:\n", v28, v29, v30, v31, v32, v33, v68);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v34 = v9;
    id v35 = [v34 countByEnumeratingWithState:&v75 objects:v84 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v76;
      do
      {
        for (j = 0; j != v36; j = (char *)j + 1)
        {
          if (*(void *)v76 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
          id v40 = [v39 name];
          [v40 UTF8String];
          sub_100019F44((uint64_t)self, v39, 1, "%s%s\n", v41, v42, v43, v44, (char)"    ");
        }
        id v36 = [v34 countByEnumeratingWithState:&v75 objects:v84 count:16];
      }
      while (v36);
    }

    id v10 = v69;
    id v8 = v70;
  }
  if ([v10 count])
  {
    sub_10001B920((uint64_t)self, "\nErrors were encountered:\n", v45, v46, v47, v48, v49, v50, v68);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v51 = v10;
    id v52 = [v51 countByEnumeratingWithState:&v71 objects:v83 count:16];
    if (v52)
    {
      id v53 = v52;
      uint64_t v54 = *(void *)v72;
      do
      {
        for (k = 0; k != v53; k = (char *)k + 1)
        {
          if (*(void *)v72 != v54) {
            objc_enumerationMutation(v51);
          }
          [*(id *)(*((void *)&v71 + 1) + 8 * (void)k) UTF8String];
          sub_10001B920((uint64_t)self, "%s%s\n", v56, v57, v58, v59, v60, v61, (uint64_t)"    ");
        }
        id v53 = [v51 countByEnumeratingWithState:&v71 objects:v83 count:16];
      }
      while (v53);
    }
  }
  if ([v9 count] || objc_msgSend(v10, "count")) {
    sub_10001B920((uint64_t)self, "\nDue to errors, summary results may be incomplete or incorrect\n", v62, v63, v64, v65, v66, v67, v68);
  }
}

- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5
{
  id v7 = a3;
  if (self->_processCount != 1)
  {
    uint64_t v43 = v7;
    sub_10001B920((uint64_t)self, "%s%s%s%*s%s%s%*s%s%s\n", v8, v9, v10, v11, v12, v13, (uint64_t)"==========");
    sub_10001AA8C(self, a4->var1 + a4->var0);
    id v14 = objc_claimAutoreleasedReturnValue();
    id v15 = [v14 UTF8String];
    sub_10001B920((uint64_t)self, "Summary Footprint: %s%s\n", v16, v17, v18, v19, v20, v21, (uint64_t)v15);

    sub_10001B920((uint64_t)self, "%s%s%s%*s%s%s%*s%s%s\n\n", v22, v23, v24, v25, v26, v27, (uint64_t)"==========");
    id v7 = v43;
    if (v43)
    {
      if (self->_summaryFormat == 1) {
        uint64_t v28 = 7;
      }
      else {
        uint64_t v28 = 11;
      }
      uint64_t v42 = v28;
      [@"Dirty" UTF8String];
      if ((self->_options & 2) != 0) {
        [(NSString *)self->_swappedColumnName UTF8String];
      }
      [@"Clean" UTF8String];
      [@"Reclaimable" UTF8String];
      if (self->_options) {
        [(NSString *)self->_wiredColumnName UTF8String];
      }
      [@"Regions" UTF8String];
      [@"Category" UTF8String];
      sub_10001B920((uint64_t)self, "%*s%*s%*s%*s%*s %10s    %s\n", v29, v30, v31, v32, v33, v34, v42);
      uint64_t v41 = 7;
      if (self->_summaryFormat != 1) {
        uint64_t v41 = 11;
      }
      sub_10001B920((uint64_t)self, "%*s%*s%*s%*s%*s %10s    %s\n", v35, v36, v37, v38, v39, v40, v41);
      sub_10001AE5C((uint64_t)self, v43, 0);
      sub_10001B0A0(self, a4, 0);
      id v7 = v43;
    }
  }
}

- (void)printGlobalAuxData:(id)a3
{
  id v4 = a3;
  if (self->_processCount != 1)
  {
    id v19 = v4;
    sub_10001B920((uint64_t)self, "\n", v5, v6, v7, v8, v9, v10, v17);
    id v4 = v19;
    if (v19)
    {
      sub_10001BADC(self, v19, 0);
      sub_10001B920((uint64_t)self, "\n", v11, v12, v13, v14, v15, v16, v18);
      id v4 = v19;
    }
  }
}

- (void)endAtTime:(id)a3
{
  if (self->_layoutStyle == 1)
  {
    if ([(NSMutableString *)self->_prefix length]) {
      fprintf(self->_output, "%s\n", (const char *)[(NSMutableString *)self->_prefix UTF8String]);
    }
    uint64_t v49 = [(NSMutableArray *)self->_orderedProcesses count];
    if ([(NSMutableArray *)self->_orderedProcesses count])
    {
      uint64_t v42 = v4;
      unint64_t v5 = 0;
LABEL_6:
      id v47 = objc_alloc_init((Class)NSMutableString);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      obj = self->_orderedProcesses;
      id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v55;
        uint64_t v44 = *(void *)v55;
        do
        {
          uint64_t v9 = 0;
          id v45 = v7;
          do
          {
            if (*(void *)v55 != v8) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void *)(*((void *)&v54 + 1) + 8 * (void)v9);
            uint64_t v11 = [(NSMutableDictionary *)self->_outputLinesByPID objectForKeyedSubscript:v10];
            if (v5 < (unint64_t)[v11 count])
            {
              uint64_t v12 = [(NSMutableArray *)self->_orderedProcesses indexOfObject:v10];
              uint64_t v13 = 0;
              uint64_t v14 = v12 - 1;
              if ((uint64_t)(v12 - 1) >= 0)
              {
                do
                {
                  uint64_t v15 = [(NSMutableArray *)self->_orderedProcesses objectAtIndexedSubscript:v14];
                  uint64_t v16 = [(NSMutableDictionary *)self->_maxTextLengthByPID objectForKeyedSubscript:v15];
                  uint64_t v13 = &v13[(void)[v16 integerValue]];

                  --v14;
                }
                while (v14 != (unsigned char *)-1);
              }
              uint64_t v17 = [v11 objectAtIndexedSubscript:v5];
              uint64_t v18 = [v47 length];
              int64_t v19 = v13 - v18;
              if (v13 == v18)
              {
                id v20 = v17;
              }
              else
              {
                id v20 = objc_alloc_init((Class)NSMutableString);
                do
                {
                  [v20 appendString:@" "];
                  --v19;
                }
                while (v19);
                [v20 appendString:v17];
              }
              if (v12 != (char *)[(NSMutableArray *)self->_orderedProcesses count] - 1)
              {
                uint64_t v21 = v12 + 1;
                while (v21 < v49)
                {
                  uint64_t v22 = [(NSMutableArray *)self->_orderedProcesses objectAtIndexedSubscript:v21];
                  uint64_t v23 = [(NSMutableDictionary *)self->_outputLinesByPID objectForKeyedSubscript:v22];
                  id v24 = [v23 count];

                  ++v21;
                  if ((unint64_t)v24 > v5)
                  {
                    uint64_t v25 = +[NSCharacterSet newlineCharacterSet];
                    uint64_t v26 = [v20 stringByTrimmingCharactersInSet:v25];

                    [v47 appendString:v26];
                    goto LABEL_25;
                  }
                }
              }
              [v47 appendString:v20];
LABEL_25:

              uint64_t v8 = v44;
              id v7 = v45;
            }

            uint64_t v9 = (char *)v9 + 1;
          }
          while (v9 != v7);
          id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v54 objects:v59 count:16];
        }
        while (v7);
      }

      output = self->_output;
      id v28 = v47;
      fputs((const char *)[v28 UTF8String], output);
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      uint64_t v29 = self->_orderedProcesses;
      id v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v51;
        while (2)
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v51 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = [(NSMutableDictionary *)self->_outputLinesByPID objectForKeyedSubscript:*(void *)(*((void *)&v50 + 1) + 8 * i)];
            id v35 = [v34 count];

            if ((unint64_t)v35 > v5)
            {

              ++v5;
              goto LABEL_6;
            }
          }
          id v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (v31) {
            continue;
          }
          break;
        }
      }

      id v4 = v42;
      uint64_t v36 = v5 + 1;
    }
    else
    {
      uint64_t v36 = -1;
    }
    if ([(NSMutableString *)self->_suffix length])
    {
      if ((v36 & 0x8000000000000000) == 0) {
        fputc(10, self->_output);
      }
      fputs((const char *)[(NSMutableString *)self->_suffix UTF8String], self->_output);
    }
    [(NSMutableDictionary *)self->_maxTextLengthByPID removeAllObjects];
    [(NSMutableArray *)self->_orderedProcesses removeAllObjects];
    [(NSMutableDictionary *)self->_outputLinesByPID removeAllObjects];
    uint64_t v37 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    prefix = self->_prefix;
    self->_prefix = v37;

    uint64_t v39 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    suffix = self->_suffix;
    self->_suffix = v39;
  }
  uint64_t v41 = self->_output;

  fflush(v41);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sort, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_outputLinesByPID, 0);
  objc_storeStrong((id *)&self->_orderedProcesses, 0);
  objc_storeStrong((id *)&self->_maxTextLengthByPID, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_wiredColumnName, 0);

  objc_storeStrong((id *)&self->_swappedColumnName, 0);
}

@end
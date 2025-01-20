@interface BRCTLLogCommand
+ (id)dateComponentsFromUTF8String:(const char *)a3;
+ (id)dateFromUTF8String:(const char *)a3;
- (BOOL)activityStream:(id)a3 results:(id)a4;
- (BOOL)outputEvents:(id)a3 error:(id)a4;
- (BRCTLLogCommand)init;
- (id)_parseMessage:(const char *)a3;
- (int)dumpOrStreamLogArchiveToFd:(int)a3;
- (int)dumpToFd:(int)a3;
- (void)_dumpLevel:(int)a3;
- (void)buildPredicateFromString;
- (void)buildPredicateString:(id)a3;
- (void)computeRealOptionsForFd:(id)a3;
- (void)getDepth:(int *)a3 current:(id *)a4 previous:(id *)a5 forThread:(id)a6;
- (void)outputEvent:(id)a3;
- (void)parseOption:(int)a3 arg:(const char *)a4;
- (void)printLogWithFacility:(id)a3 subsystem:(id)a4 message:(const char *)a5 threadID:(unint64_t)a6 kind:(int)a7 sender:(id)a8 sendPID:(int)a9 depth:(int)a10 level:(int)a11 timestamp:(id)a12 timezone:(id)a13 sectionID:(id)a14 isOversize:(BOOL)a15 previousSectionID:(id)a16;
- (void)pushSection:(id)a3 forThread:(id)a4;
- (void)streamDidFail:(id)a3 error:(id)a4;
- (void)streamDidStop:(id)a3;
@end

@implementation BRCTLLogCommand

- (BRCTLLogCommand)init
{
  v21.receiver = self;
  v21.super_class = (Class)BRCTLLogCommand;
  v2 = [(BRCTLLogCommand *)&v21 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    uuidToSection = v2->_uuidToSection;
    v2->_uuidToSection = v3;

    page = v2->_page;
    v2->_page = (NSNumber *)&__kCFBooleanTrue;

    uint64_t v6 = +[NSDate distantPast];
    startDate = v2->_startDate;
    v2->_startDate = (NSDate *)v6;

    uint64_t v8 = +[NSDate distantFuture];
    endDate = v2->_endDate;
    v2->_endDate = (NSDate *)v8;

    predicateString = v2->_predicateString;
    v2->_predicateString = 0;

    predicate = v2->_predicate;
    v2->_predicate = 0;

    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("log-output", v13);

    outputQueue = v2->_outputQueue;
    v2->_outputQueue = (OS_dispatch_queue *)v14;

    dispatch_semaphore_t v16 = dispatch_semaphore_create(2000);
    outputSemaphore = v2->_outputSemaphore;
    v2->_outputSemaphore = (OS_dispatch_semaphore *)v16;

    v2->_timezoneAware = 1;
    v18 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    timestampFormatter = v2->_timestampFormatter;
    v2->_timestampFormatter = v18;

    [(NSDateFormatter *)v2->_timestampFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZ"];
  }
  return v2;
}

- (void)computeRealOptionsForFd:(id)a3
{
  id v6 = a3;
  if (v6 && isatty((int)[v6 intValue]))
  {
    if (!self->_use_color)
    {
      self->_use_color = (NSNumber *)&__kCFBooleanTrue;
    }
    if (!self->_use_multiline)
    {
      self->_use_multiline = (NSNumber *)&__kCFBooleanFalse;
    }
  }
  if (![(NSNumber *)self->_use_color BOOLValue])
  {
    use_color = self->_use_color;
    self->_use_color = 0;
  }
  if (![(NSNumber *)self->_use_multiline BOOLValue])
  {
    use_multiline = self->_use_multiline;
    self->_use_multiline = 0;
  }
}

- (void)_dumpLevel:(int)a3
{
  if (a3 >= 8) {
    unsigned int v4 = 8;
  }
  else {
    unsigned int v4 = a3;
  }
  [(BRCTermDumper *)self->_dumper startFgColor:dword_10001B538[v4] attr:dword_10001B55C[v4]];
  dumper = self->_dumper;
  id v6 = off_100024A60[v4];

  [(BRCTermDumper *)dumper puts:v6];
}

- (id)_parseMessage:(const char *)a3
{
  v3 = (void *)a3;
  if (a3)
  {
    if ([(BRCTermDumper *)self->_dumper useColor])
    {
      if (!self->_regularExpressionReplacementInfos)
      {
        v5 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
        id v6 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", @"([0-9A-F]{8})-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}", 0, 0);
        v7 = [(BRCTermDumper *)self->_dumper startStringForFgColor:3 bgColor:0xFFFFFFFFLL attr:0];
        uint64_t v8 = [(BRCTermDumper *)self->_dumper stringForReset];
        v9 = +[NSString stringWithFormat:@"%@<$1>%@", v7, v8];
        v51[0] = @"template";
        v51[1] = @"regex";
        v52[0] = v9;
        v52[1] = v6;
        v10 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
        [(NSArray *)v5 addObject:v10];

        v11 = +[NSRegularExpression regularExpressionWithPattern:@"\"([^\"]*)\"" options:0 error:0];

        v12 = [(BRCTermDumper *)self->_dumper startStringForFgColor:6 bgColor:0xFFFFFFFFLL attr:0];

        v13 = [(BRCTermDumper *)self->_dumper stringForReset];

        dispatch_queue_t v14 = +[NSString stringWithFormat:@"%@\"$1\"%@", v12, v13];

        v49[0] = @"template";
        v49[1] = @"regex";
        v50[0] = v14;
        v50[1] = v11;
        v15 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
        [(NSArray *)v5 addObject:v15];

        dispatch_semaphore_t v16 = +[NSRegularExpression regularExpressionWithPattern:@"'([^']*)'" options:0 error:0];

        v17 = [(BRCTermDumper *)self->_dumper startStringForFgColor:6 bgColor:0xFFFFFFFFLL attr:0];

        v18 = [(BRCTermDumper *)self->_dumper stringForReset];

        v19 = +[NSString stringWithFormat:@"%@'$1'%@", v17, v18];

        v47[0] = @"template";
        v47[1] = @"regex";
        v48[0] = v19;
        v48[1] = v16;
        v20 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
        [(NSArray *)v5 addObject:v20];

        objc_super v21 = [&off_100027F78 componentsJoinedByString:@"|"];
        v22 = +[NSString stringWithFormat:@"\\b(%@)\\b", v21];

        v23 = +[NSRegularExpression regularExpressionWithPattern:v22 options:0 error:0];

        v24 = [(BRCTermDumper *)self->_dumper startStringForFgColor:0xFFFFFFFFLL bgColor:0xFFFFFFFFLL attr:2];

        v25 = [(BRCTermDumper *)self->_dumper stringForReset];

        v26 = +[NSString stringWithFormat:@"%@$1%@", v24, v25];

        v45[0] = @"template";
        v45[1] = @"regex";
        v46[0] = v26;
        v46[1] = v23;
        v27 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
        [(NSArray *)v5 addObject:v27];

        regularExpressionReplacementInfos = self->_regularExpressionReplacementInfos;
        self->_regularExpressionReplacementInfos = v5;
      }
      v3 = +[NSString stringWithUTF8String:v3];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      obj = self->_regularExpressionReplacementInfos;
      id v29 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v41;
        do
        {
          v32 = 0;
          v33 = v3;
          do
          {
            if (*(void *)v41 != v31) {
              objc_enumerationMutation(obj);
            }
            v34 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v32);
            v35 = [v34 objectForKeyedSubscript:@"regex"];
            id v36 = [v33 length];
            v37 = [v34 objectForKeyedSubscript:@"template"];
            v3 = [v35 stringByReplacingMatchesInString:v33 options:0 range:0 withTemplate:v36];

            v32 = (char *)v32 + 1;
            v33 = v3;
          }
          while (v30 != v32);
          id v30 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v30);
      }
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (void)printLogWithFacility:(id)a3 subsystem:(id)a4 message:(const char *)a5 threadID:(unint64_t)a6 kind:(int)a7 sender:(id)a8 sendPID:(int)a9 depth:(int)a10 level:(int)a11 timestamp:(id)a12 timezone:(id)a13 sectionID:(id)a14 isOversize:(BOOL)a15 previousSectionID:(id)a16
{
  uint64_t v17 = *(void *)&a7;
  id v68 = a3;
  id v21 = a4;
  id v22 = a8;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  id v26 = a16;
  if (self->_timezoneAware) {
    [(NSDateFormatter *)self->_timestampFormatter setTimeZone:v24];
  }
  v67 = [(NSDateFormatter *)self->_timestampFormatter stringFromDate:v23];
  if ([(NSNumber *)self->_level intValue] < 1 || [(NSNumber *)self->_level intValue] >= a11)
  {
    if (v17 == 1)
    {
      [(BRCTermDumper *)self->_dumper startFgColor:7 attr:18];
      -[BRCTermDumper write:](self->_dumper, "write:", "\n%s\n\n", a5);
      [(BRCTermDumper *)self->_dumper reset];
      goto LABEL_64;
    }
    if (self->_digest)
    {
      if (a11 > 5) {
        goto LABEL_64;
      }
      use_multiline = self->_use_multiline;
      self->_use_multiline = (NSNumber *)&__kCFBooleanFalse;

      goto LABEL_10;
    }
    if (v17 == 3 && v25)
    {
      v62 = [(NSMutableDictionary *)self->_uuidToSection objectForKeyedSubscript:v25];
      [(NSMutableDictionary *)self->_uuidToSection removeObjectForKey:v25];
      v65 = 0;
    }
    else
    {
      if (!v25)
      {
LABEL_10:
        v65 = 0;
LABEL_11:
        v62 = 0;
        goto LABEL_23;
      }
      v65 = [(NSMutableDictionary *)self->_uuidToSection objectForKeyedSubscript:v25];
      if (v65 && v17 != 4 && v17 != 2) {
        goto LABEL_11;
      }
      id v28 = v26;
      id v29 = v25;
      id v61 = v24;
      v63 = v28;
      id v30 = v22;
      if (v28)
      {
        uint64_t v31 = -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToSection, "objectForKeyedSubscript:");
      }
      else
      {
        uint64_t v31 = 0;
      }
      v32 = [[Section alloc] initWithUUID:v29 kind:v17 depth:a10 parent:v31];

      [(NSMutableDictionary *)self->_uuidToSection setObject:v32 forKeyedSubscript:v29];
      v62 = 0;
      v65 = v32;
      id v22 = v30;
      id v24 = v61;
      id v25 = v29;
      id v26 = v63;
    }
LABEL_23:
    [(BRCTermDumper *)self->_dumper startFgColor:0 attr:2];
    [(BRCTermDumper *)self->_dumper puts:"[" len:1];
    [(BRCTLLogCommand *)self _dumpLevel:a11];
    [(BRCTermDumper *)self->_dumper startFgColor:0 attr:2];
    [(BRCTermDumper *)self->_dumper put:v67];
    [(BRCTermDumper *)self->_dumper puts:"] " len:2];
    if (v22)
    {
      [(BRCTermDumper *)self->_dumper startFgColor:2 attr:2];
      [(BRCTermDumper *)self->_dumper put:v22];
      -[BRCTermDumper write:](self->_dumper, "write:", "[%d] ", a9);
    }
    id v66 = v21;
    unsigned int v33 = [v21 isEqualToString:@"com.apple.FileProvider"];
    uint64_t v34 = a10;
    id v64 = v26;
    if (!v68 || !v33)
    {
      if (!v68) {
        goto LABEL_40;
      }
      goto LABEL_38;
    }
    if (([v68 isEqualToString:@"default personal"] & 1) != 0
      || ([v68 isEqualToString:@"default enterprise"] & 1) != 0
      || ([v68 isEqualToString:@"fpfs"] & 1) != 0)
    {
LABEL_38:
      [(BRCTermDumper *)self->_dumper startFgColor:5 attr:2];
      if ([v68 containsString:@"enterprise"]) {
        [(BRCTermDumper *)self->_dumper write:"enterprise "];
      }
LABEL_40:
      if (a15)
      {
        [(BRCTermDumper *)self->_dumper startFgColor:3 attr:2];
        [(BRCTermDumper *)self->_dumper puts:"oversize! "];
      }
      id v39 = v24;
      [(BRCTermDumper *)self->_dumper startFgColor:0 attr:2];
      if (!self->_digest) {
        [(BRCTermDumper *)self->_dumper startFgColor:3];
      }
      [(BRCTermDumper *)self->_dumper reset];
      if (self->_shorten)
      {
        id v40 = v22;
        long long v41 = [(BRCTLLogCommand *)self _parseMessage:a5];
        long long v42 = v41;
        if (v41) {
          a5 = (const char *)[v41 UTF8String];
        }

        id v22 = v40;
      }
      id v24 = v39;
      if ([(NSNumber *)self->_use_multiline BOOLValue])
      {
        long long v43 = v62;
        if (!v62)
        {
          if (a5 && *a5)
          {
            uint64_t v44 = v34;
            do
            {
              size_t v45 = strcspn(a5, "\n");
              [(BRCTermDumper *)self->_dumper puts:"\n\t" len:2];
              [v65 dumpPrefixWithKind:v17 depth:v44 to:self->_dumper];
              [(BRCTermDumper *)self->_dumper puts:a5 len:v45];
              uint64_t v17 = 0;
              if (a5[v45] == 10) {
                a5 += v45 + 1;
              }
              else {
                a5 += v45;
              }
            }
            while (*a5);
          }
          [(BRCTermDumper *)self->_dumper puts:"\n" len:1];
          id v21 = v66;
          id v24 = v39;
          long long v43 = 0;
          id v26 = v64;
          goto LABEL_63;
        }
        [(BRCTermDumper *)self->_dumper puts:"\n\t" len:2];
        [v62 dumpEndSectionTo:self->_dumper];
        id v26 = v64;
      }
      else
      {
        [(BRCTermDumper *)self->_dumper puts:" " len:1];
        long long v43 = v62;
        id v26 = v64;
        if (v62)
        {
          [v62 dumpEndSectionTo:self->_dumper];
        }
        else
        {
          [v65 dumpPrefixWithKind:v17 depth:v34 to:self->_dumper];
          [(BRCTermDumper *)self->_dumper puts:a5];
          [(BRCTermDumper *)self->_dumper puts:"\n" len:1];
        }
      }
      id v21 = v66;
LABEL_63:

      goto LABEL_64;
    }
    id v35 = v68;
    id v36 = (const char *)[v35 UTF8String];
    [(BRCTermDumper *)self->_dumper startFgColor:6 attr:2];
    if (!strcmp(v36, "com.apple.FileProvider.LocalStorage"))
    {
      dumper = self->_dumper;
      v47 = "local";
      unint64_t v48 = 5;
    }
    else if (!strncmp(v36, "com.apple.CloudDocs.MobileDocumentsFileProvider", 0x2FuLL))
    {
      dumper = self->_dumper;
      v47 = "clouddocs";
      unint64_t v48 = 9;
    }
    else
    {
      if (!strncmp(v36, "com.apple.CloudDocs.FileProvider", 0x20uLL))
      {
        unsigned int v49 = [v35 hasSuffix:@".data"];
        v50 = "docs";
        if (v49) {
          v50 = "data";
        }
        -[BRCTermDumper write:](self->_dumper, "write:", "icloud.%s", v50);
        goto LABEL_91;
      }
      if (!strncmp(v36, "com.apple.icloud.drive.fileprovider", 0x23uLL))
      {
        id v51 = v25;
        id v52 = v24;
        id v53 = v22;
        size_t v54 = strlen(v36);
        if (v54 == 35)
        {
          [(BRCTermDumper *)self->_dumper puts:"icloud.default"];
        }
        else
        {
          size_t v57 = v54;
          if ([v35 hasSuffix:@".data"])
          {
            -[BRCTermDumper write:](self->_dumper, "write:", "icloud.data[%c%c]", (v36[35] + 1), (v36[35] + 2));
          }
          else
          {
            unsigned int v59 = [v35 hasSuffix:@".documents"];
            v60 = self->_dumper;
            if (v59) {
              -[BRCTermDumper write:](v60, "write:", "icloud.docs[%c%c]", (v36[35] + 1), (v36[35] + 2));
            }
            else {
              [(BRCTermDumper *)v60 puts:v36 len:v57];
            }
          }
        }
        id v22 = v53;
        id v24 = v52;
        id v25 = v51;
        goto LABEL_91;
      }
      if (!strncmp(v36, "com.example.FruitBasket.Provider", 0x20uLL))
      {
        size_t v55 = strlen(v36);
        if (v55 == 32) {
          goto LABEL_81;
        }
        unint64_t v48 = v55;
        dumper = self->_dumper;
        if (v48 >= 0x2A)
        {
          v56 = (char *)(v36 + 33);
LABEL_87:
          -[BRCTermDumper write:](dumper, "write:", "FruitBasket.%.8s", v56);
          goto LABEL_91;
        }
      }
      else
      {
        if (strncmp(v36, "com.apple.FruitBasket.Provider", 0x1EuLL))
        {
          v37 = self->_dumper;
          v38 = v36;
LABEL_82:
          [(BRCTermDumper *)v37 puts:v38];
          goto LABEL_91;
        }
        size_t v58 = strlen(v36);
        if (v58 == 30)
        {
LABEL_81:
          v37 = self->_dumper;
          v38 = "FruitBasket.default";
          goto LABEL_82;
        }
        unint64_t v48 = v58;
        dumper = self->_dumper;
        if (v48 >= 0x28)
        {
          v56 = (char *)(v36 + 31);
          goto LABEL_87;
        }
      }
      v47 = v36;
    }
    [(BRCTermDumper *)dumper puts:v47 len:v48];
LABEL_91:
    [(BRCTermDumper *)self->_dumper puts:" " len:1];
    uint64_t v34 = a10;
    goto LABEL_38;
  }
LABEL_64:
}

- (void)pushSection:(id)a3 forThread:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_sectionsByThread objectForKeyedSubscript:v6];
  if (!v7)
  {
    v7 = +[NSMutableArray array];
    [(NSMutableDictionary *)self->_sectionsByThread setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v8];
}

- (void)getDepth:(int *)a3 current:(id *)a4 previous:(id *)a5 forThread:(id)a6
{
  id v10 = a6;
  [(NSMutableDictionary *)self->_sectionsByThread objectForKeyedSubscript:v10];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (char *)[v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    v13 = v12;
    id v26 = a3;
    v27 = a4;
    id v28 = a5;
    id v29 = v10;
    dispatch_queue_t v14 = 0;
    uint64_t v15 = 0;
    dispatch_semaphore_t v16 = 0;
    uint64_t v17 = *(void *)v33;
    id obj = v11;
    do
    {
      v18 = 0;
      id v30 = v16;
      v19 = v16 + 1;
      do
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v18);
        id v21 = +[NSNull null];

        if (v20 == v21)
        {
          dispatch_queue_t v14 = &v18[(void)v19];
          uint64_t v15 = 0;
        }
        else
        {
          ++v15;
        }
        ++v18;
      }
      while (v13 != v18);
      id v11 = obj;
      dispatch_semaphore_t v16 = &v13[(void)v30];
      v13 = (char *)[obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v13);

    a4 = v27;
    int *v26 = v15;
    a5 = v28;
    id v10 = v29;
    if (v15)
    {
      id *v27 = [obj objectAtIndex:&v14[v15 - 1]];
      if (v15 != 1)
      {
        *id v28 = [obj objectAtIndex:&v14[v15 - 2]];
      }
    }
  }
  else
  {

    *a3 = 0;
  }
  id v22 = *a4;
  id v23 = +[NSNull null];
  if (v22 == v23) {
    sub_100016C24();
  }

  id v24 = *a5;
  id v25 = +[NSNull null];
  if (v24 == v25) {
    sub_100016C50();
  }
}

- (void)outputEvent:(id)a3
{
  id v4 = a3;
  if ([v4 eventType] == (id)1024)
  {
    id v6 = v4;
    int v7 = [v6 messageType];
    int v8 = 0;
    if (v7 <= 1)
    {
      if (v7)
      {
        if (v7 == 1) {
          int v8 = 6;
        }
      }
      else
      {
        int v8 = 5;
      }
    }
    else
    {
      switch(v7)
      {
        case 2:
          int v8 = 7;
          break;
        case 16:
          int v8 = 3;
          break;
        case 17:
          int v8 = 2;
          break;
      }
    }
    v9 = [v6 eventMessage];

    if (!v9) {
      [v6 setEventMessage:@"<libtrace was unable to decode this message>"];
    }
    id v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 threadID]);
    id v11 = [v6 eventMessage];
    v12 = (const char *)[v11 UTF8String];

    if (self->_quickMode)
    {
      size_t v54 = [v6 category];
      [v6 subsystem];
      id v52 = v58 = self;
      id v50 = [v6 threadID];
      [v6 processImagePath];
      dispatch_queue_t v14 = v13 = v12;
      [v14 lastPathComponent];
      uint64_t v15 = v56 = v10;
      unsigned int v16 = [v6 processID];
      [v6 timestamp];
      uint64_t v17 = v5;
      v19 = id v18 = v4;
      v20 = [v6 timezone];
      LOBYTE(v44) = [v6 br_isOversize];
      LODWORD(v43) = v8;
      -[BRCTLLogCommand printLogWithFacility:subsystem:message:threadID:kind:sender:sendPID:depth:level:timestamp:timezone:sectionID:isOversize:previousSectionID:](v58, "printLogWithFacility:subsystem:message:threadID:kind:sender:sendPID:depth:level:timestamp:timezone:sectionID:isOversize:previousSectionID:", v54, v52, v13, v50, 0, v15, v16, v43, v19, v20, 0, v44, 0);

      id v4 = v18;
      v5 = v17;

      id v10 = v56;
LABEL_63:

      goto LABEL_64;
    }
    [(NSMutableArray *)self->_allEvents addObject:v6];
    id v21 = [v6 category];

    if (!v21) {
      goto LABEL_63;
    }
    uint64_t v22 = 7;
    if (!strncmp(v12, "[CRIT] ", 7uLL))
    {
      int v23 = 2;
    }
    else
    {
      uint64_t v22 = 8;
      if (!strncmp(v12, "[ERROR] ", 8uLL))
      {
        int v23 = 3;
      }
      else
      {
        uint64_t v22 = 10;
        if (!strncmp(v12, "[WARNING] ", 0xAuLL))
        {
          int v23 = 4;
        }
        else
        {
          uint64_t v22 = 9;
          if (!strncmp(v12, "[NOTICE] ", 9uLL))
          {
            int v23 = 5;
          }
          else
          {
            uint64_t v22 = 7;
            if (!strncmp(v12, "[INFO] ", 7uLL))
            {
              int v23 = 6;
            }
            else
            {
              uint64_t v22 = 8;
              int v23 = 7;
              if (strncmp(v12, "[DEBUG] ", 8uLL))
              {
                int v24 = strncmp(v12, "[NOTIF] ", 8uLL);
                if (v24) {
                  int v23 = v8;
                }
                else {
                  int v23 = 7;
                }
                uint64_t v22 = 8 * (v24 == 0);
              }
            }
          }
        }
      }
    }
    if ([(NSNumber *)self->_level intValue] && v23 > [(NSNumber *)self->_level intValue]) {
      goto LABEL_63;
    }
    id v25 = &v12[v22];
    if (!strncmp(v25, "┏", 3uLL))
    {
      v25 += 3;
      __endptr[0] = 0;
      uint64_t v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llx.%@.%llx", [v6 processUniqueID], v10, strtoll(v25, __endptr, 16));
      uint64_t v26 = 2;
    }
    else
    {
      uint64_t v26 = 3;
      if (strncmp(v25, "┗", 3uLL))
      {
        if (!strncmp(v25, "┣", 3uLL))
        {
          uint64_t v26 = 4;
        }
        else
        {
          if (strncmp(v25, "┳", 3uLL))
          {
            uint64_t v27 = 0;
            goto LABEL_52;
          }
          uint64_t v26 = 5;
        }
      }
      v25 += 3;
      __endptr[0] = 0;
      uint64_t v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llx.%llx", [v6 processUniqueID], strtoll(v25, __endptr, 16));
    }
    if (__endptr[0] != v25)
    {
      if (*__endptr[0] == 32) {
        id v25 = __endptr[0] + 1;
      }
      else {
        id v25 = __endptr[0];
      }
      switch(v26)
      {
        case 5:
          id v28 = +[NSNull null];
          [(BRCTLLogCommand *)self pushSection:v28 forThread:v10];

          [(BRCTLLogCommand *)self pushSection:v27 forThread:v10];
          uint64_t v26 = 5;
          break;
        case 4:
          [(BRCTLLogCommand *)self pushSection:v27 forThread:v10];
          uint64_t v26 = 4;
          break;
        case 2:
          [(BRCTLLogCommand *)self pushSection:v27 forThread:v10];
          uint64_t v26 = 2;
          break;
      }
LABEL_55:
      unsigned int v49 = (void *)v27;
      id v51 = v25;
      int v53 = v23;
      size_t v55 = v5;
      id v57 = v4;
      LODWORD(__endptr[0]) = 0;
      id v60 = 0;
      id v61 = 0;
      [(BRCTLLogCommand *)self getDepth:__endptr current:&v61 previous:&v60 forThread:v10];
      id v47 = v61;
      id v29 = v60;
      unsigned int v59 = self;
      uint64_t v48 = v26;
      if (v26 == 3)
      {
        id v30 = [(NSMutableDictionary *)self->_sectionsByThread objectForKeyedSubscript:v10];
        [v30 removeLastObject];
        [v30 lastObject];
        v32 = id v31 = v29;
        long long v33 = +[NSNull null];

        BOOL v34 = v32 == v33;
        id v29 = v31;
        if (!v34) {
          goto LABEL_61;
        }
      }
      else
      {
        if (v26 != 4)
        {
LABEL_62:
          v46 = [v6 category];
          long long v35 = [v6 subsystem];
          id v45 = [v6 threadID];
          id v36 = [v6 processImagePath];
          v37 = [v36 lastPathComponent];
          unsigned int v38 = [v6 processID];
          unsigned int v39 = __endptr[0];
          [v6 timestamp];
          v41 = id v40 = v10;
          long long v42 = [v6 timezone];
          LOBYTE(v44) = [v6 br_isOversize];
          LODWORD(v43) = v53;
          -[BRCTLLogCommand printLogWithFacility:subsystem:message:threadID:kind:sender:sendPID:depth:level:timestamp:timezone:sectionID:isOversize:previousSectionID:](v59, "printLogWithFacility:subsystem:message:threadID:kind:sender:sendPID:depth:level:timestamp:timezone:sectionID:isOversize:previousSectionID:", v46, v35, v51, v45, v48, v37, __PAIR64__(v39, v38), v43, v41, v42, v47, v44, v29);

          id v10 = v40;
          v5 = v55;
          id v4 = v57;
          goto LABEL_63;
        }
        id v30 = [(NSMutableDictionary *)self->_sectionsByThread objectForKeyedSubscript:v10];
      }
      [v30 removeLastObject];
LABEL_61:

      goto LABEL_62;
    }
LABEL_52:
    uint64_t v26 = 0;
    goto LABEL_55;
  }
LABEL_64:
}

- (BOOL)outputEvents:(id)a3 error:(id)a4
{
  id v6 = a3;
  int v7 = v6;
  if (a4)
  {
    dumper = self->_dumper;
    id v9 = [a4 description];
    -[BRCTermDumper write:](dumper, "write:", "error while reading logs: %s", [v9 UTF8String]);
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v7);
          }
          [(BRCTLLogCommand *)self outputEvent:*(void *)(*((void *)&v15 + 1) + 8 * (void)v13)];
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }

  return a4 == 0;
}

- (BOOL)activityStream:(id)a3 results:(id)a4
{
  return [(BRCTLLogCommand *)self outputEvents:a4 error:0];
}

- (void)streamDidFail:(id)a3 error:(id)a4
{
}

- (void)streamDidStop:(id)a3
{
}

- (int)dumpOrStreamLogArchiveToFd:(int)a3
{
  predicate = self->_predicate;
  id v4 = +[NSArray arrayWithObjects:&predicate count:1];
  v5 = +[NSCompoundPredicate andPredicateWithSubpredicates:v4];

  id v6 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  dumpSema = self->_dumpSema;
  self->_dumpSema = v6;

  int v8 = +[NSMutableDictionary dictionary];
  sectionsByThread = self->_sectionsByThread;
  self->_sectionsByThread = v8;

  log_path = self->_log_path;
  if (!log_path)
  {
    if (self->_waitForMoreMessages)
    {
LABEL_9:
      id v11 = objc_alloc_init((Class)OSActivityStream);
      [v11 setEventFilter:4];
      [v11 setPredicate:v5];
      [v11 setOptions:772];
      [v11 setDelegate:self];
      [v11 start];

LABEL_33:
      int v16 = 0;
LABEL_34:
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_dumpSema, 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_35;
    }
LABEL_12:
    id v17 = objc_alloc_init((Class)OSLogPersistence);
    if (self->_log_path)
    {
      long long v18 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
      [v17 setLogArchive:v18];
    }
    [v17 setPredicate:v5];
    [v17 setOptions:2147483651];
    if ([(NSNumber *)self->_page BOOLValue]) {
      [(BRCTermDumper *)self->_dumper startPager];
    }
    if (self->_lastDateComponent)
    {
      v19 = [v17 endDate];
      v20 = v19;
      if (v19)
      {
        id v21 = v19;
      }
      else
      {
        id v21 = +[NSDate now];
      }
      startDate = self->_startDate;
      self->_startDate = v21;

      id v31 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
      long long v32 = [v31 dateByAddingComponents:self->_lastDateComponent toDate:self->_startDate options:0];
      long long v33 = self->_startDate;
      self->_startDate = v32;
    }
    BOOL v34 = self->_startDate;
    endDate = self->_endDate;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100005AD8;
    v41[3] = &unk_100024AD8;
    v41[4] = self;
    [v17 enumerateFromStartDate:v34 toEndDate:endDate withBlock:v41];
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_dumpSema);
    dispatch_sync((dispatch_queue_t)self->_outputQueue, &stru_100024B18);

    goto LABEL_33;
  }
  if ([(NSString *)log_path isEqualToString:@"-"])
  {
    if (!self->_waitForMoreMessages)
    {
LABEL_19:
      if ([(NSNumber *)self->_page BOOLValue]) {
        [(BRCTermDumper *)self->_dumper startPager];
      }
      uint64_t v22 = [(NSString *)self->_log_path fileSystemRepresentation];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      unsigned int v38 = sub_100005BD4;
      unsigned int v39 = &unk_100024B40;
      id v40 = self;
      int v23 = v37;
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x3032000000;
      uint64_t v48 = sub_100006998;
      unsigned int v49 = sub_1000069A8;
      id v50 = 0;
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2020000000;
      char v44 = 1;
      *(void *)&v42.st_dev = _NSConcreteStackBlock;
      v42.st_ino = 3221225472;
      *(void *)&v42.st_uid = sub_1000069B0;
      *(void *)&v42.st_rdev = &unk_100024DF0;
      v42.st_atimespec.tv_nsec = (uint64_t)v43;
      v42.st_mtimespec.tv_sec = (__darwin_time_t)&v45;
      int v24 = v23;
      v42.st_atimespec.tv_sec = (__darwin_time_t)v24;
      id v25 = &v42;
      if (!strcmp(v22, "-"))
      {
        uint64_t v26 = __stdinp;
        if (__stdinp) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v26 = fopen(v22, "r");
        if (v26)
        {
LABEL_23:
          size_t __linecapp = 0;
          __linep = 0;
          if (getline(&__linep, &__linecapp, v26) < 0)
          {
            int v29 = 0;
          }
          else
          {
            while (1)
            {
              id v28 = +[NSString stringWithUTF8String:__linep];
              if (!v28) {
                break;
              }
              int v29 = (*(uint64_t (**)(stat *, void *))&v42.st_uid)(v25, v28);
              if (v29 < 0) {
                goto LABEL_38;
              }

              if (getline(&__linep, &__linecapp, v26) < 0) {
                goto LABEL_39;
              }
            }
            int v29 = -1;
LABEL_38:
          }
LABEL_39:
          if (feof(v26)) {
            int v16 = v29;
          }
          else {
            int v16 = -1;
          }
          free(__linep);
          if (v26 != __stdinp) {
            fclose(v26);
          }

          if ((v16 & 0x80000000) == 0)
          {
            int v16 = v29;
            if (v46[5]) {
              int v16 = ((uint64_t (*)(void *))v38)(v24);
            }
          }
          goto LABEL_47;
        }
      }

      int v16 = -1;
LABEL_47:

      _Block_object_dispose(v43, 8);
      _Block_object_dispose(&v45, 8);

      dispatch_semaphore_signal((dispatch_semaphore_t)self->_dumpSema);
      dispatch_sync((dispatch_queue_t)self->_outputQueue, &stru_100024B60);
      goto LABEL_34;
    }
    goto LABEL_9;
  }
  memset(&v42, 0, sizeof(v42));
  if ((stat([(NSString *)self->_log_path fileSystemRepresentation], &v42) & 0x80000000) == 0)
  {
    if (self->_waitForMoreMessages) {
      goto LABEL_9;
    }
    if ((v42.st_mode & 0xF000) != 0x4000) {
      goto LABEL_19;
    }
    goto LABEL_12;
  }
  uint64_t v12 = __stderrp;
  v13 = [(NSString *)self->_log_path fileSystemRepresentation];
  dispatch_queue_t v14 = __error();
  long long v15 = strerror(*v14);
  int v16 = -1;
LABEL_35:

  return v16;
}

- (int)dumpToFd:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  [(BRCTLLogCommand *)self computeRealOptionsForFd:v5];

  id v6 = (BRCTermDumper *)[objc_alloc((Class)BRCTermDumper) initWithFd:v3 forceColor:-[NSNumber BOOLValue](self->_use_color, "BOOLValue") darkMode:self->_darkMode];
  dumper = self->_dumper;
  self->_dumper = v6;

  return [(BRCTLLogCommand *)self dumpOrStreamLogArchiveToFd:v3];
}

+ (id)dateFromUTF8String:(const char *)a3
{
  uint64_t v3 = +[NSString stringWithUTF8String:a3];
  id v4 = objc_opt_new();
  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ssZZZ"];
  v5 = [v4 dateFromString:v3];
  if (!v5)
  {
    [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    v5 = [v4 dateFromString:v3];
    if (!v5)
    {
      [v4 setDateFormat:@"yyyy-MM-dd HH:mm"];
      v5 = [v4 dateFromString:v3];
      if (!v5)
      {
        [v4 setDateFormat:@"yyyy-MM-dd"];
        v5 = [v4 dateFromString:v3];
      }
    }
  }

  return v5;
}

+ (id)dateComponentsFromUTF8String:(const char *)a3
{
  uint64_t v3 = +[NSString stringWithUTF8String:a3];
  id v4 = [v3 length];
  uint64_t v18 = 0;
  v5 = +[NSRegularExpression regularExpressionWithPattern:@"^(\\d+)([mhd])$" options:0 error:&v18];
  id v6 = [v5 firstMatchInString:v3 options:0 range:v4];
  int v7 = v6;
  if (v6)
  {
    id v8 = [v6 rangeAtIndex:1];
    uint64_t v10 = v9;
    id v11 = [v7 rangeAtIndex:2];
    v13 = [v3 substringWithRange:v11, v12];
    dispatch_queue_t v14 = [v3 substringWithRange:v8, v10];
    uint64_t v15 = -(uint64_t)[v14 integerValue];

    int v16 = objc_opt_new();
    if ([v13 isEqualToString:@"m"])
    {
      [v16 setMinute:v15];
    }
    else if ([v13 isEqualToString:@"h"])
    {
      [v16 setHour:v15];
    }
    else if ([v13 isEqualToString:@"d"])
    {
      [v16 setDay:v15];
    }
  }
  else
  {
    int v16 = 0;
  }

  return v16;
}

- (void)buildPredicateString:(id)a3
{
  predicateString = self->_predicateString;
  id v5 = a3;
  if (predicateString)
  {
    [(NSMutableString *)predicateString appendString:@" || "];
  }
  else
  {
    id v6 = (NSMutableString *)objc_opt_new();
    int v7 = self->_predicateString;
    self->_predicateString = v6;
  }
  [(NSMutableString *)self->_predicateString appendString:a3];
}

- (void)buildPredicateFromString
{
  predicateString = self->_predicateString;
  if (!predicateString || ![(NSMutableString *)predicateString length])
  {
    +[NSMutableString stringWithString:@"subsystem == \"com.apple.FileProvider\" || subsystem == \"com.apple.clouddocs\" || subsystem == \"com.apple.revisiond\""];
    id v4 = (NSMutableString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_predicateString;
    self->_predicateString = v4;
  }
  id v6 = +[NSPredicate predicateWithFormat:self->_predicateString];
  predicate = self->_predicate;
  self->_predicate = v6;

  id v8 = self->_predicateString;
  self->_predicateString = 0;
}

- (void)parseOption:(int)a3 arg:(const char *)a4
{
  switch(a3)
  {
    case 'D':
      CFStringRef v5 = @"(subsystem == \"com.apple.FileProvider\" && subsystem == \"com.apple.LiveFS\")";
      goto LABEL_27;
    case 'E':
      endDate = [(id)objc_opt_class() dateFromUTF8String:a4];
      id v10 = endDate;
      if (!endDate) {
        endDate = self->_endDate;
      }
      p_endDate = (id *)&self->_endDate;
      goto LABEL_37;
    case 'F':
      CFStringRef v5 = @"subsystem == \"com.apple.FileProvider\" || subsystem == \"com.apple.FruitBasket\" || subsystem == \"com.example.FruitBasket\"";
      goto LABEL_27;
    case 'H':
      self->_home_path = +[NSString stringWithUTF8String:a4];
      goto LABEL_23;
    case 'N':
      CFStringRef v5 = CFSTR("(process == \"Provider\" && (subsystem == \"com.apple.network\" || sender == \"CFNetwork\")");
      goto LABEL_27;
    case 'S':
      endDate = [(id)objc_opt_class() dateFromUTF8String:a4];
      id v10 = endDate;
      if (!endDate) {
        endDate = self->_startDate;
      }
      p_endDate = (id *)&self->_startDate;
      goto LABEL_37;
    case 'a':
      self->_predicate = +[NSPredicate predicateWithValue:1];
      goto LABEL_23;
    case 'b':
      CFStringRef v5 = @"subsystem == \"com.apple.clouddocs\"";
      goto LABEL_27;
    case 'c':
      sub_100009B04(99, a4, &off_100027FC0);
      self->_use_color = (NSNumber *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 'd':
      self->_log_path = +[NSString stringWithUTF8String:a4];
      goto LABEL_23;
    case 'f':
      CFStringRef v5 = @"subsystem == \"com.apple.FileProvider\" || (subsystem == \"com.apple.clouddocs\" && senderImagePath ENDSWITH \"com.apple.CloudDocs.MobileDocumentsFileProvider\")";
      goto LABEL_27;
    case 'g':
      CFStringRef v5 = @"subsystem == \"com.apple.revisiond\"";
      goto LABEL_27;
    case 'i':
      CFStringRef v5 = @"subsystem == \"com.apple.prequelite\" || subsystem == \"com.apple.clouddocs\"";
      goto LABEL_27;
    case 'k':
      self->_darkMode = 1;
      return;
    case 'l':
      self->_level = +[NSNumber numberWithLongLong:strtoll(a4, 0, 10)];
      goto LABEL_23;
    case 'm':
      sub_100009B04(109, a4, &off_100027FC0);
      self->_use_multiline = (NSNumber *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 'n':
      self->_initial_count = +[NSNumber numberWithLongLong:strtoll(a4, 0, 10)];
LABEL_23:
      _objc_release_x1();
      return;
    case 'o':
      CFStringRef v5 = @"subsystem == \"com.apple.FileProvider\" && category == \"local-storage\"";
LABEL_27:
      [(BRCTLLogCommand *)self buildPredicateString:v5];
      return;
    case 'p':
      id v10 = +[NSString stringWithUTF8String:optarg];
      [(BRCTLLogCommand *)self buildPredicateString:v10];
      goto LABEL_41;
    case 'q':
      self->_quickMode = 1;
      return;
    case 's':
      self->_digest = 1;
      return;
    case 't':
      self->_shorten = 1;
      return;
    case 'u':
      endDate = [(id)objc_opt_class() dateComponentsFromUTF8String:a4];
      id v10 = endDate;
      if (!endDate) {
        endDate = self->_lastDateComponent;
      }
      p_endDate = (id *)&self->_lastDateComponent;
LABEL_37:
      objc_storeStrong(p_endDate, endDate);
      goto LABEL_41;
    case 'w':
      self->_waitForMoreMessages = 1;
      return;
    case 'x':
      id v10 = +[NSString stringWithUTF8String:optarg];
      id v8 = +[NSString stringWithFormat:@"senderImagePath CONTAINS \"%@\"", v10];
      [(BRCTLLogCommand *)self buildPredicateString:v8];

LABEL_41:

      break;
    case 'z':
      self->_timezoneAware = 0;
      timestampFormatter = self->_timestampFormatter;
      [(NSDateFormatter *)timestampFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
      break;
    default:
      return;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampFormatter, 0);
  objc_storeStrong((id *)&self->_sectionsByThread, 0);
  objc_storeStrong((id *)&self->_allEvents, 0);
  objc_storeStrong((id *)&self->_dumpSema, 0);
  objc_storeStrong((id *)&self->_regularExpressionReplacementInfos, 0);
  objc_storeStrong((id *)&self->_uuidToSection, 0);
  objc_storeStrong((id *)&self->_outputSemaphore, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_dumper, 0);
  objc_storeStrong((id *)&self->_predicateString, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_lastDateComponent, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_home_path, 0);
  objc_storeStrong((id *)&self->_log_path, 0);
  objc_storeStrong((id *)&self->_initial_count, 0);
  objc_storeStrong((id *)&self->_use_multiline, 0);
  objc_storeStrong((id *)&self->_page, 0);

  objc_storeStrong((id *)&self->_use_color, 0);
}

@end
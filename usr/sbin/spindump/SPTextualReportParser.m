@interface SPTextualReportParser
+ (BOOL)isSpindumpFile:(const char *)a3;
- (BOOL)isHeavy;
- (BOOL)parseSpindumpFile:(const char *)a3 andReportToStream:(__sFILE *)a4;
- (BOOL)symbolicate;
- (BOOL)useDsymForUUIDForEverything;
- (NSArray)findDsymsForIDs;
- (int)endIndex;
- (int)omitFramesBelowSampleCount;
- (int)startIndex;
- (void)dealloc;
- (void)setEndIndex:(int)a3;
- (void)setFindDsymsForIDs:(id)a3;
- (void)setIsHeavy:(BOOL)a3;
- (void)setOmitFramesBelowSampleCount:(int)a3;
- (void)setStartIndex:(int)a3;
- (void)setSymbolicate:(BOOL)a3;
- (void)setUseDsymForUUIDForEverything:(BOOL)a3;
@end

@implementation SPTextualReportParser

+ (BOOL)isSpindumpFile:(const char *)a3
{
  v4 = fopen(a3, "r");
  if (v4)
  {
    v5 = v4;
    v6 = (char *)malloc_type_malloc(0x4000uLL, 0x342C76BFuLL);
    while (fgets(v6, 0x4000, v5))
    {
      if (!strncmp("Report Version:", v6, 0xFuLL))
      {
        BOOL v7 = strtol(v6 + 15, 0, 0) != 0;
        goto LABEL_16;
      }
    }
    BOOL v7 = 0;
LABEL_16:
    free(v6);
    fclose(v5);
  }
  else
  {
    if (byte_1000EBCF8)
    {
      int v8 = *__error();
      v9 = sub_10002E548();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100099A00();
      }
      *__error() = v8;
    }
    if (byte_1000EBCF9) {
      BOOL v10 = dword_1000EB4A8 <= 3;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      int v11 = *__error();
      uint64_t v12 = *__error();
      v13 = __error();
      v14 = strerror(*v13);
      CFStringRef v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Unable to open %s: %d (%s)", a3, v12, v14);
      if (v15)
      {
        CFStringRef v16 = v15;
        CStringPtr = CFStringGetCStringPtr(v15, 0x8000100u);
        if (CStringPtr)
        {
          v18 = (char *)CStringPtr;
          v19 = 0;
        }
        else
        {
          v18 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x59BEC203uLL);
          CFStringGetCString(v16, v18, 1024, 0x8000100u);
          v19 = v18;
        }
        if (qword_1000EBD00) {
          v22 = (FILE *)qword_1000EBD00;
        }
        else {
          v22 = __stderrp;
        }
        fprintf(v22, "%s\n", v18);
        if (v19) {
          free(v19);
        }
        CFRelease(v16);
      }
      else
      {
        v20 = sub_10002E548();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          sub_10009996C();
        }
        if (qword_1000EBD00) {
          v21 = (FILE *)qword_1000EBD00;
        }
        else {
          v21 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v21);
      }
      BOOL v7 = 0;
      *__error() = v11;
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

- (BOOL)parseSpindumpFile:(const char *)a3 andReportToStream:(__sFILE *)a4
{
  uint64_t v686 = 0;
  v687 = &v686;
  uint64_t v688 = 0x2020000000;
  uint64_t v689 = 0;
  uint64_t v682 = 0;
  v683 = &v682;
  uint64_t v684 = 0x2020000000;
  int v685 = 0;
  v14 = fopen(a3, "r");
  if (!v14)
  {
    if (byte_1000EBCF8)
    {
      int v37 = *__error();
      v38 = sub_10002E548();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        int v84 = *__error();
        v85 = __error();
        v86 = strerror(*v85);
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = a3;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v84;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = v86;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Parsing spindump text: Unable to open %s: %d (%s)", buf, 0x1Cu);
      }
      *__error() = v37;
    }
    if (byte_1000EBCF9) {
      BOOL v39 = dword_1000EB4A8 <= 3;
    }
    else {
      BOOL v39 = 0;
    }
    if (v39)
    {
      int v23 = *__error();
      uint64_t v40 = *__error();
      v41 = __error();
      v42 = strerror(*v41);
      CFStringRef v43 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Unable to open %s: %d (%s)", a3, v40, v42);
      CFStringRef v44 = v43;
      if (v43)
      {
        CStringPtr = (char *)CFStringGetCStringPtr(v43, 0x8000100u);
        if (CStringPtr)
        {
          v46 = 0;
        }
        else
        {
          CStringPtr = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x8BE9E530uLL);
          CFStringGetCString(v44, CStringPtr, 1024, 0x8000100u);
          v46 = CStringPtr;
        }
        if (qword_1000EBD00) {
          v64 = (FILE *)qword_1000EBD00;
        }
        else {
          v64 = __stderrp;
        }
        fprintf(v64, "%s\n", CStringPtr);
        if (v46) {
          free(v46);
        }
        CFRelease(v44);
      }
      else
      {
        v54 = sub_10002E548();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
        {
          int v92 = *__error();
          v93 = __error();
          v94 = strerror(*v93);
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = a3;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v92;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = v94;
          _os_log_fault_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: Unable to open %s: %d (%s)", buf, 0x1Cu);
        }
        if (qword_1000EBD00) {
          v55 = (FILE *)qword_1000EBD00;
        }
        else {
          v55 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v55);
      }
      v65 = __error();
      goto LABEL_807;
    }
LABEL_39:
    v22 = 0;
    id obj = 0;
    id v650 = 0;
LABEL_40:
    char v21 = 0;
    goto LABEL_808;
  }
  v677[0] = _NSConcreteStackBlock;
  v677[1] = 3221225472;
  v678 = sub_10007C53C;
  v679 = &unk_1000DD2A8;
  v680 = &v682;
  v681 = &v686;
  sub_10007C53C((uint64_t)v677, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v15 = v687[3];
  do
  {
    if (!fgets((char *)v15, *((_DWORD *)v683 + 6), v14)) {
      goto LABEL_19;
    }
    uint64_t v15 = v687[3];
  }
  while (strncmp("Report Version:", (const char *)v15, 0xFuLL));
  uint64_t v16 = strtol((const char *)(v15 + 15), 0, 0);
  if (!v16)
  {
LABEL_19:
    if (byte_1000EBCF8)
    {
      int v31 = *__error();
      v32 = sub_10002E548();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_100099AC8();
      }
      *__error() = v31;
    }
    if (byte_1000EBCF9) {
      BOOL v33 = dword_1000EB4A8 <= 3;
    }
    else {
      BOOL v33 = 0;
    }
    if (v33)
    {
      int v23 = *__error();
      CFStringRef v34 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: No report version. Not a spindump file?");
      CFStringRef v28 = v34;
      if (v34)
      {
        v35 = (char *)CFStringGetCStringPtr(v34, 0x8000100u);
        if (v35)
        {
          v36 = 0;
        }
        else
        {
          v35 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x70620F69uLL);
          CFStringGetCString(v28, v35, 1024, 0x8000100u);
          v36 = v35;
        }
        if (qword_1000EBD00) {
          v56 = (FILE *)qword_1000EBD00;
        }
        else {
          v56 = __stderrp;
        }
        fprintf(v56, "%s\n", v35);
        if (v36) {
          free(v36);
        }
        goto LABEL_152;
      }
      v47 = sub_10002E548();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
        sub_100099A94();
      }
      if (qword_1000EBD00) {
        v48 = (FILE *)qword_1000EBD00;
      }
      else {
        v48 = __stderrp;
      }
      goto LABEL_109;
    }
    goto LABEL_39;
  }
  uint64_t v17 = v16;
  if (fgets((char *)v687[3], *((_DWORD *)v683 + 6), v14)
    && !strncmp("Report Variant:   condensed", (const char *)v687[3], 0x1BuLL))
  {
    if (byte_1000EBCF8)
    {
      int v57 = *__error();
      v58 = sub_10002E548();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        sub_10009A168();
      }
      *__error() = v57;
    }
    int v647 = 1;
    if (byte_1000EBCF9 && dword_1000EB4A8 <= 0)
    {
      int v59 = *__error();
      CFStringRef v60 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Detected condensed report variant");
      CFStringRef v61 = v60;
      if (v60)
      {
        v62 = (char *)CFStringGetCStringPtr(v60, 0x8000100u);
        if (v62)
        {
          v63 = 0;
        }
        else
        {
          v62 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x45530C98uLL);
          CFStringGetCString(v61, v62, 1024, 0x8000100u);
          v63 = v62;
        }
        if (qword_1000EBD00) {
          v90 = (FILE *)qword_1000EBD00;
        }
        else {
          v90 = __stderrp;
        }
        fprintf(v90, "%s\n", v62);
        if (v63) {
          free(v63);
        }
        CFRelease(v61);
      }
      else
      {
        v87 = sub_10002E548();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT)) {
          sub_10009A134();
        }
        if (qword_1000EBD00) {
          v88 = (FILE *)qword_1000EBD00;
        }
        else {
          v88 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v88);
      }
      *__error() = v59;
      int v647 = 1;
    }
  }
  else
  {
    int v647 = 0;
  }
  if (fseek(v14, 0, 0))
  {
    if (byte_1000EBCF8)
    {
      int v18 = *__error();
      v19 = sub_10002E548();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __error();
        v20 = __error();
        strerror(*v20);
        sub_10009A0F0();
      }
      *__error() = v18;
    }
    char v21 = 0;
    v22 = 0;
    if (byte_1000EBCF9)
    {
      id obj = 0;
      id v650 = 0;
      if (dword_1000EB4A8 > 3) {
        goto LABEL_808;
      }
      int v23 = *__error();
      uint64_t v24 = *__error();
      v25 = __error();
      v26 = strerror(*v25);
      CFStringRef v27 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text requires a seekable file: %d (%s)", v24, v26);
      CFStringRef v28 = v27;
      if (v27)
      {
        v29 = (char *)CFStringGetCStringPtr(v27, 0x8000100u);
        if (v29)
        {
          v30 = 0;
        }
        else
        {
          v29 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x71ECD36EuLL);
          CFStringGetCString(v28, v29, 1024, 0x8000100u);
          v30 = v29;
        }
        if (qword_1000EBD00) {
          v83 = (FILE *)qword_1000EBD00;
        }
        else {
          v83 = __stderrp;
        }
        fprintf(v83, "%s\n", v29);
        if (v30) {
          free(v30);
        }
LABEL_152:
        CFRelease(v28);
        goto LABEL_153;
      }
      v74 = sub_10002E548();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
      {
        __error();
        v75 = __error();
        strerror(*v75);
        sub_10009A0B4();
      }
      if (qword_1000EBD00) {
        v48 = (FILE *)qword_1000EBD00;
      }
      else {
        v48 = __stderrp;
      }
      goto LABEL_109;
    }
    goto LABEL_788;
  }
  if (v17 <= 19)
  {
    if (byte_1000EBCF8)
    {
      int v49 = *__error();
      v50 = sub_10002E548();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        sub_100099B30();
      }
      *__error() = v49;
    }
    char v21 = 0;
    v22 = 0;
    if (byte_1000EBCF9)
    {
      id obj = 0;
      id v650 = 0;
      if (dword_1000EB4A8 > 3) {
        goto LABEL_808;
      }
      int v23 = *__error();
      CFStringRef v51 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Unable to parse text of the report: spindump report version 20+ required");
      CFStringRef v28 = v51;
      if (v51)
      {
        v52 = (char *)CFStringGetCStringPtr(v51, 0x8000100u);
        if (v52)
        {
          v53 = 0;
        }
        else
        {
          v52 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC1DBFDE7uLL);
          CFStringGetCString(v28, v52, 1024, 0x8000100u);
          v53 = v52;
        }
        if (qword_1000EBD00) {
          v91 = (FILE *)qword_1000EBD00;
        }
        else {
          v91 = __stderrp;
        }
        fprintf(v91, "%s\n", v52);
        if (v53) {
          free(v53);
        }
        goto LABEL_152;
      }
      v89 = sub_10002E548();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT)) {
        sub_100099AFC();
      }
      if (qword_1000EBD00) {
        v48 = (FILE *)qword_1000EBD00;
      }
      else {
        v48 = __stderrp;
      }
LABEL_109:
      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v48);
LABEL_153:
      v65 = __error();
LABEL_807:
      v22 = 0;
      id obj = 0;
      id v650 = 0;
      char v21 = 0;
      int *v65 = v23;
      goto LABEL_808;
    }
LABEL_788:
    id obj = 0;
    id v650 = 0;
    goto LABEL_808;
  }
  if (v647) {
    v66 = @"^(?<indentCount>\\d+)(?<kernelDot>\\*)?\\s+(?<count>\\d+)\\s+(?:(?<binaryIndex>\\d+)\\s+\\+\\s+(?<offsetIntoBinary>\\d+)|\\?\\?\\?)$";
  }
  else {
    v66 = @"^(?<indentWhitespace> +(?<kernelDot>\\*)?)(?<countAndWhitespace>(?<count>\\d+)\\s+)(?:\\?\\?\\?(?:\\s+\\+\\s+(?<offsetIntoUnknownSymbol>\\d+))?|(?<symbolName>.*?)\\s+\\+\\s+(?<offsetIntoSymbol>\\d+))(?:\\s+\\((?:(?<sourceFilepath>.+?)(?::(?<sourceLineNumber>\\d+)(?:[:\\.,](?<sourceColumnNumber>\\d+))?)?\\s+in\\s+)?(?:<(?<binaryUuid>[\\dabcdef\\-]{32,36})>|(?<binaryName>.+?))\\s+\\+\\s+(?<offsetIntoBinary>\\d+)\\))?(?:\\s+\\[(?<address>(?:0x)?[\\dabcdef]+)\\])?(?:\\s+\\((?<stateInfo>.+?)\\))?(?:\\s+(?<startIndex>\\d+)(?:\\s*-\\s*(?<endIndex>\\d+))?)?$";
  }
  id v690 = 0;
  id v67 = [objc_alloc((Class)NSRegularExpression) initWithPattern:v66 options:1 error:&v690];
  if (!v67)
  {
    if (byte_1000EBCF8)
    {
      int v449 = *__error();
      v450 = sub_10002E548();
      if (os_log_type_enabled(v450, OS_LOG_TYPE_ERROR))
      {
        [(__CFString *)v66 UTF8String];
        [objc_msgSend(v690, "debugDescription") UTF8String];
        sub_100099BB4();
      }
      *__error() = v449;
    }
    if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
    {
      int v399 = *__error();
      id v400 = [(__CFString *)v66 UTF8String];
      CFStringRef v401 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: Unable to compile regex %s: %s", "regex", v400, [objc_msgSend(objc_msgSend(v690, "debugDescription"), "UTF8String") UTF8String]);
      CFStringRef v402 = v401;
      if (v401)
      {
        v548 = (char *)CFStringGetCStringPtr(v401, 0x8000100u);
        if (v548)
        {
          v549 = 0;
        }
        else
        {
          v548 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x6AE34780uLL);
          CFStringGetCString(v402, v548, 1024, 0x8000100u);
          v549 = v548;
        }
        if (qword_1000EBD00) {
          v562 = (FILE *)qword_1000EBD00;
        }
        else {
          v562 = __stderrp;
        }
        fprintf(v562, "%s\n", v548);
        if (v549) {
          free(v549);
        }
        CFRelease(v402);
      }
      else
      {
        v403 = sub_10002E548();
        if (os_log_type_enabled(v403, OS_LOG_TYPE_FAULT))
        {
          [(__CFString *)v66 UTF8String];
          [objc_msgSend(v690, "debugDescription") UTF8String];
          sub_100099B64();
        }
        if (qword_1000EBD00) {
          v404 = (FILE *)qword_1000EBD00;
        }
        else {
          v404 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v404);
      }
      *__error() = v399;
    }
    [(__CFString *)v66 UTF8String];
    [objc_msgSend(v690, "debugDescription") UTF8String];
    sub_10002E41C("CallTreeFrameLineRegex", "SPTextualReportParser.m", 1858, "%s: Unable to compile regex %s: %s", v563, v564, v565, v566, (char)"regex");
LABEL_1043:
    abort();
  }
  id v636 = v67;
  if (v647) {
    v68 = @"^(?<indentCount>\\d+)(?<kernelDot>\\*)?\\s+(?<count>\\d+)\\s+(?:state\\s+(?<stateInfo>(?:0x)?[\\dabcdef]+)|<(?<angleBracketContents>.*)>|(?<otherInfo>[^<\\s\\d].*))$";
  }
  else {
    v68 = @"^(?<indentWhitespace> +(?<kernelDot>\\*)?)(?<countAndWhitespace>(?<count>\\d+)\\s+)?<(?<angleBracketContents>.*)>(?:\\s+\\((?<stateInfo>.+?)\\))?(?:\\s+(?<startIndex>\\d+)(?:\\s*-\\s*(?<endIndex>\\d+))?)?$";
  }
  id v690 = 0;
  id v69 = [objc_alloc((Class)NSRegularExpression) initWithPattern:v68 options:1 error:&v690];
  if (!v69)
  {
    if (byte_1000EBCF8)
    {
      int v451 = *__error();
      v452 = sub_10002E548();
      if (os_log_type_enabled(v452, OS_LOG_TYPE_ERROR)) {
        sub_100099C48((uint64_t)[(__CFString *)v68 UTF8String], buf);
      }
      *__error() = v451;
    }
    if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
    {
      int v405 = *__error();
      CFStringRef v406 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: Unable to compile regex %s", "regex", [(__CFString *)v68 UTF8String]);
      CFStringRef v407 = v406;
      if (v406)
      {
        v515 = (char *)CFStringGetCStringPtr(v406, 0x8000100u);
        if (v515)
        {
          v516 = 0;
        }
        else
        {
          v515 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x75FE5649uLL);
          CFStringGetCString(v407, v515, 1024, 0x8000100u);
          v516 = v515;
        }
        if (qword_1000EBD00) {
          v539 = (FILE *)qword_1000EBD00;
        }
        else {
          v539 = __stderrp;
        }
        fprintf(v539, "%s\n", v515);
        if (v516) {
          free(v516);
        }
        CFRelease(v407);
      }
      else
      {
        v408 = sub_10002E548();
        if (os_log_type_enabled(v408, OS_LOG_TYPE_FAULT)) {
          sub_100099C04((uint64_t)[(__CFString *)v68 UTF8String], v695);
        }
        if (qword_1000EBD00) {
          v409 = (FILE *)qword_1000EBD00;
        }
        else {
          v409 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v409);
      }
      *__error() = v405;
    }
    [(__CFString *)v68 UTF8String];
    int v544 = 1921;
    v545 = "CallTreeNonFrameLineRegex";
    goto LABEL_1042;
  }
  id v614 = v69;
  if (v647) {
    v70 = @"^(?<binaryIndex>\\d+)\\t(?<kernelDot>\\*)?(?<bundleIdentifier>\\S+)?\\t(?<version>.+?)?\\t<(?<binaryUuid>[\\dabcdef\\-]{32,36})>\\t(?<segmentName>\\S+?)?\\t(?<binaryPath>.+?)?$";
  }
  else {
    v70 = @"^\\s*(?<kernelDot>\\*)?(?:(?<startAddress>(?:0x)?[\\dabcdef]+)|\\?\\?\\?)\\s*\\-\\s*(?:(?<endAddress>(?:0x)?[\\dabcdef]+)|\\?\\?\\?)\\s*(?:\\?\\?\\?|(?<bundleIdentifier>\\S+\\.\\S+\\.\\S+)|(?<name>.+?\\b))\\s+(?<version>(?:\\d[\\S]*?)?(?:\\s*\\(\\S+?\\)))?\\s*<(?<binaryUuid>[\\dabcdef\\-]{32,36})>(?<segmentName>\\S+?)?(?:\\s+(?<binaryPath>.+?)?)?$";
  }
  id v690 = 0;
  id v71 = [objc_alloc((Class)NSRegularExpression) initWithPattern:v70 options:1 error:&v690];
  if (!v71)
  {
    if (byte_1000EBCF8)
    {
      int v453 = *__error();
      v454 = sub_10002E548();
      if (os_log_type_enabled(v454, OS_LOG_TYPE_ERROR)) {
        sub_100099C48((uint64_t)[(__CFString *)v70 UTF8String], buf);
      }
      *__error() = v453;
    }
    if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
    {
      int v410 = *__error();
      CFStringRef v411 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: Unable to compile regex %s", "regex", [(__CFString *)v70 UTF8String]);
      CFStringRef v412 = v411;
      if (v411)
      {
        v517 = (char *)CFStringGetCStringPtr(v411, 0x8000100u);
        if (v517)
        {
          v518 = 0;
        }
        else
        {
          v517 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xA6D8E0EuLL);
          CFStringGetCString(v412, v517, 1024, 0x8000100u);
          v518 = v517;
        }
        if (qword_1000EBD00) {
          v546 = (FILE *)qword_1000EBD00;
        }
        else {
          v546 = __stderrp;
        }
        fprintf(v546, "%s\n", v517);
        if (v518) {
          free(v518);
        }
        CFRelease(v412);
      }
      else
      {
        v413 = sub_10002E548();
        if (os_log_type_enabled(v413, OS_LOG_TYPE_FAULT)) {
          sub_100099C04((uint64_t)[(__CFString *)v70 UTF8String], v695);
        }
        if (qword_1000EBD00) {
          v414 = (FILE *)qword_1000EBD00;
        }
        else {
          v414 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v414);
      }
      *__error() = v410;
    }
    [(__CFString *)v70 UTF8String];
    int v544 = 2000;
    v545 = "LoadInfoLineRegex";
    goto LABEL_1042;
  }
  id v611 = v71;
  id v690 = 0;
  id v72 = [objc_alloc((Class)NSRegularExpression) initWithPattern:@"^UUID:(?<whitespace>\\s*)(?:<?(?<binaryUuid>[\\dabcdef\\-]{32,36})>?|(?<binaryIndex>\\d+))$" options:1 error:&v690];
  if (!v72)
  {
    if (byte_1000EBCF8)
    {
      int v455 = *__error();
      v456 = sub_10002E548();
      if (os_log_type_enabled(v456, OS_LOG_TYPE_ERROR)) {
        sub_100099C48((uint64_t)[@"^UUID:(?<whitespace>\\s*)(?:<?(?<binaryUuid>[\\dabcdef\\-]{32,36})>?|(?<binaryIndex>\\d+))$" UTF8String], buf);
      }
      *__error() = v455;
    }
    if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
    {
      int v415 = *__error();
      CFStringRef v416 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: Unable to compile regex %s", "regex", [@"^UUID:(?<whitespace>\\s*)(?:<?(?<binaryUuid>[\\dabcdef\\-]{32,36})>?|(?<binaryIndex>\\d+))$" UTF8String]);
      CFStringRef v417 = v416;
      if (v416)
      {
        v519 = (char *)CFStringGetCStringPtr(v416, 0x8000100u);
        if (v519)
        {
          v520 = 0;
        }
        else
        {
          v519 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x84B472E2uLL);
          CFStringGetCString(v417, v519, 1024, 0x8000100u);
          v520 = v519;
        }
        if (qword_1000EBD00) {
          v547 = (FILE *)qword_1000EBD00;
        }
        else {
          v547 = __stderrp;
        }
        fprintf(v547, "%s\n", v519);
        if (v520) {
          free(v520);
        }
        CFRelease(v417);
      }
      else
      {
        v418 = sub_10002E548();
        if (os_log_type_enabled(v418, OS_LOG_TYPE_FAULT)) {
          sub_100099C04((uint64_t)[@"^UUID:(?<whitespace>\\s*)(?:<?(?<binaryUuid>[\\dabcdef\\-]{32,36})>?|(?<binaryIndex>\\d+))$" UTF8String], v695);
        }
        if (qword_1000EBD00) {
          v419 = (FILE *)qword_1000EBD00;
        }
        else {
          v419 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v419);
      }
      *__error() = v415;
    }
    [@"^UUID:(?<whitespace>\\s*)(?:<?(?<binaryUuid>[\\dabcdef\\-]{32,36})>?|(?<binaryIndex>\\d+))$" UTF8String];
    int v544 = 2026;
    v545 = "UUIDLineRegex";
LABEL_1042:
    sub_10002E41C(v545, "SPTextualReportParser.m", v544, "%s: Unable to compile regex %s", v540, v541, v542, v543, (char)"regex");
    goto LABEL_1043;
  }
  id v605 = v72;
  unsigned __int8 v676 = 0;
  if (v647)
  {
    int v674 = 2;
    int v675 = 2;
    int v73 = 1;
    unsigned __int8 v676 = 1;
  }
  else
  {
    int v674 = -1;
    int v675 = -1;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100082498;
    *(void *)&buf[24] = &unk_1000DDE80;
    *(void *)&buf[32] = v636;
    *(void *)&buf[40] = &v676;
    *(void *)&buf[48] = &v674;
    v697 = &v675;
    sub_10007F43C(v14, 0, (uint64_t)buf);
    if (v674 <= 0)
    {
      if (byte_1000EBCF8)
      {
        int v76 = *__error();
        v77 = sub_10002E548();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "Parsing spindump text: Unable to detect initial indentation, using 2", buf, 2u);
        }
        *__error() = v76;
      }
      if (byte_1000EBCF9 && dword_1000EB4A8 <= 1)
      {
        int v78 = *__error();
        CFStringRef v79 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Unable to detect initial indentation, using 2");
        CFStringRef v80 = v79;
        if (v79)
        {
          v81 = (char *)CFStringGetCStringPtr(v79, 0x8000100u);
          if (v81)
          {
            v82 = 0;
          }
          else
          {
            v81 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x1C6D0C18uLL);
            CFStringGetCString(v80, v81, 1024, 0x8000100u);
            v82 = v81;
          }
          if (qword_1000EBD00) {
            v97 = (FILE *)qword_1000EBD00;
          }
          else {
            v97 = __stderrp;
          }
          fprintf(v97, "%s\n", v81);
          if (v82) {
            free(v82);
          }
          CFRelease(v80);
        }
        else
        {
          v95 = sub_10002E548();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT)) {
            sub_10009A080();
          }
          if (qword_1000EBD00) {
            v96 = (FILE *)qword_1000EBD00;
          }
          else {
            v96 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v96);
        }
        *__error() = v78;
      }
      int v674 = 2;
    }
    if (v675 <= 0)
    {
      if (byte_1000EBCF8)
      {
        int v98 = *__error();
        v99 = sub_10002E548();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, "Parsing spindump text: Unable to detect incremental indentation, using 2", buf, 2u);
        }
        *__error() = v98;
      }
      if (byte_1000EBCF9 && dword_1000EB4A8 <= 1)
      {
        int v100 = *__error();
        CFStringRef v101 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Unable to detect incremental indentation, using 2");
        CFStringRef v102 = v101;
        if (v101)
        {
          v103 = (char *)CFStringGetCStringPtr(v101, 0x8000100u);
          if (v103)
          {
            v104 = 0;
          }
          else
          {
            v103 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xD40EDE75uLL);
            CFStringGetCString(v102, v103, 1024, 0x8000100u);
            v104 = v103;
          }
          if (qword_1000EBD00) {
            v107 = (FILE *)qword_1000EBD00;
          }
          else {
            v107 = __stderrp;
          }
          fprintf(v107, "%s\n", v103);
          if (v104) {
            free(v104);
          }
          CFRelease(v102);
        }
        else
        {
          v105 = sub_10002E548();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
            sub_10009A04C();
          }
          if (qword_1000EBD00) {
            v106 = (FILE *)qword_1000EBD00;
          }
          else {
            v106 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v106);
        }
        *__error() = v100;
      }
      int v675 = 2;
    }
    int v73 = v676;
  }
  if (!self->_isHeavy && v73)
  {
    if (byte_1000EBCF8)
    {
      int v108 = *__error();
      v109 = sub_10002E548();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
        sub_10009A018();
      }
      *__error() = v108;
    }
    char v21 = 0;
    v22 = 0;
    if (!byte_1000EBCF9) {
      goto LABEL_788;
    }
    id obj = 0;
    id v650 = 0;
    if (dword_1000EB4A8 > 3) {
      goto LABEL_808;
    }
    int v23 = *__error();
    CFStringRef v110 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Original report is not in timeline mode, so unable to output timeline mode");
    CFStringRef v111 = v110;
    if (v110)
    {
      v112 = (char *)CFStringGetCStringPtr(v110, 0x8000100u);
      if (v112)
      {
        v113 = 0;
      }
      else
      {
        v112 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF4434604uLL);
        CFStringGetCString(v111, v112, 1024, 0x8000100u);
        v113 = v112;
      }
      if (qword_1000EBD00) {
        v129 = (FILE *)qword_1000EBD00;
      }
      else {
        v129 = __stderrp;
      }
      fprintf(v129, "%s\n", v112);
      if (v113) {
        free(v113);
      }
LABEL_805:
      CFRelease(v111);
      goto LABEL_806;
    }
    v127 = sub_10002E548();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_FAULT)) {
      sub_100099FE4();
    }
    if (qword_1000EBD00) {
      v128 = (FILE *)qword_1000EBD00;
    }
    else {
      v128 = __stderrp;
    }
    goto LABEL_246;
  }
  int startIndex = self->_startIndex;
  if (v73)
  {
    if (startIndex || self->_endIndex)
    {
      if (byte_1000EBCF8)
      {
        int v115 = *__error();
        v116 = sub_10002E548();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
          sub_100099FB0();
        }
        *__error() = v115;
      }
      char v21 = 0;
      v22 = 0;
      if (!byte_1000EBCF9) {
        goto LABEL_788;
      }
      id obj = 0;
      id v650 = 0;
      if (dword_1000EB4A8 > 3) {
        goto LABEL_808;
      }
      int v23 = *__error();
      CFStringRef v117 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Original report is not in timeline mode, so unable to filter to start/end indexes");
      CFStringRef v111 = v117;
      if (v117)
      {
        v118 = (char *)CFStringGetCStringPtr(v117, 0x8000100u);
        if (v118)
        {
          v119 = 0;
        }
        else
        {
          v118 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x1BB86C60uLL);
          CFStringGetCString(v111, v118, 1024, 0x8000100u);
          v119 = v118;
        }
        if (qword_1000EBD00) {
          v133 = (FILE *)qword_1000EBD00;
        }
        else {
          v133 = __stderrp;
        }
        fprintf(v133, "%s\n", v118);
        if (v119) {
          free(v119);
        }
        goto LABEL_805;
      }
      v130 = sub_10002E548();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_FAULT)) {
        sub_100099F7C();
      }
      if (qword_1000EBD00) {
        v128 = (FILE *)qword_1000EBD00;
      }
      else {
        v128 = __stderrp;
      }
LABEL_246:
      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v128);
LABEL_806:
      v65 = __error();
      goto LABEL_807;
    }
  }
  else if (startIndex)
  {
LABEL_220:
    if (byte_1000EBCF8)
    {
      int v120 = *__error();
      v121 = sub_10002E548();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "Parsing spindump text: Stacks will be filtered to the sample index range specified, but process and thread summary information and timestamps will still reflect full time range", buf, 2u);
      }
      *__error() = v120;
    }
    if (byte_1000EBCF9 && dword_1000EB4A8 <= 2)
    {
      int v122 = *__error();
      CFStringRef v123 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Stacks will be filtered to the sample index range specified, but process and thread summary information and timestamps will still reflect full time range");
      CFStringRef v124 = v123;
      if (v123)
      {
        v125 = (char *)CFStringGetCStringPtr(v123, 0x8000100u);
        if (v125)
        {
          v126 = 0;
        }
        else
        {
          v125 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC528CE99uLL);
          CFStringGetCString(v124, v125, 1024, 0x8000100u);
          v126 = v125;
        }
        if (qword_1000EBD00) {
          v134 = (FILE *)qword_1000EBD00;
        }
        else {
          v134 = __stderrp;
        }
        fprintf(v134, "%s\n", v125);
        if (v126) {
          free(v126);
        }
        CFRelease(v124);
      }
      else
      {
        v131 = sub_10002E548();
        if (os_log_type_enabled(v131, OS_LOG_TYPE_FAULT)) {
          sub_100099F48();
        }
        if (qword_1000EBD00) {
          v132 = (FILE *)qword_1000EBD00;
        }
        else {
          v132 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v132);
      }
      *__error() = v122;
    }
    goto LABEL_268;
  }
  if (self->_endIndex) {
    goto LABEL_220;
  }
LABEL_268:
  if (self->_symbolicate)
  {
    if (byte_1000EBCF8)
    {
      int v135 = *__error();
      v136 = sub_10002E548();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "Parsing spindump text: Symbolicating...", buf, 2u);
      }
      *__error() = v135;
    }
    if (byte_1000EBCF9 && dword_1000EB4A8 <= 2)
    {
      int v137 = *__error();
      CFStringRef v138 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Symbolicating...");
      CFStringRef v139 = v138;
      if (v138)
      {
        v140 = (char *)CFStringGetCStringPtr(v138, 0x8000100u);
        if (v140)
        {
          v141 = 0;
        }
        else
        {
          v140 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC898E2B0uLL);
          CFStringGetCString(v139, v140, 1024, 0x8000100u);
          v141 = v140;
        }
        if (qword_1000EBD00) {
          v144 = (FILE *)qword_1000EBD00;
        }
        else {
          v144 = __stderrp;
        }
        fprintf(v144, "%s\n", v140);
        if (v141) {
          free(v141);
        }
        CFRelease(v139);
      }
      else
      {
        v142 = sub_10002E548();
        if (os_log_type_enabled(v142, OS_LOG_TYPE_FAULT)) {
          sub_100099F14();
        }
        if (qword_1000EBD00) {
          v143 = (FILE *)qword_1000EBD00;
        }
        else {
          v143 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v143);
      }
      *__error() = v137;
    }
    sub_10007C994(v14, (uint64_t)v636, (uint64_t)v611, v647, self->_useDsymForUUIDForEverything, (uint64_t)self->_findDsymsForIDs);
  }
  id v650 = sub_10007CBB4(v14, 0, (uint64_t)v611, v647);
  if (!v650)
  {
    if (byte_1000EBCF8)
    {
      int v390 = *__error();
      v391 = sub_10002E548();
      if (os_log_type_enabled(v391, OS_LOG_TYPE_ERROR)) {
        sub_100099CC0();
      }
      *__error() = v390;
    }
    char v21 = 0;
    v22 = 0;
    if (!byte_1000EBCF9) {
      goto LABEL_788;
    }
    id obj = 0;
    id v650 = 0;
    if (dword_1000EB4A8 > 3) {
      goto LABEL_808;
    }
    int v23 = *__error();
    CFStringRef v392 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Unable to find any Binary Images");
    CFStringRef v111 = v392;
    if (v392)
    {
      v393 = (char *)CFStringGetCStringPtr(v392, 0x8000100u);
      if (v393)
      {
        v394 = 0;
      }
      else
      {
        v393 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x13A7FEE7uLL);
        CFStringGetCString(v111, v393, 1024, 0x8000100u);
        v394 = v393;
      }
      if (qword_1000EBD00) {
        v396 = (FILE *)qword_1000EBD00;
      }
      else {
        v396 = __stderrp;
      }
      fprintf(v396, "%s\n", v393);
      if (v394) {
        free(v394);
      }
      goto LABEL_805;
    }
    v395 = sub_10002E548();
    if (os_log_type_enabled(v395, OS_LOG_TYPE_FAULT)) {
      sub_100099C8C();
    }
    if (qword_1000EBD00) {
      v128 = (FILE *)qword_1000EBD00;
    }
    else {
      v128 = __stderrp;
    }
    goto LABEL_246;
  }
  if (fgets((char *)v687[3], *((_DWORD *)v683 + 6), v14))
  {
    id obj = 0;
    v22 = 0;
    uint64_t v615 = 0;
    LODWORD(v635) = 0;
    id v604 = 0;
    BOOL v631 = 0;
    int v612 = 0;
    char v603 = 0;
    Weak = 0;
    uint64_t v609 = -1;
    v610 = v6;
    uint64_t v633 = 0xFFFFFFFFLL;
    v638 = a4;
    while (1)
    {
      v145 = (const char *)v687[3];
      int v146 = strnlen(v145, *((int *)v683 + 6));
      if (v145[v146 - 1] != 10)
      {
        ((void (*)(void *))v678)(v677);
        goto LABEL_303;
      }
      v145[v146 - 1] = 0;
      v147 = +[NSString stringWithUTF8String:v687[3]];
      id v148 = [v636 firstMatchInString:v147 options:0 range:[v147 length]];
      uint64_t v635 = (v635 + 1);
      if (v148) {
        break;
      }
      id v155 = [v614 firstMatchInString:v147 options:0 range:[v147 length]];
      if (!v155)
      {
        if (objc_msgSend(v611, "firstMatchInString:options:range:", v147, 0, 0, -[NSString length](v147, "length"))) {
          goto LABEL_522;
        }
        id v192 = [v605 firstMatchInString:v147 options:0 range:NSMakeRange(0, [v147 length])];
        v193 = v192;
        if (v192)
        {
          id v195 = [v192 rangeWithName:@"binaryIndex"];
          if (v195 == (id)0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_350;
          }
          unint64_t v283 = sub_10007E83C(-[NSString substringWithRange:](v147, "substringWithRange:", v195, v194));
          if (v283 >= (unint64_t)[v650 count])
          {
            if (byte_1000EBCF8)
            {
              v291 = v147;
              int v292 = *__error();
              v293 = sub_10002E548();
              if (os_log_type_enabled(v293, OS_LOG_TYPE_ERROR))
              {
                id v388 = [v650 count];
                *(_DWORD *)buf = 134218754;
                *(void *)&buf[4] = v283;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v388;
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = v635;
                *(_WORD *)&buf[28] = 2112;
                *(void *)&buf[30] = v291;
                _os_log_error_impl((void *)&_mh_execute_header, v293, OS_LOG_TYPE_ERROR, "Parsing spindump text: corrupt condensed file, UUID line has out-of-bounds binary index %lu (%lu binaries) (%d: %@)", buf, 0x26u);
                v6 = v610;
                a4 = v638;
              }
              *__error() = v292;
              v147 = v291;
            }
            if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
            {
              v294 = v147;
              int v295 = *__error();
              CFStringRef v296 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: corrupt condensed file, UUID line has out-of-bounds binary index %lu (%lu binaries) (%d: %@)", v283, [v650 count], v635, v294);
              CFStringRef v297 = v296;
              if (v296)
              {
                v298 = (char *)CFStringGetCStringPtr(v296, 0x8000100u);
                if (v298)
                {
                  v299 = 0;
                }
                else
                {
                  v298 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x29ECCD1AuLL);
                  CFStringGetCString(v297, v298, 1024, 0x8000100u);
                  v299 = v298;
                }
                if (qword_1000EBD00) {
                  v348 = (FILE *)qword_1000EBD00;
                }
                else {
                  v348 = __stderrp;
                }
                fprintf(v348, "%s\n", v298);
                if (v299) {
                  free(v299);
                }
                CFRelease(v297);
              }
              else
              {
                v341 = sub_10002E548();
                if (os_log_type_enabled(v341, OS_LOG_TYPE_FAULT))
                {
                  id v389 = [v650 count];
                  *(_DWORD *)buf = 134218754;
                  *(void *)&buf[4] = v283;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v389;
                  *(_WORD *)&buf[22] = 1024;
                  *(_DWORD *)&buf[24] = v635;
                  *(_WORD *)&buf[28] = 2112;
                  *(void *)&buf[30] = v294;
                  _os_log_fault_impl((void *)&_mh_execute_header, v341, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: corrupt condensed file, UUID line has out-of-bounds binary index %lu (%lu binaries) (%d: %@)", buf, 0x26u);
                }
                if (qword_1000EBD00) {
                  v342 = (FILE *)qword_1000EBD00;
                }
                else {
                  v342 = __stderrp;
                }
                fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v342);
              }
              *__error() = v295;
              v6 = v610;
              a4 = v638;
            }
LABEL_350:
            fprintf(a4, "%s\n");
          }
          else
          {
            v284 = [v650 objectAtIndexedSubscript:v283];
            [v193 rangeWithName:@"whitespace"];
            if (v284) {
              v285 = (void *)v284[5];
            }
            else {
              v285 = 0;
            }
            [objc_msgSend(objc_msgSend(objc_msgSend(v285, "uuid"), "UUIDString"), "UTF8String"];
            fprintf(a4, "UUID:%*s%s\n");
          }
LABEL_522:
          int v146 = 0;
LABEL_303:
          int v154 = 5;
          goto LABEL_584;
        }
        if (self->_isHeavy != v676 && obj)
        {
          if ([(NSString *)v147 length])
          {
            if (byte_1000EBCF8)
            {
              v274 = v147;
              int v275 = *__error();
              v276 = sub_10002E548();
              if (os_log_type_enabled(v276, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v635;
                *(_WORD *)&buf[8] = 2112;
                *(void *)&buf[10] = v274;
                _os_log_error_impl((void *)&_mh_execute_header, v276, OS_LOG_TYPE_ERROR, "Parsing spindump text: Unexpected line in call tree, ignoring (%d: %@)", buf, 0x12u);
              }
              v6 = v610;
              *__error() = v275;
              v147 = v274;
            }
            int v146 = 0;
            int v154 = 5;
            if (!byte_1000EBCF9 || dword_1000EB4A8 > 3) {
              goto LABEL_584;
            }
            v277 = v147;
            int v278 = *__error();
            CFStringRef v279 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Unexpected line in call tree, ignoring (%d: %@)", v635, v277);
            CFStringRef v280 = v279;
            if (v279)
            {
              v281 = (char *)CFStringGetCStringPtr(v279, 0x8000100u);
              if (v281)
              {
                v282 = 0;
              }
              else
              {
                v281 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x9288DD13uLL);
                CFStringGetCString(v280, v281, 1024, 0x8000100u);
                v282 = v281;
              }
              if (qword_1000EBD00) {
                v387 = (FILE *)qword_1000EBD00;
              }
              else {
                v387 = __stderrp;
              }
              fprintf(v387, "%s\n", v281);
              if (v282) {
                free(v282);
              }
              CFRelease(v280);
            }
            else
            {
              v346 = sub_10002E548();
              if (os_log_type_enabled(v346, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v635;
                *(_WORD *)&buf[8] = 2112;
                *(void *)&buf[10] = v277;
                _os_log_fault_impl((void *)&_mh_execute_header, v346, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: Unexpected line in call tree, ignoring (%d: %@)", buf, 0x12u);
              }
              if (qword_1000EBD00) {
                v347 = (FILE *)qword_1000EBD00;
              }
              else {
                v347 = __stderrp;
              }
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v347);
            }
            int v146 = 0;
            *__error() = v278;
            goto LABEL_774;
          }
          v625 = v147;
          id v304 = objc_alloc_init((Class)NSMutableArray);
          [obj sortUsingComparator:&stru_1000DDD20];
          [v304 addObject:obj];
          v621 = v304;
          v305 = [obj objectAtIndex:0];
          if (v305) {
            int v306 = v305[3];
          }
          else {
            int v306 = 0;
          }
          uint64_t v615 = 0;
          int v645 = vcvtpd_s64_f64(log10((double)v306)) + 2;
          v307 = self;
          v308 = v304;
          do
          {
            while (1)
            {
LABEL_591:
              if (![v308 count])
              {

                id obj = 0;
                v6 = v610;
                a4 = v638;
                v147 = v625;
                goto LABEL_622;
              }
              id v309 = [v308 lastObject];
              if ([v309 count]) {
                break;
              }
              [v308 removeLastObject];
            }
            id v310 = [v309 objectAtIndex:0];
            [v309 removeObjectAtIndex:0];
            unsigned int v311 = [v308 count];
            int omitFramesBelowSampleCount = v307->_omitFramesBelowSampleCount;
            if (omitFramesBelowSampleCount < 1) {
              break;
            }
            int v313 = v310 ? *((_DWORD *)v310 + 3) : 0;
          }
          while (v313 < omitFramesBelowSampleCount);
          v629 = (id *)v310;
          uint64_t v314 = v615;
          v315 = (unsigned int *)&v22[8 * v615 - 8];
          uint64_t v316 = (8 * (int)v615) | 4;
          unsigned int v613 = v311 - 1;
          while (1)
          {
            uint64_t v317 = v314;
            uint64_t v318 = v316;
            if ((int)v314 < 1) {
              break;
            }
            --v314;
            unsigned int v319 = *v315;
            v315 -= 2;
            v316 -= 8;
            if (v319 < v311 - 1)
            {
              uint64_t v616 = v318;
              uint64_t v618 = v317;
              unsigned int v320 = v315[3];
              goto LABEL_603;
            }
          }
          uint64_t v616 = v316;
          uint64_t v618 = v314;
          unsigned int v320 = 0;
LABEL_603:
          if (!v310)
          {
LABEL_1088:
            if (byte_1000EBCF8)
            {
              int v578 = *__error();
              v579 = sub_10002E548();
              if (os_log_type_enabled(v579, OS_LOG_TYPE_ERROR)) {
                sub_100099D38([[objc_msgSend(v310, "debugDescription") UTF8String], buf);
              }
              *__error() = v578;
            }
            if (byte_1000EBCF9) {
              BOOL v568 = dword_1000EB4A8 <= 3;
            }
            else {
              BOOL v568 = 0;
            }
            if (v568)
            {
              int v580 = *__error();
              CFStringRef v581 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: No angle bracket contents nor state info for non-frame (%s)", "heaviestNode.angleBracketContents || heaviestNode.stateInfo", [objc_msgSend(objc_msgSend(v310, "debugDescription"), "UTF8String")]);
              CFStringRef v582 = v581;
              if (v581)
              {
                v589 = (char *)CFStringGetCStringPtr(v581, 0x8000100u);
                if (v589)
                {
                  v590 = 0;
                }
                else
                {
                  v589 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x9FC4495uLL);
                  CFStringGetCString(v582, v589, 1024, 0x8000100u);
                  v590 = v589;
                }
                if (qword_1000EBD00) {
                  v595 = (FILE *)qword_1000EBD00;
                }
                else {
                  v595 = __stderrp;
                }
                fprintf(v595, "%s\n", v589);
                if (v590) {
                  free(v590);
                }
                CFRelease(v582);
              }
              else
              {
                v583 = sub_10002E548();
                if (os_log_type_enabled(v583, OS_LOG_TYPE_FAULT)) {
                  sub_100099CF4((uint64_t)[objc_msgSend(objc_msgSend(v310, "debugDescription"), "UTF8String") UTF8String], v695);
                }
                if (qword_1000EBD00) {
                  v584 = (FILE *)qword_1000EBD00;
                }
                else {
                  v584 = __stderrp;
                }
                fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v584);
              }
              *__error() = v580;
            }
            [objc_msgSend(v629, "debugDescription") UTF8String];
            sub_10002E41C("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 839, "%s: No angle bracket contents nor state info for non-frame (%s)", v569, v570, v571, v572, (char)"heaviestNode.angleBracketContents || heaviestNode.stateInfo");
            abort();
          }
          v321 = (void *)*((void *)v310 + 2);
          if (v321)
          {
            unint64_t v322 = 0;
            int v640 = v320 + v311 - 1;
            while (1)
            {
              id v323 = [v321 count];
              v324 = (void *)*((void *)v310 + 2);
              if (v322 >= (unint64_t)v323) {
                break;
              }
              id v325 = [v324 objectAtIndexedSubscript:v322];
              sub_10007E8AC(v638, v674 + v675 * (v640 + v322++), *((unsigned char *)v310 + 8) & 1, *((_DWORD *)v310 + 3), v645, (const char *)[v325 UTF8String], *((void *)v310 + 4), (const char *)[v325 UTF8String], 0, 0);
              v321 = (void *)*((void *)v310 + 2);
            }
            if ((unint64_t)[v324 count] > 1)
            {
              v22 = (char *)malloc_type_realloc(v22, 8 * ((int)v618 + 1), 0x100004000313F17uLL);
              *(_DWORD *)&v22[v616 - 4] = v613;
              unsigned int v326 = [*((id *)v310 + 2) count];
              if ((int)v618 < 1) {
                int v327 = 0;
              }
              else {
                int v327 = *(_DWORD *)&v22[8 * (v618 - 1) + 4];
              }
              *(_DWORD *)&v22[v616] = v326 - 1 + v327;
              uint64_t v615 = v618 + 1;
LABEL_617:
              v329 = (void *)*((void *)v310 + 6);
              v307 = self;
              v308 = v621;
              if (v329 && [v629[6] count])
              {
                [v329 sortUsingComparator:&stru_1000DDD20];
                [v621 addObject:v329];
              }
              goto LABEL_591;
            }
          }
          else
          {
            v328 = (void *)*((void *)v310 + 3);
            if (!v328 && !*((void *)v310 + 5)) {
              goto LABEL_1088;
            }
            sub_10007F1D4(v638, v674 + v675 * (v320 + v613), *((unsigned char *)v310 + 8) & 1, *((_DWORD *)v310 + 3), v645, (const char *)[v328 UTF8String], (uint64_t)[(*((id *)v310 + 5)) UTF8String], 0, 0);
          }
          uint64_t v615 = v618;
          goto LABEL_617;
        }
LABEL_622:
        if ([(NSString *)v147 length] && v633 != -1)
        {
          if (byte_1000EBCF8)
          {
            v330 = v147;
            int v331 = *__error();
            v332 = sub_10002E548();
            if (os_log_type_enabled(v332, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v635;
              *(_WORD *)&buf[8] = 2112;
              *(void *)&buf[10] = v330;
              _os_log_error_impl((void *)&_mh_execute_header, v332, OS_LOG_TYPE_ERROR, "Parsing spindump text: Unexpected end of call tree (%d: %@)", buf, 0x12u);
            }
            v6 = v610;
            a4 = v638;
            *__error() = v331;
            v147 = v330;
          }
          if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
          {
            v333 = v147;
            int v334 = *__error();
            CFStringRef v335 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Unexpected end of call tree (%d: %@)", v635, v333);
            CFStringRef v336 = v335;
            if (v335)
            {
              v337 = (char *)CFStringGetCStringPtr(v335, 0x8000100u);
              if (v337)
              {
                v338 = 0;
              }
              else
              {
                v337 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x1A97260DuLL);
                CFStringGetCString(v336, v337, 1024, 0x8000100u);
                v338 = v337;
              }
              if (qword_1000EBD00) {
                v349 = (FILE *)qword_1000EBD00;
              }
              else {
                v349 = __stderrp;
              }
              fprintf(v349, "%s\n", v337);
              if (v338) {
                free(v338);
              }
              CFRelease(v336);
            }
            else
            {
              v343 = sub_10002E548();
              if (os_log_type_enabled(v343, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v635;
                *(_WORD *)&buf[8] = 2112;
                *(void *)&buf[10] = v333;
                _os_log_fault_impl((void *)&_mh_execute_header, v343, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: Unexpected end of call tree (%d: %@)", buf, 0x12u);
              }
              if (qword_1000EBD00) {
                v344 = (FILE *)qword_1000EBD00;
              }
              else {
                v344 = __stderrp;
              }
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v344);
            }
            *__error() = v334;
            v6 = v610;
            a4 = v638;
            v147 = v333;
          }
        }
        fprintf(a4, "%s\n", (const char *)v687[3]);
        if ([(NSString *)v147 containsString:@"Binary Images:"])
        {
          long long v657 = 0u;
          long long v658 = 0u;
          long long v655 = 0u;
          long long v656 = 0u;
          uint64_t v350 = 0;
          signed int v351 = 0;
          id v352 = [v650 countByEnumeratingWithState:&v655 objects:v692 count:16];
          if (v352)
          {
            uint64_t v353 = *(void *)v656;
            do
            {
              v354 = 0;
              do
              {
                if (*(void *)v656 != v353) {
                  objc_enumerationMutation(v650);
                }
                uint64_t v355 = *(void *)(*((void *)&v655 + 1) + 8 * (void)v354);
                if (v355)
                {
                  id v356 = [*(id *)(v355 + 40) bundleIdentifier];
                  if (!v356) {
                    id v356 = *(id *)(v355 + 8);
                  }
                }
                else
                {
                  id v356 = 0;
                }
                id v357 = [v356 length];
                int v358 = (int)v357;
                if (!v357)
                {
                  if (v355)
                  {
                    id v359 = [*(id *)(v355 + 40) name];
                    if (!v359) {
                      id v359 = *(id *)(v355 + 16);
                    }
                  }
                  else
                  {
                    id v359 = 0;
                  }
                  id v360 = [v359 length];
                  if (v360) {
                    int v358 = (int)v360;
                  }
                  else {
                    int v358 = 3;
                  }
                }
                v361 = sub_100075D20(v355);
                if ([v361 length]) {
                  v358 += [v361 length] + 1;
                }
                if (v355) {
                  v362 = *(void **)(v355 + 48);
                }
                else {
                  v362 = 0;
                }
                signed int v363 = [v362 length];
                if ((int)v350 <= v358) {
                  uint64_t v350 = v358;
                }
                else {
                  uint64_t v350 = v350;
                }
                if (v351 <= v363) {
                  signed int v351 = v363;
                }
                v354 = (char *)v354 + 1;
              }
              while (v352 != v354);
              id v364 = [v650 countByEnumeratingWithState:&v655 objects:v692 count:16];
              id v352 = v364;
            }
            while (v364);
          }
          long long v653 = 0u;
          long long v654 = 0u;
          long long v651 = 0u;
          long long v652 = 0u;
          id v641 = [v650 countByEnumeratingWithState:&v651 objects:v691 count:16];
          if (v641)
          {
            id v646 = 0;
            uint64_t v365 = *(void *)v652;
            uint64_t v619 = *(void *)v652;
            while (1)
            {
              if (v365 != v619) {
                objc_enumerationMutation(v650);
              }
              uint64_t v366 = *(void *)(*((void *)&v651 + 1) + 8 * (void)v646);
              if (v366)
              {
                char v367 = *(unsigned char *)(v366 + 32);
                uint64_t v368 = *(void *)(v366 + 56);
                uint64_t v369 = *(void *)(v366 + 64);
                id v370 = [*(id *)(v366 + 40) bundleIdentifier];
                int v622 = v367 & 1;
                if (!v370) {
                  id v370 = *(id *)(v366 + 8);
                }
              }
              else
              {
                uint64_t v369 = 0;
                int v622 = 0;
                uint64_t v368 = 0;
                id v370 = 0;
              }
              v634 = (const char *)[v370 UTF8String];
              if (v366)
              {
                id v371 = [*(id *)(v366 + 40) name];
                if (!v371) {
                  id v371 = *(id *)(v366 + 16);
                }
              }
              else
              {
                id v371 = 0;
              }
              v630 = (const char *)[v371 UTF8String];
              v626 = (const char *)[sub_100075D20(v366) UTF8String];
              if (v366) {
                v372 = *(void **)(v366 + 40);
              }
              else {
                v372 = 0;
              }
              v373 = (const char *)[[[v372 uuid] UUIDString] UTF8String];
              if (v366) {
                v374 = *(void **)(v366 + 48);
              }
              else {
                v374 = 0;
              }
              v375 = (const char *)[v374 UTF8String];
              if (v366) {
                v376 = *(void **)(v366 + 40);
              }
              else {
                v376 = 0;
              }
              v377 = (const char *)[[[v376 path] UTF8String];
              if (v368)
              {
                v378 = "*";
                if (!v622) {
                  v378 = "";
                }
                snprintf(buf, 0x20uLL, "%s0x%llx", v378, v368);
                v379 = v638;
                fprintf(v638, "%22s - ", buf);
                if (v369) {
                  fprintf(v638, "%#18llx  ");
                }
                else {
                  fwrite("               ???  ", 0x14uLL, 1uLL, v638);
                }
              }
              else
              {
                v379 = v638;
                fprintf(v638, "%2s");
              }
              v380 = "???";
              if (v630) {
                v380 = v630;
              }
              if (v634) {
                v380 = v634;
              }
              uint64_t v385 = fprintf(v379, "%s", v380);
              if (v626) {
                uint64_t v385 = (fprintf(v379, " %s", v626) + v385);
              }
              if ((int)v385 > (int)v350)
              {
                if (byte_1000EBCF8)
                {
                  int v498 = *__error();
                  v499 = sub_10002E548();
                  if (os_log_type_enabled(v499, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316418;
                    *(void *)&buf[4] = "numChars < nameAndVersionWidth + 1";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v385;
                    *(_WORD *)&buf[18] = 1024;
                    *(_DWORD *)&buf[20] = v350;
                    *(_WORD *)&buf[24] = 2080;
                    *(void *)&buf[26] = v634;
                    *(_WORD *)&buf[34] = 2080;
                    *(void *)&buf[36] = v630;
                    *(_WORD *)&buf[44] = 2080;
                    *(void *)&buf[46] = v626;
                    _os_log_error_impl((void *)&_mh_execute_header, v499, OS_LOG_TYPE_ERROR, "%s: Printed %d characters when max is %d: %s, %s, %s", buf, 0x36u);
                  }
                  *__error() = v498;
                }
                if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
                {
                  int v485 = *__error();
                  CFStringRef v486 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: Printed %d characters when max is %d: %s, %s, %s", "numChars < nameAndVersionWidth + 1", v385, v350, v634, v630, v626);
                  CFStringRef v487 = v486;
                  if (v486)
                  {
                    v537 = (char *)CFStringGetCStringPtr(v486, 0x8000100u);
                    if (v537)
                    {
                      v538 = 0;
                    }
                    else
                    {
                      v537 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x2EB7B429uLL);
                      CFStringGetCString(v487, v537, 1024, 0x8000100u);
                      v538 = v537;
                    }
                    if (qword_1000EBD00) {
                      v561 = (FILE *)qword_1000EBD00;
                    }
                    else {
                      v561 = __stderrp;
                    }
                    fprintf(v561, "%s\n", v537);
                    if (v538) {
                      free(v538);
                    }
                    CFRelease(v487);
                  }
                  else
                  {
                    v488 = sub_10002E548();
                    if (os_log_type_enabled(v488, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136316418;
                      *(void *)&buf[4] = "numChars < nameAndVersionWidth + 1";
                      *(_WORD *)&buf[12] = 1024;
                      *(_DWORD *)&buf[14] = v385;
                      *(_WORD *)&buf[18] = 1024;
                      *(_DWORD *)&buf[20] = v350;
                      *(_WORD *)&buf[24] = 2080;
                      *(void *)&buf[26] = v634;
                      *(_WORD *)&buf[34] = 2080;
                      *(void *)&buf[36] = v630;
                      *(_WORD *)&buf[44] = 2080;
                      *(void *)&buf[46] = v626;
                      _os_log_fault_impl((void *)&_mh_execute_header, v488, OS_LOG_TYPE_FAULT, "Unable to format: %s: Printed %d characters when max is %d: %s, %s, %s", buf, 0x36u);
                    }
                    if (qword_1000EBD00) {
                      v489 = (FILE *)qword_1000EBD00;
                    }
                    else {
                      v489 = __stderrp;
                    }
                    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v489);
                  }
                  *__error() = v485;
                }
                sub_10002E41C("PrintLoadInfoLine", "SPTextualReportParser.m", 2436, "%s: Printed %d characters when max is %d: %s, %s, %s", v381, v382, v383, v384, (char)"numChars < nameAndVersionWidth + 1");
                abort();
              }
              fprintf(v638, "%*s", v350 + 1 - v385, "");
              fprintf(v638, "<%s>", v373);
              if (v375) {
                int v386 = fprintf(v638, "%s", v375);
              }
              else {
                int v386 = 0;
              }
              if (v351 > v386) {
                fprintf(v638, "%*s", v351 - v386, "");
              }
              if (v377) {
                fprintf(v638, "  %s", v377);
              }
              fputc(10, v638);
              id v646 = (char *)v646 + 1;
              if (v646 >= v641)
              {
                id v641 = [v650 countByEnumeratingWithState:&v651 objects:v691 count:16];
                if (!v641) {
                  break;
                }
                id v646 = 0;
              }
              uint64_t v365 = *(void *)v652;
            }
          }
          if ((v647 & 1) == 0)
          {

            id v650 = sub_10007CBB4(v14, v635, (uint64_t)v611, 0);
          }
          Weak = 0;
          char v603 = 0;
          int v612 = 0;
          int v146 = 0;
          int v154 = 0;
          uint64_t v633 = 0xFFFFFFFFLL;
LABEL_774:
          v6 = v610;
          goto LABEL_584;
        }
        Weak = 0;
        char v603 = 0;
        int v612 = 0;
        int v146 = 0;
        int v154 = 0;
        uint64_t v290 = 0xFFFFFFFFLL;
LABEL_550:
        uint64_t v633 = v290;
        goto LABEL_584;
      }
      unsigned int v669 = -1;
      int v668 = -1;
      BOOL v667 = 0;
      int v666 = 0;
      int v665 = 0;
      id v690 = 0;
      id v664 = 0;
      uint64_t v663 = 0;
      sub_10007E9CC(v147, v635, v155, v647, v674, v675, &v669, &v668, &v667, &v666, &v665, &v690, &v664, (int *)&v663 + 1, &v663);
      id v156 = v690;
      id v157 = v690;
      id v158 = v664;
      id v159 = v664;
      int v160 = v666;
      if (v666 <= 0)
      {
        if (v612 < 1 || (uint64_t v196 = v668, v668 <= v674 + v612))
        {
          uint64_t v165 = 0;
          int v164 = 0;
          unsigned int v669 = 0;
        }
        else
        {
          uint64_t v165 = ((v668 - (v674 + v612)) / v675);
          unsigned int v669 = v165;
          if ((v165 & 0x80000000) != 0)
          {
            if (byte_1000EBCF8)
            {
              v624 = v147;
              int v197 = *__error();
              v198 = sub_10002E548();
              if (os_log_type_enabled(v198, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)&buf[4] = v165;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v196;
                *(_WORD *)&buf[14] = 1024;
                *(_DWORD *)&buf[16] = v635;
                *(_WORD *)&buf[20] = 2112;
                *(void *)&buf[22] = v624;
                _os_log_debug_impl((void *)&_mh_execute_header, v198, OS_LOG_TYPE_DEBUG, "Parsing spindump text: Bad indent level %d for %d whitespace (%d: %@)", buf, 0x1Eu);
              }
              *__error() = v197;
              v147 = v624;
            }
            if (byte_1000EBCF9 && dword_1000EB4A8 <= 0)
            {
              int v643 = *__error();
              CFStringRef v199 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Bad indent level %d for %d whitespace (%d: %@)", v165, v196, v635, v147);
              if (v199)
              {
                CFStringRef v200 = v199;
                v201 = (char *)CFStringGetCStringPtr(v199, 0x8000100u);
                if (v201)
                {
                  v202 = 0;
                  v6 = v610;
                }
                else
                {
                  v6 = v610;
                  v201 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xAFD8015BuLL);
                  CFStringGetCString(v200, v201, 1024, 0x8000100u);
                  v202 = v201;
                }
                if (qword_1000EBD00) {
                  v345 = (FILE *)qword_1000EBD00;
                }
                else {
                  v345 = __stderrp;
                }
                fprintf(v345, "%s\n", v201);
                if (v202) {
                  free(v202);
                }
                CFRelease(v200);
              }
              else
              {
                v339 = sub_10002E548();
                if (os_log_type_enabled(v339, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 67109890;
                  *(_DWORD *)&buf[4] = v165;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v196;
                  *(_WORD *)&buf[14] = 1024;
                  *(_DWORD *)&buf[16] = v635;
                  *(_WORD *)&buf[20] = 2112;
                  *(void *)&buf[22] = v147;
                  _os_log_fault_impl((void *)&_mh_execute_header, v339, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: Bad indent level %d for %d whitespace (%d: %@)", buf, 0x1Eu);
                }
                if (qword_1000EBD00) {
                  v340 = (FILE *)qword_1000EBD00;
                }
                else {
                  v340 = __stderrp;
                }
                fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v340);
                v6 = v610;
              }
              *__error() = v643;
            }
            uint64_t v165 = 0;
            unsigned int v669 = 0;
          }
          if (v631) {
            goto LABEL_398;
          }
          int v164 = 1;
          if ((v165 & 0x80000000) != 0)
          {
LABEL_953:
            v490 = v147;
            if (byte_1000EBCF8)
            {
              int v500 = *__error();
              v501 = sub_10002E548();
              if (os_log_type_enabled(v501, OS_LOG_TYPE_ERROR))
              {
                [(NSString *)v147 UTF8String];
                sub_100099DC0();
              }
              *__error() = v500;
            }
            if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
            {
              int v491 = *__error();
              CFStringRef v492 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: Non-frame line has count but no indent level (%d: %s)", "rawIndentLevel >= 0", v635, [(NSString *)v147 UTF8String]);
              CFStringRef v493 = v492;
              if (v492)
              {
                v552 = (char *)CFStringGetCStringPtr(v492, 0x8000100u);
                if (v552)
                {
                  v553 = 0;
                }
                else
                {
                  v552 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xA28225B0uLL);
                  CFStringGetCString(v493, v552, 1024, 0x8000100u);
                  v553 = v552;
                }
                if (qword_1000EBD00) {
                  v573 = (FILE *)qword_1000EBD00;
                }
                else {
                  v573 = __stderrp;
                }
                fprintf(v573, "%s\n", v552);
                if (v553) {
                  free(v553);
                }
                CFRelease(v493);
              }
              else
              {
                v494 = sub_10002E548();
                if (os_log_type_enabled(v494, OS_LOG_TYPE_FAULT))
                {
                  [(NSString *)v490 UTF8String];
                  sub_100099D7C();
                }
                if (qword_1000EBD00) {
                  v495 = (FILE *)qword_1000EBD00;
                }
                else {
                  v495 = __stderrp;
                }
                fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v495);
              }
              *__error() = v491;
            }
            [(NSString *)v490 UTF8String];
            sub_10002E41C("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 659, "%s: Non-frame line has count but no indent level (%d: %s)", v574, v575, v576, v577, (char)"rawIndentLevel >= 0");
            abort();
          }
        }
      }
      else
      {
        int v161 = HIDWORD(v663);
        if (HIDWORD(v663))
        {
          int v162 = self->_startIndex;
          if (v162)
          {
            if (SHIDWORD(v663) < v162)
            {
              int v160 = HIDWORD(v663) + v666 - v162;
              int v666 = v160;
              HIDWORD(v663) = v162;
              int v161 = v162;
            }
          }
        }
        if (v663)
        {
          int endIndex = self->_endIndex;
          if (endIndex)
          {
            if (endIndex < (int)v663)
            {
              v160 += endIndex - v663;
              int v666 = v160;
              LODWORD(v663) = endIndex;
            }
          }
        }
        if (v160 < 1)
        {
          if (v161)
          {
            int v243 = self->_endIndex;
            if (v243) {
              BOOL v216 = v161 <= v243;
            }
            else {
              BOOL v216 = 1;
            }
            goto LABEL_394;
          }
LABEL_398:
          int v154 = 5;
LABEL_499:
          int v146 = 0;
          goto LABEL_584;
        }
        int v164 = 1;
        uint64_t v165 = v669;
        if ((v669 & 0x80000000) != 0) {
          goto LABEL_953;
        }
      }
      if (v164 && (int)v165 > (int)v633 && v165 != v633 + 1)
      {
        if (byte_1000EBCF8)
        {
          v233 = v147;
          int v234 = *__error();
          v235 = sub_10002E548();
          if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v635;
            *(_WORD *)&buf[8] = 2112;
            *(void *)&buf[10] = v233;
            _os_log_error_impl((void *)&_mh_execute_header, v235, OS_LOG_TYPE_ERROR, "Parsing spindump text: Unexpected indent for line (%d: %@)", buf, 0x12u);
          }
          *__error() = v234;
          v147 = v233;
        }
        int v154 = 2;
        if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
        {
          v236 = v147;
          int v237 = *__error();
          CFStringRef v238 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Unexpected indent for line (%d: %@)", v635, v236);
          CFStringRef v239 = v238;
          if (v238)
          {
            v240 = (char *)CFStringGetCStringPtr(v238, 0x8000100u);
            if (v240)
            {
              v241 = 0;
            }
            else
            {
              v240 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5203F2D3uLL);
              CFStringGetCString(v239, v240, 1024, 0x8000100u);
              v241 = v240;
            }
            if (qword_1000EBD00) {
              v302 = (FILE *)qword_1000EBD00;
            }
            else {
              v302 = __stderrp;
            }
            fprintf(v302, "%s\n", v240);
            if (v241) {
              free(v241);
            }
            CFRelease(v239);
          }
          else
          {
            v300 = sub_10002E548();
            if (os_log_type_enabled(v300, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v635;
              *(_WORD *)&buf[8] = 2112;
              *(void *)&buf[10] = v236;
              _os_log_fault_impl((void *)&_mh_execute_header, v300, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: Unexpected indent for line (%d: %@)", buf, 0x12u);
            }
            if (qword_1000EBD00) {
              v301 = (FILE *)qword_1000EBD00;
            }
            else {
              v301 = __stderrp;
            }
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v301);
          }
          *__error() = v237;
          int v154 = 2;
        }
        goto LABEL_499;
      }
      if (v160 < 1)
      {
        unsigned int v242 = v612;
      }
      else
      {
        unsigned int v242 = v612;
        if (v612 <= 0)
        {
          unsigned int v242 = v665;
          if (v665 <= 0) {
            unsigned int v242 = vcvtpd_s64_f64(log10((double)v160)) + 2;
          }
        }
      }
      int v612 = v242;
      if (!v164)
      {
        if ((self->_isHeavy != v676) | v603 & 1)
        {
          uint64_t v251 = v615;
          goto LABEL_580;
        }
        int v644 = 0;
        int v628 = 0;
        int v253 = 0;
        goto LABEL_482;
      }
      int v644 = v164;
      v249 = v147;
      v250 = &v22[8 * v615 + 4];
      while (1)
      {
        uint64_t v251 = v615;
        BOOL v33 = (int)v615 < 1;
        uint64_t v615 = (v615 - 1);
        if (v33) {
          break;
        }
        unsigned int v252 = *((_DWORD *)v250 - 3);
        v250 -= 8;
        if (v252 < v165)
        {
          int v253 = *(_DWORD *)v250;
          goto LABEL_471;
        }
      }
      int v253 = 0;
LABEL_471:
      if (!((self->_isHeavy != v676) | v603 & 1))
      {
        int v628 = v612;
        uint64_t v615 = v251;
LABEL_482:
        int v255 = v675;
        int v256 = v674;
        BOOL v257 = v667;
        v258 = (const char *)[v156 UTF8String];
        id v259 = [v158 UTF8String];
        sub_10007F1D4(v638, v256 + (v253 + v165) * v255, v257, v160, v628, v258, (uint64_t)v259, SHIDWORD(v663), v663);
        uint64_t v251 = v615;
        v6 = v610;
        int v164 = v644;
        goto LABEL_580;
      }
      if (!v165)
      {
        if (!obj)
        {
          id obj = objc_alloc_init((Class)NSMutableArray);
          int v164 = v644;
          goto LABEL_577;
        }
        long long v661 = 0u;
        long long v662 = 0u;
        long long v659 = 0u;
        long long v660 = 0u;
        id v287 = [obj countByEnumeratingWithState:&v659 objects:v693 count:16];
        if (!v287) {
          goto LABEL_546;
        }
        uint64_t v288 = *(void *)v660;
        while (1)
        {
          for (i = 0; i != v287; i = (char *)i + 1)
          {
            if (*(void *)v660 != v288) {
              objc_enumerationMutation(obj);
            }
            Weak = *(id **)(*((void *)&v659 + 1) + 8 * i);
            if (sub_1000758AC((uint64_t)Weak, v667, 0, -1, (uint64_t)v664, (uint64_t)v690))
            {
              int v164 = v644;
              if (Weak) {
                goto LABEL_579;
              }
LABEL_577:
              Weak = sub_10007524C((uint64_t)SPTreeNode, 0, v667, 0, (void *)0xFFFFFFFFFFFFFFFFLL, v664, v690);
              [obj addObject:Weak];
              goto LABEL_578;
            }
          }
          id v287 = [obj countByEnumeratingWithState:&v659 objects:v693 count:16];
          if (!v287)
          {
LABEL_546:
            int v164 = v644;
            goto LABEL_577;
          }
        }
      }
      if (!Weak)
      {
        if (byte_1000EBCF8)
        {
          int v521 = *__error();
          v522 = sub_10002E548();
          if (os_log_type_enabled(v522, OS_LOG_TYPE_ERROR))
          {
            v523 = [(NSString *)v249 UTF8String];
            *(_DWORD *)buf = 136315906;
            *(void *)&buf[4] = "previousNode";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v165;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v635;
            *(_WORD *)&buf[24] = 2080;
            *(void *)&buf[26] = v523;
            _os_log_error_impl((void *)&_mh_execute_header, v522, OS_LOG_TYPE_ERROR, "%s: no previousNode for indent of %d (%d: %s)", buf, 0x22u);
          }
          *__error() = v521;
        }
        if (byte_1000EBCF9) {
          BOOL v524 = dword_1000EB4A8 <= 3;
        }
        else {
          BOOL v524 = 0;
        }
        if (v524)
        {
          int v525 = *__error();
          CFStringRef v526 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: no previousNode for indent of %d (%d: %s)", "previousNode", v165, v635, [(NSString *)v249 UTF8String]);
          CFStringRef v527 = v526;
          if (v526)
          {
            v599 = (char *)CFStringGetCStringPtr(v526, 0x8000100u);
            if (v599)
            {
              v600 = 0;
            }
            else
            {
              v599 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5CDEA7A4uLL);
              CFStringGetCString(v527, v599, 1024, 0x8000100u);
              v600 = v599;
            }
            if (qword_1000EBD00) {
              v602 = (FILE *)qword_1000EBD00;
            }
            else {
              v602 = __stderrp;
            }
            fprintf(v602, "%s\n", v599);
            if (v600) {
              free(v600);
            }
            CFRelease(v527);
          }
          else
          {
            v528 = sub_10002E548();
            if (os_log_type_enabled(v528, OS_LOG_TYPE_FAULT))
            {
              v529 = [(NSString *)v249 UTF8String];
              *(_DWORD *)buf = 136315906;
              *(void *)&buf[4] = "previousNode";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v165;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v635;
              *(_WORD *)&buf[24] = 2080;
              *(void *)&buf[26] = v529;
              _os_log_fault_impl((void *)&_mh_execute_header, v528, OS_LOG_TYPE_FAULT, "Unable to format: %s: no previousNode for indent of %d (%d: %s)", buf, 0x22u);
            }
            if (qword_1000EBD00) {
              v530 = (FILE *)qword_1000EBD00;
            }
            else {
              v530 = __stderrp;
            }
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v530);
          }
          *__error() = v525;
        }
        [(NSString *)v249 UTF8String];
        sub_10002E41C("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 716, "%s: no previousNode for indent of %d (%d: %s)", v531, v532, v533, v534, (char)"previousNode");
LABEL_942:
        abort();
      }
      if ((int)v633 < (int)v165) {
        goto LABEL_479;
      }
      do
      {
        Weak = (id *)objc_loadWeak(Weak + 7);
        if (!Weak)
        {
          if (byte_1000EBCF8)
          {
            int v469 = *__error();
            v470 = sub_10002E548();
            if (os_log_type_enabled(v470, OS_LOG_TYPE_ERROR))
            {
              unsigned int v471 = v669;
              v472 = [(NSString *)v249 UTF8String];
              *(_DWORD *)buf = 136316162;
              *(void *)&buf[4] = "previousNode";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v471;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v633;
              *(_WORD *)&buf[24] = 1024;
              *(_DWORD *)&buf[26] = v635;
              *(_WORD *)&buf[30] = 2080;
              *(void *)&buf[32] = v472;
              _os_log_error_impl((void *)&_mh_execute_header, v470, OS_LOG_TYPE_ERROR, "%s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", buf, 0x28u);
            }
            *__error() = v469;
          }
          if (byte_1000EBCF9) {
            BOOL v473 = dword_1000EB4A8 < 4;
          }
          else {
            BOOL v473 = 0;
          }
          if (v473)
          {
            int v474 = *__error();
            unsigned int v475 = v669;
            CFStringRef v476 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", "previousNode", v669, v633, v635, [(NSString *)v249 UTF8String]);
            CFStringRef v477 = v476;
            if (v476)
            {
              v592 = (char *)CFStringGetCStringPtr(v476, 0x8000100u);
              if (v592)
              {
                v593 = 0;
              }
              else
              {
                v592 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xBD2080EBuLL);
                CFStringGetCString(v477, v592, 1024, 0x8000100u);
                v593 = v592;
              }
              if (qword_1000EBD00) {
                v596 = (FILE *)qword_1000EBD00;
              }
              else {
                v596 = __stderrp;
              }
              fprintf(v596, "%s\n", v592);
              if (v593) {
                free(v593);
              }
              CFRelease(v477);
            }
            else
            {
              v478 = sub_10002E548();
              if (os_log_type_enabled(v478, OS_LOG_TYPE_FAULT))
              {
                v479 = [(NSString *)v249 UTF8String];
                *(_DWORD *)buf = 136316162;
                *(void *)&buf[4] = "previousNode";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v475;
                *(_WORD *)&buf[18] = 1024;
                *(_DWORD *)&buf[20] = v633;
                *(_WORD *)&buf[24] = 1024;
                *(_DWORD *)&buf[26] = v635;
                *(_WORD *)&buf[30] = 2080;
                *(void *)&buf[32] = v479;
                _os_log_fault_impl((void *)&_mh_execute_header, v478, OS_LOG_TYPE_FAULT, "Unable to format: %s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", buf, 0x28u);
              }
              if (qword_1000EBD00) {
                v480 = (FILE *)qword_1000EBD00;
              }
              else {
                v480 = __stderrp;
              }
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v480);
            }
            *__error() = v474;
          }
          [(NSString *)v249 UTF8String];
          sub_10002E41C("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 721, "%s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", v481, v482, v483, v484, (char)"previousNode");
          goto LABEL_942;
        }
        int v254 = v633 - 1;
        BOOL v33 = (int)v633 <= (int)v669;
        uint64_t v633 = (v633 - 1);
      }
      while (!v33);
      id v158 = v664;
      id v156 = v690;
      LODWORD(v633) = v254;
LABEL_479:
      Weak = sub_100075720((uint64_t)Weak, v667, 0, (void *)0xFFFFFFFFFFFFFFFFLL, v158, v156);
      int v164 = v644;
LABEL_578:
      if (Weak) {
LABEL_579:
      }
        *((_DWORD *)Weak + 3) += v666;
      else {
        Weak = 0;
      }
LABEL_580:
      int v146 = 0;
      int v154 = 0;
      if (v164) {
        uint64_t v303 = v669;
      }
      else {
        uint64_t v303 = v633;
      }
      uint64_t v633 = v303;
      uint64_t v615 = v251;
LABEL_584:
      if (v154 && v154 != 5) {
        goto LABEL_40;
      }
      a4 = v638;
      if (!fgets((char *)(v687[3] + v146), *((_DWORD *)v683 + 6) - v146, v14)) {
        goto LABEL_790;
      }
    }
    LOBYTE(v664) = 0;
    LOBYTE(v669) = 0;
    unint64_t v149 = sub_10007CCCC(v147, v148, v647, v674, v675);
    id v627 = [v148 rangeWithName:@"kernelDot"];
    id v690 = (id)-1;
    id v150 = sub_10007CD64(v147, v635, v148, v650, v647, (unint64_t *)&v690);
    unint64_t v151 = (unint64_t)v150;
    unint64_t v620 = v149;
    v623 = v147;
    if (v609 == -1)
    {
      uint64_t v153 = -1;
    }
    else
    {
      unint64_t v152 = 0;
      uint64_t v153 = -1;
      if (v690 != (id)v609 || v604 != v150) {
        goto LABEL_319;
      }
      LOBYTE(v669) = 1;
      uint64_t v153 = v609;
    }
    unint64_t v152 = (unint64_t)v604;
LABEL_319:
    id v167 = [v148 rangeWithName:@"symbolName"];
    if (v167 == (id)0x7FFFFFFFFFFFFFFFLL) {
      v168 = 0;
    }
    else {
      v168 = -[NSString substringWithRange:](v623, "substringWithRange:", v167, v166);
    }
    id v170 = [v148 rangeWithName:@"offsetIntoSymbol"];
    if (v170 == (id)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v171 = -1;
    }
    else {
      uint64_t v171 = (int)sub_10007E83C(-[NSString substringWithRange:](v623, "substringWithRange:", v170, v169));
    }
    id v172 = v690;
    LOBYTE(v664) = 0;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100082298;
    *(void *)&buf[24] = &unk_1000DDE58;
    *(void *)&buf[32] = v636;
    *(void *)&buf[40] = v614;
    char v706 = v647;
    int v703 = v674;
    int v704 = v675;
    int v705 = v620;
    BOOL v707 = v627 != (id)0x7FFFFFFFFFFFFFFFLL;
    v700 = &v669;
    id v701 = v690;
    *(void *)&buf[48] = v151;
    v697 = (int *)v650;
    v698 = v168;
    v699 = &v664;
    uint64_t v702 = v171;
    sub_10007F43C(v14, v635, (uint64_t)buf);
    int v173 = v669;
    if ((_BYTE)v669) {
      uint64_t v174 = (uint64_t)v172;
    }
    else {
      uint64_t v174 = v153;
    }
    uint64_t v609 = v174;
    if ((_BYTE)v669) {
      unint64_t v175 = v151;
    }
    else {
      unint64_t v175 = v152;
    }
    id v604 = (id)v175;
    int v176 = v664;
    id v179 = [v148 rangeWithName:@"count"];
    if (v179 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (byte_1000EBCF8)
      {
        int v462 = *__error();
        v463 = sub_10002E548();
        if (os_log_type_enabled(v463, OS_LOG_TYPE_ERROR))
        {
          [(NSString *)v623 UTF8String];
          sub_100099E48();
        }
        *__error() = v462;
      }
      if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
      {
        int v457 = *__error();
        CFStringRef v458 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: frame match with no count (%d: %s)", "range.location != NSNotFound", v635, [(NSString *)v623 UTF8String]);
        CFStringRef v459 = v458;
        if (v458)
        {
          v535 = (char *)CFStringGetCStringPtr(v458, 0x8000100u);
          if (v535)
          {
            v536 = 0;
          }
          else
          {
            v535 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x72A5D112uLL);
            CFStringGetCString(v459, v535, 1024, 0x8000100u);
            v536 = v535;
          }
          if (qword_1000EBD00) {
            v554 = (FILE *)qword_1000EBD00;
          }
          else {
            v554 = __stderrp;
          }
          fprintf(v554, "%s\n", v535);
          if (v536) {
            free(v536);
          }
          CFRelease(v459);
        }
        else
        {
          v460 = sub_10002E548();
          if (os_log_type_enabled(v460, OS_LOG_TYPE_FAULT))
          {
            [(NSString *)v623 UTF8String];
            sub_100099E04();
          }
          if (qword_1000EBD00) {
            v461 = (FILE *)qword_1000EBD00;
          }
          else {
            v461 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v461);
        }
        *__error() = v457;
      }
      [(NSString *)v623 UTF8String];
      v559 = "%s: frame match with no count (%d: %s)";
      int v560 = 1553;
    }
    else
    {
      int v632 = sub_10007E83C(-[NSString substringWithRange:](v623, "substringWithRange:", v179, v178));
      if (v647)
      {
        id v642 = sub_100081AD4(v623, v148, v151, (uint64_t)v172, v176 != 0, v173 != 0);
        int v180 = 0;
        v181 = 0;
        LODWORD(v151) = 0;
        unint64_t v182 = 0;
        unint64_t v617 = -1;
LABEL_364:
        if (objc_msgSend(objc_msgSend(v642, "firstObject"), "length"))
        {
          id v203 = v642;
          v204 = v181;
          if (!v676)
          {
            if (v151 && v182)
            {
LABEL_370:
              int v205 = self->_startIndex;
              if (v205 && (int)v151 < v205)
              {
                int v632 = v151 + v632 - v205;
                LODWORD(v151) = self->_startIndex;
              }
LABEL_373:
              if (v182 && (int v206 = self->_endIndex) != 0 && (int)v182 > v206)
              {
                int v207 = v180;
                int v632 = v632 - v182 + v206;
                unint64_t v182 = self->_endIndex;
              }
              else
              {
                int v207 = v180;
              }
              if (v632 <= 0)
              {
                BOOL v631 = v632 < 1;
                if (v151)
                {
                  int v215 = self->_endIndex;
                  if (v215) {
                    BOOL v216 = (int)v151 <= v215;
                  }
                  else {
                    BOOL v216 = 1;
                  }
LABEL_394:
                  char v217 = !v216;
                  v603 |= v217;
                }
                goto LABEL_398;
              }
              if ((int)v620 > (int)v633 && v620 != v633 + 1)
              {
                if (byte_1000EBCF8)
                {
                  int v208 = *__error();
                  v209 = sub_10002E548();
                  if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&buf[4] = v635;
                    *(_WORD *)&buf[8] = 2112;
                    *(void *)&buf[10] = v623;
                    _os_log_error_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_ERROR, "Parsing spindump text: Unexpected indent for line (%d: %@)", buf, 0x12u);
                  }
                  *__error() = v208;
                }
                BOOL v631 = v632 < 1;
                int v154 = 2;
                if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
                {
                  int v210 = *__error();
                  CFStringRef v211 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: Unexpected indent for line (%d: %@)", v635, v623);
                  CFStringRef v212 = v211;
                  if (v211)
                  {
                    v213 = (char *)CFStringGetCStringPtr(v211, 0x8000100u);
                    if (v213)
                    {
                      v214 = 0;
                    }
                    else
                    {
                      v213 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xEE18143AuLL);
                      CFStringGetCString(v212, v213, 1024, 0x8000100u);
                      v214 = v213;
                    }
                    if (qword_1000EBD00) {
                      v271 = (FILE *)qword_1000EBD00;
                    }
                    else {
                      v271 = __stderrp;
                    }
                    fprintf(v271, "%s\n", v213);
                    if (v214) {
                      free(v214);
                    }
                    CFRelease(v212);
                  }
                  else
                  {
                    v247 = sub_10002E548();
                    if (os_log_type_enabled(v247, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)&buf[4] = v635;
                      *(_WORD *)&buf[8] = 2112;
                      *(void *)&buf[10] = v623;
                      _os_log_fault_impl((void *)&_mh_execute_header, v247, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: Unexpected indent for line (%d: %@)", buf, 0x12u);
                    }
                    if (qword_1000EBD00) {
                      v248 = (FILE *)qword_1000EBD00;
                    }
                    else {
                      v248 = __stderrp;
                    }
                    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v248);
                  }
                  *__error() = v210;
                }
                goto LABEL_499;
              }
              if (self->_isHeavy == v676)
              {
                int v218 = self->_omitFramesBelowSampleCount;
                if (v218 < 1 || v632 >= v218)
                {
                  unsigned int v219 = v612;
                  if (v612 <= 0)
                  {
                    unsigned int v219 = v207;
                    if (v207 <= 0) {
                      unsigned int v219 = vcvtpd_s64_f64(log10((double)v632)) + 2;
                    }
                  }
                  int v612 = v219;
                  uint64_t v220 = v615;
                  v221 = (unsigned int *)&v22[8 * v615 - 8];
                  uint64_t v222 = (8 * (int)v615) | 4;
                  int v606 = v151;
                  v608 = v181;
                  while (1)
                  {
                    uint64_t v223 = v220;
                    uint64_t v224 = v222;
                    if ((int)v220 < 1) {
                      break;
                    }
                    --v220;
                    unsigned int v225 = *v221;
                    v221 -= 2;
                    v222 -= 8;
                    if (v225 < v620)
                    {
                      unsigned int v226 = v221[3];
                      goto LABEL_484;
                    }
                  }
                  unsigned int v226 = 0;
LABEL_484:
                  unint64_t v260 = 0;
                  int v261 = v226 + v620;
                  while (v260 < (unint64_t)[v642 count])
                  {
                    unint64_t v262 = v182;
                    id v263 = [v642 objectAtIndexedSubscript:v260];
                    int v264 = v675;
                    int v265 = v674;
                    v266 = (const char *)[v263 UTF8String];
                    v267 = [(NSString *)v608 UTF8String];
                    int v268 = v265 + v264 * (v261 + v260);
                    unint64_t v182 = v262;
                    sub_10007E8AC(v638, v268, v627 != (id)0x7FFFFFFFFFFFFFFFLL, v632, v612, v266, v617, v267, v606, v262);
                    ++v260;
                    v6 = v610;
                  }
                  if ((unint64_t)[v642 count] <= 1)
                  {
                    uint64_t v615 = v223;
                  }
                  else
                  {
                    v22 = (char *)malloc_type_realloc(v22, 8 * ((int)v223 + 1), 0x100004000313F17uLL);
                    *(_DWORD *)&v22[v224 - 4] = v620;
                    unsigned int v269 = [v642 count];
                    if ((int)v223 < 1) {
                      int v270 = 0;
                    }
                    else {
                      int v270 = *(_DWORD *)&v22[8 * (v223 - 1) + 4];
                    }
                    *(_DWORD *)&v22[v224] = v269 - 1 + v270;
                    uint64_t v615 = v223 + 1;
                  }
                }
LABEL_549:
                BOOL v631 = 0;
                int v146 = 0;
                int v154 = 0;
                uint64_t v290 = v620;
                goto LABEL_550;
              }
              if (v620)
              {
                if (!Weak)
                {
                  if (byte_1000EBCF8)
                  {
                    int v502 = *__error();
                    v503 = sub_10002E548();
                    if (os_log_type_enabled(v503, OS_LOG_TYPE_ERROR))
                    {
                      v504 = [(NSString *)v623 UTF8String];
                      *(_DWORD *)buf = 136315906;
                      *(void *)&buf[4] = "previousNode";
                      *(_WORD *)&buf[12] = 1024;
                      *(_DWORD *)&buf[14] = v620;
                      *(_WORD *)&buf[18] = 1024;
                      *(_DWORD *)&buf[20] = v635;
                      *(_WORD *)&buf[24] = 2080;
                      *(void *)&buf[26] = v504;
                      _os_log_error_impl((void *)&_mh_execute_header, v503, OS_LOG_TYPE_ERROR, "%s: no previousNode for indent of %d (%d: %s)", buf, 0x22u);
                    }
                    *__error() = v502;
                  }
                  if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
                  {
                    int v505 = *__error();
                    CFStringRef v506 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: no previousNode for indent of %d (%d: %s)", "previousNode", v620, v635, [(NSString *)v623 UTF8String]);
                    CFStringRef v507 = v506;
                    if (v506)
                    {
                      v597 = (char *)CFStringGetCStringPtr(v506, 0x8000100u);
                      if (v597)
                      {
                        v598 = 0;
                      }
                      else
                      {
                        v597 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xE0DFAE82uLL);
                        CFStringGetCString(v507, v597, 1024, 0x8000100u);
                        v598 = v597;
                      }
                      if (qword_1000EBD00) {
                        v601 = (FILE *)qword_1000EBD00;
                      }
                      else {
                        v601 = __stderrp;
                      }
                      fprintf(v601, "%s\n", v597);
                      if (v598) {
                        free(v598);
                      }
                      CFRelease(v507);
                    }
                    else
                    {
                      v508 = sub_10002E548();
                      if (os_log_type_enabled(v508, OS_LOG_TYPE_FAULT))
                      {
                        v509 = [(NSString *)v623 UTF8String];
                        *(_DWORD *)buf = 136315906;
                        *(void *)&buf[4] = "previousNode";
                        *(_WORD *)&buf[12] = 1024;
                        *(_DWORD *)&buf[14] = v620;
                        *(_WORD *)&buf[18] = 1024;
                        *(_DWORD *)&buf[20] = v635;
                        *(_WORD *)&buf[24] = 2080;
                        *(void *)&buf[26] = v509;
                        _os_log_fault_impl((void *)&_mh_execute_header, v508, OS_LOG_TYPE_FAULT, "Unable to format: %s: no previousNode for indent of %d (%d: %s)", buf, 0x22u);
                      }
                      if (qword_1000EBD00) {
                        v510 = (FILE *)qword_1000EBD00;
                      }
                      else {
                        v510 = __stderrp;
                      }
                      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v510);
                    }
                    *__error() = v505;
                  }
                  [(NSString *)v623 UTF8String];
                  sub_10002E41C("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 578, "%s: no previousNode for indent of %d (%d: %s)", v511, v512, v513, v514, (char)"previousNode");
                  goto LABEL_888;
                }
                if ((int)v633 >= (int)v620)
                {
                  while (1)
                  {
                    Weak = (id *)objc_loadWeak(Weak + 7);
                    if (!Weak) {
                      break;
                    }
                    BOOL v33 = (int)v633 <= (int)v620;
                    uint64_t v633 = (v633 - 1);
                    if (v33) {
                      goto LABEL_424;
                    }
                  }
                  if (byte_1000EBCF8)
                  {
                    int v435 = *__error();
                    v436 = sub_10002E548();
                    if (os_log_type_enabled(v436, OS_LOG_TYPE_ERROR))
                    {
                      v437 = [(NSString *)v623 UTF8String];
                      *(_DWORD *)buf = 136316162;
                      *(void *)&buf[4] = "previousNode";
                      *(_WORD *)&buf[12] = 1024;
                      *(_DWORD *)&buf[14] = v620;
                      *(_WORD *)&buf[18] = 1024;
                      *(_DWORD *)&buf[20] = v633;
                      *(_WORD *)&buf[24] = 1024;
                      *(_DWORD *)&buf[26] = v635;
                      *(_WORD *)&buf[30] = 2080;
                      *(void *)&buf[32] = v437;
                      _os_log_error_impl((void *)&_mh_execute_header, v436, OS_LOG_TYPE_ERROR, "%s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", buf, 0x28u);
                    }
                    *__error() = v435;
                  }
                  if (byte_1000EBCF9) {
                    BOOL v438 = dword_1000EB4A8 <= 3;
                  }
                  else {
                    BOOL v438 = 0;
                  }
                  if (v438)
                  {
                    int v439 = *__error();
                    CFStringRef v440 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", "previousNode", v620, v633, v635, [(NSString *)v623 UTF8String]);
                    CFStringRef v441 = v440;
                    if (v440)
                    {
                      v587 = (char *)CFStringGetCStringPtr(v440, 0x8000100u);
                      if (v587)
                      {
                        v588 = 0;
                      }
                      else
                      {
                        v587 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x287E1945uLL);
                        CFStringGetCString(v441, v587, 1024, 0x8000100u);
                        v588 = v587;
                      }
                      if (qword_1000EBD00) {
                        v594 = (FILE *)qword_1000EBD00;
                      }
                      else {
                        v594 = __stderrp;
                      }
                      fprintf(v594, "%s\n", v587);
                      if (v588) {
                        free(v588);
                      }
                      CFRelease(v441);
                    }
                    else
                    {
                      v442 = sub_10002E548();
                      if (os_log_type_enabled(v442, OS_LOG_TYPE_FAULT))
                      {
                        v443 = [(NSString *)v623 UTF8String];
                        *(_DWORD *)buf = 136316162;
                        *(void *)&buf[4] = "previousNode";
                        *(_WORD *)&buf[12] = 1024;
                        *(_DWORD *)&buf[14] = v620;
                        *(_WORD *)&buf[18] = 1024;
                        *(_DWORD *)&buf[20] = v633;
                        *(_WORD *)&buf[24] = 1024;
                        *(_DWORD *)&buf[26] = v635;
                        *(_WORD *)&buf[30] = 2080;
                        *(void *)&buf[32] = v443;
                        _os_log_fault_impl((void *)&_mh_execute_header, v442, OS_LOG_TYPE_FAULT, "Unable to format: %s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", buf, 0x28u);
                      }
                      if (qword_1000EBD00) {
                        v444 = (FILE *)qword_1000EBD00;
                      }
                      else {
                        v444 = __stderrp;
                      }
                      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v444);
                    }
                    *__error() = v439;
                  }
                  [(NSString *)v623 UTF8String];
                  sub_10002E41C("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 583, "%s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", v445, v446, v447, v448, (char)"previousNode");
LABEL_888:
                  abort();
                }
LABEL_424:
                Weak = sub_100075720((uint64_t)Weak, v627 != (id)0x7FFFFFFFFFFFFFFFLL, v642, (void *)v617, v181, 0);
              }
              else
              {
                if (obj)
                {
                  long long v672 = 0u;
                  long long v673 = 0u;
                  long long v670 = 0u;
                  long long v671 = 0u;
                  id v244 = [obj countByEnumeratingWithState:&v670 objects:v694 count:16];
                  if (v244)
                  {
                    uint64_t v245 = *(void *)v671;
LABEL_449:
                    uint64_t v246 = 0;
                    while (1)
                    {
                      if (*(void *)v671 != v245) {
                        objc_enumerationMutation(obj);
                      }
                      Weak = *(id **)(*((void *)&v670 + 1) + 8 * v246);
                      if (sub_1000758AC((uint64_t)Weak, v627 != (id)0x7FFFFFFFFFFFFFFFLL, v642, v617, (uint64_t)v181, 0))break; {
                      if (v244 == (id)++v246)
                      }
                      {
                        id v244 = [obj countByEnumeratingWithState:&v670 objects:v694 count:16];
                        if (v244) {
                          goto LABEL_449;
                        }
                        goto LABEL_526;
                      }
                    }
                    if (Weak) {
                      goto LABEL_528;
                    }
                  }
                }
                else
                {
                  id obj = objc_alloc_init((Class)NSMutableArray);
                }
LABEL_526:
                Weak = sub_10007524C((uint64_t)SPTreeNode, 0, v627 != (id)0x7FFFFFFFFFFFFFFFLL, v642, (void *)v617, v181, 0);
                [obj addObject:Weak];
              }
              if (Weak) {
LABEL_528:
              }
                *((_DWORD *)Weak + 3) += v632;
              else {
                Weak = 0;
              }
              goto LABEL_549;
            }
            if (byte_1000EBCF8)
            {
              int v227 = *__error();
              v228 = sub_10002E548();
              if (os_log_type_enabled(v228, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v635;
                *(_WORD *)&buf[8] = 2112;
                *(void *)&buf[10] = v623;
                _os_log_error_impl((void *)&_mh_execute_header, v228, OS_LOG_TYPE_ERROR, "Parsing spindump text: No start/end index for frame line in timeline report (%d: %@)", buf, 0x12u);
              }
              *__error() = v227;
            }
            if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
            {
              int v607 = *__error();
              CFStringRef v229 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Parsing spindump text: No start/end index for frame line in timeline report (%d: %@)", v635, v623);
              CFStringRef v230 = v229;
              if (v229)
              {
                v231 = (char *)CFStringGetCStringPtr(v229, 0x8000100u);
                if (v231)
                {
                  v232 = 0;
                }
                else
                {
                  v231 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xD7EA6958uLL);
                  CFStringGetCString(v230, v231, 1024, 0x8000100u);
                  v232 = v231;
                }
                if (qword_1000EBD00) {
                  v286 = (FILE *)qword_1000EBD00;
                }
                else {
                  v286 = __stderrp;
                }
                fprintf(v286, "%s\n", v231);
                if (v232) {
                  free(v232);
                }
                CFRelease(v230);
              }
              else
              {
                v272 = sub_10002E548();
                if (os_log_type_enabled(v272, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = v635;
                  *(_WORD *)&buf[8] = 2112;
                  *(void *)&buf[10] = v623;
                  _os_log_fault_impl((void *)&_mh_execute_header, v272, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: No start/end index for frame line in timeline report (%d: %@)", buf, 0x12u);
                }
                if (qword_1000EBD00) {
                  v273 = (FILE *)qword_1000EBD00;
                }
                else {
                  v273 = __stderrp;
                }
                fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v273);
              }
              *__error() = v607;
            }
          }
          if (!v151) {
            goto LABEL_373;
          }
          goto LABEL_370;
        }
        if (byte_1000EBCF8)
        {
          int v420 = *__error();
          v421 = sub_10002E548();
          if (os_log_type_enabled(v421, OS_LOG_TYPE_ERROR))
          {
            id v422 = [[objc_msgSend(v642, "debugDescription") UTF8String];
            v423 = [(NSString *)v623 UTF8String];
            *(_DWORD *)buf = 136315906;
            *(void *)&buf[4] = "frameBodies.firstObject.length > 0";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v422;
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = v635;
            *(_WORD *)&buf[28] = 2080;
            *(void *)&buf[30] = v423;
            _os_log_error_impl((void *)&_mh_execute_header, v421, OS_LOG_TYPE_ERROR, "%s: No frame bodies in %s (%d: %s)", buf, 0x26u);
          }
          *__error() = v420;
        }
        if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
        {
          int v424 = *__error();
          CFStringRef v425 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: No frame bodies in %s (%d: %s)", "frameBodies.firstObject.length > 0", [objc_msgSend(objc_msgSend(v642, "debugDescription"), "UTF8String") UTF8String], v635, [-NSString UTF8String](v623, "UTF8String"));
          CFStringRef v426 = v425;
          if (v425)
          {
            v585 = (char *)CFStringGetCStringPtr(v425, 0x8000100u);
            if (v585)
            {
              v586 = 0;
            }
            else
            {
              v585 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x15E719C8uLL);
              CFStringGetCString(v426, v585, 1024, 0x8000100u);
              v586 = v585;
            }
            if (qword_1000EBD00) {
              v591 = (FILE *)qword_1000EBD00;
            }
            else {
              v591 = __stderrp;
            }
            fprintf(v591, "%s\n", v585);
            if (v586) {
              free(v586);
            }
            CFRelease(v426);
          }
          else
          {
            v427 = sub_10002E548();
            if (os_log_type_enabled(v427, OS_LOG_TYPE_FAULT))
            {
              id v428 = [[objc_msgSend(v642, "debugDescription") UTF8String];
              v429 = [(NSString *)v623 UTF8String];
              *(_DWORD *)buf = 136315906;
              *(void *)&buf[4] = "frameBodies.firstObject.length > 0";
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = v428;
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = v635;
              *(_WORD *)&buf[28] = 2080;
              *(void *)&buf[30] = v429;
              _os_log_fault_impl((void *)&_mh_execute_header, v427, OS_LOG_TYPE_FAULT, "Unable to format: %s: No frame bodies in %s (%d: %s)", buf, 0x26u);
            }
            if (qword_1000EBD00) {
              v430 = (FILE *)qword_1000EBD00;
            }
            else {
              v430 = __stderrp;
            }
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v430);
          }
          *__error() = v424;
        }
        [objc_msgSend(v642, "debugDescription") UTF8String];
        [(NSString *)v623 UTF8String];
        sub_10002E41C("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 484, "%s: No frame bodies in %s (%d: %s)", v431, v432, v433, v434, (char)"frameBodies.firstObject.length > 0");
LABEL_1087:
        abort();
      }
      if ([v148 rangeWithName:@"countAndWhitespace"] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        int v180 = v183;
        id v185 = [v148 rangeWithName:@"address"];
        if (v185 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v617 = 0;
          if (v151 && v172 != (id)0x7FFFFFFFFFFFFFFFLL) {
            unint64_t v617 = (unint64_t)v172 + *(void *)(v151 + 56);
          }
        }
        else
        {
          unint64_t v617 = sub_10007E83C(-[NSString substringWithRange:](v623, "substringWithRange:", v185, v184));
        }
        id v642 = sub_100081AD4(v623, v148, v151, (uint64_t)v172, v176 != 0, v173 != 0);
        id v187 = [v148 rangeWithName:@"stateInfo"];
        if (v187 == (id)0x7FFFFFFFFFFFFFFFLL) {
          v181 = 0;
        }
        else {
          v181 = -[NSString substringWithRange:](v623, "substringWithRange:", v187, v186);
        }
        id v189 = [v148 rangeWithName:@"startIndex"];
        if (v189 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          LODWORD(v151) = 0;
          unint64_t v182 = 0;
        }
        else
        {
          unint64_t v151 = sub_10007E83C(-[NSString substringWithRange:](v623, "substringWithRange:", v189, v188));
          id v191 = [v148 rangeWithName:@"endIndex"];
          if (v191 == (id)0x7FFFFFFFFFFFFFFFLL) {
            unint64_t v182 = v151;
          }
          else {
            unint64_t v182 = sub_10007E83C(-[NSString substringWithRange:](v623, "substringWithRange:", v191, v190));
          }
        }
        goto LABEL_364;
      }
      if (byte_1000EBCF8)
      {
        int v496 = *__error();
        v497 = sub_10002E548();
        if (os_log_type_enabled(v497, OS_LOG_TYPE_ERROR))
        {
          [(NSString *)v623 UTF8String];
          sub_100099ED0();
        }
        *__error() = v496;
      }
      if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
      {
        int v464 = *__error();
        CFStringRef v465 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: frame match with no count and whitespace (%d: %s)", "range.location != NSNotFound", v635, [(NSString *)v623 UTF8String]);
        CFStringRef v466 = v465;
        if (v465)
        {
          v550 = (char *)CFStringGetCStringPtr(v465, 0x8000100u);
          if (v550)
          {
            v551 = 0;
          }
          else
          {
            v550 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x43C64E57uLL);
            CFStringGetCString(v466, v550, 1024, 0x8000100u);
            v551 = v550;
          }
          if (qword_1000EBD00) {
            v567 = (FILE *)qword_1000EBD00;
          }
          else {
            v567 = __stderrp;
          }
          fprintf(v567, "%s\n", v550);
          if (v551) {
            free(v551);
          }
          CFRelease(v466);
        }
        else
        {
          v467 = sub_10002E548();
          if (os_log_type_enabled(v467, OS_LOG_TYPE_FAULT))
          {
            [(NSString *)v623 UTF8String];
            sub_100099E8C();
          }
          if (qword_1000EBD00) {
            v468 = (FILE *)qword_1000EBD00;
          }
          else {
            v468 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v468);
        }
        *__error() = v464;
      }
      [(NSString *)v623 UTF8String];
      v559 = "%s: frame match with no count and whitespace (%d: %s)";
      int v560 = 1557;
    }
    sub_10002E41C("ParseFrameLine", "SPTextualReportParser.m", v560, v559, v555, v556, v557, v558, (char)"range.location != NSNotFound");
    goto LABEL_1087;
  }
  v22 = 0;
  id obj = 0;
LABEL_790:
  char v21 = 1;
  while (fgets((char *)v687[3], *((_DWORD *)v683 + 6), v14))
    fputs((const char *)v687[3], a4);
LABEL_808:
  v397 = (void *)v687[3];
  if (v397) {
    free(v397);
  }
  if (v14) {
    fclose(v14);
  }
  if (v22) {
    free(v22);
  }

  _Block_object_dispose(&v682, 8);
  _Block_object_dispose(&v686, 8);
  return v21 & 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SPTextualReportParser;
  [(SPTextualReportParser *)&v3 dealloc];
}

- (BOOL)isHeavy
{
  return self->_isHeavy;
}

- (void)setIsHeavy:(BOOL)a3
{
  self->_isHeavy = a3;
}

- (int)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(int)a3
{
  self->_int startIndex = a3;
}

- (int)endIndex
{
  return self->_endIndex;
}

- (void)setEndIndex:(int)a3
{
  self->_int endIndex = a3;
}

- (int)omitFramesBelowSampleCount
{
  return self->_omitFramesBelowSampleCount;
}

- (void)setOmitFramesBelowSampleCount:(int)a3
{
  self->_int omitFramesBelowSampleCount = a3;
}

- (BOOL)symbolicate
{
  return self->_symbolicate;
}

- (void)setSymbolicate:(BOOL)a3
{
  self->_symbolicate = a3;
}

- (BOOL)useDsymForUUIDForEverything
{
  return self->_useDsymForUUIDForEverything;
}

- (void)setUseDsymForUUIDForEverything:(BOOL)a3
{
  self->_useDsymForUUIDForEverything = a3;
}

- (NSArray)findDsymsForIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFindDsymsForIDs:(id)a3
{
}

@end
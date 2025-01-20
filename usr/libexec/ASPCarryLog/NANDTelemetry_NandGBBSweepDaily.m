@interface NANDTelemetry_NandGBBSweepDaily
+ (BOOL)shouldRegisterActivity;
+ (void)setGBBXpcCritiria:(id)a3;
- ($A820A8BF802304C85716FC6448E144CF)sweepInfo;
- (BOOL)_createDirectoryAt:(id)a3;
- (BOOL)_isGBBSweepEnabled;
- (BOOL)wasSigtermReceived;
- (NANDTelemetry_NandGBBSweepDaily)initWithXpcActivityMgr:(id)a3 persistentStateMgr:(id)a4 privacyMgr:(id)a5;
- (NSString)blockPath;
- (NSString)compressedPath;
- (id)_getBlockStr:(unsigned int)a3;
- (id)_getReasonString:(unsigned int)a3;
- (int)sweepError;
- (int)uploadFile:(id)a3 description:(id)a4;
- (unint64_t)sweepBufSize;
- (unsigned)currBlock;
- (void)_checkTestHook;
- (void)_cleanItemAt:(id)a3;
- (void)_compressRange:(unsigned int)a3 startWL:(unsigned int)a4 endWL:(unsigned int)a5 content:(id)a6;
- (void)_doCleanup:(id)a3;
- (void)_fillSweepParams;
- (void)_gatherRadarInfo;
- (void)_sweepBlock:(id *)a3;
- (void)_writeCounters:(id)a3 counters:(id)a4;
- (void)cleanUpForTelemetryDisable;
- (void)ctl;
- (void)getDefects:(unint64_t *)a3;
- (void)markGBBAsSwept;
- (void)runActivity;
- (void)setBlockPath:(id)a3;
- (void)setCompressedPath:(id)a3;
- (void)setCtl:(void *)a3;
- (void)setCurrBlock:(unsigned int)a3;
- (void)setSweepBuf:(void *)a3;
- (void)setSweepBufSize:(unint64_t)a3;
- (void)setSweepError:(int)a3;
- (void)setSweepInfo:(id *)a3;
- (void)setWasSigtermReceived:(BOOL)a3;
- (void)sweepBuf;
@end

@implementation NANDTelemetry_NandGBBSweepDaily

- (NANDTelemetry_NandGBBSweepDaily)initWithXpcActivityMgr:(id)a3 persistentStateMgr:(id)a4 privacyMgr:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NANDTelemetry_NandGBBSweepDaily;
  v5 = [(NANDTelemetry_Base *)&v9 initWithXpcActivityMgr:a3 persistentStateMgr:a4 privacyMgr:a5];
  v6 = v5;
  if (v5)
  {
    v5->_ctl = 0;
    v5->_sweepBuf = 0;
    v5->_sweepInfo = 0;
    v5->_sweepBufSize = 3145728;
    v5->_sweepError = 0;
    v7 = v5;
  }

  return v6;
}

- (BOOL)_isGBBSweepEnabled
{
  return 1;
}

- (BOOL)_createDirectoryAt:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];

  if (v5)
  {
    v6 = +[NSFileManager defaultManager];
    NSFileAttributeKey v10 = NSFilePosixPermissions;
    v11 = &off_1000B05B0;
    v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [v6 setAttributes:v7 ofItemAtPath:v3 error:0];
  }
  else
  {
    v8 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100046790(v3, v8);
    }
  }

  return v5;
}

- (void)_doCleanup:(id)a3
{
  id v4 = a3;
  if ([(NANDTelemetry_NandGBBSweepDaily *)self sweepError] == 8) {
    goto LABEL_5;
  }
  if ([(NANDTelemetry_NandGBBSweepDaily *)self sweepError] && (unsigned __int16)word_1000C888A < 4u)
  {
    ++word_1000C888A;
LABEL_5:
    byte_1000C8888 = 1;
    goto LABEL_9;
  }
  dword_1000C888C = 0;
  byte_1000C8888 = 0;
  if ((byte_1000C8890 & 1) == 0) {
    [(NANDTelemetry_NandGBBSweepDaily *)self _cleanItemAt:v4];
  }
  word_1000C888A = 0;
LABEL_9:
}

- (void)_cleanItemAt:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  [v4 removeItemAtPath:v3 error:0];
}

- (void)_writeCounters:(id)a3 counters:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    id v9 = 0;
    v8 = +[NSJSONSerialization dataWithJSONObject:v6 options:1 error:&v9];
    id v6 = v9;
    if (!v6)
    {
      [v8 writeToFile:v5 atomically:1];
      id v6 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
}

- (void)_compressRange:(unsigned int)a3 startWL:(unsigned int)a4 endWL:(unsigned int)a5 content:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v22 = a6;
  if (v7 < a5)
  {
    do
    {
      NSFileAttributeKey v10 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
      v11 = +[NSString stringWithFormat:@"%@/Sweep_Wordline_%d.bin", v10, v7];
      [v22 addObject:v11];

      uint64_t v7 = (v7 + 1);
    }
    while (a5 != v7);
  }
  if (a5 == a3)
  {
    v12 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
    v13 = +[NSString stringWithFormat:@"%@/FTLCounters.json", v12];
    [v22 addObject:v13];

    v14 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
    v15 = +[NSString stringWithFormat:@"%@/MSPCounters.json", v14];
    [v22 addObject:v15];

    v16 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
    v17 = +[NSString stringWithFormat:@"%@/description.txt", v16];
    [v22 addObject:v17];

    v18 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
    v19 = +[NSString stringWithFormat:@"%@/Defects.txt", v18];
    [v22 addObject:v19];

    v20 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
    v21 = +[NSString stringWithFormat:@"%@/ErrorLog.txt", v20];
    [v22 addObject:v21];
  }
}

- (void)_fillSweepParams
{
  id v3 = [(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo];
  LODWORD(xmmword_1000C8894) = v3->var1[[(NANDTelemetry_NandGBBSweepDaily *)self currBlock]].var0;
  id v4 = [(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo];
  DWORD1(xmmword_1000C8894) = v4->var1[[(NANDTelemetry_NandGBBSweepDaily *)self currBlock]].var1;
  id v5 = [(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo];
  DWORD2(xmmword_1000C8894) = v5->var1[[(NANDTelemetry_NandGBBSweepDaily *)self currBlock]].var2;
  id v6 = [(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo];
  HIDWORD(xmmword_1000C8894) = v6->var1[[(NANDTelemetry_NandGBBSweepDaily *)self currBlock]].var3;
  uint64_t v7 = [(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo];
  dword_1000C88A4 = v7->var1[[(NANDTelemetry_NandGBBSweepDaily *)self currBlock]].var4;
  v8 = [(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo];
  BOOL v9 = (v8->var1[[(NANDTelemetry_NandGBBSweepDaily *)self currBlock]].var5 & 0xFFFFFFFE) == 2;
  dword_1000C88A8 = 0;
  dword_1000C88AC = v9;
  *(_OWORD *)algn_1000C88B0 = xmmword_10008A290;
  NSFileAttributeKey v10 = [(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo];
  dword_1000C88C0 = v10->var1[[(NANDTelemetry_NandGBBSweepDaily *)self currBlock]].var6;
}

- (void)_gatherRadarInfo
{
  id v3 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
  id v4 = +[NSString stringWithFormat:@"%@/description.txt", v3];
  [v4 UTF8String];
  __strcpy_chk();

  id v5 = fopen(__filename, "a");
  if (v5)
  {
    id v6 = v5;
    fprintf(v5, "Build Version: %.*s\n", 8, (const char *)[(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo] + 144);
    fprintf(v6, "Build Number : %.*s\n", 16, (const char *)[(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo] + 152);
    fprintf(v6, "Long Version : %.*s\n", 128, (const char *)[(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo] + 168);
    fprintf(v6, "MSP Version  : %.*s\n", 16, (const char *)[(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo] + 296);
    fprintf(v6, "NAND Vendor  : %.*s\n", 16, (const char *)[(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo] + 344);
    fprintf(v6, "Build Type   : %.*s\n", 32, (const char *)[(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo] + 312);
    fprintf(v6, "Capacity     : %d GB\n\n", *((unsigned __int16 *)[(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo] + 213));
    fclose(v6);
  }
  if (![(NANDTelemetry_NandGBBSweepDaily *)self wasSigtermReceived])
  {
    v14 = CopyWhitelistedNANDFTLInfo(1, v7, v8, v9, v10, v11, v12, v13);
    id v15 = CopyWhitelistedNANDMSPInfo();
    v16 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
    v17 = +[NSString stringWithFormat:@"%@/FTLCounters.json", v16];
    [(NANDTelemetry_NandGBBSweepDaily *)self _writeCounters:v17 counters:v14];

    v18 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
    v19 = +[NSString stringWithFormat:@"%@/MSPCounters.json", v18];
    [(NANDTelemetry_NandGBBSweepDaily *)self _writeCounters:v19 counters:v15];

    v20 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
    id v21 = +[NSString stringWithFormat:@"%@/Defects.txt", v20];
    print_grown_defects_ext((char *)[v21 UTF8String]);

    id v22 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
    id v23 = +[NSString stringWithFormat:@"%@/ErrorLog.txt", v22];
    sub_10003A5E4((const char *)[v23 UTF8String]);

    print_geometry(__filename);
  }
}

- (id)_getReasonString:(unsigned int)a3
{
  if (a3 - 1 > 0x13) {
    return @"UNKNOWN_REASON";
  }
  else {
    return off_1000909B8[a3 - 1];
  }
}

- (id)_getBlockStr:(unsigned int)a3
{
  if (byte_1000C8888 == 1)
  {
    uint64_t v5 = dword_1000C88C4;
  }
  else
  {
    id v6 = [(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo];
    uint64_t v5 = v6->var11[[(NANDTelemetry_NandGBBSweepDaily *)self currBlock]];
  }
  uint64_t v7 = DWORD1(xmmword_1000C8894);
  uint64_t v16 = xmmword_1000C8894;
  uint64_t v8 = DWORD2(xmmword_1000C8894);
  uint64_t v9 = HIDWORD(xmmword_1000C8894);
  uint64_t v10 = dword_1000C88A4;
  unsigned int v17 = a3;
  if (v5 >= a3)
  {
    uint64_t v11 = @"Token";
  }
  else
  {
    uint64_t v11 = +[NSString stringWithFormat:@"%d", v5];
  }
  uint64_t v12 = dword_1000C88AC;
  uint64_t v13 = [(NANDTelemetry_NandGBBSweepDaily *)self _getReasonString:dword_1000C88C0];
  v14 = +[NSString stringWithFormat:@"MSP%d_Channel%d_Die%d_Plane%d_Block%d_Page%@_Mode%d_Reason%@", v16, v7, v8, v9, v10, v11, v12, v13];

  if (v5 < v17) {

  }
  return v14;
}

- (void)_sweepBlock:(id *)a3
{
  uint64_t var10 = a3->var10;
  id v25 = objc_alloc_init((Class)NSMutableArray);
  if ((byte_1000C8888 & 1) == 0)
  {
    uint64_t v5 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
    unsigned __int8 v6 = [(NANDTelemetry_NandGBBSweepDaily *)self _createDirectoryAt:v5];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_1000468D0(v7, self);
      }
      [(NANDTelemetry_NandGBBSweepDaily *)self setSweepError:7];
    }
    byte_1000C8888 = 1;
  }
  if (dword_1000C88A8 < var10)
  {
    id v8 = 0;
    uint64_t v9 = 0;
    double v10 = 0.0;
    while (1)
    {
      uint64_t v11 = v9;
      if ([(NANDTelemetry_NandGBBSweepDaily *)self wasSigtermReceived]
        || v10 > 4.5 && [(NANDTelemetry_Base *)self tryDeferXpcActivity])
      {
        [(NANDTelemetry_NandGBBSweepDaily *)self setSweepError:8];
        goto LABEL_23;
      }
      uint64_t v12 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
      uint64_t v13 = +[NSString stringWithFormat:@"%@/Sweep_Wordline_%d.bin", v12, dword_1000C88A8];

      v14 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = dword_1000C88A8;
        id v16 = v13;
        unsigned int v17 = v14;
        id v18 = [v16 UTF8String];
        *(_DWORD *)buf = 67109378;
        int v27 = v15;
        __int16 v28 = 2080;
        id v29 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sweeping WL %d, into %s", buf, 0x12u);
      }
      uint64_t v9 = +[NSDate date];

      [(NANDTelemetry_NandGBBSweepDaily *)self ctl];
      [(NANDTelemetry_NandGBBSweepDaily *)self sweepBuf];
      [(NANDTelemetry_NandGBBSweepDaily *)self sweepBufSize];
      id v8 = v13;
      [v8 UTF8String];
      [(NANDTelemetry_NandGBBSweepDaily *)self setSweepError:Do_NVMeCTL_WL_Sweep()];
      v19 = +[NSDate date];
      [v19 timeIntervalSinceDate:v9];
      double v21 = v20;

      if ([(NANDTelemetry_NandGBBSweepDaily *)self sweepError]) {
        break;
      }
      int v22 = dword_1000C88A8;
      if (dword_1000C88A8 != dword_1000C888C && !(dword_1000C88A8 % 0x64u))
      {
        -[NANDTelemetry_NandGBBSweepDaily _compressRange:startWL:endWL:content:](self, "_compressRange:startWL:endWL:content:", var10);
        id v23 = [(NANDTelemetry_NandGBBSweepDaily *)self compressedPath];
        CompressFiles();

        int v22 = dword_1000C88A8;
        dword_1000C888C = dword_1000C88A8;
      }
      double v10 = v10 + v21;
      dword_1000C88A8 = v22 + 1;
      if (v22 + 1 >= var10) {
        goto LABEL_23;
      }
    }
    v24 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100046834(v24, self);
    }
LABEL_23:
  }
}

- (void)_checkTestHook
{
  if (os_variant_has_internal_content())
  {
    id v3 = [(NANDTelemetry_Base *)self stateMgr];
    id v4 = [v3 getValueForKey:@"gbb_test_mode"];

    if (v4)
    {
      if ([v4 isEqualToString:@"yes"]) {
        byte_1000C8890 = 1;
      }
    }
  }

  _objc_release_x1();
}

- (void)cleanUpForTelemetryDisable
{
}

- (void)runActivity
{
  unint64_t v38 = 0;
  id v35 = objc_alloc_init((Class)NSMutableArray);
  v36 = getDeviceSerialNumber();
  id v3 = &off_1000C8000;
  char v4 = byte_1000C8888;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  memset(v41, 0, sizeof(v41));
  [(NANDTelemetry_NandGBBSweepDaily *)self setWasSigtermReceived:0];
  uint64_t v5 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "GBB Activity Start.", buf, 2u);
  }
  signal(15, (void (__cdecl *)(int))1);
  unsigned __int8 v6 = dispatch_get_global_queue(21, 0);
  uint64_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v6);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000C56C;
  handler[3] = &unk_100090998;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate(v7);
  if ((byte_1000C8888 & 1) == 0)
  {
    [(NANDTelemetry_NandGBBSweepDaily *)self _checkTestHook];
    if ((byte_1000C8890 & 1) == 0) {
      [(NANDTelemetry_NandGBBSweepDaily *)self _cleanItemAt:@"/private/var/db/NANDTelemetryServices/GBBCollection"];
    }
    [(NANDTelemetry_NandGBBSweepDaily *)self _createDirectoryAt:@"/private/var/db/NANDTelemetryServices/GBBCollection"];
  }
  if (![(NANDTelemetry_NandGBBSweepDaily *)self _isGBBSweepEnabled])
  {
    v30 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "GBB Collection Disabled via boot-args", buf, 2u);
    }
    goto LABEL_41;
  }
  if ([(NANDTelemetry_NandGBBSweepDaily *)self wasSigtermReceived]
    || !sub_100039FB0(0, (uint64_t)v41))
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100046970();
    }
    goto LABEL_41;
  }
  uint64_t inited = Init_NVMeCTL();
  [(NANDTelemetry_NandGBBSweepDaily *)self setCtl:inited];
  if (!inited)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_1000469A4();
    }
    goto LABEL_41;
  }
  uint64_t v9 = malloc_type_valloc([(NANDTelemetry_NandGBBSweepDaily *)self sweepBufSize], 0xBF5D77B3uLL);
  [(NANDTelemetry_NandGBBSweepDaily *)self setSweepBuf:v9];
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_1000469D8();
    }
LABEL_41:
    unsigned int v17 = 0;
    int v22 = 0;
    double v10 = 0;
    goto LABEL_42;
  }
  double v10 = [(NANDTelemetry_NandGBBSweepDaily *)self getDefects:&v38];
  if (!v10 || v38 <= 3)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100046A0C();
    }
    goto LABEL_60;
  }
  [(NANDTelemetry_NandGBBSweepDaily *)self setSweepInfo:v10];
  unsigned int v11 = *(_DWORD *)[(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo];
  if (byte_1000C8888) {
    unsigned int v12 = dword_1000C88C8;
  }
  else {
    unsigned int v12 = 2;
  }
  if (v11 >= v12) {
    unsigned int v11 = v12;
  }
  dword_1000C88C8 = v11;
  [(NANDTelemetry_NandGBBSweepDaily *)self setCurrBlock:0];
  [(NANDTelemetry_NandGBBSweepDaily *)self setSweepError:0];
  uint64_t v13 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v40 = dword_1000C88C8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Sweeping %d bad blocks", buf, 8u);
  }
  if (!dword_1000C88C8)
  {
LABEL_60:
    unsigned int v17 = 0;
    int v22 = 0;
    goto LABEL_42;
  }
  v14 = 0;
  int v15 = 0;
  v34 = v6;
  while (1)
  {
    if ((v4 & 1) == 0)
    {
      [(NANDTelemetry_NandGBBSweepDaily *)self _fillSweepParams];
      id v16 = [(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo];
      dword_1000C88C4 = v16->var11[[(NANDTelemetry_NandGBBSweepDaily *)self currBlock]];
    }
    unsigned int v17 = [(NANDTelemetry_NandGBBSweepDaily *)self _getBlockStr:DWORD1(v42)];

    id v18 = +[NSString stringWithFormat:@"%@/%@", @"/private/var/db/NANDTelemetryServices/GBBCollection", v17];
    [(NANDTelemetry_NandGBBSweepDaily *)self setBlockPath:v18];

    v19 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
    double v20 = +[NSString stringWithFormat:@"%@/%@_%@.tar", v19, v17, v36];
    [(NANDTelemetry_NandGBBSweepDaily *)self setCompressedPath:v20];

    double v21 = [(NANDTelemetry_NandGBBSweepDaily *)self _getReasonString:dword_1000C88C0];
    int v22 = +[NSString stringWithFormat:@"[%@][New GBB Detected: %@][%@]", v36, v17, v21];

    if ((v4 & 1) == 0)
    {
      id v23 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
      unsigned __int8 v24 = [(NANDTelemetry_NandGBBSweepDaily *)self _createDirectoryAt:v23];

      if ((v24 & 1) == 0) {
        break;
      }
    }
    [(NANDTelemetry_NandGBBSweepDaily *)self _sweepBlock:v41];
    id v3 = &off_1000C8000;
    unsigned __int8 v6 = v34;
    if ([(NANDTelemetry_NandGBBSweepDaily *)self sweepError])
    {
      v32 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
      [(NANDTelemetry_NandGBBSweepDaily *)self _doCleanup:v32];

      goto LABEL_42;
    }
    [(NANDTelemetry_NandGBBSweepDaily *)self _gatherRadarInfo];
    [(NANDTelemetry_NandGBBSweepDaily *)self _compressRange:DWORD2(v42) startWL:dword_1000C888C endWL:DWORD2(v42) content:v35];
    id v25 = [(NANDTelemetry_NandGBBSweepDaily *)self compressedPath];
    CompressFiles();

    v26 = [(NANDTelemetry_NandGBBSweepDaily *)self compressedPath];
    [(NANDTelemetry_NandGBBSweepDaily *)self uploadFile:v26 description:v22];

    [(NANDTelemetry_NandGBBSweepDaily *)self markGBBAsSwept];
    --dword_1000C88C8;
    int v27 = [(NANDTelemetry_NandGBBSweepDaily *)self blockPath];
    [(NANDTelemetry_NandGBBSweepDaily *)self _doCleanup:v27];

    if (v4)
    {
      double v10 = [(NANDTelemetry_NandGBBSweepDaily *)self getDefects:&v38];
      if (!v10 || v38 <= 3)
      {
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
          sub_100046A40();
        }
        goto LABEL_42;
      }
      [(NANDTelemetry_NandGBBSweepDaily *)self setCurrBlock:0];
      [(NANDTelemetry_NandGBBSweepDaily *)self setSweepInfo:v10];
      unsigned int v28 = dword_1000C88C8;
      unsigned int v29 = *(_DWORD *)[(NANDTelemetry_NandGBBSweepDaily *)self sweepInfo];
      if (v28 < v29) {
        unsigned int v29 = v28;
      }
      dword_1000C88C8 = v29;
    }
    else
    {
      [(NANDTelemetry_NandGBBSweepDaily *)self setCurrBlock:[(NANDTelemetry_NandGBBSweepDaily *)self currBlock] + 1];
      unsigned int v29 = dword_1000C88C8;
    }
    char v4 = 0;
    v14 = v22;
    int v15 = v17;
    if (!v29) {
      goto LABEL_42;
    }
  }
  v33 = (void *)oslog;
  id v3 = &off_1000C8000;
  unsigned __int8 v6 = v34;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
    sub_1000468D0(v33, self);
  }
LABEL_42:
  v31 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "GBB Activity Exit.", buf, 2u);
  }
  if (((_BYTE)v3[273] & 1) == 0 && (byte_1000C8890 & 1) == 0) {
    [(NANDTelemetry_NandGBBSweepDaily *)self _cleanItemAt:@"/private/var/db/NANDTelemetryServices/GBBCollection"];
  }
  if ([(NANDTelemetry_NandGBBSweepDaily *)self ctl])
  {
    [(NANDTelemetry_NandGBBSweepDaily *)self ctl];
    Free_NVMeCTL();
    [(NANDTelemetry_NandGBBSweepDaily *)self setCtl:0];
  }
  if (v10) {
    free(v10);
  }
  if ([(NANDTelemetry_NandGBBSweepDaily *)self sweepBuf])
  {
    free([(NANDTelemetry_NandGBBSweepDaily *)self sweepBuf]);
    [(NANDTelemetry_NandGBBSweepDaily *)self setSweepBuf:0];
  }
}

- (int)uploadFile:(id)a3 description:(id)a4
{
  if (byte_1000C8890) {
    return 1;
  }
  ASPCarryLog_UploadFileToDP(a3, @"com.apple.nand.autoGBBCollection", @"AutomaticGBBSweep", a4, 0, @"tar");
  return 0;
}

- (void)getDefects:(unint64_t *)a3
{
  if ([(NANDTelemetry_NandGBBSweepDaily *)self wasSigtermReceived]) {
    return 0;
  }

  return sub_10003AEAC(269, a3);
}

- (void)markGBBAsSwept
{
  id v3 = (char *)malloc_type_valloc(0x50uLL, 0x6A1EC288uLL);
  if ([(NANDTelemetry_NandGBBSweepDaily *)self wasSigtermReceived] || !v3)
  {
    if (!v3) {
      return;
    }
  }
  else
  {
    *(_OWORD *)(v3 + 8) = xmmword_1000C8894;
    *((_DWORD *)v3 + 6) = dword_1000C88A4;
    [(NANDTelemetry_NandGBBSweepDaily *)self ctl];
    Send_ASF_Tunnel();
  }

  free(v3);
}

+ (void)setGBBXpcCritiria:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_HOUR);
}

+ (BOOL)shouldRegisterActivity
{
  int has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    if (os_variant_has_factory_content()) {
      LOBYTE(has_internal_content) = 0;
    }
    else {
      LOBYTE(has_internal_content) = os_variant_is_darwinos() ^ 1;
    }
  }
  return has_internal_content;
}

- (NSString)blockPath
{
  return self->_blockPath;
}

- (void)setBlockPath:(id)a3
{
}

- (NSString)compressedPath
{
  return self->_compressedPath;
}

- (void)setCompressedPath:(id)a3
{
}

- (void)ctl
{
  return self->_ctl;
}

- (void)setCtl:(void *)a3
{
  self->_ctl = a3;
}

- (void)sweepBuf
{
  return self->_sweepBuf;
}

- (void)setSweepBuf:(void *)a3
{
  self->_sweepBuf = a3;
}

- ($A820A8BF802304C85716FC6448E144CF)sweepInfo
{
  return self->_sweepInfo;
}

- (void)setSweepInfo:(id *)a3
{
  self->_sweepInfo = a3;
}

- (unint64_t)sweepBufSize
{
  return self->_sweepBufSize;
}

- (void)setSweepBufSize:(unint64_t)a3
{
  self->_sweepBufSize = a3;
}

- (int)sweepError
{
  return self->_sweepError;
}

- (void)setSweepError:(int)a3
{
  self->_sweepError = a3;
}

- (unsigned)currBlock
{
  return self->_currBlock;
}

- (void)setCurrBlock:(unsigned int)a3
{
  self->_currBlock = a3;
}

- (BOOL)wasSigtermReceived
{
  return self->_wasSigtermReceived;
}

- (void)setWasSigtermReceived:(BOOL)a3
{
  self->_wasSigtermReceived = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressedPath, 0);

  objc_storeStrong((id *)&self->_blockPath, 0);
}

@end
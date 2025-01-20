@interface ASPCarryLog_ExtractUpload
- (ASPCarryLog_ExtractUpload)initWithNandDriver:(id)a3 UploadDriver:(id)a4 StateManager:(id)a5 workDirectory:(id)a6 internalBuild:(BOOL)a7;
- (BOOL)_getDiskSpaceFlag;
- (BOOL)_internalCheckNextSpdExtract;
- (BOOL)_isIOLogFromHwLogger;
- (BOOL)_isLastExtractionTooLongAgo;
- (BOOL)_isPendingSpdHandling;
- (BOOL)_isXpcActivityDeferred;
- (BOOL)_tryDeferXpcActivity;
- (BOOL)isEnoughDiskSpace;
- (BOOL)isIOLogEnableNeeded;
- (BOOL)isInternalBuild;
- (BOOL)isPeriodicSpd;
- (CarryLog_NANDDriver)nandDriver;
- (CarryLog_UploadDriver)uploadDriver;
- (NSDate)nextSpdExtractTime;
- (NSDictionary)uploadInfo;
- (NSFileManager)fileManager;
- (NSString)convertedIologPath;
- (NSString)deviceId;
- (NSString)endTimeStr;
- (NSString)iologPath;
- (NSString)nandcounterPath;
- (NSString)nandstatsPath;
- (NSString)pendingUploadFile;
- (NSString)spdFilePath;
- (NSString)tarInProgressDir;
- (NSString)taskingId;
- (NSString)uploadInfoKey;
- (NSString)workDir;
- (StateMgr)stateMgr;
- (XpcActivityManager)xpcActivityMgr;
- (id)_checkAndCompressFiles;
- (id)_compressFilesForSpd:(BOOL)a3;
- (id)_getNextSpdExtractTime;
- (id)_getPendingUploadFile;
- (id)_getUploadContentPath;
- (id)_prepareContentsToUpload;
- (int)_checkAndConvertIOLog;
- (int)_checkAndExtractFiles;
- (int)_extractFiles;
- (int)_getNumB2BZipErrors;
- (int)_getSpdState;
- (int)_getStage;
- (int)_getUploadIdx;
- (int)_tryCreateWorkDirectories;
- (int)numB2BZipErrors;
- (int)spdState;
- (int)uploadIdx;
- (unint64_t)_getlastTotalUploadSize;
- (unint64_t)_iologLba_current;
- (unint64_t)_iologLba_prevSubmission;
- (unint64_t)lastTotalUploadSize;
- (unint64_t)uploadSizeLimit;
- (unsigned)_tryExtractSpdToNextState;
- (void)_checkAndHandleExcessiveCompressionErrors;
- (void)_cleanUpinProgressFiles;
- (void)_forceDeferXpcActivity;
- (void)_incrementCntForKey:(id)a3;
- (void)_internalSetNextSpdExtractionTime;
- (void)_iologLba_updateNewValue:(unint64_t)a3;
- (void)_jetSamStatsCollect_end;
- (void)_jetSamStatsCollect_start;
- (void)_removeConvertedIOLog;
- (void)_removeExtractedFiles;
- (void)_removePendingUploadFilePath;
- (void)_saveLastUploadFilePath:(id)a3;
- (void)_savePendingUploadFilePath:(id)a3;
- (void)_setStage:(int)a3;
- (void)_setUploadInfoWithSpdState:(unsigned int)a3;
- (void)_tryExtractUploadSpd;
- (void)_updateLastExtractTime;
- (void)_updateUploadInfoWithContentPath:(id)a3 contentSize:(unint64_t)a4;
- (void)setConvertedIologPath:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setEndTimeStr:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setIologPath:(id)a3;
- (void)setIsEnoughDiskSpace:(BOOL)a3;
- (void)setIsIOLogEnableNeeded:(BOOL)a3;
- (void)setIsInternalBuild:(BOOL)a3;
- (void)setIsPeriodicSpd:(BOOL)a3;
- (void)setLastTotalUploadSize:(unint64_t)a3;
- (void)setNandDriver:(id)a3;
- (void)setNandcounterPath:(id)a3;
- (void)setNandstatsPath:(id)a3;
- (void)setNextSpdExtractTime:(id)a3;
- (void)setNumB2BZipErrors:(int)a3;
- (void)setPendingUploadFile:(id)a3;
- (void)setSpdFilePath:(id)a3;
- (void)setSpdState:(int)a3;
- (void)setStateMgr:(id)a3;
- (void)setTarInProgressDir:(id)a3;
- (void)setTaskingId:(id)a3;
- (void)setUploadDriver:(id)a3;
- (void)setUploadIdx:(int)a3;
- (void)setUploadInfo:(id)a3;
- (void)setUploadInfoKey:(id)a3;
- (void)setUploadSizeLimit:(unint64_t)a3;
- (void)setWorkDir:(id)a3;
- (void)setXpcActivityMgr:(id)a3;
- (void)tryExtractUpload:(id)a3;
@end

@implementation ASPCarryLog_ExtractUpload

- (ASPCarryLog_ExtractUpload)initWithNandDriver:(id)a3 UploadDriver:(id)a4 StateManager:(id)a5 workDirectory:(id)a6 internalBuild:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v58.receiver = self;
  v58.super_class = (Class)ASPCarryLog_ExtractUpload;
  v17 = [(ASPCarryLog_ExtractUpload *)&v58 init];
  if (v17)
  {
    uint64_t v18 = +[NSFileManager defaultManager];
    fileManager = v17->_fileManager;
    v17->_fileManager = (NSFileManager *)v18;

    objc_storeStrong((id *)&v17->_nandDriver, a3);
    objc_storeStrong((id *)&v17->_uploadDriver, a4);
    objc_storeStrong((id *)&v17->_stateMgr, a5);
    objc_storeStrong((id *)&v17->_workDir, a6);
    uint64_t v20 = [(NSString *)v17->_workDir stringByAppendingPathComponent:@"iolog_spd.iolog"];
    spdFilePath = v17->_spdFilePath;
    v17->_spdFilePath = (NSString *)v20;

    uint64_t v22 = [(NSString *)v17->_workDir stringByAppendingPathComponent:@"tar_in_process"];
    tarInProgressDir = v17->_tarInProgressDir;
    v17->_tarInProgressDir = (NSString *)v22;

    uint64_t v24 = [(NSString *)v17->_workDir stringByAppendingPathComponent:@"iolog.iolog"];
    iologPath = v17->_iologPath;
    v17->_iologPath = (NSString *)v24;

    uint64_t v26 = [(NSString *)v17->_workDir stringByAppendingPathComponent:@"nandcounters.plist"];
    nandcounterPath = v17->_nandcounterPath;
    v17->_nandcounterPath = (NSString *)v26;

    uint64_t v28 = [(NSString *)v17->_workDir stringByAppendingPathComponent:@"nandstats.txt"];
    nandstatsPath = v17->_nandstatsPath;
    v17->_nandstatsPath = (NSString *)v28;

    uint64_t v30 = [(NSString *)v17->_workDir stringByAppendingPathComponent:@"iolog_converted.iolog"];
    convertedIologPath = v17->_convertedIologPath;
    v17->_convertedIologPath = (NSString *)v30;

    uint64_t v32 = [(ASPCarryLog_ExtractUpload *)v17 _getPendingUploadFile];
    pendingUploadFile = v17->_pendingUploadFile;
    v17->_pendingUploadFile = (NSString *)v32;

    v17->_isInternalBuild = a7;
    xpcActivityMgr = v17->_xpcActivityMgr;
    v17->_xpcActivityMgr = 0;

    v17->_isIOLogEnableNeeded = 0;
    v17->_isPeriodicSpd = 0;
    v35 = [(StateMgr *)v17->_stateMgr getValueForKey:@"current_tasking_info" expectedType:2];
    v36 = v35;
    if (!v35 || !validateCurTaskingInfo(v35)) {
      goto LABEL_9;
    }
    uint64_t v37 = [v36 objectForKeyedSubscript:@"id"];
    taskingId = v17->_taskingId;
    v17->_taskingId = (NSString *)v37;

    uint64_t v39 = [v36 objectForKeyedSubscript:@"device_id"];
    deviceId = v17->_deviceId;
    v17->_deviceId = (NSString *)v39;

    uint64_t v41 = [v36 objectForKeyedSubscript:@"endtime"];
    endTimeStr = v17->_endTimeStr;
    v17->_endTimeStr = (NSString *)v41;

    v43 = [v36 objectForKeyedSubscript:@"upload_size_limit_bytes"];
    v17->_uploadSizeLimit = (unint64_t)[v43 unsignedLongValue];

    uint64_t v44 = +[NSString stringWithFormat:@"%@_%@", @"aspcarry_uploadinfo", v17->_taskingId];
    uploadInfoKey = v17->_uploadInfoKey;
    v17->_uploadInfoKey = (NSString *)v44;

    v46 = [(ASPCarryLog_ExtractUpload *)v17 stateMgr];
    v47 = [(ASPCarryLog_ExtractUpload *)v17 uploadInfoKey];
    uint64_t v48 = [v46 getValueForKey:v47 expectedType:2];
    uploadInfo = v17->_uploadInfo;
    v17->_uploadInfo = (NSDictionary *)v48;

    v17->_spdState = [(ASPCarryLog_ExtractUpload *)v17 _getSpdState];
    v17->_uploadIdx = [(ASPCarryLog_ExtractUpload *)v17 _getUploadIdx];
    v17->_lastTotalUploadSize = [(ASPCarryLog_ExtractUpload *)v17 _getlastTotalUploadSize];
    if ([(ASPCarryLog_ExtractUpload *)v17 _getDiskSpaceFlag]) {
      BOOL v50 = !diskFreeSpaceBelowLimit(0x40000000uLL);
    }
    else {
      LOBYTE(v50) = 0;
    }
    v17->_isEnoughDiskSpace = v50;
    v17->_numB2BZipErrors = [(ASPCarryLog_ExtractUpload *)v17 _getNumB2BZipErrors];
    uint64_t v51 = [(ASPCarryLog_ExtractUpload *)v17 _getNextSpdExtractTime];
    nextSpdExtractTime = v17->_nextSpdExtractTime;
    v17->_nextSpdExtractTime = (NSDate *)v51;

    if (v17->_uploadIdx < 0 || v17->_lastTotalUploadSize == -1)
    {
LABEL_9:
      v53 = v17->_taskingId;
      v17->_taskingId = 0;

      v54 = v17->_deviceId;
      v17->_deviceId = 0;

      v17->_lastTotalUploadSize = -1;
      v17->_uploadSizeLimit = -1;
      v17->_isEnoughDiskSpace = 1;
      *(void *)&v17->_spdState = 0xFFFFFFFF00000000;
      v55 = v17->_nextSpdExtractTime;
      v17->_nextSpdExtractTime = 0;
    }
    v56 = v17;
  }
  return v17;
}

- (unint64_t)_iologLba_current
{
  v4 = [(ASPCarryLog_ExtractUpload *)self nandDriver];
  v5 = [v4 nandStats_get_hoursAgo:0];

  v6 = [v5 objectForKey:&off_1000B0550];
  id v7 = [v6 unsignedLongLongValue];

  return (unint64_t)v7;
}

- (unint64_t)_iologLba_prevSubmission
{
  v2 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  v3 = [v2 getValueForKey:@"iolog_lbas" expectedType:1];

  if (v3) {
    id v4 = [v3 unsignedLongLongValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (BOOL)_isLastExtractionTooLongAgo
{
  v2 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  v3 = [v2 getValueForKey:@"last_extract_time" expectedType:0];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (StringToDateTime(v3), (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    v6 = [v4 dateByAddingTimeInterval:86400.0];
    id v7 = +[NSDate date];
    BOOL v8 = [v6 compare:v7] == (id)-1;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)_updateLastExtractTime
{
  id v3 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  v2 = currentDateTimeStr();
  [v3 setValue:v2 forKey:@"last_extract_time"];
}

- (unint64_t)_getlastTotalUploadSize
{
  v2 = [(ASPCarryLog_ExtractUpload *)self uploadInfo];
  id v3 = [v2 objectForKeyedSubscript:@"total_upload_size"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = (unint64_t)[v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (int)_getUploadIdx
{
  v2 = [(ASPCarryLog_ExtractUpload *)self uploadInfo];
  id v3 = [v2 objectForKeyedSubscript:@"fileidx"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = -1;
  }

  return v4;
}

- (BOOL)_getDiskSpaceFlag
{
  v2 = [(ASPCarryLog_ExtractUpload *)self uploadInfo];
  id v3 = [v2 objectForKeyedSubscript:@"enough_disk_space"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)_getNextSpdExtractTime
{
  if ([(ASPCarryLog_ExtractUpload *)self isInternalBuild])
  {
    id v3 = [(ASPCarryLog_ExtractUpload *)self uploadInfo];
    unsigned __int8 v4 = [v3 objectForKeyedSubscript:@"next_spd_extraction_time"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = StringToDateTime(v4);
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isPendingSpdHandling
{
  return [(ASPCarryLog_ExtractUpload *)self spdState] != 0;
}

- (int)_getNumB2BZipErrors
{
  v2 = [(ASPCarryLog_ExtractUpload *)self uploadInfo];
  id v3 = [v2 objectForKeyedSubscript:@"num_b2b_zip_errors"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (void)_iologLba_updateNewValue:(unint64_t)a3
{
  id v5 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  int v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [v5 setValue:v4 forKey:@"iolog_lbas"];
}

- (id)_getPendingUploadFile
{
  id v3 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  int v4 = [v3 getValueForKey:@"extractupload_pendingfile" expectedType:0];

  if (v4)
  {
    id v5 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

    if ((v6 & 1) == 0)
    {

      [(ASPCarryLog_ExtractUpload *)self _removePendingUploadFilePath];
      int v4 = 0;
    }
  }

  return v4;
}

- (void)_setUploadInfoWithSpdState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)NSMutableDictionary);
  v18[0] = @"fileidx";
  unsigned __int8 v6 = +[NSNumber numberWithInt:[(ASPCarryLog_ExtractUpload *)self uploadIdx]];
  v19[0] = v6;
  v18[1] = @"total_upload_size";
  id v7 = +[NSNumber numberWithUnsignedLongLong:[(ASPCarryLog_ExtractUpload *)self lastTotalUploadSize]];
  v19[1] = v7;
  v18[2] = @"enough_disk_space";
  BOOL v8 = +[NSNumber numberWithBool:[(ASPCarryLog_ExtractUpload *)self isEnoughDiskSpace]];
  v19[2] = v8;
  v18[3] = @"num_b2b_zip_errors";
  v9 = +[NSNumber numberWithInt:[(ASPCarryLog_ExtractUpload *)self numB2BZipErrors]];
  v19[3] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  id v11 = [v5 initWithDictionary:v10];

  if (v3)
  {
    v12 = +[NSNumber numberWithUnsignedInt:v3];
    [v11 setObject:v12 forKeyedSubscript:@"spd_state"];
  }
  if ([(ASPCarryLog_ExtractUpload *)self isInternalBuild])
  {
    id v13 = [(ASPCarryLog_ExtractUpload *)self nextSpdExtractTime];

    if (v13)
    {
      id v14 = [(ASPCarryLog_ExtractUpload *)self nextSpdExtractTime];
      id v15 = DateTimeToStr(v14);
      [v11 setObject:v15 forKeyedSubscript:@"next_spd_extraction_time"];
    }
  }
  id v16 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  v17 = [(ASPCarryLog_ExtractUpload *)self uploadInfoKey];
  [v16 setValue:v11 forKey:v17];
}

- (void)_internalSetNextSpdExtractionTime
{
  id v3 = +[NSDate dateWithTimeIntervalSinceNow:1209600.0];
  [(ASPCarryLog_ExtractUpload *)self setNextSpdExtractTime:v3];
}

- (void)_updateUploadInfoWithContentPath:(id)a3 contentSize:(unint64_t)a4
{
  id v10 = a3;
  if (v10)
  {
    [(ASPCarryLog_ExtractUpload *)self setUploadIdx:[(ASPCarryLog_ExtractUpload *)self uploadIdx] + 1];
    [(ASPCarryLog_ExtractUpload *)self setLastTotalUploadSize:(char *)[(ASPCarryLog_ExtractUpload *)self lastTotalUploadSize] + a4];
    [(ASPCarryLog_ExtractUpload *)self _saveLastUploadFilePath:v10];
    [(ASPCarryLog_ExtractUpload *)self _setUploadInfoWithSpdState:0];
    unsigned __int8 v6 = [(ASPCarryLog_ExtractUpload *)self endTimeStr];

    if (v6)
    {
      id v7 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
      BOOL v8 = [(ASPCarryLog_ExtractUpload *)self taskingId];
      v9 = [(ASPCarryLog_ExtractUpload *)self endTimeStr];
      setTaskingInfoToLegacyUIDomain(v7, v8, v9, [(ASPCarryLog_ExtractUpload *)self lastTotalUploadSize], v10, [(ASPCarryLog_ExtractUpload *)self isInternalBuild]);
    }
  }
  else
  {
    [(ASPCarryLog_ExtractUpload *)self _setUploadInfoWithSpdState:0];
  }
}

- (void)_savePendingUploadFilePath:(id)a3
{
  id v4 = a3;
  id v5 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  [v5 setValue:v4 forKey:@"extractupload_pendingfile"];
}

- (void)_saveLastUploadFilePath:(id)a3
{
  id v4 = a3;
  id v5 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  [v5 setValue:v4 forKey:@"extractupload_lastupload"];
}

- (void)_removePendingUploadFilePath
{
  id v2 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  [v2 deleteKey:@"extractupload_pendingfile"];
}

- (int)_tryCreateWorkDirectories
{
  id v3 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  id v4 = [(ASPCarryLog_ExtractUpload *)self workDir];
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    BOOL v8 = [(ASPCarryLog_ExtractUpload *)self workDir];
    id v27 = 0;
    unsigned __int8 v9 = [v7 createDirectoryAtPath:v8 withIntermediateDirectories:0 attributes:0 error:&v27];
    id v6 = v27;

    if ((v9 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_1000459DC();
      }
      goto LABEL_12;
    }
  }
  id v10 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  NSFileAttributeKey v30 = NSFilePosixPermissions;
  v31 = &off_1000B0568;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  v12 = [(ASPCarryLog_ExtractUpload *)self workDir];
  id v26 = v6;
  [v10 setAttributes:v11 ofItemAtPath:v12 error:&v26];
  id v13 = v26;

  id v14 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  id v15 = [(ASPCarryLog_ExtractUpload *)self tarInProgressDir];
  LOBYTE(v11) = [v14 fileExistsAtPath:v15];

  if ((v11 & 1) == 0)
  {
    id v16 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    v17 = [(ASPCarryLog_ExtractUpload *)self tarInProgressDir];
    id v25 = v13;
    unsigned __int8 v18 = [v16 createDirectoryAtPath:v17 withIntermediateDirectories:0 attributes:0 error:&v25];
    id v6 = v25;

    if (v18)
    {
      id v13 = v6;
      goto LABEL_7;
    }
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_1000459A8();
    }
LABEL_12:
    int v20 = 0;
    goto LABEL_13;
  }
LABEL_7:
  v19 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  NSFileAttributeKey v28 = NSFilePosixPermissions;
  v29 = &off_1000B0568;
  int v20 = 1;
  v21 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  uint64_t v22 = [(ASPCarryLog_ExtractUpload *)self tarInProgressDir];
  id v24 = v13;
  [v19 setAttributes:v21 ofItemAtPath:v22 error:&v24];
  id v6 = v24;

LABEL_13:
  return v20;
}

- (void)_cleanUpinProgressFiles
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  id v4 = [(ASPCarryLog_ExtractUpload *)self tarInProgressDir];
  unsigned __int8 v5 = [v3 contentsOfDirectoryAtPath:v4 error:0];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      unsigned __int8 v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        uint64_t v11 = [(ASPCarryLog_ExtractUpload *)self fileManager];
        v12 = [(ASPCarryLog_ExtractUpload *)self tarInProgressDir];
        id v13 = [v12 stringByAppendingPathComponent:v10];
        [v11 removeItemAtPath:v13 error:0];

        unsigned __int8 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (int)_extractFiles
{
  id v3 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  id v4 = [(ASPCarryLog_ExtractUpload *)self nandcounterPath];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    id v7 = [(ASPCarryLog_ExtractUpload *)self nandcounterPath];
    [v6 removeItemAtPath:v7 error:0];
  }
  uint64_t v8 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  unsigned __int8 v9 = [(ASPCarryLog_ExtractUpload *)self nandstatsPath];
  unsigned int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    uint64_t v11 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    v12 = [(ASPCarryLog_ExtractUpload *)self nandstatsPath];
    [v11 removeItemAtPath:v12 error:0];
  }
  id v13 = [(ASPCarryLog_ExtractUpload *)self nandDriver];
  unsigned int v14 = [v13 iolog_disable];

  if (v14)
  {
    [(ASPCarryLog_ExtractUpload *)self setIsIOLogEnableNeeded:1];
    do
    {
      long long v15 = [(ASPCarryLog_ExtractUpload *)self nandDriver];
      long long v16 = [(ASPCarryLog_ExtractUpload *)self iologPath];
      unint64_t v17 = (unint64_t)[v15 iolog_export:v16 max_export_size:25165824];
    }
    while (v17 >> 23 >= 3 && ![(ASPCarryLog_ExtractUpload *)self _tryDeferXpcActivity]);
    if ([(ASPCarryLog_ExtractUpload *)self isIOLogEnableNeeded])
    {
      unsigned __int8 v18 = [(ASPCarryLog_ExtractUpload *)self nandDriver];
      [v18 iolog_enable];
    }
  }
  else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
  {
    sub_100045A78();
  }
  if ([(ASPCarryLog_ExtractUpload *)self _isXpcActivityDeferred]) {
    return 0;
  }
  int v20 = [(ASPCarryLog_ExtractUpload *)self nandDriver];
  v21 = [(ASPCarryLog_ExtractUpload *)self nandcounterPath];
  unsigned int v22 = [v20 nandCounters_save:v21];

  if (!v22)
  {
    int result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100045A10();
    return 0;
  }
  if (![(ASPCarryLog_ExtractUpload *)self isInternalBuild]) {
    return 1;
  }
  v23 = [(ASPCarryLog_ExtractUpload *)self nandDriver];
  id v24 = [(ASPCarryLog_ExtractUpload *)self nandstatsPath];
  unsigned int v25 = [v23 nandStats_save:v24];

  if (v25) {
    return 1;
  }
  int result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100045A44();
    return 0;
  }
  return result;
}

- (int)_checkAndExtractFiles
{
  unint64_t v3 = [(ASPCarryLog_ExtractUpload *)self _iologLba_current];
  unint64_t v4 = [(ASPCarryLog_ExtractUpload *)self _iologLba_prevSubmission];
  if (v3 > v4 && (v3 - v4) >> 13
    || (int result = [(ASPCarryLog_ExtractUpload *)self _isLastExtractionTooLongAgo]) != 0)
  {
    [(ASPCarryLog_ExtractUpload *)self _setStage:1];
    int result = [(ASPCarryLog_ExtractUpload *)self _extractFiles];
    if (result)
    {
      if ([(ASPCarryLog_ExtractUpload *)self _isXpcActivityDeferred])
      {
        return 0;
      }
      else
      {
        [(ASPCarryLog_ExtractUpload *)self _iologLba_updateNewValue:v3];
        [(ASPCarryLog_ExtractUpload *)self _updateLastExtractTime];
        return 1;
      }
    }
  }
  return result;
}

- (void)_removeExtractedFiles
{
  unint64_t v3 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  unint64_t v4 = [(ASPCarryLog_ExtractUpload *)self iologPath];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    id v7 = [(ASPCarryLog_ExtractUpload *)self iologPath];
    [v6 removeItemAtPath:v7 error:0];
  }
  uint64_t v8 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  unsigned __int8 v9 = [(ASPCarryLog_ExtractUpload *)self nandcounterPath];
  unsigned int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    uint64_t v11 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    v12 = [(ASPCarryLog_ExtractUpload *)self nandcounterPath];
    [v11 removeItemAtPath:v12 error:0];
  }
  id v13 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  unsigned int v14 = [(ASPCarryLog_ExtractUpload *)self nandstatsPath];
  unsigned int v15 = [v13 fileExistsAtPath:v14];

  if (v15)
  {
    long long v16 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    unint64_t v17 = [(ASPCarryLog_ExtractUpload *)self nandstatsPath];
    [v16 removeItemAtPath:v17 error:0];
  }
  unsigned __int8 v18 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  v19 = [(ASPCarryLog_ExtractUpload *)self spdFilePath];
  unsigned int v20 = [v18 fileExistsAtPath:v19];

  if (v20)
  {
    v21 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    unsigned int v22 = [(ASPCarryLog_ExtractUpload *)self spdFilePath];
    [v21 removeItemAtPath:v22 error:0];
  }

  [(ASPCarryLog_ExtractUpload *)self _removeConvertedIOLog];
}

- (void)_removeConvertedIOLog
{
  unint64_t v3 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  unint64_t v4 = [(ASPCarryLog_ExtractUpload *)self convertedIologPath];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v7 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    id v6 = [(ASPCarryLog_ExtractUpload *)self convertedIologPath];
    [v7 removeItemAtPath:v6 error:0];
  }
}

- (int)_checkAndConvertIOLog
{
  [(ASPCarryLog_ExtractUpload *)self _setStage:2];
  if ([(ASPCarryLog_ExtractUpload *)self _tryDeferXpcActivity]) {
    return 0;
  }
  [(ASPCarryLog_ExtractUpload *)self _removeConvertedIOLog];
  unsigned int v4 = [(ASPCarryLog_ExtractUpload *)self _isIOLogFromHwLogger];
  gIsIOLogFromHwLogger = v4;
  if (!v4) {
    return 1;
  }
  id v5 = [(ASPCarryLog_ExtractUpload *)self iologPath];
  id v6 = fopen((const char *)[v5 UTF8String], "r");

  id v7 = [(ASPCarryLog_ExtractUpload *)self convertedIologPath];
  uint64_t v8 = fopen((const char *)[v7 UTF8String], "w");

  if (v6 && v8)
  {
    int v9 = iolog_hwlogger_to_legacy_format_conversion(v8, v6, 1);
LABEL_9:
    fclose(v6);
    int v3 = v9;
    goto LABEL_10;
  }
  int v9 = 0;
  int v3 = 0;
  if (v6) {
    goto LABEL_9;
  }
LABEL_10:
  if (v8) {
    fclose(v8);
  }
  if (!v3)
  {
    [(ASPCarryLog_ExtractUpload *)self _removeExtractedFiles];
    [(ASPCarryLog_ExtractUpload *)self _setStage:0];
  }
  return v3;
}

- (id)_compressFilesForSpd:(BOOL)a3
{
  BOOL v3 = a3;
  if (gIsIOLogFromHwLogger) {
    [(ASPCarryLog_ExtractUpload *)self convertedIologPath];
  }
  else {
  v40 = [(ASPCarryLog_ExtractUpload *)self iologPath];
  }
  uint64_t v41 = [(ASPCarryLog_ExtractUpload *)self spdFilePath];
  id v5 = [(ASPCarryLog_ExtractUpload *)self tarInProgressDir];
  uint64_t v6 = currentDateTimeStr();
  id v7 = (void *)v6;
  if (v3)
  {
    id v43 = +[NSString stringWithFormat:@"%@/iologSpd_%@.tar", v5, v6];

    id v42 = [objc_alloc((Class)NSMutableArray) initWithObjects:v41, 0];
  }
  else
  {
    id v43 = +[NSString stringWithFormat:@"%@/iolog_%@_%d.tar", v5, v6, [(ASPCarryLog_ExtractUpload *)self uploadIdx]];

    id v8 = objc_alloc((Class)NSMutableArray);
    int v9 = [(ASPCarryLog_ExtractUpload *)self nandcounterPath];
    id v42 = [v8 initWithObjects:v40, v9];

    if ([(ASPCarryLog_ExtractUpload *)self isInternalBuild])
    {
      unsigned int v10 = [(ASPCarryLog_ExtractUpload *)self fileManager];
      uint64_t v11 = [(ASPCarryLog_ExtractUpload *)self nandstatsPath];
      unsigned int v12 = [v10 fileExistsAtPath:v11];

      if (v12)
      {
        id v13 = [(ASPCarryLog_ExtractUpload *)self nandstatsPath];
        [v42 addObject:v13];
      }
    }
  }
  memset(&v50, 0, sizeof(v50));
  [(ASPCarryLog_ExtractUpload *)self _cleanUpinProgressFiles];
  uint64_t v39 = +[NSFileManager defaultManager];
  archive_write_new();
  if (archive_write_add_filter_gzip()
    || archive_write_set_options()
    || archive_write_set_format_pax())
  {
    CFStringRef v37 = @"SetZipError";
    goto LABEL_51;
  }
  [v43 fileSystemRepresentation];
  if (archive_write_open_filename())
  {
    CFStringRef v37 = @"OpenDestFileError";
LABEL_51:
    id v38 = +[NSException exceptionWithName:v37 reason:0 userInfo:0];
    objc_exception_throw(v38);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v42;
  id v14 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (!v14) {
    goto LABEL_35;
  }
  id v15 = 0;
  uint64_t v45 = *(void *)v47;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v47 != v45) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(id *)(*((void *)&v46 + 1) + 8 * i);

      id v18 = v17;
      if (stat((const char *)[v18 fileSystemRepresentation], &v50))
      {
        id v36 = +[NSException exceptionWithName:@"InputFileStatError" reason:0 userInfo:0];
        objc_exception_throw(v36);
      }
      archive_entry_new();
      archive_entry_copy_stat();
      id v19 = [v18 lastPathComponent];
      [v19 UTF8String];
      archive_entry_set_pathname();

      archive_entry_set_filetype();
      archive_entry_set_perm();
      if (archive_write_header())
      {
        id v35 = +[NSException exceptionWithName:@"ArchiveWriteHeaderError" reason:0 userInfo:0];
        objc_exception_throw(v35);
      }
      id v15 = v18;
      int v20 = open((const char *)[v15 fileSystemRepresentation], 0);
      int v21 = v20;
      if (v20 < 0)
      {
        CFStringRef v33 = @"InpputFileError";
LABEL_45:
        id v34 = +[NSException exceptionWithName:v33 reason:0 userInfo:0];
        objc_exception_throw(v34);
      }
      int v22 = read(v20, v53, 0x2000uLL);
      int v23 = 0x4000000;
      while (1)
      {
        if (v22 < 1) {
          goto LABEL_31;
        }
        if (v22 != archive_write_data())
        {
          CFStringRef v33 = @"ArchiveWriteError";
          goto LABEL_45;
        }
        BOOL v24 = __OFSUB__(v23, v22);
        v23 -= v22;
        if ((v23 < 0) ^ v24 | (v23 == 0)) {
          break;
        }
LABEL_28:
        int v22 = read(v21, v53, 0x2000uLL);
      }
      if (![(ASPCarryLog_ExtractUpload *)self _tryDeferXpcActivity])
      {
        int v23 = 0x4000000;
        goto LABEL_28;
      }
      unsigned int v25 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Asked to defer activity during compression. Aborting...\n", buf, 2u);
      }
LABEL_31:
      close(v21);
      archive_entry_free();
      if ([(ASPCarryLog_ExtractUpload *)self _isXpcActivityDeferred]) {
        goto LABEL_36;
      }
    }
    id v14 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  }
  while (v14);

LABEL_35:
  id v15 = 0;
LABEL_36:

  unsigned int v26 = ![(ASPCarryLog_ExtractUpload *)self _isXpcActivityDeferred];
  archive_write_close();
  unsigned int v27 = v26;
  archive_write_free();
  if ((v26 & 1) == 0)
  {
    NSFileAttributeKey v28 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    unsigned int v29 = [v28 fileExistsAtPath:v43];

    if (v29) {
      [v39 removeItemAtPath:v43 error:0];
    }
  }
  NSFileAttributeKey v30 = v43;
  if (!v27) {
    NSFileAttributeKey v30 = 0;
  }
  id v31 = v30;

  return v31;
}

- (id)_checkAndCompressFiles
{
  [(ASPCarryLog_ExtractUpload *)self _setStage:3];
  if ([(ASPCarryLog_ExtractUpload *)self _tryDeferXpcActivity])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(ASPCarryLog_ExtractUpload *)self _compressFilesForSpd:0];
    if ([(ASPCarryLog_ExtractUpload *)self _isXpcActivityDeferred])
    {
      unsigned int v4 = 0;
      goto LABEL_12;
    }
    if (!v3
      || ([(ASPCarryLog_ExtractUpload *)self fileManager],
          id v5 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v6 = [v5 fileExistsAtPath:v3],
          v5,
          (v6 & 1) == 0))
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_100045AAC();
      }
      [(ASPCarryLog_ExtractUpload *)self _checkAndHandleExcessiveCompressionErrors];

      id v3 = 0;
    }
    [(ASPCarryLog_ExtractUpload *)self _setStage:0];
  }
  id v3 = v3;
  unsigned int v4 = v3;
LABEL_12:

  return v4;
}

- (void)_checkAndHandleExcessiveCompressionErrors
{
  [(ASPCarryLog_ExtractUpload *)self setNumB2BZipErrors:[(ASPCarryLog_ExtractUpload *)self numB2BZipErrors] + 1];
  if ([(ASPCarryLog_ExtractUpload *)self numB2BZipErrors] >= 4)
  {
    [(ASPCarryLog_ExtractUpload *)self _removeExtractedFiles];
    [(ASPCarryLog_ExtractUpload *)self setNumB2BZipErrors:0];
  }

  [(ASPCarryLog_ExtractUpload *)self _setUploadInfoWithSpdState:0];
}

- (id)_prepareContentsToUpload
{
  id v3 = [(ASPCarryLog_ExtractUpload *)self pendingUploadFile];

  if (v3)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100045AE0();
    }
    goto LABEL_4;
  }
  if (![(ASPCarryLog_ExtractUpload *)self _tryCreateWorkDirectories]
    || [(ASPCarryLog_ExtractUpload *)self _getStage] <= 1
    && ![(ASPCarryLog_ExtractUpload *)self _checkAndExtractFiles]
    || [(ASPCarryLog_ExtractUpload *)self _getStage] <= 2
    && ![(ASPCarryLog_ExtractUpload *)self _checkAndConvertIOLog])
  {
LABEL_4:
    unsigned int v4 = 0;
    goto LABEL_5;
  }
  unsigned int v4 = [(ASPCarryLog_ExtractUpload *)self _checkAndCompressFiles];
LABEL_5:

  return v4;
}

- (id)_getUploadContentPath
{
  id v3 = [(ASPCarryLog_ExtractUpload *)self pendingUploadFile];

  if (v3)
  {
    unsigned int v4 = [(ASPCarryLog_ExtractUpload *)self pendingUploadFile];
    id v5 = 0;
    goto LABEL_9;
  }
  id v5 = [(ASPCarryLog_ExtractUpload *)self _prepareContentsToUpload];
  if (![(ASPCarryLog_ExtractUpload *)self _isXpcActivityDeferred] && v5)
  {
    unsigned __int8 v6 = [(ASPCarryLog_ExtractUpload *)self workDir];
    id v7 = [v5 lastPathComponent];
    unsigned int v4 = [v6 stringByAppendingPathComponent:v7];

    [(ASPCarryLog_ExtractUpload *)self _savePendingUploadFilePath:v4];
    id v8 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    [v8 moveItemAtPath:v5 toPath:v4 error:0];

    int v9 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    LODWORD(v7) = [v9 fileExistsAtPath:v4];

    if (v7)
    {
      [(ASPCarryLog_ExtractUpload *)self _removeExtractedFiles];
      goto LABEL_9;
    }
  }
  unsigned int v4 = 0;
LABEL_9:

  return v4;
}

- (void)tryExtractUpload:(id)a3
{
  id v4 = a3;
  [(ASPCarryLog_ExtractUpload *)self _jetSamStatsCollect_start];
  [(ASPCarryLog_ExtractUpload *)self setXpcActivityMgr:v4];
  uint64_t v6 = [(ASPCarryLog_ExtractUpload *)self taskingId];
  if (v6
    && (id v7 = (void *)v6,
        [(ASPCarryLog_ExtractUpload *)self deviceId],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    if ([(ASPCarryLog_ExtractUpload *)self _isPendingSpdHandling])
    {
      [(ASPCarryLog_ExtractUpload *)self _tryExtractUploadSpd];
    }
    else if ([(ASPCarryLog_ExtractUpload *)self _tryDeferXpcActivity])
    {
      unsigned int v12 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Deferring before IOLog extraction", (uint8_t *)&v34, 2u);
      }
    }
    else if ([(ASPCarryLog_ExtractUpload *)self isInternalBuild] {
           || [(ASPCarryLog_ExtractUpload *)self isEnoughDiskSpace])
    }
    {
      unint64_t v13 = [(ASPCarryLog_ExtractUpload *)self lastTotalUploadSize];
      if (v13 >= [(ASPCarryLog_ExtractUpload *)self uploadSizeLimit])
      {
        unsigned int v25 = (void *)oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v26 = v25;
          unint64_t v27 = [(ASPCarryLog_ExtractUpload *)self lastTotalUploadSize];
          unint64_t v28 = [(ASPCarryLog_ExtractUpload *)self uploadSizeLimit];
          id v29 = [(ASPCarryLog_ExtractUpload *)self taskingId];
          int v34 = 134218498;
          id v35 = (id)v27;
          __int16 v36 = 2048;
          unint64_t v37 = v28;
          __int16 v38 = 2080;
          id v39 = [v29 UTF8String];
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Total upload size bytes %llu exceeding limit %llu, for tasking %s", (uint8_t *)&v34, 0x20u);
        }
      }
      else
      {
        id v14 = [(ASPCarryLog_ExtractUpload *)self _getUploadContentPath];
        if (v14)
        {
          id v15 = [(ASPCarryLog_ExtractUpload *)self fileManager];
          long long v16 = [v15 attributesOfItemAtPath:v14 error:0];
          id v17 = [v16 fileSize];

          id v18 = [(ASPCarryLog_ExtractUpload *)self uploadDriver];
          id v19 = [(ASPCarryLog_ExtractUpload *)self taskingId];
          int v20 = [(ASPCarryLog_ExtractUpload *)self deviceId];
          unsigned int v21 = [v18 uploadFile:v14 TaskingId:v19 DeviceId:v20 LogType:@"com.apple.nand.iolog"];

          int v22 = (void *)oslog;
          if (v21)
          {
            if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
            {
              id v23 = v14;
              BOOL v24 = v22;
              int v34 = 136315138;
              id v35 = [v23 UTF8String];
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Content %s passed to uploader.\n", (uint8_t *)&v34, 0xCu);
            }
          }
          else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
          {
            sub_100045B48();
          }
          [(ASPCarryLog_ExtractUpload *)self _removePendingUploadFilePath];
          [(ASPCarryLog_ExtractUpload *)self _updateUploadInfoWithContentPath:v14 contentSize:v17];
          unint64_t v32 = [(ASPCarryLog_ExtractUpload *)self lastTotalUploadSize];
          if (v32 >= [(ASPCarryLog_ExtractUpload *)self uploadSizeLimit])
          {
            CFStringRef v33 = [(ASPCarryLog_ExtractUpload *)self nandDriver];
            [v33 iolog_disable];
          }
          else if ([(ASPCarryLog_ExtractUpload *)self _internalCheckNextSpdExtract])
          {
            [(ASPCarryLog_ExtractUpload *)self _tryExtractUploadSpd];
          }
        }
        else
        {
          id v31 = oslog;
          if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v34) = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "No upload.\n", (uint8_t *)&v34, 2u);
          }
        }
      }
    }
    else
    {
      NSFileAttributeKey v30 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Low disk space, do not perform extract upload.", (uint8_t *)&v34, 2u);
      }
      if ([(ASPCarryLog_ExtractUpload *)self _getDiskSpaceFlag]) {
        [(ASPCarryLog_ExtractUpload *)self _updateUploadInfoWithContentPath:0 contentSize:0];
      }
    }
  }
  else
  {
    [(ASPCarryLog_ExtractUpload *)self _cleanUpinProgressFiles];
    [(ASPCarryLog_ExtractUpload *)self _removeExtractedFiles];
    int v9 = [(ASPCarryLog_ExtractUpload *)self pendingUploadFile];

    if (v9)
    {
      unsigned int v10 = [(ASPCarryLog_ExtractUpload *)self fileManager];
      uint64_t v11 = [(ASPCarryLog_ExtractUpload *)self pendingUploadFile];
      [v10 removeItemAtPath:v11 error:0];
    }
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100045B14();
    }
  }
  [(ASPCarryLog_ExtractUpload *)self _jetSamStatsCollect_end];
}

- (void)_jetSamStatsCollect_start
{
  id v3 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  id v4 = [v3 getValueForKey:@"extractupload_running" expectedType:0];

  if (v4) {
    [(ASPCarryLog_ExtractUpload *)self _incrementCntForKey:@"extractupload_jetsam_count"];
  }
  id v5 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  [v5 setValue:@"YES" forKey:@"extractupload_running"];
}

- (void)_jetSamStatsCollect_end
{
  id v2 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  [v2 deleteKey:@"extractupload_running"];
}

- (void)_incrementCntForKey:(id)a3
{
  id v8 = a3;
  id v4 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  id v5 = [v4 getValueForKey:v8 expectedType:1];

  if (v5)
  {
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 intValue] + 1);
    uint64_t v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = &off_1000B0580;
  }
  id v7 = [(ASPCarryLog_ExtractUpload *)self stateMgr];
  [v7 setValue:v6 forKey:v8];
}

- (BOOL)_tryDeferXpcActivity
{
  id v3 = [(ASPCarryLog_ExtractUpload *)self xpcActivityMgr];

  if (v3)
  {
    id v3 = [(ASPCarryLog_ExtractUpload *)self xpcActivityMgr];
    unsigned __int8 v4 = [v3 isXpcActivityDeferred];

    id v5 = [(ASPCarryLog_ExtractUpload *)self xpcActivityMgr];
    LODWORD(v3) = [v5 tryDeferXpcActivity];

    if ((v4 & 1) == 0)
    {
      if (v3)
      {
        [(ASPCarryLog_ExtractUpload *)self _incrementCntForKey:@"extractupload_defer_count"];
        if ([(ASPCarryLog_ExtractUpload *)self isIOLogEnableNeeded])
        {
          uint64_t v6 = [(ASPCarryLog_ExtractUpload *)self nandDriver];
          unsigned int v7 = [v6 iolog_enable];

          if (v7) {
            [(ASPCarryLog_ExtractUpload *)self setIsIOLogEnableNeeded:0];
          }
        }
      }
    }
  }
  return (char)v3;
}

- (BOOL)_isXpcActivityDeferred
{
  id v3 = [(ASPCarryLog_ExtractUpload *)self xpcActivityMgr];
  if (v3)
  {
    unsigned __int8 v4 = [(ASPCarryLog_ExtractUpload *)self xpcActivityMgr];
    unsigned __int8 v5 = [v4 isXpcActivityDeferred];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)_setStage:(int)a3
{
  gCurrentExtractUploadStage = a3;
}

- (int)_getStage
{
  return gCurrentExtractUploadStage;
}

- (BOOL)_isIOLogFromHwLogger
{
  id v3 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  unsigned __int8 v4 = [(ASPCarryLog_ExtractUpload *)self iologPath];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (!v5) {
    return 0;
  }
  id v6 = [(ASPCarryLog_ExtractUpload *)self iologPath];
  unsigned int v7 = fopen((const char *)[v6 UTF8String], "r");

  if (!v7) {
    return 0;
  }
  BOOL v8 = iolog_is_from_hwlogger(v7);
  fclose(v7);
  return v8;
}

- (void)_forceDeferXpcActivity
{
  id v2 = [(ASPCarryLog_ExtractUpload *)self xpcActivityMgr];
  [v2 forceDeferXpcActivity];
}

- (int)_getSpdState
{
  id v2 = [(ASPCarryLog_ExtractUpload *)self uploadInfo];
  id v3 = [v2 objectForKeyedSubscript:@"spd_state"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v4 = [v3 unsignedIntValue];
    if (v4 <= 2) {
      int v5 = v4;
    }
    else {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (BOOL)_internalCheckNextSpdExtract
{
  if (![(ASPCarryLog_ExtractUpload *)self isInternalBuild]) {
    return 0;
  }
  uint64_t v3 = [(ASPCarryLog_ExtractUpload *)self nextSpdExtractTime];
  if (!v3) {
    goto LABEL_4;
  }
  unsigned int v4 = (void *)v3;
  int v5 = +[NSDate now];
  id v6 = [(ASPCarryLog_ExtractUpload *)self nextSpdExtractTime];
  id v7 = [v5 compare:v6];

  if (v7 != (id)1) {
    return 0;
  }
LABEL_4:
  BOOL v8 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Time to periodically extract SPD for internal build.", v11, 2u);
  }
  BOOL v9 = 1;
  [(ASPCarryLog_ExtractUpload *)self setSpdState:1];
  [(ASPCarryLog_ExtractUpload *)self setIsPeriodicSpd:1];
  return v9;
}

- (void)_tryExtractUploadSpd
{
  uint64_t v3 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Extract and upload SPD start.", buf, 2u);
  }
  if (![(ASPCarryLog_ExtractUpload *)self spdState]
    || [(ASPCarryLog_ExtractUpload *)self spdState] >= 3)
  {
    unsigned int v4 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100045B7C(v4, self);
    }
    [(ASPCarryLog_ExtractUpload *)self setSpdState:0];
  }
  if (![(ASPCarryLog_ExtractUpload *)self _tryCreateWorkDirectories]) {
    [(ASPCarryLog_ExtractUpload *)self setSpdState:0];
  }
  if ([(ASPCarryLog_ExtractUpload *)self spdState] == 1) {
    [(ASPCarryLog_ExtractUpload *)self setSpdState:[(ASPCarryLog_ExtractUpload *)self _tryExtractSpdToNextState]];
  }
  if ([(ASPCarryLog_ExtractUpload *)self spdState] == 2)
  {
    if ([(ASPCarryLog_ExtractUpload *)self isPeriodicSpd])
    {
      int v5 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "End this run after periodic spd extraction. Wait for next activity trigger to upload", v15, 2u);
      }
      goto LABEL_25;
    }
    if ([(ASPCarryLog_ExtractUpload *)self _tryDeferXpcActivity])
    {
LABEL_25:
      id v6 = 0;
      goto LABEL_26;
    }
    id v6 = [(ASPCarryLog_ExtractUpload *)self _compressFilesForSpd:1];
    if (v6)
    {
      BOOL v9 = [(ASPCarryLog_ExtractUpload *)self fileManager];
      unsigned int v10 = [v9 attributesOfItemAtPath:v6 error:0];
      -[ASPCarryLog_ExtractUpload setLastTotalUploadSize:](self, "setLastTotalUploadSize:", [v10 fileSize]);

      uint64_t v11 = [(ASPCarryLog_ExtractUpload *)self uploadDriver];
      unsigned int v12 = [(ASPCarryLog_ExtractUpload *)self taskingId];
      unint64_t v13 = [(ASPCarryLog_ExtractUpload *)self deviceId];
      [v11 uploadFile:v6 TaskingId:v12 DeviceId:v13 LogType:@"com.apple.nand.iolog.spd"];

      [(ASPCarryLog_ExtractUpload *)self _removeExtractedFiles];
      [(ASPCarryLog_ExtractUpload *)self setSpdState:0];
    }
  }
  else
  {
    id v6 = 0;
  }
  if (![(ASPCarryLog_ExtractUpload *)self spdState])
  {
    if ([(ASPCarryLog_ExtractUpload *)self isInternalBuild])
    {
      id v7 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting next SPD extraction time", v14, 2u);
      }
      [(ASPCarryLog_ExtractUpload *)self _internalSetNextSpdExtractionTime];
    }
    [(ASPCarryLog_ExtractUpload *)self _setUploadInfoWithSpdState:0];
    if ([(ASPCarryLog_ExtractUpload *)self uploadIdx] <= 0)
    {
      BOOL v8 = [(ASPCarryLog_ExtractUpload *)self nandDriver];
      [v8 iolog_enable];
    }
  }
LABEL_26:
}

- (unsigned)_tryExtractSpdToNextState
{
  char v27 = 0;
  uint64_t v25 = 0;
  size_t __size = 0;
  unsigned int v24 = 0;
  uint64_t v3 = [(ASPCarryLog_ExtractUpload *)self nandDriver];
  id v4 = [v3 getSpdHdrWithSize:&__size gcIdle:&v27 totalLbaCnt:&v25 estSpdSize:&v24];

  if (!v4 || !__size || !v25)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100045C4C();
    }
    size_t __size = 0;
    if (!v4) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (!v27)
  {
    [(ASPCarryLog_ExtractUpload *)self _forceDeferXpcActivity];
    free(v4);
    return 1;
  }
  id v5 = [(ASPCarryLog_ExtractUpload *)self spdFilePath];
  id v6 = fopen((const char *)[v5 UTF8String], "w");

  if (!v6)
  {
    unsigned int v12 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100045C80(v12, self);
    }
LABEL_17:
    free(v4);
LABEL_18:
    unsigned int v11 = 0;
    int v8 = 0;
    goto LABEL_19;
  }
  id v7 = oslog;
  if (v24 < 0xC800001)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Start extracting full SPD data", v23, 2u);
    }
    id v18 = [(ASPCarryLog_ExtractUpload *)self nandDriver];
    unsigned int v19 = [v18 writeFullSpdToFileWithHdrBuf:v4 hdrSize:__size totalLbaCnt:v25 filePtr:v6 spdSizeLimit:209715200];

    int v20 = oslog;
    if (v19)
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v23 = 0;
        unsigned int v11 = 2;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SPD data successfully written to file.", v23, 2u);
        char v10 = 0;
      }
      else
      {
        char v10 = 0;
        unsigned int v11 = 2;
      }
      int v8 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_100045DBC();
      }
      int v8 = 0;
      unsigned int v11 = 0;
      char v10 = 1;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100045D30((int *)&v24, v7);
    }
    int v8 = 1;
    fwrite(v4, __size, 1uLL, v6);
    BOOL v9 = [(ASPCarryLog_ExtractUpload *)self nandDriver];
    [v9 addSpdEstSizeExceedLimitToFile:v6 limit:209715200];

    char v10 = 0;
    unsigned int v11 = 2;
  }
  free(v4);
  fclose(v6);
  if ((v10 & 1) == 0)
  {
LABEL_36:
    if ((v8 & 1) == 0) {
      return v11;
    }
    goto LABEL_37;
  }
LABEL_19:
  unint64_t v13 = [(ASPCarryLog_ExtractUpload *)self fileManager];
  id v14 = [(ASPCarryLog_ExtractUpload *)self spdFilePath];
  unsigned int v15 = [v13 fileExistsAtPath:v14];

  if (v15)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100045C18();
    }
    long long v16 = [(ASPCarryLog_ExtractUpload *)self fileManager];
    id v17 = [(ASPCarryLog_ExtractUpload *)self spdFilePath];
    [v16 removeItemAtPath:v17 error:0];

    goto LABEL_36;
  }
  if (!v8) {
    return v11;
  }
LABEL_37:
  unsigned int v21 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SPD extraction done. Saving state...", v23, 2u);
  }
  [(ASPCarryLog_ExtractUpload *)self _setUploadInfoWithSpdState:2];
  return v11;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (CarryLog_NANDDriver)nandDriver
{
  return self->_nandDriver;
}

- (void)setNandDriver:(id)a3
{
}

- (CarryLog_UploadDriver)uploadDriver
{
  return self->_uploadDriver;
}

- (void)setUploadDriver:(id)a3
{
}

- (StateMgr)stateMgr
{
  return self->_stateMgr;
}

- (void)setStateMgr:(id)a3
{
}

- (NSString)workDir
{
  return self->_workDir;
}

- (void)setWorkDir:(id)a3
{
}

- (NSString)taskingId
{
  return self->_taskingId;
}

- (void)setTaskingId:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)endTimeStr
{
  return self->_endTimeStr;
}

- (void)setEndTimeStr:(id)a3
{
}

- (NSString)spdFilePath
{
  return self->_spdFilePath;
}

- (void)setSpdFilePath:(id)a3
{
}

- (NSString)tarInProgressDir
{
  return self->_tarInProgressDir;
}

- (void)setTarInProgressDir:(id)a3
{
}

- (NSString)iologPath
{
  return self->_iologPath;
}

- (void)setIologPath:(id)a3
{
}

- (NSString)nandcounterPath
{
  return self->_nandcounterPath;
}

- (void)setNandcounterPath:(id)a3
{
}

- (NSString)nandstatsPath
{
  return self->_nandstatsPath;
}

- (void)setNandstatsPath:(id)a3
{
}

- (NSString)convertedIologPath
{
  return self->_convertedIologPath;
}

- (void)setConvertedIologPath:(id)a3
{
}

- (NSString)pendingUploadFile
{
  return self->_pendingUploadFile;
}

- (void)setPendingUploadFile:(id)a3
{
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (NSString)uploadInfoKey
{
  return self->_uploadInfoKey;
}

- (void)setUploadInfoKey:(id)a3
{
}

- (NSDictionary)uploadInfo
{
  return self->_uploadInfo;
}

- (void)setUploadInfo:(id)a3
{
}

- (int)spdState
{
  return self->_spdState;
}

- (void)setSpdState:(int)a3
{
  self->_spdState = a3;
}

- (BOOL)isPeriodicSpd
{
  return self->_isPeriodicSpd;
}

- (void)setIsPeriodicSpd:(BOOL)a3
{
  self->_isPeriodicSpd = a3;
}

- (NSDate)nextSpdExtractTime
{
  return self->_nextSpdExtractTime;
}

- (void)setNextSpdExtractTime:(id)a3
{
}

- (int)uploadIdx
{
  return self->_uploadIdx;
}

- (void)setUploadIdx:(int)a3
{
  self->_uploadIdx = a3;
}

- (unint64_t)lastTotalUploadSize
{
  return self->_lastTotalUploadSize;
}

- (void)setLastTotalUploadSize:(unint64_t)a3
{
  self->_lastTotalUploadSize = a3;
}

- (unint64_t)uploadSizeLimit
{
  return self->_uploadSizeLimit;
}

- (void)setUploadSizeLimit:(unint64_t)a3
{
  self->_uploadSizeLimit = a3;
}

- (BOOL)isEnoughDiskSpace
{
  return self->_isEnoughDiskSpace;
}

- (void)setIsEnoughDiskSpace:(BOOL)a3
{
  self->_isEnoughDiskSpace = a3;
}

- (int)numB2BZipErrors
{
  return self->_numB2BZipErrors;
}

- (void)setNumB2BZipErrors:(int)a3
{
  self->_numB2BZipErrors = a3;
}

- (XpcActivityManager)xpcActivityMgr
{
  return self->_xpcActivityMgr;
}

- (void)setXpcActivityMgr:(id)a3
{
}

- (BOOL)isIOLogEnableNeeded
{
  return self->_isIOLogEnableNeeded;
}

- (void)setIsIOLogEnableNeeded:(BOOL)a3
{
  self->_isIOLogEnableNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityMgr, 0);
  objc_storeStrong((id *)&self->_nextSpdExtractTime, 0);
  objc_storeStrong((id *)&self->_uploadInfo, 0);
  objc_storeStrong((id *)&self->_uploadInfoKey, 0);
  objc_storeStrong((id *)&self->_pendingUploadFile, 0);
  objc_storeStrong((id *)&self->_convertedIologPath, 0);
  objc_storeStrong((id *)&self->_nandstatsPath, 0);
  objc_storeStrong((id *)&self->_nandcounterPath, 0);
  objc_storeStrong((id *)&self->_iologPath, 0);
  objc_storeStrong((id *)&self->_tarInProgressDir, 0);
  objc_storeStrong((id *)&self->_spdFilePath, 0);
  objc_storeStrong((id *)&self->_endTimeStr, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_taskingId, 0);
  objc_storeStrong((id *)&self->_workDir, 0);
  objc_storeStrong((id *)&self->_stateMgr, 0);
  objc_storeStrong((id *)&self->_uploadDriver, 0);
  objc_storeStrong((id *)&self->_nandDriver, 0);

  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
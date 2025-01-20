@interface NRPairingReport
+ (BOOL)supportsSecureCoding;
- (BOOL)didPairingReportRecordAFailure;
- (BOOL)isAutomated;
- (BOOL)isErrorSet;
- (BOOL)isPairingErrorSet;
- (BOOL)shouldFilePairingReport;
- (BOOL)submitted;
- (NRPairingReport)init;
- (NRPairingReport)initWithCoder:(id)a3;
- (NSError)detailedError;
- (NSError)originalError;
- (NSString)abortPairingReason;
- (NSString)aggdReportString;
- (NSString)finalScreenName;
- (NSString)gizmoBuild;
- (NSString)gizmoBuildtype;
- (NSString)gizmoHardware;
- (NSString)gizmoSerial;
- (NSString)processName;
- (id)description;
- (int)gizmoMaxPairingVersion;
- (int64_t)lossOfIDSConnectivity;
- (unsigned)attemptCounter;
- (unsigned)btPairingRetryCount;
- (unsigned)finalDurationSeconds;
- (unsigned)gizmoEnclosureMaterial;
- (unsigned)incorrectPINcount;
- (unsigned)pairedDeviceCount;
- (unsigned)pairingType;
- (unsigned)reason;
- (unsigned)subreason;
- (unsigned)switchCounter;
- (void)encodeWithCoder:(id)a3;
- (void)incrementIncorrectPINcount;
- (void)setAbortPairingReason:(id)a3;
- (void)setAggdReportString:(id)a3;
- (void)setAttemptCounter:(unsigned int)a3;
- (void)setBtPairingRetryCount:(unsigned int)a3;
- (void)setFinalDurationSeconds:(unsigned int)a3;
- (void)setFinalScreenName:(id)a3;
- (void)setGizmoBuild:(id)a3;
- (void)setGizmoBuildtype:(id)a3;
- (void)setGizmoEnclosureMaterial:(unsigned int)a3;
- (void)setGizmoHardware:(id)a3;
- (void)setGizmoMaxPairingVersion:(int)a3;
- (void)setGizmoSerial:(id)a3;
- (void)setIncorrectPINcount:(unsigned int)a3;
- (void)setIsAutomated:(BOOL)a3;
- (void)setLossOfIDSConnectivity:(int64_t)a3;
- (void)setOriginalError:(id)a3;
- (void)setPairedDeviceCount:(unsigned int)a3;
- (void)setPairingError:(id)a3;
- (void)setPairingReportErrorForPairingClient:(id)a3 reason:(id)a4;
- (void)setPairingReportErrorForRemoteError:(unint64_t)a3 withReason:(id)a4;
- (void)setPairingType:(unsigned int)a3;
- (void)setProcessName:(id)a3;
- (void)setShouldFilePairingReport:(BOOL)a3;
- (void)setSubmitted:(BOOL)a3;
- (void)setSubreason:(unsigned int)a3;
- (void)setSubreasonWithPairingError:(id)a3;
- (void)setSwitchCounter:(unsigned int)a3;
- (void)submitPairingReportWithPairingAttemptCounter:(unsigned int)a3 andSwitchCounter:(unsigned int)a4 andPairedDeviceCount:(unsigned int)a5 andGizmoHardware:(id)a6 andGizmoSerial:(id)a7 andBuildType:(id)a8 screenName:(id)a9 idsDisconnectCounter:(int64_t)a10 pairingStartTime:(id)a11 andEnclosureMaterial:(unsigned int)a12 shouldLogOnly:(BOOL)a13;
@end

@implementation NRPairingReport

- (NRPairingReport)init
{
  v17.receiver = self;
  v17.super_class = (Class)NRPairingReport;
  v2 = [(NRPairingReport *)&v17 init];
  v3 = (NRPairingReport *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 12) = xmmword_10011A700;
    v2[8] = 0;
    v4 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = @"pairSuccess";

    processName = v3->_processName;
    v3->_processName = 0;

    abortPairingReason = v3->_abortPairingReason;
    v3->_abortPairingReason = 0;

    v3->_submitted = 0;
    originalError = v3->_originalError;
    v3->_originalError = 0;

    gizmoBuild = v3->_gizmoBuild;
    v3->_gizmoBuild = 0;

    gizmoHardware = v3->_gizmoHardware;
    v3->_gizmoHardware = 0;

    gizmoSerial = v3->_gizmoSerial;
    v3->_gizmoSerial = 0;

    gizmoBuildtype = v3->_gizmoBuildtype;
    v3->_gizmoBuildtype = 0;

    v3->_lossOfIDSConnectivity = -1;
    v3->_gizmoMaxPairingVersion = 0;
    v3->_gizmoEnclosureMaterial = 0;
    v3->_shouldFilePairingReport = 1;
    v12 = nr_pairing_reporter_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      v14 = nr_pairing_reporter_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Initialized new NRPairingReport", v16, 2u);
      }
    }
  }
  return v3;
}

- (void)setOriginalError:(id)a3
{
  id v5 = a3;
  if (![(NRPairingReport *)self isErrorSet])
  {
    objc_storeStrong((id *)&self->_originalError, a3);
    [(NRPairingReport *)self setSubreasonWithPairingError:v5];
    v6 = nr_daemon_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      v8 = nr_daemon_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000FA18C(self);
      }
    }
  }
}

- (NSError)detailedError
{
  originalError = self->_originalError;
  if (originalError)
  {
    uint64_t v4 = [(NSError *)originalError code];
    id v5 = [(NSError *)self->_originalError domain];
LABEL_16:
    v15 = [(NSError *)self->_originalError userInfo];
    if (v15)
    {
      v16 = [(NSError *)self->_originalError userInfo];
      id v17 = [v16 mutableCopy];
    }
    else
    {
      id v17 = +[NSMutableDictionary dictionary];
    }

    v18 = +[NSNumber numberWithUnsignedInt:self->_reason];
    [v17 setObject:v18 forKeyedSubscript:@"reason"];

    v19 = +[NSNumber numberWithUnsignedInt:self->_subreason];
    [v17 setObject:v19 forKeyedSubscript:@"subreason"];

    v20 = sub_10008DCD8(self->_reason);
    [v17 setObject:v20 forKeyedSubscript:@"reasonString"];

    v21 = sub_10008DE40(self->_subreason);
    [v17 setObject:v21 forKeyedSubscript:@"subreasonString"];

    if (v5) {
      CFStringRef v22 = v5;
    }
    else {
      CFStringRef v22 = @"com.apple.NanoRegistry";
    }
    v23 = +[NSError errorWithDomain:v22 code:v4 userInfo:v17];

    goto LABEL_23;
  }
  if (self->_reason || self->_subreason)
  {
    sub_10008D250();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v26;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v12 = [v6 objectForKeyedSubscript:v11];
          BOOL v13 = +[NSNumber numberWithUnsignedInt:self->_subreason];
          unsigned int v14 = [v13 isEqual:v12];

          if (v14)
          {
            uint64_t v4 = (uint64_t)[v11 integerValue];

            goto LABEL_15;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    uint64_t v4 = 5;
LABEL_15:

    self->_reason = sub_10008D99C(self->_subreason);
    id v5 = 0;
    goto LABEL_16;
  }
  v23 = 0;
LABEL_23:

  return (NSError *)v23;
}

- (NRPairingReport)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [[(NRPairingReport *)self init] init];
  if (v5)
  {
    v5->_reason = [v4 decodeInt32ForKey:@"reason"];
    v5->_subreason = [v4 decodeInt32ForKey:@"subreason"];
    v5->_incorrectPINcount = [v4 decodeInt32ForKey:@"incorrectPINcount"];
    v5->_pairingType = [v4 decodeInt32ForKey:@"pairingType"];
    v5->_isAutomated = [v4 decodeBoolForKey:@"isAutomated"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aggdReportString"];
    aggdReportString = v5->_aggdReportString;
    v5->_aggdReportString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processName"];
    processName = v5->_processName;
    v5->_processName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"abortPairingReason"];
    abortPairingReason = v5->_abortPairingReason;
    v5->_abortPairingReason = (NSString *)v10;

    v5->_submitted = [v4 decodeBoolForKey:@"submitted"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalError"];
    originalError = v5->_originalError;
    v5->_originalError = (NSError *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gizmoBuild"];
    gizmoBuild = v5->_gizmoBuild;
    v5->_gizmoBuild = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gizmoHardware"];
    gizmoHardware = v5->_gizmoHardware;
    v5->_gizmoHardware = (NSString *)v16;

    v5->_gizmoMaxPairingVersion = [v4 decodeInt32ForKey:@"gizmoMaxPairingVersion"];
    v5->_shouldFilePairingReport = [v4 decodeBoolForKey:@"shouldFilePairingReport"];
    v5->_lossOfIDSConnectivity = (int64_t)[v4 decodeInt64ForKey:@"lossOfIDSConnectivity"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t reason = self->_reason;
  id v6 = a3;
  [v6 encodeInt32:reason forKey:@"reason"];
  [v6 encodeInt32:self->_subreason forKey:@"subreason"];
  [v6 encodeInt32:self->_incorrectPINcount forKey:@"incorrectPINcount"];
  [v6 encodeInt32:self->_pairingType forKey:@"pairingType"];
  [v6 encodeBool:self->_isAutomated forKey:@"isAutomated"];
  [v6 encodeObject:self->_aggdReportString forKey:@"aggdReportString"];
  [v6 encodeObject:self->_processName forKey:@"processName"];
  [v6 encodeObject:self->_abortPairingReason forKey:@"abortPairingReason"];
  [v6 encodeBool:self->_submitted forKey:@"submitted"];
  id v5 = [(NSError *)self->_originalError nr_filteredError];
  [v6 encodeObject:v5 forKey:@"originalError"];

  [v6 encodeObject:self->_gizmoBuild forKey:@"gizmoBuild"];
  [v6 encodeObject:self->_gizmoHardware forKey:@"gizmoHardware"];
  [v6 encodeInt32:self->_gizmoMaxPairingVersion forKey:@"gizmoMaxPairingVersion"];
  [v6 encodeBool:self->_shouldFilePairingReport forKey:@"shouldFilePairingReport"];
  [v6 encodeInt64:self->_lossOfIDSConnectivity forKey:@"lossOfIDSConnectivity"];
}

- (void)setSubreason:(unsigned int)a3
{
  if (!self->_subreason && !self->_reason)
  {
    self->_subuint64_t reason = a3;
    self->_uint64_t reason = sub_10008D99C(*(uint64_t *)&a3);
    if (!self->_aggdReportString)
    {
      id v5 = +[NSString stringWithFormat:@"missingAggdReportingError%ld", a3];
      aggdReportString = self->_aggdReportString;
      self->_aggdReportString = v5;
    }
    id v7 = nr_pairing_reporter_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      uint64_t v9 = nr_pairing_reporter_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [(NRPairingReport *)self description];
        *(_DWORD *)buf = 138543362;
        uint64_t v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Set subreason: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)setSubreasonWithPairingError:(id)a3
{
  id v4 = a3;
  [v4 code];
  id v5 = nrGetReportStringForErrorCode();
  [(NRPairingReport *)self setAggdReportString:v5];

  id v6 = [v4 code];
  uint64_t v7 = sub_10008D17C((uint64_t)v6);

  [(NRPairingReport *)self setSubreason:v7];
}

- (void)setAggdReportString:(id)a3
{
  id v7 = a3;
  aggdReportString = self->_aggdReportString;
  p_aggdReportString = &self->_aggdReportString;
  if ([(NSString *)aggdReportString isEqual:@"pairSuccess"]) {
    objc_storeStrong((id *)p_aggdReportString, a3);
  }
}

- (void)setProcessName:(id)a3
{
  id v5 = a3;
  processName = self->_processName;
  p_processName = &self->_processName;
  if (!processName)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_processName, a3);
    id v5 = v8;
  }
}

- (void)setAbortPairingReason:(id)a3
{
  id v5 = a3;
  abortPairingReason = self->_abortPairingReason;
  p_abortPairingReason = &self->_abortPairingReason;
  if (!abortPairingReason)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_abortPairingReason, a3);
    id v5 = v8;
  }
}

- (BOOL)isErrorSet
{
  return self->_subreason != 0;
}

- (void)setSubmitted:(BOOL)a3
{
  if (!self->_submitted) {
    self->_submitted = a3;
  }
}

- (void)incrementIncorrectPINcount
{
  ++self->_incorrectPINcount;
  v3 = nr_pairing_reporter_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_pairing_reporter_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(NRPairingReport *)self description];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Incremented incorrect pin count: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)description
{
  v3 = sub_10008DCD8([(NRPairingReport *)self reason]);
  BOOL v4 = sub_10008DE40([(NRPairingReport *)self subreason]);
  uint64_t v5 = [(NRPairingReport *)self incorrectPINcount];
  uint64_t v6 = [(NRPairingReport *)self pairingType];
  int v7 = (void *)qword_1001A1230;
  if (!qword_1001A1230)
  {
    v18[0] = &off_100176E38;
    v18[1] = &off_100176CD0;
    v19[0] = @"NRPairingReportAttemptTypeMagic";
    v19[1] = @"NRPairingReportAttemptTypePIN";
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    uint64_t v9 = (void *)qword_1001A1230;
    qword_1001A1230 = v8;

    int v7 = (void *)qword_1001A1230;
  }
  uint64_t v10 = +[NSNumber numberWithUnsignedInt:v6];
  v11 = [v7 objectForKeyedSubscript:v10];

  unsigned int v12 = [(NRPairingReport *)self isAutomated];
  BOOL v13 = [(NRPairingReport *)self aggdReportString];
  uint64_t v14 = [(NRPairingReport *)self processName];
  v15 = [(NRPairingReport *)self abortPairingReason];
  uint64_t v16 = +[NSString stringWithFormat:@"Reason: %@\tSubreason: %@\tIncorrect PIN Count: %d\tPairing Type: %@\tIs Automated: %x\tAGGD ReportString: %@\tProcess Name: %@\tAbort Pairing Reason: %@", v3, v4, v5, v11, v12, v13, v14, v15];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPairingError:(id)a3
{
  id v4 = a3;
  if ([(NRPairingReport *)self isPairingErrorSet])
  {
    uint64_t v5 = nr_daemon_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      int v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(NRPairingReport *)self pairingError];
        uint64_t v9 = [v8 nr_safeDescription];
        int v13 = 138543618;
        uint64_t v14 = v9;
        __int16 v15 = 2114;
        uint64_t v16 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not setting pairing error %{public}@ because pairing report has already recorded a failure reason: %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  else if (v4)
  {
    uint64_t v10 = nr_pairing_reporter_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      unsigned int v12 = nr_pairing_reporter_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000FA214(v4);
      }
    }
    [(NRPairingReport *)self setOriginalError:v4];
    [(NRPairingReport *)self setSubreasonWithPairingError:v4];
  }
}

- (void)setPairingReportErrorForPairingClient:(id)a3 reason:(id)a4
{
  BOOL v6 = (NRPairingReport *)a3;
  id v7 = a4;
  if (![(NRPairingReport *)self isPairingErrorSet])
  {
    BOOL v11 = nr_pairing_reporter_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      int v13 = nr_pairing_reporter_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v24 = v6;
        __int16 v25 = 2114;
        id v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setting pairing report with client: %{public}@\treason: %{public}@", buf, 0x16u);
      }
    }
    uint64_t v14 = [(NRPairingReport *)v6 lastPathComponent];
    [(NRPairingReport *)self setProcessName:v14];
    [(NRPairingReport *)self setAbortPairingReason:v7];
    __int16 v15 = +[NSString stringWithFormat:@"%@", v7];
    uint64_t v16 = +[NSString stringWithFormat:@"pairingAborted.%@.%@", v14, v15];
    [(NRPairingReport *)self setAggdReportString:v16];

    uint64_t v10 = v14;
    id v17 = v7;
    v18 = (_UNKNOWN **)qword_1001A1238;
    if (!qword_1001A1238)
    {
      v18 = &off_100177B18;
      qword_1001A1238 = (uint64_t)&off_100177B18;
    }
    v19 = [v18 objectForKey:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [v19 objectForKey:v17];
      if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        uint64_t v21 = (uint64_t)[v20 integerValue];
      }
      else {
        uint64_t v21 = 35;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v21 = 35;
        goto LABEL_20;
      }
      v20 = [(id)qword_1001A1238 objectForKey:v10];
      uint64_t v21 = (uint64_t)[v20 integerValue];
    }

LABEL_20:
    [(NRPairingReport *)self setSubreason:v21];
    if ([(NRPairingReport *)self subreason] != 1) {
      [(NRPairingReport *)self subreason];
    }
    CFStringRef v22 = nrGetPairingError();
    [(NRPairingReport *)self setOriginalError:v22];

    goto LABEL_23;
  }
  uint64_t v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not setting pairing report error because pairing report has already recorded a failure reason: %{public}@", buf, 0xCu);
    }
LABEL_23:
  }
}

- (void)setPairingReportErrorForRemoteError:(unint64_t)a3 withReason:(id)a4
{
  id v6 = a4;
  if ([(NRPairingReport *)self isPairingErrorSet])
  {
    id v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      BOOL v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not setting pairing remote error because pairing report has already recorded a failure reason: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v10 = nr_pairing_reporter_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      BOOL v12 = nr_pairing_reporter_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = a3;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting pairing error with error code: %lu\treason: %{public}@", buf, 0x16u);
      }
    }
    [(NRPairingReport *)self setAbortPairingReason:v6];
    int v13 = (void *)qword_1001A1240;
    if (!qword_1001A1240)
    {
      v30 = &off_100177018;
      CFStringRef v31 = (const __CFString *)&off_100176FE8;
      *(void *)buf = @"xpcError";
      *(void *)&buf[8] = @"alreadyPairedError";
      CFStringRef v32 = (const __CFString *)&off_1001772A0;
      CFStringRef v33 = (const __CFString *)&off_1001772B8;
      *(void *)&buf[16] = @"multiplePairError";
      CFStringRef v67 = @"notInIdleStateError";
      CFStringRef v34 = (const __CFString *)&off_1001772D0;
      CFStringRef v35 = (const __CFString *)&off_1001772E8;
      CFStringRef v68 = @"unknownDeviceError";
      CFStringRef v69 = @"internalError";
      CFStringRef v36 = (const __CFString *)&off_100176BE0;
      CFStringRef v37 = (const __CFString *)&off_100176EC8;
      CFStringRef v70 = @"connectTimeoutError";
      CFStringRef v71 = @"btPairError";
      CFStringRef v38 = (const __CFString *)&off_100177030;
      CFStringRef v39 = (const __CFString *)&off_100176C10;
      CFStringRef v72 = @"lostXPCError";
      CFStringRef v73 = @"btTurnedOffError";
      CFStringRef v40 = (const __CFString *)&off_100177300;
      CFStringRef v41 = (const __CFString *)&off_100177048;
      CFStringRef v74 = @"pairRequestTimeoutError";
      CFStringRef v75 = @"restartedError";
      v42 = &off_100176C40;
      v43 = &off_100176C58;
      CFStringRef v76 = @"btPairTimeoutError";
      CFStringRef v77 = @"idsConnectTimeoutError";
      v44 = &off_100176C88;
      v45 = &off_100176CB8;
      CFStringRef v78 = @"ipsTimeoutError";
      CFStringRef v79 = @"idsUnpairRequestError";
      v46 = &off_100177318;
      v47 = &off_100176CE8;
      CFStringRef v80 = @"xpcPairUnpairRequestError";
      CFStringRef v81 = @"activationError";
      v48 = &off_100177330;
      v49 = &off_100177348;
      CFStringRef v82 = @"daemonEnableError";
      CFStringRef v83 = @"busyPairingOrUnpairing";
      v50 = &off_100176D48;
      v51 = &off_100177360;
      CFStringRef v84 = @"initialPropertySendFailure";
      CFStringRef v85 = @"bluetoothUnpairTimeout";
      v52 = &off_100176D78;
      v53 = &off_100176D90;
      CFStringRef v86 = @"gizmoStateChangeRequestFailedToSend";
      CFStringRef v87 = @"companionVersionTooOldForGizmo";
      v54 = &off_100176D18;
      v55 = &off_100176DC0;
      CFStringRef v88 = @"pairingAborted";
      CFStringRef v89 = @"pairingClientTerminated";
      v56 = &off_100176DF0;
      v57 = &off_100176EF8;
      CFStringRef v90 = @"diskFullError";
      CFStringRef v91 = @"badPINError";
      v58 = &off_100176E20;
      v59 = &off_100176E50;
      CFStringRef v92 = @"abortPairingUserRequested";
      CFStringRef v93 = @"restriction";
      v60 = &off_100176E80;
      v61 = &off_100176E98;
      CFStringRef v94 = @"passcodeEntryTimeout";
      CFStringRef v95 = @"bluetoothDiscoveryTimeout";
      v62 = &off_100176F28;
      v63 = &off_100176F58;
      CFStringRef v96 = @"idsLocalPairingAPIFailure";
      CFStringRef v97 = @"switchFailedDueToActiveAssertion";
      v64 = &off_100176F88;
      v65 = &off_100176FB8;
      CFStringRef v98 = @"configureStateRequestedDevicesNotCompatible";
      CFStringRef v99 = @"pairedDeviceNotCompatibleWithQuickSwitch";
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v30 count:36];
      __int16 v15 = (void *)qword_1001A1240;
      qword_1001A1240 = v14;

      int v13 = (void *)qword_1001A1240;
    }
    uint64_t v16 = +[NSNumber numberWithInteger:a3];
    id v17 = [v13 objectForKeyedSubscript:v16];

    if (!v17)
    {
      id v17 = +[NSString stringWithFormat:@"missingError%ld", a3];
    }
    v18 = +[NSString stringWithFormat:@"remoteUnpair.%@.%@", v17, v6];
    [(NRPairingReport *)self setAggdReportString:v18];

    id v19 = v6;
    v20 = (void *)qword_1001A1248;
    if (!qword_1001A1248)
    {
      v100[0] = &off_100176D48;
      v100[1] = &off_100176C88;
      v101[0] = &off_100177120;
      v101[1] = &off_100177108;
      v100[2] = &off_100176E20;
      v100[3] = &off_100177030;
      v101[2] = &off_100176CD0;
      v101[3] = &off_100177180;
      v100[4] = &off_100177048;
      v100[5] = &off_100177018;
      v101[4] = &off_100177198;
      v101[5] = &off_100177180;
      v101[6] = &off_1001771B0;
      v100[6] = &off_100176DF0;
      v100[7] = &off_100176D18;
      uint64_t v21 = +[NSNull null];
      v30 = v21;
      CFStringRef v31 = @"ExpiredInBackground";
      *(void *)buf = &off_1001771C8;
      *(void *)&buf[8] = &off_1001770A8;
      CFStringRef v32 = @"FailureExpiredInBackground";
      CFStringRef v33 = @"BackgroundAssertionExpired";
      *(void *)&buf[16] = &off_1001770A8;
      CFStringRef v67 = (const __CFString *)&off_1001770A8;
      CFStringRef v34 = @"FailureGizmoVersionWasAhead";
      CFStringRef v35 = @"FailurePairing";
      CFStringRef v68 = (const __CFString *)&off_1001770C0;
      CFStringRef v69 = (const __CFString *)&off_1001771C8;
      CFStringRef v36 = @"FailureInActivation";
      CFStringRef v37 = @"RemoteFailedActivation";
      CFStringRef v70 = (const __CFString *)&off_100177168;
      CFStringRef v71 = (const __CFString *)&off_100177168;
      CFStringRef v38 = @"FailureInActivationUserActionable";
      CFStringRef v39 = @"FailureMessageFailedToSend";
      CFStringRef v72 = (const __CFString *)&off_100177168;
      CFStringRef v73 = (const __CFString *)&off_100177150;
      CFStringRef v40 = @"PBAggEventUserTriggeredUnpair";
      CFStringRef v41 = @"UserDismissedSetupBecauseOfTroubleConnecting";
      CFStringRef v74 = (const __CFString *)&off_100176CD0;
      CFStringRef v75 = (const __CFString *)&off_1001770D8;
      CFStringRef v22 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v30 count:12];
      v101[7] = v22;
      uint64_t v23 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:8];

      v24 = (void *)qword_1001A1248;
      qword_1001A1248 = v23;

      v20 = (void *)qword_1001A1248;
    }
    __int16 v25 = +[NSNumber numberWithUnsignedInteger:a3];
    id v26 = [v20 objectForKey:v25];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v19)
      {
        long long v27 = [v26 objectForKey:v19];
      }
      else
      {
        v29 = +[NSNull null];
        long long v27 = [v26 objectForKey:v29];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v28 = (uint64_t)[v27 integerValue];
      }
      else {
        uint64_t v28 = 36;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v28 = (uint64_t)[v26 integerValue];
      }
      else {
        uint64_t v28 = 200;
      }
    }

    [(NRPairingReport *)self setSubreason:v28];
  }
}

- (void)submitPairingReportWithPairingAttemptCounter:(unsigned int)a3 andSwitchCounter:(unsigned int)a4 andPairedDeviceCount:(unsigned int)a5 andGizmoHardware:(id)a6 andGizmoSerial:(id)a7 andBuildType:(id)a8 screenName:(id)a9 idsDisconnectCounter:(int64_t)a10 pairingStartTime:(id)a11 andEnclosureMaterial:(unsigned int)a12 shouldLogOnly:(BOOL)a13
{
  uint64_t v15 = *(void *)&a5;
  uint64_t v16 = *(void *)&a4;
  uint64_t v17 = *(void *)&a3;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a11;
  if (![(NRPairingReport *)self submitted])
  {
    [(NRPairingReport *)self setAttemptCounter:v17];
    [(NRPairingReport *)self setGizmoBuild:v21];
    [(NRPairingReport *)self setGizmoHardware:v19];
    [(NRPairingReport *)self setFinalScreenName:v22];
    [(NRPairingReport *)self setSwitchCounter:v16];
    [(NRPairingReport *)self setPairedDeviceCount:v15];
    [(NRPairingReport *)self setGizmoSerial:v20];
    [(NRPairingReport *)self setLossOfIDSConnectivity:a10];
    [(NRPairingReport *)self setGizmoBuildtype:v21];
    [(NRPairingReport *)self setGizmoEnclosureMaterial:a12];
    if (v23)
    {
      long long v27 = +[NSDate date];
      [v27 timeIntervalSinceReferenceDate];
      double v29 = v28;
      [v23 timeIntervalSinceReferenceDate];
      double v31 = v29 - v30;

      uint64_t v32 = v31;
    }
    else
    {
      uint64_t v32 = 0;
    }
    [(NRPairingReport *)self setFinalDurationSeconds:v32];
    id v26 = +[NRDataCollector sharedInstance];
    CFStringRef v33 = [v26 getValueForKey:@"btPairingRetryCount"];
    -[NRPairingReport setBtPairingRetryCount:](self, "setBtPairingRetryCount:", [v33 intValue]);

    CFStringRef v34 = nr_pairing_reporter_log();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

    if (v35)
    {
      CFStringRef v36 = nr_pairing_reporter_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v37 = @"S";
        if (a13) {
          CFStringRef v37 = @"Log only- NOT s";
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v39 = (NRPairingReport *)v37;
        __int16 v40 = 2114;
        CFStringRef v41 = self;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@ubmitting pairing report: %{public}@", buf, 0x16u);
      }
    }
    [(NRPairingReport *)self setSubmitted:1];
    goto LABEL_15;
  }
  v24 = nr_pairing_reporter_log();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

  if (v25)
  {
    id v26 = nr_pairing_reporter_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v39 = self;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Pairing report already submitted: %{public}@", buf, 0xCu);
    }
LABEL_15:
  }
}

- (BOOL)didPairingReportRecordAFailure
{
  return [(NRPairingReport *)self reason] != 0;
}

- (BOOL)isPairingErrorSet
{
  if ([(NRPairingReport *)self reason] || (unsigned int v3 = [(NRPairingReport *)self subreason]) != 0) {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (unsigned)reason
{
  return self->_reason;
}

- (unsigned)subreason
{
  return self->_subreason;
}

- (unsigned)incorrectPINcount
{
  return self->_incorrectPINcount;
}

- (void)setIncorrectPINcount:(unsigned int)a3
{
  self->_incorrectPINcount = a3;
}

- (unsigned)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(unsigned int)a3
{
  self->_pairingType = a3;
}

- (BOOL)isAutomated
{
  return self->_isAutomated;
}

- (void)setIsAutomated:(BOOL)a3
{
  self->_isAutomated = a3;
}

- (NSString)aggdReportString
{
  return self->_aggdReportString;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)abortPairingReason
{
  return self->_abortPairingReason;
}

- (BOOL)submitted
{
  return self->_submitted;
}

- (NSError)originalError
{
  return self->_originalError;
}

- (NSString)gizmoBuild
{
  return self->_gizmoBuild;
}

- (void)setGizmoBuild:(id)a3
{
}

- (NSString)gizmoHardware
{
  return self->_gizmoHardware;
}

- (void)setGizmoHardware:(id)a3
{
}

- (int)gizmoMaxPairingVersion
{
  return self->_gizmoMaxPairingVersion;
}

- (void)setGizmoMaxPairingVersion:(int)a3
{
  self->_gizmoMaxPairingVersion = a3;
}

- (BOOL)shouldFilePairingReport
{
  return self->_shouldFilePairingReport;
}

- (void)setShouldFilePairingReport:(BOOL)a3
{
  self->_shouldFilePairingReport = a3;
}

- (NSString)gizmoSerial
{
  return self->_gizmoSerial;
}

- (void)setGizmoSerial:(id)a3
{
}

- (NSString)gizmoBuildtype
{
  return self->_gizmoBuildtype;
}

- (void)setGizmoBuildtype:(id)a3
{
}

- (unsigned)gizmoEnclosureMaterial
{
  return self->_gizmoEnclosureMaterial;
}

- (void)setGizmoEnclosureMaterial:(unsigned int)a3
{
  self->_gizmoEnclosureMaterial = a3;
}

- (unsigned)btPairingRetryCount
{
  return self->_btPairingRetryCount;
}

- (void)setBtPairingRetryCount:(unsigned int)a3
{
  self->_btPairingRetryCount = a3;
}

- (NSString)finalScreenName
{
  return self->_finalScreenName;
}

- (void)setFinalScreenName:(id)a3
{
}

- (unsigned)finalDurationSeconds
{
  return self->_finalDurationSeconds;
}

- (void)setFinalDurationSeconds:(unsigned int)a3
{
  self->_finalDurationSeconds = a3;
}

- (unsigned)attemptCounter
{
  return self->_attemptCounter;
}

- (void)setAttemptCounter:(unsigned int)a3
{
  self->_attemptCounter = a3;
}

- (int64_t)lossOfIDSConnectivity
{
  return self->_lossOfIDSConnectivity;
}

- (void)setLossOfIDSConnectivity:(int64_t)a3
{
  self->_lossOfIDSConnectivity = a3;
}

- (unsigned)pairedDeviceCount
{
  return self->_pairedDeviceCount;
}

- (void)setPairedDeviceCount:(unsigned int)a3
{
  self->_pairedDeviceCount = a3;
}

- (unsigned)switchCounter
{
  return self->_switchCounter;
}

- (void)setSwitchCounter:(unsigned int)a3
{
  self->_switchCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalScreenName, 0);
  objc_storeStrong((id *)&self->_gizmoBuildtype, 0);
  objc_storeStrong((id *)&self->_gizmoSerial, 0);
  objc_storeStrong((id *)&self->_gizmoHardware, 0);
  objc_storeStrong((id *)&self->_gizmoBuild, 0);
  objc_storeStrong((id *)&self->_originalError, 0);
  objc_storeStrong((id *)&self->_abortPairingReason, 0);
  objc_storeStrong((id *)&self->_processName, 0);

  objc_storeStrong((id *)&self->_aggdReportString, 0);
}

@end
@interface PLModelMigrationActionProcessor
- (BOOL)ignoreProgressUpdates;
- (BOOL)isSuccess;
- (NSProgress)progress;
- (PLFileBackedLogger)logger;
- (PLModelMigrationActionProcessor)initWithUUID:(id)a3 pathManager:(id)a4 migrationActionType:(int64_t)a5 analyticsEventManager:(id)a6 logger:(id)a7 progressUnitCount:(unint64_t)a8;
- (id)_generateActionMarker;
- (id)_generateActionMarkerBase;
- (id)_generateActionTagMarker;
- (id)_progressLogMessage;
- (id)_startLogEntryWithName:(id)a3;
- (void)_initialLog;
- (void)_performActionWithName:(id)a3 ifRequired:(id)a4 recordTimedCoreAnalyticsEvent:(id)a5 coreAnalyticsEventKey:(id)a6 block:(id)a7;
- (void)_stopLogEntryWithPerfCheck:(id)a3;
- (void)dealloc;
- (void)performActionWithName:(id)a3 ifRequired:(id)a4 block:(id)a5;
- (void)performActionWithName:(id)a3 ifRequired:(id)a4 recordTimedCoreAnalyticsEvent:(id)a5 coreAnalyticsEventKey:(id)a6 block:(id)a7;
- (void)setIgnoreProgressUpdates:(BOOL)a3;
- (void)setLogger:(id)a3;
- (void)setProgress:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation PLModelMigrationActionProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_lifetimePerfCheck, 0);
  objc_storeStrong((id *)&self->_analyticsEventManager, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_uuidTruncated, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setLogger:(id)a3
{
}

- (PLFileBackedLogger)logger
{
  return (PLFileBackedLogger *)objc_getProperty(self, a2, 96, 1);
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 88, 1);
}

- (void)setIgnoreProgressUpdates:(BOOL)a3
{
  self->_ignoreProgressUpdates = a3;
}

- (BOOL)ignoreProgressUpdates
{
  return self->_ignoreProgressUpdates;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)isSuccess
{
  return self->_success;
}

- (void)_performActionWithName:(id)a3 ifRequired:(id)a4 recordTimedCoreAnalyticsEvent:(id)a5 coreAnalyticsEventKey:(id)a6 block:(id)a7
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = (uint64_t (**)(void))a7;
  if (a4.var0)
  {
    if ([(PLModelMigrationActionProcessor *)self isSuccess])
    {
      v16 = [(PLModelMigrationActionProcessor *)self _startLogEntryWithName:v12];
      [(PLModelMigrationActionProcessor *)self setSuccess:v15[2](v15)];
      if (![(PLModelMigrationActionProcessor *)self isSuccess])
      {
        v17 = PLMigrationGetLog();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

        if (v18)
        {
          if (self->_logger)
          {
            long long v85 = 0u;
            long long v86 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            memset(buf, 0, sizeof(buf));
            v19 = PLMigrationGetLog();
            os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
            v20 = [(PLModelMigrationActionProcessor *)self _generateActionTagMarker];
            if ((unint64_t)(self->_type - 1) >= 5) {
              v21 = @"schema";
            }
            else {
              v21 = @"post migration";
            }
            v22 = v21;
            int v50 = 138543618;
            v51 = v20;
            __int16 v52 = 2114;
            v53 = v22;
            LODWORD(v49) = 22;
            v23 = (uint8_t *)_os_log_send_and_compose_impl();

            -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActionProcessor.m", 206, 16, &v50, v49);
            if (v23 != buf) {
              free(v23);
            }
          }
          else
          {
            v34 = PLMigrationGetLog();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v35 = [(PLModelMigrationActionProcessor *)self _generateActionTagMarker];
              if ((unint64_t)(self->_type - 1) >= 5) {
                v36 = @"schema";
              }
              else {
                v36 = @"post migration";
              }
              v37 = v36;
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v35;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v37;
              _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ Action: failed!", buf, 0x16u);
            }
          }
        }
      }
      v38 = self;
      if (![(PLModelMigrationActionProcessor *)v38 ignoreProgressUpdates])
      {
        v39 = [(PLModelMigrationActionProcessor *)v38 progress];
        v40 = v39;
        if (v39)
        {
          uint64_t v41 = [v39 completedUnitCount];
          if (v41 >= [v40 totalUnitCount])
          {
            v42 = PLMigrationGetLog();
            BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

            if (v43)
            {
              v44 = [(PLModelMigrationActionProcessor *)v38 logger];

              if (v44)
              {
                long long v85 = 0u;
                long long v86 = 0u;
                long long v83 = 0u;
                long long v84 = 0u;
                long long v81 = 0u;
                long long v82 = 0u;
                long long v79 = 0u;
                long long v80 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                long long v75 = 0u;
                long long v76 = 0u;
                long long v73 = 0u;
                long long v74 = 0u;
                long long v71 = 0u;
                long long v72 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                long long v67 = 0u;
                long long v68 = 0u;
                long long v65 = 0u;
                long long v66 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                long long v61 = 0u;
                long long v62 = 0u;
                long long v59 = 0u;
                long long v60 = 0u;
                long long v57 = 0u;
                long long v58 = 0u;
                memset(buf, 0, sizeof(buf));
                v45 = PLMigrationGetLog();
                os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
                int v50 = 138543362;
                v51 = v40;
                LODWORD(v49) = 12;
                v46 = (uint8_t *)_os_log_send_and_compose_impl();

                v47 = [(PLModelMigrationActionProcessor *)v38 logger];
                objc_msgSend(v47, "logWithMessage:fromCodeLocation:type:", v46, "PLModelMigrationActionProcessor.m", 82, 0);

                if (v46 != buf) {
                  free(v46);
                }
              }
              else
              {
                v48 = PLMigrationGetLog();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)&buf[4] = v40;
                  _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_DEFAULT, "Progress report exceeded totalUnitCount: %{public}@", buf, 0xCu);
                }
              }
            }
          }
          else
          {
            objc_msgSend(v40, "setCompletedUnitCount:", objc_msgSend(v40, "completedUnitCount") + 1);
          }
        }
      }
      [(PLModelMigrationActionProcessor *)v38 _stopLogEntryWithPerfCheck:v16];
      if (v13 && v14) {
        [(PLCoreAnalyticsEventManager *)v38->_analyticsEventManager stopRecordingTimedEventWithToken:v14 forKey:v13 onEventWithName:v38->_token];
      }
LABEL_44:

      goto LABEL_45;
    }
    v24 = PLMigrationGetLog();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

    if (v25)
    {
      if (!self->_logger)
      {
        v16 = PLMigrationGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v31 = [(PLModelMigrationActionProcessor *)self _generateActionTagMarker];
          if ((unint64_t)(self->_type - 1) >= 5) {
            v32 = @"schema";
          }
          else {
            v32 = @"post migration";
          }
          v33 = v32;
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v31;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v33;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&buf[24] = v12;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ Action: skipping due to previous migration action failure: %{public}@", buf, 0x20u);
        }
        goto LABEL_44;
      }
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      memset(buf, 0, sizeof(buf));
      v26 = PLMigrationGetLog();
      os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      v27 = [(PLModelMigrationActionProcessor *)self _generateActionTagMarker];
      if ((unint64_t)(self->_type - 1) >= 5) {
        v28 = @"schema";
      }
      else {
        v28 = @"post migration";
      }
      v29 = v28;
      int v50 = 138543874;
      v51 = v27;
      __int16 v52 = 2114;
      v53 = v29;
      __int16 v54 = 2114;
      id v55 = v12;
      LODWORD(v49) = 32;
      v30 = (uint8_t *)_os_log_send_and_compose_impl();

      -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActionProcessor.m", 215, 16, &v50, v49);
      if (v30 != buf) {
        free(v30);
      }
    }
  }
LABEL_45:
  ++self->_tag;
}

- (void)performActionWithName:(id)a3 ifRequired:(id)a4 recordTimedCoreAnalyticsEvent:(id)a5 coreAnalyticsEventKey:(id)a6 block:(id)a7
{
}

- (void)performActionWithName:(id)a3 ifRequired:(id)a4 block:(id)a5
{
}

- (id)_progressLogMessage
{
  progress = self->_progress;
  if (progress)
  {
    v4 = [NSString stringWithFormat:@", action progress:(%.2lf %%)", (double)-[NSProgress completedUnitCount](progress, "completedUnitCount")* 100.0/ (double)-[NSProgress totalUnitCount](self->_progress, "totalUnitCount")];
  }
  else
  {
    v4 = &stru_1EEB2EB80;
  }
  return v4;
}

- (void)_stopLogEntryWithPerfCheck:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double token = self->_token;
  double v6 = CFAbsoluteTimeGetCurrent() - token;
  if (token <= 0.0) {
    double v7 = 0.0;
  }
  else {
    double v7 = v6;
  }
  v8 = [v4 stop];
  v9 = PLMigrationGetLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    if (self->_logger)
    {
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
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      memset(buf, 0, sizeof(buf));
      v11 = PLMigrationGetLog();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      id v12 = [(PLModelMigrationActionProcessor *)self _generateActionTagMarker];
      if ((unint64_t)(self->_type - 1) >= 5) {
        id v13 = @"schema";
      }
      else {
        id v13 = @"post migration";
      }
      id v14 = v13;
      if (v4)
      {
        v15 = [v4 perfCheckLogStringWithPerfCheckInfo:v8];
      }
      else
      {
        v15 = @", <perf check disabled>";
      }
      v21 = [(PLModelMigrationActionProcessor *)self _progressLogMessage];
      int v25 = 138544386;
      v26 = v12;
      __int16 v27 = 2114;
      v28 = v14;
      __int16 v29 = 2048;
      double v30 = v7;
      __int16 v31 = 2114;
      v32 = v15;
      __int16 v33 = 2114;
      v34 = v21;
      LODWORD(v24) = 52;
      v22 = (uint8_t *)_os_log_send_and_compose_impl();

      -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActionProcessor.m", 179, 0, &v25, v24);
      if (v22 != buf) {
        free(v22);
      }
    }
    else
    {
      v16 = PLMigrationGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [(PLModelMigrationActionProcessor *)self _generateActionTagMarker];
        if ((unint64_t)(self->_type - 1) >= 5) {
          BOOL v18 = @"schema";
        }
        else {
          BOOL v18 = @"post migration";
        }
        v19 = v18;
        if (v4)
        {
          v20 = [v4 perfCheckLogStringWithPerfCheckInfo:v8];
        }
        else
        {
          v20 = @", <perf check disabled>";
        }
        v23 = [(PLModelMigrationActionProcessor *)self _progressLogMessage];
        *(_DWORD *)buf = 138544386;
        *(void *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2048;
        *(double *)&buf[24] = v7;
        *(_WORD *)&uint8_t buf[32] = 2114;
        *(void *)&buf[34] = v20;
        *(_WORD *)&buf[42] = 2114;
        *(void *)&buf[44] = v23;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished %{public}@ action: %.2lfs%{public}@%{public}@", buf, 0x34u);
      }
    }
  }
}

- (id)_startLogEntryWithName:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_double token = CFAbsoluteTimeGetCurrent();
  v5 = [MEMORY[0x1E4F8BA00] start];
  double v6 = PLMigrationGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    if (self->_logger)
    {
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
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      memset(buf, 0, sizeof(buf));
      v8 = PLMigrationGetLog();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      v9 = [(PLModelMigrationActionProcessor *)self _generateActionTagMarker];
      if ((unint64_t)(self->_type - 1) >= 5) {
        BOOL v10 = @"schema";
      }
      else {
        BOOL v10 = @"post migration";
      }
      v11 = v10;
      qos_class_self();
      id v12 = PLShortStringFromQoSClass();
      int v21 = 138544130;
      v22 = v9;
      __int16 v23 = 2114;
      uint64_t v24 = v11;
      __int16 v25 = 2114;
      id v26 = v4;
      __int16 v27 = 2114;
      v28 = v12;
      LODWORD(v20) = 42;
      id v13 = (uint8_t *)_os_log_send_and_compose_impl();

      -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v13, "PLModelMigrationActionProcessor.m", 172, 0, &v21, v20);
      if (v13 != buf) {
        free(v13);
      }
    }
    else
    {
      id v14 = PLMigrationGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [(PLModelMigrationActionProcessor *)self _generateActionTagMarker];
        if ((unint64_t)(self->_type - 1) >= 5) {
          v16 = @"schema";
        }
        else {
          v16 = @"post migration";
        }
        v17 = v16;
        qos_class_self();
        BOOL v18 = PLShortStringFromQoSClass();
        *(_DWORD *)buf = 138544130;
        *(void *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v17;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v4;
        LOWORD(v30) = 2114;
        *(void *)((char *)&v30 + 2) = v18;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Start of %{public}@ action: %{public}@ at %{public}@ QoS", buf, 0x2Au);
      }
    }
  }

  return v5;
}

- (id)_generateActionTagMarker
{
  v3 = NSString;
  id v4 = [(PLModelMigrationActionProcessor *)self _generateActionMarkerBase];
  v5 = [v3 stringWithFormat:@"tag:%@:%04d", v4, self->_tag];

  return v5;
}

- (id)_generateActionMarker
{
  v2 = NSString;
  v3 = [(PLModelMigrationActionProcessor *)self _generateActionMarkerBase];
  id v4 = [v2 stringWithFormat:@"tag:%@     ", v3];

  return v4;
}

- (id)_generateActionMarkerBase
{
  unint64_t v2 = self->_type - 1;
  if (v2 > 4) {
    v3 = @"sc";
  }
  else {
    v3 = off_1E5867130[v2];
  }
  return (id)[NSString stringWithFormat:@"%@:%@", self->_uuidTruncated, v3];
}

- (void)dealloc
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v3 = [(PLTimedPerfCheck *)self->_lifetimePerfCheck stop];
  [(NSProgress *)self->_progress setCompletedUnitCount:[(NSProgress *)self->_progress totalUnitCount]];
  id v4 = PLMigrationGetLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    if (self->_logger)
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
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
      memset(buf, 0, sizeof(buf));
      double v6 = PLMigrationGetLog();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      BOOL v7 = [(PLModelMigrationActionProcessor *)self _generateActionMarker];
      if ((unint64_t)(self->_type - 1) >= 5) {
        v8 = @"schema";
      }
      else {
        v8 = @"post migration";
      }
      v9 = v8;
      BOOL v10 = PLStringFromPLMigrationActionTypeShort(self->_type);
      double lifetimeToken = self->_lifetimeToken;
      double v12 = CFAbsoluteTimeGetCurrent() - lifetimeToken;
      if (lifetimeToken <= 0.0) {
        double v13 = 0.0;
      }
      else {
        double v13 = v12;
      }
      lifetimePerfCheck = self->_lifetimePerfCheck;
      if (lifetimePerfCheck)
      {
        v15 = [(PLTimedPerfCheck *)lifetimePerfCheck perfCheckLogStringWithPerfCheckInfo:v3];
      }
      else
      {
        v15 = @", <perf check disabled>";
      }
      id v26 = [(PLModelMigrationActionProcessor *)self _progressLogMessage];
      int v31 = 138544642;
      long long v32 = v7;
      __int16 v33 = 2114;
      long long v34 = v9;
      __int16 v35 = 2114;
      long long v36 = v10;
      __int16 v37 = 2048;
      double v38 = v13;
      __int16 v39 = 2114;
      long long v40 = v15;
      __int16 v41 = 2114;
      long long v42 = v26;
      LODWORD(v29) = 62;
      __int16 v27 = (uint8_t *)_os_log_send_and_compose_impl();

      -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActionProcessor.m", 147, 0, &v31, v29);
      if (v27 != buf) {
        free(v27);
      }
    }
    else
    {
      v16 = PLMigrationGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [(PLModelMigrationActionProcessor *)self _generateActionMarker];
        if ((unint64_t)(self->_type - 1) >= 5) {
          BOOL v18 = @"schema";
        }
        else {
          BOOL v18 = @"post migration";
        }
        v19 = v18;
        uint64_t v20 = PLStringFromPLMigrationActionTypeShort(self->_type);
        double v21 = self->_lifetimeToken;
        double v22 = CFAbsoluteTimeGetCurrent() - v21;
        if (v21 <= 0.0) {
          double v23 = 0.0;
        }
        else {
          double v23 = v22;
        }
        uint64_t v24 = self->_lifetimePerfCheck;
        if (v24)
        {
          __int16 v25 = [(PLTimedPerfCheck *)v24 perfCheckLogStringWithPerfCheckInfo:v3];
        }
        else
        {
          __int16 v25 = @", <perf check disabled>";
        }
        v28 = [(PLModelMigrationActionProcessor *)self _progressLogMessage];
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v20;
        *(_WORD *)&uint8_t buf[32] = 2048;
        *(double *)&buf[34] = v23;
        *(_WORD *)&buf[42] = 2114;
        *(void *)&buf[44] = v25;
        *(_WORD *)&buf[52] = 2114;
        *(void *)&buf[54] = v28;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed %{public}@ actions (type: %{public}@) %.2lfs%{public}@%{public}@", buf, 0x3Eu);
      }
    }
  }
  if (self->_loggerCloseRequired) {
    [(PLFileBackedLogger *)self->_logger close];
  }

  v30.receiver = self;
  v30.super_class = (Class)PLModelMigrationActionProcessor;
  [(PLModelMigrationActionProcessor *)&v30 dealloc];
}

- (void)_initialLog
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  self->_double lifetimeToken = CFAbsoluteTimeGetCurrent();
  v3 = [MEMORY[0x1E4F8BA00] start];
  lifetimePerfCheck = self->_lifetimePerfCheck;
  self->_lifetimePerfCheck = v3;

  BOOL v5 = [(PLModelMigrationActionProcessor *)self _generateActionMarker];
  double v6 = PLMigrationGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    if (self->_logger)
    {
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v72 = 0u;
      long long v70 = 0u;
      memset(v71, 0, sizeof(v71));
      memset(buf, 0, sizeof(buf));
      v8 = PLMigrationGetLog();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if ((unint64_t)(self->_type - 1) >= 5) {
        v9 = @"schema";
      }
      else {
        v9 = @"post migration";
      }
      BOOL v10 = v9;
      v11 = [MEMORY[0x1E4F8B888] currentBuildVersionString];
      double v12 = PLStringFromPLMigrationActionTypeShort(self->_type);
      qos_class_self();
      double v13 = PLShortStringFromQoSClass();
      id v14 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
      v15 = [v14 lastPathComponent];
      v68.dev_t st_dev = 138544642;
      *(void *)&v68.int st_mode = v5;
      WORD2(v68.st_ino) = 2114;
      *(__darwin_ino64_t *)((char *)&v68.st_ino + 6) = (__darwin_ino64_t)v10;
      HIWORD(v68.st_gid) = 2114;
      *(void *)&v68.dev_t st_rdev = v11;
      LOWORD(v68.st_atimespec.tv_sec) = 2114;
      *(__darwin_time_t *)((char *)&v68.st_atimespec.tv_sec + 2) = (__darwin_time_t)v12;
      WORD1(v68.st_atimespec.tv_nsec) = 2114;
      *(uint64_t *)((char *)&v68.st_atimespec.tv_nsec + 4) = (uint64_t)v13;
      WORD2(v68.st_mtimespec.tv_sec) = 2114;
      *(__darwin_time_t *)((char *)&v68.st_mtimespec.tv_sec + 6) = (__darwin_time_t)v15;
      LODWORD(v32) = 62;
      v16 = (uint8_t *)_os_log_send_and_compose_impl();

      -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v16, "PLModelMigrationActionProcessor.m", 132, 0, &v68, v32);
      if (v16 != buf) {
        free(v16);
      }
    }
    else
    {
      v17 = PLMigrationGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if ((unint64_t)(self->_type - 1) >= 5) {
          BOOL v18 = @"schema";
        }
        else {
          BOOL v18 = @"post migration";
        }
        v19 = v18;
        uint64_t v20 = [MEMORY[0x1E4F8B888] currentBuildVersionString];
        double v21 = PLStringFromPLMigrationActionTypeShort(self->_type);
        qos_class_self();
        double v22 = PLShortStringFromQoSClass();
        double v23 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
        uint64_t v24 = [v23 lastPathComponent];
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v20;
        *(_WORD *)&uint8_t buf[32] = 2114;
        *(void *)&buf[34] = v21;
        *(_WORD *)&buf[42] = 2114;
        *(void *)&buf[44] = v22;
        *(_WORD *)&buf[52] = 2114;
        *(void *)&buf[54] = v24;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Start of %{public}@ actions (OS Build: %{public}@) (type: %{public}@) (QoS: %{public}@): %{public}@", buf, 0x3Eu);
      }
    }
  }
  memset(&v68, 0, sizeof(v68));
  if (!self->_type)
  {
    id v25 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
    int v26 = stat((const char *)[v25 fileSystemRepresentation], &v68);

    if (!v26)
    {
      __bp[11] = 0;
      strcpy(__bp, "          ");
      strmode(v68.st_mode, __bp);
      __bp[10] = 0;
      __int16 v27 = PLMigrationGetLog();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

      if (v28)
      {
        if (self->_logger)
        {
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v72 = 0u;
          long long v70 = 0u;
          memset(v71, 0, sizeof(v71));
          memset(buf, 0, sizeof(buf));
          uint64_t v29 = PLMigrationGetLog();
          os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
          int v33 = 138547458;
          long long v34 = v5;
          __int16 v35 = 1024;
          dev_t st_dev = v68.st_dev;
          __int16 v37 = 2048;
          __darwin_ino64_t st_ino = v68.st_ino;
          __int16 v39 = 1024;
          int st_mode = v68.st_mode;
          __int16 v41 = 2080;
          long long v42 = __bp;
          __int16 v43 = 1024;
          int st_nlink = v68.st_nlink;
          __int16 v45 = 1024;
          uid_t st_uid = v68.st_uid;
          __int16 v47 = 1024;
          gid_t st_gid = v68.st_gid;
          __int16 v49 = 1024;
          dev_t st_rdev = v68.st_rdev;
          __int16 v51 = 2048;
          off_t st_size = v68.st_size;
          __int16 v53 = 2048;
          __darwin_time_t tv_sec = v68.st_atimespec.tv_sec;
          __int16 v55 = 2048;
          __darwin_time_t v56 = v68.st_mtimespec.tv_sec;
          __int16 v57 = 2048;
          __darwin_time_t v58 = v68.st_ctimespec.tv_sec;
          __int16 v59 = 2048;
          __darwin_time_t v60 = v68.st_birthtimespec.tv_sec;
          __int16 v61 = 1024;
          blksize_t st_blksize = v68.st_blksize;
          __int16 v63 = 2048;
          blkcnt_t st_blocks = v68.st_blocks;
          __int16 v65 = 1024;
          __uint32_t st_flags = v68.st_flags;
          LODWORD(v32) = 140;
          objc_super v30 = (uint8_t *)_os_log_send_and_compose_impl();

          -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActionProcessor.m", 140, 0, &v33, v32);
          if (v30 != buf) {
            free(v30);
          }
        }
        else
        {
          int v31 = PLMigrationGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138547458;
            *(void *)&buf[4] = v5;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v68.st_dev;
            *(_WORD *)&buf[18] = 2048;
            *(void *)&buf[20] = v68.st_ino;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v68.st_mode;
            *(_WORD *)&buf[34] = 2080;
            *(void *)&buf[36] = __bp;
            *(_WORD *)&buf[44] = 1024;
            *(_DWORD *)&buf[46] = v68.st_nlink;
            *(_WORD *)&buf[50] = 1024;
            *(_DWORD *)&buf[52] = v68.st_uid;
            *(_WORD *)&buf[56] = 1024;
            *(_DWORD *)&buf[58] = v68.st_gid;
            *(_WORD *)&buf[62] = 1024;
            LODWORD(v70) = v68.st_rdev;
            WORD2(v70) = 2048;
            *(void *)((char *)&v70 + 6) = v68.st_size;
            HIWORD(v70) = 2048;
            *(void *)&v71[0] = v68.st_atimespec.tv_sec;
            WORD4(v71[0]) = 2048;
            *(void *)((char *)v71 + 10) = v68.st_mtimespec.tv_sec;
            WORD1(v71[1]) = 2048;
            *(void *)((char *)&v71[1] + 4) = v68.st_ctimespec.tv_sec;
            WORD6(v71[1]) = 2048;
            *(void *)((char *)&v71[1] + 14) = v68.st_birthtimespec.tv_sec;
            WORD3(v71[2]) = 1024;
            DWORD2(v71[2]) = v68.st_blksize;
            WORD6(v71[2]) = 2048;
            *(void *)((char *)&v71[2] + 14) = v68.st_blocks;
            WORD3(v71[3]) = 1024;
            DWORD2(v71[3]) = v68.st_flags;
            _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ stat: st_dev=%d st_ino=%llu st_mode=%d (%s) st_nlink=%d st_uid=%d st_gid=%d st_rdev=%d st_size=%lld st_atime=%ld st_mtime=%ld st_ctime=%ld st_birthtime=%ld st_blksize=%d st_block=%lld st_flags=%d", buf, 0x8Cu);
          }
        }
      }
    }
  }
}

- (PLModelMigrationActionProcessor)initWithUUID:(id)a3 pathManager:(id)a4 migrationActionType:(int64_t)a5 analyticsEventManager:(id)a6 logger:(id)a7 progressUnitCount:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v29 = a6;
  id v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)PLModelMigrationActionProcessor;
  BOOL v18 = [(PLModelMigrationActionProcessor *)&v30 init];
  v19 = v18;
  if (v18)
  {
    v18->_success = 1;
    objc_storeStrong((id *)&v18->_uuid, a3);
    uint64_t v20 = [v15 substringToIndex:8];
    uint64_t v21 = [v20 copy];
    uuidTruncated = v19->_uuidTruncated;
    v19->_uuidTruncated = (NSString *)v21;

    objc_storeStrong((id *)&v19->_pathManager, a4);
    v19->_type = a5;
    objc_storeStrong((id *)&v19->_analyticsEventManager, a6);
    v19->_tag = 1;
    v19->_pid = getpid();
    if (a8)
    {
      uint64_t v23 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:a8];
      progress = v19->_progress;
      v19->_progress = (NSProgress *)v23;
    }
    else
    {
      progress = v19->_progress;
      v19->_progress = 0;
    }

    lifetimePerfCheck = v19->_lifetimePerfCheck;
    v19->_lifetimePerfCheck = 0;

    v19->_loggerCloseRequired = v17 == 0;
    if (v17)
    {
      int v26 = (PLFileBackedLogger *)v17;
    }
    else
    {
      int v26 = [MEMORY[0x1E4F8B8E0] setupWithLibraryIdentifier:0 type:1];
    }
    logger = v19->_logger;
    v19->_logger = v26;

    [(PLModelMigrationActionProcessor *)v19 _initialLog];
  }

  return v19;
}

@end
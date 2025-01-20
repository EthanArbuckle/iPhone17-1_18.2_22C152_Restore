@interface SignpostContextInfo
- (NSString)executablePath;
- (NSString)processName;
- (SignpostContextInfo)initWithContextInfoEvent:(id)a3;
- (int)pid;
- (unint64_t)earliestMCT;
- (unint64_t)inProcessAnimationDisplayTargetMCT;
- (unint64_t)previousPresentationMCT;
- (unsigned)contextId;
- (unsigned)frameSeed;
- (unsigned)transactionSeed;
@end

@implementation SignpostContextInfo

- (unint64_t)earliestMCT
{
  return self->_earliestMCT;
}

- (SignpostContextInfo)initWithContextInfoEvent:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SignpostContextInfo;
  v5 = [(SignpostContextInfo *)&v43 init];
  if (v5)
  {
    v5->_contextId = [v4 signpostId];
    v6 = [v4 _numberArgumentWithName:@"pid"];
    if (v6)
    {
      v7 = v6;
      v5->_pid = [v6 longLongValue];

      v8 = [v4 _numberArgumentWithName:@"frame_seed"];
      if (v8)
      {
        v9 = v8;
        v5->_frameSeed = [v8 unsignedLongLongValue];

        v10 = [v4 _numberArgumentWithName:@"earliest_mct"];
        if (v10)
        {
          v11 = v10;
          v5->_earliestMCT = [v10 unsignedLongLongValue];

          v12 = [v4 _numberArgumentWithName:@"previous_mct"];
          v13 = v12;
          if (v12) {
            v5->_previousPresentationMCT = [v12 unsignedLongLongValue];
          }

          v14 = [v4 _numberArgumentWithName:@"transaction_seed"];
          v15 = v14;
          if (v14) {
            v5->_transactionSeed = [v14 unsignedLongLongValue];
          }

          v16 = [v4 _numberArgumentWithName:@"presentation_modifier_display_target_mct"];
          v5->_inProcessAnimationDisplayTargetMCT = [v16 unsignedLongLongValue];

          uint64_t v17 = [v4 _stringArgumentWithName:@"process_name"];
          executablePath = v5->_executablePath;
          v5->_executablePath = (NSString *)v17;

          goto LABEL_10;
        }
        v20 = _signpost_debug_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[SignpostContextInfo initWithContextInfoEvent:](v20, v35, v36, v37, v38, v39, v40, v41);
        }
      }
      else
      {
        v20 = _signpost_debug_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[SignpostContextInfo initWithContextInfoEvent:](v20, v28, v29, v30, v31, v32, v33, v34);
        }
      }
    }
    else
    {
      v20 = _signpost_debug_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[SignpostContextInfo initWithContextInfoEvent:](v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }

    v19 = 0;
    goto LABEL_18;
  }
LABEL_10:
  v19 = v5;
LABEL_18:

  return v19;
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
}

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (NSString)processName
{
  v2 = [(SignpostContextInfo *)self executablePath];
  v3 = [v2 lastPathComponent];

  return (NSString *)v3;
}

- (unsigned)transactionSeed
{
  return self->_transactionSeed;
}

- (unint64_t)previousPresentationMCT
{
  return self->_previousPresentationMCT;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (unint64_t)inProcessAnimationDisplayTargetMCT
{
  return self->_inProcessAnimationDisplayTargetMCT;
}

- (void)initWithContextInfoEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithContextInfoEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithContextInfoEvent:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
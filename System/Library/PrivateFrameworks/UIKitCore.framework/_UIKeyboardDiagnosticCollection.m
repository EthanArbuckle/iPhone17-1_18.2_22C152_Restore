@interface _UIKeyboardDiagnosticCollection
+ (BOOL)_processIsEntitledForDiagnosticCollection;
+ (double)_matDurationToSeconds:(unint64_t)a3;
+ (id)_diagnosticQueue;
+ (void)_requestTailspinWithDescription:(id)a3 startMAT:(unint64_t)a4 endMAT:(unint64_t)a5 ifExceedsThresholdSec:(double)a6;
@end

@implementation _UIKeyboardDiagnosticCollection

+ (double)_matDurationToSeconds:(unint64_t)a3
{
  if (qword_1EB25EDF0 != -1) {
    dispatch_once(&qword_1EB25EDF0, &__block_literal_global_6);
  }
  return *(double *)&qword_1EB25EDF8 * (double)a3;
}

+ (BOOL)_processIsEntitledForDiagnosticCollection
{
  if (qword_1EB25EE00 != -1) {
    dispatch_once(&qword_1EB25EE00, &__block_literal_global_9);
  }
  return _MergedGlobals_928;
}

+ (id)_diagnosticQueue
{
  if (qword_1EB25EE10 != -1) {
    dispatch_once(&qword_1EB25EE10, &__block_literal_global_14);
  }
  v2 = (void *)qword_1EB25EE08;
  return v2;
}

+ (void)_requestTailspinWithDescription:(id)a3 startMAT:(unint64_t)a4 endMAT:(unint64_t)a5 ifExceedsThresholdSec:(double)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (MEMORY[0x1E4F5F3C8])
  {
    if (+[_UIKeyboardDiagnosticCollection _processIsEntitledForDiagnosticCollection])
    {
      +[_UIKeyboardDiagnosticCollection _matDurationToSeconds:a5 - a4];
      if (v10 > a6)
      {
        double v11 = v10;
        v12 = _UIKeyboardLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v20 = [v9 UTF8String];
          __int16 v21 = 2048;
          double v22 = v11;
          __int16 v23 = 2048;
          double v24 = a6;
          _os_log_error_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%s took %f which exceeded the threshold of %f. Attempting to save tailspin using DiagnosticPipeline.", buf, 0x20u);
        }

        v13 = +[_UIKeyboardDiagnosticCollection _diagnosticQueue];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __105___UIKeyboardDiagnosticCollection__requestTailspinWithDescription_startMAT_endMAT_ifExceedsThresholdSec___block_invoke;
        v14[3] = &unk_1E52DA260;
        double v16 = v11;
        unint64_t v17 = a4;
        unint64_t v18 = a5;
        id v15 = v9;
        dispatch_async(v13, v14);
      }
    }
  }
}

@end
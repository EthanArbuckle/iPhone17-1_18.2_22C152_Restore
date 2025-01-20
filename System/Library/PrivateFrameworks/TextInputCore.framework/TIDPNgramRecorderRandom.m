@interface TIDPNgramRecorderRandom
- (BOOL)report;
- (TIDPNgramRecorderRandom)initWithTypingSession:(id)a3 aligned:(id)a4 n:(unint64_t)a5;
@end

@implementation TIDPNgramRecorderRandom

- (BOOL)report
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint32_t v3 = arc4random_uniform([(TIDPNgramRecorderCascading *)self n] + 1);
  if (v3 <= 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = v3;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315394;
    v14 = "-[TIDPNgramRecorderRandom report]";
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Using random n value: %lu", (uint8_t *)&v13, 0x16u);
  }
  v5 = [TIDPNgramRecorder alloc];
  uint64_t v6 = [(TIDPRecorder *)self typingSession];
  v7 = [(TIDPRecorder *)self typingSessionAligned];
  v8 = [(TIDPNgramRecorder *)v5 initWithTypingSession:v6 aligned:v7 n:v4 shouldDonateNgramSampleRandomly:1];

  v9 = [(TIDPRecorder *)self delegate];
  NSClassFromString(&cfstr_Tidpreportermo.isa);
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if (v6)
  {
    v10 = [(TIDPRecorder *)self delegate];
    [(TIDPRecorder *)v8 setDelegate:v10];
  }
  BOOL v11 = [(TIDPNgramRecorder *)v8 report];

  return v11;
}

- (TIDPNgramRecorderRandom)initWithTypingSession:(id)a3 aligned:(id)a4 n:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TIDPNgramRecorderRandom;
  uint64_t v6 = [(TIDPRecorder *)&v10 initWithTypingSession:a3 aligned:a4];
  v7 = v6;
  if (v6)
  {
    if (a5) {
      unint64_t v8 = a5;
    }
    else {
      unint64_t v8 = 5;
    }
    [(TIDPNgramRecorderCascading *)v6 setN:v8];
  }
  return v7;
}

@end
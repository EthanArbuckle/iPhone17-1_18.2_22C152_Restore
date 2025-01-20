@interface TIDPNgramRecorderCascading
- (BOOL)report;
- (TIDPNgramRecorderCascading)initWithTypingSession:(id)a3 aligned:(id)a4 n:(unint64_t)a5;
- (unint64_t)n;
- (void)setN:(unint64_t)a3;
@end

@implementation TIDPNgramRecorderCascading

- (void)setN:(unint64_t)a3
{
  self->_n = a3;
}

- (unint64_t)n
{
  return self->_n;
}

- (BOOL)report
{
  unint64_t v3 = [(TIDPNgramRecorderCascading *)self n];
  if (v3 >= 2)
  {
    unint64_t v4 = v3;
    v5 = 0;
    do
    {
      v6 = v5;
      v7 = [TIDPNgramRecorder alloc];
      v8 = [(TIDPRecorder *)self typingSession];
      uint64_t v9 = [(TIDPRecorder *)self typingSessionAligned];
      v5 = [(TIDPNgramRecorderCascading *)v7 initWithTypingSession:v8 aligned:v9 n:v4];

      v10 = [(TIDPRecorder *)self delegate];
      NSClassFromString(&cfstr_Tidpreportermo.isa);
      LOBYTE(v9) = objc_opt_isKindOfClass();

      if (v9)
      {
        v11 = [(TIDPRecorder *)self delegate];
        [(TIDPRecorder *)v5 setDelegate:v11];
      }
      [(TIDPNgramRecorder *)v5 report];
      --v4;
    }
    while (v4 > 1);
  }
  return 0;
}

- (TIDPNgramRecorderCascading)initWithTypingSession:(id)a3 aligned:(id)a4 n:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TIDPNgramRecorderCascading;
  v6 = [(TIDPRecorder *)&v10 initWithTypingSession:a3 aligned:a4];
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
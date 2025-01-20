@interface WFOperation
- (BOOL)isFinished;
- (BOOL)isReady;
- (NSError)error;
- (id)description;
- (void)finish;
- (void)setError:(id)a3;
- (void)start;
@end

@implementation WFOperation

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isReady
{
  return 1;
}

- (void)start
{
  self->_finished = 0;
  v3 = [MEMORY[0x263EFF910] date];
  start = self->_start;
  self->_start = v3;
  MEMORY[0x270F9A758](v3, start);
}

- (void)finish
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      v6 = [(WFOperation *)self name];
      [(NSDate *)self->_start timeIntervalSinceNow];
      int v8 = 138412546;
      v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      _os_log_impl(&dword_226071000, v5, v4, "%@ finished.  Elapsed: %f seconds.", (uint8_t *)&v8, 0x16u);
    }
  }

  [(WFOperation *)self willChangeValueForKey:@"isFinished"];
  self->_finished = 1;
  [(WFOperation *)self didChangeValueForKey:@"isFinished"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  os_log_type_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ : %p", v5, self];

  uint64_t v7 = [(WFOperation *)self name];

  if (v7)
  {
    int v8 = [(WFOperation *)self name];
    [v6 appendFormat:@" %@", v8];
  }
  start = self->_start;
  if (start)
  {
    [(NSDate *)start timeIntervalSinceNow];
    objc_msgSend(v6, "appendFormat:", @" started: %f seconds", -v10);
  }
  [v6 appendString:@">"];
  return v6;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
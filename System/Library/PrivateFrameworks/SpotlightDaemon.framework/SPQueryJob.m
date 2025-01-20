@interface SPQueryJob
- (NSString)dataclass;
- (SPQueryJob)initWithSIJob:(__SIJobRef *)a3 dataclass:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6;
- (SPQueryResultsQueue)resultsQueue;
- (__SIJobRef)siJob;
- (id)resultsHandler;
- (void)cancel;
- (void)dealloc;
- (void)setDataclass:(id)a3;
- (void)setResultsHandler:(id)a3;
- (void)setResultsQueue:(id)a3;
- (void)setSiJob:(__SIJobRef *)a3;
@end

@implementation SPQueryJob

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_destroyWeak((id *)&self->_resultsQueue);
  objc_storeStrong((id *)&self->_dataclass, 0);
}

- (__SIJobRef)siJob
{
  return self->_siJob;
}

- (void)setResultsQueue:(id)a3
{
}

- (SPQueryJob)initWithSIJob:(__SIJobRef *)a3 dataclass:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SPQueryJob;
  v12 = [(SPQueryJob *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_siJob = a3;
    objc_storeStrong((id *)&v12->_dataclass, a4);
    uint64_t v14 = MEMORY[0x223C48320](v11);
    id resultsHandler = v13->_resultsHandler;
    v13->_id resultsHandler = (id)v14;
  }
  return v13;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (void)setResultsHandler:(id)a3
{
}

- (void)dealloc
{
  if (self->_siJob)
  {
    SICancel();
    self->_siJob = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SPQueryJob;
  [(SPQueryJob *)&v3 dealloc];
}

- (void)cancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultsQueue);
  [WeakRetained cancelJob:self];
}

- (void)setSiJob:(__SIJobRef *)a3
{
  self->_siJob = a3;
}

- (void)setDataclass:(id)a3
{
}

- (SPQueryResultsQueue)resultsQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultsQueue);
  return (SPQueryResultsQueue *)WeakRetained;
}

@end
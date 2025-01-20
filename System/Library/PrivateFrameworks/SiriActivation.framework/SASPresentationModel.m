@interface SASPresentationModel
- (NSMutableArray)enqueuedButtonEventCompletions;
- (NSTimer)pingTimer;
- (SASPresentationModel)initWithPresentationServer:(id)a3;
- (SASPresentationServer)presentationServer;
- (SASPresentationState)presentationState;
- (int64_t)requestState;
- (void)flushEnqueuedButtonEventCompletions;
- (void)setEnqueuedButtonEventCompletions:(id)a3;
- (void)setPingTimer:(id)a3;
- (void)setPresentationState:(id)a3;
- (void)setRequestState:(int64_t)a3;
@end

@implementation SASPresentationModel

- (int64_t)requestState
{
  return self->_requestState;
}

- (SASPresentationModel)initWithPresentationServer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SASPresentationModel;
  v6 = [(SASPresentationModel *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentationServer, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    enqueuedButtonEventCompletions = v7->_enqueuedButtonEventCompletions;
    v7->_enqueuedButtonEventCompletions = v8;
  }
  return v7;
}

- (void)flushEnqueuedButtonEventCompletions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_enqueuedButtonEventCompletions count])
  {
    v3 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      enqueuedButtonEventCompletions = self->_enqueuedButtonEventCompletions;
      id v5 = v3;
      *(_DWORD *)buf = 136315394;
      v19 = "-[SASPresentationModel flushEnqueuedButtonEventCompletions]";
      __int16 v20 = 2048;
      uint64_t v21 = [(NSMutableArray *)enqueuedButtonEventCompletions count];
      _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation sending completions for %lu cached event(s)", buf, 0x16u);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = self->_enqueuedButtonEventCompletions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          v12 = [(SASPresentationModel *)self presentationServer];
          (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(NSMutableArray *)self->_enqueuedButtonEventCompletions removeAllObjects];
  }
}

- (SASPresentationServer)presentationServer
{
  return self->_presentationServer;
}

- (void)setRequestState:(int64_t)a3
{
  self->_requestState = a3;
}

- (NSMutableArray)enqueuedButtonEventCompletions
{
  return self->_enqueuedButtonEventCompletions;
}

- (void)setEnqueuedButtonEventCompletions:(id)a3
{
}

- (NSTimer)pingTimer
{
  return self->_pingTimer;
}

- (void)setPingTimer:(id)a3
{
}

- (SASPresentationState)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationState, 0);
  objc_storeStrong((id *)&self->_pingTimer, 0);
  objc_storeStrong((id *)&self->_enqueuedButtonEventCompletions, 0);
  objc_storeStrong((id *)&self->_presentationServer, 0);
}

@end
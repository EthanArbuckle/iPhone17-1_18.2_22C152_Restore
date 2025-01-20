@interface PKDASession
- (BOOL)startSession;
- (DASession)session;
- (NSString)description;
- (PKDASession)initWithDelegate:(id)a3;
- (PKSessionDelegate)delegate;
- (unint64_t)state;
- (void)daSession:(id)a3 didBecomeActive:(id)a4;
- (void)daSession:(id)a3 didEnd:(id)a4;
- (void)dealloc;
- (void)endSession;
- (void)setDelegate:(id)a3;
- (void)setSession:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation PKDASession

- (PKDASession)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(PKDASession *)self init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    atomic_store(1u, &v6->_sessionState);
  }

  return v6;
}

- (void)dealloc
{
  if ([(PKDASession *)self state] != 3) {
    [(PKDASession *)self endSession];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKDASession;
  [(PKDASession *)&v3 dealloc];
}

- (unint64_t)state
{
  return atomic_load(&self->_sessionState);
}

- (void)setState:(unint64_t)a3
{
}

- (void)endSession
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Ending DA Session %@", (uint8_t *)&v4, 0xCu);
  }

  [(DASession *)self->_session endSession];
}

- (BOOL)startSession
{
  return 0;
}

- (NSString)description
{
  objc_super v3 = NSString;
  int v4 = self->_session;
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; state: %ld; session: %@ >",
    objc_opt_class(),
    self,
    [(PKDASession *)self state],
  v5 = v4);

  return (NSString *)v5;
}

- (void)daSession:(id)a3 didBecomeActive:(id)a4
{
  atomic_store(2u, &self->_sessionState);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained session:self didChangeState:2];
  }
}

- (void)daSession:(id)a3 didEnd:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  atomic_store(3u, &self->_sessionState);
  v8 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9) {
      goto LABEL_7;
    }
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    v10 = "Session %@ invalidated with error %@";
    v11 = v8;
    uint32_t v12 = 22;
  }
  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    int v15 = 138412290;
    id v16 = v6;
    v10 = "Session %@ has ended";
    v11 = v8;
    uint32_t v12 = 12;
  }
  _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
LABEL_7:

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained session:self didChangeState:3];
  }
  session = self->_session;
  self->_session = 0;
}

- (PKSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DASession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
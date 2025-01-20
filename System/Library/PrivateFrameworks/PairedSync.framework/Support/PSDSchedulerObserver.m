@interface PSDSchedulerObserver
- (PSDSchedulerObserver)initWithObserver:(id)a3;
- (PSDSchedulerObserver)observer;
- (void)scheduler:(id)a3 didClearSyncSession:(id)a4 withBlock:(id)a5;
- (void)scheduler:(id)a3 didUpdateSyncSessionWithUpdate:(id)a4;
- (void)scheduler:(id)a3 willStartSyncSession:(id)a4;
- (void)setObserver:(id)a3;
@end

@implementation PSDSchedulerObserver

- (PSDSchedulerObserver)initWithObserver:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSDSchedulerObserver;
  v5 = [(PSDSchedulerObserver *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_observer, v4);
    *(unsigned char *)&v6->_flags = *(unsigned char *)&v6->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&v6->_flags = *(unsigned char *)&v6->_flags & 0xFD | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 4;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&v6->_flags = *(unsigned char *)&v6->_flags & 0xFB | v8;
  }

  return v6;
}

- (void)scheduler:(id)a3 willStartSyncSession:(id)a4
{
  if (*(unsigned char *)&self->_flags)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(PSDSchedulerObserver *)self observer];
    [v8 scheduler:v7 willStartSyncSession:v6];
  }
}

- (void)scheduler:(id)a3 didUpdateSyncSessionWithUpdate:(id)a4
{
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(PSDSchedulerObserver *)self observer];
    [v8 scheduler:v7 didUpdateSyncSessionWithUpdate:v6];
  }
}

- (void)scheduler:(id)a3 didClearSyncSession:(id)a4 withBlock:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  if ((*(unsigned char *)&self->_flags & 4) != 0
    && ([(PSDSchedulerObserver *)self observer],
        objc_super v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    v11 = [(PSDSchedulerObserver *)self observer];
    [v11 scheduler:v12 didClearSyncSession:v8 withBlock:v9];
  }
  else
  {
    v9[2](v9);
  }
}

- (PSDSchedulerObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (PSDSchedulerObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
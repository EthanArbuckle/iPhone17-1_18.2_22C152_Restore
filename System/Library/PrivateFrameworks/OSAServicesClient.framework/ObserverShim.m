@interface ObserverShim
- (BOOL)matches:(id)a3;
- (OSADiagnosticObserver)observer;
- (ObserverShim)initWithObserver:(id)a3;
- (void)didReceiveDiagnosticLog:(id)a3 ofType:(id)a4 details:(id)a5;
- (void)didWriteDiagnosticLog:(id)a3 ofType:(id)a4 toPath:(id)a5;
- (void)failedToWriteDiagnosticLog:(id)a3 ofType:(id)a4 error:(id)a5;
@end

@implementation ObserverShim

- (ObserverShim)initWithObserver:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ObserverShim;
  v5 = [(ObserverShim *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_observer, v4);
  }

  return v6;
}

- (BOOL)matches:(id)a3
{
  p_observer = &self->_observer;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_observer);

  return WeakRetained == v4;
}

- (void)didReceiveDiagnosticLog:(id)a3 ofType:(id)a4 details:(id)a5
{
  p_observer = &self->_observer;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_observer);
  [WeakRetained willWriteDiagnosticLog:v9 logId:v10 logInfo:v8];
}

- (void)didWriteDiagnosticLog:(id)a3 ofType:(id)a4 toPath:(id)a5
{
  p_observer = &self->_observer;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_observer);
  [WeakRetained didWriteDiagnosticLog:v9 logId:v10 logFilePath:v8 logInfo:MEMORY[0x1E4F1CC08] error:0];
}

- (void)failedToWriteDiagnosticLog:(id)a3 ofType:(id)a4 error:(id)a5
{
  p_observer = &self->_observer;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_observer);
  [WeakRetained didWriteDiagnosticLog:v9 logId:v10 logFilePath:0 logInfo:MEMORY[0x1E4F1CC08] error:v8];
}

- (OSADiagnosticObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (OSADiagnosticObserver *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
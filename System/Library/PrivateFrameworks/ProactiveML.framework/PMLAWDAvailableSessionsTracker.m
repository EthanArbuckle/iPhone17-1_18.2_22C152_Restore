@interface PMLAWDAvailableSessionsTracker
- (PMLAWDAvailableSessionsTracker)init;
- (PMLAWDAvailableSessionsTracker)initWithAWDConnection:(id)a3;
- (void)reportStatsToAWD;
- (void)setAWDMetricQueryDelegate:(id)a3;
@end

@implementation PMLAWDAvailableSessionsTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awdServerConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)reportStatsToAWD
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained availableSessionsStatsReportedToAWD];
  }
  else
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PMLAWDAvailableSessionsTracker.m" lineNumber:54 description:@"Missing delegate to handle AWD metric request."];
  }
}

- (void)setAWDMetricQueryDelegate:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PMLAWDAvailableSessionsTracker.m" lineNumber:41 description:@"AWD metric query delegate can only be set once"];
  }
  objc_storeWeak((id *)&self->_delegate, v5);
  id location = 0;
  objc_initWeak(&location, self);
  awdServerConnection = self->_awdServerConnection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__PMLAWDAvailableSessionsTracker_setAWDMetricQueryDelegate___block_invoke;
  v9[3] = &unk_26459F770;
  objc_copyWeak(&v10, &location);
  [(AWDServerConnection *)awdServerConnection registerQueriableMetric:5636103 callback:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__PMLAWDAvailableSessionsTracker_setAWDMetricQueryDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reportStatsToAWD];
}

- (PMLAWDAvailableSessionsTracker)initWithAWDConnection:(id)a3
{
  id v5 = a3;
  id v6 = objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)PMLAWDAvailableSessionsTracker;
  v7 = [(PMLAWDBaseTracker *)&v9 initWithModel:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_awdServerConnection, a3);
  }

  return v7;
}

- (PMLAWDAvailableSessionsTracker)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F864B0]) initWithComponentId:86];
  v4 = [(PMLAWDAvailableSessionsTracker *)self initWithAWDConnection:v3];

  return v4;
}

@end
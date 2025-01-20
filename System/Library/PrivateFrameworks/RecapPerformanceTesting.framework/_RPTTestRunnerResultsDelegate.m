@interface _RPTTestRunnerResultsDelegate
- (BOOL)testRunner:(id)a3 shouldManagePPTLifetimeEvent:(int64_t)a4 forParamaters:(id)a5;
- (id)resultsHandler;
- (void)setResultsHandler:(id)a3;
- (void)testRunner:(id)a3 didFailRunningParameters:(id)a4 withError:(id)a5;
- (void)testRunner:(id)a3 didFinishRunningParameters:(id)a4;
@end

@implementation _RPTTestRunnerResultsDelegate

- (void)testRunner:(id)a3 didFinishRunningParameters:(id)a4
{
  id v4 = [(_RPTTestRunnerResultsDelegate *)self resultsHandler];
  (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
}

- (void)testRunner:(id)a3 didFailRunningParameters:(id)a4 withError:(id)a5
{
  id v6 = a5;
  v7 = [(_RPTTestRunnerResultsDelegate *)self resultsHandler];
  v7[2](v7, 1, v6);
}

- (BOOL)testRunner:(id)a3 shouldManagePPTLifetimeEvent:(int64_t)a4 forParamaters:(id)a5
{
  return 0;
}

- (id)resultsHandler
{
  return self->resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
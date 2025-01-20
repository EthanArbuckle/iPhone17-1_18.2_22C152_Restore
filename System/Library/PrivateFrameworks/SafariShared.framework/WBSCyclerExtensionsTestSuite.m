@interface WBSCyclerExtensionsTestSuite
- (NSArray)operations;
- (WBSCyclerIterationCounter)iterationCounter;
- (id)relativeProbabilitiesForOperationsWithTopLevelItem:(id)a3;
- (void)runWithTarget:(id)a3 completionHandler:(id)a4;
- (void)setIterationCounter:(id)a3;
@end

@implementation WBSCyclerExtensionsTestSuite

- (NSArray)operations
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)relativeProbabilitiesForOperationsWithTopLevelItem:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)runWithTarget:(id)a3 completionHandler:(id)a4
{
  iterationCounter = self->_iterationCounter;
  v5 = (void (**)(id, void))a4;
  [(WBSCyclerIterationCounter *)iterationCounter incrementIterationCount];
  v5[2](v5, 0);
}

- (WBSCyclerIterationCounter)iterationCounter
{
  return self->_iterationCounter;
}

- (void)setIterationCounter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
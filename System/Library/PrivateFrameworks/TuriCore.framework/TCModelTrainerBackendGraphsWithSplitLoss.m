@interface TCModelTrainerBackendGraphsWithSplitLoss
- (MLCTrainingGraph)lossGraph;
- (NSDictionary)lossGraphInputs;
- (NSDictionary)lossGraphOutputs;
- (void)setLossGraph:(id)a3;
- (void)setLossGraphInputs:(id)a3;
- (void)setLossGraphOutputs:(id)a3;
@end

@implementation TCModelTrainerBackendGraphsWithSplitLoss

- (MLCTrainingGraph)lossGraph
{
  return self->_lossGraph;
}

- (void)setLossGraph:(id)a3
{
}

- (NSDictionary)lossGraphInputs
{
  return self->_lossGraphInputs;
}

- (void)setLossGraphInputs:(id)a3
{
}

- (NSDictionary)lossGraphOutputs
{
  return self->_lossGraphOutputs;
}

- (void)setLossGraphOutputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lossGraphOutputs, 0);
  objc_storeStrong((id *)&self->_lossGraphInputs, 0);
  objc_storeStrong((id *)&self->_lossGraph, 0);
}

@end
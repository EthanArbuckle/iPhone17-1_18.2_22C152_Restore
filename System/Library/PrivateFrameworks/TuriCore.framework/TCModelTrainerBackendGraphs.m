@interface TCModelTrainerBackendGraphs
- (MLCInferenceGraph)inferenceGraph;
- (MLCTrainingGraph)trainingGraph;
- (NSDictionary)inferenceInputs;
- (NSDictionary)inferenceOutputs;
- (NSDictionary)layerWeights;
- (NSDictionary)trainingInputs;
- (NSDictionary)trainingLossLabelWeights;
- (NSDictionary)trainingLossLabels;
- (NSDictionary)trainingOutputs;
- (void)setInferenceGraph:(id)a3;
- (void)setInferenceInputs:(id)a3;
- (void)setInferenceOutputs:(id)a3;
- (void)setLayerWeights:(id)a3;
- (void)setTrainingGraph:(id)a3;
- (void)setTrainingInputs:(id)a3;
- (void)setTrainingLossLabelWeights:(id)a3;
- (void)setTrainingLossLabels:(id)a3;
- (void)setTrainingOutputs:(id)a3;
@end

@implementation TCModelTrainerBackendGraphs

- (MLCTrainingGraph)trainingGraph
{
  return self->_trainingGraph;
}

- (void)setTrainingGraph:(id)a3
{
}

- (NSDictionary)trainingInputs
{
  return self->_trainingInputs;
}

- (void)setTrainingInputs:(id)a3
{
}

- (NSDictionary)trainingLossLabels
{
  return self->_trainingLossLabels;
}

- (void)setTrainingLossLabels:(id)a3
{
}

- (NSDictionary)trainingLossLabelWeights
{
  return self->_trainingLossLabelWeights;
}

- (void)setTrainingLossLabelWeights:(id)a3
{
}

- (NSDictionary)trainingOutputs
{
  return self->_trainingOutputs;
}

- (void)setTrainingOutputs:(id)a3
{
}

- (MLCInferenceGraph)inferenceGraph
{
  return self->_inferenceGraph;
}

- (void)setInferenceGraph:(id)a3
{
}

- (NSDictionary)inferenceInputs
{
  return self->_inferenceInputs;
}

- (void)setInferenceInputs:(id)a3
{
}

- (NSDictionary)inferenceOutputs
{
  return self->_inferenceOutputs;
}

- (void)setInferenceOutputs:(id)a3
{
}

- (NSDictionary)layerWeights
{
  return self->_layerWeights;
}

- (void)setLayerWeights:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerWeights, 0);
  objc_storeStrong((id *)&self->_inferenceOutputs, 0);
  objc_storeStrong((id *)&self->_inferenceInputs, 0);
  objc_storeStrong((id *)&self->_inferenceGraph, 0);
  objc_storeStrong((id *)&self->_trainingOutputs, 0);
  objc_storeStrong((id *)&self->_trainingLossLabelWeights, 0);
  objc_storeStrong((id *)&self->_trainingLossLabels, 0);
  objc_storeStrong((id *)&self->_trainingInputs, 0);
  objc_storeStrong((id *)&self->_trainingGraph, 0);
}

@end
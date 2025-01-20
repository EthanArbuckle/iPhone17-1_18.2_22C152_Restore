@interface RawNightModeDenoiseInferenceData
- (NSDictionary)rawNightModeTuningParameters;
- (NSNumber)tilePadding;
- (RawNightModeDenoiseInferenceInputs)inputs;
- (RawNightModeDenoiseInferenceOutputs)outputs;
- (void)setInputs:(id)a3;
- (void)setOutputs:(id)a3;
- (void)setRawNightModeTuningParameters:(id)a3;
- (void)setTilePadding:(id)a3;
@end

@implementation RawNightModeDenoiseInferenceData

- (NSNumber)tilePadding
{
  return self->_tilePadding;
}

- (void)setTilePadding:(id)a3
{
  self->_tilePadding = (NSNumber *)a3;
}

- (NSDictionary)rawNightModeTuningParameters
{
  return self->_rawNightModeTuningParameters;
}

- (void)setRawNightModeTuningParameters:(id)a3
{
}

- (RawNightModeDenoiseInferenceInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (RawNightModeDenoiseInferenceOutputs)outputs
{
  return self->_outputs;
}

- (void)setOutputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);

  objc_storeStrong((id *)&self->_rawNightModeTuningParameters, 0);
}

@end
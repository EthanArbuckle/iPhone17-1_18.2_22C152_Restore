@interface _PXVideoStabilizeResult
- (AVAsset)outputVideoAsset;
- (AVAudioMix)outputAudioMix;
- (AVVideoComposition)outputVideoComposition;
- (NSDictionary)debugInfo;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)stabilizationRecipe;
- (NSError)error;
- (PXVideoStabilizeOperationSpec)spec;
- (unint64_t)analysisType;
- (void)setAnalysisType:(unint64_t)a3;
- (void)setDebugInfo:(id)a3;
- (void)setError:(id)a3;
- (void)setOutputAudioMix:(id)a3;
- (void)setOutputVideoAsset:(id)a3;
- (void)setOutputVideoComposition:(id)a3;
- (void)setSpec:(id)a3;
- (void)setStabilizationRecipe:(id)a3;
@end

@implementation _PXVideoStabilizeResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_stabilizationRecipe, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_outputVideoComposition, 0);
  objc_storeStrong((id *)&self->_outputVideoAsset, 0);
  objc_storeStrong((id *)&self->_outputAudioMix, 0);
}

- (void)setDebugInfo:(id)a3
{
}

- (NSDictionary)debugInfo
{
  return self->_debugInfo;
}

- (void)setStabilizationRecipe:(id)a3
{
}

- (NSDictionary)stabilizationRecipe
{
  return self->_stabilizationRecipe;
}

- (void)setAnalysisType:(unint64_t)a3
{
  self->_analysisType = a3;
}

- (unint64_t)analysisType
{
  return self->_analysisType;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setSpec:(id)a3
{
}

- (PXVideoStabilizeOperationSpec)spec
{
  return self->_spec;
}

- (void)setOutputVideoComposition:(id)a3
{
}

- (AVVideoComposition)outputVideoComposition
{
  return self->_outputVideoComposition;
}

- (void)setOutputVideoAsset:(id)a3
{
}

- (AVAsset)outputVideoAsset
{
  return self->_outputVideoAsset;
}

- (void)setOutputAudioMix:(id)a3
{
}

- (AVAudioMix)outputAudioMix
{
  return self->_outputAudioMix;
}

- (NSDictionary)dictionaryRepresentation
{
  v38[4] = *MEMORY[0x1E4F143B8];
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v37[0] = @"Device Type";
  uint64_t v3 = MGCopyAnswer();
  v4 = (void *)v3;
  v5 = @"Unknown";
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v38[0] = v5;
  v37[1] = @"Video URL";
  v29 = [(_PXVideoStabilizeResult *)self spec];
  v28 = [v29 inputVideoURL];
  v6 = [v28 description];
  v38[1] = v6;
  v37[2] = @"Start Time";
  v7 = [(_PXVideoStabilizeResult *)self spec];
  v8 = v7;
  if (v7) {
    [v7 startTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  v9 = (__CFString *)CMTimeCopyDescription(0, &time);
  v38[2] = v9;
  v37[3] = @"Trim Range";
  v10 = [(_PXVideoStabilizeResult *)self spec];
  v11 = v10;
  if (v10) {
    [v10 timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  v12 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
  v38[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:4];
  [v30 setObject:v13 forKeyedSubscript:@"input"];

  v35[0] = @"Error";
  v14 = [(_PXVideoStabilizeResult *)self error];
  uint64_t v15 = [v14 description];
  v16 = (void *)v15;
  v17 = @"None";
  if (v15) {
    v17 = (__CFString *)v15;
  }
  v36[0] = v17;
  v35[1] = @"Analysis Type";
  v18 = PXVideoStabilizeAnalysisTypeDescription([(_PXVideoStabilizeResult *)self analysisType]);
  v36[1] = v18;
  v35[2] = @"Recipe Source Info";
  uint64_t v19 = [(_PXVideoStabilizeResult *)self debugInfo];
  v20 = (void *)v19;
  uint64_t v21 = MEMORY[0x1E4F1CC08];
  if (v19) {
    uint64_t v21 = v19;
  }
  v36[2] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
  [v30 setObject:v22 forKeyedSubscript:@"output"];

  v23 = [(_PXVideoStabilizeResult *)self stabilizationRecipe];

  if (v23)
  {
    v33 = @"InertiaCam Output";
    v24 = [(_PXVideoStabilizeResult *)self stabilizationRecipe];
    v34 = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v30 setObject:v25 forKeyedSubscript:@"recipe"];
  }
  v26 = (void *)[v30 copy];

  return (NSDictionary *)v26;
}

@end
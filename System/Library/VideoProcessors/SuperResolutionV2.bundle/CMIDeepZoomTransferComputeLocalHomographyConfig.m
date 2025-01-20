@interface CMIDeepZoomTransferComputeLocalHomographyConfig
- (BOOL)useFlowWeightedAverage;
- (CMIDeepZoomTransferComputeLocalHomographyConfig)init;
- (NSArray)dxPoints;
- (NSArray)dyPoints;
- (int)readPlist:(id)a3;
- (void)setDxPoints:(id)a3;
- (void)setDyPoints:(id)a3;
- (void)setUseFlowWeightedAverage:(BOOL)a3;
@end

@implementation CMIDeepZoomTransferComputeLocalHomographyConfig

- (CMIDeepZoomTransferComputeLocalHomographyConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMIDeepZoomTransferComputeLocalHomographyConfig;
  result = [(CMIDeepZoomTransferComputeLocalHomographyConfig *)&v3 init];
  if (result) {
    result->_useFlowWeightedAverage = 0;
  }
  return result;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [v4 allKeys];
    v6 = [v5 objectAtIndexedSubscript:0];

    if (!v6)
    {
      int v17 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v7 = [v4 objectForKeyedSubscript:v6];
    if (v7)
    {
      if (FigGetCFPreferenceNumberWithDefault())
      {
        v8 = [v7 objectForKeyedSubscript:@"UseFlowWeightedAverage"];
        self->_useFlowWeightedAverage = [v8 BOOLValue];

        if (self->_useFlowWeightedAverage)
        {
          v9 = [v7 objectForKeyedSubscript:@"FlowWeightCurveDx"];
          v10 = (NSArray *)[v9 copy];
          dxPoints = self->_dxPoints;
          self->_dxPoints = v10;

          v12 = [v7 objectForKeyedSubscript:@"FlowWeightCurveDy"];
          v13 = (NSArray *)[v12 copy];
          dyPoints = self->_dyPoints;
          self->_dyPoints = v13;

          v15 = self->_dxPoints;
          if (!v15 || (id v16 = [(NSArray *)v15 count], v16 != (id)[(NSArray *)self->_dyPoints count]))
          {
            int v17 = -12780;
LABEL_13:

            goto LABEL_14;
          }
        }
      }
      else
      {
        self->_useFlowWeightedAverage = 0;
      }
    }
    int v17 = 0;
    goto LABEL_13;
  }
  int v17 = 0;
LABEL_15:

  return v17;
}

- (BOOL)useFlowWeightedAverage
{
  return self->_useFlowWeightedAverage;
}

- (void)setUseFlowWeightedAverage:(BOOL)a3
{
  self->_useFlowWeightedAverage = a3;
}

- (NSArray)dxPoints
{
  return self->_dxPoints;
}

- (void)setDxPoints:(id)a3
{
}

- (NSArray)dyPoints
{
  return self->_dyPoints;
}

- (void)setDyPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dyPoints, 0);

  objc_storeStrong((id *)&self->_dxPoints, 0);
}

@end
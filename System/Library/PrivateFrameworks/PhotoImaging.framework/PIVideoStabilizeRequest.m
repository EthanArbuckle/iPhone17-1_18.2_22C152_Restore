@interface PIVideoStabilizeRequest
+ (BOOL)canPerformGyroBasedStabilizationForAsset:(id)a3;
- (PIVideoStabilizeRequest)initWithComposition:(id)a3;
- (double)allowedCropFraction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (id)progressHandler;
- (int64_t)mediaComponentType;
- (unint64_t)allowedAnalysisTypes;
- (void)setAllowedAnalysisTypes:(unint64_t)a3;
- (void)setAllowedCropFraction:(double)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation PIVideoStabilizeRequest

- (void).cxx_destruct
{
}

- (void)setAllowedAnalysisTypes:(unint64_t)a3
{
  self->_allowedAnalysisTypes = a3;
}

- (unint64_t)allowedAnalysisTypes
{
  return self->_allowedAnalysisTypes;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setAllowedCropFraction:(double)a3
{
  self->_allowedCropFraction = a3;
}

- (double)allowedCropFraction
{
  return self->_allowedCropFraction;
}

- (int64_t)mediaComponentType
{
  return 2;
}

- (id)newRenderJob
{
  v3 = [(NURenderJob *)[PIVideoStabilizeRenderJob alloc] initWithRequest:self];
  [(PIVideoStabilizeRequest *)self allowedCropFraction];
  -[PIVideoStabilizeRenderJob setAllowedCropFraction:](v3, "setAllowedCropFraction:");
  v4 = [(PIVideoStabilizeRequest *)self progressHandler];
  [(PIVideoStabilizeRenderJob *)v3 setProgressHandler:v4];

  [(PIVideoStabilizeRenderJob *)v3 setAllowedAnalysisTypes:[(PIVideoStabilizeRequest *)self allowedAnalysisTypes]];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PIVideoStabilizeRequest;
  id v4 = [(NURenderRequest *)&v6 copyWithZone:a3];
  [v4 setAllowedCropFraction:self->_allowedCropFraction];
  [v4 setProgressHandler:self->_progressHandler];
  [v4 setAllowedAnalysisTypes:self->_allowedAnalysisTypes];
  return v4;
}

- (PIVideoStabilizeRequest)initWithComposition:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PIVideoStabilizeRequest;
  v3 = [(NURenderRequest *)&v8 initWithComposition:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_allowedCropFraction = 0.1;
    v3->_allowedAnalysisTypes = 3;
    v5 = +[PIPipelineFilters sourceFilterNoOrientation];
    v9[0] = v5;
    objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [(NURenderRequest *)v4 setPipelineFilters:v6];
  }
  return v4;
}

+ (BOOL)canPerformGyroBasedStabilizationForAsset:(id)a3
{
  return +[PIVideoReframeMetadataExtractor canProvideMetadataForAVAsset:a3];
}

@end
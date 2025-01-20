@interface PXStoryExportConfiguration
- (NSString)activityCategory;
- (NSString)activityType;
- (PXExtendedTraitCollection)extendedTraitCollection;
- (PXStoryConfiguration)storyConfiguration;
- (PXStoryErrorReporter)errorReporter;
- (PXStoryExportConfiguration)initWithConfiguration:(id)a3 videoOptions:(id)a4;
- (PXStoryExportConfiguration)initWithConfiguration:(id)a3 videoOptions:(id)a4 builder:(id)a5;
- (PXStoryExportVideoOptions)videoOptions;
- (void)copyOptionalPropertiesFromOtherExportConfiguration:(id)a3;
- (void)setActivityCategory:(id)a3;
- (void)setActivityType:(id)a3;
- (void)setErrorReporter:(id)a3;
@end

@implementation PXStoryExportConfiguration

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_errorReporter);
  objc_storeStrong((id *)&self->_activityCategory, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_storyConfiguration, 0);
  objc_storeStrong((id *)&self->_videoOptions, 0);
}

- (void)setErrorReporter:(id)a3
{
}

- (PXStoryErrorReporter)errorReporter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_errorReporter);
  return (PXStoryErrorReporter *)WeakRetained;
}

- (void)setActivityCategory:(id)a3
{
}

- (NSString)activityCategory
{
  return self->_activityCategory;
}

- (void)setActivityType:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (PXStoryConfiguration)storyConfiguration
{
  return self->_storyConfiguration;
}

- (PXStoryExportVideoOptions)videoOptions
{
  return self->_videoOptions;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  v3 = [(PXStoryExportConfiguration *)self videoOptions];
  v4 = [v3 fullSizePlayerExtendedTraitCollectionSnapshot];

  v5 = [(PXStoryExportConfiguration *)self videoOptions];
  int v6 = [v5 prefersExportLayoutMatchesPlayback];

  v7 = [PXStoryExportExtendedTraitCollection alloc];
  if (v6 && v4)
  {
    [v4 layoutReferenceSize];
    double v9 = v8;
    double v11 = v10;
    [v4 displayScale];
    double v13 = v12;
    [v4 fullScreenReferenceRect];
    v18 = -[PXStoryExportExtendedTraitCollection initWithLayoutReferenceSize:displayScale:overrideFullScreenReferenceRect:](v7, "initWithLayoutReferenceSize:displayScale:overrideFullScreenReferenceRect:", v9, v11, v13, v14, v15, v16, v17);
  }
  else
  {
    v19 = [(PXStoryExportConfiguration *)self videoOptions];
    [v19 resolution];
    double v21 = v20;
    double v23 = v22;
    v24 = [(PXStoryExportConfiguration *)self videoOptions];
    [v24 scale];
    v18 = -[PXStoryExportExtendedTraitCollection initWithLayoutReferenceSize:displayScale:overrideFullScreenReferenceRect:](v7, "initWithLayoutReferenceSize:displayScale:overrideFullScreenReferenceRect:", v21, v23, v25, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  }
  return (PXExtendedTraitCollection *)v18;
}

- (void)copyOptionalPropertiesFromOtherExportConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityType];
  [(PXStoryExportConfiguration *)self setActivityType:v5];

  int v6 = [v4 activityCategory];
  [(PXStoryExportConfiguration *)self setActivityCategory:v6];

  id v7 = [v4 errorReporter];

  [(PXStoryExportConfiguration *)self setErrorReporter:v7];
}

- (PXStoryExportConfiguration)initWithConfiguration:(id)a3 videoOptions:(id)a4 builder:(id)a5
{
  double v8 = (void (**)(id, PXStoryExportConfiguration *))a5;
  double v9 = [(PXStoryExportConfiguration *)self initWithConfiguration:a3 videoOptions:a4];
  if (v9) {
    v8[2](v8, v9);
  }

  return v9;
}

- (PXStoryExportConfiguration)initWithConfiguration:(id)a3 videoOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryExportConfiguration;
  double v9 = [(PXStoryExportConfiguration *)&v14 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storyConfiguration, a3);
    uint64_t v11 = [v8 copy];
    videoOptions = v10->_videoOptions;
    v10->_videoOptions = (PXStoryExportVideoOptions *)v11;
  }
  return v10;
}

@end
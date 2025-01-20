@interface PTCinematographyRefinementOptions
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)rackFocusPullTime;
- (BOOL)disableDetectionSmoothing;
- (PTCinematographyFocusFramesOptions)focusFramesOptions;
- (PTCinematographyRefinementOptions)init;
- (PTGlobalCinematographyMetadata)globalMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDisableDetectionSmoothing:(BOOL)a3;
- (void)setFocusFramesOptions:(id)a3;
- (void)setGlobalMetadata:(id)a3;
@end

@implementation PTCinematographyRefinementOptions

- (PTCinematographyRefinementOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)PTCinematographyRefinementOptions;
  v2 = [(PTCinematographyRefinementOptions *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PTCinematographyFocusFramesOptions);
    focusFramesOptions = v2->_focusFramesOptions;
    v2->_focusFramesOptions = v3;
  }
  return v2;
}

- (PTGlobalCinematographyMetadata)globalMetadata
{
  return self->_globalMetadata;
}

- (void)setGlobalMetadata:(id)a3
{
  id v4 = a3;
  v5 = [[PTCinematographyFocusFramesOptions alloc] initWithGlobalMetadata:v4];
  focusFramesOptions = self->_focusFramesOptions;
  self->_focusFramesOptions = v5;

  v7 = (PTGlobalCinematographyMetadata *)[v4 copy];
  globalMetadata = self->_globalMetadata;
  self->_globalMetadata = v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)rackFocusPullTime
{
  id v4 = [(PTCinematographyRefinementOptions *)self focusFramesOptions];
  if (v4)
  {
    objc_super v6 = v4;
    [v4 maximumRackFocusPullTime];
    id v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  v5 = [(PTCinematographyRefinementOptions *)self focusFramesOptions];
  objc_super v6 = (void *)[v5 copy];
  [v4 setFocusFramesOptions:v6];

  v7 = [(PTCinematographyRefinementOptions *)self globalMetadata];
  v8 = (void *)[v7 copy];
  [v4 setGlobalMetadata:v8];

  objc_msgSend(v4, "setDisableDetectionSmoothing:", -[PTCinematographyRefinementOptions disableDetectionSmoothing](self, "disableDetectionSmoothing"));
  return v4;
}

- (BOOL)disableDetectionSmoothing
{
  return self->_disableDetectionSmoothing;
}

- (void)setDisableDetectionSmoothing:(BOOL)a3
{
  self->_disableDetectionSmoothing = a3;
}

- (PTCinematographyFocusFramesOptions)focusFramesOptions
{
  return (PTCinematographyFocusFramesOptions *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFocusFramesOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusFramesOptions, 0);

  objc_storeStrong((id *)&self->_globalMetadata, 0);
}

@end
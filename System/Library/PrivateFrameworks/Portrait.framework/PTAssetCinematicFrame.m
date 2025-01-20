@interface PTAssetCinematicFrame
- (PTCinematographyFrame)cinematographyFrame;
- (PTTimedRenderingMetadata)renderingMetadata;
- (PTTimedStabilizationMetadata)stabilizationMetadata;
- (void)setCinematographyFrame:(id)a3;
- (void)setRenderingMetadata:(id)a3;
- (void)setStabilizationMetadata:(id)a3;
@end

@implementation PTAssetCinematicFrame

- (PTCinematographyFrame)cinematographyFrame
{
  return self->_cinematographyFrame;
}

- (void)setCinematographyFrame:(id)a3
{
}

- (PTTimedRenderingMetadata)renderingMetadata
{
  return self->_renderingMetadata;
}

- (void)setRenderingMetadata:(id)a3
{
}

- (PTTimedStabilizationMetadata)stabilizationMetadata
{
  return self->_stabilizationMetadata;
}

- (void)setStabilizationMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stabilizationMetadata, 0);
  objc_storeStrong((id *)&self->_renderingMetadata, 0);

  objc_storeStrong((id *)&self->_cinematographyFrame, 0);
}

@end
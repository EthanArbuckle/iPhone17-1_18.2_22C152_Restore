@interface PTEffectResources
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)segmentationSize;
- (NSString)effectNetworkConfig;
- (NSString)effectNetworkPath;
- (PTEffectPersonSegmentationViSegHQVisionCore)personSegmentationProvider;
- (PTEspressoGenericExecutor)effectNetwork;
- (PTEspressoGenericExecutor)segmentationNetwork;
- (PTHandGestureDetector)handGestureDetector;
- (PTVFXRenderEffect)renderEffect;
- (void)setEffectNetwork:(id)a3;
- (void)setEffectNetworkConfig:(id)a3;
- (void)setEffectNetworkPath:(id)a3;
- (void)setHandGestureDetector:(id)a3;
- (void)setPersonSegmentationProvider:(id)a3;
- (void)setRenderEffect:(id)a3;
- (void)setSegmentationNetwork:(id)a3;
- (void)setSegmentationSize:(id *)a3;
@end

@implementation PTEffectResources

- (PTVFXRenderEffect)renderEffect
{
  return self->_renderEffect;
}

- (NSString)effectNetworkConfig
{
  return self->_effectNetworkConfig;
}

- (void)setSegmentationNetwork:(id)a3
{
}

- (void)setEffectNetworkPath:(id)a3
{
}

- (void)setEffectNetworkConfig:(id)a3
{
}

- (void)setEffectNetwork:(id)a3
{
}

- (PTEspressoGenericExecutor)segmentationNetwork
{
  return self->_segmentationNetwork;
}

- (void)setRenderEffect:(id)a3
{
}

- (void)setHandGestureDetector:(id)a3
{
}

- (PTHandGestureDetector)handGestureDetector
{
  return self->_handGestureDetector;
}

- (NSString)effectNetworkPath
{
  return self->_effectNetworkPath;
}

- (PTEspressoGenericExecutor)effectNetwork
{
  return self->_effectNetwork;
}

- (PTEffectPersonSegmentationViSegHQVisionCore)personSegmentationProvider
{
  return self->_personSegmentationProvider;
}

- (void)setPersonSegmentationProvider:(id)a3
{
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)segmentationSize
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 64);
  return self;
}

- (void)setSegmentationSize:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_segmentationSize.depth = a3->var2;
  *(_OWORD *)&self->_segmentationSize.width = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderEffect, 0);
  objc_storeStrong((id *)&self->_personSegmentationProvider, 0);
  objc_storeStrong((id *)&self->_handGestureDetector, 0);
  objc_storeStrong((id *)&self->_segmentationNetwork, 0);
  objc_storeStrong((id *)&self->_effectNetwork, 0);
  objc_storeStrong((id *)&self->_effectNetworkConfig, 0);

  objc_storeStrong((id *)&self->_effectNetworkPath, 0);
}

@end
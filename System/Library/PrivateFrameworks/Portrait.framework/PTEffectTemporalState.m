@interface PTEffectTemporalState
- (PTEffectTemporalState)initWithMetalContext:(id)a3;
- (void)restoreState:(id)a3 cvmNetwork:(id)a4 temporalFilter:(id)a5;
- (void)saveState:(id)a3 cvmNetwork:(id)a4 msrColorPyramid:(id)a5;
@end

@implementation PTEffectTemporalState

- (PTEffectTemporalState)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTEffectTemporalState;
  v6 = [(PTEffectTemporalState *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    v8 = v7;
  }

  return v7;
}

- (void)saveState:(id)a3 cvmNetwork:(id)a4 msrColorPyramid:(id)a5
{
  metalContext = self->_metalContext;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(PTMetalContext *)metalContext textureUtil];
  v13 = [v10 inPrevDisparity];
  uint64_t v14 = [v13 width];
  v15 = [v10 inPrevDisparity];
  uint64_t v16 = [v15 height];
  v17 = [v10 inPrevDisparity];
  objc_msgSend(v12, "createWithWidth:height:pixelFormat:", v14, v16, objc_msgSend(v17, "pixelFormat"));
  v18 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  disparityNetworkTemporalState = self->_disparityNetworkTemporalState;
  self->_disparityNetworkTemporalState = v18;

  v20 = [(PTMetalContext *)self->_metalContext textureUtil];
  v21 = [v10 outDisparity];

  [v20 copy:v11 inTex:v21 outTex:self->_disparityNetworkTemporalState];
  v22 = [v9 pyramidRGBA];

  id v27 = [v22 firstObject];

  v23 = [(PTMetalContext *)self->_metalContext textureUtil];
  objc_msgSend(v23, "createWithWidth:height:pixelFormat:", objc_msgSend(v27, "width"), objc_msgSend(v27, "height"), objc_msgSend(v27, "pixelFormat"));
  v24 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  lastQuatersizeRGBA = self->_lastQuatersizeRGBA;
  self->_lastQuatersizeRGBA = v24;

  v26 = [(PTMetalContext *)self->_metalContext textureUtil];
  [v26 copy:v11 inTex:v27 outTex:self->_lastQuatersizeRGBA];
}

- (void)restoreState:(id)a3 cvmNetwork:(id)a4 temporalFilter:(id)a5
{
  metalContext = self->_metalContext;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(PTMetalContext *)metalContext textureUtil];
  disparityNetworkTemporalState = self->_disparityNetworkTemporalState;
  uint64_t v14 = [v10 inPrevDisparity];
  [v12 copy:v11 inTex:disparityNetworkTemporalState outTex:v14];

  v15 = [(PTMetalContext *)self->_metalContext textureUtil];
  lastQuatersizeRGBA = self->_lastQuatersizeRGBA;
  v17 = [v10 inRGBA];
  [v15 copy:v11 inTex:lastQuatersizeRGBA outTex:v17];

  id v18 = [v10 inRGBA];

  [v9 prepareFilter:v11 opticalFlowRGB:v18 frameIndex:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQuatersizeRGBA, 0);
  objc_storeStrong((id *)&self->_disparityNetworkTemporalState, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
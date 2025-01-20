@interface PTEffectDebugLayer
- (PTEffectDebugLayer)initWithMetalContext:(id)a3 effectRelighting:(id)a4 renderState:(id)a5 util:(id)a6 colorConversion:(id)a7 msrColorPyramid:(id)a8 vfxRenderEffect:(id)a9 depthConverter:(id)a10 disparityFixedFocus:(id)a11 faceDisparityArray:(id)a12 focusDisparityRaw:(id)a13 focusDisparityModifiers:(id)a14;
- (void)renderDebugInformation:(int64_t)a3 effectRenderRequest:(id)a4 reactionStates:(id)a5 disparity:(id)a6 disparityCentered:(id)a7 normal:(id)a8 diffuse:(id)a9 temporalFilter:(id)a10 humanDetections:(id)a11 transform:(CGAffineTransform *)a12 fNumber:(float)a13 focusDisparityRaw:(id)a14 useDisparityBufferForReactions:(id)a15 outYUV:(id)a16;
- (void)renderThumbnailsWithDisparity:(id)a3 disparityCentered:(id)a4 normal:(id)a5 temporalFilter:(id)a6 outYUV:(id)a7;
- (void)setReactionProvider:(id)a3;
@end

@implementation PTEffectDebugLayer

- (void)renderDebugInformation:(int64_t)a3 effectRenderRequest:(id)a4 reactionStates:(id)a5 disparity:(id)a6 disparityCentered:(id)a7 normal:(id)a8 diffuse:(id)a9 temporalFilter:(id)a10 humanDetections:(id)a11 transform:(CGAffineTransform *)a12 fNumber:(float)a13 focusDisparityRaw:(id)a14 useDisparityBufferForReactions:(id)a15 outYUV:(id)a16
{
  id v52 = a6;
  id v51 = a7;
  id v50 = a8;
  id v49 = a10;
  id v48 = a11;
  id v20 = a16;
  v21 = PTDefaultsPublicGetDictionary();
  v22 = [v21 objectForKeyedSubscript:@"PTEffectDebug"];
  v23 = v22;
  if (a3 || [v22 intValue])
  {
    v24 = [(PTMetalContext *)self->_metalContext commandBuffer];

    if (!v24)
    {
      v25 = _PTLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[PTEffectDebugLayer renderDebugInformation:effectRenderRequest:reactionStates:disparity:disparityCentered:normal:diffuse:temporalFilter:humanDetections:transform:fNumber:focusDisparityRaw:useDisparityBufferForReactions:outYUV:](v25);
      }
    }
    if (a3 == 1 || [v23 intValue]) {
      [(PTEffectDebugLayer *)self renderThumbnailsWithDisparity:v52 disparityCentered:v51 normal:v50 temporalFilter:v49 outYUV:v20];
    }
    v46 = v23;
    v47 = [v21 objectForKeyedSubscript:@"PTEffectShowFaceRects"];
    if (a3 == 2 || (int v45 = [v47 intValue], a3 == 1) || v45)
    {
      v26 = [(PTMetalContext *)self->_metalContext commandBuffer];
      v27 = [v20 texLuma];
      [v48 renderDebugRects:v26 outTexture:v27 debugFaceRects:a3 == 2];

      effectRelighting = self->_effectRelighting;
      if (effectRelighting)
      {
        uint64_t v29 = [(PTEffectRelighting *)effectRelighting smoothFaceRects];
        uint64_t v30 = 0;
        __asm { FMOV            V0.4S, #1.0 }
        double v53 = *(double *)&_Q0;
        do
        {
          uint64_t v36 = v29 + v30;
          if (*(float *)(v29 + v30 + 112) > 0.0)
          {
            *(void *)v54 = *(void *)(v36 + 48);
            float v37 = *(float *)(v36 + 56);
            float v38 = (float)(unint64_t)[v20 width];
            float v39 = v38 / (float)(unint64_t)[v20 height];
            util = self->_util;
            v41 = [(PTMetalContext *)self->_metalContext commandBuffer];
            int v42 = (int)(float)((float)(v54[0] - v37) * (float)(unint64_t)[v20 width]);
            int v43 = (int)(float)((float)(v54[1] - (float)(v37 * v39))
                             * (float)(unint64_t)[v20 height]);
            [v20 width];
            [v20 height];
            v44 = [v20 texLuma];
            [(PTUtil *)util renderRect:v41 rect:0 color:v44 fill:COERCE_DOUBLE(__PAIR64__(v43, v42)) outTexture:v53];
          }
          v30 += 72;
        }
        while (v30 != 288);
      }
    }
    [(PTMetalContext *)self->_metalContext commitAndWaitUntilScheduled];
    ++renderDebugInformation_effectRenderRequest_reactionStates_disparity_disparityCentered_normal_diffuse_temporalFilter_humanDetections_transform_fNumber_focusDisparityRaw_useDisparityBufferForReactions_outYUV__frameIndex;

    v23 = v46;
  }
}

- (void)setReactionProvider:(id)a3
{
}

- (PTEffectDebugLayer)initWithMetalContext:(id)a3 effectRelighting:(id)a4 renderState:(id)a5 util:(id)a6 colorConversion:(id)a7 msrColorPyramid:(id)a8 vfxRenderEffect:(id)a9 depthConverter:(id)a10 disparityFixedFocus:(id)a11 faceDisparityArray:(id)a12 focusDisparityRaw:(id)a13 focusDisparityModifiers:(id)a14
{
  id v39 = a3;
  id v29 = a4;
  id v38 = a4;
  id v30 = a5;
  id v37 = a5;
  id v36 = a6;
  id v31 = a7;
  id v35 = a7;
  id v34 = a8;
  id v19 = a9;
  id v33 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  v40.receiver = self;
  v40.super_class = (Class)PTEffectDebugLayer;
  v24 = [(PTEffectDebugLayer *)&v40 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_metalContext, a3);
    objc_storeStrong((id *)&v25->_effectRelighting, v29);
    objc_storeStrong((id *)&v25->_renderState, v30);
    objc_storeStrong((id *)&v25->_util, a6);
    objc_storeStrong((id *)&v25->_colorConversion, v31);
    objc_storeStrong((id *)&v25->_msrColorPyramid, a8);
    objc_storeStrong((id *)&v25->_disparityFixedFocus, a11);
    objc_storeStrong((id *)&v25->_faceDisparityArray, a12);
    objc_storeStrong((id *)&v25->_focusDisparityRaw, a13);
    objc_storeStrong((id *)&v25->_focusDisparityModifier, a14);
    objc_storeStrong((id *)&v25->_vfxRenderEffect, a9);
    objc_storeStrong((id *)&v25->_depthConverter, a10);
    *(void *)&v25->_width = 0x3800000063;
    v26 = v25;
  }

  return v25;
}

- (void)renderThumbnailsWithDisparity:(id)a3 disparityCentered:(id)a4 normal:(id)a5 temporalFilter:(id)a6 outYUV:(id)a7
{
  id v25 = a3;
  id v9 = a7;
  if ([v25 width])
  {
    util = self->_util;
    v11 = [(PTMetalContext *)self->_metalContext commandBuffer];
    [(PTUtil *)util renderDisparity:v11 inDisparity:v25 outYUV:v9 region:((unint64_t)LOWORD(self->_width) << 32) | ((unint64_t)self->_height << 48) drawLegend:0];

    v12 = self->_util;
    v13 = [(PTMetalContext *)self->_metalContext commandBuffer];
    double v23 = *(double *)&self->_width;
    v14 = [v9 texLuma];
    [(PTUtil *)v12 renderRect:v13 rect:1 color:v14 fill:v23 outTexture:0.0];

    v15 = self->_util;
    v16 = [(PTMetalContext *)self->_metalContext commandBuffer];
    double v24 = COERCE_DOUBLE(vadd_s32(*(int32x2_t *)&self->_width, (int32x2_t)0x200000002));
    v17 = [v9 texLuma];
    __asm { FMOV            V1.4S, #1.0 }
    [(PTUtil *)v15 renderRect:v16 rect:1 color:v17 fill:v24 outTexture:*(double *)&_Q1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthConverter, 0);
  objc_storeStrong((id *)&self->_vfxRenderEffect, 0);
  objc_storeStrong((id *)&self->_brightSceneDetector, 0);
  for (uint64_t i = 0; i != -4; --i)
    objc_storeStrong((id *)&self->_faceDisparityGraphs[i + 3], 0);
  objc_storeStrong((id *)&self->_focusDisparityGraph, 0);
  objc_storeStrong((id *)&self->_focusDisparityRelightingGraph, 0);
  objc_storeStrong((id *)&self->_srlGraph, 0);
  objc_storeStrong((id *)&self->_focusDisparityModifier, 0);
  objc_storeStrong((id *)&self->_focusDisparityRaw, 0);
  objc_storeStrong((id *)&self->_faceDisparityArray, 0);
  objc_storeStrong((id *)&self->_disparityFixedFocus, 0);
  objc_storeStrong((id *)&self->_reactionProvider, 0);
  objc_storeStrong((id *)&self->_msrColorPyramid, 0);
  objc_storeStrong((id *)&self->_colorConversion, 0);
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_renderState, 0);
  objc_storeStrong((id *)&self->_effectRelighting, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)renderDebugInformation:(os_log_t)log effectRenderRequest:reactionStates:disparity:disparityCentered:normal:diffuse:temporalFilter:humanDetections:transform:fNumber:focusDisparityRaw:useDisparityBufferForReactions:outYUV:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "_metalContext.commandBuffer";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

@end
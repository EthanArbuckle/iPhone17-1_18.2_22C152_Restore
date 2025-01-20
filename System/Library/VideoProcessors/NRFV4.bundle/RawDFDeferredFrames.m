@interface RawDFDeferredFrames
- (NSDictionary)cameraInfoByPortType;
- (NSMutableArray)nonReferenceEv0Frames;
- (RawDFDeferredFrames)init;
- (RawDFDeferredFrames)initWithMetalContext:(id)a3;
- (RawDFInputFrame)longFrame;
- (RawDFInputFrame)quadraFrame;
- (RawDFInputFrame)referenceEv0Frame;
- (RawDFInputFrame)sifrFrame;
- (RawDFInputFrame)syntheticReferenceFrame;
- (RawDFInputFrame)syntheticReferenceFusionMap;
- (id)addFrame:(__CVBuffer *)a3 inputCMITexture:(id)a4 metadata:(id)a5 frameType:(int)a6 uniqueFrameId:(int)a7 processFrame:(BOOL *)a8;
- (id)createInputFrameWithInputPixelBuffer:(__CVBuffer *)a3 inputCMITexture:(id)a4 metadata:(id)a5 uniqueFrameId:(int)a6;
- (id)description;
- (void)releaseAll;
- (void)releaseRgbTextures;
- (void)setCameraInfoByPortType:(id)a3;
@end

@implementation RawDFDeferredFrames

- (RawDFDeferredFrames)initWithMetalContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RawDFDeferredFrames;
  v6 = [(RawDFDeferredFrames *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    if (!v7->_metal
      || (uint64_t v8 = objc_opt_new(),
          nonReferenceEv0Frames = v7->_nonReferenceEv0Frames,
          v7->_nonReferenceEv0Frames = (NSMutableArray *)v8,
          nonReferenceEv0Frames,
          !v7->_nonReferenceEv0Frames))
    {
      v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }

  return v7;
}

- (RawDFDeferredFrames)init
{
  v3.receiver = self;
  v3.super_class = (Class)RawDFDeferredFrames;
  return [(RawDFDeferredFrames *)&v3 init];
}

- (id)description
{
  return @"RawDFDeferredFrames";
}

- (id)createInputFrameWithInputPixelBuffer:(__CVBuffer *)a3 inputCMITexture:(id)a4 metadata:(id)a5 uniqueFrameId:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a4;
  id v11 = a5;
  objc_super v12 = v11;
  if ((a3 != 0) == (v10 == 0))
  {
    uint64_t v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
    v14 = [RawDFInputFrame alloc];
    metal = self->_metal;
    v16 = [(NSDictionary *)self->_cameraInfoByPortType objectForKeyedSubscript:v13];
    if (!a3)
    {
      v17 = [(RawDFInputFrame *)v14 initWithMetalContext:metal cameraInfo:v16 inputFrame:v10 metadata:v12 uniqueFrameId:v6];
LABEL_7:

      goto LABEL_8;
    }
    v17 = [(RawDFInputFrame *)v14 initWithMetalContext:metal cameraInfo:v16 inputPixelBuffer:a3 metadata:v12 uniqueFrameId:v6];

    if (v17)
    {
      if (![(RawDFInputFrame *)v17 prepareInputFrame]) {
        goto LABEL_8;
      }
      v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_7;
    }
    v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v13 = 0;
  }
  v17 = 0;
LABEL_8:

  return v17;
}

- (id)addFrame:(__CVBuffer *)a3 inputCMITexture:(id)a4 metadata:(id)a5 frameType:(int)a6 uniqueFrameId:(int)a7 processFrame:(BOOL *)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a4;
  id v15 = a5;
  if ((a3 != 0) != (v14 == 0)) {
    goto LABEL_6;
  }
  switch(a6)
  {
    case 0:
      v16 = [(RawDFDeferredFrames *)self createInputFrameWithInputPixelBuffer:a3 inputCMITexture:v14 metadata:v15 uniqueFrameId:v9];
      [v16 setBindingMetalFormat:113];
      [v16 setStrideAlignment:16];
      [v16 setHeightAlignment:16];
      v17 = v16;
      BOOL v18 = 0;
      syntheticReferenceFrame = self->_syntheticReferenceFrame;
      self->_syntheticReferenceFrame = v17;
      goto LABEL_14;
    case 1:
      v17 = [(RawDFDeferredFrames *)self createInputFrameWithInputPixelBuffer:a3 inputCMITexture:v14 metadata:v15 uniqueFrameId:v9];
      BOOL v18 = 0;
      syntheticReferenceFrame = self->_syntheticReferenceFusionMap;
      self->_syntheticReferenceFusionMap = v17;
      goto LABEL_14;
    case 5:
      v21 = [(RawDFDeferredFrames *)self createInputFrameWithInputPixelBuffer:a3 inputCMITexture:v14 metadata:v15 uniqueFrameId:v9];
      [v21 setStrideAlignment:16];
      [v21 setHeightAlignment:16];
      v17 = v21;
      syntheticReferenceFrame = self->_referenceEv0Frame;
      self->_referenceEv0Frame = v17;
      goto LABEL_13;
    case 6:
      v22 = [(RawDFDeferredFrames *)self createInputFrameWithInputPixelBuffer:a3 inputCMITexture:v14 metadata:v15 uniqueFrameId:v9];
      [v22 setStrideAlignment:16];
      [v22 setHeightAlignment:16];
      v17 = v22;
      syntheticReferenceFrame = self->_sifrFrame;
      self->_sifrFrame = v17;
      goto LABEL_13;
    case 7:
      v17 = [(RawDFDeferredFrames *)self createInputFrameWithInputPixelBuffer:a3 inputCMITexture:v14 metadata:v15 uniqueFrameId:v9];
      [(RawDFInputFrame *)v17 setStrideAlignment:16];
      [(RawDFInputFrame *)v17 setHeightAlignment:16];
      [(NSMutableArray *)self->_nonReferenceEv0Frames addObject:v17];
      v23 = [(NSMutableArray *)self->_nonReferenceEv0Frames lastObject];

      if (!v23) {
        goto LABEL_28;
      }
      BOOL v18 = 1;
      break;
    case 8:
      v24 = [(RawDFDeferredFrames *)self createInputFrameWithInputPixelBuffer:a3 inputCMITexture:v14 metadata:v15 uniqueFrameId:v9];
      [v24 setStrideAlignment:16];
      [v24 setHeightAlignment:16];
      v17 = v24;
      syntheticReferenceFrame = self->_longFrame;
      self->_longFrame = v17;
      goto LABEL_13;
    case 9:
      v25 = [(RawDFDeferredFrames *)self createInputFrameWithInputPixelBuffer:a3 inputCMITexture:v14 metadata:v15 uniqueFrameId:v9];
      [v25 setStrideAlignment:16];
      [v25 setHeightAlignment:16];
      v17 = v25;
      syntheticReferenceFrame = self->_quadraFrame;
      self->_quadraFrame = v17;
LABEL_13:
      BOOL v18 = 1;
LABEL_14:

      break;
    default:
      FigSignalErrorAt();
      goto LABEL_6;
  }
  if (!v17)
  {
LABEL_6:
    v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v17 = 0;
    goto LABEL_25;
  }
  if ([(RawDFInputFrame *)v17 hasStandardMetadata])
  {
    if (!self->_cameraInfoByPortType)
    {
LABEL_28:
      v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_25;
    }
    int v26 = -[RawDFInputFrame getGDCParametersWithCameraInfoByPortType:](v17, "getGDCParametersWithCameraInfoByPortType:");
    if (!a8 || v26)
    {
      if (!v26) {
        goto LABEL_24;
      }
LABEL_25:
      v27 = 0;
      goto LABEL_26;
    }
    goto LABEL_23;
  }
  if (a8) {
LABEL_23:
  }
    *a8 = v18;
LABEL_24:
  v27 = v17;
LABEL_26:
  v28 = v27;

  return v28;
}

- (void)releaseRgbTextures
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = self->_nonReferenceEv0Frames;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "releaseRgbTex", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(RawDFInputFrame *)self->_syntheticReferenceFrame releaseRgbTex];
  [(RawDFInputFrame *)self->_longFrame releaseRgbTex];
  [(RawDFInputFrame *)self->_sifrFrame releaseRgbTex];
  [(RawDFInputFrame *)self->_quadraFrame releaseRgbTex];
  [(RawDFInputFrame *)self->_referenceEv0Frame releaseRgbTex];
}

- (void)releaseAll
{
  [(NSMutableArray *)self->_nonReferenceEv0Frames removeAllObjects];
  syntheticReferenceFrame = self->_syntheticReferenceFrame;
  self->_syntheticReferenceFrame = 0;

  syntheticReferenceFusionMap = self->_syntheticReferenceFusionMap;
  self->_syntheticReferenceFusionMap = 0;

  longFrame = self->_longFrame;
  self->_longFrame = 0;

  sifrFrame = self->_sifrFrame;
  self->_sifrFrame = 0;

  quadraFrame = self->_quadraFrame;
  self->_quadraFrame = 0;

  referenceEv0Frame = self->_referenceEv0Frame;
  self->_referenceEv0Frame = 0;
}

- (NSMutableArray)nonReferenceEv0Frames
{
  return self->_nonReferenceEv0Frames;
}

- (RawDFInputFrame)referenceEv0Frame
{
  return self->_referenceEv0Frame;
}

- (RawDFInputFrame)sifrFrame
{
  return self->_sifrFrame;
}

- (RawDFInputFrame)longFrame
{
  return self->_longFrame;
}

- (RawDFInputFrame)quadraFrame
{
  return self->_quadraFrame;
}

- (RawDFInputFrame)syntheticReferenceFrame
{
  return self->_syntheticReferenceFrame;
}

- (RawDFInputFrame)syntheticReferenceFusionMap
{
  return self->_syntheticReferenceFusionMap;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_syntheticReferenceFusionMap, 0);
  objc_storeStrong((id *)&self->_syntheticReferenceFrame, 0);
  objc_storeStrong((id *)&self->_quadraFrame, 0);
  objc_storeStrong((id *)&self->_longFrame, 0);
  objc_storeStrong((id *)&self->_sifrFrame, 0);
  objc_storeStrong((id *)&self->_referenceEv0Frame, 0);
  objc_storeStrong((id *)&self->_nonReferenceEv0Frames, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end
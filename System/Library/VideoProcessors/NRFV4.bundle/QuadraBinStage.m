@interface QuadraBinStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (FigMetalContext)metal;
- (QuadraBinShaders)shaders;
- (QuadraBinStage)initWithDownstreamStage:(id)a3 metalContext:(id)a4 staticParameters:(id)a5;
- (SoftISPStage)downstreamStage;
- (SoftISPStaticParameters)staticParameters;
- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4;
- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (int)runWithArgs:(id)a3;
- (int)validateInputFrame:(id)a3 config:(id)a4;
- (unint64_t)bytesRequiredForConfig:(id)a3;
- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5;
- (unsigned)outputDownscaleFactor;
- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
@end

@implementation QuadraBinStage

- (QuadraBinStage)initWithDownstreamStage:(id)a3 metalContext:(id)a4 staticParameters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)QuadraBinStage;
  v12 = [(QuadraBinStage *)&v24 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_12;
  }
  if (!v9) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v12->_downstreamStage, a3);
  if (!v10) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v13->_metal, a4);
  if (!v11) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v13->_staticParameters, a5);
  v14 = [[QuadraBinShaders alloc] initWithMetalContext:v10];
  shaders = v13->_shaders;
  v13->_shaders = v14;

  if (!v13->_shaders) {
    goto LABEL_12;
  }
  v13->_outputDownscaleFactor = 2 * [v9 outputDownscaleFactor];
  v16 = [(FigMetalContext *)v13->_metal device];
  uint64_t v17 = [v16 newBufferWithLength:512 options:0];
  _8to10ExpansionLUT = v13->_8to10ExpansionLUT;
  v13->_8to10ExpansionLUT = (MTLBuffer *)v17;

  if (!v13->_8to10ExpansionLUT) {
    goto LABEL_12;
  }
  v19 = [(FigMetalContext *)v13->_metal device];
  uint64_t v20 = [v19 newBufferWithLength:1024 options:0];
  _10to8CompressionLUT = v13->_10to8CompressionLUT;
  v13->_10to8CompressionLUT = (MTLBuffer *)v20;

  if (v13->_10to8CompressionLUT
    && !decompand8To10ToU16([(MTLBuffer *)v13->_8to10ExpansionLUT contents])
    && !compand10To8([(MTLBuffer *)v13->_10to8CompressionLUT contents]))
  {
    v22 = v13;
  }
  else
  {
LABEL_12:
    FigDebugAssert3();
    v22 = 0;
  }

  return v22;
}

- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  return [(SoftISPStage *)self->_downstreamStage outputPixelFormatForInputPixelFormat:*(void *)&a3 outputCompressionLevel:*(void *)&a4];
}

- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5
{
  return 0;
}

- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  return ($F61E096109CF133FD2477F48C7D0CEE7)0;
}

- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [[QuadraBinConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 outputCompressionLevel:v4 downstreamStage:self->_downstreamStage];

  return v7;
}

- (unint64_t)bytesRequiredForConfig:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 inputMTLPixelFormatForPlane];
    v7 = [v6 objectAtIndexedSubscript:0];
    uint64_t v8 = (int)[v7 intValue];

    uint64_t v9 = [(FigMetalContext *)self->_metal getPixelSizeInBytes:v8];
    uint64_t v10 = [v5 maximumOutputDimensions] * v9;
    unint64_t v11 = v10 * ((unint64_t)[v5 maximumOutputDimensions] >> 32);
    downstreamStage = self->_downstreamStage;
    v13 = [v5 downstreamConfig];
    if (v11 <= [(SoftISPStage *)downstreamStage bytesRequiredForConfig:v13])
    {
      v14 = self->_downstreamStage;
      v15 = [v5 downstreamConfig];
      unint64_t v11 = [(SoftISPStage *)v14 bytesRequiredForConfig:v15];
    }
  }
  else
  {
    FigDebugAssert3();
    unint64_t v11 = 0;
  }

  return v11;
}

- (int)validateInputFrame:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6 || !v7)
  {
    int v12 = FigSignalErrorAt();
LABEL_11:
    id v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    FigDebugAssert3();
    int v12 = 0;
    goto LABEL_11;
  }
  id v9 = v8;
  if (-[SoftISPInputFrame firstPixel]((uint64_t)v6) == 2
    || -[SoftISPInputFrame firstPixel]((uint64_t)v6) == 1)
  {
    downstreamStage = self->_downstreamStage;
    unint64_t v11 = [v9 downstreamConfig];
    int v12 = [(SoftISPStage *)downstreamStage validateInputFrame:v6 config:v11];

    if (v12) {
      FigDebugAssert3();
    }
  }
  else
  {
    FigDebugAssert3();
    int v12 = FigSignalErrorAt();
  }
LABEL_8:

  return v12;
}

- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[QuadraBinStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  id v10 = [(FigMetalContext *)self->_metal allocator];
  id v11 = (void *)[v10 newTextureDescriptor];

  if (!v11) {
    goto LABEL_6;
  }
  id v12 = [v11 desc];
  [v12 setTextureType:2];

  v13 = [v11 desc];
  [v13 setWidth:a5];

  v14 = [v11 desc];
  [v14 setHeight:a6];

  v15 = [v11 desc];
  [v15 setUsage:3];

  v16 = [v11 desc];
  [v16 setPixelFormat:a4];

  [v11 setLabel:0];
  uint64_t v17 = [(FigMetalContext *)self->_metal allocator];
  v18 = (void *)[v17 newTextureWithDescriptor:v11];

  if (!v18)
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    v18 = 0;
  }

  return v18;
}

- (int)runWithArgs:(id)a3
{
  v137[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v135 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v108 = FigSignalErrorAt();
    v117 = 0;
    v118 = 0;
    v123 = 0;
    v89 = 0;
    id v14 = 0;
    v35 = 0;
    v16 = 0;
    v119 = 0;
    id v5 = 0;
    goto LABEL_48;
  }
  id v5 = v4;
  id v6 = [v5 inputFrame];

  if (!v6) {
    goto LABEL_50;
  }
  id v7 = [v5 bounds];

  if (!v7
    || ([v5 config],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        (isKindOfClass & 1) == 0))
  {
LABEL_50:
    int v108 = FigSignalErrorAt();
    v117 = 0;
    v123 = 0;
LABEL_52:
    v89 = 0;
    id v14 = 0;
    v35 = 0;
    v16 = 0;
    v118 = 0;
    v119 = 0;
    goto LABEL_48;
  }
  v123 = [v5 config];
  id v10 = [v5 inputTex];

  if (!v10)
  {
    int v108 = FigSignalErrorAt();
    v117 = 0;
    goto LABEL_52;
  }
  id v11 = [v5 inputTex];
  id v12 = [v123 inputMTLPixelFormatForPlane];
  v13 = [v12 objectAtIndexedSubscript:0];
  -[QuadraBinStage createIntermediateMetalTexture:pixelFormat:width:height:](self, "createIntermediateMetalTexture:pixelFormat:width:height:", @"quadraBinned", (int)[v13 intValue], (unint64_t)objc_msgSend(v11, "width") >> 1, (unint64_t)objc_msgSend(v11, "height") >> 1);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v135 = v14;

  v118 = v11;
  if (!v14)
  {
    int v108 = FigSignalErrorAt();
    v117 = 0;
LABEL_57:
    v89 = 0;
    goto LABEL_58;
  }
  v15 = [(FigMetalContext *)self->_metal commandBuffer];
  v16 = v15;
  if (!v15)
  {
    int v108 = FigSignalErrorAt();
    v117 = 0;
    v89 = 0;
    id v14 = 0;
    v35 = 0;
LABEL_61:
    v119 = 0;
    goto LABEL_48;
  }
  uint64_t v17 = self;
  uint64_t v18 = [v15 computeCommandEncoder];
  v117 = v16;
  if (!v18)
  {
    int v108 = FigSignalErrorAt();
    v89 = 0;
    id v14 = 0;
LABEL_58:
    v35 = 0;
LABEL_60:
    v16 = 0;
    goto LABEL_61;
  }
  v19 = (void *)v18;
  uint64_t v20 = [(QuadraBinShaders *)self->_shaders quadraBin];
  [v19 setComputePipelineState:v20];

  [v19 setTexture:v11 atIndex:0];
  [v19 setTexture:v14 atIndex:1];
  v21 = [v5 inputFrame];
  int v22 = -[SoftISPInputFrame compandingMode]((uint64_t)v21);

  if (v22 == 2)
  {
    [v19 setBuffer:self->_8to10ExpansionLUT offset:0 atIndex:3];
    [v19 setBuffer:self->_10to8CompressionLUT offset:0 atIndex:2];
  }
  v134[0] = [v14 width];
  v134[1] = [v14 height];
  v134[2] = 1;
  int64x2_t v132 = vdupq_n_s64(0x20uLL);
  uint64_t v133 = 1;
  [v19 dispatchThreads:v134 threadsPerThreadgroup:&v132];
  [v19 endEncoding];

  int v23 = [v14 width];
  id v120 = v14;
  int v24 = [v14 height];
  v25 = [v5 inputFrame];
  unsigned __int16 v26 = -[SoftISPInputFrame frameID]((uint64_t)v25) >> 16;

  if (*MEMORY[0x263F00E10])
  {
    id v27 = v4;
    int v28 = v26;
    v29 = [v16 commandQueue];
    v30 = [v29 commandBuffer];

    [v30 setLabel:@"KTRACE_MTLCMDBUF"];
    v128[0] = MEMORY[0x263EF8330];
    v128[1] = 3221225472;
    v128[2] = __30__QuadraBinStage_runWithArgs___block_invoke;
    v128[3] = &__block_descriptor_44_e28_v16__0___MTLCommandBuffer__8l;
    int v129 = v23;
    int v130 = v24;
    int v131 = v28;
    [v30 addCompletedHandler:v128];
    [v30 commit];
    v124[0] = MEMORY[0x263EF8330];
    v124[1] = 3221225472;
    v124[2] = __30__QuadraBinStage_runWithArgs___block_invoke_2;
    v124[3] = &__block_descriptor_44_e28_v16__0___MTLCommandBuffer__8l;
    int v125 = v23;
    int v126 = v24;
    int v127 = v28;
    id v4 = v27;
    uint64_t v17 = self;
    [v16 addCompletedHandler:v124];
  }
  [(FigMetalContext *)v17->_metal commit];
  [v5 setInputTex:0];
  v31 = [SoftISPInputFrame alloc];
  v32 = [v5 inputFrame];
  id v14 = [(SoftISPInputFrame *)v31 initBinnedQuadraVariantOf:v32 inputTexture:v120];

  if (!v14)
  {
    FigDebugAssert3();
    int v108 = FigSignalErrorAt();
    goto LABEL_57;
  }
  v33 = [SoftISPBounds alloc];
  v34 = [v5 outputFrame];
  v35 = [(SoftISPBounds *)v33 initWithInputFrame:v14 outputFrame:v34 quadraBinned:1];

  if (!v35)
  {
    FigDebugAssert3();
    int v108 = FigSignalErrorAt();
    v89 = 0;
    goto LABEL_60;
  }
  v36 = [v5 outputFrame];
  v37 = [v36 metadata];
  v16 = (void *)[v37 mutableCopy];

  if (!v16)
  {
    int v108 = FigSignalErrorAt();
    v89 = 0;
    goto LABEL_61;
  }
  [v16 setObject:&unk_270E98908 forKeyedSubscript:*MEMORY[0x263F2F5E0]];
  v38 = NSNumber;
  uint64_t v39 = *MEMORY[0x263F2F600];
  v40 = [v16 objectForKeyedSubscript:*MEMORY[0x263F2F600]];
  int v41 = [v40 intValue];
  if (v41 >= 0) {
    int v42 = v41;
  }
  else {
    int v42 = v41 + 1;
  }
  v43 = [v38 numberWithInt:(v42 >> 1)];
  [v16 setObject:v43 forKeyedSubscript:v39];

  v44 = NSNumber;
  uint64_t v45 = *MEMORY[0x263F2F5F8];
  v46 = [v16 objectForKeyedSubscript:*MEMORY[0x263F2F5F8]];
  int v47 = [v46 intValue];
  if (v47 >= 0) {
    int v48 = v47;
  }
  else {
    int v48 = v47 + 1;
  }
  v49 = [v44 numberWithInt:(v48 >> 1)];
  [v16 setObject:v49 forKeyedSubscript:v45];

  uint64_t v50 = *MEMORY[0x263F2F5B0];
  v51 = [v16 objectForKeyedSubscript:*MEMORY[0x263F2F5B0]];
  v52 = v51;
  if (v51)
  {
    v53 = createScaledPointDict(v51);
    [v16 setObject:v53 forKeyedSubscript:v50];
  }
  id v116 = v4;
  uint64_t v54 = *MEMORY[0x263F2F450];
  v55 = [v16 objectForKeyedSubscript:*MEMORY[0x263F2F450]];

  if (v55)
  {
    v56 = createScaledPointDict(v55);
    [v16 setObject:v56 forKeyedSubscript:v54];
  }
  uint64_t v57 = *MEMORY[0x263F2F680];
  v58 = [v16 objectForKeyedSubscript:*MEMORY[0x263F2F680]];

  v119 = v58;
  if (v58)
  {
    v113 = v35;
    v114 = v14;
    id v115 = v5;
    id v59 = v58;
    v60 = [v59 objectForKeyedSubscript:@"X"];
    v61 = [v59 objectForKeyedSubscript:@"Y"];
    v62 = [v59 objectForKeyedSubscript:@"Width"];
    v63 = [v59 objectForKeyedSubscript:@"Height"];

    if (v60 && v61 && v62 && v63)
    {
      [v60 floatValue];
      float v65 = v64 * 0.5;
      [v61 floatValue];
      float v67 = v66 * 0.5;
      [v62 floatValue];
      float v69 = v68 * 0.5;
      [v63 floatValue];
      float v71 = v70 * 0.5;
      v136[0] = @"X";
      *(float *)&double v72 = v65;
      v73 = [NSNumber numberWithFloat:v72];
      v137[0] = v73;
      v136[1] = @"Y";
      *(float *)&double v74 = v67;
      [NSNumber numberWithFloat:v74];
      v112 = v62;
      v76 = uint64_t v75 = v57;
      v137[1] = v76;
      v136[2] = @"Width";
      *(float *)&double v77 = v69;
      [NSNumber numberWithFloat:v77];
      v78 = v63;
      v80 = v79 = v61;
      v137[2] = v80;
      v136[3] = @"Height";
      *(float *)&double v81 = v71;
      [NSNumber numberWithFloat:v81];
      v83 = v82 = v60;
      v137[3] = v83;
      v84 = [NSDictionary dictionaryWithObjects:v137 forKeys:v136 count:4];

      v60 = v82;
      v61 = v79;
      v63 = v78;

      uint64_t v57 = v75;
      uint64_t v17 = self;
      v62 = v112;
    }
    else
    {
      uint64_t v111 = v3;
      LODWORD(v110) = 0;
      FigDebugAssert3();
      v84 = 0;
    }

    [v16 setObject:v84 forKeyedSubscript:v57];
    id v14 = v114;
    id v5 = v115;
    v35 = v113;
  }
  v85 = objc_msgSend(v5, "outputFrame", v110, v111);
  [v85 setMetadata:v16];

  downstreamStage = v17->_downstreamStage;
  v87 = [v123 downstreamConfig];
  v88 = [v5 outputFrame];
  v89 = [(SoftISPStage *)downstreamStage createArgsWithConfig:v87 bounds:v35 inputFrame:v14 outputFrame:v88];

  if (v89)
  {
    [v89 setInputTex:v120];
    if (objc_opt_respondsToSelector())
    {
      v90 = [v5 outputTex];
      [v89 setOutputTex:v90];
    }
    if (objc_opt_respondsToSelector())
    {
      v91 = [v5 outputLumaTex];
      [v89 setOutputLumaTex:v91];
    }
    if (objc_opt_respondsToSelector())
    {
      v92 = [v5 outputChromaTex];
      [v89 setOutputChromaTex:v92];
    }
    int v93 = [(SoftISPStage *)v17->_downstreamStage runWithArgs:v89];
    if (v93)
    {
      int v108 = v93;
      FigDebugAssert3();
      FigSignalErrorAt();
    }
    else
    {
      v94 = [v5 outputFrame];
      v95 = (__CVBuffer *)[v94 pixelBuffer];
      CFStringRef v96 = (const __CFString *)*MEMORY[0x263F04238];
      CFTypeRef v97 = CVBufferCopyAttachment(v95, (CFStringRef)*MEMORY[0x263F04238], 0);

      if (v97)
      {
        v98 = [v5 outputFrame];
        v99 = v14;
        uint64_t v100 = [v98 pixelBuffer];
        v101 = NSNumber;
        [v5 inputFrame];
        v122 = v16;
        id v102 = v5;
        v104 = v103 = v35;
        if (-[SoftISPInputFrame firstPixel]((uint64_t)v104) == 1) {
          uint64_t v105 = 0;
        }
        else {
          uint64_t v105 = 3;
        }
        v106 = (const void *)[v101 numberWithInt:v105];
        v107 = (__CVBuffer *)v100;
        id v14 = v99;
        CVBufferSetAttachment(v107, v96, v106, kCVAttachmentMode_ShouldPropagate);

        v35 = v103;
        id v5 = v102;
        v16 = v122;

        CFRelease(v97);
      }
      int v108 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v108 = FigSignalErrorAt();
  }
  id v4 = v116;
LABEL_48:
  FigMetalDecRef();
  [0 endEncoding];

  return v108;
}

uint64_t __30__QuadraBinStage_runWithArgs___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __30__QuadraBinStage_runWithArgs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (QuadraBinShaders)shaders
{
  return self->_shaders;
}

- (SoftISPStaticParameters)staticParameters
{
  return self->_staticParameters;
}

- (unsigned)outputDownscaleFactor
{
  return self->_outputDownscaleFactor;
}

- (SoftISPStage)downstreamStage
{
  return self->_downstreamStage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downstreamStage, 0);
  objc_storeStrong((id *)&self->_staticParameters, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_10to8CompressionLUT, 0);

  objc_storeStrong((id *)&self->_8to10ExpansionLUT, 0);
}

@end
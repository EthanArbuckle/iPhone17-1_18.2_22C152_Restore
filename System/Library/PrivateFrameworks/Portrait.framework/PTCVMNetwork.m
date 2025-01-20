@interface PTCVMNetwork
+ (id)lastNetworkVersion;
- (BOOL)highResNetwork;
- (BOOL)rotated;
- (PTCVMNetwork)initWithMetalContext:(id)a3 colorSize:(id *)a4 effectUtil:(id)a5 util:(id)a6 useHighResNetwork:(BOOL)a7 sharedResources:(id)a8;
- (id)inPrevDisparity;
- (id)inRGBA;
- (id)networkVersionString;
- (id)outDisparity;
- (int)networkVersionID;
- (unint64_t)getLayoutFromSize:(id *)a3;
- (unsigned)executeNetwork:(int64_t)a3;
- (void)bindColorInputPixelBuffer:(__CVBuffer *)a3;
- (void)dealloc;
- (void)reset;
@end

@implementation PTCVMNetwork

- (void)bindColorInputPixelBuffer:(__CVBuffer *)a3
{
  self->_inputPixelBuffer = a3;
  if (a3)
  {
    id v7 = [(PTMetalContext *)self->_metalContext device];
    v5 = +[PTPixelBufferUtil createTextureFromPixelBuffer:a3 device:v7];
    inRGBA = self->_inRGBA;
    self->_inRGBA = v5;
  }
}

- (void)reset
{
  v3 = [(PTMetalContext *)self->_metalContext commandQueue];
  v4 = [v3 commandBuffer];

  if (!v4)
  {
    v5 = _PTLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PTEffect updateEffectDelegate:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  [(PTEffectUtil *)self->_effectUtil clearTexture:v4 outTex:self->_disparityInOut[self->_inDispIndex]];
  [(PTEffectUtil *)self->_effectUtil clearTexture:v4 outTex:self->_disparityInOut[self->_outDispIndex]];
  [v4 commit];
  [v4 waitUntilScheduled];
}

- (id)outDisparity
{
  outDisparityRotated = self->_outDisparityRotated;
  if (!outDisparityRotated) {
    outDisparityRotated = self->_disparityInOut[self->_outDispIndex];
  }
  v3 = outDisparityRotated;

  return v3;
}

- (BOOL)rotated
{
  return self->_outDisparityRotated != 0;
}

- (PTCVMNetwork)initWithMetalContext:(id)a3 colorSize:(id *)a4 effectUtil:(id)a5 util:(id)a6 useHighResNetwork:(BOOL)a7 sharedResources:(id)a8
{
  BOOL v9 = a7;
  v179[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v159 = a5;
  id v158 = a6;
  id v160 = a8;
  v162.receiver = self;
  v162.super_class = (Class)PTCVMNetwork;
  v16 = [(PTCVMNetwork *)&v162 init];
  if (v16)
  {
    v17 = v16;
    id v157 = v15;
    if (v9) {
      uint64_t v18 = 3;
    }
    else {
      uint64_t v18 = 2;
    }
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    *(void *)&buf[16] = a4->var2;
    uint64_t v19 = [(PTCVMNetwork *)v16 getLayoutFromSize:buf];
    kdebug_trace();
    v161.receiver = v17;
    v161.super_class = (Class)PTCVMNetwork;
    v20 = [(PTCVMNetwork *)&v161 init];
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      v24 = _PTLogSystem();
      v22 = v160;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        [(PTCVMNetwork *)v24 initWithMetalContext:v29 colorSize:v30 effectUtil:v31 util:v32 useHighResNetwork:v33 sharedResources:v34];
      }
      v25 = 0;
      id v15 = v157;
      v27 = v158;
      v26 = v159;
      goto LABEL_63;
    }
    PTKTraceInit();
    objc_storeStrong((id *)&v20->_metalContext, a3);
    v20->_useHighResNetwork = v9;
    objc_storeStrong((id *)&v20->_effectUtil, a5);
    objc_storeStrong((id *)&v20->_util, a6);
    v20->_frameId = 0;
    *(void *)&v20->_uint64_t outDispIndex = 1;
    char Bool = PTDefaultsPublicGetBool(@"harvesting.enabled", 0);
    v22 = v160;
    if (Bool)
    {
      uint64_t v154 = 0;
      v23 = 0;
      v24 = 0;
    }
    else
    {
      uint64_t v154 = objc_opt_new();
      v35 = [objc_alloc(MEMORY[0x1E4F4D830]) initWithInputPrioritization:v18 andParameters:v154];
      if (!v35)
      {
        v23 = _PTLogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          [(PTCVMNetwork *)v23 initWithMetalContext:v58 colorSize:v59 effectUtil:v60 util:v61 useHighResNetwork:v62 sharedResources:v63];
        }
        v64 = 0;
        v24 = 0;
        v25 = 0;
        id v15 = v157;
        v27 = v158;
        v26 = v159;
        v65 = (void *)v154;
        goto LABEL_62;
      }
      v24 = v35;
      v23 = [v35 inferenceDescriptor];
    }
    unint64_t var0 = a4->var0;
    unint64_t var1 = a4->var1;
    unint64_t v151 = var0;
    v38 = [v23 configurationNameForLayout:v19];
    v39 = [v23 networkURL];
    uint64_t v40 = [v39 absoluteString];

    v155 = (void *)v40;
    v156 = v38;
    if (!v40)
    {
      v49 = _PTLogSystem();
      id v15 = v157;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        [(PTCVMNetwork *)v49 initWithMetalContext:v51 colorSize:v52 effectUtil:v53 util:v54 useHighResNetwork:v55 sharedResources:v56];
      }
      v25 = 0;
      goto LABEL_61;
    }
    v41 = [v23 colorInput];
    uint64_t v42 = [v41 name];
    inRGBAName = v20->_inRGBAName;
    v20->_inRGBAName = (NSString *)v42;

    v44 = [v23 prevDisparityInput];
    uint64_t v153 = [v44 name];

    v45 = [v23 disparityOutput];
    v46 = [v45 name];

    id v15 = v157;
    if (Bool)
    {
LABEL_31:
      executor = v20->_executor;
      if (!executor)
      {
        v78 = _PTLogSystem();
        v49 = v153;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
          [(PTCVMNetwork *)v78 initWithMetalContext:v81 colorSize:v82 effectUtil:v83 util:v84 useHighResNetwork:v85 sharedResources:v86];
        }
        v25 = 0;
        goto LABEL_60;
      }
      v78 = [(PTEspressoGenericExecutor *)executor networkVersion];
      if ([v78 isEqualToString:@"bkkidb647v_iteration_105001"])
      {
        int v79 = 4;
      }
      else
      {
        if (![v78 isEqualToString:@"a9mp7cfxah_iteration_45000"])
        {
          v20->_networkVersionID = 0;
LABEL_41:
          uint64_t v87 = [(PTEspressoGenericExecutor *)v20->_executor getInputResourceWithName:v20->_inRGBAName];
          inRGBA = v20->_inRGBA;
          v20->_inRGBA = (MTLTexture *)v87;

          if (v20->_inRGBA)
          {
            unint64_t v89 = var1;
            uint64_t v90 = [(PTEspressoGenericExecutor *)v20->_executor getInputResourceWithName:v153];
            disparityInOut = v20->_disparityInOut;
            uint64_t inDispIndex = v20->_inDispIndex;
            v93 = v20->_disparityInOut[inDispIndex];
            v20->_disparityInOut[inDispIndex] = (MTLTexture *)v90;

            if (v20->_disparityInOut[v20->_inDispIndex])
            {
              uint64_t v94 = [(PTEspressoGenericExecutor *)v20->_executor getOutputResourceWithName:v46];
              uint64_t outDispIndex = v20->_outDispIndex;
              v96 = disparityInOut[outDispIndex];
              disparityInOut[outDispIndex] = (MTLTexture *)v94;

              if (disparityInOut[v20->_outDispIndex])
              {
                v148 = v46;
                if (v151 >= v89) {
                  goto LABEL_47;
                }
                v97 = [(PTMetalContext *)v20->_metalContext textureUtil];
                uint64_t v98 = objc_msgSend(v97, "createWithWidth:height:pixelFormat:", -[MTLTexture height](v20->_inRGBA, "height"), -[MTLTexture width](v20->_inRGBA, "width"), -[MTLTexture pixelFormat](v20->_inRGBA, "pixelFormat"));
                inRGBARotated = v20->_inRGBARotated;
                v20->_inRGBARotated = (MTLTexture *)v98;

                if (v20->_inRGBARotated)
                {
                  v100 = [(PTMetalContext *)v20->_metalContext textureUtil];
                  uint64_t v101 = objc_msgSend(v100, "createWithWidth:height:pixelFormat:", -[MTLTexture height](v20->_disparityInOut[1], "height"), -[MTLTexture width](v20->_disparityInOut[1], "width"), -[MTLTexture pixelFormat](v20->_disparityInOut[1], "pixelFormat"));
                  outDisparityRotated = v20->_outDisparityRotated;
                  v20->_outDisparityRotated = (MTLTexture *)v101;

                  if (!v20->_outDisparityRotated)
                  {
                    v134 = _PTLogSystem();
                    if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR)) {
                      [(PTCVMNetwork *)v134 initWithMetalContext:v136 colorSize:v137 effectUtil:v138 util:v139 useHighResNetwork:v140 sharedResources:v141];
                    }

                    v25 = 0;
                    goto LABEL_50;
                  }
LABEL_47:
                  v103 = _PTLogSystem();
                  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
                  {
                    v142 = v20->_inRGBAName;
                    uint64_t v152 = [(MTLTexture *)v20->_inRGBA width];
                    uint64_t v150 = [(MTLTexture *)v20->_inRGBA height];
                    uint64_t v143 = [(MTLTexture *)v20->_disparityInOut[1] width];
                    uint64_t v144 = [(MTLTexture *)v20->_disparityInOut[1] height];
                    uint64_t v145 = [(MTLTexture *)v20->_disparityInOut[0] width];
                    uint64_t v146 = [(MTLTexture *)v20->_disparityInOut[0] height];
                    *(_DWORD *)buf = 138414338;
                    *(void *)&buf[4] = v142;
                    v22 = v160;
                    *(_WORD *)&buf[12] = 2048;
                    *(void *)&buf[14] = v152;
                    *(_WORD *)&buf[22] = 2048;
                    uint64_t v164 = v150;
                    __int16 v165 = 2112;
                    v166 = v148;
                    __int16 v167 = 2048;
                    uint64_t v168 = v143;
                    __int16 v169 = 2048;
                    uint64_t v170 = v144;
                    id v15 = v157;
                    __int16 v171 = 2112;
                    uint64_t v172 = v153;
                    __int16 v173 = 2048;
                    uint64_t v174 = v145;
                    __int16 v175 = 2048;
                    uint64_t v176 = v146;
                    _os_log_debug_impl(&dword_1D0778000, v103, OS_LOG_TYPE_DEBUG, "Init disparity network: %@ (%lux%lu) %@ (%lux%lu) %@ (%lux%lu)", buf, 0x5Cu);
                  }

                  [(PTCVMNetwork *)v20 reset];
                  [(MTLTexture *)disparityInOut[v20->_outDispIndex] width];
                  [(MTLTexture *)disparityInOut[v20->_outDispIndex] height];
                  [(MTLTexture *)disparityInOut[v20->_outDispIndex] pixelFormat];
                  kdebug_trace();
                  v25 = v20;
LABEL_50:
                  v49 = v153;
                  v46 = v148;
LABEL_60:

LABEL_61:
                  v27 = v158;
                  v26 = v159;
                  v65 = (void *)v154;

                  v64 = v23;
LABEL_62:

LABEL_63:
                  goto LABEL_64;
                }
                v104 = _PTLogSystem();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
                  [(PTCVMNetwork *)v104 initWithMetalContext:v127 colorSize:v128 effectUtil:v129 util:v130 useHighResNetwork:v131 sharedResources:v132];
                }
              }
              else
              {
                v104 = _PTLogSystem();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
                  [(PTCVMNetwork *)v104 initWithMetalContext:v120 colorSize:v121 effectUtil:v122 util:v123 useHighResNetwork:v124 sharedResources:v125];
                }
              }
            }
            else
            {
              v104 = _PTLogSystem();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
                [(PTCVMNetwork *)v104 initWithMetalContext:v113 colorSize:v114 effectUtil:v115 util:v116 useHighResNetwork:v117 sharedResources:v118];
              }
            }
          }
          else
          {
            v104 = _PTLogSystem();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
              [(PTCVMNetwork *)v104 initWithMetalContext:v106 colorSize:v107 effectUtil:v108 util:v109 useHighResNetwork:v110 sharedResources:v111];
            }
          }

          v25 = 0;
          v49 = v153;
          goto LABEL_60;
        }
        int v79 = 7;
      }
      v20->_networkVersionID = v79;
      goto LABEL_41;
    }
    v47 = v46;
    v48 = [v160 effectNetworkConfig];
    unint64_t v149 = var1;
    if (v38 != v48)
    {
      v46 = [v160 effectNetworkConfig];
      if (([v38 isEqualToString:v46] & 1) == 0)
      {

LABEL_29:
        v147 = [PTEspressoGenericExecutor alloc];
        metalContext = v20->_metalContext;
        v71 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v155];
        v179[0] = v20->_inRGBAName;
        v179[1] = v153;
        v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v179 count:2];
        v178 = v47;
        v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v178 count:1];
        v177[0] = v153;
        v177[1] = v47;
        v22 = v160;
        v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v177 count:2];
        uint64_t v75 = [(PTEspressoGenericExecutor *)v147 initWithMetalContext:metalContext url:v71 inputNames:v72 outputNames:v73 tensorSwapNames:v74 reshapeNetworkSize:0 configuration:v156];
        v76 = v20->_executor;
        v20->_executor = (PTEspressoGenericExecutor *)v75;

        id v15 = v157;
        v46 = v47;

        [v160 setEffectNetwork:v20->_executor];
        [v160 setEffectNetworkConfig:v156];
        [v160 setEffectNetworkPath:v155];
        goto LABEL_30;
      }
    }
    v66 = [v160 effectNetworkPath];
    int v67 = [v155 isEqualToString:v66];

    if (v156 == v48)
    {

      if (!v67) {
        goto LABEL_29;
      }
    }
    else
    {

      if ((v67 & 1) == 0) {
        goto LABEL_29;
      }
    }
    uint64_t v68 = [v160 effectNetwork];
    v69 = v20->_executor;
    v20->_executor = (PTEspressoGenericExecutor *)v68;

    v46 = v47;
LABEL_30:
    unint64_t var1 = v149;
    goto LABEL_31;
  }
  v25 = 0;
  v27 = v158;
  v26 = v159;
  v22 = v160;
LABEL_64:

  return v25;
}

- (id)networkVersionString
{
  v2 = NSString;
  uint64_t networkVersionID = self->_networkVersionID;
  v4 = [(PTEspressoGenericExecutor *)self->_executor networkVersion];
  v5 = [v2 stringWithFormat:@"CVM %i (%@)", networkVersionID, v4];

  return v5;
}

- (unint64_t)getLayoutFromSize:(id *)a3
{
  uint64_t v3 = 0;
  unint64_t result = 255;
  float v5 = 3.4028e38;
  do
  {
    float v6 = vabds_f32(flt_1D081FF00[v3], (float)a3->var0 / (float)a3->var1);
    if (v6 < v5)
    {
      unint64_t result = qword_1D081FF10[v3];
      float v5 = v6;
    }
    ++v3;
  }
  while (v3 != 4);
  return result;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_inRGBAAppleDepthRunner);
  CVPixelBufferRelease(self->_outDisparityAppleDepthRunner);
  CVPixelBufferRelease(self->_inTemporalDisparityAppleDepthRunner);
  v3.receiver = self;
  v3.super_class = (Class)PTCVMNetwork;
  [(PTCVMNetwork *)&v3 dealloc];
}

- (id)inRGBA
{
  inRGBARotated = self->_inRGBARotated;
  if (!inRGBARotated) {
    inRGBARotated = self->_inRGBA;
  }
  objc_super v3 = inRGBARotated;

  return v3;
}

- (id)inPrevDisparity
{
  return self->_disparityInOut[self->_inDispIndex];
}

- (unsigned)executeNetwork:(int64_t)a3
{
  self->_frameIndex = a3;
  if (self->_inputPixelBuffer)
  {
    unsigned int v4 = -[PTEspressoGenericExecutor bindInputResourceWithName:to:](self->_executor, "bindInputResourceWithName:to:", self->_inRGBAName);
    if (v4)
    {
      int v5 = v4;
      float v6 = _PTLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[PTCVMNetwork executeNetwork:](v5, v6);
      }
    }
  }
  [(PTEspressoGenericExecutor *)self->_executor tensorSwap:self->_frameId];
  int frameId = self->_frameId;
  int v8 = frameId & 1;
  if (frameId < 0) {
    int v8 = -v8;
  }
  BOOL v9 = __OFADD__(frameId, 1);
  int v10 = frameId + 1;
  int v11 = v10 & 1;
  if (v10 < 0 != v9) {
    int v11 = -v11;
  }
  self->_uint64_t outDispIndex = v11;
  self->_uint64_t inDispIndex = v8;
  self->_int frameId = v10;
  uint64_t v12 = PTDefaultsGetDictionary();
  [(PTCVMNetwork *)self dumpNetworkInputWithDefaults:v12];
  [(MTLTexture *)self->_disparityInOut[self->_outDispIndex] width];
  [(MTLTexture *)self->_disparityInOut[self->_outDispIndex] height];
  kdebug_trace();
  executor = self->_executor;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __31__PTCVMNetwork_executeNetwork___block_invoke;
  v27[3] = &unk_1E6884200;
  v27[4] = self;
  unsigned int v14 = [(PTEspressoGenericExecutor *)executor executeAsync:v27];
  [(PTCVMNetwork *)self dumpNetworkOutputWithDefaults:v12];
  if (self->_outDisparityRotated)
  {
    id v15 = [(PTMetalContext *)self->_metalContext commandBuffer];

    if (!v15)
    {
      v16 = _PTLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PTCVMNetwork executeNetwork:](v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    util = self->_util;
    v25 = [(PTMetalContext *)self->_metalContext commandBuffer];
    [(PTUtil *)util rotateTexture:v25 inTex:self->_disparityInOut[self->_outDispIndex] outTex:self->_outDisparityRotated rotationDegrees:4294967206];

    [(PTMetalContext *)self->_metalContext commit];
  }

  return v14;
}

uint64_t __31__PTCVMNetwork_executeNetwork___block_invoke()
{
  return kdebug_trace();
}

- (BOOL)highResNetwork
{
  return self->_useHighResNetwork;
}

- (int)networkVersionID
{
  return self->_networkVersionID;
}

+ (id)lastNetworkVersion
{
  return @"N/A";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_effectUtil, 0);
  objc_storeStrong((id *)&self->_inRGBAName, 0);
  objc_storeStrong((id *)&self->_outDisparityRotated, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_disparityInOut[i + 1], 0);
  objc_storeStrong((id *)&self->_inRGBARotated, 0);
  objc_storeStrong((id *)&self->_inRGBA, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_reinjectDisparity, 0);

  objc_storeStrong((id *)&self->_executor, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)executeNetwork:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)executeNetwork:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  objc_super v3 = "status";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Assertion failed %s %i", (uint8_t *)&v2, 0x12u);
}

@end
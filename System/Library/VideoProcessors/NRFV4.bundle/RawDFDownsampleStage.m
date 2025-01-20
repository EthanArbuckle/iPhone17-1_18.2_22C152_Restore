@interface RawDFDownsampleStage
+ (int)prewarmShaders:(id)a3;
- (RawDFDownsampleStage)initWithMetalContext:(id)a3;
- (int)generateWithInputTexture:(id)a3 withRequests:(id)a4;
- (int)simpleResampleWithInputTex:(id)a3 outputRect:(id)a4 outputTex:;
- (int)simpleResampleWithInputTex:(id)a3 outputTex:(id)a4;
@end

@implementation RawDFDownsampleStage

- (RawDFDownsampleStage)initWithMetalContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RawDFDownsampleStage;
  v6 = [(RawDFDownsampleStage *)&v14 init];
  v7 = v6;
  if (!v6
    || !v5
    || (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[RawDFDownsampleShaders alloc] initWithMetal:v5], shaders = v7->_shaders, v7->_shaders = v8, shaders, v10 = v7, !v7->_shaders))
  {
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = 0;
  }
  v11 = v10;

  return v11;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[RawDFDownsampleShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (int)generateWithInputTexture:(id)a3 withRequests:(id)a4
{
  v190 = self;
  uint64_t v223 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  id v207 = 0;
  if (!v6)
  {
    v141 = v7;
    LODWORD(v218[0]) = 0;
    LOBYTE(v198) = 0;
    v176 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT);
LABEL_191:
    int v139 = -73328;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v105 = 0;
    id v191 = 0;
    id v194 = 0;
    id v195 = 0;
    v140 = 0;
    v103 = 0;
    goto LABEL_142;
  }
  if (!v7)
  {
    v141 = 0;
    LODWORD(v218[0]) = 0;
    LOBYTE(v198) = 0;
    v176 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT);
    goto LABEL_191;
  }
  if (![v7 count] || objc_msgSend(v6, "pixelFormat") != 115 && objc_msgSend(v6, "pixelFormat") != 520)
  {
    v141 = v8;
    LODWORD(v218[0]) = 0;
    LOBYTE(v198) = 0;
    v176 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT);
    goto LABEL_191;
  }
  v185 = v8;
  id v186 = v6;
  long long v205 = 0u;
  long long v206 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v203 objects:v220 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v204;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v204 != v13) {
          objc_enumerationMutation(v9);
        }
        unint64_t v15 = [*(id *)(*((void *)&v203 + 1) + 8 * i) downsampleLevel];
        if (!v15)
        {
          LODWORD(v218[0]) = 0;
          LOBYTE(v198) = 0;
          v136 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v137 = v218[0];
          if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v138 = v137;
          }
          else {
            unsigned int v138 = v137 & 0xFFFFFFFE;
          }
          if (v138)
          {
            int v208 = 136315138;
            v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
            _os_log_send_and_compose_impl();
          }
          id v6 = v186;
          int v139 = -73328;
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          v105 = 0;
          id v191 = 0;
          id v194 = 0;
          id v195 = 0;
          v140 = 0;
          v103 = 0;
          v141 = v185;
          goto LABEL_142;
        }
        if (v15 > v12) {
          unint64_t v12 = v15;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v203 objects:v220 count:16];
    }
    while (v11);
  }
  else
  {
    unint64_t v12 = 0;
  }
  uint64_t v182 = v4;

  v183 = &v179;
  MEMORY[0x270FA5388]();
  v16 = (id *)((char *)&v179 - ((8 * (v12 + 1) + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v16, 8 * (v12 + 1));
  MEMORY[0x270FA5388]();
  bzero(v16, 8 * (v12 + 1));
  uint64_t v17 = 0;
  do
  {
    id v18 = v16[v17];
    v16[v17] = 0;

    id v19 = v16[v17];
    v16[v17] = 0;

    ++v17;
  }
  while (v12 + 1 != v17);
  v193 = (char *)&v179 - ((8 * (v12 + 1) + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v201 = 0u;
  long long v202 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  v20 = v9;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v199 objects:v219 count:16];
  if (!v21)
  {
LABEL_33:

    v29 = [(FigMetalContext *)v190->_metal allocator];
    v30 = (void *)[v29 newTextureDescriptor];

    if (!v30)
    {
      LODWORD(v218[0]) = 0;
      LOBYTE(v198) = 0;
      v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v177 = v218[0];
      if (os_log_type_enabled(v20, (os_log_type_t)v198)) {
        unsigned int v178 = v177;
      }
      else {
        unsigned int v178 = v177 & 0xFFFFFFFE;
      }
      if (v178)
      {
        int v208 = 136315138;
        v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
        _os_log_send_and_compose_impl();
      }
      v147 = v193;
      LODWORD(v184) = -73328;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_135;
    }
    v31 = [v30 desc];
    [v31 setUsage:7];

    id v32 = v186;
    id v195 = (id)[v186 width];
    id v194 = (id)[v32 height];
    v192 = (id *)((char *)&v179 - ((8 * (v12 + 1) + 15) & 0xFFFFFFFFFFFFFFF0));
    v34 = v193;
    if (!v12)
    {
      LODWORD(v184) = 0;
      goto LABEL_96;
    }
    LODWORD(v184) = 0;
    uint64_t v35 = 1;
    *(void *)&long long v33 = 136315394;
    long long v181 = v33;
    *(void *)&long long v33 = 136315650;
    long long v188 = v33;
    *(void *)&long long v33 = 136316162;
    long long v187 = v33;
    LODWORD(v191) = 1;
LABEL_36:
    v218[0] = v16[v35];
    id v189 = (id)v35;
    id v36 = *(id *)&v34[8 * v35];
    uint64_t v37 = 0;
    v218[1] = v36;
    BOOL v38 = ((v195 | v194) & 1) == 0;
    LODWORD(v191) = v191 & v38;
    id v194 = (id)(((unint64_t)v194 + 1) >> 1);
    id v195 = (id)(((unint64_t)v195 + 1) >> 1);
    char v39 = 1;
    while (1)
    {
      char v40 = v39;
      id v41 = (id)v218[v37];
      uint64_t v37 = (uint64_t)v41;
      if (!v41) {
        goto LABEL_52;
      }
      int v42 = [v41 outputType];
      if (v42 == 1) {
        break;
      }
      if (!v42)
      {
        v43 = [v30 desc];
        v44 = v43;
        uint64_t v45 = 115;
LABEL_42:
        [v43 setPixelFormat:v45];
      }
      if (([(id)v37 relaxDimensionRequirement] & 1) == 0)
      {
        if (!v38)
        {
          unsigned int v198 = 0;
          os_log_type_t v197 = OS_LOG_TYPE_DEFAULT;
          v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v85 = v198;
          if (os_log_type_enabled(v66, v197)) {
            unsigned int v86 = v85;
          }
          else {
            unsigned int v86 = v85 & 0xFFFFFFFE;
          }
          if (v86)
          {
LABEL_84:
            id v184 = [(id)v37 outputTexLabel];
            uint64_t v89 = [v184 UTF8String];
            id v90 = v186;
            uint64_t v180 = [v186 width];
            int v91 = [v90 height];
            int v208 = v187;
            v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
            __int16 v210 = 2080;
            uint64_t v211 = v89;
            __int16 v212 = 1024;
            int v213 = (int)v189;
            __int16 v214 = 1024;
            int v215 = v180;
            __int16 v216 = 1024;
            int v217 = v91;
            _os_log_send_and_compose_impl();
          }
LABEL_86:
          v16 = v192;
          v34 = v193;
          goto LABEL_87;
        }
        if ((v191 & 1) == 0)
        {
          unsigned int v198 = 0;
          os_log_type_t v197 = OS_LOG_TYPE_DEFAULT;
          v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v87 = v198;
          if (os_log_type_enabled(v66, v197)) {
            unsigned int v88 = v87;
          }
          else {
            unsigned int v88 = v87 & 0xFFFFFFFE;
          }
          if (v88) {
            goto LABEL_84;
          }
          goto LABEL_86;
        }
      }
      v46 = [v30 desc];
      [v46 setWidth:v195];

      v47 = [v30 desc];
      [v47 setHeight:v194];

      v48 = [(id)v37 outputTex];

      if (v48)
      {
        v49 = [(id)v37 outputTex];
        uint64_t v50 = [v49 width];
        v51 = [v30 desc];
        uint64_t v52 = [v51 width];

        if (v50 != v52)
        {
          unsigned int v198 = 0;
          os_log_type_t v197 = OS_LOG_TYPE_DEFAULT;
          v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v67 = v198;
          if (os_log_type_enabled(v66, v197)) {
            unsigned int v68 = v67;
          }
          else {
            unsigned int v68 = v67 & 0xFFFFFFFE;
          }
          if (v68)
          {
            v69 = [(id)v37 outputTex];
            id v184 = [v69 label];
            uint64_t v70 = [v184 UTF8String];
            v71 = [v30 desc];
            int v72 = [v71 width];
            int v208 = v188;
            v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
            __int16 v210 = 2080;
            uint64_t v211 = v70;
            __int16 v212 = 1024;
            int v213 = v72;
            goto LABEL_69;
          }
LABEL_85:
          v16 = v192;
          v34 = v193;
LABEL_87:
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          goto LABEL_94;
        }
        v53 = [(id)v37 outputTex];
        uint64_t v54 = [v53 height];
        v55 = [v30 desc];
        uint64_t v56 = [v55 height];

        if (v54 != v56)
        {
          unsigned int v198 = 0;
          os_log_type_t v197 = OS_LOG_TYPE_DEFAULT;
          v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v73 = v198;
          if (os_log_type_enabled(v66, v197)) {
            unsigned int v74 = v73;
          }
          else {
            unsigned int v74 = v73 & 0xFFFFFFFE;
          }
          if (v74)
          {
            v69 = [(id)v37 outputTex];
            id v184 = [v69 label];
            uint64_t v75 = [v184 UTF8String];
            v71 = [v30 desc];
            int v76 = [v71 height];
            int v208 = v188;
            v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
            __int16 v210 = 2080;
            uint64_t v211 = v75;
            __int16 v212 = 1024;
            int v213 = v76;
LABEL_69:
            _os_log_send_and_compose_impl();
          }
          goto LABEL_85;
        }
        v57 = [(id)v37 outputTex];
        uint64_t v58 = [v57 pixelFormat];
        v59 = [v30 desc];
        uint64_t v60 = [v59 pixelFormat];

        _ZF = v58 == v60;
        v16 = v192;
        if (!_ZF)
        {
          unsigned int v198 = 0;
          os_log_type_t v197 = OS_LOG_TYPE_DEFAULT;
          v77 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v78 = v198;
          if (os_log_type_enabled(v77, v197)) {
            unsigned int v80 = v78;
          }
          else {
            unsigned int v80 = v78 & 0xFFFFFFFE;
          }
          if (v80)
          {
            v81 = [(id)v37 outputTex];
            id v184 = [v81 label];
            uint64_t v82 = [v184 UTF8String];
            v83 = [v30 desc];
            int v84 = [v83 pixelFormat];
            int v208 = v188;
            v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
            __int16 v210 = 2080;
            uint64_t v211 = v82;
            __int16 v212 = 1024;
            int v213 = v84;
            _os_log_send_and_compose_impl();
          }
          goto LABEL_93;
        }
      }
      else
      {
        [v30 setLabel:0];
        v62 = [(FigMetalContext *)v190->_metal allocator];
        v63 = (void *)[v62 newTextureWithDescriptor:v30];
        [(id)v37 setOutputTex:v63];

        v64 = [(id)v37 outputTex];

        if (!v64)
        {
          unsigned int v198 = 0;
          os_log_type_t v197 = OS_LOG_TYPE_DEFAULT;
          v77 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v92 = v198;
          if (os_log_type_enabled(v77, v197)) {
            unsigned int v93 = v92;
          }
          else {
            unsigned int v93 = v92 & 0xFFFFFFFE;
          }
          if (v93)
          {
            id v94 = [v30 label];
            uint64_t v95 = [v94 UTF8String];
            int v208 = v181;
            v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
            __int16 v210 = 2080;
            uint64_t v211 = v95;
            _os_log_send_and_compose_impl();
          }
LABEL_93:
          v34 = v193;
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          v16 = v192;
LABEL_94:
          LODWORD(v184) = -73328;

          LOBYTE(v37) = 0;
          goto LABEL_54;
        }
      }
LABEL_52:

      char v39 = 0;
      uint64_t v37 = 1;
      if ((v40 & 1) == 0)
      {
        v34 = v193;
LABEL_54:
        for (uint64_t j = 1; j != -1; --j)

        if ((v37 & 1) == 0)
        {
          v105 = 0;
          id v191 = 0;
          id v194 = 0;
          id v195 = 0;
          id v97 = 0;
          v103 = 0;
          goto LABEL_137;
        }
        uint64_t v35 = (uint64_t)v189 + 1;
        if (v189 == (id)v12)
        {
LABEL_96:
          v96 = v34;
          id v97 = v186;
          unint64_t v98 = (unint64_t)([v97 width] + 1) >> 1;
          v99 = [v30 desc];
          [v99 setWidth:v98];

          unint64_t v100 = (unint64_t)([v97 height] + 1) >> 1;
          v101 = [v30 desc];
          [v101 setHeight:v100];

          v102 = [v30 desc];
          [v102 setPixelFormat:115];

          v218[0] = 0;
          if (!v12)
          {
            v105 = 0;
            id v191 = 0;
            id v194 = 0;
            id v195 = 0;
            v103 = 0;
            v34 = v96;
            goto LABEL_137;
          }
          id v195 = 0;
          v103 = 0;
          id v104 = 0;
          id v191 = 0;
          v105 = 0;
          v106 = (void **)(v96 + 8);
          v107 = v16 + 1;
          __asm { FMOV            V8.2S, #1.0 }
          unint64_t v112 = v12;
          while (1)
          {
            id v113 = v207;
            id v207 = v105;

            if (*v107)
            {
              v114 = [*v107 outputTex];
            }
            else
            {
              v114 = 0;
            }
            id v115 = 0;
            if (!v114 && v112 != 1)
            {
              [v30 setLabel:0];
              v116 = [(FigMetalContext *)v190->_metal allocator];
              v117 = (void *)[v116 newTextureWithDescriptor:v30];

              if (!v117)
              {
                v165 = v103;
                id v166 = v97;
                unsigned int v198 = 0;
                os_log_type_t v197 = OS_LOG_TYPE_DEFAULT;
                v167 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v168 = v198;
                if (os_log_type_enabled(v167, v197)) {
                  unsigned int v169 = v168;
                }
                else {
                  unsigned int v169 = v168 & 0xFFFFFFFE;
                }
                if (v169)
                {
                  id v170 = [v30 label];
                  uint64_t v171 = [v170 UTF8String];
                  int v208 = 136315394;
                  v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
                  __int16 v210 = 2080;
                  uint64_t v211 = v171;
                  _os_log_send_and_compose_impl();
                }
                v16 = v192;
                v34 = v193;
                LODWORD(v184) = -73328;
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                v105 = 0;
                id v194 = 0;
                id v97 = v166;
                v103 = v165;
                goto LABEL_137;
              }
              id v115 = v117;
              v114 = v115;
            }
            id v194 = v114;
            id v189 = v115;
            v118 = [(FigMetalContext *)v190->_metal commandQueue];
            v119 = [v118 commandBuffer];

            if (!v119)
            {
              FigDebugAssert3();
              LODWORD(v184) = FigSignalErrorAt();
              id v195 = 0;
              v16 = v192;
              v34 = v193;
              v105 = v189;
              goto LABEL_137;
            }
            id v195 = v119;
            v120 = [v119 computeCommandEncoder];

            if (!v120)
            {
              id v151 = v97;
              unsigned int v198 = 0;
              os_log_type_t v197 = OS_LOG_TYPE_DEFAULT;
              v152 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v153 = v198;
              if (os_log_type_enabled(v152, v197)) {
                unsigned int v154 = v153;
              }
              else {
                unsigned int v154 = v153 & 0xFFFFFFFE;
              }
              if (v154)
              {
                int v208 = 136315138;
                v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
                _os_log_send_and_compose_impl();
              }
              v16 = v192;
              v147 = v193;
              LODWORD(v184) = -73328;
              fig_log_call_emit_and_clean_up_after_send_and_compose();

              v103 = 0;
              goto LABEL_171;
            }
            v103 = v120;
            if (!v190->_shaders->_kernelRawDFDownsample)
            {
              id v151 = v97;
              unsigned int v198 = 0;
              os_log_type_t v197 = OS_LOG_TYPE_DEFAULT;
              v155 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v156 = v198;
              if (os_log_type_enabled(v155, v197)) {
                unsigned int v157 = v156;
              }
              else {
                unsigned int v157 = v156 & 0xFFFFFFFE;
              }
              v147 = v193;
              if (v157)
              {
                int v208 = 136315138;
                v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
                _os_log_send_and_compose_impl();
              }
              v16 = v192;
              LODWORD(v184) = -73328;
              fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_171:
              id v97 = v151;
              v105 = v189;
              goto LABEL_136;
            }
            objc_msgSend(v120, "setComputePipelineState:");
            [v120 setImageblockWidth:16 height:16];
            if (!v97)
            {
              unsigned int v198 = 0;
              os_log_type_t v197 = OS_LOG_TYPE_DEFAULT;
              v158 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v159 = v198;
              if (os_log_type_enabled(v158, v197)) {
                unsigned int v160 = v159;
              }
              else {
                unsigned int v160 = v159 & 0xFFFFFFFE;
              }
              if (v160)
              {
                int v208 = 136315138;
                v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
                _os_log_send_and_compose_impl();
              }
              v16 = v192;
              v105 = v189;
              LODWORD(v184) = -73328;
              fig_log_call_emit_and_clean_up_after_send_and_compose();

              id v97 = 0;
              goto LABEL_181;
            }
            [v120 setTexture:v97 atIndex:0];
            id v121 = v194;
            [v120 setTexture:v194 atIndex:1];
            v122 = *v106;
            *(void *)&long long v188 = v97;
            if (v122)
            {
              uint64_t v123 = [v122 outputTex];

              v124 = (void *)v123;
              if (!v123)
              {
                unsigned int v198 = 0;
                os_log_type_t v197 = OS_LOG_TYPE_DEFAULT;
                v161 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v162 = v198;
                if (os_log_type_enabled(v161, v197)) {
                  unsigned int v164 = v162;
                }
                else {
                  unsigned int v164 = v162 & 0xFFFFFFFE;
                }
                if (v164)
                {
                  int v208 = 136315138;
                  v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
                  _os_log_send_and_compose_impl();
                }
                v16 = v192;
                id v97 = (id)v188;
                v105 = v189;
                LODWORD(v184) = -73328;
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                id v191 = 0;
LABEL_181:
                v34 = v193;
                goto LABEL_137;
              }
            }
            else
            {
              if (!v121)
              {
                id v172 = v97;
                unsigned int v198 = 0;
                os_log_type_t v197 = OS_LOG_TYPE_DEFAULT;
                v173 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v174 = v198;
                if (os_log_type_enabled(v173, v197)) {
                  unsigned int v175 = v174;
                }
                else {
                  unsigned int v175 = v174 & 0xFFFFFFFE;
                }
                if (v175)
                {
                  int v208 = 136315138;
                  v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
                  _os_log_send_and_compose_impl();
                }
                v16 = v192;
                LODWORD(v184) = -73328;
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                id v194 = 0;
                id v97 = v172;
                v105 = v189;
                goto LABEL_181;
              }

              v124 = 0;
            }
            id v191 = v124;
            [v120 setTexture:v124 atIndex:2];
            v125 = [v30 desc];
            unint64_t v126 = [v125 width];

            v127 = [v30 desc];
            unint64_t v128 = [v127 height];

            v129.f32[0] = (float)v126;
            v129.f32[1] = (float)v128;
            v218[0] = vdiv_f32(_D8, v129);
            [v103 setBytes:v218 length:8 atIndex:0];
            v196[0] = v126;
            v196[1] = v128;
            v196[2] = 1;
            int64x2_t v221 = vdupq_n_s64(0x10uLL);
            uint64_t v222 = 1;
            [v103 dispatchThreads:v196 threadsPerThreadgroup:&v221];
            *(void *)&long long v187 = v103;
            [v103 endEncoding];
            [v195 commit];
            v130 = [v30 desc];
            unint64_t v131 = (unint64_t)([v130 width] + 1) >> 1;
            v132 = [v30 desc];
            [v132 setWidth:v131];

            v133 = [v30 desc];
            unint64_t v134 = (unint64_t)([v133 height] + 1) >> 1;
            v135 = [v30 desc];
            [v135 setHeight:v134];

            id v104 = v194;
            if (v207) {
              FigMetalDecRef();
            }
            ++v106;
            ++v107;
            id v97 = v104;
            --v112;
            v103 = (void *)v187;
            v105 = v189;
            if (!v112)
            {
              id v194 = v104;
              id v97 = v104;
              v16 = v192;
              v34 = v193;
              goto LABEL_137;
            }
          }
        }
        goto LABEL_36;
      }
    }
    v43 = [v30 desc];
    v44 = v43;
    uint64_t v45 = 25;
    goto LABEL_42;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v200;
LABEL_22:
  uint64_t v24 = 0;
  while (1)
  {
    if (*(void *)v200 != v23) {
      objc_enumerationMutation(v20);
    }
    v25 = *(void **)(*((void *)&v199 + 1) + 8 * v24);
    int v26 = [v25 outputType];
    if (v26 == 1)
    {
      uint64_t v28 = [v25 downsampleLevel];
      v27 = v193;
      if (*(void *)&v193[8 * v28])
      {
        LODWORD(v218[0]) = 0;
        LOBYTE(v198) = 0;
        v142 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        int v145 = v218[0];
        if (!os_log_type_enabled(v142, (os_log_type_t)v198)) {
          v145 &= ~1u;
        }
        if (v145) {
          goto LABEL_133;
        }
        goto LABEL_134;
      }
      goto LABEL_30;
    }
    if (!v26) {
      break;
    }
LABEL_31:
    if (v22 == ++v24)
    {
      uint64_t v22 = [v20 countByEnumeratingWithState:&v199 objects:v219 count:16];
      if (!v22) {
        goto LABEL_33;
      }
      goto LABEL_22;
    }
  }
  v27 = (char *)&v179 - ((8 * (v12 + 1) + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v16[[v25 downsampleLevel]])
  {
LABEL_30:
    objc_storeStrong((id *)&v27[8 * [v25 downsampleLevel]], v25);
    goto LABEL_31;
  }
  LODWORD(v218[0]) = 0;
  LOBYTE(v198) = 0;
  v142 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  int v143 = v218[0];
  if (!os_log_type_enabled(v142, (os_log_type_t)v198)) {
    v143 &= ~1u;
  }
  if (v143)
  {
LABEL_133:
    int v146 = [v25 downsampleLevel];
    int v208 = 136315394;
    v209 = "-[RawDFDownsampleStage generateWithInputTexture:withRequests:]";
    __int16 v210 = 1024;
    LODWORD(v211) = v146;
    _os_log_send_and_compose_impl();
  }
LABEL_134:
  v147 = v193;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  LODWORD(v184) = -73328;
LABEL_135:

  v30 = 0;
  v105 = 0;
  id v191 = 0;
  id v194 = 0;
  id v195 = 0;
  id v97 = 0;
  v103 = 0;
LABEL_136:
  v34 = v147;
LABEL_137:
  uint64_t v148 = v12;
  uint64_t v149 = 8 * v12;
  do
  {

    v149 -= 8;
  }
  while (v149 != -8);
  v140 = v97;
  do

  while (v148 != -1);
  v141 = v185;
  id v6 = v186;
  int v139 = (int)v184;
LABEL_142:

  return v139;
}

- (int)simpleResampleWithInputTex:(id)a3 outputTex:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  LODWORD(self) = -[RawDFDownsampleStage simpleResampleWithInputTex:outputRect:outputTex:](self, "simpleResampleWithInputTex:outputRect:outputTex:", v7, v6, COERCE_DOUBLE(__PAIR64__([v6 height], objc_msgSend(v6, "width"))));

  return (int)self;
}

- (int)simpleResampleWithInputTex:(id)a3 outputRect:(id)a4 outputTex:
{
  uint32x2_t v20 = v4;
  v26[20] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  v26[0] = 0;
  if (!v7
    || !v8
    || [v8 width] < (unint64_t)v20.u32[0]
    || [v9 height] < (unint64_t)v20.u32[1])
  {
    int v25 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    int v16 = -73328;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_10:

    goto LABEL_8;
  }
  uint64_t v10 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v11 = [v10 commandBuffer];

  if (!v11)
  {
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
    goto LABEL_8;
  }
  unint64_t v12 = [v11 computeCommandEncoder];
  if (!v12)
  {
    int v25 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    int v16 = -73328;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_10;
  }
  uint64_t v13 = v12;
  [v12 setComputePipelineState:self->_shaders->_kernelRawDFResample];
  float v19 = (float)(unint64_t)[v7 width];
  unint64_t v14 = [v7 height];
  v15.f32[0] = v19;
  v15.f32[1] = (float)v14;
  v26[0] = vdiv_f32(v15, vcvt_f32_u32(v20));
  [v13 setBytes:v26 length:8 atIndex:0];
  [v13 setTexture:v7 atIndex:0];
  [v13 setTexture:v9 atIndex:1];
  [v13 setImageblockWidth:32 height:32];
  v23[0] = [v9 width];
  v23[1] = [v9 height];
  v23[2] = 1;
  int64x2_t v21 = vdupq_n_s64(0x20uLL);
  uint64_t v22 = 1;
  [v13 dispatchThreads:v23 threadsPerThreadgroup:&v21];
  [v13 endEncoding];
  [v11 commit];

  int v16 = 0;
LABEL_8:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end
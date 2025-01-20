@interface RawDFSyntheticLongStage
+ (int)_fillConstants:(id *)a3 slPlist:(id)a4 frameProperties:(id *)a5;
+ (int)_fillConstantsForBand:(int)a3 consts:(id *)a4 slPlist:(id)a5 frameProperties:(id *)a6;
+ (int)fillFrameProperties:(id *)a3 withEv0Properties:(id)a4 withLongProperties:(id)a5 ev0Count:(int)a6;
+ (int)prewarmShaders:(id)a3;
- (RawDFSyntheticLongStage)initWithMetalContext:(id)a3;
- (id)createIntermediateMetalTexture:(id)a3 withPixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (int)fuseRefEv0Pyramid:(id)a3 withEv0Pyramids:(id)a4 frameProperties:(id *)a5 slPlist:(id)a6 lscGainsTex:(id)a7 outputSyntheticEv0:(id *)a8 outputWeightsPyramid:(id)a9;
- (int)fuseRefSyntheticEv0Pyramid:(id)a3 withLongPyramid:(id)a4 syntheticEv0WeightsPyramid:(id)a5 frameProperties:(id *)a6 slPlist:(id)a7 lscGainsTex:(id)a8 outputSyntheticLong:(id *)a9 outputNoiseDivisorSyntheticEv0:(id *)a10 outputNoiseDivisorSyntheticLong:(id *)a11;
@end

@implementation RawDFSyntheticLongStage

- (RawDFSyntheticLongStage)initWithMetalContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RawDFSyntheticLongStage;
  v6 = [(RawDFSyntheticLongStage *)&v14 init];
  v7 = v6;
  if (!v6
    || !v5
    || (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[RawDFSyntheticLongShaders alloc] initWithMetal:v5], shaders = v7->_shaders, v7->_shaders = v8, shaders, v10 = v7, !v7->_shaders))
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
  v4 = [[RawDFSyntheticLongShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (id)createIntermediateMetalTexture:(id)a3 withPixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  id v10 = a3;
  v11 = [(FigMetalContext *)self->_metal allocator];
  v12 = (void *)[v11 newTextureDescriptor];

  if (!v12) {
    goto LABEL_6;
  }
  v13 = [v12 desc];
  [v13 setTextureType:2];

  objc_super v14 = [v12 desc];
  [v14 setWidth:a5];

  uint64_t v15 = [v12 desc];
  [v15 setHeight:a6];

  v16 = [v12 desc];
  [v16 setUsage:7];

  v17 = [v12 desc];
  [v17 setPixelFormat:a4];

  [v12 setLabel:v10];
  v18 = [(FigMetalContext *)self->_metal allocator];
  v19 = (void *)[v18 newTextureWithDescriptor:v12];

  if (!v19)
  {
LABEL_6:
    v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v19 = 0;
  }

  return v19;
}

+ (int)_fillConstants:(id *)a3 slPlist:(id)a4 frameProperties:(id *)a5
{
  v7 = (void **)a4;
  v8 = v7;
  if (a3 && v7 && a5)
  {
    float var1 = a5->var1;
    a3[1].var6.var0 = interpolate_with_gain(v7[7], var1);
    a3[2].var2.var2 = interpolate_with_gain(v8[2], var1);
    a3[2].var2.var3 = interpolate_with_gain(v8[3], var1);
    a3[2].var0 = interpolate_with_gain(v8[4], var1);
    a3[2].float var1 = interpolate_with_gain(v8[5], var1);
    int v10 = 0;
    a3[2].var2.var0 = interpolate_with_gain(v8[6], var1);
    long long v12 = *(_OWORD *)&a5->var2.var3.var2;
    long long v11 = *(_OWORD *)&a5[1].var0;
    *(_OWORD *)&a3->var2.var2 = *(_OWORD *)&a5->var2.var2.var4;
    *(_OWORD *)&a3->var3.var0 = v12;
    *(_OWORD *)&a3->var3.var4 = v11;
  }
  else
  {
    objc_super v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    int v10 = -73283;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v10;
}

- (int)fuseRefEv0Pyramid:(id)a3 withEv0Pyramids:(id)a4 frameProperties:(id *)a5 slPlist:(id)a6 lscGainsTex:(id)a7 outputSyntheticEv0:(id *)a8 outputWeightsPyramid:(id)a9
{
  v186 = a8;
  v205 = self;
  v219[16] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = a6;
  id v191 = a7;
  id v16 = a9;
  id v215 = 0;
  id v216 = 0;
  id v202 = v13;
  uint64_t v193 = [v13 getLevelCount];
  size_t v17 = 8 * v193;
  MEMORY[0x270FA5388]();
  v201 = (char *)v184 - v18;
  bzero((char *)v184 - v18, v17);
  int v19 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    [v14 count];
    kdebug_trace();
    int v19 = *MEMORY[0x263F00E10];
  }
  if (v19)
  {
    v20 = [(FigMetalContext *)v205->_metal commandQueue];
    v21 = [v20 commandBuffer];

    [v21 setLabel:@"KTRACE_START_MTL"];
    v213[0] = MEMORY[0x263EF8330];
    v213[1] = 3221225472;
    v213[2] = __137__RawDFSyntheticLongStage_fuseRefEv0Pyramid_withEv0Pyramids_frameProperties_slPlist_lscGainsTex_outputSyntheticEv0_outputWeightsPyramid___block_invoke;
    v213[3] = &unk_2655C7D58;
    id v214 = v14;
    [v21 addCompletedHandler:v213];
    [v21 commit];
  }
  v198 = v15;
  id v199 = v16;
  if (!v202)
  {
    unsigned int v212 = 0;
    os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
    v162 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v163 = v212;
    if (os_log_type_enabled(v162, v211)) {
      unsigned int v164 = v163;
    }
    else {
      unsigned int v164 = v163 & 0xFFFFFFFE;
    }
    if (!v164) {
      goto LABEL_196;
    }
    LODWORD(v217[0]) = 136315138;
    *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPlist:"
                                    "lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
    LODWORD(v183) = 12;
    goto LABEL_195;
  }
  if (!v14)
  {
    unsigned int v212 = 0;
    os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
    v162 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v165 = v212;
    if (os_log_type_enabled(v162, v211)) {
      unsigned int v166 = v165;
    }
    else {
      unsigned int v166 = v165 & 0xFFFFFFFE;
    }
    if (!v166) {
      goto LABEL_196;
    }
    LODWORD(v217[0]) = 136315138;
    *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPlist:"
                                    "lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
    LODWORD(v183) = 12;
    goto LABEL_195;
  }
  if (!a5)
  {
    unsigned int v212 = 0;
    os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
    v162 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v167 = v212;
    if (os_log_type_enabled(v162, v211)) {
      unsigned int v168 = v167;
    }
    else {
      unsigned int v168 = v167 & 0xFFFFFFFE;
    }
    if (!v168) {
      goto LABEL_196;
    }
    LODWORD(v217[0]) = 136315138;
    *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPlist:"
                                    "lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
    LODWORD(v183) = 12;
    goto LABEL_195;
  }
  if (!v15)
  {
    unsigned int v212 = 0;
    os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
    v162 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v169 = v212;
    if (os_log_type_enabled(v162, v211)) {
      unsigned int v170 = v169;
    }
    else {
      unsigned int v170 = v169 & 0xFFFFFFFE;
    }
    if (!v170) {
      goto LABEL_196;
    }
    LODWORD(v217[0]) = 136315138;
    *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPlist:"
                                    "lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
    LODWORD(v183) = 12;
    goto LABEL_195;
  }
  if (!v191)
  {
    unsigned int v212 = 0;
    os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
    v162 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v171 = v212;
    if (os_log_type_enabled(v162, v211)) {
      unsigned int v172 = v171;
    }
    else {
      unsigned int v172 = v171 & 0xFFFFFFFE;
    }
    if (!v172) {
      goto LABEL_196;
    }
    LODWORD(v217[0]) = 136315138;
    *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPlist:"
                                    "lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
    LODWORD(v183) = 12;
    goto LABEL_195;
  }
  uint64_t v22 = [v14 count];
  int v23 = v22 + 1;
  uint64_t v192 = v22;
  if ((v22 - 3) <= 0xFFFFFFFD)
  {
    unsigned int v212 = 0;
    os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
    v162 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v173 = v212;
    if (os_log_type_enabled(v162, v211)) {
      unsigned int v174 = v173;
    }
    else {
      unsigned int v174 = v173 & 0xFFFFFFFE;
    }
    if (!v174) {
      goto LABEL_196;
    }
    LODWORD(v217[0]) = 136315394;
    *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPlist:"
                                    "lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
    WORD2(v217[1]) = 1026;
    *(_DWORD *)((char *)&v217[1] + 6) = v23;
    LODWORD(v183) = 18;
    goto LABEL_195;
  }
  if (a5->var0 != v23)
  {
    unsigned int v212 = 0;
    os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
    v162 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v175 = v212;
    if (os_log_type_enabled(v162, v211)) {
      unsigned int v176 = v175;
    }
    else {
      unsigned int v176 = v175 & 0xFFFFFFFE;
    }
    if (!v176) {
      goto LABEL_196;
    }
    LODWORD(v217[0]) = 136315138;
    *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPlist:"
                                    "lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
    LODWORD(v183) = 12;
LABEL_195:
    _os_log_send_and_compose_impl();
LABEL_196:
    int v123 = -73283;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_197:
    id v203 = 0;
    id v204 = 0;
    id v200 = 0;
    id v36 = 0;
LABEL_198:
    id v197 = 0;
    id v207 = 0;
    id v63 = 0;
    goto LABEL_102;
  }
  long long v210 = 0u;
  memset(v209, 0, sizeof(v209));
  v209[0] = (float)v23;
  v190 = a5;
  int v24 = +[RawDFSyntheticLongStage _fillConstants:v209 slPlist:v15 frameProperties:a5];
  if (v24)
  {
    int v123 = v24;
    goto LABEL_197;
  }
  size_t v185 = v17;
  id v206 = v14;
  v209[1] = 1.0;
  float v25 = *((float *)&v210 + 1);
  uint64_t v26 = (v193 - 1);
  id v27 = v202;
  v28 = [v202 getTextureAtLevel:0];
  unint64_t v29 = [v28 width];

  v30 = [v27 getTextureAtLevel:0];
  unint64_t v31 = [v30 height];

  v32 = [v27 getTextureAtLevel:(int)v26];
  v33 = (void *)[v32 width];

  v34 = [v27 getTextureAtLevel:(int)v26];
  v35 = (void *)[v34 height];

  id v36 = 0;
  if (!v199)
  {
    v37 = [(FigMetalContext *)v205->_metal allocator];
    id v36 = (id)[v37 newTextureDescriptor];

    if (v36)
    {
      v38 = [v36 desc];
      [v38 setWidth:v33];

      v39 = [v36 desc];
      [v39 setHeight:v35];

      v40 = [v36 desc];
      [v40 setUsage:7];

      v41 = [v36 desc];
      [v41 setPixelFormat:25];

      goto LABEL_16;
    }
    unsigned int v212 = 0;
    os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
    v162 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v181 = v212;
    if (os_log_type_enabled(v162, v211)) {
      unsigned int v182 = v181;
    }
    else {
      unsigned int v182 = v181 & 0xFFFFFFFE;
    }
    if (v182)
    {
      LODWORD(v217[0]) = 136315138;
      *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPlis"
                                      "t:lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
      LODWORD(v183) = 12;
      _os_log_send_and_compose_impl();
    }
    id v14 = v206;
    size_t v17 = v185;
    goto LABEL_196;
  }
LABEL_16:
  v42 = [(FigMetalContext *)v205->_metal allocator];
  v43 = (void *)[v42 newTextureDescriptor];

  if (!v43)
  {
    unsigned int v212 = 0;
    os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
    v177 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v178 = v212;
    if (os_log_type_enabled(v177, v211)) {
      unsigned int v179 = v178;
    }
    else {
      unsigned int v179 = v178 & 0xFFFFFFFE;
    }
    if (v179)
    {
      LODWORD(v217[0]) = 136315138;
      *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPlis"
                                      "t:lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
      LODWORD(v183) = 12;
      _os_log_send_and_compose_impl();
    }
    id v14 = v206;
    size_t v17 = v185;
    int v123 = -73283;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v203 = 0;
    id v204 = 0;
    id v200 = 0;
    goto LABEL_198;
  }
  id v204 = v35;
  id v207 = v33;
  id v187 = v36;
  v184[1] = v184;
  v44 = [v43 desc];
  [v44 setUsage:7];

  id v200 = v43;
  v45 = [v43 desc];
  [v45 setPixelFormat:115];

  bzero(v201, v185);
  uint64_t v46 = 0;
  char v47 = 1;
  unint64_t v48 = v193;
  do
  {
    char v49 = v47;
    unint64_t v50 = *((void *)&xmmword_263380330 + v46);
    if (v50 < v48)
    {
      id v51 = v200;
      v52 = [v200 desc];
      [v52 setWidth:v29 >> v50];

      v53 = [v51 desc];
      [v53 setHeight:v31 >> v50];

      unint64_t v48 = v193;
      [v51 setLabel:0];
      v54 = [(FigMetalContext *)v205->_metal allocator];
      uint64_t v55 = [v54 newTextureWithDescriptor:v51];
      v56 = v201;
      v57 = *(void **)&v201[8 * v50];
      *(void *)&v201[8 * v50] = v55;

      if (!*(void *)&v56[8 * v50])
      {
        unsigned int v212 = 0;
        os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
        v140 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v141 = v212;
        if (os_log_type_enabled(v140, v211)) {
          unsigned int v142 = v141;
        }
        else {
          unsigned int v142 = v141 & 0xFFFFFFFE;
        }
        id v36 = v187;
        if (v142)
        {
          LODWORD(v217[0]) = 136315138;
          *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:sl"
                                          "Plist:lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
          LODWORD(v183) = 12;
          _os_log_send_and_compose_impl();
        }
        id v14 = v206;
        size_t v17 = v185;
        int v123 = -73283;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        id v203 = 0;
        id v204 = 0;
        goto LABEL_198;
      }
    }
    char v47 = 0;
    uint64_t v46 = 1;
  }
  while ((v49 & 1) != 0);
  unint64_t v58 = v48;
  id v14 = v206;
  if (v58) {
    FigMetalDecRef();
  }
  id v59 = v200;
  v60 = [v200 desc];
  [v60 setWidth:v207];

  v61 = [v59 desc];
  [v61 setHeight:v204];

  v62 = v190;
  if ((int)v193 < 1)
  {
    id v203 = 0;
    id v64 = 0;
    id v197 = 0;
    id v207 = 0;
    id v63 = 0;
LABEL_82:
    id v204 = v64;
    if (v215)
    {
      id v125 = v63;
      unsigned int v212 = 0;
      os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
      v130 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v180 = v212;
      if (!os_log_type_enabled(v130, v211)) {
        v180 &= ~1u;
      }
      size_t v17 = v185;
      if (!v180) {
        goto LABEL_216;
      }
      v127 = [v215 label];
      LODWORD(v217[0]) = 136315394;
      *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPlis"
                                      "t:lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
      WORD2(v217[1]) = 2112;
      *(void *)((char *)&v217[1] + 6) = v127;
      LODWORD(v183) = 22;
    }
    else
    {
      int v123 = 0;
      size_t v17 = v185;
      id v36 = v187;
      if (v199) {
        goto LABEL_102;
      }
      v124 = (int *)MEMORY[0x263F00E10];
      if (!v216) {
        goto LABEL_103;
      }
      id v125 = v63;
      unsigned int v212 = 0;
      os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
      v130 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v126 = v212;
      if (!os_log_type_enabled(v130, v211)) {
        v126 &= ~1u;
      }
      if (!v126) {
        goto LABEL_217;
      }
      v127 = [v216 label];
      LODWORD(v217[0]) = 136315394;
      *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPlis"
                                      "t:lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
      WORD2(v217[1]) = 2112;
      *(void *)((char *)&v217[1] + 6) = v127;
      LODWORD(v183) = 22;
    }
    _os_log_send_and_compose_impl();

LABEL_216:
    id v36 = v187;
LABEL_217:
    id v63 = v125;
    int v123 = -73283;
LABEL_101:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_102:
    v124 = (int *)MEMORY[0x263F00E10];
    goto LABEL_103;
  }
  id v63 = 0;
  id v207 = 0;
  id v197 = 0;
  id v64 = 0;
  id v203 = 0;
  BOOL v189 = v25 != 1.0;
  uint64_t v65 = (int)v193;
  uint64_t v66 = v192;
  uint64_t v188 = v26;
  while (1)
  {
    id v204 = v64;
    uint64_t v67 = v65 - 1;
    int v68 = +[RawDFSyntheticLongStage _fillConstantsForBand:v65 - 1 consts:v209 slPlist:v198 frameProperties:v62];
    if (v68)
    {
      int v123 = v68;
LABEL_118:
      size_t v17 = v185;
      v124 = (int *)MEMORY[0x263F00E10];
      id v36 = v187;
      goto LABEL_103;
    }
    v69 = [(FigMetalContext *)v205->_metal commandQueue];
    uint64_t v70 = [v69 commandBuffer];

    if (!v70)
    {
      uint64_t v183 = v184[0];
      FigDebugAssert3();
      int v123 = FigSignalErrorAt();
      id v63 = 0;
      goto LABEL_118;
    }
    v71 = (void *)v70;
    id v72 = v202;
    v73 = [v202 getTextureAtLevel:v65 - 1];
    uint64_t v74 = [v73 width];

    v75 = [v72 getTextureAtLevel:v65 - 1];
    uint64_t v76 = [v75 height];

    id v196 = v71;
    v77 = [v71 computeCommandEncoder];

    if (!v77)
    {
      unsigned int v212 = 0;
      os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
      v143 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v144 = v212;
      if (os_log_type_enabled(v143, v211)) {
        unsigned int v145 = v144;
      }
      else {
        unsigned int v145 = v144 & 0xFFFFFFFE;
      }
      if (v145)
      {
        LODWORD(v217[0]) = 136315138;
        *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPl"
                                        "ist:lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
        LODWORD(v183) = 12;
        _os_log_send_and_compose_impl();
      }
      size_t v17 = v185;
      id v36 = v187;
      int v123 = -73283;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      id v207 = 0;
      goto LABEL_154;
    }
    uint64_t v194 = v76;
    uint64_t v195 = v74;
    id v207 = v77;
    [v77 setBytes:v209 length:192 atIndex:1];
    v78 = v201;
    id v79 = *(id *)&v201[8 * v67];

    v80 = *(void **)&v78[8 * v67];
    *(void *)&v78[8 * v67] = 0;

    id v81 = v199;
    id v82 = v200;
    id v203 = v79;
    if (!v79)
    {
      [v200 setLabel:0];
      v83 = [(FigMetalContext *)v205->_metal allocator];
      v84 = (void *)[v83 newTextureWithDescriptor:v82];

      id v203 = v84;
      if (!v84)
      {
        unsigned int v212 = 0;
        os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
        v150 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v151 = v212;
        if (os_log_type_enabled(v150, v211)) {
          unsigned int v152 = v151;
        }
        else {
          unsigned int v152 = v151 & 0xFFFFFFFE;
        }
        if (v152)
        {
          LODWORD(v217[0]) = 136315138;
          *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:sl"
                                          "Plist:lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
          LODWORD(v183) = 12;
          _os_log_send_and_compose_impl();
        }
        size_t v17 = v185;
        id v36 = v187;
        id v63 = v196;
        int v123 = -73283;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        id v203 = 0;
        goto LABEL_102;
      }
    }
    v85 = [v82 desc];
    objc_msgSend(v85, "setWidth:", 2 * objc_msgSend(v85, "width"));

    v86 = [v82 desc];
    objc_msgSend(v86, "setHeight:", 2 * objc_msgSend(v86, "height"));

    if (v81)
    {
      uint64_t v87 = [v81 getTextureAtLevel:v65 - 1];

      v88 = (void *)v87;
      if (!v87)
      {
        [v81 allocateLevel:v65 - 1 withLabel:0];
        v88 = [v81 getTextureAtLevel:v65 - 1];
      }
    }
    else
    {
      id v89 = v187;
      [v187 setLabel:0];
      v90 = [(FigMetalContext *)v205->_metal allocator];
      v88 = (void *)[v90 newTextureWithDescriptor:v89];

      if (!v88)
      {
        unsigned int v212 = 0;
        os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
        v159 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v160 = v212;
        if (os_log_type_enabled(v159, v211)) {
          unsigned int v161 = v160;
        }
        else {
          unsigned int v161 = v160 & 0xFFFFFFFE;
        }
        if (v161)
        {
          LODWORD(v217[0]) = 136315138;
          *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:sl"
                                          "Plist:lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
          LODWORD(v183) = 12;
          _os_log_send_and_compose_impl();
        }
        id v14 = v206;
        size_t v17 = v185;
        id v36 = v187;
        id v63 = v196;
        int v123 = -73283;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        id v204 = 0;
        goto LABEL_102;
      }
      v91 = [v89 desc];
      objc_msgSend(v91, "setWidth:", 2 * objc_msgSend(v91, "width"));

      v92 = [v89 desc];
      objc_msgSend(v92, "setHeight:", 2 * objc_msgSend(v92, "height"));
    }
    v93 = [v202 getTextureAtLevel:v65 - 1];
    [v207 setTexture:v93 atIndex:4];

    if ((int)v192 >= 1)
    {
      uint64_t v94 = 0;
      do
      {
        v95 = [v206 objectAtIndexedSubscript:v94];
        v96 = [v95 getTextureAtLevel:v65 - 1];
        unsigned int v97 = dword_263380328[v94];
        [v207 setTexture:v96 atIndex:v97];

        if (v67 != v26)
        {
          v98 = [v95 getTextureAtLevel:v65];
          [v207 setTexture:v98 atIndex:v97 + 1];
        }
        ++v94;
      }
      while (v66 != v94);
    }
    BOOL v107 = v67 == v26;
    id v14 = v206;
    id v99 = v207;
    v100 = v198;
    id v204 = v88;
    if (!v107)
    {
      v101 = [v202 getTextureAtLevel:v65];
      [v99 setTexture:v101 atIndex:5];

      if (v215)
      {
        if (v216)
        {
          objc_msgSend(v99, "setTexture:atIndex:");
          [v99 setTexture:v216 atIndex:10];
          goto LABEL_44;
        }
        unsigned int v212 = 0;
        os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
        v153 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v157 = v212;
        if (os_log_type_enabled(v153, v211)) {
          unsigned int v158 = v157;
        }
        else {
          unsigned int v158 = v157 & 0xFFFFFFFE;
        }
        if (v158)
        {
          v156 = [v216 label];
          LODWORD(v217[0]) = 136315650;
          *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:sl"
                                          "Plist:lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
          WORD2(v217[1]) = 2112;
          *(void *)((char *)&v217[1] + 6) = v156;
          HIWORD(v217[2]) = 1024;
          int v218 = v65 - 1;
          LODWORD(v183) = 28;
LABEL_145:
          _os_log_send_and_compose_impl();
        }
      }
      else
      {
        unsigned int v212 = 0;
        os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
        v153 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v154 = v212;
        if (os_log_type_enabled(v153, v211)) {
          unsigned int v155 = v154;
        }
        else {
          unsigned int v155 = v154 & 0xFFFFFFFE;
        }
        if (v155)
        {
          v156 = [v200 label];
          LODWORD(v217[0]) = 136315650;
          *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:sl"
                                          "Plist:lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
          WORD2(v217[1]) = 2112;
          *(void *)((char *)&v217[1] + 6) = v156;
          HIWORD(v217[2]) = 1024;
          int v218 = v65 - 1;
          LODWORD(v183) = 28;
          goto LABEL_145;
        }
      }
      size_t v17 = v185;
      id v36 = v187;
      int v123 = -73283;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_154:
      v124 = (int *)MEMORY[0x263F00E10];
      goto LABEL_157;
    }
LABEL_44:
    [v99 setTexture:v191 atIndex:0];
    [v99 setTexture:v203 atIndex:2];
    if (!v88) {
      break;
    }
    [v99 setTexture:v88 atIndex:3];
    uint64_t v102 = [(RawDFSyntheticLongShaders *)v205->_shaders getKernel:v100[64] configFlags:v189];

    if (!v102)
    {
      uint64_t v183 = v184[0];
      FigDebugAssert3();
      int v123 = FigSignalErrorAt();
      id v197 = 0;
      size_t v17 = v185;
      goto LABEL_156;
    }
    v103 = v99;
    v104 = (void *)v102;
    [v103 setComputePipelineState:v102];
    int v105 = v100[64];
    id v197 = v104;
    unint64_t v106 = [v104 maxTotalThreadsPerThreadgroup];
    BOOL v107 = v105 == 0;
    if (v105) {
      unint64_t v108 = 18;
    }
    else {
      unint64_t v108 = 16;
    }
    unint64_t v109 = 324;
    if (v107) {
      unint64_t v109 = 256;
    }
    unint64_t v110 = v108;
    if (v109 > v106)
    {
      while (1)
      {
        if (v106 >= v110 * v108) {
          goto LABEL_56;
        }
        unint64_t v111 = v108 >> (v108 > v110);
        if (v111 <= 7) {
          break;
        }
        v110 >>= v108 <= v110;
        unint64_t v108 = v111;
        if (v110 <= 7)
        {
          unsigned int v212 = 0;
          os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
          v130 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v131 = v212;
          if (os_log_type_enabled(v130, v211)) {
            unsigned int v133 = v131;
          }
          else {
            unsigned int v133 = v131 & 0xFFFFFFFE;
          }
          if (v133)
          {
            LODWORD(v217[0]) = 136315138;
            *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:"
                                            "slPlist:lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
            LODWORD(v183) = 12;
LABEL_99:
            _os_log_send_and_compose_impl();
          }
          goto LABEL_100;
        }
      }
      unsigned int v212 = 0;
      os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
      v130 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v128 = v212;
      if (os_log_type_enabled(v130, v211)) {
        unsigned int v129 = v128;
      }
      else {
        unsigned int v129 = v128 & 0xFFFFFFFE;
      }
      if (v129)
      {
        LODWORD(v217[0]) = 136315138;
        *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPl"
                                        "ist:lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
        LODWORD(v183) = 12;
        goto LABEL_99;
      }
LABEL_100:
      size_t v17 = v185;
      id v36 = v187;
      id v63 = v196;
      int v123 = -73283;
      goto LABEL_101;
    }
LABEL_56:
    if (v100[64]) {
      uint64_t v112 = 16;
    }
    else {
      uint64_t v112 = v108;
    }
    if (v100[64]) {
      uint64_t v113 = 16;
    }
    else {
      uint64_t v113 = 2 * v110;
    }
    id v114 = v207;
    [v207 setImageblockWidth:v112 height:v113];
    if (v100[64]) {
      unint64_t v115 = 16;
    }
    else {
      unint64_t v115 = v108 - 2;
    }
    if (v100[64]) {
      unint64_t v116 = 16;
    }
    else {
      unint64_t v116 = v110 - 2;
    }
    v219[0] = (v195 + v115 - 1) / v115;
    v219[1] = (v194 + v116 - 1) / v116;
    v219[2] = 1;
    v217[0] = v108;
    v217[1] = v110;
    v217[2] = 1;
    [v114 dispatchThreadgroups:v219 threadsPerThreadgroup:v217];
    [v114 endEncoding];
    id v63 = v196;
    [v196 commit];
    FigMetalDecRef();
    if (!v199) {
      FigMetalDecRef();
    }
    id v14 = v206;
    uint64_t v26 = v188;
    if (v65 == 1)
    {
      id v203 = v203;
      id *v186 = v203;
      id v64 = v204;
    }
    else
    {
      id v117 = v216;
      id v216 = v204;

      id v118 = v215;
      id v215 = v203;

      id v203 = 0;
      id v64 = 0;
    }
    if (v67 != v26)
    {
      id v119 = v64;
      if ((int)v192 >= 1)
      {
        uint64_t v120 = 0;
        do
        {
          v121 = [v14 objectAtIndexedSubscript:v120];
          [v121 releaseTextureAtLevel:v65];

          ++v120;
        }
        while (v66 != v120);
      }
      [v202 releaseTextureAtLevel:v65];
      id v64 = v119;
    }
    BOOL v122 = v65-- <= 1;
    v62 = v190;
    if (v122) {
      goto LABEL_82;
    }
  }
  unsigned int v212 = 0;
  os_log_type_t v211 = OS_LOG_TYPE_DEFAULT;
  v146 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  unsigned int v147 = v212;
  if (os_log_type_enabled(v146, v211)) {
    unsigned int v148 = v147;
  }
  else {
    unsigned int v148 = v147 & 0xFFFFFFFE;
  }
  if (v148)
  {
    v149 = [v187 label];
    LODWORD(v217[0]) = 136315650;
    *(void *)((char *)v217 + 4) = "-[RawDFSyntheticLongStage fuseRefEv0Pyramid:withEv0Pyramids:frameProperties:slPlist:"
                                    "lscGainsTex:outputSyntheticEv0:outputWeightsPyramid:]";
    WORD2(v217[1]) = 2112;
    *(void *)((char *)&v217[1] + 6) = v149;
    HIWORD(v217[2]) = 1024;
    int v218 = v65 - 1;
    LODWORD(v183) = 28;
    _os_log_send_and_compose_impl();
  }
  size_t v17 = v185;
  int v123 = -73283;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  id v204 = 0;
LABEL_156:
  v124 = (int *)MEMORY[0x263F00E10];
  id v36 = v187;
LABEL_157:
  id v63 = v196;
LABEL_103:
  int v134 = *v124;
  if (*v124 == 1)
  {
    [v14 count];
    kdebug_trace();
    int v134 = *v124;
  }
  if (v134)
  {
    uint64_t v135 = (int)([v14 count] + 1);
    v136 = [(FigMetalContext *)v205->_metal commandQueue];
    v137 = [v136 commandBuffer];

    [v137 setLabel:@"KTRACE_END_MTL"];
    v208[0] = MEMORY[0x263EF8330];
    v208[1] = 3221225472;
    v208[2] = __137__RawDFSyntheticLongStage_fuseRefEv0Pyramid_withEv0Pyramids_frameProperties_slPlist_lscGainsTex_outputSyntheticEv0_outputWeightsPyramid___block_invoke_29;
    v208[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    v208[4] = 3;
    v208[5] = v135;
    v208[6] = 0;
    [v137 addCompletedHandler:v208];
    [v137 commit];
  }
  if (v193)
  {
    v138 = v201 - 8;
    do
    {

      v17 -= 8;
    }
    while (v17);
  }

  return v123;
}

void __137__RawDFSyntheticLongStage_fuseRefEv0Pyramid_withEv0Pyramids_frameProperties_slPlist_lscGainsTex_outputSyntheticEv0_outputWeightsPyramid___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 GPUEndTime];
  [v3 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    [*(id *)(a1 + 32) count];
    kdebug_trace();
  }
}

void __137__RawDFSyntheticLongStage_fuseRefEv0Pyramid_withEv0Pyramids_frameProperties_slPlist_lscGainsTex_outputSyntheticEv0_outputWeightsPyramid___block_invoke_29(uint64_t a1, void *a2)
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

- (int)fuseRefSyntheticEv0Pyramid:(id)a3 withLongPyramid:(id)a4 syntheticEv0WeightsPyramid:(id)a5 frameProperties:(id *)a6 slPlist:(id)a7 lscGainsTex:(id)a8 outputSyntheticLong:(id *)a9 outputNoiseDivisorSyntheticEv0:(id *)a10 outputNoiseDivisorSyntheticLong:(id *)a11
{
  v136[16] = *MEMORY[0x263EF8340];
  id v112 = a3;
  id v111 = a4;
  id v17 = a5;
  uint64_t v18 = a7;
  id v107 = a8;
  id v132 = 0;
  id location = 0;
  int v19 = (int *)MEMORY[0x263F00E10];
  int v20 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v20 = *v19;
  }
  if (v20)
  {
    v21 = [(FigMetalContext *)self->_metal commandQueue];
    uint64_t v22 = [v21 commandBuffer];

    [v22 setLabel:@"KTRACE_START_MTL"];
    [v22 addCompletedHandler:&__block_literal_global_7];
    [v22 commit];
  }
  unint64_t v106 = v17;
  unint64_t v110 = v18;
  if (!v112 || !v111) {
    goto LABEL_114;
  }
  unint64_t v116 = self;
  if (!v17)
  {
    int v24 = 0;
    if (a6) {
      goto LABEL_10;
    }
LABEL_112:
    unsigned int v131 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v100 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT);
    self = v116;
LABEL_115:
    int v71 = -73283;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v117 = 0;
    id v118 = 0;
    id obj = 0;
    id v36 = 0;
    v35 = 0;
    v34 = 0;
    id v72 = 0;
    goto LABEL_53;
  }
  uint64_t v23 = [v17 getLevelCount];
  if (v23 != [v112 getLevelCount])
  {
LABEL_114:
    unsigned int v131 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v100 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT);
    goto LABEL_115;
  }
  int v24 = 2;
  if (!a6) {
    goto LABEL_112;
  }
LABEL_10:
  if (!v18) {
    goto LABEL_112;
  }
  if (!v107) {
    goto LABEL_112;
  }
  int var0 = a6->var0;
  if ((a6->var0 & 0xFFFFFFFE) != 2) {
    goto LABEL_112;
  }
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v123 = 0u;
  long long v122 = 0u;
  memset(v121, 0, sizeof(v121));
  *(float *)v121 = (float)var0;
  int v26 = +[RawDFSyntheticLongStage _fillConstants:v121 slPlist:v18 frameProperties:a6];
  if (v26)
  {
    int v71 = v26;
    id v117 = 0;
    id v118 = 0;
    id obj = 0;
    id v36 = 0;
    v35 = 0;
    v34 = 0;
    id v72 = 0;
    goto LABEL_104;
  }
  long long v27 = *(_OWORD *)&a6[1].var2.var2.var4;
  long long v122 = *(_OWORD *)&a6[1].var2.var2.var0;
  long long v28 = *(_OWORD *)&a6[1].var2.var3.var2;
  long long v123 = v27;
  long long v124 = v28;
  DWORD1(v121[0]) = LODWORD(a6->var2.var2.var0);
  float v29 = *((float *)&v129 + 1);
  int v30 = [v112 getLevelCount];
  unint64_t v31 = [v112 getTextureAtLevel:0];
  unint64_t v109 = [v31 width];

  v32 = [v112 getTextureAtLevel:0];
  unint64_t v108 = [v32 height];

  if (v30 < 1)
  {
    id v117 = 0;
    id v118 = 0;
    id obj = 0;
    uint64_t v70 = 0;
    uint64_t v67 = 0;
    uint64_t v55 = 0;
    v54 = 0;
LABEL_50:
    id v36 = v70;
    *a9 = v36;
    id v118 = v118;
    *a10 = v118;
    int v71 = 0;
    id v117 = v117;
    *a11 = v117;
    v35 = (void *)v67;
LABEL_51:
    v34 = v55;
    id v72 = v54;
    self = v116;
LABEL_52:
    int v19 = (int *)MEMORY[0x263F00E10];
    goto LABEL_53;
  }
  v104 = a6;
  uint64_t v33 = 0;
  unint64_t v115 = 0;
  v34 = 0;
  v35 = 0;
  id v36 = 0;
  id v118 = 0;
  id obj = 0;
  id v117 = 0;
  unsigned int v102 = v24 | (v29 != 1.0);
  uint64_t v37 = v30;
  int v105 = v30 - 1;
  unint64_t v103 = ~(unint64_t)(v30 - 1) + v30;
  v38 = v110;
  uint64_t v101 = v30;
  while (1)
  {
    int v39 = +[RawDFSyntheticLongStage _fillConstantsForBand:(v105 + v33) consts:v121 slPlist:v38 frameProperties:v104];
    if (v39)
    {
      int v71 = v39;
      id v72 = v115;
      self = v116;
      goto LABEL_52;
    }
    id v114 = v34;
    uint64_t v40 = v37 + v33;
    uint64_t v41 = v40 - 1;
    unint64_t v42 = v109 >> (v40 - 1);
    unint64_t v43 = v108 >> (v40 - 1);
    v44 = v116;
    uint64_t v45 = [(RawDFSyntheticLongStage *)v116 createIntermediateMetalTexture:0 withPixelFormat:115 width:v42 height:v43];

    uint64_t v113 = (void *)v45;
    if (!v45)
    {
      unsigned int v131 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v77 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v78 = v131;
      if (os_log_type_enabled(v77, type)) {
        unsigned int v79 = v78;
      }
      else {
        unsigned int v79 = v78 & 0xFFFFFFFE;
      }
      if (v79)
      {
        *(_DWORD *)int v134 = 136315394;
        *(void *)&v134[4] = "-[RawDFSyntheticLongStage fuseRefSyntheticEv0Pyramid:withLongPyramid:syntheticEv0WeightsPy"
                              "ramid:frameProperties:slPlist:lscGainsTex:outputSyntheticLong:outputNoiseDivisorSyntheticE"
                              "v0:outputNoiseDivisorSyntheticLong:]";
        *(_WORD *)&v134[12] = 1024;
        *(_DWORD *)&v134[14] = v105 + v33;
        _os_log_send_and_compose_impl();
      }
      int v19 = (int *)MEMORY[0x263F00E10];
      v34 = v114;
      id v72 = v115;
      int v71 = -73283;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      id v36 = 0;
      goto LABEL_104;
    }
    if (v40 != 1)
    {
      uint64_t v46 = [(RawDFSyntheticLongStage *)v116 createIntermediateMetalTexture:0 withPixelFormat:25 width:v42 height:v43];

      if (!v46)
      {
        unsigned int v131 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v86 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v87 = v131;
        if (os_log_type_enabled(v86, type)) {
          unsigned int v88 = v87;
        }
        else {
          unsigned int v88 = v87 & 0xFFFFFFFE;
        }
        if (v88)
        {
          *(_DWORD *)int v134 = 136315394;
          *(void *)&v134[4] = "-[RawDFSyntheticLongStage fuseRefSyntheticEv0Pyramid:withLongPyramid:syntheticEv0Weights"
                                "Pyramid:frameProperties:slPlist:lscGainsTex:outputSyntheticLong:outputNoiseDivisorSynthe"
                                "ticEv0:outputNoiseDivisorSyntheticLong:]";
          *(_WORD *)&v134[12] = 1024;
          *(_DWORD *)&v134[14] = v105 + v33;
          _os_log_send_and_compose_impl();
        }
        int v19 = (int *)MEMORY[0x263F00E10];
        v34 = v114;
        id v72 = v115;
        int v71 = -73283;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        id obj = 0;
        self = v116;
        goto LABEL_106;
      }

      id v118 = 0;
      id obj = (id)v46;
      char v47 = v117;
      id v117 = 0;
      goto LABEL_24;
    }
    char v48 = v110[64] == 0;
    unint64_t v49 = v109 >> v48;
    unint64_t v50 = v108 >> v48;
    uint64_t v51 = [(RawDFSyntheticLongStage *)v116 createIntermediateMetalTexture:0 withPixelFormat:25 width:v109 >> v48 height:v108 >> v48];

    if (!v51) {
      break;
    }
    uint64_t v52 = [(RawDFSyntheticLongStage *)v116 createIntermediateMetalTexture:0 withPixelFormat:25 width:v49 height:v50];

    if (!v52)
    {
      unsigned int v131 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      unsigned int v97 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v98 = v131;
      if (os_log_type_enabled(v97, type)) {
        unsigned int v99 = v98;
      }
      else {
        unsigned int v99 = v98 & 0xFFFFFFFE;
      }
      if (v99)
      {
        *(_DWORD *)int v134 = 136315138;
        *(void *)&v134[4] = "-[RawDFSyntheticLongStage fuseRefSyntheticEv0Pyramid:withLongPyramid:syntheticEv0WeightsPy"
                              "ramid:frameProperties:slPlist:lscGainsTex:outputSyntheticLong:outputNoiseDivisorSyntheticE"
                              "v0:outputNoiseDivisorSyntheticLong:]";
        _os_log_send_and_compose_impl();
      }
      self = v116;
      int v19 = (int *)MEMORY[0x263F00E10];
      v34 = v114;
      int v71 = -73283;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      id v117 = 0;
      id v118 = (id)v51;
      goto LABEL_109;
    }
    char v47 = obj;
    id v117 = (id)v52;
    id v118 = (id)v51;
    id obj = 0;
    v44 = v116;
LABEL_24:

    v53 = [(FigMetalContext *)v44->_metal commandQueue];
    v54 = [v53 commandBuffer];

    if (!v54)
    {
      FigDebugAssert3();
      int v71 = FigSignalErrorAt();
      id v72 = 0;
      self = v116;
      int v19 = (int *)MEMORY[0x263F00E10];
      v34 = v114;
LABEL_106:
      id v36 = v113;
      goto LABEL_53;
    }
    uint64_t v55 = [v54 computeCommandEncoder];

    if (!v55)
    {
      unsigned int v131 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v80 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v81 = v131;
      if (os_log_type_enabled(v80, type)) {
        unsigned int v82 = v81;
      }
      else {
        unsigned int v82 = v81 & 0xFFFFFFFE;
      }
      id v36 = v113;
      if (v82)
      {
        *(_DWORD *)int v134 = 136315138;
        *(void *)&v134[4] = "-[RawDFSyntheticLongStage fuseRefSyntheticEv0Pyramid:withLongPyramid:syntheticEv0WeightsPy"
                              "ramid:frameProperties:slPlist:lscGainsTex:outputSyntheticLong:outputNoiseDivisorSyntheticE"
                              "v0:outputNoiseDivisorSyntheticLong:]";
        _os_log_send_and_compose_impl();
      }
      int v19 = (int *)MEMORY[0x263F00E10];
      int v71 = -73283;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v34 = 0;
      id v72 = v54;
LABEL_104:
      self = v116;
      goto LABEL_53;
    }
    [v55 setBytes:v121 length:192 atIndex:1];
    v56 = v113;
    if (v103 + v33)
    {
      id v36 = v113;
      v57 = [v112 getTextureAtLevel:v40];
      [v55 setTexture:v57 atIndex:7];

      unint64_t v58 = [v111 getTextureAtLevel:v40];
      [v55 setTexture:v58 atIndex:9];

      if (!location)
      {
        unsigned int v131 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        id v89 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v90 = v131;
        if (os_log_type_enabled(v89, type)) {
          unsigned int v91 = v90;
        }
        else {
          unsigned int v91 = v90 & 0xFFFFFFFE;
        }
        if (v91)
        {
LABEL_89:
          *(_DWORD *)int v134 = 136315650;
          *(void *)&v134[4] = "-[RawDFSyntheticLongStage fuseRefSyntheticEv0Pyramid:withLongPyramid:syntheticEv0Weights"
                                "Pyramid:frameProperties:slPlist:lscGainsTex:outputSyntheticLong:outputNoiseDivisorSynthe"
                                "ticEv0:outputNoiseDivisorSyntheticLong:]";
          *(_WORD *)&v134[12] = 2112;
          *(void *)&v134[14] = 0;
          *(_WORD *)&v134[22] = 1024;
          int v135 = v105 + v33;
          _os_log_send_and_compose_impl();
        }
LABEL_90:
        int v71 = -73283;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        goto LABEL_51;
      }
      if (!v132)
      {
        unsigned int v131 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        id v89 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v92 = v131;
        if (os_log_type_enabled(v89, type)) {
          unsigned int v93 = v92;
        }
        else {
          unsigned int v93 = v92 & 0xFFFFFFFE;
        }
        if (v93) {
          goto LABEL_89;
        }
        goto LABEL_90;
      }
      objc_msgSend(v55, "setTexture:atIndex:");
      [v55 setTexture:v132 atIndex:10];
      v56 = v113;
    }
    id v59 = [v112 getTextureAtLevel:v41];
    [v55 setTexture:v59 atIndex:6];

    v60 = [v111 getTextureAtLevel:v41];
    [v55 setTexture:v60 atIndex:8];

    if (v106)
    {
      v61 = [v106 getTextureAtLevel:v41];
      [v55 setTexture:v61 atIndex:3];
    }
    [v55 setTexture:v107 atIndex:0];
    [v55 setTexture:v56 atIndex:2];
    v62 = v55;
    if (v41)
    {
      id v63 = obj;
      uint64_t v64 = 11;
    }
    else
    {
      [v55 setTexture:v118 atIndex:4];
      v62 = v55;
      id v63 = v117;
      uint64_t v64 = 5;
    }
    [v62 setTexture:v63 atIndex:v64];
    int v65 = v110[64];
    [v55 setImageblockWidth:16 height:16];
    if (v110[64]) {
      uint64_t v66 = 3;
    }
    else {
      uint64_t v66 = 2;
    }
    uint64_t v67 = [(RawDFSyntheticLongShaders *)v116->_shaders getKernel:v66 configFlags:v102];

    if (!v67)
    {
      unsigned int v131 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v83 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v84 = v131;
      if (os_log_type_enabled(v83, type)) {
        unsigned int v85 = v84;
      }
      else {
        unsigned int v85 = v84 & 0xFFFFFFFE;
      }
      if (v85)
      {
        *(_DWORD *)int v134 = 136315138;
        *(void *)&v134[4] = "-[RawDFSyntheticLongStage fuseRefSyntheticEv0Pyramid:withLongPyramid:syntheticEv0WeightsPy"
                              "ramid:frameProperties:slPlist:lscGainsTex:outputSyntheticLong:outputNoiseDivisorSyntheticE"
                              "v0:outputNoiseDivisorSyntheticLong:]";
        _os_log_send_and_compose_impl();
      }
      int v19 = (int *)MEMORY[0x263F00E10];
      id v36 = v56;
      int v71 = -73283;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v35 = 0;
      v34 = v55;
      id v72 = v54;
      goto LABEL_104;
    }
    if (v65) {
      uint64_t v68 = 18;
    }
    else {
      uint64_t v68 = 16;
    }
    [v55 setComputePipelineState:v67];
    if (v110[64]) {
      unint64_t v69 = 16;
    }
    else {
      unint64_t v69 = v68 - 2;
    }
    v136[0] = (v42 + v69 - 1) / v69;
    v136[1] = (v43 + v69 - 1) / v69;
    v136[2] = 1;
    *(void *)int v134 = v68;
    *(void *)&v134[8] = v68;
    *(void *)&v134[16] = 1;
    [v55 dispatchThreadgroups:v136 threadsPerThreadgroup:v134];
    [v55 endEncoding];
    [v54 commit];
    FigMetalDecRef();
    FigMetalDecRef();
    objc_storeStrong(&location, v56);
    objc_storeStrong(&v132, obj);
    --v33;
    uint64_t v37 = v101;
    v38 = v110;
    unint64_t v115 = v54;
    v34 = v55;
    v35 = (void *)v67;
    uint64_t v70 = v56;
    id v36 = v56;
    if (v101 + v33 + 1 <= 1) {
      goto LABEL_50;
    }
  }
  unsigned int v131 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  uint64_t v94 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  unsigned int v95 = v131;
  if (os_log_type_enabled(v94, type)) {
    unsigned int v96 = v95;
  }
  else {
    unsigned int v96 = v95 & 0xFFFFFFFE;
  }
  if (v96)
  {
    *(_DWORD *)int v134 = 136315138;
    *(void *)&v134[4] = "-[RawDFSyntheticLongStage fuseRefSyntheticEv0Pyramid:withLongPyramid:syntheticEv0WeightsPyrami"
                          "d:frameProperties:slPlist:lscGainsTex:outputSyntheticLong:outputNoiseDivisorSyntheticEv0:outpu"
                          "tNoiseDivisorSyntheticLong:]";
    _os_log_send_and_compose_impl();
  }
  self = v116;
  int v19 = (int *)MEMORY[0x263F00E10];
  v34 = v114;
  int v71 = -73283;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  id v118 = 0;
LABEL_109:
  id v36 = v113;
  id v72 = v115;
LABEL_53:
  int v73 = *v19;
  if (*v19 == 1)
  {
    kdebug_trace();
    int v73 = *v19;
  }
  if (v73)
  {
    uint64_t v74 = [(FigMetalContext *)self->_metal commandQueue];
    v75 = [v74 commandBuffer];

    [v75 setLabel:@"KTRACE_END_MTL"];
    v120[0] = MEMORY[0x263EF8330];
    v120[1] = 3221225472;
    v120[2] = __216__RawDFSyntheticLongStage_fuseRefSyntheticEv0Pyramid_withLongPyramid_syntheticEv0WeightsPyramid_frameProperties_slPlist_lscGainsTex_outputSyntheticLong_outputNoiseDivisorSyntheticEv0_outputNoiseDivisorSyntheticLong___block_invoke_31;
    v120[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    v120[5] = 0;
    v120[6] = 0;
    v120[4] = 2;
    [v75 addCompletedHandler:v120];
    [v75 commit];
  }
  return v71;
}

void __216__RawDFSyntheticLongStage_fuseRefSyntheticEv0Pyramid_withLongPyramid_syntheticEv0WeightsPyramid_frameProperties_slPlist_lscGainsTex_outputSyntheticLong_outputNoiseDivisorSyntheticEv0_outputNoiseDivisorSyntheticLong___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __216__RawDFSyntheticLongStage_fuseRefSyntheticEv0Pyramid_withLongPyramid_syntheticEv0WeightsPyramid_frameProperties_slPlist_lscGainsTex_outputSyntheticLong_outputNoiseDivisorSyntheticEv0_outputNoiseDivisorSyntheticLong___block_invoke_31(uint64_t a1, void *a2)
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

+ (int)_fillConstantsForBand:(int)a3 consts:(id *)a4 slPlist:(id)a5 frameProperties:(id *)a6
{
  v9 = (id *)a5;
  int v10 = v9;
  if (a4 && v9 && a6)
  {
    float var1 = a6->var1;
    long long v12 = [v9[1] objectAtIndexedSubscript:a3];
    *(float *)v13.i32 = interpolate_with_gain(v12[1], var1);
    int32x2_t v24 = v13;

    id v14 = [v10[1] objectAtIndexedSubscript:a3];
    *(float *)v15.i32 = interpolate_with_gain(v14[3], var1);
    int32x2_t v23 = v15;

    id v16 = [v10[1] objectAtIndexedSubscript:a3];
    float v17 = interpolate_with_gain(v16[5], var1);

    uint64_t v18 = [v10[1] objectAtIndexedSubscript:a3];
    float v19 = interpolate_with_gain(v18[6], var1);

    int v20 = 0;
    LODWORD(a4[1].var3.var2) = v24.i32[0];
    *(void *)&a4[1].var3.int var0 = vdupq_lane_s32(v24, 0).u64[0];
    LODWORD(a4[1].var4) = v23.i32[0];
    *(void *)&a4[1].var3.var4 = vdupq_lane_s32(v23, 0).u64[0];
    LOBYTE(a4[1].var6.var1) = a3 == 0;
    a4[2].var2.var4 = v17;
    a4[2].var2.var5 = v19;
  }
  else
  {
    uint64_t v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    int v20 = -73283;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v20;
}

+ (int)fillFrameProperties:(id *)a3 withEv0Properties:(id)a4 withLongProperties:(id)a5 ev0Count:(int)a6
{
  id v9 = a4;
  id v10 = a5;
  long long v11 = v10;
  if (a3 && v9 && v10 && (a6 & 0xFFFFFFFE) == 2)
  {
    long long v12 = [v9 meta];
    a3->float var1 = *(float *)[v12 exposureParams];

    int32x2_t v13 = [v9 meta];
    uint64_t v14 = [v13 exposureParams];
    int32x2_t v15 = [v11 meta];
    a3->var2.var2.int var0 = getRelativeBrightnessForProperties(v14, [v15 exposureParams], v9);

    id v16 = [v9 meta];
    float v17 = *(float *)([v16 exposureParams] + 52);
    uint64_t v18 = [v11 meta];
    a3->var2.var2.float var1 = v17 / *(float *)([v18 exposureParams] + 52);

    float v19 = [v9 meta];
    int v20 = +[RawDFCommon fillRawNoiseModelParameters:exposureParams:](RawDFCommon, "fillRawNoiseModelParameters:exposureParams:", &a3->var2.var2.var4, [v19 exposureParams]);

    if (!v20)
    {
      v21 = [v11 meta];
      int v20 = +[RawDFCommon fillRawNoiseModelParameters:exposureParams:](RawDFCommon, "fillRawNoiseModelParameters:exposureParams:", &a3[1].var2.var2, [v21 exposureParams]);

      if (!v20) {
        a3->int var0 = a6;
      }
    }
  }
  else
  {
    int32x2_t v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    int v20 = -73283;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end
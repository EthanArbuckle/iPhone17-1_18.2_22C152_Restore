@interface PVInstructionGraphOrientationEffectNode
+ (id)newOrientationEffectNodeWithInputs:(id)a3 inputIDs:(id)a4 effect:(id)a5;
- (BOOL)bypassOutOfRangeEffects;
- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4;
- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3;
- (id)effect;
- (void)setBypassOutOfRangeEffects:(BOOL)a3;
- (void)setEffect:(id)a3;
@end

@implementation PVInstructionGraphOrientationEffectNode

+ (id)newOrientationEffectNodeWithInputs:(id)a3 inputIDs:(id)a4 effect:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(PVInstructionGraphOrientationEffectNode);
  for (unint64_t i = 0; [v7 count] > i; ++i)
  {
    v12 = [v7 objectAtIndex:i];
    v13 = [v8 objectAtIndex:i];
    uint64_t v14 = [v13 unsignedLongValue];

    [(PVInstructionGraphEffectNode *)v10 setInputNode:v12 forInputID:v14];
  }
  [(PVInstructionGraphOrientationEffectNode *)v10 setEffect:v9];

  return v10;
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v81 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v120, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphEffectOrientationNode hgNodeForTime:...]");
  uint64_t v119 = *(void *)a6.m_Obj;
  if (v119) {
    (*(void (**)(uint64_t))(*(void *)v119 + 16))(v119);
  }
  [(PVInstructionGraphEffectNode *)self addDotTreeLinks:&v119];
  if (v119) {
    (*(void (**)(uint64_t))(*(void *)v119 + 24))(v119);
  }
  BOOL bypassOutOfRangeEffects = self->_bypassOutOfRangeEffects;
  if (bypassOutOfRangeEffects)
  {
    effect = self->_effect;
    if (effect) {
      [(PVEffect *)effect effectRange];
    }
    else {
      memset(&range, 0, sizeof(range));
    }
    CMTime time = (CMTime)*a3;
    BOOL bypassOutOfRangeEffects = CMTimeRangeContainsTime(&range, &time) == 0;
  }
  v16 = self->_effect;
  if (!v16 || bypassOutOfRangeEffects)
  {
    if (v16)
    {
      [(PVEffect *)v16 effectRange];
      long long v23 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      *(_OWORD *)&range2.start.value = *MEMORY[0x1E4F1FA20];
      *(_OWORD *)&range2.start.epoch = v23;
      *(_OWORD *)&range2.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
      if (CMTimeRangeEqual(&range1, &range2))
      {
        v26 = self->_effect;
        v27 = [(PVEffect *)v26 debugDisplayName];
        NSLog(&cfstr_WarningHgnodef.isa, v26, v27);
      }
      unsigned __int8 v28 = atomic_load(HGLogger::_enabled);
      if (v28) {
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Current Time is out of Effect Range. Returning HGNode of first input, assuming input0 is set...\n", v24, v25);
      }
      uint64_t v29 = PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a6.m_Obj);
      HGDotGraph::filled(v29, (unint64_t)self, "#FFA500");
      if (+[PVEnvironment PV_DEBUG_COLOR_OUT_OF_RANGE_EFFECTS])
      {
        v30 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
        HGSolidColor::HGSolidColor(v30);
      }
    }
    else
    {
      unsigned __int8 v31 = atomic_load(HGLogger::_enabled);
      if (v31) {
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"effect is Nil. Returning HGNode of first input, assuming input0 is set...\n", v12, v13);
      }
      uint64_t v32 = PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a6.m_Obj);
      HGDotGraph::filled(v32, (unint64_t)self, "#822222");
    }
    LODWORD(v91[0]) = 0;
    v96 = (unsigned int *)v91;
    v33 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)&self->super._inputMap, (unsigned int *)v91, (uint64_t)&std::piecewise_construct, &v96)[5];
    long long v83 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    uint64_t v34 = *(void *)a6.m_Obj;
    uint64_t v82 = v34;
    if (v34) {
      (*(void (**)(uint64_t))(*(void *)v34 + 16))(v34);
    }
    if (v33)
    {
      [v33 hgNodeForTime:&v83 trackInputs:a4 renderer:a5 igContext:&v82];
      uint64_t v34 = v82;
      if (!v82) {
        goto LABEL_99;
      }
    }
    else
    {
      void *v81 = 0;
      if (!v34) {
        goto LABEL_99;
      }
    }
    (*(void (**)(uint64_t))(*(void *)v34 + 24))(v34);
    goto LABEL_99;
  }
  unsigned __int8 v17 = atomic_load(HGLogger::_enabled);
  if (v17)
  {
    id v18 = [(PVEffect *)self->_effect debugDisplayName];
    uint64_t v19 = [v18 UTF8String];
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Will Build render graph for effect (%s)\n", v20, v21, v19);
  }
  if ((int)HGLogger::getLevel((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", v11) >= 1)
  {
    v22 = self->_effect;
    if (v22) {
      [(PVEffect *)v22 effectRange];
    }
    else {
      memset(&v116, 0, sizeof(v116));
    }
    v35 = CMTimeRangeCopyDescription(0, &v116);
    v36 = v35;
    unsigned __int8 v37 = atomic_load(HGLogger::_enabled);
    if (v37)
    {
      uint64_t v38 = [v35 UTF8String];
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Effect Time Range: %s\n", v39, v40, v38);
    }
    CFRelease(v36);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LODWORD(v91[0]) = 0;
    v96 = (unsigned int *)v91;
    v51 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)&self->super._inputMap, (unsigned int *)v91, (uint64_t)&std::piecewise_construct, &v96)[5];
    long long v114 = *(_OWORD *)&a3->var0;
    int64_t v115 = a3->var3;
    uint64_t v52 = *(void *)a6.m_Obj;
    uint64_t v113 = v52;
    if (v52) {
      (*(void (**)(uint64_t))(*(void *)v52 + 16))(v52);
    }
    if (v51)
    {
      [v51 hgNodeForTime:&v114 trackInputs:a4 renderer:a5 igContext:&v113];
      uint64_t v52 = v113;
      if (!v113) {
        goto LABEL_99;
      }
    }
    else
    {
      void *v81 = 0;
      if (!v52) {
        goto LABEL_99;
      }
    }
    (*(void (**)(uint64_t))(*(void *)v52 + 24))(v52);
    goto LABEL_99;
  }
  uint64_t v41 = *(void *)a6.m_Obj;
  uint64_t v112 = v41;
  if (v41) {
    (*(void (**)(uint64_t))(*(void *)v41 + 16))(v41);
  }
  [(PVInstructionGraphNode *)self loadIGNode:&v112];
  if (v112) {
    (*(void (**)(uint64_t))(*(void *)v112 + 24))(v112);
  }
  v42 = self->_effect;
  unsigned int v111 = 0;
  long long v109 = *(_OWORD *)&a3->var0;
  int64_t v110 = a3->var3;
  v79 = v42;
  v43 = [(PVEffect *)v42 inputsForTime:&v109];
  v44 = [v43 firstObject];
  unsigned int v45 = [v44 intValue];

  unsigned int v111 = v45;
  v96 = &v111;
  v48 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)&self->super._inputMap, &v111, (uint64_t)&std::piecewise_construct, &v96)[5];
  unsigned __int8 v49 = atomic_load(HGLogger::_enabled);
  if (v49) {
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Getting HGNode for effect inputID: %d\n", v46, v47, v111);
  }
  long long v106 = *(_OWORD *)&a3->var0;
  int64_t v107 = a3->var3;
  uint64_t v50 = *(void *)a6.m_Obj;
  uint64_t v105 = v50;
  if (v50) {
    (*(void (**)(uint64_t))(*(void *)v50 + 16))(v50);
  }
  if (v48) {
    [v48 hgNodeForTime:&v106 trackInputs:a4 renderer:a5 igContext:&v105];
  }
  else {
    uint64_t v108 = 0;
  }
  if (v105) {
    (*(void (**)(uint64_t))(*(void *)v105 + 24))(v105);
  }
  if (![(PVEffect *)self->_effect supportsExtendedRangeInputs]
    && +[PVEnvironment PV_CLAMP_XR_INPUTS_TO_FILTERS])
  {
    v78 = PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
    v53 = +[PVColorSpace extendedSRGBColorSpace];
    if ([v78 isEqual:v53])
    {

      goto LABEL_64;
    }
    v56 = PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
    v57 = +[PVColorSpace extendedLinearSRGBColorSpace];
    int v77 = [v56 isEqual:v57];

    if (v77)
    {
LABEL_64:
      unsigned __int8 v58 = atomic_load(HGLogger::_enabled);
      if (v58) {
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Clamping input (%d). XR working space and effect doesn't support it.\n", v54, v55, v111);
      }
      v59 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
      HGColorClamp::HGColorClamp(v59);
    }
  }
  v96 = (unsigned int *)v97;
  v97[0] = 0;
  v99[0] = 0;
  v99[1] = 0;
  v97[1] = 0;
  v98 = v99;
  v99[2] = v100;
  v100[0] = 0;
  v101[0] = 0;
  v101[1] = 0;
  v100[1] = 0;
  v100[2] = v101;
  v103[0] = 0;
  v102 = v103;
  v104[1] = 0;
  v104[0] = 0;
  v103[1] = 0;
  v103[2] = v104;
  unsigned int v60 = v111;
  uint64_t v95 = v108;
  if (v108) {
    (*(void (**)(uint64_t))(*(void *)v108 + 16))(v108);
  }
  PVInputHGNodeMap<unsigned int>::SetNode((uint64_t **)&v96, v60, &v95);
  if (v95) {
    (*(void (**)(uint64_t))(*(void *)v95 + 24))(v95);
  }
  v61 = self->_effect;
  uint64_t v62 = *(void *)a6.m_Obj;
  uint64_t v92 = v62;
  if (v62) {
    (*(void (**)(uint64_t))(*(void *)v62 + 16))(v62);
  }
  if (v48)
  {
    [v48 inputSizeForPVEffect:v61 igContext:&v92];
  }
  else
  {
    long long v93 = 0u;
    long long v94 = 0u;
  }
  if (v92) {
    (*(void (**)(uint64_t))(*(void *)v92 + 24))(v92);
  }
  LODWORD(v122[0]) = v111;
  v91[0] = v122;
  v63 = std::__tree<std::__value_type<unsigned int,PCRect<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCRect<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCRect<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v98, (unsigned int *)v122, (uint64_t)&std::piecewise_construct, v91);
  long long v64 = v94;
  *(_OWORD *)(v63 + 5) = v93;
  *(_OWORD *)(v63 + 7) = v64;
  v65 = self->_effect;
  uint64_t v66 = *(void *)a6.m_Obj;
  uint64_t v90 = v66;
  if (v66) {
    (*(void (**)(uint64_t))(*(void *)v66 + 16))(v66);
  }
  if (v48) {
    [v48 pixelTransformForPVEffect:v65 igContext:&v90];
  }
  else {
    memset(v91, 0, 128);
  }
  if (v90) {
    (*(void (**)(uint64_t))(*(void *)v90 + 24))(v90);
  }
  PVInputHGNodeMap<unsigned int>::SetPixelTransform((uint64_t)&v96, v111, (uint64_t **)v91);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v67 = v48;
    int v68 = [v67 isPortrait];
    unsigned int v121 = v111;
    v122[0] = &v121;
    *((_DWORD *)std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v102, &v121, (uint64_t)&std::piecewise_construct, v122)+ 8) = v68 ^ 1;
  }
  unsigned __int8 v69 = atomic_load(HGLogger::_enabled);
  if (v69)
  {
    id v70 = [(PVEffect *)self->_effect debugDisplayName];
    uint64_t v71 = [v70 UTF8String];
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Building Graph for PVEffect (%s).\n", v72, v73, v71);
  }
  v74 = self->_effect;
  long long v88 = *(_OWORD *)&a3->var0;
  int64_t v89 = a3->var3;
  uint64_t v75 = *(void *)a6.m_Obj;
  uint64_t v87 = v75;
  if (v75) {
    (*(void (**)(uint64_t))(*(void *)v75 + 16))(v75);
  }
  if (v74)
  {
    [(PVEffect *)v74 hgNodeForTime:&v88 inputs:&v96 renderer:a5 igContext:&v87];
    uint64_t v75 = v87;
    if (!v87) {
      goto LABEL_96;
    }
    goto LABEL_95;
  }
  void *v81 = 0;
  if (v75) {
LABEL_95:
  }
    (*(void (**)(uint64_t))(*(void *)v75 + 24))(v75);
LABEL_96:
  [(PVInstructionGraphEffectNode *)self unloadIGNode];
  PVInputHGNodeMap<unsigned int>::~PVInputHGNodeMap((void **)&v96);
  if (v108) {
    (*(void (**)(uint64_t))(*(void *)v108 + 24))(v108);
  }

LABEL_99:
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v120);
  return v76;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v6 = v4;
  id v20 = a3;
  *(void *)uint64_t v6 = 0;
  *(void *)(v6 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v6 + 16) = _Q0;
  double v12 = (*(double (**)(void))(**(void **)a4.m_Obj + 40))();
  double v14 = v13;
  double v15 = (*(float (**)(void))(**(void **)a4.m_Obj + 48))();
  *(double *)(v6 + 16) = v12 / v15;
  *(double *)(v6 + 24) = v14 / v15;

  result.int64_t var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  if (self->_effect
    && (v5 = (HGDotGraph *)PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a3.m_Obj),
        HGDotGraph::on(v5)))
  {
    int v6 = PVInstructionGraphContext::DotTreeLogLevel(*(PVInstructionGraphContext **)a3.m_Obj);
    id v7 = [(PVEffect *)self->_effect displayName];
    id v8 = [@"InstructionGraphOrientationEffectNode" stringByAppendingFormat:@" [%@]", v7];

    if (v6 >= 2)
    {
      id v9 = [(PVEffect *)self->_effect effectType];
      v10 = [(PVEffect *)self->_effect effectID];
      v11 = +[PVEffect categoryForEffectID:v10];
      uint64_t v12 = [v8 stringByAppendingFormat:@" {%@, %@}", v9, v11];

      id v8 = (void *)v12;
    }
    effect = self->_effect;
    if (effect)
    {
      [(PVEffect *)effect effectRange];
      CMTimeValue v14 = *(void *)&v23[0];
      uint64_t v15 = DWORD2(v23[0]);
    }
    else
    {
      uint64_t v15 = 0;
      CMTimeValue v14 = 0;
      memset(v23, 0, sizeof(v23));
    }
    *(void *)&time.flags = *(void *)((char *)v23 + 12);
    HIDWORD(time.epoch) = DWORD1(v23[1]);
    time.value = v14;
    time.timescale = v15;
    double v17 = objc_msgSend(NSString, "stringWithFormat:", @"{%lld/%d = %.3f}", v14, v15, CMTimeGetSeconds(&time));
    double v18 = self->_effect;
    if (v18) {
      [(PVEffect *)v18 effectRange];
    }
    else {
      memset(&range, 0, sizeof(range));
    }
    CMTimeRangeGetEnd(&v22, &range);
    CMTime time = v22;
    double v19 = objc_msgSend(NSString, "stringWithFormat:", @"{%lld/%d = %.3f}", v22.value, v22.timescale, CMTimeGetSeconds(&time));
    double v16 = [v8 stringByAppendingFormat:@"\nRange: Start (%@) End (%@)", v17, v19];
  }
  else
  {
    double v16 = @"InstructionGraphOrientationEffectNode";
  }

  return v16;
}

- (id)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
}

- (BOOL)bypassOutOfRangeEffects
{
  return self->_bypassOutOfRangeEffects;
}

- (void)setBypassOutOfRangeEffects:(BOOL)a3
{
  self->_BOOL bypassOutOfRangeEffects = a3;
}

- (void).cxx_destruct
{
}

@end
@interface PVInstructionGraphNode
- (BOOL)isDebugDrawingEnabled;
- (BOOL)isPassthru;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4;
- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4;
- (PVIGHGNodeCacheKey)contextHGNodeCacheKeyAtTime:(SEL)a3;
- (PVInstructionGraphNode)init;
- (id)description;
- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3;
- (id)getAllSourceNodes;
- (id)instructionGraphNodeDescription;
- (id)requiredSourceSampleDataTrackIDs;
- (id)requiredSourceTrackIDs;
- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3;
- (void)setIsDebugDrawingEnabled:(BOOL)a3;
@end

@implementation PVInstructionGraphNode

- (PVInstructionGraphNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)PVInstructionGraphNode;
  result = [(PVInstructionGraphNode *)&v3 init];
  if (result) {
    result->_uuid = atomic_fetch_add(&sAtomicIGNodeCount, 1uLL);
  }
  return result;
}

- (id)requiredSourceTrackIDs
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (id)requiredSourceSampleDataTrackIDs
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (id)getAllSourceNodes
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)isPassthru
{
  return 0;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3
{
  uint64_t v4 = *(void *)a3.m_Obj;
  uint64_t v5 = v4;
  if (v4) {
    (*(void (**)(uint64_t, SEL))(*(void *)v4 + 16))(v4, a2);
  }
  [(PVInstructionGraphNode *)self loadIGNode:&v5 returnLoadedEffects:0];
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v12 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v46, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphNode hgNodeForTime:...]");
  $3CC8671D27C23BF42ADDB32F2B5E48AE v44 = *a3;
  [(PVInstructionGraphNode *)self contextHGNodeCacheKeyAtTime:&v44];
  v15 = (uint64_t **)PVInstructionGraphContext::HGNodeCache(*(PVInstructionGraphContext **)a6.m_Obj);
  *v12 = 0;
  unsigned __int8 v16 = atomic_load(HGLogger::_enabled);
  if (v16) {
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Checking context node cache for (uuid: %llu) (time: %lld.%d)\n", v13, v14, v45.var0, v45.var1.var0, v45.var1.var1);
  }
  PerfTimer::PerfTimer(&v43);
  PerfTimer::Start(v17);
  PVIGHGNodeCacheKey::PVIGHGNodeCacheKey(&v42, &v45);
  v18 = (uint64_t **)std::__tree<std::__value_type<PVIGHGNodeCacheKey,HGRef<HGNode>>,std::__map_value_compare<PVIGHGNodeCacheKey,std::__value_type<PVIGHGNodeCacheKey,HGRef<HGNode>>,std::less<PVIGHGNodeCacheKey>,true>,std::allocator<std::__value_type<PVIGHGNodeCacheKey,HGRef<HGNode>>>>::find<PVIGHGNodeCacheKey>((uint64_t)v15, (uint64_t)&v42);
  v19 = v15 + 1;

  unsigned __int8 v22 = atomic_load(HGLogger::_enabled);
  if (v15 + 1 == v18)
  {
    if (v22) {
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Cache Miss\n", v20, v21);
    }
    long long v38 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    uint64_t v25 = *(void *)a6.m_Obj;
    uint64_t v37 = v25;
    if (v25) {
      (*(void (**)(uint64_t))(*(void *)v25 + 16))(v25);
    }
    [(PVInstructionGraphNode *)self internalHGNodeForTime:&v38 trackInputs:a4 renderer:a5 igContext:&v37];
    v26 = *v12;
    if (*v12 == v41)
    {
      if (v26) {
        (*(void (**)(HGNode *))(*(void *)v26 + 24))(*v12);
      }
    }
    else
    {
      if (v26) {
        (*(void (**)(HGNode *))(*(void *)v26 + 24))(*v12);
      }
      v26 = v41;
      *v12 = v41;
      v41 = 0;
    }
    if (v37) {
      (*(void (**)(uint64_t))(*(void *)v37 + 24))(v37);
    }
    PVIGHGNodeCacheKey::PVIGHGNodeCacheKey(&v36, &v45);
    v35 = v26;
    if (v26) {
      (*(void (**)(HGNode *))(*(void *)v26 + 16))(v26);
    }
    PVInputHGNodeMap<PVIGHGNodeCacheKey>::SetNode(v15, &v36, (uint64_t *)&v35);
    if (v35) {
      (*(void (**)(HGNode *))(*(void *)v35 + 24))(v35);
    }
    id var2 = v36.var2;
  }
  else
  {
    if (v22) {
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Cache Hit!\n", v20, v21);
    }
    PVIGHGNodeCacheKey::PVIGHGNodeCacheKey(&v40, &v45);
    PVInputHGNodeMap<PVIGHGNodeCacheKey>::GetNode((uint64_t)v15, (uint64_t)&v40, &v41);
    v23 = *v12;
    v24 = v41;
    if (*v12 == v41)
    {
      if (v23) {
        (*(void (**)(HGNode *))(*(void *)v23 + 24))(v23);
      }
    }
    else
    {
      if (v23)
      {
        (*(void (**)(HGNode *))(*(void *)v23 + 24))(v23);
        v24 = v41;
      }
      *v12 = v24;
      v41 = 0;
    }
    id var2 = v40.var2;
  }

  PerfTimer::End(&v43);
  v28 = (uint64_t *)PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a6.m_Obj);
  if (HGDotGraph::on((HGDotGraph *)v28))
  {
    uint64_t v29 = *(void *)a6.m_Obj;
    uint64_t v34 = v29;
    if (v29) {
      (*(void (**)(uint64_t))(*(void *)v29 + 16))(v29);
    }
    v30 = [(PVInstructionGraphNode *)self dotTreeLabel:&v34];
    if (v34) {
      (*(void (**)(uint64_t))(*(void *)v34 + 24))(v34);
    }
    if ((int)PVInstructionGraphContext::DotTreeLogLevel(*(PVInstructionGraphContext **)a6.m_Obj) >= 2)
    {
      uint64_t v31 = objc_msgSend(v30, "stringByAppendingFormat:", @"\nBuildTime: %.3f", (v43._end - v43._start) * 1000.0);

      v30 = (void *)v31;
    }
    id v32 = v30;
    HGDotGraph::node(v28, (unint64_t)self, [v32 UTF8String], 0);
    if (v19 != v18) {
      HGDotGraph::filled((uint64_t)v28, (unint64_t)self, "#90c070");
    }
  }
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v46);
  return v33;
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v7 = v6;
  unsigned __int8 v8 = atomic_load(HGLogger::_enabled);
  if (v8) {
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Base class returning empty HGNode.\n", (const char *)a4, (char *)a5, a6.m_Obj);
  }
  v9 = (HGNode *)HGObject::operator new(0x1A0uLL);
  v10 = HGNode::HGNode(v9);
  *v7 = v9;
  return (HGRef<HGNode>)v10;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  *(void *)uint64_t v4 = 0;
  *(void *)(v4 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v4 + 16) = _Q0;
  result.var0 = *(double *)&_Q0;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  return self;
}

- (PVIGHGNodeCacheKey)contextHGNodeCacheKeyAtTime:(SEL)a3
{
  unint64_t uuid = self->_uuid;
  CMTime v6 = *(CMTime *)a4;
  PVIGHGNodeCacheKey::PVIGHGNodeCacheKey(retstr, uuid, &v6);
  return result;
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"PVInstructionGraph" withString:&stru_1F119C770];

  return v5;
}

- (id)description
{
  v2 = NSString;
  objc_super v3 = [(PVInstructionGraphNode *)self instructionGraphNodeDescription];
  uint64_t v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (id)instructionGraphNodeDescription
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self, @"address");
  v7[1] = @"class";
  v8[0] = v2;
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (BOOL)isDebugDrawingEnabled
{
  return self->_isDebugDrawingEnabled;
}

- (void)setIsDebugDrawingEnabled:(BOOL)a3
{
  self->_isDebugDrawingEnabled = a3;
}

@end
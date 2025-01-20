@interface PVInstructionGraphEffectNode
+ (id)newEffectNodeToAddTitle:(id)a3 effect:(id)a4;
+ (id)newEffectNodeToFilterInput:(id)a3 effect:(id)a4;
+ (id)newEffectNodeToOverlayInputs:(id)a3 inputIDs:(id)a4 effect:(id)a5;
+ (id)newEffectNodeToTransitionFrom:(id)a3 to:(id)a4 effect:(id)a5;
- (BOOL)applyRenderTransformAfterEffect;
- (BOOL)bypassOutOfRangeEffects;
- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4;
- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4;
- (PVEffect)effect;
- (PVIGHGNodeCacheKey)contextHGNodeCacheKeyAtTime:(SEL)a3;
- (PVInstructionGraphEffectNode)init;
- (id).cxx_construct;
- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3;
- (id)getAllSourceNodes;
- (id)instructionGraphNodeDescription;
- (id)requiredSourceSampleDataTrackIDs;
- (id)requiredSourceTrackIDs;
- (void)addDotTreeLinks:(HGRef<PVInstructionGraphContext>)a3;
- (void)buildEffectInputMap:(void *)a3 forTime:(id *)a4 trackInputs:(const void *)a5 renderer:(const void *)a6 igContext:(HGRef<PVInstructionGraphContext>)a7;
- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4;
- (void)setApplyRenderTransformAfterEffect:(BOOL)a3;
- (void)setBypassOutOfRangeEffects:(BOOL)a3;
- (void)setEffect:(id)a3;
- (void)setInputNode:(id)a3 forInputID:(unsigned int)a4;
- (void)unloadIGNode;
@end

@implementation PVInstructionGraphEffectNode

+ (id)newEffectNodeToFilterInput:(id)a3 effect:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(PVInstructionGraphEffectNode);
  [(PVInstructionGraphEffectNode *)v7 setInputNode:v5 forInputID:0];
  [(PVInstructionGraphEffectNode *)v7 setEffect:v6];

  return v7;
}

+ (id)newEffectNodeToTransitionFrom:(id)a3 to:(id)a4 effect:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(PVInstructionGraphEffectNode);
  [(PVInstructionGraphEffectNode *)v10 setInputNode:v7 forInputID:0];
  [(PVInstructionGraphEffectNode *)v10 setInputNode:v8 forInputID:1];
  [(PVInstructionGraphEffectNode *)v10 setEffect:v9];

  return v10;
}

+ (id)newEffectNodeToOverlayInputs:(id)a3 inputIDs:(id)a4 effect:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(PVInstructionGraphEffectNode);
  for (unint64_t i = 0; [v7 count] > i; ++i)
  {
    v12 = [v7 objectAtIndex:i];
    v13 = [v8 objectAtIndex:i];
    uint64_t v14 = [v13 unsignedLongValue];

    [(PVInstructionGraphEffectNode *)v10 setInputNode:v12 forInputID:v14];
  }
  [(PVInstructionGraphEffectNode *)v10 setEffect:v9];

  return v10;
}

+ (id)newEffectNodeToAddTitle:(id)a3 effect:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(PVInstructionGraphEffectNode);
  [(PVInstructionGraphEffectNode *)v7 setInputNode:v5 forInputID:0];
  [(PVInstructionGraphEffectNode *)v7 setEffect:v6];

  return v7;
}

- (PVInstructionGraphEffectNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)PVInstructionGraphEffectNode;
  result = [(PVInstructionGraphNode *)&v3 init];
  if (result)
  {
    result->_bypassOutOfRangeEffects = 0;
    result->_applyRenderTransformAfterEffect = 0;
  }
  return result;
}

- (void)setInputNode:(id)a3 forInputID:(unsigned int)a4
{
  id v7 = a3;
  unsigned int v10 = a4;
  p_inputMap = (uint64_t **)&self->_inputMap;
  if (v7)
  {
    v11 = &v10;
    id v9 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(p_inputMap, &v10, (uint64_t)&std::piecewise_construct, &v11);
    objc_storeStrong((id *)v9 + 5, a3);
  }
  else
  {
    std::__tree<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>>>::__erase_unique<unsigned int>((uint64_t)p_inputMap, &v10);
  }
}

- (id)requiredSourceTrackIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    do
    {
      id v6 = begin_node[5].__value_.__left_;
      id v7 = [v6 requiredSourceTrackIDs];
      id v8 = [v7 allObjects];
      [v3 addObjectsFromArray:v8];

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          unsigned int v10 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          unsigned int v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v11 = v10->__value_.__left_ == begin_node;
          begin_node = v10;
        }
        while (!v11);
      }
      begin_node = v10;
    }
    while (v10 != p_pair1);
  }

  return v3;
}

- (id)requiredSourceSampleDataTrackIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    do
    {
      id v6 = begin_node[5].__value_.__left_;
      id v7 = [v6 requiredSourceSampleDataTrackIDs];
      id v8 = [v7 allObjects];
      [v3 addObjectsFromArray:v8];

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          unsigned int v10 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          unsigned int v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v11 = v10->__value_.__left_ == begin_node;
          begin_node = v10;
        }
        while (!v11);
      }
      begin_node = v10;
    }
    while (v10 != p_pair1);
  }

  return v3;
}

- (id)getAllSourceNodes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    do
    {
      id v6 = begin_node[5].__value_.__left_;
      id v7 = [v6 getAllSourceNodes];
      id v8 = [v7 allObjects];
      [v3 addObjectsFromArray:v8];

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          unsigned int v10 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          unsigned int v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v11 = v10->__value_.__left_ == begin_node;
          begin_node = v10;
        }
        while (!v11);
      }
      begin_node = v10;
    }
    while (v10 != p_pair1);
  }

  return v3;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  id v6 = a4;
  effect = self->_effect;
  if (effect)
  {
    [(PVEffect *)effect loadEffect];
    if (v6) {
      [v6 addObject:self->_effect];
    }
  }
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    do
    {
      id v10 = begin_node[5].__value_.__left_;
      uint64_t v11 = *(void *)a3.m_Obj;
      uint64_t v15 = v11;
      if (v11) {
        (*(void (**)(uint64_t))(*(void *)v11 + 16))(v11);
      }
      [v10 loadIGNode:&v15 returnLoadedEffects:v6];
      if (v15) {
        (*(void (**)(uint64_t))(*(void *)v15 + 24))(v15);
      }

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v13 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v14 = v13->__value_.__left_ == begin_node;
          begin_node = v13;
        }
        while (!v14);
      }
      begin_node = v13;
    }
    while (v13 != p_pair1);
  }
}

- (void)unloadIGNode
{
  effect = self->_effect;
  if (effect) {
    [(PVEffect *)effect releaseEffect];
  }
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    do
    {
      id v6 = begin_node[5].__value_.__left_;
      [v6 unloadIGNode];

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          id v8 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          id v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v9 = v8->__value_.__left_ == begin_node;
          begin_node = v8;
        }
        while (!v9);
      }
      begin_node = v8;
    }
    while (v8 != p_pair1);
  }
}

- (void)buildEffectInputMap:(void *)a3 forTime:(id *)a4 trackInputs:(const void *)a5 renderer:(const void *)a6 igContext:(HGRef<PVInstructionGraphContext>)a7
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    m_Obj = (PVInstructionGraphContext **)a7.m_Obj;
    id v10 = self;
    v41 = (uint64_t **)((char *)a3 + 24);
    v37 = (uint64_t **)((char *)a3 + 96);
    do
    {
      uint64_t left_low = LODWORD(begin_node[4].__value_.__left_);
      id v14 = begin_node[5].__value_.__left_;
      unsigned __int8 v15 = atomic_load(HGLogger::_enabled);
      if (v15) {
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Getting HGNode for effect inputID: %d\n", v12, v13, left_low);
      }
      long long v51 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      v50 = *m_Obj;
      if (v50) {
        (*(void (**)(PVInstructionGraphContext *))(*(void *)v50 + 16))(v50);
      }
      if (v14) {
        [v14 hgNodeForTime:&v51 trackInputs:a5 renderer:a6 igContext:&v50];
      }
      else {
        uint64_t v53 = 0;
      }
      if (v50) {
        (*(void (**)(PVInstructionGraphContext *))(*(void *)v50 + 24))(v50);
      }
      if (![(PVEffect *)v10->_effect supportsExtendedRangeInputs]
        && +[PVEnvironment PV_CLAMP_XR_INPUTS_TO_FILTERS])
      {
        v16 = PVInstructionGraphContext::WorkingColorSpace(*m_Obj);
        v17 = +[PVColorSpace extendedSRGBColorSpace];
        if ([v16 isEqual:v17])
        {

LABEL_17:
          unsigned __int8 v23 = atomic_load(HGLogger::_enabled);
          if (v23) {
            HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Clamping input (%d). XR working space and effect doesn't support it.\n", v18, v19, left_low);
          }
          v24 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
          HGColorClamp::HGColorClamp(v24);
        }
        v20 = PVInstructionGraphContext::WorkingColorSpace(*m_Obj);
        v21 = +[PVColorSpace extendedLinearSRGBColorSpace];
        int v22 = [v20 isEqual:v21];

        m_Obj = (PVInstructionGraphContext **)a7.m_Obj;
        id v10 = self;
        if (v22) {
          goto LABEL_17;
        }
      }
      uint64_t v49 = v53;
      if (v53) {
        (*(void (**)(uint64_t))(*(void *)v53 + 16))(v53);
      }
      PVInputHGNodeMap<unsigned int>::SetNode((uint64_t **)a3, left_low, &v49);
      if (v49) {
        (*(void (**)(uint64_t))(*(void *)v49 + 24))(v49);
      }
      effect = v10->_effect;
      v46 = *m_Obj;
      if (v46) {
        (*(void (**)(PVInstructionGraphContext *))(*(void *)v46 + 16))(v46);
      }
      if (v14)
      {
        [v14 inputSizeForPVEffect:effect igContext:&v46];
      }
      else
      {
        long long v47 = 0u;
        long long v48 = 0u;
      }
      if (v46) {
        (*(void (**)(PVInstructionGraphContext *))(*(void *)v46 + 24))(v46);
      }
      LODWORD(v55[0]) = left_low;
      *(void *)&v45[0] = v55;
      v26 = std::__tree<std::__value_type<unsigned int,PCRect<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCRect<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCRect<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v41, (unsigned int *)v55, (uint64_t)&std::piecewise_construct, (_DWORD **)v45);
      long long v27 = v48;
      *(_OWORD *)(v26 + 5) = v47;
      *(_OWORD *)(v26 + 7) = v27;
      v28 = v10->_effect;
      v29 = *m_Obj;
      v44 = v29;
      if (v29) {
        (*(void (**)(PVInstructionGraphContext *))(*(void *)v29 + 16))(v29);
      }
      if (v14) {
        [v14 pixelTransformForPVEffect:v28 igContext:&v44];
      }
      else {
        memset(v45, 0, sizeof(v45));
      }
      if (v44) {
        (*(void (**)(PVInstructionGraphContext *))(*(void *)v44 + 24))(v44);
      }
      PVInputHGNodeMap<unsigned int>::SetPixelTransform((uint64_t)a3, left_low, (uint64_t **)v45);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v30 = v14;
        int v31 = [v30 isPortrait];
        unsigned int v54 = left_low;
        v55[0] = &v54;
        *((_DWORD *)std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v37, &v54, (uint64_t)&std::piecewise_construct, v55)+ 8) = v31 ^ 1;
        v32 = [v30 timedMetadataGroup];
        PVInputHGNodeMap<unsigned int>::SetTimedMetadata((uint64_t)a3, left_low, v32);

        id v10 = self;
      }
      if (v53) {
        (*(void (**)(uint64_t))(*(void *)v53 + 24))(v53);
      }

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v34 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v34 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v35 = v34->__value_.__left_ == begin_node;
          begin_node = v34;
        }
        while (!v35);
      }
      begin_node = v34;
    }
    while (v34 != p_pair1);
  }
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  uint64_t v11 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v106, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphEffectNode hgNodeForTime:...]");
  uint64_t v105 = *(void *)a6.m_Obj;
  if (v105) {
    (*(void (**)(uint64_t))(*(void *)v105 + 16))(v105);
  }
  [(PVInstructionGraphEffectNode *)self addDotTreeLinks:&v105];
  if (v105) {
    (*(void (**)(uint64_t))(*(void *)v105 + 24))(v105);
  }
  if ([(PVEffect *)self->_effect isHidden]
    && ![(PVEffect *)self->_effect hasTimedPropertiesDelegates])
  {
    unsigned __int8 v17 = atomic_load(HGLogger::_enabled);
    if (v17) {
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"effect is hidden. Returning HGNode of first input, or new HGNode if no inputs...\n", v13, v14);
    }
    uint64_t v18 = PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a6.m_Obj);
    HGDotGraph::filled(v18, (unint64_t)self, "#e8eba0");
    v90.CMTimeValue value = (CMTimeValue)&v90;
    *(void *)&v90.timescale = &v90;
    v90.epoch = 0;
    p_inputMap = (uint64_t **)&self->_inputMap;
    v20 = *p_inputMap;
    if (*p_inputMap == (uint64_t *)(p_inputMap + 1)) {
      goto LABEL_41;
    }
    do
    {
      int v21 = *((_DWORD *)v20 + 8);
      id v22 = (id)v20[5];
      unsigned __int8 v23 = operator new(0x18uLL);
      v23[4] = v21;
      CMTimeValue value = v90.value;
      *(void *)unsigned __int8 v23 = v90.value;
      *((void *)v23 + 1) = &v90;
      *(void *)(value + 8) = v23;
      v90.CMTimeValue value = (CMTimeValue)v23;
      ++v90.epoch;

      v25 = (uint64_t *)v20[1];
      if (v25)
      {
        do
        {
          v26 = (uint64_t **)v25;
          v25 = (uint64_t *)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          v26 = (uint64_t **)v20[2];
          BOOL v27 = *v26 == v20;
          v20 = (uint64_t *)v26;
        }
        while (!v27);
      }
      v20 = (uint64_t *)v26;
    }
    while (v26 != p_inputMap + 1);
    if (!v90.epoch)
    {
LABEL_41:
      v45 = (HGNode *)HGObject::operator new(0x1A0uLL);
      HGNode::HGNode(v45);
      unsigned int *v11 = (HGXForm *)v45;
    }
    else
    {
      std::list<unsigned int>::__sort<std::__less<void,void>>(*(uint64_t *)&v90.timescale, (uint64_t)&v90, v90.epoch, (uint64_t)&v98);
      v98.CMTimeValue value = *(void *)&v90.timescale + 16;
      v28 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(p_inputMap, (unsigned int *)(*(void *)&v90.timescale + 16), (uint64_t)&std::piecewise_construct, &v98)[5];
      long long v103 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      uint64_t v29 = *(void *)a6.m_Obj;
      uint64_t v102 = v29;
      if (v29) {
        (*(void (**)(uint64_t))(*(void *)v29 + 16))(v29);
      }
      if (v28)
      {
        [v28 hgNodeForTime:&v103 trackInputs:a4 renderer:a5 igContext:&v102];
        uint64_t v29 = v102;
        if (!v102) {
          goto LABEL_99;
        }
        goto LABEL_98;
      }
      unsigned int *v11 = 0;
      if (v29) {
LABEL_98:
      }
        (*(void (**)(uint64_t))(*(void *)v29 + 24))(v29);
    }
LABEL_99:
    std::__list_imp<unsigned int>::clear(&v90);
    goto LABEL_100;
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
  id v30 = self->_effect;
  if (!v30 || bypassOutOfRangeEffects)
  {
    if (v30)
    {
      [(PVEffect *)v30 effectRange];
      long long v37 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      *(_OWORD *)&range2.start.CMTimeValue value = *MEMORY[0x1E4F1FA20];
      *(_OWORD *)&range2.start.epoch = v37;
      *(_OWORD *)&range2.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
      if (CMTimeRangeEqual(&range1, &range2))
      {
        v40 = self->_effect;
        v41 = [(PVEffect *)v40 debugDisplayName];
        NSLog(&cfstr_WarningHgnodef.isa, v40, v41);
      }
      unsigned __int8 v42 = atomic_load(HGLogger::_enabled);
      if (v42) {
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Current Time is out of Effect Range. Returning HGNode of first input, assuming input0 is set...\n", v38, v39);
      }
      uint64_t v43 = PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a6.m_Obj);
      HGDotGraph::filled(v43, (unint64_t)self, "#FFA500");
      if (+[PVEnvironment PV_DEBUG_COLOR_OUT_OF_RANGE_EFFECTS])
      {
        v44 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
        HGSolidColor::HGSolidColor(v44);
      }
    }
    else
    {
      unsigned __int8 v46 = atomic_load(HGLogger::_enabled);
      if (v46) {
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"effect is Nil. Returning HGNode of first input, assuming input0 is set...\n", v13, v14);
      }
      uint64_t v47 = PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a6.m_Obj);
      HGDotGraph::filled(v47, (unint64_t)self, "#822222");
    }
    LODWORD(v98.value) = 0;
    v90.CMTimeValue value = (CMTimeValue)&v98;
    long long v48 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)&self->_inputMap, (unsigned int *)&v98, (uint64_t)&std::piecewise_construct, &v90)[5];
    long long v78 = *(_OWORD *)&a3->var0;
    int64_t v79 = a3->var3;
    uint64_t v49 = *(void *)a6.m_Obj;
    uint64_t v77 = v49;
    if (v49) {
      (*(void (**)(uint64_t))(*(void *)v49 + 16))(v49);
    }
    if (v48)
    {
      [v48 hgNodeForTime:&v78 trackInputs:a4 renderer:a5 igContext:&v77];
      uint64_t v49 = v77;
      if (!v77) {
        goto LABEL_100;
      }
    }
    else
    {
      unsigned int *v11 = 0;
      if (!v49) {
        goto LABEL_100;
      }
    }
    (*(void (**)(uint64_t))(*(void *)v49 + 24))(v49);
    goto LABEL_100;
  }
  unsigned __int8 v31 = atomic_load(HGLogger::_enabled);
  if (v31)
  {
    id v32 = [(PVEffect *)self->_effect debugDisplayName];
    uint64_t v33 = [v32 UTF8String];
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Will Build render graph for effect (%s)\n", v34, v35, v33);
  }
  if ((int)HGLogger::getLevel((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", v12) >= 1)
  {
    v36 = self->_effect;
    if (v36) {
      [(PVEffect *)v36 effectRange];
    }
    else {
      memset(&v99, 0, sizeof(v99));
    }
    v50 = CMTimeRangeCopyDescription(0, &v99);
    long long v51 = v50;
    unsigned __int8 v52 = atomic_load(HGLogger::_enabled);
    if (v52)
    {
      uint64_t v53 = [v50 UTF8String];
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Effect Time Range: %s\n", v54, v55, v53);
    }
    CFRelease(v51);
  }
  v56 = *(PVRendererInstructionGraphContext **)a6.m_Obj;
  if (*(void *)a6.m_Obj) {
    (*(void (**)(void))(*(void *)v56 + 16))(*(void *)a6.m_Obj);
  }
  BOOL applyRenderTransformAfterEffect = self->_applyRenderTransformAfterEffect;
  if (self->_applyRenderTransformAfterEffect)
  {
    v74 = v11;
    PVRenderJob::GetDelegate(*(PVRenderJob **)a6.m_Obj);
    v57 = (PVVideoCompositingContext *)objc_claimAutoreleasedReturnValue();
    CGFloat v58 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
    CGFloat v60 = v59;
    char v61 = (*(uint64_t (**)(void))(**(void **)a6.m_Obj + 64))();
    (*(void (**)(CMTime *__return_ptr))(**(void **)a6.m_Obj + 72))(&v98);
    v62 = (PVRendererInstructionGraphContext *)HGObject::operator new(0xA8uLL);
    CMTime v90 = v98;
    v108.width = v58;
    v108.height = v60;
    PVRendererInstructionGraphContext::PVRendererInstructionGraphContext(v62, v57, v108, v61, &v90);
    if (v56 == v62)
    {
      if (v56) {
        (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v56 + 24))(v56);
      }
    }
    else
    {
      if (v56) {
        (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v56 + 24))(v56);
      }
      v56 = v62;
    }

    uint64_t v11 = v74;
  }
  v97 = v56;
  if (v56) {
    (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v56 + 16))(v56);
  }
  [(PVInstructionGraphNode *)self loadIGNode:&v97];
  if (v97) {
    (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v97 + 24))(v97);
  }
  v90.CMTimeValue value = (CMTimeValue)&v90.timescale;
  *(void *)&v90.timescale = 0;
  v92[0] = 0;
  v92[1] = 0;
  v90.epoch = 0;
  v91 = v92;
  v92[2] = v93;
  v93[0] = 0;
  v94[0] = 0;
  v94[1] = 0;
  v93[1] = 0;
  v93[2] = v94;
  v94[2] = v95;
  v95[0] = 0;
  v96[0] = 0;
  v96[1] = 0;
  v95[1] = 0;
  v95[2] = v96;
  int64_t v89 = a3->var3;
  long long v88 = *(_OWORD *)&a3->var0;
  v87 = v56;
  if (v56) {
    (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v56 + 16))(v56);
  }
  [(PVInstructionGraphEffectNode *)self buildEffectInputMap:&v90 forTime:&v88 trackInputs:a4 renderer:a5 igContext:&v87];
  if (v87) {
    (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v87 + 24))(v87);
  }
  unsigned __int8 v63 = atomic_load(HGLogger::_enabled);
  if (v63)
  {
    id v64 = [(PVEffect *)self->_effect debugDisplayName];
    uint64_t v65 = [v64 UTF8String];
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Building Graph for PVEffect (%s).\n", v66, v67, v65);
  }
  v68 = self->_effect;
  long long v85 = *(_OWORD *)&a3->var0;
  int64_t v86 = a3->var3;
  v84 = v56;
  if (v56) {
    (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v56 + 16))(v56);
  }
  if (v68) {
    [(PVEffect *)v68 hgNodeForTime:&v85 inputs:&v90 renderer:a5 igContext:&v84];
  }
  else {
    unsigned int *v11 = 0;
  }
  if (v84) {
    (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v84 + 24))(v84);
  }
  if (applyRenderTransformAfterEffect)
  {
    v69 = *v11;
    v83 = v69;
    if (v69) {
      (*(void (**)(HGXForm *))(*(void *)v69 + 16))(v69);
    }
    (*(void (**)(long long *__return_ptr))(**(void **)a6.m_Obj + 56))(&v82);
    int v70 = (*(uint64_t (**)(void))(**(void **)a6.m_Obj + 64))();
    HGXFormForCGAffineTransform(&v83, &v82, v70, (HGXForm **)&v98);
    v71 = *v11;
    CMTimeValue v72 = v98.value;
    if (*v11 == (HGXForm *)v98.value)
    {
      if (v71) {
        (*(void (**)(HGXForm *))(*(void *)v71 + 24))(v71);
      }
    }
    else
    {
      if (v71)
      {
        (*(void (**)(HGXForm *))(*(void *)v71 + 24))(v71);
        CMTimeValue v72 = v98.value;
      }
      unsigned int *v11 = (HGXForm *)v72;
      v98.CMTimeValue value = 0;
    }
    if (v83) {
      (*(void (**)(HGXForm *))(*(void *)v83 + 24))(v83);
    }
  }
  [(PVInstructionGraphEffectNode *)self unloadIGNode];
  PVInputHGNodeMap<unsigned int>::~PVInputHGNodeMap(&v90);
  if (v56) {
    (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v56 + 24))(v56);
  }
LABEL_100:
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v106);
  return v73;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v7 = v4;
  id v8 = a3;
  *(void *)uint64_t v7 = 0;
  *(void *)(v7 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v7 + 16) = _Q0;
  p_inputMap = (uint64_t **)&self->_inputMap;
  if (self->_inputMap.__tree_.__pair3_.__value_ == 1)
  {
    unsigned int v30 = *((_DWORD *)*p_inputMap + 8);
    *(void *)&long long v28 = &v30;
    unsigned __int8 v15 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(p_inputMap, &v30, (uint64_t)&std::piecewise_construct, (_DWORD **)&v28)[5];
    effect = self->_effect;
    uint64_t v17 = *(void *)a4.m_Obj;
    uint64_t v27 = v17;
    if (v17) {
      (*(void (**)(uint64_t))(*(void *)v17 + 16))(v17);
    }
    if (v15)
    {
      [v15 inputSizeForPVEffect:effect igContext:&v27];
      uint64_t v17 = v27;
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
    }
    long long v22 = v29;
    *(_OWORD *)uint64_t v7 = v28;
    *(_OWORD *)(v7 + 16) = v22;
    if (v17) {
      (*(void (**)(uint64_t))(*(void *)v17 + 24))(v17);
    }
  }
  else
  {
    double v18 = (*(double (**)(void))(**(void **)a4.m_Obj + 40))();
    double v20 = v19;
    double v21 = (*(float (**)(void))(**(void **)a4.m_Obj + 48))();
    *(double *)(v7 + 16) = v18 / v21;
    *(double *)(v7 + 24) = v20 / v21;
  }

  result.int64_t var3 = v26;
  result.var2 = v25;
  result.var1 = v24;
  result.var0 = v23;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
  id v17 = a4;
  double v7 = (*(double (**)(void))(**(void **)a5.m_Obj + 40))();
  double v9 = v8;
  float v10 = (*(float (**)(void))(**(void **)a5.m_Obj + 48))();
  [v17 outputSize];
  float v11 = v9;
  double v12 = (float)(v10 * v11);
  float v13 = v7;
  *(float *)&double v7 = v10 * v13;
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
  *(float *)&double v14 = v12 / v14;
  float64x2_t v15 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, *(float *)&v14, (float)-*(float *)&v14, 1.0);
  v15.f64[0] = *(float *)&v7 * 0.5;
  PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)retstr, v15, v12 * 0.5, 0.0);

  return result;
}

- (PVIGHGNodeCacheKey)contextHGNodeCacheKeyAtTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
  v5.receiver = self;
  v5.super_class = (Class)PVInstructionGraphEffectNode;
  return (PVIGHGNodeCacheKey *)[(PVIGHGNodeCacheKey *)&v5 contextHGNodeCacheKeyAtTime:&v6];
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  uint64_t v26 = *(void *)a3.m_Obj;
  if (v26) {
    (*(void (**)(uint64_t, SEL))(*(void *)v26 + 16))(v26, a2);
  }
  v25.id receiver = self;
  v25.super_class = (Class)PVInstructionGraphEffectNode;
  objc_super v5 = [(PVInstructionGraphNode *)&v25 dotTreeLabel:&v26];
  if (v26) {
    (*(void (**)(uint64_t))(*(void *)v26 + 24))(v26);
  }
  if (self->_effect)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = (HGDotGraph *)PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a3.m_Obj);
    if (HGDotGraph::on(v6))
    {
      int v7 = PVInstructionGraphContext::DotTreeLogLevel(*(PVInstructionGraphContext **)a3.m_Obj);
      double v8 = [(PVEffect *)self->_effect displayName];
      double v9 = [v5 stringByAppendingFormat:@" [%@]", v8];

      if (v7 < 2)
      {
        float v13 = v9;
      }
      else
      {
        float v10 = [(PVEffect *)self->_effect effectType];
        float v11 = [(PVEffect *)self->_effect effectID];
        double v12 = +[PVEffect categoryForEffectID:v11];
        float v13 = [v9 stringByAppendingFormat:@" {%@, %@}", v10, v12];
      }
      effect = self->_effect;
      if (effect)
      {
        [(PVEffect *)effect effectRange];
        id receiver = v24[0].receiver;
        uint64_t super_class_low = LODWORD(v24[0].super_class);
      }
      else
      {
        uint64_t super_class_low = 0;
        id receiver = 0;
        memset(v24, 0, sizeof(v24));
      }
      *(void *)&time.flags = *(Class *)((char *)&v24[0].super_class + 4);
      HIDWORD(time.epoch) = HIDWORD(v24[1].receiver);
      time.CMTimeValue value = (CMTimeValue)receiver;
      time.timescale = super_class_low;
      id v17 = objc_msgSend(NSString, "stringWithFormat:", @"{%lld/%d = %.3f}", receiver, super_class_low, CMTimeGetSeconds(&time));
      double v18 = self->_effect;
      if (v18) {
        [(PVEffect *)v18 effectRange];
      }
      else {
        memset(&range, 0, sizeof(range));
      }
      CMTimeRangeGetEnd(&v23, &range);
      CMTime time = v23;
      double v19 = objc_msgSend(NSString, "stringWithFormat:", @"{%lld/%d = %.3f}", v23.value, v23.timescale, CMTimeGetSeconds(&time));
      uint64_t v20 = [v13 stringByAppendingFormat:@"\nRange: Start (%@) End (%@)", v17, v19];

      objc_super v5 = (void *)v20;
    }
  }

  return v5;
}

- (id)instructionGraphNodeDescription
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v23.id receiver = self;
  v23.super_class = (Class)PVInstructionGraphEffectNode;
  id v3 = [(PVInstructionGraphNode *)&v23 instructionGraphNodeDescription];
  id v22 = (id)[v3 mutableCopy];

  uint64_t v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v22 setObject:v5 forKeyedSubscript:@"class"];

  effect = self->_effect;
  if (effect)
  {
    int v7 = [(PVEffect *)effect displayName];
    [v22 setObject:v7 forKeyedSubscript:@"effectName"];

    double v8 = [(PVEffect *)self->_effect effectDescription];
    [v22 setObject:v8 forKeyedSubscript:@"effect"];
  }
  double v9 = [MEMORY[0x1E4F1CA48] array];
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    do
    {
      uint64_t left_low = LODWORD(begin_node[4].__value_.__left_);
      id v13 = begin_node[5].__value_.__left_;
      double v14 = [NSNumber numberWithUnsignedInt:left_low];
      float64x2_t v15 = [v14 stringValue];
      double v24 = v15;
      v16 = [v13 instructionGraphNodeDescription];
      v25[0] = v16;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

      [v9 addObject:v17];
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          double v19 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          double v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v20 = v19->__value_.__left_ == begin_node;
          begin_node = v19;
        }
        while (!v20);
      }
      begin_node = v19;
    }
    while (v19 != p_pair1);
  }
  [v22 setObject:v9 forKeyedSubscript:@"inputs"];

  return v22;
}

- (void)addDotTreeLinks:(HGRef<PVInstructionGraphContext>)a3
{
  id v13 = (uint64_t *)PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a3.m_Obj);
  if (HGDotGraph::on((HGDotGraph *)v13))
  {
    double v19 = v20;
    v20[0] = 0;
    v21[0] = 0;
    v21[1] = 0;
    v20[1] = 0;
    v20[2] = v21;
    v21[2] = v22;
    v22[0] = 0;
    v23[0] = 0;
    v23[1] = 0;
    v22[1] = 0;
    v22[2] = v23;
    v23[2] = v24;
    v24[0] = 0;
    v25[0] = 0;
    v25[1] = 0;
    v24[1] = 0;
    v24[2] = v25;
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
    if (begin_node != &self->_inputMap.__tree_.__pair1_)
    {
      uint64_t v5 = *(void *)(MEMORY[0x1E4FBA408] + 72);
      uint64_t v11 = *(void *)(MEMORY[0x1E4FBA408] + 64);
      uint64_t v12 = *MEMORY[0x1E4FBA408];
      do
      {
        id v6 = begin_node[5].__value_.__left_;
        std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v16);
        std::ostream::operator<<();
        std::stringbuf::str();
        if (v15 >= 0) {
          p_p = (const char *)&__p;
        }
        else {
          p_p = (const char *)__p;
        }
        HGDotGraph::link(v13, (unint64_t)v6, (unint64_t)self, p_p, 0);
        if (v15 < 0) {
          operator delete(__p);
        }
        v16[0] = v12;
        *(void *)((char *)v16 + *(void *)(v12 - 24)) = v11;
        v16[2] = v5;
        v16[3] = MEMORY[0x1E4FBA470] + 16;
        if (v17 < 0) {
          operator delete((void *)v16[11]);
        }
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x1BA9BFAB0](&v18);

        left = (PVInstructionGraphEffectNode *)begin_node[1].__value_.__left_;
        if (left)
        {
          do
          {
            double v9 = left;
            left = (PVInstructionGraphEffectNode *)left->super.super.isa;
          }
          while (left);
        }
        else
        {
          do
          {
            double v9 = (PVInstructionGraphEffectNode *)begin_node[2].__value_.__left_;
            BOOL v10 = v9->super.super.isa == (Class)begin_node;
            begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)v9;
          }
          while (!v10);
        }
        begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)v9;
      }
      while (v9 != (PVInstructionGraphEffectNode *)&self->_inputMap.__tree_.__pair1_);
    }
    PVInputHGNodeMap<unsigned int>::~PVInputHGNodeMap(&v19);
  }
}

- (PVEffect)effect
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

- (BOOL)applyRenderTransformAfterEffect
{
  return self->_applyRenderTransformAfterEffect;
}

- (void)setApplyRenderTransformAfterEffect:(BOOL)a3
{
  self->_BOOL applyRenderTransformAfterEffect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effect, 0);
  left = self->_inputMap.__tree_.__pair1_.__value_.__left_;

  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::destroy((uint64_t)&self->_inputMap, left);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 3) = (char *)self + 32;
  return self;
}

@end
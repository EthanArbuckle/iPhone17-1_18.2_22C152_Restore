@interface PVInstructionGraphSourceCompositeNode
+ (id)newSourceCompositeNodeWithDelegate:(id)a3 inputs:(id)a4 metadata:(id)a5 outputSize:(CGSize)a6 outputFormat:(unsigned int)a7;
+ (id)newSourceCompositeNodeWithDelegate:(id)a3 inputs:(id)a4 userContext:(id)a5 outputSize:(CGSize)a6 outputFormat:(unsigned int)a7;
+ (id)newSourceCompositeNodeWithGraphNode:(id)a3 outputSize:(CGSize)a4 outputFormat:(unsigned int)a5;
+ (id)newSourceCompositeNodeWithPVImageBuffer:(id)a3;
+ (id)newSourceCompositeNodeWithTrack:(int)a3 outputSize:(CGSize)a4;
+ (id)newSourceCompositeNodeWithURL:(id)a3 key:(id)a4 imageDelegate:(id)a5;
- (BOOL)canPreprocess;
- (BOOL)canRender;
- (CGSize)outputSize;
- (HGRef<HGNode>)conformInputImage:(id)a3 colorSpace:(id)a4 renderer:(const void *)a5 currentTime:(id *)a6 igContext:(HGRef<PVInstructionGraphContext>)a7;
- (HGRef<HGNode>)conformNode:(HGRef<HGNode>)a3 toSize:(HGRect)a4;
- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (HGRef<HGNode>)nodeForCompositeTrackMap:(const void *)a3;
- (NSDictionary)inputMap;
- (NSObject)metadata;
- (NSString)imageKey;
- (NSURL)imageURL;
- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4;
- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4;
- (PVColorSpace)colorSpace;
- (PVCompositeDelegate)renderDelegate;
- (PVCompositeDelegateEffect)delegateEffect;
- (PVImageBuffer)imageBuffer;
- (PVImageSeqDelegate)imageSeqDelegate;
- (PVInstructionGraphNode)graphNode;
- (PVInstructionGraphSourceCompositeNode)init;
- (id).cxx_construct;
- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3;
- (id)getAllSourceNodes;
- (id)instructionGraphNodeDescription;
- (id)requiredSourceTrackIDs;
- (id)userContext;
- (int)nodeType;
- (int)trackID;
- (unsigned)outputFormat;
- (void)addDotTreeLinks:(HGRef<PVInstructionGraphContext>)a3;
- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4;
- (void)setCanPreprocess:(BOOL)a3;
- (void)setCanRender:(BOOL)a3;
- (void)setColorSpace:(id)a3;
- (void)setDelegateEffect:(id)a3;
- (void)setGraphNode:(id)a3;
- (void)setImageBuffer:(id)a3;
- (void)setImageKey:(id)a3;
- (void)setImageSeqDelegate:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setInputMap:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNodeType:(int)a3;
- (void)setOutputFormat:(unsigned int)a3;
- (void)setOutputSize:(CGSize)a3;
- (void)setRenderDelegate:(id)a3;
- (void)setTrackID:(int)a3;
- (void)setUserContext:(id)a3;
- (void)unloadIGNode;
@end

@implementation PVInstructionGraphSourceCompositeNode

- (PVInstructionGraphSourceCompositeNode)init
{
  v22.receiver = self;
  v22.super_class = (Class)PVInstructionGraphSourceCompositeNode;
  v2 = [(PVInstructionGraphSourceNode *)&v22 init];
  v3 = v2;
  v4 = v2;
  if (v2)
  {
    HIDWORD(v2->_renderManager.m_Obj) = 0;
    *(_DWORD *)&v2->_canPreprocess = 0;
    colorSpace = v2->_colorSpace;
    v2->_colorSpace = 0;

    imageURL = v4->_imageURL;
    v4->_imageURL = 0;

    inputMap = v4->_inputMap;
    v4->_inputMap = 0;

    imageKey = v4->_imageKey;
    v4->_imageKey = 0;

    imageBuffer = v4->_imageBuffer;
    v4->_imageBuffer = 0;

    v3->_delegateEffect = 0;
    v3->_outputSize.width = 0.0;
    v4->_nodeType = 1380401729;
    imageSeqDelegate = v4->_imageSeqDelegate;
    v4->_imageSeqDelegate = 0;

    PVRenderManager::INSTANCE(v11, &v21);
    CGFloat ty = v4->super._transform.ty;
    CGFloat v13 = v21;
    if (*(void *)&ty == *(void *)&v21)
    {
      if (ty != 0.0) {
        (*(void (**)(CGFloat))(**(void **)&ty + 24))(COERCE_CGFLOAT(*(void *)&ty));
      }
    }
    else
    {
      if (ty != 0.0)
      {
        (*(void (**)(CGFloat))(**(void **)&ty + 24))(COERCE_CGFLOAT(*(void *)&ty));
        CGFloat v13 = v21;
      }
      v4->super._transform.CGFloat ty = v13;
    }
    renderDelegate = v4->_renderDelegate;
    v4->_renderDelegate = 0;

    metadata = v4->_metadata;
    v4->_metadata = 0;

    LOBYTE(v4->_renderManager.m_Obj) = 0;
    BYTE1(v4->_renderManager.m_Obj) = 0;
    v16 = +[PVContentRegistry sharedInstance];
    uint64_t v17 = [v16 createContentInstance:@"F3D8E4D0-686B-44C6-8966-E50856A94959"];
    id userContext = v4->_userContext;
    v4->_id userContext = (id)v17;

    v19 = *(void **)&v4->_trackID;
    *(void *)&v4->_trackID = 0;
  }
  return v4;
}

+ (id)newSourceCompositeNodeWithURL:(id)a3 key:(id)a4 imageDelegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(PVInstructionGraphSourceCompositeNode);
  [(PVInstructionGraphSourceCompositeNode *)v10 setNodeType:1];
  [(PVInstructionGraphSourceCompositeNode *)v10 setImageURL:v7];
  [(PVInstructionGraphSourceCompositeNode *)v10 setImageKey:v8];
  [(PVInstructionGraphSourceCompositeNode *)v10 setImageSeqDelegate:v9];
  [v9 imageSizeForURL:v7];
  -[PVInstructionGraphSourceCompositeNode setOutputSize:](v10, "setOutputSize:");

  return v10;
}

+ (id)newSourceCompositeNodeWithPVImageBuffer:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PVInstructionGraphSourceCompositeNode);
  [(PVInstructionGraphSourceCompositeNode *)v4 setNodeType:2];
  [(PVInstructionGraphSourceCompositeNode *)v4 setImageBuffer:v3];
  [v3 size];
  -[PVInstructionGraphSourceCompositeNode setOutputSize:](v4, "setOutputSize:");

  return v4;
}

+ (id)newSourceCompositeNodeWithTrack:(int)a3 outputSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v6 = *(void *)&a3;
  id v7 = objc_alloc_init(PVInstructionGraphSourceCompositeNode);
  [(PVInstructionGraphSourceCompositeNode *)v7 setNodeType:3];
  [(PVInstructionGraphSourceCompositeNode *)v7 setTrackID:v6];
  -[PVInstructionGraphSourceCompositeNode setOutputSize:](v7, "setOutputSize:", width, height);
  return v7;
}

+ (id)newSourceCompositeNodeWithGraphNode:(id)a3 outputSize:(CGSize)a4 outputFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  id v9 = objc_alloc_init(PVInstructionGraphSourceCompositeNode);
  [(PVInstructionGraphSourceCompositeNode *)v9 setNodeType:4];
  [(PVInstructionGraphSourceCompositeNode *)v9 setGraphNode:v8];
  -[PVInstructionGraphSourceCompositeNode setOutputSize:](v9, "setOutputSize:", width, height);
  [(PVInstructionGraphSourceCompositeNode *)v9 setOutputFormat:v5];

  return v9;
}

+ (id)newSourceCompositeNodeWithDelegate:(id)a3 inputs:(id)a4 metadata:(id)a5 outputSize:(CGSize)a6 outputFormat:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  double height = a6.height;
  double width = a6.width;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = objc_alloc_init(PVInstructionGraphSourceCompositeNode);
  [(PVInstructionGraphSourceCompositeNode *)v15 setNodeType:5];
  [(PVInstructionGraphSourceCompositeNode *)v15 setMetadata:v14];
  [(PVInstructionGraphSourceCompositeNode *)v15 setInputMap:v13];
  -[PVInstructionGraphSourceCompositeNode setOutputSize:](v15, "setOutputSize:", width, height);
  [(PVInstructionGraphSourceCompositeNode *)v15 setOutputFormat:v7];
  if (v12)
  {
    [(PVInstructionGraphSourceCompositeNode *)v15 setRenderDelegate:v12];
    [(PVInstructionGraphSourceCompositeNode *)v15 setCanPreprocess:0];
    [(PVInstructionGraphSourceCompositeNode *)v15 setCanRender:objc_opt_respondsToSelector() & 1];
  }

  return v15;
}

+ (id)newSourceCompositeNodeWithDelegate:(id)a3 inputs:(id)a4 userContext:(id)a5 outputSize:(CGSize)a6 outputFormat:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  double height = a6.height;
  double width = a6.width;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = objc_alloc_init(PVInstructionGraphSourceCompositeNode);
  [(PVInstructionGraphSourceCompositeNode *)v15 setNodeType:5];
  [(PVInstructionGraphSourceCompositeNode *)v15 setUserContext:v14];
  [(PVInstructionGraphSourceCompositeNode *)v15 setInputMap:v13];
  -[PVInstructionGraphSourceCompositeNode setOutputSize:](v15, "setOutputSize:", width, height);
  [(PVInstructionGraphSourceCompositeNode *)v15 setOutputFormat:v7];
  if (v12)
  {
    [(PVInstructionGraphSourceCompositeNode *)v15 setRenderDelegate:v12];
    [(PVInstructionGraphSourceCompositeNode *)v15 setCanPreprocess:objc_opt_respondsToSelector() & 1];
    [(PVInstructionGraphSourceCompositeNode *)v15 setCanRender:objc_opt_respondsToSelector() & 1];
    v16 = [(PVInstructionGraphSourceCompositeNode *)v15 delegateEffect];
    [v16 setRenderDelegate:v12];

    uint64_t v17 = [(PVInstructionGraphSourceCompositeNode *)v15 delegateEffect];
    [v17 setUserContext:v14];
  }
  return v15;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(PVInstructionGraphSourceCompositeNode *)self nodeType] == 4)
  {
    uint64_t v7 = [(PVInstructionGraphSourceCompositeNode *)self graphNode];
    uint64_t v8 = *(void *)a3.m_Obj;
    uint64_t v24 = v8;
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
    }
    [v7 loadIGNode:&v24 returnLoadedEffects:v6];
    if (v24) {
      (*(void (**)(uint64_t))(*(void *)v24 + 24))(v24);
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v14 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
        v15 = [v14 objectForKeyedSubscript:v13];

        uint64_t v16 = *(void *)a3.m_Obj;
        uint64_t v19 = v16;
        if (v16) {
          (*(void (**)(uint64_t))(*(void *)v16 + 16))(v16);
        }
        [v15 loadIGNode:&v19 returnLoadedEffects:v6];
        if (v19) {
          (*(void (**)(uint64_t))(*(void *)v19 + 24))(v19);
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v10);
  }

  uint64_t v17 = [(PVInstructionGraphSourceCompositeNode *)self delegateEffect];
  [v17 loadEffect];

  if (v6)
  {
    v18 = [(PVInstructionGraphSourceCompositeNode *)self delegateEffect];
    [v6 addObject:v18];
  }
}

- (void)unloadIGNode
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(PVInstructionGraphSourceCompositeNode *)self nodeType] == 4)
  {
    id v3 = [(PVInstructionGraphSourceCompositeNode *)self graphNode];
    [v3 unloadIGNode];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        id v9 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
        uint64_t v10 = [v9 objectForKeyedSubscript:v8];

        [v10 unloadIGNode];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v11 = [(PVInstructionGraphSourceCompositeNode *)self delegateEffect];
  [v11 releaseEffect];
}

- (HGRef<HGNode>)conformNode:(HGRef<HGNode>)a3 toSize:(HGRect)a4
{
  uint64_t v5 = *(void *)&a4.var2;
  uint64_t v6 = *(void *)&a4.var0;
  void *v4 = 0;
  uint64_t v7 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
  *(void *)&v9.var0 = v6;
  *(void *)&v9.var2 = v5;
  HGSolidColor::HGSolidColor(v7, v9);
}

- (HGRef<HGNode>)conformInputImage:(id)a3 colorSpace:(id)a4 renderer:(const void *)a5 currentTime:(id *)a6 igContext:(HGRef<PVInstructionGraphContext>)a7
{
  long long v12 = v7;
  id v13 = a3;
  id v14 = a4;
  long long v15 = (HGNode *)HGObject::operator new(0x1A0uLL);
  HGNode::HGNode(v15);
  *long long v12 = v15;
  if ([v13 canCreateCVPixelBuffer])
  {
    uint64_t v16 = (__CVBuffer *)[v13 cvPixelBufferWithColorSpace:v14];
    if (v16)
    {
      long long v22 = *(_OWORD *)&a6->var0;
      int64_t var3 = a6->var3;
      uint64_t v17 = *(PVInstructionGraphContext **)a7.m_Obj;
      long long v21 = v17;
      if (v17) {
        (*(void (**)(PVInstructionGraphContext *))(*(void *)v17 + 16))(v17);
      }
      PVCreateInputGraphForPixelBuffer(v16, &v21, &v24);
      if (v15 == v24)
      {
        if (v15) {
          (*(void (**)(HGNode *))(*(void *)v15 + 24))(v15);
        }
      }
      else
      {
        if (v15) {
          (*(void (**)(HGNode *))(*(void *)v15 + 24))(v15);
        }
        long long v15 = v24;
        *long long v12 = v24;
        uint64_t v24 = 0;
      }
      if (v21) {
        (*(void (**)(PVInstructionGraphContext *))(*(void *)v21 + 24))(v21);
      }
    }
  }
  if (v15)
  {
    long long v20 = v15;
    (*(void (**)(HGNode *))(*(void *)v15 + 16))(v15);
    [(PVInstructionGraphSourceNode *)self applyWrapModeToInput:&v20];
    v18 = *(void (**)(HGNode *))(*(void *)v15 + 24);
    if (v15 == v24)
    {
      v18(v15);
    }
    else
    {
      v18(v15);
      *long long v12 = v24;
      uint64_t v24 = 0;
    }
    if (v20) {
      (*(void (**)(HGNode *))(*(void *)v20 + 24))(v20);
    }
  }

  return v19;
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v125 = v6;
  uint64_t v180 = *MEMORY[0x1E4F143B8];
  double v8 = (*(double (**)(void, SEL))(**(void **)a6.m_Obj + 40))(*(void *)a6.m_Obj, a2);
  double v10 = v9;
  float v11 = (*(float (**)(void))(**(void **)a6.m_Obj + 48))();
  m_Obj = (PVInstructionGraphContext **)a6.m_Obj;
  uint64_t v12 = *(void *)a6.m_Obj;
  uint64_t v177 = v12;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 16))(v12);
  }
  [(PVInstructionGraphSourceCompositeNode *)self addDotTreeLinks:&v177];
  if (v177) {
    (*(void (**)(uint64_t))(*(void *)v177 + 24))(v177);
  }
  v176[1] = 0;
  v176[0] = 0;
  v175 = (uint64_t *)v176;
  id v13 = (void *)*((void *)a4 + 1);
  if (!v13) {
    goto LABEL_16;
  }
  id v14 = (char *)a4 + 8;
  do
  {
    unint64_t v15 = v13[4];
    BOOL v16 = v15 >= (unint64_t)self;
    if (v15 >= (unint64_t)self) {
      uint64_t v17 = v13;
    }
    else {
      uint64_t v17 = v13 + 1;
    }
    if (v16) {
      id v14 = v13;
    }
    id v13 = (void *)*v17;
  }
  while (*v17);
  if (v14 != (void *)((char *)a4 + 8) && v14[4] <= (unint64_t)self)
  {
    PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::GetNode((uint64_t)a4, self, (HGNode **)&lpsrc);
    if (lpsrc.time.value)
    {
      v115 = v114;
      if (v114) {
        (*(void (**)(HGInternalCompNode *))(*(void *)v114 + 16))(v114);
      }
    }
    else
    {
      v115 = 0;
    }
    v131 = v115;
    if (&v175 != (uint64_t **)((char *)v115 + 408)) {
      std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<int,__CVBuffer *>,std::__tree_node<std::__value_type<int,__CVBuffer *>,void *> *,long>>(&v175, *((void **)v115 + 51), (void *)v115 + 52);
    }
    if (lpsrc.time.value) {
      (*(void (**)(int64_t))(*(void *)lpsrc.time.value + 24))(lpsrc.time.value);
    }
  }
  else
  {
LABEL_16:
    *(double *)&v131 = COERCE_DOUBLE(HGObject::operator new(0x260uLL));
    HGInternalCompNode::HGInternalCompNode(v131);
  }
  v126 = [[PVCompositeDelegateContext alloc] initWithNode:self];
  uint64_t v18 = [(PVInstructionGraphSourceCompositeNode *)self colorSpace];
  if (!v18)
  {
    uint64_t v18 = PVInstructionGraphContext::WorkingColorSpace(*m_Obj);
  }
  v132 = (void *)v18;
  -[PVCompositeDelegateContext setRenderColorSpace:](v126, "setRenderColorSpace:");
  id v136 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  HGRef<HGNode> v19 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v171 objects:v179 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v172;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v172 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void *)(*((void *)&v171 + 1) + 8 * v22);
        uint64_t v24 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
        v25 = [v24 objectForKeyedSubscript:v23];

        if ([v25 nodeType] == 1)
        {
          uint64_t v26 = [v25 imageSeqDelegate];
          v27 = [v25 imageURL];
          long long v169 = *(_OWORD *)&a3->var0;
          int64_t var3 = a3->var3;
          uint64_t v28 = [v26 imageForURL:v27 time:&v169];

          v29 = +[PVImageBuffer imageWithCGImage:v28];
          [v136 setObject:v29 forKey:v23];
LABEL_28:

          goto LABEL_29;
        }
        if ([v25 nodeType] == 2)
        {
          v29 = [v25 imageBuffer];
          [v136 setObject:v29 forKey:v23];
          goto LABEL_28;
        }
        if ([v25 nodeType] == 3)
        {
          if ([v25 trackID])
          {
            int v30 = [v25 trackID];
            v31 = v176[0];
            if (v176[0])
            {
              v32 = v176;
              do
              {
                v33 = v31;
                v34 = v32;
                int v35 = *((_DWORD *)v31 + 8);
                if (v35 >= v30) {
                  v32 = (void **)v31;
                }
                else {
                  ++v31;
                }
                v31 = (void *)*v31;
              }
              while (v31);
              if (v32 != v176)
              {
                if (v35 < v30) {
                  v33 = v34;
                }
                if (v30 >= *((_DWORD *)v33 + 8))
                {
                  v29 = +[PVImageBuffer imageWithCVPixelBuffer:v32[5]];
                  [v136 setObject:v29 forKey:v23];
                  goto LABEL_28;
                }
              }
            }
          }
        }
LABEL_29:

        ++v22;
      }
      while (v22 != v20);
      uint64_t v36 = [v19 countByEnumeratingWithState:&v171 objects:v179 count:16];
      uint64_t v20 = v36;
    }
    while (v36);
  }

  v37 = [(PVInstructionGraphSourceCompositeNode *)self renderDelegate];
  if (v37
    && (BOOL v38 = [(PVInstructionGraphSourceCompositeNode *)self canPreprocess], v37, v38))
  {
    v39 = [(PVInstructionGraphSourceCompositeNode *)self renderDelegate];
    long long v167 = *(_OWORD *)&a3->var0;
    int64_t v168 = a3->var3;
    v40 = [(PVInstructionGraphSourceCompositeNode *)self userContext];
    uint64_t v41 = [v39 preprocessWithInputs:v136 time:&v167 userContext:v40 compositeContext:v126];

    v42 = (void *)v41;
    [(PVCompositeDelegateContext *)v126 setPreprocessData:v41];
  }
  else
  {
    v42 = 0;
  }
  v124 = v42;
  [(PVInstructionGraphSourceCompositeNode *)self outputSize];
  double v44 = v43;
  [(PVInstructionGraphSourceCompositeNode *)self outputSize];
  uint64_t v46 = HGRectMake4i(0, 0, (int)v44, (int)v45);
  uint64_t v48 = v47;
  v49 = [(PVInstructionGraphSourceCompositeNode *)self renderDelegate];
  if (!v49 || (BOOL v50 = [(PVInstructionGraphSourceCompositeNode *)self canRender], v49, !v50))
  {
    v113 = (HGNode *)HGObject::operator new(0x1A0uLL);
    HGNode::HGNode(v113);
    *v125 = v113;
    goto LABEL_211;
  }
  v51 = [(PVInstructionGraphSourceCompositeNode *)self renderDelegate];
  objc_storeStrong((id *)v131 + 72, v51);
  *((void *)v131 + 54) = v46;
  *((void *)v131 + 55) = v48;

  v52 = [(PVInstructionGraphSourceCompositeNode *)self metadata];
  objc_storeStrong((id *)v131 + 74, v52);

  v53 = [(PVInstructionGraphSourceCompositeNode *)self userContext];
  HGInternalCompNode::SetContexts(v131, v53, v126);

  long long v54 = *(_OWORD *)&a3->var0;
  *((void *)v131 + 58) = a3->var3;
  *((_OWORD *)v131 + 28) = v54;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  id obj = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
  uint64_t v55 = [obj countByEnumeratingWithState:&v163 objects:v178 count:16];
  if (!v55)
  {

LABEL_171:
    CGFloat v112 = *(double *)&v131;
    (*(void (**)(HGInternalCompNode *))(*(void *)v131 + 16))(v131);
    goto LABEL_172;
  }
  v129 = 0;
  uint64_t v134 = *(void *)v164;
  do
  {
    uint64_t v56 = v55;
    for (uint64_t i = 0; i != v56; ++i)
    {
      if (*(void *)v164 != v134) {
        objc_enumerationMutation(obj);
      }
      v58 = *(void **)(*((void *)&v163 + 1) + 8 * i);
      v59 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
      v60 = [v59 objectForKeyedSubscript:v58];

      if ([v60 nodeType] == 1
        || [v60 nodeType] == 2
        || [v60 nodeType] == 3)
      {
        v61 = [v136 objectForKeyedSubscript:v58];
        if (v61)
        {
          v62 = [v60 colorSpace];
          if (!v62)
          {
            v62 = PVInstructionGraphContext::WorkingColorSpace(*m_Obj);
          }
          if ([v62 isEqual:v132]) {
            goto LABEL_116;
          }
          v63 = *m_Obj;
          if (*m_Obj) {
            (*(void (**)(PVInstructionGraphContext *))(*(void *)v63 + 16))(*m_Obj);
          }
          [v60 outputSize];
          if (v65 != v8 || v64 != v10)
          {
            PVRenderJob::GetDelegate((PVRenderJob *)*m_Obj);
            v66 = (PVVideoCompositingContext *)objc_claimAutoreleasedReturnValue();
            [v60 outputSize];
            CGFloat v68 = v67;
            CGFloat v70 = v69;
            char v71 = (*(uint64_t (**)(void))(*(void *)*m_Obj + 64))();
            (*(void (**)(CGAffineTransform *__return_ptr))(*(void *)*m_Obj + 72))(&v150);
            v72 = (PVRendererInstructionGraphContext *)HGObject::operator new(0xA8uLL);
            *(_OWORD *)&lpsrc.time.int64_t value = *(_OWORD *)&v150.a;
            lpsrc.time.epoch = *(void *)&v150.c;
            v184.double width = v68;
            v184.double height = v70;
            PVRendererInstructionGraphContext::PVRendererInstructionGraphContext(v72, v66, v184, v71, (CMTime *)&lpsrc);
            if (v63 == (PVInstructionGraphContext *)v72)
            {
              if (v63) {
                (*(void (**)(PVInstructionGraphContext *))(*(void *)v63 + 24))(v63);
              }
            }
            else
            {
              if (v63) {
                (*(void (**)(PVInstructionGraphContext *))(*(void *)v63 + 24))(v63);
              }
              v63 = (PVInstructionGraphContext *)v72;
            }
          }
          if ([(PVImageBuffer *)v61 canCreateCVPixelBuffer])
          {
            long long v161 = *(_OWORD *)&a3->var0;
            int64_t v162 = a3->var3;
            v160 = v63;
            if (v63) {
              (*(void (**)(PVInstructionGraphContext *))(*(void *)v63 + 16))(v63);
            }
            [(PVInstructionGraphSourceCompositeNode *)self conformInputImage:v61 colorSpace:v62 renderer:a5 currentTime:&v161 igContext:&v160];
            CGFloat a = *(double *)&lpsrc.time.value;
            if (lpsrc.time.value) {
              lpsrc.time.int64_t value = 0;
            }
            if (v160) {
              (*(void (**)(PVInstructionGraphContext *))(*(void *)v160 + 24))(v160);
            }
            if (a != 0.0)
            {
              CGFloat v159 = a;
              (*(void (**)(CGFloat))(**(void **)&a + 16))(COERCE_CGFLOAT(*(void *)&a));
              v85 = PVInstructionGraphContext::WorkingColorSpace(v63);
              int v86 = PVInstructionGraphContext::WorkingColorSpaceConformIntent(v63);
              ColorConformInput((HGColorConform **)&v159, v85, v132, v86, 0, (HGColorConform **)&lpsrc);
              v87 = *(void (**)(void))(**(void **)&a + 24);
              if (*(void *)&a == lpsrc.time.value)
              {
                v87(*(void *)&a);
              }
              else
              {
                v87(*(void *)&a);
                CGFloat a = *(double *)&lpsrc.time.value;
                lpsrc.time.int64_t value = 0;
              }

              if (v159 != 0.0) {
                (*(void (**)(CGFloat))(**(void **)&v159 + 24))(COERCE_CGFLOAT(*(void *)&v159));
              }
            }
          }
          else if ([(PVImageBuffer *)v61 canCreateHGBitmap])
          {
            [(PVImageBuffer *)v61 hgBitmapWithColorSpace:v62];
            CGFloat a = *(double *)&lpsrc.time.value;
            if (lpsrc.time.value)
            {
              v88 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
              HGBitmapLoader::HGBitmapLoader(v88, *(HGBitmap **)&a);
              v158 = v88;
              if (v88) {
                (*(void (**)(HGBitmapLoader *))(*(void *)v88 + 16))(v88);
              }
              int v89 = PVInstructionGraphContext::WorkingColorSpaceConformIntent(v63);
              ColorConformInput(&v158, v62, v132, v89, 0, (HGColorConform **)&v150);
              CGFloat a = v150.a;
              if (*(void *)&v150.a) {
                v150.CGFloat a = 0.0;
              }
              if (v158) {
                (*(void (**)(HGColorConform *))(*(void *)v158 + 24))(v158);
              }
              if (v88) {
                (*(void (**)(HGBitmapLoader *))(*(void *)v88 + 24))(v88);
              }
              if (lpsrc.time.value) {
                (*(void (**)(int64_t))(*(void *)lpsrc.time.value + 24))(lpsrc.time.value);
              }
            }
          }
          else
          {
            CGFloat a = 0.0;
          }
          if (v63) {
            (*(void (**)(PVInstructionGraphContext *))(*(void *)v63 + 24))(v63);
          }
          if (a == 0.0)
          {
LABEL_116:
            HGInternalCompNode::SetImageInput((uint64_t **)v131, [v58 intValue], v61);
          }
          else
          {
            [(PVImageBuffer *)v61 size];
            double v91 = v90;
            [(PVImageBuffer *)v61 size];
            uint64_t v93 = HGRectMake4i(0, 0, (int)v91, (int)v92);
            uint64_t v95 = v94;
            unsigned int v96 = [v58 intValue];
            *(void *)&v182.var0 = v93;
            *(void *)&v182.var2 = v95;
            HGInternalCompNode::SetGraphInput(v131, v96, *(HGNode **)&a, v182);
            (*(void (**)(CGFloat))(**(void **)&a + 24))(COERCE_CGFLOAT(*(void *)&a));
          }
        }
        else if ([v60 nodeType] == 3)
        {
          int v73 = [v58 intValue];
          LODWORD(v150.a) = [v60 trackID];
          lpsrc.time.int64_t value = (int64_t)&v150;
          *((_DWORD *)std::__tree<std::__value_type<int,unsigned int>,std::__map_value_compare<int,std::__value_type<int,unsigned int>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)v131 + 66, (int *)&v150, (uint64_t)&std::piecewise_construct, (unsigned int **)&lpsrc)+ 8) = v73;
        }
      }
      else if ([v60 nodeType] == 4 || objc_msgSend(v60, "nodeType") == 5)
      {
        v74 = *m_Obj;
        if (*m_Obj) {
          (*(void (**)(PVInstructionGraphContext *))(*(void *)v74 + 16))(*m_Obj);
        }
        [v60 outputSize];
        if (v76 != v8 || v75 != v10)
        {
          PVRenderJob::GetDelegate((PVRenderJob *)*m_Obj);
          v77 = (PVVideoCompositingContext *)objc_claimAutoreleasedReturnValue();
          [v60 outputSize];
          CGFloat v79 = v78;
          CGFloat v81 = v80;
          char v82 = (*(uint64_t (**)(void))(*(void *)*m_Obj + 64))();
          (*(void (**)(CGAffineTransform *__return_ptr))(*(void *)*m_Obj + 72))(&v150);
          v83 = (PVRendererInstructionGraphContext *)HGObject::operator new(0xA8uLL);
          *(_OWORD *)&lpsrc.time.int64_t value = *(_OWORD *)&v150.a;
          lpsrc.time.epoch = *(void *)&v150.c;
          v185.double width = v79;
          v185.double height = v81;
          PVRendererInstructionGraphContext::PVRendererInstructionGraphContext(v83, v77, v185, v82, (CMTime *)&lpsrc);
          if (v74 == (PVInstructionGraphContext *)v83)
          {
            if (v74) {
              (*(void (**)(PVInstructionGraphContext *))(*(void *)v74 + 24))(v74);
            }
          }
          else
          {
            if (v74) {
              (*(void (**)(PVInstructionGraphContext *))(*(void *)v74 + 24))(v74);
            }
            v74 = (PVInstructionGraphContext *)v83;
          }
        }
        v97 = [v60 graphNode];
        long long v156 = *(_OWORD *)&a3->var0;
        int64_t v157 = a3->var3;
        v155 = v74;
        if (v74) {
          (*(void (**)(PVInstructionGraphContext *))(*(void *)v74 + 16))(v74);
        }
        if (v97) {
          [v97 hgNodeForTime:&v156 trackInputs:a4 renderer:a5 igContext:&v155];
        }
        else {
          lpsrc.time.int64_t value = 0;
        }
        if (v155) {
          (*(void (**)(PVInstructionGraphContext *))(*(void *)v155 + 24))(v155);
        }

        [v60 outputSize];
        double v99 = v98;
        [v60 outputSize];
        uint64_t v101 = HGRectMake4i(0, 0, (int)v99, (int)v100);
        uint64_t v103 = v102;
        int64_t value = lpsrc.time.value;
        if (lpsrc.time.value) {
          (*(void (**)(int64_t))(*(void *)lpsrc.time.value + 16))(lpsrc.time.value);
        }
        -[PVInstructionGraphSourceCompositeNode conformNode:toSize:](self, "conformNode:toSize:", &value, v101, v103);
        CGFloat v104 = v150.a;
        if (v129 == *(HGNode **)&v150.a)
        {
          if (v129) {
            (*(void (**)(void))(*(void *)v129 + 24))();
          }
          else {
            v129 = 0;
          }
        }
        else
        {
          if (v129)
          {
            (*(void (**)(void))(*(void *)v129 + 24))();
            CGFloat v104 = v150.a;
          }
          v129 = *(HGNode **)&v104;
          v150.CGFloat a = 0.0;
        }
        if (value) {
          (*(void (**)(int64_t))(*(void *)value + 24))(value);
        }
        v105 = PVInstructionGraphContext::WorkingColorSpace(v74);
        v106 = [v60 colorSpace];
        BOOL v107 = v106 == 0;

        if (!v107)
        {
          uint64_t v108 = [v60 colorSpace];

          v105 = (void *)v108;
        }
        if (([v105 isEqual:v132] & 1) == 0)
        {
          v153 = v129;
          if (v129) {
            (*(void (**)(HGNode *))(*(void *)v129 + 16))(v129);
          }
          int v109 = PVInstructionGraphContext::WorkingColorSpaceConformIntent(v74);
          ColorConformInput((HGColorConform **)&v153, v105, v132, v109, 0, (HGColorConform **)&v150);
          CGFloat v110 = v150.a;
          if (v129 == *(HGNode **)&v150.a)
          {
            if (v129) {
              (*(void (**)(void))(*(void *)v129 + 24))();
            }
            else {
              v129 = 0;
            }
          }
          else
          {
            if (v129)
            {
              (*(void (**)(void))(*(void *)v129 + 24))();
              CGFloat v110 = v150.a;
            }
            v129 = *(HGNode **)&v110;
            v150.CGFloat a = 0.0;
          }
          if (v153) {
            (*(void (**)(HGNode *))(*(void *)v153 + 24))(v153);
          }
        }
        unsigned int v111 = [v58 intValue];
        *(void *)&v183.var0 = v101;
        *(void *)&v183.var2 = v103;
        HGInternalCompNode::SetGraphInput(v131, v111, v129, v183);

        if (lpsrc.time.value) {
          (*(void (**)(int64_t))(*(void *)lpsrc.time.value + 24))(lpsrc.time.value);
        }
        if (v74) {
          (*(void (**)(PVInstructionGraphContext *))(*(void *)v74 + 24))(v74);
        }
      }
    }
    uint64_t v55 = [obj countByEnumeratingWithState:&v163 objects:v178 count:16];
  }
  while (v55);

  CGFloat v112 = *(double *)&v131;
  if (v129 == (HGNode *)v131) {
    goto LABEL_172;
  }
  if (v129) {
    (*(void (**)(HGNode *))(*(void *)v129 + 24))(v129);
  }
  if (*(double *)&v131 != 0.0) {
    goto LABEL_171;
  }
  CGFloat v112 = 0.0;
LABEL_172:
  v116 = PVInstructionGraphContext::WorkingColorSpace(*m_Obj);
  char v117 = [v132 isEqual:v116];

  if ((v117 & 1) == 0)
  {
    CGFloat v152 = v112;
    if (v112 != 0.0) {
      (*(void (**)(CGFloat))(**(void **)&v112 + 16))(COERCE_CGFLOAT(*(void *)&v112));
    }
    v118 = PVInstructionGraphContext::WorkingColorSpace(*m_Obj);
    int v119 = PVInstructionGraphContext::WorkingColorSpaceConformIntent(*m_Obj);
    ColorConformInput((HGColorConform **)&v152, v132, v118, v119, 0, (HGColorConform **)&lpsrc);
    if (*(void *)&v112 == lpsrc.time.value)
    {
      if (v112 != 0.0) {
        (*(void (**)(CGFloat))(**(void **)&v112 + 24))(COERCE_CGFLOAT(*(void *)&v112));
      }
    }
    else
    {
      if (v112 != 0.0) {
        (*(void (**)(CGFloat))(**(void **)&v112 + 24))(COERCE_CGFLOAT(*(void *)&v112));
      }
      CGFloat v112 = *(double *)&lpsrc.time.value;
      lpsrc.time.int64_t value = 0;
    }

    if (v152 != 0.0) {
      (*(void (**)(CGFloat))(**(void **)&v152 + 24))(COERCE_CGFLOAT(*(void *)&v152));
    }
  }
  CGFloat v151 = v112;
  if (v112 != 0.0) {
    (*(void (**)(CGFloat))(**(void **)&v112 + 16))(COERCE_CGFLOAT(*(void *)&v112));
  }
  [(PVInstructionGraphSourceNode *)self applyWrapModeToInput:&v151];
  if (*(void *)&v112 == lpsrc.time.value)
  {
    if (v112 != 0.0) {
      (*(void (**)(CGFloat))(**(void **)&v112 + 24))(COERCE_CGFLOAT(*(void *)&v112));
    }
  }
  else
  {
    if (v112 != 0.0) {
      (*(void (**)(CGFloat))(**(void **)&v112 + 24))(COERCE_CGFLOAT(*(void *)&v112));
    }
    CGFloat v112 = *(double *)&lpsrc.time.value;
    lpsrc.time.int64_t value = 0;
  }
  if (v151 != 0.0) {
    (*(void (**)(CGFloat))(**(void **)&v151 + 24))(COERCE_CGFLOAT(*(void *)&v151));
  }
  memset(&v150, 0, sizeof(v150));
  CGAffineTransformMakeScale(&t1, v11, v11);
  [(PVInstructionGraphSourceNode *)self transform];
  CGAffineTransformConcat(&v150, &t1, &t2);
  v120 = [(PVInstructionGraphSourceNode *)self transformAnimation];
  long long v145 = *(_OWORD *)&a3->var0;
  int64_t v146 = a3->var3;
  BOOL v121 = +[PVTransformAnimation getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:](PVTransformAnimation, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v120, &v145, [(PVInstructionGraphSourceNode *)self transformAnimationContentMode], 0, &lpsrc, v8, v10);

  if (v121)
  {
    v186.x = v8 * 0.5;
    v186.y = v10 * 0.5;
    memset(&v144, 0, sizeof(v144));
    PVTransformAnimationInfo v143 = lpsrc;
    CGAffineTransformFromPointWithPVAnimInfo(&v143, v186, (uint64_t)&v144);
    CGAffineTransform v141 = v150;
    CGAffineTransform v140 = v144;
    CGAffineTransformConcat(&v142, &v141, &v140);
    CGAffineTransform v150 = v142;
  }
  CGFloat v139 = v112;
  if (v112 != 0.0) {
    (*(void (**)(CGFloat))(**(void **)&v112 + 16))(COERCE_CGFLOAT(*(void *)&v112));
  }
  CGAffineTransform v138 = v150;
  int v122 = (*(uint64_t (**)(void))(*(void *)*m_Obj + 64))();
  HGXFormForCGAffineTransform((HGXForm **)&v139, &v138, v122, (HGXForm **)&v144);
  if (*(void *)&v112 == *(void *)&v144.a)
  {
    if (v112 != 0.0) {
      (*(void (**)(CGFloat))(**(void **)&v112 + 24))(COERCE_CGFLOAT(*(void *)&v112));
    }
  }
  else
  {
    if (v112 != 0.0) {
      (*(void (**)(CGFloat))(**(void **)&v112 + 24))(COERCE_CGFLOAT(*(void *)&v112));
    }
    CGFloat v112 = v144.a;
    v144.CGFloat a = 0.0;
  }
  if (v139 != 0.0) {
    (*(void (**)(CGFloat))(**(void **)&v139 + 24))(COERCE_CGFLOAT(*(void *)&v139));
  }
  *(CGFloat *)v125 = v112;
LABEL_211:

  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v175, v176[0]);
  v123.var0 = (HGNode *)v131;
  if (*(double *)&v131 != 0.0) {
    return (HGRef<HGNode>)(*(uint64_t (**)(HGInternalCompNode *))(*(void *)v131 + 24))(v131);
  }
  return v123;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v6 = v4;
  id v7 = a3;
  *(void *)uint64_t v6 = 0;
  *(void *)(v6 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v6 + 16) = _Q0;
  [(PVInstructionGraphSourceCompositeNode *)self outputSize];
  double v28 = v14;
  double v29 = v13;
  unint64_t v15 = [(PVInstructionGraphSourceCompositeNode *)self imageBuffer];
  if ([v15 canCreateCVPixelBuffer])
  {
  }
  else
  {
    BOOL v16 = [(PVInstructionGraphSourceCompositeNode *)self imageBuffer];
    char v17 = [v16 canCreateHGBitmap];

    if ((v17 & 1) == 0) {
      goto LABEL_10;
    }
  }
  if (v29 > 0.0 && v28 > 0.0)
  {
    [(PVInstructionGraphSourceNode *)self transform];
    float64x2_t v18 = vaddq_f64(vmulq_n_f64(v31, v29), vmulq_n_f64(v32, v28));
    double v19 = v18.f64[1];
    float64x2_t v30 = v18;
    if (v18.f64[1] >= v18.f64[0])
    {
      [v7 outputSize];
      double v22 = v19 / v23;
      float64x2_t v20 = v30;
    }
    else
    {
      [v7 outputSize];
      float64x2_t v20 = v30;
      double v22 = v30.f64[0] / v21;
    }
    *(float64x2_t *)(v6 + 16) = vdivq_f64(v20, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22, 0));
  }
LABEL_10:

  result.int64_t var3 = v27;
  result.var2 = v26;
  result.var1 = v25;
  result.var0 = v24;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
  id v19 = a4;
  [(PVInstructionGraphSourceCompositeNode *)self outputSize];
  double v8 = v7;
  double v10 = v9;
  int v11 = [v19 conformToInputAspect];
  if (v10 >= v8) {
    int v12 = v11;
  }
  else {
    int v12 = 0;
  }
  if (v12 == 1)
  {
    [v19 outputSize];
    double v14 = v10 / v13;
  }
  else
  {
    [v19 outputSize];
    double v14 = v8 / v15;
  }
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
  float v16 = v14;
  float64x2_t v17 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, v16, (float)-v16, 1.0);
  v17.f64[0] = v8 * 0.5;
  PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)retstr, v17, v10 * 0.5, 0.0);

  return result;
}

- (id)getAllSourceNodes
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([(PVInstructionGraphSourceCompositeNode *)self nodeType] == 5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v4 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          double v9 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
          double v10 = [v9 objectForKeyedSubscript:v8];

          int v11 = [v10 getAllSourceNodes];
          int v12 = [v11 allObjects];
          [v3 addObjectsFromArray:v12];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }

    [v3 addObject:self];
  }
  else if ([(PVInstructionGraphSourceCompositeNode *)self nodeType] == 4)
  {
    double v13 = [(PVInstructionGraphSourceCompositeNode *)self graphNode];
    double v14 = [v13 getAllSourceNodes];
    double v15 = [v14 allObjects];
    [v3 addObjectsFromArray:v15];
  }

  return v3;
}

- (id)requiredSourceTrackIDs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        double v9 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
        double v10 = [v9 objectForKeyedSubscript:v8];

        int v11 = [v10 requiredSourceTrackIDs];
        int v12 = [v11 allObjects];
        [v3 addObjectsFromArray:v12];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  if ([(PVInstructionGraphSourceCompositeNode *)self trackID])
  {
    double v13 = objc_msgSend(NSNumber, "numberWithInt:", -[PVInstructionGraphSourceCompositeNode trackID](self, "trackID"));
    [v3 addObject:v13];
  }

  return v3;
}

- (HGRef<HGNode>)nodeForCompositeTrackMap:(const void *)a3
{
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t **)HGObject::operator new(0x260uLL);
  HGInternalCompNode::HGInternalCompNode((HGInternalCompNode *)v6);
  double v7 = v6 + 51;
  if (v6 + 51 != a3) {
    double v7 = std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<int,__CVBuffer *>,std::__tree_node<std::__value_type<int,__CVBuffer *>,void *> *,long>>(v7, *(void **)a3, (void *)a3 + 1);
  }
  *uint64_t v5 = v6;
  return (HGRef<HGNode>)v7;
}

- (id)instructionGraphNodeDescription
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)PVInstructionGraphSourceCompositeNode;
  v2 = [(PVInstructionGraphSourceNode *)&v31 instructionGraphNodeDescription];
  id v25 = (id)[v2 mutableCopy];

  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  [v25 setObject:v4 forKeyedSubscript:@"class"];

  objc_msgSend(v25, "setObject:forKeyedSubscript:", PVCompositeNodeTypeLabel(PVCompositeNodeType)::sNodeTypeLabels[-[PVInstructionGraphSourceCompositeNode nodeType](self, "nodeType")], @"type");
  switch([(PVInstructionGraphSourceCompositeNode *)self nodeType])
  {
    case 1:
      uint64_t v5 = [(PVInstructionGraphSourceCompositeNode *)self imageURL];
      uint64_t v6 = [v5 absoluteString];
      [v25 setObject:v6 forKeyedSubscript:@"imageURL"];
      goto LABEL_7;
    case 2:
      double v7 = NSString;
      uint64_t v5 = [(PVInstructionGraphSourceCompositeNode *)self imageBuffer];
      [v5 size];
      uint64_t v9 = v8;
      uint64_t v6 = [(PVInstructionGraphSourceCompositeNode *)self imageBuffer];
      [v6 size];
      int v11 = objc_msgSend(v7, "stringWithFormat:", @"[%f x %f]", v9, v10);
      [v25 setObject:v11 forKeyedSubscript:@"imageBufferSize"];

      goto LABEL_7;
    case 3:
      uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[PVInstructionGraphSourceCompositeNode trackID](self, "trackID"));
      [v25 setObject:v5 forKeyedSubscript:@"trackID"];
      goto LABEL_8;
    case 4:
      uint64_t v5 = [(PVInstructionGraphSourceCompositeNode *)self graphNode];
      uint64_t v6 = [v5 instructionGraphNodeDescription];
      [v25 setObject:v6 forKeyedSubscript:@"graphNode"];
      goto LABEL_7;
    case 5:
      int v12 = NSString;
      uint64_t v5 = [(PVInstructionGraphSourceCompositeNode *)self renderDelegate];
      uint64_t v6 = [v12 stringWithFormat:@"%@", v5];
      [v25 setObject:v6 forKeyedSubscript:@"delegate"];
LABEL_7:

LABEL_8:
      break;
    default:
      break;
  }
  double v13 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v14 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v19 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
        uint64_t v20 = [v19 objectForKeyedSubscript:v18];

        double v21 = [v18 stringValue];
        float64x2_t v32 = v21;
        uint64_t v22 = [v20 instructionGraphNodeDescription];
        v33 = v22;
        double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];

        [v13 addObject:v23];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v15);
  }

  if ([v13 count]) {
    [v25 setObject:v13 forKeyedSubscript:@"inputs"];
  }

  return v25;
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  uint64_t v4 = *(void *)a3.m_Obj;
  uint64_t v20 = v4;
  if (v4) {
    (*(void (**)(uint64_t, SEL))(*(void *)v4 + 16))(v4, a2);
  }
  v19.receiver = self;
  v19.super_class = (Class)PVInstructionGraphSourceCompositeNode;
  uint64_t v5 = [(PVInstructionGraphNode *)&v19 dotTreeLabel:&v20];
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 24))(v20);
  }
  uint64_t v6 = [v5 stringByAppendingFormat:@" [%@]", PVCompositeNodeTypeLabel(PVCompositeNodeType)::sNodeTypeLabels[-[PVInstructionGraphSourceCompositeNode nodeType](self, "nodeType")]];

  double v7 = [v6 stringByAppendingFormat:@" [CS: %@]", *(void *)&self->_trackID];

  switch([(PVInstructionGraphSourceCompositeNode *)self nodeType])
  {
    case 1:
      uint64_t v8 = [(PVInstructionGraphSourceCompositeNode *)self imageURL];
      uint64_t v9 = [v8 absoluteString];
      uint64_t v10 = [v7 stringByAppendingFormat:@" [%@]", v9];
      goto LABEL_8;
    case 2:
      uint64_t v8 = [(PVInstructionGraphSourceCompositeNode *)self imageBuffer];
      [v8 size];
      uint64_t v12 = v11;
      uint64_t v9 = [(PVInstructionGraphSourceCompositeNode *)self imageBuffer];
      [v9 size];
      uint64_t v10 = objc_msgSend(v7, "stringByAppendingFormat:", @" [%f x %f]", v12, v13);
LABEL_8:
      uint64_t v14 = v10;

      double v7 = v9;
      goto LABEL_11;
    case 3:
      uint64_t v14 = objc_msgSend(v7, "stringByAppendingFormat:", @" [track: %d]", -[PVInstructionGraphSourceCompositeNode trackID](self, "trackID"));
      goto LABEL_12;
    case 5:
      uint64_t v15 = NSString;
      uint64_t v16 = [(PVInstructionGraphSourceCompositeNode *)self renderDelegate];
      long long v17 = [v15 stringWithFormat:@"\n[%@]", v16];

      uint64_t v8 = [v17 stringByReplacingOccurrencesOfString:@"\" withString:@"\\\"];

      uint64_t v14 = [v7 stringByAppendingString:v8];
LABEL_11:

      double v7 = v8;
LABEL_12:

      double v7 = (void *)v14;
      break;
    default:
      break;
  }

  return v7;
}

- (void)addDotTreeLinks:(HGRef<PVInstructionGraphContext>)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v17 = (uint64_t *)PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a3.m_Obj);
  if (HGDotGraph::on((HGDotGraph *)v17))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
    uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v4)
    {
      uint64_t v16 = *(void *)v24;
      uint64_t v14 = *(void *)(MEMORY[0x1E4FBA408] + 64);
      uint64_t v15 = *MEMORY[0x1E4FBA408];
      uint64_t v13 = *(void *)(MEMORY[0x1E4FBA408] + 72);
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          double v7 = [(PVInstructionGraphSourceCompositeNode *)self inputMap];
          uint64_t v8 = [v7 objectForKeyedSubscript:v6];

          std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v20);
          [v6 intValue];
          std::ostream::operator<<();
          if ([v8 nodeType] == 4)
          {
            uint64_t v9 = [v8 graphNode];
            std::stringbuf::str();
            if (v19 >= 0) {
              uint64_t v10 = __p;
            }
            else {
              uint64_t v10 = (void **)__p[0];
            }
            HGDotGraph::link(v17, (unint64_t)v9, (unint64_t)self, (const char *)v10, 0);
            if (v19 < 0) {
              operator delete(__p[0]);
            }
          }
          else
          {
            std::stringbuf::str();
            if (v19 >= 0) {
              uint64_t v11 = __p;
            }
            else {
              uint64_t v11 = (void **)__p[0];
            }
            HGDotGraph::link(v17, (unint64_t)v8, (unint64_t)self, (const char *)v11, 0);
            if (v19 < 0) {
              operator delete(__p[0]);
            }
          }
          v20[0] = v15;
          *(void *)((char *)v20 + *(void *)(v15 - 24)) = v14;
          v20[2] = v13;
          v20[3] = MEMORY[0x1E4FBA470] + 16;
          if (v21 < 0) {
            operator delete((void *)v20[11]);
          }
          std::streambuf::~streambuf();
          std::iostream::~basic_iostream();
          MEMORY[0x1BA9BFAB0](&v22);
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v4);
    }
  }
}

- (PVColorSpace)colorSpace
{
  return *(PVColorSpace **)&self->_trackID;
}

- (void)setColorSpace:(id)a3
{
}

- (int)nodeType
{
  return HIDWORD(self->_renderManager.m_Obj);
}

- (void)setNodeType:(int)a3
{
  HIDWORD(self->_renderManager.m_Obj) = a3;
}

- (int)trackID
{
  return *(_DWORD *)&self->_canPreprocess;
}

- (void)setTrackID:(int)a3
{
  *(_DWORD *)&self->_canPreprocess = a3;
}

- (NSURL)imageURL
{
  return (NSURL *)self->_colorSpace;
}

- (void)setImageURL:(id)a3
{
}

- (NSString)imageKey
{
  return (NSString *)&self->_imageURL->super.isa;
}

- (void)setImageKey:(id)a3
{
}

- (PVImageBuffer)imageBuffer
{
  return (PVImageBuffer *)self->_imageKey;
}

- (void)setImageBuffer:(id)a3
{
}

- (CGSize)outputSize
{
  delegateEffect = self->_delegateEffect;
  double width = self->_outputSize.width;
  result.double height = width;
  result.double width = *(double *)&delegateEffect;
  return result;
}

- (void)setOutputSize:(CGSize)a3
{
  *(CGSize *)&self->_delegateEffect = a3;
}

- (unsigned)outputFormat
{
  return self->_nodeType;
}

- (void)setOutputFormat:(unsigned int)a3
{
  self->_nodeType = a3;
}

- (PVInstructionGraphNode)graphNode
{
  return (PVInstructionGraphNode *)self->_imageBuffer;
}

- (void)setGraphNode:(id)a3
{
}

- (NSDictionary)inputMap
{
  return (NSDictionary *)self->_graphNode;
}

- (void)setInputMap:(id)a3
{
}

- (PVImageSeqDelegate)imageSeqDelegate
{
  return (PVImageSeqDelegate *)self->_inputMap;
}

- (void)setImageSeqDelegate:(id)a3
{
}

- (PVCompositeDelegate)renderDelegate
{
  return self->_imageSeqDelegate;
}

- (void)setRenderDelegate:(id)a3
{
}

- (NSObject)metadata
{
  return self->_renderDelegate;
}

- (void)setMetadata:(id)a3
{
}

- (id)userContext
{
  return self->_metadata;
}

- (void)setUserContext:(id)a3
{
}

- (BOOL)canPreprocess
{
  return (BOOL)self->_renderManager.m_Obj;
}

- (void)setCanPreprocess:(BOOL)a3
{
  LOBYTE(self->_renderManager.m_Obj) = a3;
}

- (BOOL)canRender
{
  return BYTE1(self->_renderManager.m_Obj);
}

- (void)setCanRender:(BOOL)a3
{
  BYTE1(self->_renderManager.m_Obj) = a3;
}

- (PVCompositeDelegateEffect)delegateEffect
{
  return (PVCompositeDelegateEffect *)self->_userContext;
}

- (void)setDelegateEffect:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userContext, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_renderDelegate, 0);
  objc_storeStrong((id *)&self->_imageSeqDelegate, 0);
  objc_storeStrong((id *)&self->_inputMap, 0);
  objc_storeStrong((id *)&self->_graphNode, 0);
  objc_storeStrong((id *)&self->_imageBuffer, 0);
  objc_storeStrong((id *)&self->_imageKey, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_trackID, 0);
  CGFloat ty = self->super._transform.ty;
  if (ty != 0.0) {
    (*(void (**)(CGFloat))(**(void **)&ty + 24))(COERCE_CGFLOAT(*(void *)&ty));
  }
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  return self;
}

@end
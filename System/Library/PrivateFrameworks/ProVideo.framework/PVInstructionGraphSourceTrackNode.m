@interface PVInstructionGraphSourceTrackNode
+ (id)newSourceTrackNode:(int)a3 animation:(id)a4 fillMode:(int)a5 clipNaturalSize:(CGSize)a6;
+ (id)newSourceTrackNode:(int)a3 transform:(CGAffineTransform *)a4 cropRect:(CGRect)a5 clipNaturalSize:(CGSize)a6;
+ (id)newSourceTrackNodeWithStabilizationDelegate:(id)a3 userContext:(id)a4 trackID:(int)a5 dataTrackID:(int)a6 transform:(CGAffineTransform *)a7 clipNaturalSize:(CGSize)a8;
+ (id)newSourceTrackNodeWithStabilizationDelegate:(id)a3 userContext:(id)a4 trackID:(int)a5 transform:(CGAffineTransform *)a6 clipNaturalSize:(CGSize)a7;
- (BOOL)isPassthru;
- (BOOL)isPortrait;
- (BOOL)stabilizationDelegateRespondsToDidStabilize;
- (CGRect)cropRect;
- (CGSize)clipNaturalSize;
- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4;
- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4;
- (PVInstructionGraphSourceTrackNode)init;
- (PVStabilizationDelegate)stabilizationDelegate;
- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3;
- (id)instructionGraphNodeDescription;
- (id)requiredSourceSampleDataTrackIDs;
- (id)requiredSourceTrackIDs;
- (id)userContext;
- (int)dataTrackID;
- (int)depthTrackID;
- (int)fillMode;
- (int)metadataTrackID;
- (int)trackID;
- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4;
- (void)setClipNaturalSize:(CGSize)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setDataTrackID:(int)a3;
- (void)setDepthTrackID:(int)a3;
- (void)setFillMode:(int)a3;
- (void)setMetadataTrackID:(int)a3;
- (void)setStabilizationDelegate:(id)a3;
- (void)setStabilizationDelegateRespondsToDidStabilize:(BOOL)a3;
- (void)setTrackID:(int)a3;
- (void)setUserContext:(id)a3;
- (void)unloadIGNode;
@end

@implementation PVInstructionGraphSourceTrackNode

+ (id)newSourceTrackNode:(int)a3 transform:(CGAffineTransform *)a4 cropRect:(CGRect)a5 clipNaturalSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v8 = a5.size.height;
  double v9 = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v13 = *(void *)&a3;
  v14 = objc_alloc_init(PVInstructionGraphSourceTrackNode);
  [(PVInstructionGraphSourceTrackNode *)v14 setTrackID:v13];
  long long v15 = *(_OWORD *)&a4->c;
  v17[0] = *(_OWORD *)&a4->a;
  v17[1] = v15;
  v17[2] = *(_OWORD *)&a4->tx;
  [(PVInstructionGraphSourceNode *)v14 setTransform:v17];
  -[PVInstructionGraphSourceTrackNode setCropRect:](v14, "setCropRect:", x, y, v9, v8);
  [(PVInstructionGraphSourceTrackNode *)v14 setFillMode:0];
  -[PVInstructionGraphSourceTrackNode setClipNaturalSize:](v14, "setClipNaturalSize:", width, height);
  return v14;
}

+ (id)newSourceTrackNode:(int)a3 animation:(id)a4 fillMode:(int)a5 clipNaturalSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a3;
  id v10 = a4;
  v11 = objc_alloc_init(PVInstructionGraphSourceTrackNode);
  [(PVInstructionGraphSourceTrackNode *)v11 setTrackID:v9];
  [(PVInstructionGraphSourceNode *)v11 setTransformAnimation:v10];
  [(PVInstructionGraphSourceTrackNode *)v11 setFillMode:v8];
  -[PVInstructionGraphSourceTrackNode setClipNaturalSize:](v11, "setClipNaturalSize:", width, height);

  return v11;
}

+ (id)newSourceTrackNodeWithStabilizationDelegate:(id)a3 userContext:(id)a4 trackID:(int)a5 transform:(CGAffineTransform *)a6 clipNaturalSize:(CGSize)a7
{
  long long v7 = *(_OWORD *)&a6->c;
  v9[0] = *(_OWORD *)&a6->a;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a6->tx;
  return (id)objc_msgSend(a1, "newSourceTrackNodeWithStabilizationDelegate:userContext:trackID:dataTrackID:transform:clipNaturalSize:", a3, a4, *(void *)&a5, 0, v9, a7.width, a7.height);
}

+ (id)newSourceTrackNodeWithStabilizationDelegate:(id)a3 userContext:(id)a4 trackID:(int)a5 dataTrackID:(int)a6 transform:(CGAffineTransform *)a7 clipNaturalSize:(CGSize)a8
{
  double height = a8.height;
  double width = a8.width;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  id v16 = a4;
  long long v17 = *(_OWORD *)&a7->c;
  v20[0] = *(_OWORD *)&a7->a;
  v20[1] = v17;
  v20[2] = *(_OWORD *)&a7->tx;
  v18 = objc_msgSend(a1, "newSourceTrackNode:transform:cropRect:clipNaturalSize:", v12, v20, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), width, height);
  [v18 setDataTrackID:v11];
  [v18 setStabilizationDelegate:v15];
  [v18 setStabilizationDelegateRespondsToDidStabilize:objc_opt_respondsToSelector() & 1];
  [v18 setUserContext:v16];

  return v18;
}

- (PVInstructionGraphSourceTrackNode)init
{
  v7.receiver = self;
  v7.super_class = (Class)PVInstructionGraphSourceTrackNode;
  v2 = [(PVInstructionGraphSourceNode *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)&v2->_fillMode;
    *(void *)&v2->_fillMode = 0;

    BYTE4(v3->super._transform.ty) = 0;
    stabilizationDelegate = v3->_stabilizationDelegate;
    v3->_stabilizationDelegate = 0;

    v3->_sourceTrackloaded.__a_.__a_value = 0;
    *(_DWORD *)&v3->_stabilizationDelegateRespondsToDidStabilize = 0;
    atomic_store(0, (unsigned int *)&v3->super._transform.ty);
  }
  return v3;
}

- (id)requiredSourceTrackIDs
{
  if (self->_trackID)
  {
    v3 = (void *)MEMORY[0x1E4F1CAD0];
    v4 = [NSNumber numberWithInt:self->_sourceTrackloaded.__a_.__a_value];
    v5 = [NSNumber numberWithInt:self->_trackID];
    uint64_t v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
LABEL_5:
    uint64_t v9 = (void *)v6;

    goto LABEL_6;
  }
  int v7 = *(_DWORD *)&self->_stabilizationDelegateRespondsToDidStabilize;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [NSNumber numberWithInt:self->_sourceTrackloaded.__a_.__a_value];
  if (v7)
  {
    v5 = [NSNumber numberWithInt:*(unsigned int *)&self->_stabilizationDelegateRespondsToDidStabilize];
    uint64_t v6 = objc_msgSend(v8, "setWithObjects:", v4, v5, 0);
    goto LABEL_5;
  }
  uint64_t v9 = [v8 setWithObject:v4];
LABEL_6:

  return v9;
}

- (id)requiredSourceSampleDataTrackIDs
{
  if (self->_dataTrackID || *(_DWORD *)&self->_stabilizationDelegateRespondsToDidStabilize)
  {
    v2 = (void *)MEMORY[0x1E4F1CAD0];
    v3 = objc_msgSend(NSNumber, "numberWithInt:");
    v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isPassthru
{
  if (!self->_sourceTrackloaded.__a_.__a_value
    || *(_DWORD *)&self->_stabilizationDelegateRespondsToDidStabilize
    || self->_trackID
    || self->_dataTrackID)
  {
    return 0;
  }
  v5 = [(PVInstructionGraphSourceTrackNode *)self stabilizationDelegate];
  if (v5)
  {
    IsIdentitdouble y = 0;
  }
  else
  {
    [(PVInstructionGraphSourceNode *)self transform];
    IsIdentitdouble y = CGAffineTransformIsIdentity(&v6);
  }

  return IsIdentity;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  id v7 = [(PVInstructionGraphSourceTrackNode *)self stabilizationDelegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0 && !atomic_fetch_add((atomic_uint *volatile)&self->super._transform.ty, 1u))
  {
    id v8 = [(PVInstructionGraphSourceTrackNode *)self stabilizationDelegate];
    CGAffineTransform v6 = [(PVInstructionGraphSourceTrackNode *)self userContext];
    [v8 loadWithUserContext:v6];
  }
}

- (void)unloadIGNode
{
  id v5 = [(PVInstructionGraphSourceTrackNode *)self stabilizationDelegate];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0 && atomic_fetch_add((atomic_uint *volatile)&self->super._transform.ty, 0xFFFFFFFF) == 1)
  {
    id v6 = [(PVInstructionGraphSourceTrackNode *)self stabilizationDelegate];
    v4 = [(PVInstructionGraphSourceTrackNode *)self userContext];
    [v6 unloadWithUserContext:v4];
  }
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  uint64_t v11 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v223, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphSourceTrackNode hgNodeForTime:...]");
  unsigned __int8 v14 = atomic_load(HGLogger::_enabled);
  if (v14) {
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"SourceTrackID: %d dataTrackID: %d depthTrackID: %d metadataTrackID: %d\n", v12, v13, self->_sourceTrackloaded.__a_.__a_value, *(unsigned int *)&self->_stabilizationDelegateRespondsToDidStabilize, self->_trackID, self->_dataTrackID);
  }
  PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::GetNode((uint64_t)a4, self, v11);
  PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::GetFrameDataPixelBuffer((uint64_t)a4, self, &v222);
  if (v222 && (uint64_t v15 = v222[16]) != 0) {
    id v16 = *(__CVBuffer **)(v15 + 24);
  }
  else {
    id v16 = 0;
  }
  CVPixelBufferRef v17 = CVPixelBufferRetain(v16);
  if (v222) {
    (*(void (**)(void *))(*v222 + 24))(v222);
  }
  v18 = [(PVInstructionGraphSourceTrackNode *)self stabilizationDelegate];
  long long v220 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  v19 = [(PVInstructionGraphSourceTrackNode *)self userContext];
  v179 = v17;
  v20 = [v18 timedStabilizationConfigForTime:&v220 frameData:v17 userContext:v19];

  v178 = v20;
  v21 = [v20 object];
  if ([v21 isValid])
  {
    PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::GetInputSize((uint64_t)a4, self, (uint64_t)&t1);
    CGFloat a = t1.a;
    CGFloat b = t1.b;
    double d = t1.d;
    double c = t1.c;
    [v21 cleanAperture];
    double v174 = v25;
    double v176 = v24;
    double rect2 = v26;
    double v28 = v27;
    double v29 = *MEMORY[0x1E4F1DAD8];
    double v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v21 normalizedCleanAperture];
    double v169 = v31;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    double v37 = v36;
    v231.origin.double x = a;
    v231.origin.double y = b;
    v231.size.CGFloat height = d;
    v231.size.CGFloat width = c;
    v243.origin.double y = v174;
    v243.origin.double x = v176;
    v243.size.CGFloat width = rect2;
    v243.size.CGFloat height = v28;
    BOOL v38 = CGRectEqualToRect(v231, v243);
    if (!v38)
    {
      v232.origin.double y = v174;
      v232.origin.double x = v176;
      v232.size.CGFloat width = rect2;
      v232.size.CGFloat height = v28;
      uint64_t v39 = HGRectMakeWithCGRect(v232);
      uint64_t v41 = v40;
      v42 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v42);
      (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v42 + 96))(v42, 0, (float)(int)v39, (float)SHIDWORD(v39), (float)(int)v41, (float)SHIDWORD(v41));
      (*(void (**)(HGCrop *, void, HGNode *))(*(void *)v42 + 120))(v42, 0, *v11);
      v43 = *v11;
      v44 = (HGNode *)v42;
      if (*v11 != (HGNode *)v42)
      {
        if (v43) {
          (*(void (**)(HGNode *))(*(void *)v43 + 24))(v43);
        }
        PVInstructionGraphSourceTrackNode *v11 = (HGNode *)v42;
        (*(void (**)(HGCrop *))(*(void *)v42 + 16))(v42);
        v44 = *v11;
      }
      long long v45 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v219.CGFloat a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v219.double c = v45;
      *(_OWORD *)&v219.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&v219.a;
      *(_OWORD *)&t1.double c = v45;
      *(_OWORD *)&t1.tdouble x = *(_OWORD *)&v219.tx;
      CGAffineTransformMakeScale(&t2, rect2 / rect2, v28 / v28);
      CGAffineTransformConcat(&v219, &t1, &t2);
      double v46 = *MEMORY[0x1E4F1DAD8];
      double v47 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      CGAffineTransform v225 = v219;
      CGAffineTransformMakeTranslation(&v224, v46 - v176 * (rect2 / rect2), v47 - v174 * (v28 / v28));
      CGAffineTransformConcat(&v226, &v225, &v224);
      CGAffineTransform v219 = v226;
      v218 = v44;
      if (v44) {
        (*(void (**)(HGNode *))(*(void *)v44 + 16))(v44);
      }
      CGAffineTransform v217 = v219;
      int v48 = (*(uint64_t (**)(void))(**(void **)a6.m_Obj + 64))();
      HGXFormForCGAffineTransform((HGXForm **)&v218, &v217, v48, (HGXForm **)&t1);
      v49 = *v11;
      CGFloat v50 = t1.a;
      if (*v11 == *(HGNode **)&t1.a)
      {
        if (v49) {
          (*(void (**)(HGNode *))(*(void *)v49 + 24))(v49);
        }
      }
      else
      {
        if (v49)
        {
          (*(void (**)(HGNode *))(*(void *)v49 + 24))(v49);
          CGFloat v50 = t1.a;
        }
        *(CGFloat *)uint64_t v11 = v50;
        t1.CGFloat a = 0.0;
      }
      if (v218) {
        (*(void (**)(HGNode *))(*(void *)v218 + 24))(v218);
      }
      (*(void (**)(HGCrop *))(*(void *)v42 + 24))(v42);
    }
    [v21 homography];
    CGFloat v51 = v29 - rect2 * 0.5;
    CGFloat v52 = v30 - v28 * 0.5;
    v158.size.CGFloat width = rect2;
    v158.size.CGFloat height = v28;
    v158.origin.double x = v51;
    v158.origin.double y = v52;
    v242.origin.double x = v33;
    v242.origin.double y = v35;
    v242.size.CGFloat width = v169;
    v242.size.CGFloat height = v37;
    pv_convert_homography_coordinates(v229, v242, v158);
    int32x4_t v167 = v54;
    int32x4_t v168 = v53;
    int32x4_t v166 = v55;
    memset(&v219, 0, sizeof(v219));
    CGFloat v164 = v52;
    CGFloat v165 = v51;
    CGAffineTransformMakeTranslation(&v219, v51, v52);
    v56 = *v11;
    v216 = v56;
    if (v56) {
      (*(void (**)(HGNode *))(*(void *)v56 + 16))(v56);
    }
    CGAffineTransform v215 = v219;
    int v57 = (*(uint64_t (**)(void))(**(void **)a6.m_Obj + 64))();
    HGXFormForCGAffineTransform((HGXForm **)&v216, &v215, v57, (HGXForm **)&t1);
    v58 = *v11;
    CGFloat v59 = t1.a;
    if (*v11 == *(HGNode **)&t1.a)
    {
      if (v58) {
        (*(void (**)(HGNode *))(*(void *)v58 + 24))(v58);
      }
    }
    else
    {
      if (v58)
      {
        (*(void (**)(HGNode *))(*(void *)v58 + 24))(v58);
        CGFloat v59 = t1.a;
      }
      *(CGFloat *)uint64_t v11 = v59;
      t1.CGFloat a = 0.0;
    }
    if (v216) {
      (*(void (**)(HGNode *))(*(void *)v216 + 24))(v216);
    }
    v60 = *v11;
    v214 = v60;
    if (v60) {
      (*(void (**)(HGNode *))(*(void *)v60 + 16))(v60);
    }
    int v61 = (*(uint64_t (**)(void))(**(void **)a6.m_Obj + 64))();
    v230.columns[0] = (simd_float4)vtrn1q_s32((int32x4_t)0, v168);
    v230.columns[0].i64[0] = v168.i64[0];
    v230.columns[1] = (simd_float4)vtrn1q_s32((int32x4_t)0, v167);
    v230.columns[1].i64[0] = v167.i64[0];
    v230.columns[3] = (simd_float4)vtrn1q_s32((int32x4_t)0, v166);
    v230.columns[3].i64[0] = v166.i64[0];
    v230.columns[2] = (simd_float4)xmmword_1B7E736D0;
    simd_float4 v161 = v230.columns[1];
    simd_float4 v162 = v230.columns[0];
    simd_float4 v163 = v230.columns[3];
    HGXFormForSIMDFloat4x4((const void **)&v214, v61, (HGXForm **)&t1, v230);
    v62 = *v11;
    CGFloat v63 = t1.a;
    if (*v11 == *(HGNode **)&t1.a)
    {
      if (v62) {
        (*(void (**)(HGNode *))(*(void *)v62 + 24))(v62);
      }
    }
    else
    {
      if (v62)
      {
        (*(void (**)(HGNode *))(*(void *)v62 + 24))(v62);
        CGFloat v63 = t1.a;
      }
      *(CGFloat *)uint64_t v11 = v63;
      t1.CGFloat a = 0.0;
    }
    if (v214) {
      (*(void (**)(HGNode *))(*(void *)v214 + 24))(v214);
    }
    v64 = *v11;
    v213 = v64;
    if (v64) {
      (*(void (**)(HGNode *))(*(void *)v64 + 16))(v64);
    }
    CGAffineTransform v211 = v219;
    CGAffineTransformInvert(&v212, &v211);
    int v65 = (*(uint64_t (**)(void))(**(void **)a6.m_Obj + 64))();
    HGXFormForCGAffineTransform((HGXForm **)&v213, &v212, v65, (HGXForm **)&t1);
    v66 = *v11;
    CGFloat v67 = t1.a;
    if (*v11 == *(HGNode **)&t1.a)
    {
      if (v66) {
        (*(void (**)(HGNode *))(*(void *)v66 + 24))(v66);
      }
    }
    else
    {
      if (v66)
      {
        (*(void (**)(HGNode *))(*(void *)v66 + 24))(v66);
        CGFloat v67 = t1.a;
      }
      *(CGFloat *)uint64_t v11 = v67;
      t1.CGFloat a = 0.0;
    }
    if (v213) {
      (*(void (**)(HGNode *))(*(void *)v213 + 24))(v213);
    }
    memset(&v210, 0, sizeof(v210));
    CGAffineTransformMakeScale(&v209, rect2 / v169, v28 / v37);
    CGAffineTransformMakeTranslation(&v208, rect2 * 0.5, v28 * 0.5);
    CGAffineTransformConcat(&v210, &v209, &v208);
    [v21 cropRect];
    CGAffineTransform v207 = v210;
    CGRect v234 = CGRectApplyAffineTransform(v233, &v207);
    double x = v234.origin.x;
    double y = v234.origin.y;
    CGFloat width = v234.size.width;
    CGFloat height = v234.size.height;
    double MinX = CGRectGetMinX(v234);
    v235.origin.double x = x;
    v235.origin.double y = y;
    v235.size.CGFloat width = width;
    v235.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v235);
    v236.origin.double x = x;
    v236.origin.double y = y;
    v236.size.CGFloat width = width;
    v236.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v236);
    v237.origin.double x = x;
    v237.origin.double y = y;
    v237.size.CGFloat width = width;
    v237.size.CGFloat height = height;
    double v75 = round(MinX);
    double v76 = round(MinY);
    double v77 = round(MaxX - (x - v75)) - v75;
    double v78 = round(CGRectGetMaxY(v237) - (y - v76)) - v76;
    v238.origin.double x = 0.0;
    v238.origin.double y = 0.0;
    v238.size.CGFloat width = rect2;
    v238.size.CGFloat height = v28;
    v244.origin.double x = v75;
    v244.origin.double y = v76;
    v244.size.CGFloat width = v77;
    v244.size.CGFloat height = v78;
    if (CGRectEqualToRect(v238, v244))
    {
      if (v38)
      {
LABEL_102:
        if ([(PVInstructionGraphSourceTrackNode *)self stabilizationDelegateRespondsToDidStabilize])
        {
          v102 = [(PVInstructionGraphSourceTrackNode *)self stabilizationDelegate];
          long long v202 = *(_OWORD *)&a3->var0;
          int64_t v203 = a3->var3;
          v103 = [(PVInstructionGraphSourceTrackNode *)self userContext];
          objc_msgSend(v102, "didStabilize:time:frameData:inputSize:cleanAperture:centeredCleanAperture:cleanApertureOriginZero:cropRect:homography:homographyMatrix4x4:userContext:", v20, &v202, v179, v103, c, d, v176, v174, *(void *)&v165, *(void *)&v164, *(void *)&rect2, *(void *)&v28, 0, 0, *(void *)&rect2, *(void *)&v28,
            *(void *)&v75,
            *(void *)&v76,
            *(void *)&v77,
            *(void *)&v78,
            v168.i64[0],
            v168.u32[2],
            v167.i64[0],
            v167.u32[2],
            v166.i64[0],
            v166.u32[2],
            *(_OWORD *)&v162,
            *(_OWORD *)&v161,
            0,
            1065353216,
            *(_OWORD *)&v163);
        }
        goto LABEL_104;
      }
    }
    else
    {
      v239.origin.double x = v75;
      v239.origin.double y = v76;
      v239.size.CGFloat width = v77;
      v239.size.CGFloat height = v78;
      uint64_t v79 = HGRectMakeWithCGRect(v239);
      uint64_t v81 = v80;
      v82 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v82);
      (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v82 + 96))(v82, 0, (float)(int)v79, (float)SHIDWORD(v79), (float)(int)v81, (float)SHIDWORD(v81));
      (*(void (**)(HGCrop *, void, HGNode *))(*(void *)v82 + 120))(v82, 0, *v11);
      v83 = *v11;
      if (*v11 != (HGNode *)v82)
      {
        if (v83) {
          (*(void (**)(HGNode *))(*(void *)v83 + 24))(v83);
        }
        PVInstructionGraphSourceTrackNode *v11 = (HGNode *)v82;
        (*(void (**)(HGCrop *))(*(void *)v82 + 16))(v82);
      }
      (*(void (**)(HGCrop *))(*(void *)v82 + 24))(v82);
    }
    v240.origin.double x = 0.0;
    v240.origin.double y = 0.0;
    v240.size.CGFloat width = rect2;
    v240.size.CGFloat height = v28;
    v245.origin.double x = v75;
    v245.origin.double y = v76;
    v245.size.CGFloat width = v77;
    v245.size.CGFloat height = v78;
    CGRect v241 = CGRectIntersection(v240, v245);
    double v170 = v241.origin.x;
    double v160 = v241.origin.y;
    double v84 = v241.size.width;
    double v85 = v241.size.height;
    int v86 = [v21 fillMode];
    unsigned int v87 = v86;
    if (!v86) {
      goto LABEL_102;
    }
    double v159 = v77;
    if (v86 > 2)
    {
      double v88 = d;
      double v89 = c;
      if (v86 != 3)
      {
        if (v86 == 13)
        {
          double v89 = c;
          double v88 = c / (v84 / v85);
        }
        else
        {
          double v89 = v84;
          double v88 = v85;
          if (v86 == 14)
          {
            double v88 = d;
            double v89 = d * (v84 / v85);
          }
        }
      }
      goto LABEL_82;
    }
    if (v86 == 1)
    {
      if (c <= d)
      {
        double v90 = d / v85;
        if (v84 * (d / v85) < c) {
          double v90 = c / v84;
        }
      }
      else
      {
        double v90 = c / v84;
        if (v85 * (c / v84) < d) {
          double v90 = d / v85;
        }
      }
    }
    else
    {
      double v89 = v84;
      double v88 = v85;
      if (v86 != 2)
      {
LABEL_82:
        double v91 = v89 / v84;
        long long v92 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v206.CGFloat a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v206.double c = v92;
        *(_OWORD *)&v206.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&v206.a;
        *(_OWORD *)&t1.double c = v92;
        *(_OWORD *)&t1.tdouble x = *(_OWORD *)&v206.tx;
        double v93 = v88 / v85;
        CGAffineTransformMakeScale(&t2, v91, v93);
        CGAffineTransformConcat(&v206, &t1, &t2);
        if (v87 - 1 >= 6 && v87 - 13 >= 2)
        {
          double v95 = *MEMORY[0x1E4F1DAD8];
          double v94 = c - v89;
        }
        else
        {
          double v94 = c - v89;
          double v95 = (c - v89) * 0.5;
        }
        double v96 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        if (v87 <= 0xE && ((1 << v87) & 0x619E) != 0)
        {
          double v97 = d - v88;
          double v96 = (d - v88) * 0.5;
        }
        else
        {
          double v97 = d - v88;
        }
        double v77 = v159;
        switch(v87)
        {
          case 6u:
          case 0xBu:
            goto LABEL_91;
          case 8u:
          case 0xAu:
            double v95 = v94;
            break;
          case 0xCu:
            double v95 = v94;
LABEL_91:
            double v96 = v97;
            break;
          default:
            break;
        }
        CGAffineTransform v225 = v206;
        CGAffineTransformMakeTranslation(&v224, v95 - v170 * v91, v96 - v160 * v93);
        CGAffineTransformConcat(&v226, &v225, &v224);
        CGAffineTransform v206 = v226;
        v98 = *v11;
        v205 = v98;
        if (v98) {
          (*(void (**)(HGNode *))(*(void *)v98 + 16))(v98);
        }
        CGAffineTransform v204 = v206;
        int v99 = (*(uint64_t (**)(void))(**(void **)a6.m_Obj + 64))();
        HGXFormForCGAffineTransform((HGXForm **)&v205, &v204, v99, (HGXForm **)&t1);
        v100 = *v11;
        CGFloat v101 = t1.a;
        if (*v11 == *(HGNode **)&t1.a)
        {
          if (v100) {
            (*(void (**)(HGNode *))(*(void *)v100 + 24))(v100);
          }
        }
        else
        {
          if (v100)
          {
            (*(void (**)(HGNode *))(*(void *)v100 + 24))(v100);
            CGFloat v101 = t1.a;
          }
          *(CGFloat *)uint64_t v11 = v101;
          t1.CGFloat a = 0.0;
        }
        if (v205) {
          (*(void (**)(HGNode *))(*(void *)v205 + 24))(v205);
        }
        goto LABEL_102;
      }
      double v90 = c / v84;
      if (v85 * (c / v84) > d) {
        double v90 = d / v85;
      }
    }
    double v89 = v84 * v90;
    double v88 = v85 * v90;
    goto LABEL_82;
  }
LABEL_104:
  CVPixelBufferRelease(v179);
  if (!self->_depthTrackID)
  {
    [(PVInstructionGraphSourceNode *)self transform];
    CGAffineTransform t2 = t1;
    v115 = v20;
    goto LABEL_160;
  }
  memset(&v226, 0, sizeof(v226));
  [(PVInstructionGraphSourceNode *)self transform];
  v104 = (_OWORD *)MEMORY[0x1E4F1DAB8];
  long long v105 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v225.CGFloat a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v225.double c = v105;
  *(_OWORD *)&v225.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  id userContext = self->_userContext;
  double v106 = self->_clipNaturalSize.width;
  double v108 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
  double v110 = v109;
  uint64_t v111 = [(PVInstructionGraphSourceNode *)self transformAnimationContentMode];
  uint64_t v112 = v111;
  if (!v111 || v111 == 3)
  {
    double v113 = v110;
    double v114 = v108;
    goto LABEL_133;
  }
  int depthTrackID = self->_depthTrackID;
  if (depthTrackID <= 2)
  {
    if (depthTrackID == 1)
    {
      if (v108 <= v110)
      {
        double v117 = v110 / v106;
        if (*(double *)&userContext * (v110 / v106) < v108) {
          double v117 = v108 / *(double *)&userContext;
        }
      }
      else
      {
        double v117 = v108 / *(double *)&userContext;
        if (v106 * (v108 / *(double *)&userContext) < v110) {
          double v117 = v110 / v106;
        }
      }
    }
    else
    {
      double v114 = *(double *)&userContext;
      double v113 = v106;
      if (depthTrackID != 2) {
        goto LABEL_130;
      }
      double v117 = v108 / *(double *)&userContext;
      if (v106 * (v108 / *(double *)&userContext) > v110) {
        double v117 = v110 / v106;
      }
    }
    double v114 = *(double *)&userContext * v117;
    double v113 = v106 * v117;
    goto LABEL_130;
  }
  if (depthTrackID == 3)
  {
    double v114 = v108;
    goto LABEL_120;
  }
  if (depthTrackID == 13)
  {
    double v113 = v108 / (*(double *)&userContext / v106);
    double v114 = v108;
    goto LABEL_130;
  }
  double v114 = *(double *)&userContext;
  double v113 = v106;
  if (depthTrackID == 14)
  {
    double v114 = *(double *)&userContext / v106 * v110;
LABEL_120:
    double v113 = v110;
  }
LABEL_130:
  v118 = [(PVInstructionGraphSourceNode *)self transformAnimation];
  [v118 aspectRatio];
  switch(self->_depthTrackID)
  {
    case 1:
      if (v114 / v119 <= v113) {
        double v113 = v114 / v119;
      }
      double v114 = v119 * v113;
      break;
    case 2:
      if (v114 <= v113)
      {
        double v157 = v113;
        if (v113 * v119 < v114) {
          double v157 = v114 / v119;
        }
      }
      else
      {
        double v157 = v114 / v119;
        if (v114 / v119 < v113) {
          double v157 = v113;
        }
      }
      double v114 = v119 * v157;
      double v113 = v157;
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xA:
    case 0xB:
    case 0xC:
      double v113 = 1.0;
      double v114 = v119;
      break;
    case 0xD:
      double v113 = v114 / v119;
      break;
    case 0xE:
      double v114 = v113 * v119;
      break;
    default:
      break;
  }

LABEL_133:
  v120 = [(PVInstructionGraphSourceNode *)self transformAnimation];
  double v177 = v108;
  long long v198 = *(_OWORD *)&a3->var0;
  int64_t v199 = a3->var3;
  BOOL v121 = +[PVTransformAnimation getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:](PVTransformAnimation, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v120, &v198, v112, 0, &t1, v114, v113);

  v115 = v178;
  if (v121)
  {
    tdouble y = t1.ty;
    float v123 = t1.d;
    float v175 = v123;
    tdouble x = t1.tx;
    float v125 = v201;
  }
  else
  {
    float v175 = 0.0;
    tdouble y = 1.0;
    tdouble x = 0.0;
    float v125 = 0.0;
  }
  float v126 = *(double *)&userContext * -0.5;
  float v127 = v106 * -0.5;
  memset(&v224, 0, sizeof(v224));
  double v128 = v126;
  double v129 = v127;
  CGAffineTransformMakeTranslation(&v224, v126, v127);
  CGAffineTransform v197 = v225;
  CGAffineTransform v196 = v224;
  CGAffineTransformConcat(&v225, &v197, &v196);
  int v130 = self->_depthTrackID;
  float v173 = tx;
  if (v130)
  {
    long long v131 = v104[1];
    *(_OWORD *)&v195.CGFloat a = *v104;
    *(_OWORD *)&v195.double c = v131;
    *(_OWORD *)&v195.tdouble x = v104[2];
    CGAffineTransformTranslate(&v219, &v195, v128, v129);
    *(_OWORD *)&v210.CGFloat a = *(_OWORD *)&v219.tx;
    CGAffineTransform v194 = v219;
    CGAffineTransform v193 = v226;
    CGAffineTransformConcat(&v219, &v194, &v193);
    double v132 = fabs(*(double *)&userContext * v219.a + v106 * v219.c);
    double v133 = fabs(*(double *)&userContext * v219.b + v106 * v219.d);
    if (v130 <= 2)
    {
      if (v130 == 1)
      {
        double v135 = v110;
        if (v177 <= v110)
        {
          double v141 = v110 / v133;
          float v136 = v175;
          if (v132 * (v110 / v133) < v177) {
            double v141 = v177 / v132;
          }
        }
        else
        {
          double v141 = v177 / v132;
          float v136 = v175;
          if (v133 * (v177 / v132) < v110) {
            double v141 = v110 / v133;
          }
        }
        double v134 = v132 * v141;
        goto LABEL_156;
      }
      double v135 = v110;
      float v136 = v175;
      if (v130 == 2)
      {
        double v139 = v133 * (v177 / v132);
        double v140 = v110 / v133;
        if (v139 <= v110) {
          double v140 = v177 / v132;
        }
        double v134 = v132 * v140;
        goto LABEL_156;
      }
      goto LABEL_152;
    }
    double v134 = v177;
    double v135 = v110;
    float v136 = v175;
    if (v130 == 3)
    {
LABEL_156:
      double v137 = v134 / v132;
      double v138 = v177;
      goto LABEL_157;
    }
    if (v130 != 13)
    {
      if (v130 == 14)
      {
        double v134 = v110 * (v132 / v133);
        goto LABEL_156;
      }
LABEL_152:
      double v134 = v132;
      goto LABEL_156;
    }
    double v138 = v177;
    double v137 = v177 / (v132 / v133) / v133;
  }
  else
  {
    double v137 = 1.0;
    double v135 = v110;
    double v138 = v177;
    float v136 = v175;
  }
LABEL_157:
  CGAffineTransform v192 = v225;
  CGAffineTransform v191 = v226;
  CGAffineTransformConcat(&v219, &v192, &v191);
  CGAffineTransform v225 = v219;
  if (v125 != 0.0)
  {
    CGAffineTransform v190 = v225;
    CGAffineTransformMakeRotation(&v189, (float)((float)(v125 * 3.1416) / 180.0));
    CGAffineTransformConcat(&v219, &v190, &v189);
    CGAffineTransform v225 = v219;
  }
  memset(&v219, 0, sizeof(v219));
  CGAffineTransformMakeScale(&v219, v137 * ty, v137 * ty);
  CGAffineTransform v188 = v225;
  CGAffineTransform v187 = v219;
  CGAffineTransformConcat(&v210, &v188, &v187);
  CGAffineTransform v225 = v210;
  float v142 = *(double *)&userContext * 0.5 + floor(v138 - *(double *)&userContext) * 0.5 + v136;
  float v143 = v106 * 0.5 + floor(v135 - v106) * 0.5 + v173;
  CGAffineTransformMakeTranslation(&v210, v142, v143);
  CGAffineTransform v224 = v210;
  CGAffineTransform v186 = v225;
  CGAffineTransform v185 = v210;
  CGAffineTransformConcat(&v210, &v186, &v185);
  CGAffineTransform v225 = v210;
  CGAffineTransform t2 = v210;
LABEL_160:
  v144 = *v11;
  v184 = v144;
  if (v144) {
    (*(void (**)(HGNode *))(*(void *)v144 + 16))(v144);
  }
  CGAffineTransform v183 = t2;
  int v145 = (*(uint64_t (**)(void))(**(void **)a6.m_Obj + 64))();
  HGXFormForCGAffineTransform((HGXForm **)&v184, &v183, v145, (HGXForm **)&t1);
  v146 = *v11;
  CGFloat v147 = t1.a;
  if (*v11 == *(HGNode **)&t1.a)
  {
    if (v146) {
      (*(void (**)(HGNode *))(*(void *)v146 + 24))(v146);
    }
  }
  else
  {
    if (v146)
    {
      (*(void (**)(HGNode *))(*(void *)v146 + 24))(v146);
      CGFloat v147 = t1.a;
    }
    *(CGFloat *)uint64_t v11 = v147;
    t1.CGFloat a = 0.0;
  }
  if (v184) {
    (*(void (**)(HGNode *))(*(void *)v184 + 24))(v184);
  }
  v148 = *v11;
  v182 = v148;
  if (v148) {
    (*(void (**)(HGNode *))(*(void *)v148 + 16))(v148);
  }
  (*(void (**)(_OWORD *__return_ptr))(**(void **)a6.m_Obj + 56))(v181);
  int v149 = (*(uint64_t (**)(void))(**(void **)a6.m_Obj + 64))();
  HGXFormForCGAffineTransform((HGXForm **)&v182, v181, v149, (HGXForm **)&t1);
  v150 = *v11;
  CGFloat v151 = t1.a;
  if (*v11 == *(HGNode **)&t1.a)
  {
    if (v150) {
      (*(void (**)(HGNode *))(*(void *)v150 + 24))(v150);
    }
  }
  else
  {
    if (v150)
    {
      (*(void (**)(HGNode *))(*(void *)v150 + 24))(v150);
      CGFloat v151 = t1.a;
    }
    *(CGFloat *)uint64_t v11 = v151;
    t1.CGFloat a = 0.0;
  }
  if (v182) {
    (*(void (**)(HGNode *))(*(void *)v182 + 24))(v182);
  }
  if ([(PVInstructionGraphNode *)self isDebugDrawingEnabled]
    && [v21 isValid])
  {
    double v152 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
    double v154 = v153;
    v155 = (HGHWMultiBlend *)HGObject::operator new(0x280uLL);
    HGHWMultiBlend::HGHWMultiBlend(v155);
    (*(void (**)(HGHWMultiBlend *, void, float, double, double, double))(*(void *)v155 + 96))(v155, 0, 9.0, 0.0, 0.0, 0.0);
    (*(void (**)(HGHWMultiBlend *, void, HGNode *))(*(void *)v155 + 120))(v155, 0, *v11);
    coloredDotHGNode(v152 * 0.5 + -13.0, v154 * 0.5 + -13.0, 26.0, 26.0);
  }

  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v223);
  return v156;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v6 = v4;
  id v7 = a3;
  *(void *)uint64_t v6 = 0;
  *(void *)(v6 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v6 + 16) = _Q0;
  p_id userContext = (float64x2_t *)&self->_userContext;
  double v15 = p_userContext->f64[0];
  double v14 = p_userContext->f64[1];
  id v23 = v7;
  if (v14 <= p_userContext->f64[0])
  {
    [v7 outputSize];
    double v17 = v15 / v18;
  }
  else
  {
    [v7 outputSize];
    double v17 = v14 / v16;
  }
  *(float64x2_t *)(v6 + 16) = vdivq_f64(*p_userContext, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v17, 0));

  result.int64_t var3 = v22;
  result.var2 = v21;
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
  id v27 = a4;
  double v7 = (*(double (**)(void))(**(void **)a5.m_Obj + 40))();
  double v9 = v8;
  float v10 = (*(float (**)(void))(**(void **)a5.m_Obj + 48))();
  [v27 outputSize];
  double v12 = v11;
  [v27 outputSize];
  float v13 = v7;
  float v14 = v9;
  float v15 = v10 * v13;
  float v16 = v10 * v14;
  double v18 = v12 / v17;
  double v19 = (float)(v13 / v14);
  if (vabdd_f64(v18, v19) >= 0.0000001)
  {
    double v20 = v27;
    if (v18 > v19)
    {
LABEL_5:
      [v20 outputSize];
      double v22 = v16 / v21;
      goto LABEL_7;
    }
  }
  else
  {
    double v20 = v27;
    if (v16 > v15) {
      goto LABEL_5;
    }
  }
  [v20 outputSize];
  double v22 = v15 / v23;
LABEL_7:
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
  float v24 = v22;
  float64x2_t v25 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, v24, (float)-v24, 1.0);
  v25.f64[0] = v15 * 0.5;
  PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)retstr, v25, v16 * 0.5, 0.0);

  return result;
}

- (BOOL)isPortrait
{
  return *(double *)&self->_userContext < self->_clipNaturalSize.width;
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  uint64_t v8 = *(void *)a3.m_Obj;
  if (v8) {
    (*(void (**)(uint64_t, SEL))(*(void *)v8 + 16))(v8, a2);
  }
  v7.receiver = self;
  v7.super_class = (Class)PVInstructionGraphSourceTrackNode;
  uint64_t v4 = [(PVInstructionGraphNode *)&v7 dotTreeLabel:&v8];
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 24))(v8);
  }
  id v5 = objc_msgSend(v4, "stringByAppendingFormat:", @"\nTrack: %d\nSize: [%.0f x %.0f]", self->_sourceTrackloaded.__a_.__a_value, self->_userContext, *(void *)&self->_clipNaturalSize.width);

  return v5;
}

- (id)instructionGraphNodeDescription
{
  v13.receiver = self;
  v13.super_class = (Class)PVInstructionGraphSourceTrackNode;
  char v3 = [(PVInstructionGraphSourceNode *)&v13 instructionGraphNodeDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 setObject:v6 forKeyedSubscript:@"class"];

  objc_super v7 = [NSNumber numberWithInt:self->_sourceTrackloaded.__a_.__a_value];
  [v4 setObject:v7 forKeyedSubscript:@"trackID"];

  uint64_t v8 = [NSNumber numberWithInt:*(unsigned int *)&self->_stabilizationDelegateRespondsToDidStabilize];
  [v4 setObject:v8 forKeyedSubscript:@"dataTrackID"];

  double v9 = [NSNumber numberWithInt:self->_trackID];
  [v4 setObject:v9 forKeyedSubscript:@"depthTrackID"];

  float v10 = [NSNumber numberWithInt:*(unsigned int *)&self->_stabilizationDelegateRespondsToDidStabilize];
  [v4 setObject:v10 forKeyedSubscript:@"metadataTrackID"];

  double v11 = NSStringFromSIMDDouble2(2, *(__n128 *)&self->_userContext);
  [v4 setObject:v11 forKeyedSubscript:@"clipNaturalSize"];

  return v4;
}

- (int)trackID
{
  return self->_sourceTrackloaded.__a_.__a_value;
}

- (void)setTrackID:(int)a3
{
  self->_sourceTrackloaded.__a_.__a_value = a3;
}

- (int)dataTrackID
{
  return *(_DWORD *)&self->_stabilizationDelegateRespondsToDidStabilize;
}

- (void)setDataTrackID:(int)a3
{
  *(_DWORD *)&self->_stabilizationDelegateRespondsToDidStabilize = a3;
}

- (int)depthTrackID
{
  return self->_trackID;
}

- (void)setDepthTrackID:(int)a3
{
  self->_trackID = a3;
}

- (int)metadataTrackID
{
  return self->_dataTrackID;
}

- (void)setMetadataTrackID:(int)a3
{
  self->_dataTrackID = a3;
}

- (CGRect)cropRect
{
  double height = self->_clipNaturalSize.height;
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  result.size.double height = width;
  result.size.double width = y;
  result.origin.double y = x;
  result.origin.double x = height;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  *(CGRect *)&self->_clipNaturalSize.double height = a3;
}

- (int)fillMode
{
  return self->_depthTrackID;
}

- (void)setFillMode:(int)a3
{
  self->_int depthTrackID = a3;
}

- (PVStabilizationDelegate)stabilizationDelegate
{
  return *(PVStabilizationDelegate **)&self->_fillMode;
}

- (void)setStabilizationDelegate:(id)a3
{
}

- (id)userContext
{
  return self->_stabilizationDelegate;
}

- (void)setUserContext:(id)a3
{
}

- (CGSize)clipNaturalSize
{
  id userContext = self->_userContext;
  double width = self->_clipNaturalSize.width;
  result.double height = width;
  result.double width = *(double *)&userContext;
  return result;
}

- (void)setClipNaturalSize:(CGSize)a3
{
  *(CGSize *)&self->_id userContext = a3;
}

- (BOOL)stabilizationDelegateRespondsToDidStabilize
{
  return BYTE4(self->super._transform.ty);
}

- (void)setStabilizationDelegateRespondsToDidStabilize:(BOOL)a3
{
  BYTE4(self->super._transform.ty) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stabilizationDelegate, 0);

  objc_storeStrong((id *)&self->_fillMode, 0);
}

@end
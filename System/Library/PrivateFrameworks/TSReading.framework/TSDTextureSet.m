@interface TSDTextureSet
- (BOOL)isBackground;
- (BOOL)isBackgroundTexture:(id)a3;
- (BOOL)isBaked;
- (BOOL)isMagicMove;
- (BOOL)isRenderable;
- (BOOL)shouldIncludeFinalTexturesInVisibleSet;
- (BOOL)shouldTransformUsingTextureCenter;
- (CALayer)alternateLayer;
- (CALayer)layer;
- (CGColorSpace)colorSpace;
- (CGPoint)center;
- (CGPoint)originalPosition;
- (CGRect)boundingRect;
- (CGRect)boundingRectForStage:(int64_t)a3 isBuildIn:(BOOL)a4;
- (CGRect)contentRectForStage:(int64_t)a3 isBuildIn:(BOOL)a4;
- (CGRect)frame;
- (CGRect)textureContentRect;
- (NSArray)allTextures;
- (NSArray)visibleTextures;
- (NSDictionary)boundingRectForStage;
- (NSDictionary)contentRectForStage;
- (TSDRep)rep;
- (TSDTextureSet)init;
- (double)textureAngle;
- (double)textureOpacity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)finalTextureForStage:(int64_t)a3 reverse:(BOOL)a4;
- (id)firstVisibleTextureForTextureType:(int)a3;
- (id)newFlattenedTexture;
- (id)newFlattenedTextureFromTextures:(id)a3 newRect:(CGRect)a4;
- (id)visibleTexturesForStage:(int64_t)a3 isBuildIn:(BOOL)a4 shouldFlatten:(BOOL)a5;
- (int64_t)maxStageIndex;
- (int64_t)stageIndex;
- (int64_t)stageIndexForTexture:(id)a3;
- (int64_t)textureZOrder;
- (unint64_t)chunkCount;
- (void)addFinalTexture:(id)a3 forStage:(int64_t)a4 reverse:(BOOL)a5;
- (void)addPerspectiveLayerToTexture:(id)a3 withShowSize:(CGSize)a4;
- (void)addRenderable:(id)a3;
- (void)addRenderable:(id)a3 forStage:(int64_t)a4;
- (void)adjustAnchorPointRelativeToCenterOfRotation;
- (void)applyActionEffect:(id)a3 viewScale:(double)a4 isMagicMove:(BOOL)a5 shouldBake:(BOOL)a6 applyScaleOnly:(BOOL)a7 ignoreScale:(BOOL)a8 shouldCheckActionKeys:(BOOL)a9;
- (void)dealloc;
- (void)hideLayersOfFinalTextures;
- (void)p_applyPositionFromAttributes:(id)a3 viewScale:(double)a4;
- (void)p_resetAttributesWithViewScale:(double)a3;
- (void)releaseSingleTextures;
- (void)removeRenderable:(id)a3;
- (void)renderIntoContext:(CGContext *)a3;
- (void)renderLayerContentsIfNeeded;
- (void)resetAnchorPoint;
- (void)setAlternateLayer:(id)a3;
- (void)setBoundingRect:(CGRect)a3;
- (void)setBoundingRect:(CGRect)a3 forStage:(int64_t)a4;
- (void)setBoundingRectForStage:(id)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setColorSpace:(CGColorSpace *)a3;
- (void)setContentRect:(CGRect)a3 forStage:(int64_t)a4;
- (void)setContentRectForStage:(id)a3;
- (void)setIsBackground:(BOOL)a3;
- (void)setIsBaked:(BOOL)a3;
- (void)setIsMagicMove:(BOOL)a3;
- (void)setLayerGeometryFromRep:(id)a3;
- (void)setOriginalPosition:(CGPoint)a3;
- (void)setRep:(id)a3;
- (void)setShouldIncludeFinalTexturesInVisibleSet:(BOOL)a3;
- (void)setShouldTransformUsingTextureCenter:(BOOL)a3;
- (void)setTextureAngle:(double)a3;
- (void)setTextureContentRect:(CGRect)a3;
- (void)setTextureOpacity:(double)a3;
- (void)setTextureZOrder:(int64_t)a3;
- (void)teardown;
@end

@implementation TSDTextureSet

- (TSDTextureSet)init
{
  v11.receiver = self;
  v11.super_class = (Class)TSDTextureSet;
  v2 = [(TSDTextureSet *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->mMaxStageIndeCGFloat x = 0;
    v2->mChunkCount = 0;
    v2->mActiveChunkIndices.location = 0;
    v2->mActiveChunkIndices.length = 0;
    v2->mTextures = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v3->mAllTextures = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v3->mStageIndexForTexture = (TSUNoCopyDictionary *)objc_alloc_init(MEMORY[0x263F7C880]);
    v3->mFinalTextureForStage = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v3->mReverseFinalTextureForStage = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v3->mBoundingRectForStage = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v3->mContentRectForStage = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v3->mFinalTexturesToStageMap = (TSUNoCopyDictionary *)objc_alloc_init(MEMORY[0x263F7C880]);
    v3->mReverseFinalTexturesToStageMap = (TSUNoCopyDictionary *)objc_alloc_init(MEMORY[0x263F7C880]);
    v3->mLayer = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    CGSize v4 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v3->mBounds.origin = (CGPoint)*MEMORY[0x263F001A0];
    v3->mBounds.size = v4;
    CGFloat x = v3->mBounds.origin.x;
    v4.CGFloat width = v3->mBounds.origin.y;
    CGFloat width = v3->mBounds.size.width;
    CGFloat height = v3->mBounds.size.height;
    CGFloat MidX = CGRectGetMidX(*(CGRect *)((char *)&v4 - 8));
    CGFloat MidY = CGRectGetMidY(v3->mBounds);
    v3->mCenter.CGFloat x = MidX;
    v3->mCenter.y = MidY;
    -[CALayer setFrame:](v3->mLayer, "setFrame:", v3->mBounds.origin.x, v3->mBounds.origin.y, v3->mBounds.size.width, v3->mBounds.size.height);
    v3->mTextureContentRect.origin = (CGPoint)TSDRectUnit;
    v3->mTextureContentRect.size = *(CGSize *)&qword_223839568;
    v3->mTextureOpacity = 1.0;
    v3->mTextureZOrder = -1;
  }
  return v3;
}

- (void)teardown
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  mAllTextures = self->mAllTextures;
  uint64_t v3 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(mAllTextures);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) teardown];
      }
      uint64_t v4 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)releaseSingleTextures
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  mAllTextures = self->mAllTextures;
  uint64_t v3 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(mAllTextures);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) releaseSingleTexture];
      }
      uint64_t v4 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDTextureSet;
  [(TSDTextureSet *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->mAllTextures;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([(NSMutableArray *)self->mTextures containsObject:v9])
        {
          objc_msgSend(v4, "addRenderable:forStage:", (id)objc_msgSend(v9, "copy"), -[TSDTextureSet stageIndexForTexture:](self, "stageIndexForTexture:", v9));
        }
        else
        {
          uint64_t v10 = objc_msgSend((id)-[TSUNoCopyDictionary allKeys](self->mReverseFinalTexturesToStageMap, "allKeys"), "containsObject:", v9);
          if (v10) {
            p_mReverseFinalTexturesToStageMap = &self->mReverseFinalTexturesToStageMap;
          }
          else {
            p_mReverseFinalTexturesToStageMap = &self->mFinalTexturesToStageMap;
          }
          uint64_t v12 = (void *)[(TSUNoCopyDictionary *)*p_mReverseFinalTexturesToStageMap objectForKey:v9];
          if (v12) {
            objc_msgSend(v4, "addFinalTexture:forStage:reverse:", (id)objc_msgSend(v9, "copy"), (int)objc_msgSend(v12, "intValue"), v10);
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
  [v4 setAlternateLayer:self->mAlternateLayer];
  objc_msgSend(v4, "setBoundingRectForStage:", objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:", self->mBoundingRectForStage));
  objc_msgSend(v4, "setContentRectForStage:", objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:", self->mContentRectForStage));
  [(CALayer *)self->mLayer frame];
  objc_msgSend((id)objc_msgSend(v4, "layer"), "setFrame:", v13, v14, v15, v16);
  objc_msgSend(v4, "setOriginalPosition:", self->mOriginalPosition.x, self->mOriginalPosition.y);
  objc_msgSend(v4, "setCenter:", self->mCenter.x, self->mCenter.y);
  return v4;
}

- (CALayer)layer
{
  result = self->mAlternateLayer;
  if (!result) {
    return self->mLayer;
  }
  return result;
}

- (CGRect)boundingRectForStage:(int64_t)a3 isBuildIn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (void *)-[NSMutableDictionary objectForKey:](self->mBoundingRectForStage, "objectForKey:", objc_msgSend(NSNumber, "numberWithInteger:"));
  if (v7
    || (uint64_t v7 = (void *)[(NSMutableDictionary *)self->mBoundingRectForStage objectForKey:&unk_26D739D38]) != 0)
  {
    [v7 CGRectValue];
  }
  else
  {
    [(TSDTextureSet *)self boundingRect];
  }
  CGFloat x = v8;
  CGFloat y = v9;
  CGFloat width = v10;
  CGFloat height = v11;
  if (a3 || !v4)
  {
    if (v4) {
      goto LABEL_11;
    }
    if (self->mMaxStageIndex != a3) {
      goto LABEL_17;
    }
  }
  double v16 = (void *)[(NSMutableDictionary *)self->mBoundingRectForStage objectForKey:&unk_26D739D38];
  if (v16)
  {
    [v16 CGRectValue];
    v36.origin.CGFloat x = v17;
    v36.origin.CGFloat y = v18;
    v36.size.CGFloat width = v19;
    v36.size.CGFloat height = v20;
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    CGRect v32 = CGRectUnion(v31, v36);
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
  }
  if (!v4)
  {
LABEL_17:
    if (a3 || v4) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
LABEL_11:
  BOOL v21 = !v4;
  if (a3) {
    BOOL v21 = 0;
  }
  if (v21 || self->mMaxStageIndex == a3)
  {
LABEL_18:
    long long v22 = (void *)[(NSMutableDictionary *)self->mBoundingRectForStage objectForKey:&unk_26D739D50];
    if (v22)
    {
      [v22 CGRectValue];
      v37.origin.CGFloat x = v23;
      v37.origin.CGFloat y = v24;
      v37.size.CGFloat width = v25;
      v37.size.CGFloat height = v26;
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = height;
      CGRect v34 = CGRectUnion(v33, v37);
      CGFloat x = v34.origin.x;
      CGFloat y = v34.origin.y;
      CGFloat width = v34.size.width;
      CGFloat height = v34.size.height;
    }
  }
LABEL_20:
  double v27 = x;
  double v28 = y;
  double v29 = width;
  double v30 = height;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (CGRect)contentRectForStage:(int64_t)a3 isBuildIn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (void *)-[NSMutableDictionary objectForKey:](self->mContentRectForStage, "objectForKey:", objc_msgSend(NSNumber, "numberWithInteger:"));
  if (v7
    || (uint64_t v7 = (void *)[(NSMutableDictionary *)self->mContentRectForStage objectForKey:&unk_26D739D38]) != 0)
  {
    [v7 CGRectValue];
  }
  else
  {
    [(TSDTextureSet *)self boundingRect];
  }
  CGFloat x = v8;
  CGFloat y = v9;
  CGFloat width = v10;
  CGFloat height = v11;
  if (a3 || !v4)
  {
    if (v4) {
      goto LABEL_11;
    }
    if (self->mMaxStageIndex != a3) {
      goto LABEL_17;
    }
  }
  double v16 = (void *)[(NSMutableDictionary *)self->mContentRectForStage objectForKey:&unk_26D739D38];
  if (v16)
  {
    [v16 CGRectValue];
    v36.origin.CGFloat x = v17;
    v36.origin.CGFloat y = v18;
    v36.size.CGFloat width = v19;
    v36.size.CGFloat height = v20;
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    CGRect v32 = CGRectUnion(v31, v36);
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
  }
  if (!v4)
  {
LABEL_17:
    if (a3 || v4) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
LABEL_11:
  BOOL v21 = !v4;
  if (a3) {
    BOOL v21 = 0;
  }
  if (v21 || self->mMaxStageIndex == a3)
  {
LABEL_18:
    long long v22 = (void *)[(NSMutableDictionary *)self->mContentRectForStage objectForKey:&unk_26D739D50];
    if (v22)
    {
      [v22 CGRectValue];
      v37.origin.CGFloat x = v23;
      v37.origin.CGFloat y = v24;
      v37.size.CGFloat width = v25;
      v37.size.CGFloat height = v26;
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = height;
      CGRect v34 = CGRectUnion(v33, v37);
      CGFloat x = v34.origin.x;
      CGFloat y = v34.origin.y;
      CGFloat width = v34.size.width;
      CGFloat height = v34.size.height;
    }
  }
LABEL_20:
  double v27 = x;
  double v28 = y;
  double v29 = width;
  double v30 = height;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (void)addRenderable:(id)a3
{
}

- (void)addRenderable:(id)a3 forStage:(int64_t)a4
{
  if (![a3 textureType])
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDTextureSet addRenderable:forStage:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextureSet.m"), 277, @"Unknown texture type! Probably because it wasn't set! Go do that!");
  }
  [(NSMutableArray *)self->mTextures addObject:a3];
  [(NSMutableArray *)self->mAllTextures addObject:a3];
  [a3 setParent:self];
  uint64_t v9 = [NSNumber numberWithInteger:a4];
  [(TSUNoCopyDictionary *)self->mStageIndexForTexture setObject:v9 forUncopiedKey:a3];
  [a3 frame];
  v62.origin.CGFloat x = v10;
  v62.origin.CGFloat y = v11;
  v62.size.CGFloat width = v12;
  v62.size.CGFloat height = v13;
  self->mBounds = CGRectUnion(self->mBounds, v62);
  -[CALayer setFrame:](self->mLayer, "setFrame:");
  double v14 = (void *)[(NSMutableDictionary *)self->mBoundingRectForStage objectForKey:v9];
  double v15 = *MEMORY[0x263F001A0];
  double v16 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v17 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v18 = *(double *)(MEMORY[0x263F001A0] + 24);
  CGFloat v19 = v18;
  CGFloat v20 = v17;
  CGFloat v21 = v16;
  CGFloat v22 = *MEMORY[0x263F001A0];
  if (v14)
  {
    [v14 CGRectValue];
    CGFloat v22 = v23;
    CGFloat v21 = v24;
    CGFloat v20 = v25;
    CGFloat v19 = v26;
  }
  [a3 frame];
  v63.origin.CGFloat x = v27;
  v63.origin.CGFloat y = v28;
  v63.size.CGFloat width = v29;
  v63.size.CGFloat height = v30;
  v57.origin.CGFloat x = v22;
  v57.origin.CGFloat y = v21;
  v57.size.CGFloat width = v20;
  v57.size.CGFloat height = v19;
  CGRect v58 = CGRectUnion(v57, v63);
  -[NSMutableDictionary setObject:forKey:](self->mBoundingRectForStage, "setObject:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v58.origin.x, v58.origin.y, v58.size.width, v58.size.height), v9);
  CGRect v31 = (void *)[(NSMutableDictionary *)self->mContentRectForStage objectForKey:v9];
  if (v31)
  {
    [v31 CGRectValue];
    double v15 = v32;
    double v16 = v33;
    double v17 = v34;
    double v18 = v35;
  }
  CGFloat r1 = v18;
  [a3 contentRect];
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  [a3 offset];
  CGFloat v44 = v17;
  CGFloat v45 = v16;
  CGFloat v46 = v15;
  CGFloat v48 = v47;
  [a3 offset];
  CGFloat v50 = v49;
  v59.origin.CGFloat x = v37;
  v59.origin.CGFloat y = v39;
  v59.size.CGFloat width = v41;
  v59.size.CGFloat height = v43;
  CGRect v64 = CGRectOffset(v59, v48, v50);
  v60.origin.CGFloat x = v46;
  v60.origin.CGFloat y = v45;
  v60.size.CGFloat width = v44;
  v60.size.CGFloat height = r1;
  CGRect v61 = CGRectUnion(v60, v64);
  -[NSMutableDictionary setObject:forKey:](self->mContentRectForStage, "setObject:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v61.origin.x, v61.origin.y, v61.size.width, v61.size.height), v9);
  -[CALayer addSublayer:](self->mLayer, "addSublayer:", [a3 layer]);
  CGFloat MidX = CGRectGetMidX(self->mBounds);
  CGFloat MidY = CGRectGetMidY(self->mBounds);
  self->mCenter.CGFloat x = MidX;
  self->mCenter.CGFloat y = MidY;
  if (self->mMaxStageIndex < a4) {
    self->mMaxStageIndeCGFloat x = a4;
  }
  ++self->mChunkCount;
  v53 = [(NSArray *)[(CALayer *)self->mLayer sublayers] sortedArrayUsingComparator:&__block_literal_global_39];
  mLayer = self->mLayer;

  [(CALayer *)mLayer setSublayers:v53];
}

uint64_t __40__TSDTextureSet_addRenderable_forStage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = objc_msgSend((id)objc_msgSend(a2, "valueForKey:", @"kTSDTextureLayerKeyTexturedRectangle"), "nonretainedObjectValue");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"kTSDTextureLayerKeyTexturedRectangle"), "nonretainedObjectValue");
  unsigned int v6 = [v4 textureType];
  unsigned int v7 = [v5 textureType];
  if (v6 < v7) {
    return -1;
  }
  else {
    return v6 > v7;
  }
}

- (void)addFinalTexture:(id)a3 forStage:(int64_t)a4 reverse:(BOOL)a5
{
  BOOL v5 = a5;
  -[NSMutableArray addObject:](self->mAllTextures, "addObject:");
  [a3 setParent:self];
  uint64_t v9 = [NSNumber numberWithInteger:a4];
  if (v5)
  {
    [(TSUNoCopyDictionary *)self->mReverseFinalTexturesToStageMap setObject:a3 forKey:v9];
    p_mReverseFinalTextureForStage = &self->mReverseFinalTextureForStage;
    mReverseFinalTextureForStage = self->mReverseFinalTextureForStage;
  }
  else
  {
    [(TSUNoCopyDictionary *)self->mFinalTexturesToStageMap setObject:v9 forKey:a3];
    p_mReverseFinalTextureForStage = &self->mFinalTextureForStage;
    mReverseFinalTextureForStage = self->mFinalTextureForStage;
  }
  CGFloat v12 = (void *)[(NSMutableDictionary *)mReverseFinalTextureForStage objectForKey:v9];
  if (!v12)
  {
    CGFloat v12 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:1];
    [(NSMutableDictionary *)*p_mReverseFinalTextureForStage setObject:v12 forKey:v9];
  }
  [v12 addObject:a3];
  [a3 frame];
  v21.origin.CGFloat x = v13;
  v21.origin.CGFloat y = v14;
  v21.size.CGFloat width = v15;
  v21.size.CGFloat height = v16;
  self->mBounds = CGRectUnion(self->mBounds, v21);
  -[CALayer setFrame:](self->mLayer, "setFrame:");
  -[CALayer addSublayer:](self->mLayer, "addSublayer:", [a3 layer]);
  CGFloat MidX = CGRectGetMidX(self->mBounds);
  CGFloat MidY = CGRectGetMidY(self->mBounds);
  self->mCenter.CGFloat x = MidX;
  self->mCenter.CGFloat y = MidY;
  CGFloat v19 = (void *)[a3 layer];

  [v19 setHidden:1];
}

- (void)renderLayerContentsIfNeeded
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mAllTextures = self->mAllTextures;
  uint64_t v4 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(mAllTextures);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) renderLayerContentsIfNeeded];
      }
      uint64_t v5 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  mTextureOpacitCGFloat y = self->mTextureOpacity;
  *(float *)&mTextureOpacitCGFloat y = mTextureOpacity;
  [(CALayer *)self->mLayer setOpacity:mTextureOpacity];
}

- (NSArray)visibleTextures
{
  uint64_t v2 = 96;
  if (!self->mShouldIncludeFinalTexturesInVisibleSet) {
    uint64_t v2 = 88;
  }
  return *(NSArray **)((char *)&self->super.isa + v2);
}

- (id)visibleTexturesForStage:(int64_t)a3 isBuildIn:(BOOL)a4 shouldFlatten:(BOOL)a5
{
  LODWORD(v50) = a5;
  BOOL v5 = a4;
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->mTextures, "count"));
  long long v9 = (double *)MEMORY[0x263F001A0];
  uint64_t v10 = [(NSMutableArray *)self->mTextures count];
  if ([(NSMutableArray *)self->mTextures count])
  {
    uint64_t v11 = 0;
    uint64_t v12 = -1;
    unsigned int v13 = 1;
    do
    {
      int64_t v14 = -[TSDTextureSet stageIndexForTexture:](self, "stageIndexForTexture:", -[NSMutableArray objectAtIndex:](self->mTextures, "objectAtIndex:", v11, v50));
      if (v10 >= v14) {
        int64_t v15 = v14;
      }
      else {
        int64_t v15 = v10;
      }
      if (v12 <= v14) {
        int64_t v16 = v14;
      }
      else {
        int64_t v16 = v12;
      }
      if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL)
      {
        uint64_t v12 = v16;
        uint64_t v10 = v15;
      }
      uint64_t v11 = v13;
      BOOL v17 = [(NSMutableArray *)self->mTextures count] > (unint64_t)v13++;
    }
    while (v17);
  }
  else
  {
    uint64_t v12 = -1;
  }
  double x = *v9;
  double y = v9[1];
  double width = v9[2];
  double height = v9[3];
  if ([(NSMutableArray *)self->mTextures count])
  {
    uint64_t v22 = 0;
    double v23 = 0;
    BOOL v25 = v12 == a3 && v12 != -1;
    BOOL v27 = v10 == a3 && v10 != -1;
    BOOL v52 = v27;
    BOOL v53 = v25;
    unsigned int v28 = 1;
    while (1)
    {
      CGFloat v29 = (void *)[(NSMutableArray *)self->mTextures objectAtIndex:v22];
      int64_t v30 = [(TSDTextureSet *)self stageIndexForTexture:v29];
      if (v30 == a3
        || ((int64_t v31 = v30, v30 == -1) ? (v32 = !v5) : (v32 = 1),
            !v32 ? (BOOL v33 = v10 == a3) : (BOOL v33 = 0),
            v33 && [(NSMutableArray *)self->mTextures count] != a3))
      {
LABEL_58:
        int v38 = [v29 textureType];
        if (v23) {
          BOOL v39 = v38 == 5;
        }
        else {
          BOOL v39 = 1;
        }
        if (v39) {
          double v23 = v29;
        }
        [v8 addObject:v29];
        [v29 frame];
        v62.origin.double x = v40;
        v62.origin.double y = v41;
        v62.size.double width = v42;
        v62.size.double height = v43;
        v60.origin.double x = x;
        v60.origin.double y = y;
        v60.size.double width = width;
        v60.size.double height = height;
        CGRect v61 = CGRectUnion(v60, v62);
        double x = v61.origin.x;
        double y = v61.origin.y;
        double width = v61.size.width;
        double height = v61.size.height;
        goto LABEL_64;
      }
      if (v31 == -1 && !v5) {
        break;
      }
      if (v31 == -1) {
        goto LABEL_57;
      }
      BOOL v34 = v31 == -2;
      if (v31 == -2 && v5 && v12 == a3)
      {
        if ([(NSMutableArray *)self->mTextures count] != a3) {
          goto LABEL_58;
        }
        BOOL v34 = 1;
      }
      int v37 = !v5;
      if (v31 != -2) {
        int v37 = 0;
      }
      if (v37 & v52) {
        goto LABEL_58;
      }
      if (v34) {
        goto LABEL_57;
      }
LABEL_64:
      uint64_t v22 = v28;
      BOOL v17 = [(NSMutableArray *)self->mTextures count] > (unint64_t)v28++;
      if (!v17) {
        goto LABEL_67;
      }
    }
    if (v53) {
      goto LABEL_58;
    }
LABEL_57:
    if ([(NSMutableArray *)self->mTextures count] == 1) {
      goto LABEL_58;
    }
    goto LABEL_64;
  }
  double v23 = 0;
LABEL_67:
  if ((v51 & 1) != 0 && (unint64_t)[v8 count] >= 2 && v23)
  {
    id v44 = -[TSDTextureSet newFlattenedTextureFromTextures:newRect:](self, "newFlattenedTextureFromTextures:newRect:", v8, x, y, width, height);
    objc_msgSend(v44, "setOffset:", x, y);
    [v44 setParent:self];
    [v44 setIsFlattened:1];
    -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->mStageIndexForTexture, "setObject:forUncopiedKey:", [NSNumber numberWithInteger:a3], v44);
    [v44 renderLayerContentsIfNeeded];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v45 = [v8 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v55 != v47) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * i), "layer"), "setHidden:", 1);
        }
        uint64_t v46 = [v8 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v46);
    }
    -[CALayer insertSublayer:above:](self->mLayer, "insertSublayer:above:", [v44 layer], objc_msgSend(v23, "layer"));
    [(NSMutableArray *)self->mAllTextures insertObject:v44 atIndex:[(NSMutableArray *)self->mAllTextures indexOfObject:v23] + 1];
    [(NSMutableArray *)self->mTextures insertObject:v44 atIndex:[(NSMutableArray *)self->mTextures indexOfObject:v23] + 1];
    [v8 removeAllObjects];
    [v8 addObject:v44];
  }
  return v8;
}

- (void)removeRenderable:(id)a3
{
  -[NSMutableArray removeObject:](self->mAllTextures, "removeObject:");
  [(NSMutableArray *)self->mTextures removeObject:a3];
  BOOL v5 = (void *)[a3 layer];

  [v5 removeFromSuperlayer];
}

- (id)firstVisibleTextureForTextureType:(int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mTextures = self->mTextures;
  uint64_t v5 = [(NSMutableArray *)mTextures countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(mTextures);
    }
    long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 textureType] == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)mTextures countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)newFlattenedTextureFromTextures:(id)a3 newRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v8 = (void *)[a3 copy];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__TSDTextureSet_newFlattenedTextureFromTextures_newRect___block_invoke;
  v13[3] = &unk_2646B1C98;
  *(double *)&v13[5] = x;
  *(double *)&v13[6] = y;
  *(double *)&v13[7] = width;
  *(CGFloat *)&v13[8] = height;
  v13[4] = v8;
  double v9 = TSDCeilSize(width);
  long long v11 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:]([TSDTexturedRectangle alloc], "initWithSize:offset:renderBlock:", v13, v9, v10, x, y);

  return v11;
}

uint64_t __57__TSDTextureSet_newFlattenedTextureFromTextures_newRect___block_invoke(uint64_t a1, CGContextRef c)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  CGContextTranslateCTM(c, 0.0, *(CGFloat *)(a1 + 64));
  CGContextScaleCTM(c, 1.0, -1.0);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t result = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        [v9 frame];
        CGFloat v11 = v10 - *(double *)(a1 + 40);
        CGFloat v14 = *(double *)(a1 + 48) + *(double *)(a1 + 64) - (v12 + v13);
        [v9 frame];
        CGFloat v16 = v15;
        [v9 frame];
        CGFloat v18 = v17;
        [v9 textureOpacity];
        CGContextSetAlpha(c, v19);
        CGFloat v20 = (CGImage *)[v9 image];
        v27.origin.double x = v11;
        v27.origin.double y = v14;
        v27.size.double width = v16;
        v27.size.CGFloat height = v18;
        CGContextDrawImage(c, v27, v20);
        [MEMORY[0x263F158F8] begin];
        [MEMORY[0x263F158F8] setDisableActions:1];
        objc_msgSend((id)objc_msgSend(v9, "layer"), "setHidden:", 1);
        [MEMORY[0x263F158F8] commit];
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

- (id)newFlattenedTexture
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  double x = *MEMORY[0x263F001A0];
  double y = *(double *)(MEMORY[0x263F001A0] + 8);
  double width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [(TSDTextureSet *)self visibleTextures];
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v11), "layer"), "frame");
        v28.origin.double x = v12;
        v28.origin.double y = v13;
        v28.size.double width = v14;
        v28.size.CGFloat height = v15;
        v26.origin.double x = x;
        v26.origin.double y = y;
        v26.size.double width = width;
        v26.size.CGFloat height = height;
        CGRect v27 = CGRectUnion(v26, v28);
        double x = v27.origin.x;
        double y = v27.origin.y;
        double width = v27.size.width;
        CGFloat height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __36__TSDTextureSet_newFlattenedTexture__block_invoke;
  v19[3] = &unk_2646B1C98;
  *(double *)&v19[5] = x;
  *(double *)&v19[6] = y;
  *(double *)&v19[7] = width;
  *(CGFloat *)&v19[8] = height;
  v19[4] = self;
  double v16 = TSDCeilSize(width);
  return -[TSDTexturedRectangle initWithSize:offset:renderBlock:]([TSDTexturedRectangle alloc], "initWithSize:offset:renderBlock:", v19, v16, v17, x, y);
}

void __36__TSDTextureSet_newFlattenedTexture__block_invoke(uint64_t a1, CGContextRef c)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CGContextSaveGState(c);
  CGContextTranslateCTM(c, -*(double *)(a1 + 40), -*(double *)(a1 + 48));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "visibleTextures", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        [MEMORY[0x263F158F8] begin];
        [MEMORY[0x263F158F8] setDisableActions:1];
        objc_msgSend((id)objc_msgSend(v9, "layer"), "setHidden:", 0);
        [v9 renderIntoContext:c];
        objc_msgSend((id)objc_msgSend(v9, "layer"), "setHidden:", 1);
        [MEMORY[0x263F158F8] commit];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  CGContextRestoreGState(c);
}

- (int64_t)stageIndexForTexture:(id)a3
{
  objc_super v3 = (void *)[(TSUNoCopyDictionary *)self->mStageIndexForTexture objectForKey:a3];
  if (!v3) {
    return -1;
  }

  return [v3 integerValue];
}

- (id)finalTextureForStage:(int64_t)a3 reverse:(BOOL)a4
{
  uint64_t v4 = 112;
  if (a4) {
    uint64_t v4 = 136;
  }
  uint64_t v5 = *(Class *)((char *)&self->super.isa + v4);
  uint64_t v6 = [NSNumber numberWithInteger:a3];

  return (id)[v5 objectForKey:v6];
}

- (void)hideLayersOfFinalTextures
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  objc_super v3 = (void *)[(NSMutableDictionary *)self->mFinalTextureForStage objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v36;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v35 + 1) + 8 * v7);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v41 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v32;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v32 != v11) {
                objc_enumerationMutation(v8);
              }
              objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v12++), "layer"), "setHidden:", 1);
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v41 count:16];
          }
          while (v10);
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v5);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v13 = (void *)[(NSMutableDictionary *)self->mReverseFinalTextureForStage objectEnumerator];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        CGFloat v18 = *(void **)(*((void *)&v27 + 1) + 8 * v17);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v39 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v24;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v24 != v21) {
                objc_enumerationMutation(v18);
              }
              objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v22++), "layer"), "setHidden:", 1);
            }
            while (v20 != v22);
            uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v39 count:16];
          }
          while (v20);
        }
        ++v17;
      }
      while (v17 != v15);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v40 count:16];
    }
    while (v15);
  }
}

- (void)setLayerGeometryFromRep:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "canvas"), "viewScale");
  double v6 = v5;
  if (self->mIsMagicMove)
  {
    [a3 naturalBounds];
    objc_msgSend(a3, "convertNaturalRectToUnscaledCanvas:");
    double v11 = TSDMultiplyRectScalar(v7, v8, v9, v10, v6);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [a3 naturalBounds];
    [(CALayer *)self->mLayer setBounds:TSDMultiplyRectScalar(v18, v19, v20, v21, v6)];
    [(CALayer *)self->mLayer setPosition:TSDCenterOfRect(v11, v13, v15, v17)];
    if (!self->mShouldTransformUsingTextureCenter)
    {
      [a3 centerForRotation];
      double v24 = TSDMultiplyPointScalar(v22, v23, v6);
LABEL_12:
      self->mCenter.double x = v24;
      self->mCenter.CGFloat y = v25;
    }
  }
  else
  {
    mLayer = self->mLayer;
    long long v27 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    v70[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    v70[5] = v27;
    long long v28 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    v70[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    v70[7] = v28;
    long long v29 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v70[0] = *MEMORY[0x263F15740];
    v70[1] = v29;
    long long v30 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    v70[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    v70[3] = v30;
    [(CALayer *)mLayer setTransform:v70];
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layout"), "geometry"), "frame");
    double x = TSDMultiplyRectScalar(v31, v32, v33, v34, v6);
    CGFloat y = v36;
    CGFloat width = v38;
    CGFloat height = v40;
    if ([a3 textureActionAttributes])
    {
      CGFloat v42 = objc_msgSend((id)objc_msgSend(a3, "textureActionAttributes"), "valueForKey:", @"sfx-action-rotation-angle");
      if (v42)
      {
        [v42 floatValue];
        CGFloat v44 = v43 * 0.0174532925;
        double v45 = TSDCenterOfRect(x, y, width, height);
        double v47 = v46;
        memset(&v69, 0, sizeof(v69));
        CGAffineTransformMakeTranslation(&v69, v45, v46);
        CGAffineTransform v67 = v69;
        CGAffineTransformRotate(&v68, &v67, v44);
        CGAffineTransform v69 = v68;
        CGAffineTransform v67 = v68;
        CGAffineTransformTranslate(&v68, &v67, -v45, -v47);
        CGAffineTransform v69 = v68;
        v71.origin.double x = x;
        v71.origin.CGFloat y = y;
        v71.size.CGFloat width = width;
        v71.size.CGFloat height = height;
        CGRect v72 = CGRectApplyAffineTransform(v71, &v68);
        double x = v72.origin.x;
        CGFloat y = v72.origin.y;
        CGFloat width = v72.size.width;
        CGFloat height = v72.size.height;
      }
    }
    -[CALayer setFrame:](self->mLayer, "setFrame:", x, y, width, height);
    if (!self->mShouldTransformUsingTextureCenter)
    {
      [a3 centerForRotation];
      double v62 = v49;
      double v63 = v48;
      uint64_t v50 = (void *)[a3 layout];
      if (v50)
      {
        [v50 transformInRoot];
        float64x2_t v51 = v64;
        float64x2_t v52 = v65;
        float64x2_t v53 = v66;
      }
      else
      {
        float64x2_t v53 = 0uLL;
        float64x2_t v51 = 0uLL;
        float64x2_t v52 = 0uLL;
      }
      float64x2_t v54 = vaddq_f64(v53, vmlaq_n_f64(vmulq_n_f64(v52, v62), v51, v63));
      double v55 = TSDMultiplyPointScalar(v54.f64[0], v54.f64[1], v6);
      double v24 = TSDSubtractPoints(v55, v56, x);
      goto LABEL_12;
    }
  }
  [(CALayer *)self->mLayer frame];
  self->mOriginalPosition.double x = TSDCenterOfRect(v57, v58, v59, v60);
  self->mOriginalPosition.CGFloat y = v61;
}

- (void)adjustAnchorPointRelativeToCenterOfRotation
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mAllTextures = self->mAllTextures;
  uint64_t v4 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(mAllTextures);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "adjustAnchorRelativeToParentsCenterOfRotation:isMagicMove:", 0, self->mCenter.x, self->mCenter.y);
      }
      uint64_t v5 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)resetAnchorPoint
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  mAllTextures = self->mAllTextures;
  uint64_t v3 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(mAllTextures);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) resetAnchorPoint];
      }
      uint64_t v4 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)p_resetAttributesWithViewScale:(double)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  -[CALayer setPosition:](self->mLayer, "setPosition:", self->mOriginalPosition.x, self->mOriginalPosition.y);
  if (self->mAlternateLayer)
  {
    [(CALayer *)self->mLayer position];
    -[CALayer setPosition:](self->mAlternateLayer, "setPosition:");
    LODWORD(v4) = 1.0;
    [(CALayer *)self->mAlternateLayer setOpacity:v4];
    mAlternateLayer = self->mAlternateLayer;
    long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    v41[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    v41[5] = v6;
    long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    v41[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    v41[7] = v7;
    long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v41[0] = *MEMORY[0x263F15740];
    v41[1] = v8;
    long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    v41[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    v41[3] = v9;
    [(CALayer *)mAlternateLayer setTransform:v41];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  mAllTextures = self->mAllTextures;
  uint64_t v11 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    long long v30 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v31 = *MEMORY[0x263F000D0];
    long long v29 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(mAllTextures);
        }
        CGFloat v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        *(_OWORD *)&v36.a = v31;
        *(_OWORD *)&v36.c = v30;
        *(_OWORD *)&v36.tdouble x = v29;
        if (self->mIsMagicMove
          && self->mTextureAngle != 0.0
          && [v15 textureType] != 9
          && [v15 textureType] != 3)
        {
          double x = self->mCenter.x;
          objc_msgSend((id)objc_msgSend(v15, "layer"), "position");
          CGFloat v18 = x - v17;
          double y = self->mCenter.y;
          objc_msgSend((id)objc_msgSend(v15, "layer"), "position");
          *(_OWORD *)&v35.a = v31;
          *(_OWORD *)&v35.c = v30;
          *(_OWORD *)&v35.tdouble x = v29;
          CGAffineTransformTranslate(&v36, &v35, v18, y - v20);
          CGFloat v21 = -self->mTextureAngle;
          CGAffineTransform v34 = v36;
          CGAffineTransformRotate(&v35, &v34, v21);
          CGAffineTransform v36 = v35;
          objc_msgSend((id)objc_msgSend(v15, "layer"), "position");
          CGFloat v23 = v22 - self->mCenter.x;
          objc_msgSend((id)objc_msgSend(v15, "layer"), "position");
          CGFloat v25 = v24 - self->mCenter.y;
          CGAffineTransform v34 = v36;
          CGAffineTransformTranslate(&v35, &v34, v23, v25);
          CGAffineTransform v36 = v35;
        }
        CGAffineTransform v33 = v36;
        long long v26 = objc_msgSend(v15, "layer", v29, v30, v31);
        CGAffineTransform v32 = v33;
        [v26 setAffineTransform:&v32];
        [v15 originalPosition];
        objc_msgSend((id)objc_msgSend(v15, "layer"), "setPosition:", v27, v28);
      }
      uint64_t v12 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v12);
  }
}

- (void)p_applyPositionFromAttributes:(id)a3 viewScale:(double)a4
{
  long long v6 = (void *)[a3 valueForKey:@"New Position Delta"];
  if (v6)
  {
    [v6 CGPointValue];
    double v9 = TSDMultiplyPointScalar(v7, v8, a4);
    [(CALayer *)self->mLayer setPosition:TSDAddPoints(self->mOriginalPosition.x, self->mOriginalPosition.y, v9)];
    if (self->mAlternateLayer)
    {
      [(CALayer *)self->mLayer position];
      mAlternateLayer = self->mAlternateLayer;
      -[CALayer setPosition:](mAlternateLayer, "setPosition:");
    }
  }
}

- (void)applyActionEffect:(id)a3 viewScale:(double)a4 isMagicMove:(BOOL)a5 shouldBake:(BOOL)a6 applyScaleOnly:(BOOL)a7 ignoreScale:(BOOL)a8 shouldCheckActionKeys:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v12 = a6;
  BOOL v13 = a5;
  id v15 = a3;
  uint64_t v91 = *MEMORY[0x263EF8340];
  if (!a6)
  {
LABEL_9:
    unint64_t v17 = 0x263F15000uLL;
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    if (!v15 && !self->mIsMagicMove)
    {
      [(TSDTextureSet *)self p_resetAttributesWithViewScale:a4];
LABEL_65:
      [*(id *)(v17 + 2296) commit];
      return;
    }
    CGFloat v18 = (void *)[v15 valueForKey:@"sfx-action-color-alpha"];
    CGFloat v19 = v18;
    if (v18)
    {
      [v18 floatValue];
      double v21 = (float)(v20 / 100.0);
    }
    else
    {
      double v21 = 1.0;
    }
    double v22 = (void *)[v15 valueForKey:@"sfx-action-rotation-angle"];
    uint64_t v23 = [v15 valueForKey:@"sfx-action-rotation-direction"];
    if (v22)
    {
      double v24 = (void *)v23;
      [v22 floatValue];
      double v26 = v25 * 0.0174532925;
      if (v24 && [v24 intValue] == 32) {
        double v26 = -v26;
      }
      double v27 = (void *)[v15 valueForKey:@"sfx-action-scale-size"];
      if (!v27)
      {
        double v28 = 1.0;
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v29 = [v15 valueForKey:@"sfx-action-scale-size"];
      if (!v29)
      {
        double v28 = 1.0;
        double v26 = 0.0;
        if (!self->mIsMagicMove)
        {
          int v43 = 1;
          unint64_t v17 = 0x263F15000;
          BOOL v32 = v12;
          if (!v19) {
            goto LABEL_53;
          }
          goto LABEL_52;
        }
        double v27 = 0;
LABEL_28:
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v77 = __117__TSDTextureSet_applyActionEffect_viewScale_isMagicMove_shouldBake_applyScaleOnly_ignoreScale_shouldCheckActionKeys___block_invoke;
        v78 = &unk_2646B1CC0;
        BOOL v84 = a7;
        BOOL v85 = v13;
        BOOL v86 = v9;
        double v82 = v28;
        double v83 = v26;
        BOOL v87 = a8;
        v79 = v22;
        v80 = v27;
        BOOL v32 = v12;
        BOOL v88 = v12;
        v81 = self;
        mAlternateLayer = self->mAlternateLayer;
        if (mAlternateLayer)
        {
          __117__TSDTextureSet_applyActionEffect_viewScale_isMagicMove_shouldBake_applyScaleOnly_ignoreScale_shouldCheckActionKeys___block_invoke((uint64_t)v76, 0, mAlternateLayer);
          char v34 = 1;
          goto LABEL_51;
        }
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        mAllTextures = self->mAllTextures;
        uint64_t v36 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v72 objects:v90 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          BOOL v63 = v12;
          id v64 = v15;
          uint64_t v38 = *(void *)v73;
          if (!v22) {
            BOOL v13 = 0;
          }
          char v34 = 1;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v73 != v38) {
                objc_enumerationMutation(mAllTextures);
              }
              long long v40 = *(void **)(*((void *)&v72 + 1) + 8 * i);
              uint64_t v41 = [v40 layer];
              v77((uint64_t)v76, v40, (void *)v41);
              if (v9 && objc_msgSend((id)objc_msgSend(v40, "layer"), "valueForKey:", @"apple:action-motion-path")) {
                char v34 = 0;
              }
              if (v13)
              {
                if (![v40 attributes]) {
                  objc_msgSend(v40, "setAttributes:", objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", 1));
                }
                CGFloat v42 = (void *)[v40 attributes];
                objc_msgSend(v42, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", v26 * -57.2957795), @"kSFXAngle");
              }
            }
            uint64_t v37 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v72 objects:v90 count:16];
          }
          while (v37);
          id v15 = v64;
          BOOL v32 = v63;
          if (!v13)
          {
LABEL_51:
            self->mIsBaked = v32;
            int v43 = v34 & 1;
            unint64_t v17 = 0x263F15000uLL;
            if (!v19)
            {
LABEL_53:
              if (v43) {
                [(TSDTextureSet *)self p_applyPositionFromAttributes:v15 viewScale:a4];
              }
              if (v32)
              {
                long long v70 = 0u;
                long long v71 = 0u;
                long long v68 = 0u;
                long long v69 = 0u;
                CGFloat v44 = (void *)[(NSMutableDictionary *)self->mBoundingRectForStage allKeys];
                uint64_t v45 = [v44 countByEnumeratingWithState:&v68 objects:v89 count:16];
                if (v45)
                {
                  uint64_t v46 = v45;
                  uint64_t v47 = *(void *)v69;
                  double v48 = (_OWORD *)MEMORY[0x263F000D0];
                  do
                  {
                    for (uint64_t j = 0; j != v46; ++j)
                    {
                      if (*(void *)v69 != v47) {
                        objc_enumerationMutation(v44);
                      }
                      uint64_t v50 = *(void **)(*((void *)&v68 + 1) + 8 * j);
                      float64x2_t v51 = (void *)[(NSMutableDictionary *)self->mBoundingRectForStage objectForKey:v50];
                      if (v51)
                      {
                        [v51 CGRectValue];
                        CGFloat v53 = v52;
                        CGFloat v55 = v54;
                        CGFloat v57 = v56;
                        CGFloat v59 = v58;
                        long long v60 = v48[1];
                        *(_OWORD *)&v67.a = *v48;
                        *(_OWORD *)&v67.c = v60;
                        *(_OWORD *)&v67.tdouble x = v48[2];
                        double x = self->mCenter.x;
                        double y = self->mCenter.y;
                        *(_OWORD *)&v66.a = *(_OWORD *)&v67.a;
                        *(_OWORD *)&v66.c = v60;
                        *(_OWORD *)&v66.tdouble x = *(_OWORD *)&v67.tx;
                        CGAffineTransformTranslate(&v67, &v66, x, y);
                        CGAffineTransform v65 = v67;
                        CGAffineTransformScale(&v66, &v65, v28, v28);
                        CGAffineTransform v67 = v66;
                        CGAffineTransform v65 = v66;
                        CGAffineTransformRotate(&v66, &v65, v26);
                        CGAffineTransform v67 = v66;
                        CGAffineTransform v65 = v66;
                        CGAffineTransformTranslate(&v66, &v65, -x, -y);
                        CGAffineTransform v67 = v66;
                        v93.origin.double x = v53;
                        v93.origin.double y = v55;
                        v93.size.CGFloat width = v57;
                        v93.size.CGFloat height = v59;
                        CGRect v94 = CGRectApplyAffineTransform(v93, &v66);
                        -[TSDTextureSet setBoundingRect:forStage:](self, "setBoundingRect:forStage:", (int)[v50 intValue], v94.origin.x, v94.origin.y, v94.size.width, v94.size.height);
                      }
                    }
                    uint64_t v46 = [v44 countByEnumeratingWithState:&v68 objects:v89 count:16];
                  }
                  while (v46);
                }
              }
              goto LABEL_65;
            }
LABEL_52:
            self->mTextureOpacitdouble y = v21;
            *(float *)&double v30 = v21;
            [(CALayer *)self->mLayer setOpacity:v30];
            goto LABEL_53;
          }
        }
        else
        {
          char v34 = 1;
          if (!v22 || !v13) {
            goto LABEL_51;
          }
        }
        [(TSDTextureSet *)self setTextureAngle:-v26];
        goto LABEL_51;
      }
      double v27 = (void *)v29;
      double v26 = 0.0;
    }
    [v27 floatValue];
    if (v31 == 0.0) {
      double v28 = 0.00001;
    }
    else {
      double v28 = v31;
    }
    goto LABEL_28;
  }
  if (!self->mIsBaked || !self->mBakedAttributes || !objc_msgSend(a3, "isEqualToDictionary:"))
  {

    self->mBakedAttributes = (NSDictionary *)[v15 copy];
    goto LABEL_9;
  }

  [(TSDTextureSet *)self p_applyPositionFromAttributes:v15 viewScale:a4];
}

uint64_t __117__TSDTextureSet_applyActionEffect_viewScale_isMagicMove_shouldBake_applyScaleOnly_ignoreScale_shouldCheckActionKeys___block_invoke(uint64_t result, void *a2, void *a3)
{
  uint64_t v5 = result;
  if (*(unsigned char *)(result + 72)) {
    BOOL v6 = *(double *)(result + 56) != 1.0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!*(unsigned char *)(result + 73) && !v6)
  {
    if (*(void *)(result + 32))
    {
      if (!*(unsigned char *)(result + 74) || (uint64_t result = [a3 valueForKey:@"apple:action-rotation"]) == 0) {
        uint64_t result = objc_msgSend(a3, "setValue:forKeyPath:", objc_msgSend(NSNumber, "numberWithDouble:", *(double *)(v5 + 64)), @"transform.rotation.z");
      }
    }
  }
  double v7 = *(double *)(v5 + 56);
  if (!*(unsigned char *)(v5 + 75))
  {
    if (*(void *)(v5 + 40))
    {
      if (!*(unsigned char *)(v5 + 74) || (uint64_t result = [a3 valueForKey:@"apple:action-scale"]) == 0)
      {
        objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"kTSDTextureLayerKeyBakedScale"), "doubleValue");
        if (v11 != 0.0 && !*(unsigned char *)(v5 + 76) && !*(unsigned char *)(v5 + 72)) {
          double v7 = *(double *)(v5 + 56) / v11;
        }
        uint64_t result = objc_msgSend(a3, "setValue:forKeyPath:", objc_msgSend(NSNumber, "numberWithDouble:", v7), @"transform.scale.xy");
      }
    }
  }
  if (a2)
  {
    uint64_t v8 = *(void *)(v5 + 48);
    if (*(void **)(v8 + 264) != a3)
    {
      uint64_t result = objc_msgSend(a2, "adjustAnchorRelativeToParentsCenterOfRotation:isMagicMove:", *(unsigned __int8 *)(v5 + 73), *(double *)(v8 + 8), *(double *)(v8 + 16));
      int v9 = *(unsigned char *)(v5 + 76) || v6;
      if (v9 == 1)
      {
        double v10 = 0.0;
        if (*(unsigned char *)(v5 + 76) && !*(unsigned char *)(v5 + 73)) {
          double v10 = *(double *)(v5 + 64);
        }
        uint64_t result = [a2 bakeLayerWithAngle:v10 scale:v7];
        if (v6 && !*(unsigned char *)(v5 + 73) && !*(unsigned char *)(v5 + 76) && *(double *)(v5 + 64) != 0.0)
        {
          uint64_t v12 = objc_msgSend(NSNumber, "numberWithDouble:");
          return [a3 setValue:v12 forKeyPath:@"transform.rotation.z"];
        }
      }
    }
  }
  return result;
}

- (BOOL)isBackgroundTexture:(id)a3
{
  return [(TSDTextureSet *)self stageIndexForTexture:a3] == -1;
}

- (void)setBoundingRect:(CGRect)a3
{
  self->mBounds = a3;
  CGFloat MidX = CGRectGetMidX(a3);
  CGFloat MidY = CGRectGetMidY(self->mBounds);
  self->mCenter.double x = MidX;
  self->mCenter.double y = MidY;
}

- (void)setBoundingRect:(CGRect)a3 forStage:(int64_t)a4
{
  mBoundingRectForStage = self->mBoundingRectForStage;
  uint64_t v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v7 = [NSNumber numberWithInteger:a4];

  [(NSMutableDictionary *)mBoundingRectForStage setObject:v6 forKey:v7];
}

- (void)setContentRect:(CGRect)a3 forStage:(int64_t)a4
{
  mContentRectForStage = self->mContentRectForStage;
  uint64_t v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v7 = [NSNumber numberWithInteger:a4];

  [(NSMutableDictionary *)mContentRectForStage setObject:v6 forKey:v7];
}

- (CGRect)frame
{
  [(CALayer *)self->mLayer frame];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setIsBaked:(BOOL)a3
{
  if (self->mIsBaked && !a3)
  {

    self->mBakedAttributes = 0;
  }
  self->mIsBaked = a3;
}

- (void)renderIntoContext:(CGContext *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (![(CALayer *)self->mLayer isHidden])
  {
    [(CALayer *)self->mLayer frame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGContextSaveGState(a3);
    CGContextTranslateCTM(a3, v6, v8);
    mTextureOpacitdouble y = self->mTextureOpacity;
    if (mTextureOpacity != 1.0)
    {
      CGContextSetAlpha(a3, mTextureOpacity);
      CGContextBeginTransparencyLayer(a3, 0);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    mAllTextures = self->mAllTextures;
    uint64_t v11 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(mAllTextures);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) renderIntoContext:a3];
        }
        uint64_t v12 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
    if (self->mTextureOpacity != 1.0) {
      CGContextEndTransparencyLayer(a3);
    }
    CGContextRestoreGState(a3);
  }
}

- (BOOL)isRenderable
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->mAllTextures count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    mAllTextures = self->mAllTextures;
    uint64_t v4 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      int v7 = 1;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(mAllTextures);
          }
          v7 &= [*(id *)(*((void *)&v10 + 1) + 8 * i) isRenderable];
        }
        uint64_t v5 = [(NSMutableArray *)mAllTextures countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)addPerspectiveLayerToTexture:(id)a3 withShowSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  CGFloat v8 = (CALayer *)objc_msgSend((id)objc_msgSend(a3, "layer"), "superlayer");
  if (v8 == [(TSDTextureSet *)self layer])
  {
    id v9 = (id)[a3 layer];
    id v17 = objc_alloc_init(MEMORY[0x263F157E8]);
    [(CALayer *)[(TSDTextureSet *)self layer] frame];
    double v11 = TSDSubtractPoints(width * 0.5, height * 0.5, v10);
    double v13 = v12;
    [(CALayer *)[(TSDTextureSet *)self layer] bounds];
    double v15 = v11 / v14;
    [(CALayer *)[(TSDTextureSet *)self layer] bounds];
    objc_msgSend(v17, "setAnchorPoint:", v15, v13 / v16);
    objc_msgSend(v17, "setPosition:", v11, v13);
    [(CALayer *)[(TSDTextureSet *)self layer] bounds];
    objc_msgSend(v17, "setBounds:");
    [v17 setName:@"Perspective layer"];
    [(CALayer *)[(TSDTextureSet *)self layer] replaceSublayer:v9 with:v17];
    [v17 addSublayer:v9];
    objc_msgSend(v17, "addPerspectiveSublayerProjectionUsingScreenSize:", width, height);
  }
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [(TSDTextureSet *)self frame];
  uint64_t v7 = v6;
  [(TSDTextureSet *)self frame];
  uint64_t v9 = v8;
  [(TSDTextureSet *)self frame];
  uint64_t v11 = v10;
  [(TSDTextureSet *)self frame];
  return (id)[v3 stringWithFormat:@"<%@: %p frame(%.1f,%.1f,%.1f,%.1f) count(%ld) textures:%@>", v5, self, v7, v9, v11, v12, -[NSMutableArray count](self->mAllTextures, "count"), self->mAllTextures];
}

- (NSArray)allTextures
{
  return &self->mAllTextures->super;
}

- (CALayer)alternateLayer
{
  return self->mAlternateLayer;
}

- (void)setAlternateLayer:(id)a3
{
}

- (CGRect)boundingRect
{
  double x = self->mBounds.origin.x;
  double y = self->mBounds.origin.y;
  double width = self->mBounds.size.width;
  double height = self->mBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSDictionary)boundingRectForStage
{
  return &self->mBoundingRectForStage->super;
}

- (void)setBoundingRectForStage:(id)a3
{
}

- (CGPoint)center
{
  double x = self->mCenter.x;
  double y = self->mCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->mCenter = a3;
}

- (unint64_t)chunkCount
{
  return self->mChunkCount;
}

- (CGColorSpace)colorSpace
{
  return self->mColorSpace;
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  self->mColorSpace = a3;
}

- (NSDictionary)contentRectForStage
{
  return &self->mContentRectForStage->super;
}

- (void)setContentRectForStage:(id)a3
{
}

- (BOOL)isBackground
{
  return self->mIsBackground;
}

- (void)setIsBackground:(BOOL)a3
{
  self->mIsBackground = a3;
}

- (BOOL)isBaked
{
  return self->mIsBaked;
}

- (BOOL)isMagicMove
{
  return self->mIsMagicMove;
}

- (void)setIsMagicMove:(BOOL)a3
{
  self->mIsMagicMove = a3;
}

- (int64_t)maxStageIndex
{
  return self->mMaxStageIndex;
}

- (CGPoint)originalPosition
{
  double x = self->mOriginalPosition.x;
  double y = self->mOriginalPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalPosition:(CGPoint)a3
{
  self->mOriginalPosition = a3;
}

- (BOOL)shouldIncludeFinalTexturesInVisibleSet
{
  return self->mShouldIncludeFinalTexturesInVisibleSet;
}

- (void)setShouldIncludeFinalTexturesInVisibleSet:(BOOL)a3
{
  self->mShouldIncludeFinalTexturesInVisibleSet = a3;
}

- (BOOL)shouldTransformUsingTextureCenter
{
  return self->mShouldTransformUsingTextureCenter;
}

- (void)setShouldTransformUsingTextureCenter:(BOOL)a3
{
  self->mShouldTransformUsingTextureCenter = a3;
}

- (CGRect)textureContentRect
{
  double x = self->mTextureContentRect.origin.x;
  double y = self->mTextureContentRect.origin.y;
  double width = self->mTextureContentRect.size.width;
  double height = self->mTextureContentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTextureContentRect:(CGRect)a3
{
  self->mTextureContentRect = a3;
}

- (double)textureAngle
{
  return self->mTextureAngle;
}

- (void)setTextureAngle:(double)a3
{
  self->mTextureAngle = a3;
}

- (double)textureOpacity
{
  return self->mTextureOpacity;
}

- (void)setTextureOpacity:(double)a3
{
  self->mTextureOpacitdouble y = a3;
}

- (int64_t)textureZOrder
{
  return self->mTextureZOrder;
}

- (void)setTextureZOrder:(int64_t)a3
{
  self->mTextureZOrder = a3;
}

- (TSDRep)rep
{
  return self->mRep;
}

- (void)setRep:(id)a3
{
  self->mRep = (TSDRep *)a3;
}

- (int64_t)stageIndex
{
  return self->_stageIndex;
}

@end
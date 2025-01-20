@interface TSDDefaultPartitioner
- (BOOL)didHint:(id)a3 syncWithNextHint:(id)a4 horizontally:(BOOL)a5 delta:(int)a6;
- (CGImage)i_cachedImageForCanvas:(id)a3;
- (TSDDefaultPartitioner)initWithInfo:(id)a3;
- (id)documentRoot;
- (id)hintForLayout:(id)a3;
- (id)i_layout;
- (id)i_repForCanvas:(id)a3;
- (id)layoutForHint:(id)a3 parentLayout:(id)a4;
- (id)nextHintForSize:(CGSize)a3 parentLayout:(id)a4 previousHint:(id)a5 horizontally:(BOOL)a6 outFinished:(BOOL *)a7;
- (id)nextLayoutForSize:(CGSize)a3 parentLayout:(id)a4 previousHint:(id)a5 horizontally:(BOOL)a6 outFinished:(BOOL *)a7;
- (id)p_firstHintForSize:(CGSize)a3;
- (id)p_nextHintForSize:(CGSize)a3 previousHint:(id)a4 horizontally:(BOOL)a5;
- (unint64_t)p_edgesForHintBounds:(CGRect)a3;
- (void)dealloc;
- (void)i_registerPartialRep:(id)a3;
- (void)i_removeCachedImageForCanvas:(id)a3;
- (void)i_setCachedImage:(CGImage *)a3 forCanvas:(id)a4;
- (void)i_unregisterPartialRep:(id)a3;
- (void)p_generateLayouts;
- (void)p_teardownLayouts;
@end

@implementation TSDDefaultPartitioner

- (TSDDefaultPartitioner)initWithInfo:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSDDefaultPartitioner;
  v4 = [(TSDDefaultPartitioner *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mInfo = (TSDInfo *)a3;
    [(TSDDefaultPartitioner *)v4 p_generateLayouts];
    v5->mMainRepsByCanvas = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x263F7C8A8]);
    v5->mCachedImagesByCanvas = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x263F7C8A8]);
    v5->mPartialRepsByCanvas = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x263F7C8A8]);
  }
  return v5;
}

- (void)dealloc
{
  [(TSDDefaultPartitioner *)self p_teardownLayouts];

  v3.receiver = self;
  v3.super_class = (Class)TSDDefaultPartitioner;
  [(TSDDefaultPartitioner *)&v3 dealloc];
}

- (id)hintForLayout:(id)a3
{
  objc_opt_class();
  id result = (id)TSUDynamicCast();
  if (result)
  {
    [result bounds];
    v9 = -[TSDDefaultHint initWithBounds:edges:]([TSDDefaultHint alloc], "initWithBounds:edges:", -[TSDDefaultPartitioner p_edgesForHintBounds:](self, "p_edgesForHintBounds:"), v5, v6, v7, v8);
    return v9;
  }
  return result;
}

- (BOOL)didHint:(id)a3 syncWithNextHint:(id)a4 horizontally:(BOOL)a5 delta:(int)a6
{
  if (a6) {
    return 0;
  }
  BOOL v7 = a5;
  objc_opt_class();
  double v8 = (void *)TSUDynamicCast();
  objc_opt_class();
  uint64_t v9 = TSUDynamicCast();
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    return 0;
  }
  v11 = (void *)v9;
  [v8 bounds];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  [v11 bounds];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  uint64_t v28 = v13;
  uint64_t v29 = v15;
  uint64_t v30 = v17;
  uint64_t v31 = v19;
  if (v7)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v28);
    v34.origin.x = v21;
    v34.origin.y = v23;
    v34.size.width = v25;
    v34.size.height = v27;
    double MinX = CGRectGetMinX(v34);
  }
  else
  {
    double MaxX = CGRectGetMaxY(*(CGRect *)&v28);
    v35.origin.x = v21;
    v35.origin.y = v23;
    v35.size.width = v25;
    v35.size.height = v27;
    double MinX = CGRectGetMinY(v35);
  }
  return vabdd_f64(MaxX, MinX) < 0.00999999978;
}

- (id)layoutForHint:(id)a3 parentLayout:(id)a4
{
  objc_opt_class();
  uint64_t v5 = TSUDynamicCast();
  if (v5)
  {
    double v6 = (void *)v5;
    BOOL v7 = [TSDPartitionedPartialLayout alloc];
    mInfo = self->mInfo;
    [v6 bounds];
    uint64_t v9 = -[TSDPartitionedPartialLayout initWithInfo:bounds:partitioner:](v7, "initWithInfo:bounds:partitioner:", mInfo, self);
    [(TSDLayout *)v9 validate];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)nextHintForSize:(CGSize)a3 parentLayout:(id)a4 previousHint:(id)a5 horizontally:(BOOL)a6 outFinished:(BOOL *)a7
{
  BOOL v8 = a6;
  if (a5) {
    id v9 = -[TSDDefaultPartitioner p_nextHintForSize:previousHint:horizontally:](self, "p_nextHintForSize:previousHint:horizontally:", a5, a6, a3.width, a3.height);
  }
  else {
    id v9 = -[TSDDefaultPartitioner p_firstHintForSize:](self, "p_firstHintForSize:", a4, a3.width, a3.height);
  }
  BOOL v10 = v9;
  if (a7)
  {
    if (v9) {
      char v11 = [v9 isLastPartitionHorizontally:v8];
    }
    else {
      char v11 = 1;
    }
    *a7 = v11;
  }
  return v10;
}

- (id)nextLayoutForSize:(CGSize)a3 parentLayout:(id)a4 previousHint:(id)a5 horizontally:(BOOL)a6 outFinished:(BOOL *)a7
{
  id v9 = -[TSDDefaultPartitioner nextHintForSize:parentLayout:previousHint:horizontally:outFinished:](self, "nextHintForSize:parentLayout:previousHint:horizontally:outFinished:", a4, a5, a6, a7, a3.width, a3.height);

  return [(TSDDefaultPartitioner *)self layoutForHint:v9 parentLayout:a4];
}

- (id)documentRoot
{
  return 0;
}

- (id)i_layout
{
  id result = self->mLayout;
  if (!result)
  {
    [(TSDDefaultPartitioner *)self p_generateLayouts];
    return self->mLayout;
  }
  return result;
}

- (id)i_repForCanvas:(id)a3
{
  uint64_t v5 = (void *)-[TSUPointerKeyDictionary objectForKey:](self->mMainRepsByCanvas, "objectForKey:");
  if (!v5)
  {
    id v6 = [(TSDDefaultPartitioner *)self i_layout];
    uint64_t v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "repClassOverride")), "initWithLayout:canvas:", v6, a3);
    [v5 updateChildrenFromLayout];
    [v5 recursivelyPerformSelector:sel_updateFromLayout];
    [(TSUPointerKeyDictionary *)self->mMainRepsByCanvas setObject:v5 forUncopiedKey:a3];
  }
  return v5;
}

- (CGImage)i_cachedImageForCanvas:(id)a3
{
  return (CGImage *)[(TSUPointerKeyDictionary *)self->mCachedImagesByCanvas objectForKey:a3];
}

- (void)i_setCachedImage:(CGImage *)a3 forCanvas:(id)a4
{
}

- (void)i_removeCachedImageForCanvas:(id)a3
{
}

- (void)i_registerPartialRep:(id)a3
{
  uint64_t v5 = [a3 canvas];
  id v6 = (id)[(TSUPointerKeyDictionary *)self->mPartialRepsByCanvas objectForKey:v5];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(TSUPointerKeyDictionary *)self->mPartialRepsByCanvas setObject:v6 forUncopiedKey:v5];
  }

  [v6 addObject:a3];
}

- (void)i_unregisterPartialRep:(id)a3
{
  uint64_t v5 = [a3 canvas];
  id v6 = (void *)[(TSUPointerKeyDictionary *)self->mPartialRepsByCanvas objectForKey:v5];
  if (([v6 containsObject:a3] & 1) == 0)
  {
    BOOL v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDDefaultPartitioner i_unregisterPartialRep:]"];
    [v7 handleFailureInFunction:v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultPartitioner.m"), 223, @"Unregistering unregistered rep %@", a3 file lineNumber description];
  }
  [v6 removeObject:a3];
  if (![v6 count])
  {
    [(TSUPointerKeyDictionary *)self->mPartialRepsByCanvas removeObjectForKey:v5];
    objc_msgSend((id)-[TSUPointerKeyDictionary objectForKey:](self->mMainRepsByCanvas, "objectForKey:", v5), "recursivelyPerformSelector:", sel_i_willBeRemoved);
    [(TSUPointerKeyDictionary *)self->mMainRepsByCanvas removeObjectForKey:v5];
    [(TSUPointerKeyDictionary *)self->mCachedImagesByCanvas removeObjectForKey:v5];
    if (![(TSUPointerKeyDictionary *)self->mMainRepsByCanvas count])
    {
      [(TSDDefaultPartitioner *)self p_teardownLayouts];
    }
  }
}

- (void)p_generateLayouts
{
  v8[1] = *MEMORY[0x263EF8340];
  if (self->mLayout)
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDDefaultPartitioner p_generateLayouts]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultPartitioner.m"), 244, @"Can not generate layouts when they’re already present.");
  }
  self->mCanvas = objc_alloc_init(TSDCanvas);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  mInfo = self->mInfo;
  if (isKindOfClass)
  {
    BOOL v7 = (void *)[MEMORY[0x263EFF980] arrayWithObject:self->mInfo];
    if ([(TSDInfo *)mInfo connectedFrom]) {
      objc_msgSend(v7, "addObject:", -[TSDInfo connectedFrom](mInfo, "connectedFrom"));
    }
    if ([(TSDInfo *)mInfo connectedTo]) {
      objc_msgSend(v7, "addObject:", -[TSDInfo connectedTo](mInfo, "connectedTo"));
    }
  }
  else
  {
    v8[0] = self->mInfo;
    BOOL v7 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  [(TSDLayoutController *)[(TSDCanvas *)self->mCanvas layoutController] setInfos:v7];
  [(TSDLayoutController *)[(TSDCanvas *)self->mCanvas layoutController] validateLayouts];
  self->mLayout = (TSDLayout *)[(TSDLayoutController *)[(TSDCanvas *)self->mCanvas layoutController] validatedLayoutForInfo:self->mInfo];
}

- (void)p_teardownLayouts
{
  self->mLayout = 0;
  [(TSDCanvas *)self->mCanvas teardown];

  self->mCanvas = 0;
}

- (id)p_firstHintForSize:(CGSize)a3
{
  objc_msgSend((id)objc_msgSend(-[TSDDefaultPartitioner i_layout](self, "i_layout"), "geometry"), "frame");
  double v4 = TSDRectWithSize();
  uint64_t v8 = -[TSDDefaultHint initWithBounds:edges:]([TSDDefaultHint alloc], "initWithBounds:edges:", -[TSDDefaultPartitioner p_edgesForHintBounds:](self, "p_edgesForHintBounds:"), v4, v5, v6, v7);

  return v8;
}

- (id)p_nextHintForSize:(CGSize)a3 previousHint:(id)a4 horizontally:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  objc_opt_class();
  id v9 = (void *)TSUDynamicCast();
  if (!v9)
  {
    BOOL v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDDefaultPartitioner p_nextHintForSize:previousHint:horizontally:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultPartitioner.m"), 296, @"invalid nil value for '%s'", "previousDefaultHint");
  }
  objc_msgSend((id)objc_msgSend(-[TSDDefaultPartitioner i_layout](self, "i_layout"), "geometry"), "frame");
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  if ([v9 isLastPartitionHorizontally:v5])
  {
    double v20 = 0;
  }
  else
  {
    double v40 = width;
    double v41 = height;
    [v9 bounds];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    uint64_t v29 = v13;
    uint64_t v30 = v15;
    uint64_t v31 = v17;
    uint64_t v32 = v19;
    if (v5)
    {
      double v33 = CGRectGetWidth(*(CGRect *)&v29);
      v43.origin.x = v22;
      v43.origin.y = v24;
      v43.size.CGFloat width = v26;
      v43.size.CGFloat height = v28;
      double v34 = fmin(v33 - CGRectGetMaxX(v43), v40);
      v44.origin.x = v22;
      v44.origin.y = v24;
      v44.size.CGFloat width = v26;
      v44.size.CGFloat height = v28;
      double MaxX = CGRectGetMaxX(v44);
      v45.origin.x = v22;
      v45.origin.y = v24;
      v45.size.CGFloat width = v26;
      v45.size.CGFloat height = v28;
      double MinY = CGRectGetMinY(v45);
      v46.origin.x = v22;
      v46.origin.y = v24;
      v46.size.CGFloat width = v26;
      v46.size.CGFloat height = v28;
      double v37 = CGRectGetHeight(v46);
    }
    else
    {
      double v38 = CGRectGetHeight(*(CGRect *)&v29);
      v47.origin.x = v22;
      v47.origin.y = v24;
      v47.size.CGFloat width = v26;
      v47.size.CGFloat height = v28;
      double v37 = fmin(v38 - CGRectGetMaxY(v47), v41);
      v48.origin.x = v22;
      v48.origin.y = v24;
      v48.size.CGFloat width = v26;
      v48.size.CGFloat height = v28;
      double MaxX = CGRectGetMinX(v48);
      v49.origin.x = v22;
      v49.origin.y = v24;
      v49.size.CGFloat width = v26;
      v49.size.CGFloat height = v28;
      double MinY = CGRectGetMaxY(v49);
      v50.origin.x = v22;
      v50.origin.y = v24;
      v50.size.CGFloat width = v26;
      v50.size.CGFloat height = v28;
      double v34 = CGRectGetWidth(v50);
    }
    double v20 = -[TSDDefaultHint initWithBounds:edges:]([TSDDefaultHint alloc], "initWithBounds:edges:", -[TSDDefaultPartitioner p_edgesForHintBounds:](self, "p_edgesForHintBounds:", MaxX, MinY, v34, v37), MaxX, MinY, v34, v37);
  }

  return v20;
}

- (unint64_t)p_edgesForHintBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_msgSend((id)objc_msgSend(-[TSDDefaultPartitioner i_layout](self, "i_layout"), "geometry"), "frame");
  CGFloat v8 = v7;
  CGFloat v21 = v9;
  CGFloat v22 = v7;
  CGFloat v10 = v9;
  CGFloat v19 = v12;
  CGFloat v20 = v11;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  BOOL v13 = fabs(CGRectGetMinX(v23)) < 0.00999999978;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v24);
  v25.origin.CGFloat x = v8;
  v25.origin.CGFloat y = v10;
  v25.size.CGFloat width = v20;
  v25.size.CGFloat height = v19;
  if (vabdd_f64(MaxX, CGRectGetWidth(v25)) >= 0.00999999978) {
    uint64_t v15 = 2 * v13;
  }
  else {
    uint64_t v15 = (2 * v13) | 8;
  }
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  unint64_t v16 = v15 | (fabs(CGRectGetMinY(v26)) < 0.00999999978);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v27);
  v28.origin.CGFloat y = v21;
  v28.origin.CGFloat x = v22;
  v28.size.CGFloat width = v20;
  v28.size.CGFloat height = v19;
  if (vabdd_f64(MaxY, CGRectGetHeight(v28)) >= 0.00999999978) {
    return v16;
  }
  else {
    return v16 | 4;
  }
}

@end
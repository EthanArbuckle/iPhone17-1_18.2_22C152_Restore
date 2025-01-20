@interface _WTTextEffectView
- (BOOL)_shouldApplyRemainderEffectForEffect:(id)a3;
- (BOOL)hasActiveEffect:(id)a3;
- (BOOL)hasActiveEffects;
- (BOOL)isFlipped;
- (BOOL)sourceIsAsync;
- (CGRect)cachedBounds;
- (CGRect)cachedFrame;
- (CGRect)cachedVisibleRect;
- (NSMutableDictionary)textEffects;
- (NSValue)replaceDestinationRect;
- (NSValue)replaceSourceRect;
- (_WTTextEffectView)initWithAsyncSource:(id)a3;
- (_WTTextEffectView)initWithSource:(id)a3;
- (_WTTextPreviewAsyncSource)asyncSource;
- (_WTTextPreviewSource)source;
- (double)replaceDestinationDuration;
- (double)replaceSourceDuration;
- (id)addEffect:(id)a3;
- (id)removeEffect:(id)a3;
- (id)removeEffect:(id)a3 animated:(BOOL)a4;
- (void)_cacheHeightOfPreviews:(id)a3 forEffect:(id)a4;
- (void)_commonLayoutSubviews;
- (void)_handleAddEffect:(id)a3 forAsyncSource:(id)a4;
- (void)_handleAddEffect:(id)a3 forSource:(id)a4;
- (void)removeAllEffects;
- (void)removeAllEffectsAnimated:(BOOL)a3;
- (void)setAsyncSource:(id)a3;
- (void)setCachedBounds:(CGRect)a3;
- (void)setCachedFrame:(CGRect)a3;
- (void)setCachedVisibleRect:(CGRect)a3;
- (void)setReplaceDestinationDuration:(double)a3;
- (void)setReplaceDestinationRect:(id)a3;
- (void)setReplaceSourceDuration:(double)a3;
- (void)setReplaceSourceRect:(id)a3;
- (void)setSource:(id)a3;
- (void)setSourceIsAsync:(BOOL)a3;
- (void)setTextEffects:(id)a3;
- (void)updateSnapshotForEffect:(id)a3;
- (void)updateSnapshotForEffectID:(id)a3;
- (void)updateSnapshots;
@end

@implementation _WTTextEffectView

- (_WTTextEffectView)initWithSource:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WTTextEffectView;
  v5 = [(_WTView *)&v9 init];
  if (v5)
  {
    v6 = objc_opt_new();
    [(_WTTextEffectView *)v5 setTextEffects:v6];

    [(_WTTextEffectView *)v5 setSourceIsAsync:0];
    [(_WTTextEffectView *)v5 setSource:v4];
    v7 = v5;
  }

  return v5;
}

- (_WTTextEffectView)initWithAsyncSource:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WTTextEffectView;
  v5 = [(_WTView *)&v9 init];
  if (v5)
  {
    v6 = objc_opt_new();
    [(_WTTextEffectView *)v5 setTextEffects:v6];

    [(_WTTextEffectView *)v5 setSourceIsAsync:1];
    [(_WTTextEffectView *)v5 setAsyncSource:v4];
    v7 = v5;
  }

  return v5;
}

- (BOOL)isFlipped
{
  return 1;
}

- (id)addEffect:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F08C38] UUID];
  v6 = [(_WTTextEffectView *)self textEffects];
  [v6 setObject:v4 forKey:v5];

  [v4 setIdentifier:v5];
  if ([(_WTTextEffectView *)self sourceIsAsync])
  {
    v7 = [(_WTTextEffectView *)self asyncSource];
    [(_WTTextEffectView *)self _handleAddEffect:v4 forAsyncSource:v7];
  }
  else
  {
    v7 = [(_WTTextEffectView *)self source];
    [(_WTTextEffectView *)self _handleAddEffect:v4 forSource:v7];
  }

  return v5;
}

- (void)_handleAddEffect:(id)a3 forSource:(id)a4
{
  v46[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 chunk];
  objc_super v9 = [v7 textPreviewsForChunk:v8];

  [v6 updateEffectWith:v9];
  if ([v6 hidesOriginal])
  {
    v10 = [v6 chunk];
    [v7 updateIsTextVisible:0 forChunk:v10];
  }
  [(_WTTextEffectView *)self _cacheHeightOfPreviews:v9 forEffect:v6];
  if ([(_WTTextEffectView *)self _shouldApplyRemainderEffectForEffect:v6])
  {
    v11 = -[_WTTextRangeChunk initWithRange:]([_WTTextRangeChunk alloc], "initWithRange:", 0, 0);
    v12 = [(_WTReplaceTextEffect *)[_WTReplaceRemainderTextEffect alloc] initWithChunk:v11 effectView:self];
    v13 = [MEMORY[0x263F08C38] UUID];
    v14 = [(_WTTextEffectView *)self textEffects];
    [v14 setObject:v12 forKey:v13];

    [(_WTTextEffect *)v12 setIdentifier:v13];
    [(_WTTextEffectView *)self replaceSourceDuration];
    double v16 = v15;
    [(_WTTextEffectView *)self replaceDestinationDuration];
    if (v16 >= v17) {
      double v17 = v16;
    }
    [(_WTReplaceRemainderTextEffect *)v12 setDurationOverride:v17];
    v18 = [(_WTTextEffectView *)self replaceSourceRect];
    [v18 platformCGRectValue];
    double v20 = v19;

    v21 = [(_WTTextEffectView *)self replaceDestinationRect];
    [v21 platformCGRectValue];
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    double v29 = v28;

    [(_WTReplaceRemainderTextEffect *)v12 setOffset:v29 - v20];
    [(_WTTextEffectView *)self bounds];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    v47.origin.x = v23;
    v47.origin.y = v25;
    v47.size.width = v27;
    v47.size.height = v29;
    CGFloat MaxY = CGRectGetMaxY(v47);
    double v39 = MaxY + v33;
    double v40 = v37 - MaxY;
    [(_WTView *)self platformGetVisibleRect];
    if (v40 >= v41) {
      double v40 = v41;
    }
    [(_WTTextEffectView *)self setReplaceSourceRect:0];
    [(_WTTextEffectView *)self setReplaceSourceDuration:0.0];
    [(_WTTextEffectView *)self setReplaceDestinationRect:0];
    [(_WTTextEffectView *)self setReplaceDestinationDuration:0.0];
    uint64_t v42 = objc_msgSend(v7, "textPreviewForRect:", v31, v39, v35, v40);
    v43 = (void *)v42;
    if (v42)
    {
      v46[0] = v42;
      v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:1];
      [(_WTReplaceRemainderTextEffect *)v12 updateEffectWith:v44];

      if ([(_WTTextEffect *)v12 hidesOriginal])
      {
        v45 = [(_WTTextEffect *)v12 chunk];
        [v7 updateIsTextVisible:0 forChunk:v45];
      }
    }
  }
}

- (void)_handleAddEffect:(id)a3 forAsyncSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x4010000000;
  v20[3] = &unk_261C19A43;
  long long v21 = 0u;
  long long v22 = 0u;
  [(_WTTextEffectView *)self bounds];
  *(void *)&long long v21 = v8;
  *((void *)&v21 + 1) = v9;
  *(void *)&long long v22 = v10;
  *((void *)&v22 + 1) = v11;
  v12 = [v6 chunk];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke;
  v15[3] = &unk_26558E898;
  id v13 = v6;
  id v16 = v13;
  double v17 = self;
  double v19 = v20;
  id v14 = v7;
  id v18 = v14;
  [v14 textPreviewsForChunk:v12 completion:v15];

  _Block_object_dispose(v20, 8);
}

- (BOOL)_shouldApplyRemainderEffectForEffect:(id)a3
{
  id v4 = a3;
  v5 = [(_WTTextEffectView *)self replaceSourceRect];
  if (v5)
  {
    id v6 = [(_WTTextEffectView *)self replaceDestinationRect];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v8 = [v4 isDestination];
  }
  else {
    char v8 = 0;
  }
  BOOL v9 = v7 & v8;

  return v9;
}

- (void)_cacheHeightOfPreviews:(id)a3 forEffect:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 firstObject];
  [v8 presentationFrame];
  double x = v9;
  double y = v11;
  double width = v13;
  double height = v15;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "presentationFrame", (void)v28);
        v36.origin.double x = v22;
        v36.origin.double y = v23;
        v36.size.double width = v24;
        v36.size.double height = v25;
        v34.origin.double x = x;
        v34.origin.double y = y;
        v34.size.double width = width;
        v34.size.double height = height;
        CGRect v35 = CGRectUnion(v34, v36);
        double x = v35.origin.x;
        double y = v35.origin.y;
        double width = v35.size.width;
        double height = v35.size.height;
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v19);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v26 = [v7 isDestination];
    CGFloat v27 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPlatformCGRect:", x, y, width, height);
    if (v26)
    {
      [(_WTTextEffectView *)self setReplaceDestinationRect:v27];

      [v7 sweepDuration];
      -[_WTTextEffectView setReplaceDestinationDuration:](self, "setReplaceDestinationDuration:");
    }
    else
    {
      [(_WTTextEffectView *)self setReplaceSourceRect:v27];

      [v7 sweepDuration];
      -[_WTTextEffectView setReplaceSourceDuration:](self, "setReplaceSourceDuration:");
    }
  }
}

- (void)removeAllEffects
{
}

- (void)removeAllEffectsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(_WTTextEffectView *)self textEffects];
  id v6 = [v5 allKeys];
  id v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [(_WTTextEffectView *)self removeEffect:*(void *)(*((void *)&v13 + 1) + 8 * v11++) animated:v3];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (id)removeEffect:(id)a3
{
  return [(_WTTextEffectView *)self removeEffect:a3 animated:1];
}

- (id)removeEffect:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_WTTextEffectView *)self textEffects];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  uint64_t v9 = [v8 chunk];
  uint64_t v10 = (void *)[v9 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v11 = [v8 isDestination];
  }
  else {
    int v11 = 1;
  }
  int v12 = [v8 hidesOriginal] & v11;
  if ([(_WTTextEffectView *)self sourceIsAsync])
  {
    if (v12)
    {
      long long v13 = [(_WTTextEffectView *)self asyncSource];
      long long v14 = [v8 chunk];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __43___WTTextEffectView_removeEffect_animated___block_invoke;
      v19[3] = &unk_26558E8C0;
      BOOL v23 = v4;
      id v20 = v8;
      long long v21 = self;
      id v22 = v6;
      [v13 updateIsTextVisible:1 forChunk:v14 completion:v19];

      goto LABEL_10;
    }
  }
  else if (v12)
  {
    long long v15 = [(_WTTextEffectView *)self source];
    long long v16 = [v8 chunk];
    [v15 updateIsTextVisible:1 forChunk:v16];
  }
  [v8 invalidate:v4];
  id v17 = [(_WTTextEffectView *)self textEffects];
  [v17 removeObjectForKey:v6];

LABEL_10:

  return v10;
}

- (BOOL)hasActiveEffects
{
  v2 = [(_WTTextEffectView *)self textEffects];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasActiveEffect:(id)a3
{
  id v4 = a3;
  v5 = [(_WTTextEffectView *)self textEffects];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (void)_commonLayoutSubviews
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v50.receiver = self;
  v50.super_class = (Class)_WTTextEffectView;
  [(_WTView *)&v50 _commonLayoutSubviews];
  [(_WTTextEffectView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(_WTTextEffectView *)self cachedBounds];
  v56.origin.double x = v11;
  v56.origin.double y = v12;
  v56.size.double width = v13;
  v56.size.double height = v14;
  v53.origin.double x = v4;
  v53.origin.double y = v6;
  v53.size.double width = v8;
  v53.size.double height = v10;
  if (!CGRectEqualToRect(v53, v56)) {
    goto LABEL_4;
  }
  [(_WTTextEffectView *)self frame];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [(_WTTextEffectView *)self cachedFrame];
  v57.origin.double x = v23;
  v57.origin.double y = v24;
  v57.size.double width = v25;
  v57.size.double height = v26;
  v54.origin.double x = v16;
  v54.origin.double y = v18;
  v54.size.double width = v20;
  v54.size.double height = v22;
  if (!CGRectEqualToRect(v54, v57)) {
    goto LABEL_4;
  }
  [(_WTView *)self platformGetVisibleRect];
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  [(_WTTextEffectView *)self cachedVisibleRect];
  v58.origin.double x = v35;
  v58.origin.double y = v36;
  v58.size.double width = v37;
  v58.size.double height = v38;
  v55.origin.double x = v28;
  v55.origin.double y = v30;
  v55.size.double width = v32;
  v55.size.double height = v34;
  if (!CGRectEqualToRect(v55, v58))
  {
LABEL_4:
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    double v39 = [(_WTTextEffectView *)self textEffects];
    double v40 = [v39 allValues];

    uint64_t v41 = [v40 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v47 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if ([v45 updatesOnGeometryChange]) {
            [(_WTTextEffectView *)self updateSnapshotForEffect:v45];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v42);
    }
  }
  [(_WTTextEffectView *)self bounds];
  -[_WTTextEffectView setCachedBounds:](self, "setCachedBounds:");
  [(_WTTextEffectView *)self frame];
  -[_WTTextEffectView setCachedFrame:](self, "setCachedFrame:");
  [(_WTView *)self platformGetVisibleRect];
  -[_WTTextEffectView setCachedVisibleRect:](self, "setCachedVisibleRect:");
}

- (void)updateSnapshots
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(_WTTextEffectView *)self textEffects];
  CGFloat v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(_WTTextEffectView *)self updateSnapshotForEffectID:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)updateSnapshotForEffectID:(id)a3
{
  id v4 = a3;
  id v6 = [(_WTTextEffectView *)self textEffects];
  uint64_t v5 = [v6 objectForKeyedSubscript:v4];

  [(_WTTextEffectView *)self updateSnapshotForEffect:v5];
}

- (void)updateSnapshotForEffect:(id)a3
{
  id v4 = a3;
  if ([(_WTTextEffectView *)self sourceIsAsync])
  {
    uint64_t v5 = [(_WTTextEffectView *)self asyncSource];
    id v6 = [v4 chunk];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __45___WTTextEffectView_updateSnapshotForEffect___block_invoke;
    v12[3] = &unk_26558E8E8;
    id v13 = v4;
    uint64_t v14 = self;
    [v5 textPreviewsForChunk:v6 completion:v12];
  }
  else
  {
    uint64_t v7 = [(_WTTextEffectView *)self source];
    uint64_t v8 = [v4 chunk];
    long long v9 = [v7 textPreviewsForChunk:v8];
    [v4 updateEffectWith:v9];

    if ([v4 hidesOriginal])
    {
      long long v10 = [(_WTTextEffectView *)self source];
      long long v11 = [v4 chunk];
      [v10 updateIsTextVisible:0 forChunk:v11];
    }
  }
}

- (_WTTextPreviewSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  return (_WTTextPreviewSource *)WeakRetained;
}

- (void)setSource:(id)a3
{
}

- (_WTTextPreviewAsyncSource)asyncSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_asyncSource);

  return (_WTTextPreviewAsyncSource *)WeakRetained;
}

- (void)setAsyncSource:(id)a3
{
}

- (NSMutableDictionary)textEffects
{
  return self->_textEffects;
}

- (void)setTextEffects:(id)a3
{
}

- (BOOL)sourceIsAsync
{
  return self->_sourceIsAsync;
}

- (void)setSourceIsAsync:(BOOL)a3
{
  self->_sourceIsAsync = a3;
}

- (NSValue)replaceSourceRect
{
  return (NSValue *)objc_getProperty(self, a2, 440, 1);
}

- (void)setReplaceSourceRect:(id)a3
{
}

- (NSValue)replaceDestinationRect
{
  return (NSValue *)objc_getProperty(self, a2, 448, 1);
}

- (void)setReplaceDestinationRect:(id)a3
{
}

- (double)replaceSourceDuration
{
  return self->_replaceSourceDuration;
}

- (void)setReplaceSourceDuration:(double)a3
{
  self->_replaceSourceDuration = a3;
}

- (double)replaceDestinationDuration
{
  return self->_replaceDestinationDuration;
}

- (void)setReplaceDestinationDuration:(double)a3
{
  self->_replaceDestinationDuration = a3;
}

- (CGRect)cachedBounds
{
  objc_copyStruct(v6, &self->_cachedBounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setCachedBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_cachedBounds, &v3, 32, 1, 0);
}

- (CGRect)cachedFrame
{
  objc_copyStruct(v6, &self->_cachedFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setCachedFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_cachedFrame, &v3, 32, 1, 0);
}

- (CGRect)cachedVisibleRect
{
  objc_copyStruct(v6, &self->_cachedVisibleRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setCachedVisibleRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_cachedVisibleRect, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceDestinationRect, 0);
  objc_storeStrong((id *)&self->_replaceSourceRect, 0);
  objc_storeStrong((id *)&self->_textEffects, 0);
  objc_destroyWeak((id *)&self->_asyncSource);

  objc_destroyWeak((id *)&self->_source);
}

@end
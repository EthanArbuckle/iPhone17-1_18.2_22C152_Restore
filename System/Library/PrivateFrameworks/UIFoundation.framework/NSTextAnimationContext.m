@interface NSTextAnimationContext
- (BOOL)_hasRenderableComponentsForRange:(id)a3;
- (BOOL)_updateEnclosingLocation:(id)a3 endLocation:(id)a4;
- (CGRect)presentationLayoutFragmentFrameForTextLayoutFragment:(id)a3 proposedOrigin:(CGPoint)a4;
- (NSArray)textRanges;
- (NSTextAnimationContext)initWithTextLayoutManager:(id)a3 textRanges:(id)a4;
- (NSTextLayoutManager)textLayoutManager;
- (NSTextRange)_unionTextRange;
- (NSTextRange)enclosingTextRange;
- (id)completionHandler;
- (id)presentationSizeProvider;
- (id)snapshotAttributeOverrides;
- (unint64_t)_effectiveComponents;
- (unint64_t)_effectiveExclusiveComponents;
- (unint64_t)components;
- (unint64_t)componentsForExclusiveRange;
- (void)_contentsReplaced;
- (void)_endAnimationContext:(int64_t)a3;
- (void)_invalidated;
- (void)_overridden;
- (void)finalizeAnimation;
- (void)setCompletionHandler:(id)a3;
- (void)setComponents:(unint64_t)a3;
- (void)setComponentsForExclusiveRange:(unint64_t)a3;
- (void)setPresentationSizeProvider:(id)a3;
- (void)setSnapshotAttributeOverrides:(id)a3;
- (void)snapshotWithComponents:(unint64_t)a3 exclusiveComponents:(unint64_t)a4 usingBlock:(id)a5;
@end

@implementation NSTextAnimationContext

- (NSTextRange)enclosingTextRange
{
  v2 = self;
  objc_sync_enter(v2);
  enclosingTextRange = v2->_enclosingTextRange;
  if (enclosingTextRange) {
    v4 = enclosingTextRange;
  }
  else {
    v4 = [[NSTextRange alloc] initWithLocation:v2->_enclosingLocation endLocation:v2->_enclosingEndLocation];
  }
  v5 = v4;
  objc_sync_exit(v2);

  return v5;
}

- (NSTextRange)_unionTextRange
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_unionTextRange)
  {
    if ([(NSArray *)v2->_textRanges count] < 2)
    {
      uint64_t v10 = [(NSArray *)v2->_textRanges firstObject];
      unionTextRange = v2->_unionTextRange;
      v2->_unionTextRange = (NSTextRange *)v10;
    }
    else
    {
      v3 = [NSTextRange alloc];
      unionTextRange = [(NSArray *)v2->_textRanges firstObject];
      v5 = [unionTextRange location];
      v6 = [(NSArray *)v2->_textRanges lastObject];
      v7 = [v6 endLocation];
      uint64_t v8 = [(NSTextRange *)v3 initWithLocation:v5 endLocation:v7];
      v9 = v2->_unionTextRange;
      v2->_unionTextRange = (NSTextRange *)v8;
    }
  }
  v11 = v2->_unionTextRange;
  objc_sync_exit(v2);

  return v11;
}

- (BOOL)_hasRenderableComponentsForRange:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = 40;
  if (!v5->_inSnapshot) {
    uint64_t v6 = 80;
  }
  uint64_t v7 = *(uint64_t *)((char *)&v5->super.isa + v6);
  uint64_t v8 = 48;
  if (!v5->_inSnapshot) {
    uint64_t v8 = 88;
  }
  uint64_t v9 = *(uint64_t *)((char *)&v5->super.isa + v8);
  BOOL v10 = v9 != 0;
  if (v7 | v9
    && ([(NSTextAnimationContext *)v5 enclosingTextRange],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 intersectsWithTextRange:v4],
        v11,
        v12))
  {
    textRanges = v5->_textRanges;
    char v14 = 1;
    if (textRanges && (v7 != 0) != (v9 != 0))
    {
      if ([(NSArray *)textRanges count] < 2)
      {
        v25 = [(NSArray *)v5->_textRanges firstObject];
        int v26 = [v25 intersectsWithTextRange:v4];

        char v14 = v9 != 0;
        if (v26)
        {
          v27 = [(NSArray *)v5->_textRanges firstObject];
          char v28 = [v27 containsRange:v4];

LABEL_27:
          if (v7) {
            char v14 = 1;
          }
          else {
            char v14 = v28 ^ 1;
          }
        }
      }
      else
      {
        v15 = [(NSTextAnimationContext *)v5 _unionTextRange];
        int v16 = [v15 intersectsWithTextRange:v4];

        if (v16)
        {
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          obj = v5->_textRanges;
          uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v31;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v31 != v18) {
                  objc_enumerationMutation(obj);
                }
                v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                if ([v20 intersectsWithTextRange:v4])
                {
                  char v28 = [v20 containsRange:v4];

                  goto LABEL_27;
                }
                v21 = [v4 endLocation];
                v22 = [v20 location];
                BOOL v23 = [v21 compare:v22] == -1;

                if (!v23) {
                  goto LABEL_20;
                }
              }
              uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
LABEL_20:
        }
        char v14 = v10;
      }
    }
  }
  else
  {
    char v14 = 0;
  }
  objc_sync_exit(v5);

  return v14;
}

- (void)_contentsReplaced
{
  obj = self;
  objc_sync_enter(obj);
  textRanges = obj->_textRanges;
  obj->_textRanges = 0;

  unionTextRange = obj->_unionTextRange;
  obj->_unionTextRange = 0;

  objc_sync_exit(obj);
}

- (NSTextAnimationContext)initWithTextLayoutManager:(id)a3 textRanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NSTextAnimationContext;
  uint64_t v8 = [(NSTextAnimationContext *)&v16 init];
  uint64_t v9 = v8;
  if (!v8) {
    goto LABEL_3;
  }
  objc_storeWeak((id *)&v8->_textLayoutManager, v6);
  objc_storeStrong((id *)&v9->_textRanges, a4);
  uint64_t v10 = [(NSTextAnimationContext *)v9 _unionTextRange];
  enclosingTextRange = v9->_enclosingTextRange;
  v9->_enclosingTextRange = (NSTextRange *)v10;

  *(_OWORD *)&v9->_components = xmmword_18E5F77D0;
  id WeakRetained = objc_loadWeakRetained((id *)&v9->_textLayoutManager);
  int v13 = [WeakRetained _addTextAnimationContext:v9];

  if (!v13) {
    char v14 = 0;
  }
  else {
LABEL_3:
  }
    char v14 = v9;

  return v14;
}

- (BOOL)_updateEnclosingLocation:(id)a3 endLocation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  uint64_t v10 = v9->_enclosingTextRange;
  if (v7 && ([v7 isEqual:v9->_enclosingLocation] & 1) == 0)
  {
    objc_storeStrong((id *)&v9->_enclosingLocation, a3);
    enclosingTextRange = v9->_enclosingTextRange;
    v9->_enclosingTextRange = 0;
  }
  if (v8 && ([v8 isEqual:v9->_enclosingEndLocation] & 1) == 0)
  {
    objc_storeStrong((id *)&v9->_enclosingEndLocation, a4);
    int v12 = v9->_enclosingTextRange;
    v9->_enclosingTextRange = 0;
  }
  BOOL v13 = v9->_enclosingTextRange != v10;

  objc_sync_exit(v9);
  return v13;
}

- (void)_endAnimationContext:(int64_t)a3
{
  id v7 = [(NSTextAnimationContext *)self completionHandler];
  if (v7) {
    v7[2](v7, self, a3 == 0);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutManager);
  [WeakRetained _removeTextAnimationContext:self];

  textRanges = self->_textRanges;
  self->_textRanges = 0;

  objc_storeWeak((id *)&self->_textLayoutManager, 0);
}

- (void)finalizeAnimation
{
}

- (void)_overridden
{
}

- (void)_invalidated
{
}

- (CGRect)presentationLayoutFragmentFrameForTextLayoutFragment:(id)a3 proposedOrigin:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  presentationSizeProvider = (double (**)(id, NSTextAnimationContext *, id, __n128, __n128))self->_presentationSizeProvider;
  if (presentationSizeProvider)
  {
    CGFloat x = presentationSizeProvider[2](presentationSizeProvider, self, a3, (__n128)a4, *(__n128 *)&a4.y);
    CGFloat y = v10;
  }
  else
  {
    [a3 layoutFragmentFrame];
  }
  double v11 = x;
  double v12 = y;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (unint64_t)_effectiveComponents
{
  uint64_t v2 = 40;
  if (!self->_inSnapshot) {
    uint64_t v2 = 80;
  }
  return *(unint64_t *)((char *)&self->super.isa + v2);
}

- (unint64_t)_effectiveExclusiveComponents
{
  uint64_t v2 = 48;
  if (!self->_inSnapshot) {
    uint64_t v2 = 88;
  }
  return *(unint64_t *)((char *)&self->super.isa + v2);
}

- (void)snapshotWithComponents:(unint64_t)a3 exclusiveComponents:(unint64_t)a4 usingBlock:(id)a5
{
  BOOL v13 = (void (**)(id, NSTextAnimationContext *))a5;
  double v8 = self;
  objc_sync_enter(v8);
  unint64_t snapshotComponents = v8->_snapshotComponents;
  unint64_t snapshotExclusiveComponents = v8->_snapshotExclusiveComponents;
  BOOL inSnapshot = v8->_inSnapshot;
  v8->_unint64_t snapshotComponents = a3;
  v8->_unint64_t snapshotExclusiveComponents = a4;
  v8->_BOOL inSnapshot = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&v8->_textLayoutManager);
  [WeakRetained ensureLayoutForRange:v8->_enclosingTextRange];

  v13[2](v13, v8);
  v8->_unint64_t snapshotComponents = snapshotComponents;
  v8->_unint64_t snapshotExclusiveComponents = snapshotExclusiveComponents;
  v8->_BOOL inSnapshot = inSnapshot;
  objc_sync_exit(v8);
}

uint64_t __80__NSTextAnimationContext_snapshotWithComponents_exclusiveComponents_usingBlock___block_invoke()
{
  return [NSString stringWithFormat:@"Exception in snapshot handler"];
}

- (NSTextLayoutManager)textLayoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutManager);

  return (NSTextLayoutManager *)WeakRetained;
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (unint64_t)components
{
  return self->_components;
}

- (void)setComponents:(unint64_t)a3
{
  self->_components = a3;
}

- (unint64_t)componentsForExclusiveRange
{
  return self->_componentsForExclusiveRange;
}

- (void)setComponentsForExclusiveRange:(unint64_t)a3
{
  self->_componentsForExclusiveRange = a3;
}

- (NSArray)textRanges
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (id)presentationSizeProvider
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setPresentationSizeProvider:(id)a3
{
}

- (id)snapshotAttributeOverrides
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setSnapshotAttributeOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_snapshotAttributeOverrides, 0);
  objc_storeStrong(&self->_presentationSizeProvider, 0);
  objc_storeStrong((id *)&self->_textRanges, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_textLayoutManager);
  objc_storeStrong((id *)&self->_unionTextRange, 0);
  objc_storeStrong((id *)&self->_enclosingTextRange, 0);
  objc_storeStrong((id *)&self->_enclosingEndLocation, 0);

  objc_storeStrong((id *)&self->_enclosingLocation, 0);
}

@end
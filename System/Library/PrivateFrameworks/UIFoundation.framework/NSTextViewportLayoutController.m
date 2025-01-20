@interface NSTextViewportLayoutController
+ (BOOL)flushesCachedViewportElements;
- (BOOL)addRenderingSurface:(id)a3 key:(id)a4 group:(int64_t)a5 placement:(int64_t)a6;
- (CGFloat)relocateViewportToTextLocation:(id)textLocation;
- (CGRect)_viewportBounds;
- (CGRect)viewportBounds;
- (NSTextContainer)textContainer;
- (NSTextLayoutManager)textLayoutManager;
- (NSTextRange)viewportRange;
- (NSTextViewportLayoutController)initWithTextContainer:(id)a3;
- (NSTextViewportLayoutController)initWithTextLayoutManager:(NSTextLayoutManager *)textLayoutManager;
- (id)_platformRenderingSurfaceUpdater;
- (id)delegate;
- (id)locationAtPoint:(CGPoint)a3;
- (id)renderingSurfaceForKey:(id)a3;
- (id)renderingSurfaceUpdater;
- (id)textViewportElementAtPoint:(CGPoint)a3;
- (id)textViewportElementForLocation:(id)a3;
- (id)textViewportElementsInRect:(CGRect)a3;
- (void)_resetLayout;
- (void)addViewportLayoutObserver:(id)a3;
- (void)adjustViewport:(double)a3 atLocation:(id)a4 verticalOffsetFromLocation:(double)a5;
- (void)adjustViewportByVerticalOffset:(CGFloat)verticalOffset;
- (void)dealloc;
- (void)enumerateTextViewportElementsInRect:(CGRect)a3 options:(int64_t)a4 usingBlock:(id)a5;
- (void)enumerateViewportElementsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5;
- (void)layoutViewport;
- (void)removeViewportLayoutObserver:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setNeedsLayout;
- (void)setRenderingSurface:(id)a3 forKey:(id)a4;
- (void)setRenderingSurfaceUpdater:(id)a3;
- (void)set_platformRenderingSurfaceUpdater:(id)a3;
@end

@implementation NSTextViewportLayoutController

uint64_t __91__NSTextViewportLayoutController_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3 && v3 != objc_msgSend((id)objc_msgSend(a2, "textLayoutManager"), "_textContainerForCurrentEnumeratedElement")) {
    return 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return 1;
}

uint64_t __48__NSTextViewportLayoutController_layoutViewport__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "representedRange"), "location");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  *a3 = 1;
  return result;
}

uint64_t __48__NSTextViewportLayoutController_layoutViewport__block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "representedRange"), "location");
  double v6 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t result = [a2 layoutSize];
  if (v6 + v8 <= *(double *)(a1 + 72))
  {
    uint64_t result = [a2 layoutSize];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (CGRect)_viewportBounds
{
  __int16 viewportLayoutControllerFlags = (__int16)self->_viewportLayoutControllerFlags;
  p_viewportBounds = (CGRect *)MEMORY[0x1E4F28AD8];
  p_height = (CGFloat *)(MEMORY[0x1E4F28AD8] + 24);
  p_size = (CGSize *)(MEMORY[0x1E4F28AD8] + 16);
  BOOL v6 = (viewportLayoutControllerFlags & 1) == 0;
  if (viewportLayoutControllerFlags) {
    p_y = &self->_viewportBounds.origin.y;
  }
  else {
    p_y = (CGFloat *)(MEMORY[0x1E4F28AD8] + 8);
  }
  if (!v6)
  {
    p_viewportBounds = &self->_viewportBounds;
    p_size = &self->_viewportBounds.size;
    p_height = &self->_viewportBounds.size.height;
  }
  double v8 = *p_height;
  double width = p_size->width;
  double x = p_viewportBounds->origin.x;
  double v11 = *p_y;
  result.size.height = v8;
  result.size.double width = width;
  result.origin.y = v11;
  result.origin.double x = x;
  return result;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_textLayoutManager, 0);
  objc_storeWeak((id *)&self->_textContainer, 0);
  objc_storeWeak((id *)&self->_delegate, 0);

  v3.receiver = self;
  v3.super_class = (Class)NSTextViewportLayoutController;
  [(NSTextViewportLayoutController *)&v3 dealloc];
}

- (void)setNeedsLayout
{
  $805E37098AB790AEA86AA1C0B2AFB2A4 viewportLayoutControllerFlags = self->_viewportLayoutControllerFlags;
  if ((*(unsigned char *)&viewportLayoutControllerFlags & 2) == 0)
  {
    int v4 = (*(unsigned int *)&viewportLayoutControllerFlags >> 10) & 3;
    if (v4 == 2)
    {
      [objc_loadWeak((id *)&self->_delegate) setNeedsLayout];
    }
    else if (v4 == 1)
    {
      [objc_loadWeak((id *)&self->_delegate) setNeedsLayout:1];
    }
    *(_WORD *)&self->_viewportLayoutControllerFlags |= 2u;
  }
}

- (void)layoutViewport
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSTextViewportLayoutController *)self delegate];
  int v4 = [(NSTextViewportLayoutController *)self elementProvider];
  v5 = (CGPoint *)MEMORY[0x1E4F1DAD8];
  if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 4) != 0)
  {
    CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    self->_viewportBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->_viewportBounds.size = v6;
    self->_viewportOffset = *v5;

    self->_viewportRange = 0;
  }
  v53 = v4;
  if (objc_opt_respondsToSelector()) {
    [v3 textViewportLayoutControllerWillLayout:self];
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  viewportLayoutObservers = self->_viewportLayoutObservers;
  uint64_t v8 = [(NSMutableArray *)viewportLayoutObservers countByEnumeratingWithState:&v96 objects:v101 count:16];
  if (v8)
  {
    double v9 = 0;
    uint64_t v10 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v97 != v10) {
          objc_enumerationMutation(viewportLayoutObservers);
        }
        v12 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        uint64_t v13 = [v12 object];
        v14 = (void *)v13;
        if (v13)
        {
          if (id)v13 != v3 && (objc_opt_respondsToSelector()) {
            [v14 textViewportLayoutControllerWillLayout:self];
          }
        }
        else
        {
          double v9 = v12;
        }
      }
      uint64_t v8 = [(NSMutableArray *)viewportLayoutObservers countByEnumeratingWithState:&v96 objects:v101 count:16];
    }
    while (v8);
    if (v9) {
      [(NSMutableArray *)self->_viewportLayoutObservers removeObject:v9];
    }
  }
  *(_WORD *)&self->_viewportLayoutControllerFlags &= ~1u;
  [(NSMapTable *)self->_renderingSurfaces removeAllObjects];
  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x3052000000;
  v93 = __Block_byref_object_copy__15;
  v94 = __Block_byref_object_dispose__15;
  uint64_t v95 = 0;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3052000000;
  v87 = __Block_byref_object_copy__15;
  v88 = __Block_byref_object_dispose__15;
  uint64_t v89 = 0;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v16 = *MEMORY[0x1E4F28AD8];
  double v17 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  CGFloat v18 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  double v21 = *MEMORY[0x1E4F1DAD8];
  double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x2020000000;
  char v83 = 1;
  if (v3 && v53)
  {
    if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 0x20) != 0) {
      [v3 viewportBoundsForTextViewportLayoutController:self];
    }
    else {
      [v3 viewport];
    }
    double v16 = v22;
    double v17 = v23;
    CGFloat v18 = v24;
    double v19 = v25;
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x3052000000;
    v77 = __Block_byref_object_copy__15;
    v78 = __Block_byref_object_dispose__15;
    uint64_t v79 = 0;
    uint64_t v68 = 0;
    v69 = (double *)&v68;
    uint64_t v70 = 0x3010000000;
    v71 = "";
    CGFloat v26 = self->_viewportBounds.origin.y - self->_viewportOffset.y;
    CGFloat x = self->_viewportBounds.origin.x;
    CGFloat v73 = v26;
    if ((*(unsigned char *)&self->_viewportLayoutControllerFlags & 0x40) != 0)
    {
      long long v59 = *MEMORY[0x1E4F1DB30];
      uint64_t v27 = objc_msgSend(v3, "locationForPositionInViewport:offset:", &v59, v22, v17);
      v28 = v75;
      v75[5] = v27;
      if (v27)
      {
        *((unsigned char *)v81 + 24) = 0;
        v29 = v69;
        double v30 = v17 + *((double *)&v59 + 1);
        v69[4] = v16;
        v29[5] = v30;
        if (v28[5]) {
          goto LABEL_37;
        }
      }
    }
    id v31 = [(NSTextRange *)self->_viewportRange location];
    v75[5] = (uint64_t)v31;
    if (v17 < 0.001)
    {
      v69[5] = 0.0;
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __48__NSTextViewportLayoutController_layoutViewport__block_invoke;
      v67[3] = &unk_1E55C7D28;
      v67[4] = &v74;
      [(NSTextViewportLayoutController *)self enumerateViewportElementsFromLocation:0 options:4 usingBlock:v67];
LABEL_37:
      v38 = v75;
      if (v75[5])
      {
        *(void *)&long long v59 = 0;
        *((void *)&v59 + 1) = &v59;
        uint64_t v60 = 0x3052000000;
        v61 = __Block_byref_object_copy__15;
        v62 = __Block_byref_object_dispose__15;
        uint64_t v63 = 0;
        double v39 = v69[4];
        double v40 = fmax(v69[5], 0.0);
        v69[5] = v40;
        double v20 = v17 - v40;
        uint64_t v41 = v38[5];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __48__NSTextViewportLayoutController_layoutViewport__block_invoke_4;
        v58[3] = &unk_1E55C7DA0;
        v58[8] = &v59;
        v58[9] = &v68;
        v58[4] = self;
        v58[5] = v3;
        v58[6] = v15;
        v58[7] = &v90;
        v58[10] = &v80;
        v58[11] = &v84;
        *(double *)&v58[12] = v39;
        *(double *)&v58[13] = v40;
        *(CGFloat *)&v58[14] = v18;
        v58[15] = ceil(v19 + v17 - v40);
        [(NSTextViewportLayoutController *)self enumerateViewportElementsFromLocation:v41 options:4 usingBlock:v58];
        double v21 = v16 - v39;
        _Block_object_dispose(&v59, 8);
      }
      else
      {
        double v16 = *MEMORY[0x1E4F1DB28];
        double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        CGFloat v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      }
      _Block_object_dispose(&v68, 8);
      _Block_object_dispose(&v74, 8);
      goto LABEL_41;
    }
    double y = self->_viewportBounds.origin.y;
    if (v17 == y)
    {
      id v33 = [(NSTextRange *)self->_viewportRange location];
      v75[5] = (uint64_t)v33;
      goto LABEL_37;
    }
    *(void *)&long long v59 = 0;
    *((void *)&v59 + 1) = &v59;
    uint64_t v60 = 0x2020000000;
    LOBYTE(v61) = 0;
    if (v17 >= y)
    {
      v65[0] = 0;
      v65[1] = v65;
      uint64_t v36 = *((void *)v69 + 5);
      v65[2] = 0x2020000000;
      v65[3] = v36;
      id v37 = [(NSTextRange *)self->_viewportRange location];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __48__NSTextViewportLayoutController_layoutViewport__block_invoke_3;
      v64[3] = &unk_1E55C7D78;
      v64[4] = &v74;
      v64[5] = v65;
      *(double *)&v64[8] = v16;
      *(double *)&v64[9] = v17;
      *(CGFloat *)&v64[10] = v18;
      *(double *)&v64[11] = v19;
      v64[6] = &v68;
      v64[7] = &v59;
      [(NSTextViewportLayoutController *)self enumerateViewportElementsFromLocation:v37 options:2 usingBlock:v64];
      _Block_object_dispose(v65, 8);
      if (!*(unsigned char *)(*((void *)&v59 + 1) + 24)) {
LABEL_35:
      }
        v75[5] = 0;
    }
    else
    {
      id v34 = [(NSTextRange *)self->_viewportRange location];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __48__NSTextViewportLayoutController_layoutViewport__block_invoke_2;
      v66[3] = &unk_1E55C7D50;
      *(double *)&v66[6] = v16;
      *(double *)&v66[7] = v17;
      *(CGFloat *)&v66[8] = v18;
      *(double *)&v66[9] = v19;
      v66[4] = &v68;
      v66[5] = &v74;
      [(NSTextViewportLayoutController *)self enumerateViewportElementsFromLocation:v34 options:3 usingBlock:v66];
      BOOL v35 = v69[5] <= v17;
      *(unsigned char *)(*((void *)&v59 + 1) + 24) = v35;
      if (!v35) {
        goto LABEL_35;
      }
    }
    _Block_object_dispose(&v59, 8);
    goto LABEL_37;
  }
LABEL_41:
  self->_viewportBounds.origin.CGFloat x = v16;
  self->_viewportBounds.origin.double y = v17;
  self->_viewportBounds.size.double width = v18;
  self->_viewportBounds.size.height = v19;
  self->_viewportOffset.CGFloat x = v21;
  self->_viewportOffset.double y = v20;
  v42 = (void *)[(id)v85[5] textRangeByFormingUnionWithTextRange:v91[5]];
  if (self->_viewportRange
    && [(id)objc_opt_class() flushesCachedViewportElements]
    && (objc_opt_respondsToSelector() & (v42 != 0)) == 1
    && ([v42 isEmpty] & 1) == 0
    && ([v42 containsRange:self->_viewportRange] & 1) == 0)
  {
    if (objc_msgSend(-[NSTextRange location](self->_viewportRange, "location"), "compare:", objc_msgSend(v42, "location")) == -1)-[NSTextViewportElementProvider flushTextLayoutFragmentsFromLocation:direction:](v53, "flushTextLayoutFragmentsFromLocation:direction:", objc_msgSend(v42, "location"), 1); {
    if (objc_msgSend((id)objc_msgSend(v42, "endLocation"), "compare:", -[NSTextRange endLocation](self->_viewportRange, "endLocation")) == -1)-[NSTextViewportElementProvider flushTextLayoutFragmentsFromLocation:direction:](v53, "flushTextLayoutFragmentsFromLocation:direction:", objc_msgSend(v42, "endLocation"), 0);
    }
  }
  v43 = self->_viewportRange;
  self->_viewportRange = (NSTextRange *)v42;
  viewportElements = self->_viewportElements;
  if (viewportElements) {

  }
  self->_viewportElements = (NSArray *)[v15 copy];
  __int16 viewportLayoutControllerFlags = (__int16)self->_viewportLayoutControllerFlags;
  *(_WORD *)&self->___int16 viewportLayoutControllerFlags = viewportLayoutControllerFlags | 1;
  if ((viewportLayoutControllerFlags & 0x100) == 0)
  {
    id v46 = 0;
LABEL_54:
    id v47 = 0;
    goto LABEL_57;
  }
  id v46 = [(NSTextViewportLayoutController *)self _platformRenderingSurfaceUpdater];
  if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 0x100) == 0) {
    goto LABEL_54;
  }
  id v47 = [(NSTextViewportLayoutController *)self renderingSurfaceUpdater];
LABEL_57:
  if ((unint64_t)v47 | (unint64_t)v46)
  {
    *(_WORD *)&self->_viewportLayoutControllerFlags |= 8u;
    if (v46) {
      (*((void (**)(id, NSTextViewportLayoutController *, NSTextRange *, CGFloat, CGFloat, CGFloat, CGFloat))v46
    }
       + 2))(v46, self, self->_viewportRange, self->_viewportBounds.origin.x, self->_viewportBounds.origin.y, self->_viewportBounds.size.width, self->_viewportBounds.size.height);
    if (v47) {
      (*((void (**)(id, NSTextViewportLayoutController *, NSTextRange *, CGFloat, CGFloat, CGFloat, CGFloat))v47
    }
       + 2))(v47, self, self->_viewportRange, self->_viewportBounds.origin.x, self->_viewportBounds.origin.y, self->_viewportBounds.size.width, self->_viewportBounds.size.height);
    *(_WORD *)&self->_viewportLayoutControllerFlags &= ~8u;
  }
  if (objc_opt_respondsToSelector()) {
    [v3 textViewportLayoutControllerDidLayout:self];
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v48 = self->_viewportLayoutObservers;
  uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v54 objects:v100 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v49; ++j)
      {
        if (*(void *)v55 != v50) {
          objc_enumerationMutation(v48);
        }
        id v52 = (id)[*(id *)(*((void *)&v54 + 1) + 8 * j) object];
        if (v52 != v3 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v52 textViewportLayoutControllerDidLayout:self];
        }
      }
      uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v54 objects:v100 count:16];
    }
    while (v49);
  }

  *(_WORD *)&self->_viewportLayoutControllerFlags &= 0xFFF9u;
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v90, 8);
}

- (void)enumerateViewportElementsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 0x10) != 0)
  {
    if ((a4 & 4) != 0) {
      uint64_t v10 = [(NSTextViewportLayoutController *)self textContainer];
    }
    else {
      uint64_t v10 = 0;
    }
    id Weak = objc_loadWeak((id *)&self->_textLayoutManager);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91__NSTextViewportLayoutController_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke;
    v12[3] = &unk_1E55C7D00;
    v12[4] = v10;
    v12[5] = a5;
    [Weak enumerateTextLayoutFragmentsFromLocation:a3 options:a4 | 8 usingBlock:v12];
  }
  else
  {
    double v9 = [(NSTextViewportLayoutController *)self elementProvider];
    [(NSTextViewportElementProvider *)v9 enumerateViewportElementsFromLocation:a3 options:a4 usingBlock:a5];
  }
}

- (NSTextContainer)textContainer
{
  CGRect result = (NSTextContainer *)objc_loadWeak((id *)&self->_textContainer);
  if (!result)
  {
    id Weak = objc_loadWeak((id *)&self->_textLayoutManager);
    return (NSTextContainer *)[Weak textContainer];
  }
  return result;
}

- (NSTextLayoutManager)textLayoutManager
{
  return (NSTextLayoutManager *)objc_loadWeak((id *)&self->_textLayoutManager);
}

- (id)renderingSurfaceUpdater
{
  return objc_getProperty(self, a2, 120, 1);
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (id)_platformRenderingSurfaceUpdater
{
  return objc_getProperty(self, a2, 128, 1);
}

+ (BOOL)flushesCachedViewportElements
{
  if (flushesCachedViewportElements_onceToken != -1) {
    dispatch_once(&flushesCachedViewportElements_onceToken, &__block_literal_global_32);
  }
  return flushesCachedViewportElements_flushesCachedViewportElements;
}

- (void)enumerateTextViewportElementsInRect:(CGRect)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  char v6 = a4;
  id v7 = -[NSTextViewportLayoutController textViewportElementsInRect:](self, "textViewportElementsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__NSTextViewportLayoutController_enumerateTextViewportElementsInRect_options_usingBlock___block_invoke;
  v8[3] = &unk_1E55C7E80;
  v8[4] = a5;
  [v7 enumerateObjectsWithOptions:2 * (v6 & 1) usingBlock:v8];
}

- (NSTextRange)viewportRange
{
  if (*(_WORD *)&self->_viewportLayoutControllerFlags) {
    return self->_viewportRange;
  }
  else {
    return 0;
  }
}

BOOL __61__NSTextViewportLayoutController_textViewportElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  [a2 layoutPoint];
  double v5 = v4;
  [a2 layoutSize];
  return v5 + v6 <= *(double *)(a1 + 40);
}

- (id)textViewportElementsInRect:(CGRect)a3
{
  if (*(_WORD *)&self->_viewportLayoutControllerFlags)
  {
    NSRect v27 = NSIntersectionRect(a3, self->_viewportBounds);
    CGFloat x = v27.origin.x;
    double y = v27.origin.y;
    CGFloat width = v27.size.width;
    double height = v27.size.height;
    viewportElements = self->_viewportElements;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    double v24 = __61__NSTextViewportLayoutController_textViewportElementsInRect___block_invoke;
    double v25 = &__block_descriptor_64_e33_B16__0___NSTextViewportElement__8l;
    NSRect v26 = v27;
    uint64_t v10 = [(NSArray *)viewportElements count];
    if (v10)
    {
      unint64_t v11 = v10;
      unint64_t v12 = 0;
      do
      {
        uint64_t v13 = [(NSArray *)viewportElements objectAtIndexedSubscript:v12 + (v11 >> 1)];
        if (((unsigned int (*)(void *, uint64_t))v24)(v23, v13))
        {
          v12 += (v11 >> 1) + 1;
          v11 += ~(v11 >> 1);
        }
        else
        {
          v11 >>= 1;
        }
      }
      while (v11);
    }
    else
    {
      unint64_t v12 = 0;
    }
    for (uint64_t i = (void *)[MEMORY[0x1E4F1CA48] array];
          v12 < [(NSArray *)self->_viewportElements count];
          ++v12)
    {
      id v15 = [(NSArray *)self->_viewportElements objectAtIndexedSubscript:v12];
      [v15 layoutPoint];
      CGFloat v17 = v16;
      [v15 layoutPoint];
      double v19 = v18;
      [v15 layoutSize];
      CGFloat v21 = v20;
      [v15 layoutSize];
      if (y + height < v19) {
        break;
      }
      v29.size.double height = v22;
      v28.origin.CGFloat x = x;
      v28.origin.double y = y;
      v28.size.CGFloat width = width;
      v28.size.double height = height;
      v29.origin.CGFloat x = v17;
      v29.origin.double y = v19;
      v29.size.CGFloat width = v21;
      if (NSIntersectsRect(v28, v29)) {
        [i addObject:v15];
      }
    }
    return (id)[i copy];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: %@ cannot be called during layout.", self, _NSFullMethodName() format];
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

uint64_t __48__NSTextViewportLayoutController_layoutViewport__block_invoke_4(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  [a2 layoutPoint];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [a2 layoutSize];
  double v11 = v10;
  double v13 = v12;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [a2 representedRange];
  uint64_t v14 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v14 + 112) & 0x10) != 0)
  {
    uint64_t v15 = *(void *)(a1 + 64);
    double v16 = *(void **)(*(void *)(v15 + 8) + 40);
    if (v16)
    {
      char v17 = objc_msgSend((id)objc_msgSend(v16, "enclosingTextRange"), "containsLocation:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "location"));
      uint64_t v15 = *(void *)(a1 + 64);
      if ((v17 & 1) == 0)
      {
        *(void *)(*(void *)(v15 + 8) + 40) = 0;
        uint64_t v15 = *(void *)(a1 + 64);
      }
    }
    uint64_t v18 = *(void *)(*(void *)(v15 + 8) + 40);
    uint64_t v14 = *(void *)(a1 + 32);
    if (!v18)
    {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend(objc_loadWeak((id *)(v14 + 8)), "_textAnimationContextForLocation:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8)+ 40), "location"));
      uint64_t v14 = *(void *)(a1 + 32);
    }
  }
  if ((*(_WORD *)(v14 + 112) & 0x200) != 0 || *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    *(CGFloat *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) = v7;
    uint64_t v19 = *(void *)(a1 + 32);
    if ((*(_WORD *)(v19 + 112) & 0x200) != 0)
    {
      objc_msgSend(objc_loadWeak((id *)(v19 + 24)), "textViewportLayoutController:presentationLayoutFragmentFrameForTextLayoutFragment:proposedOrigin:", *(void *)(a1 + 32), a2, *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    }
    else
    {
      double v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      double v21 = v13;
      double v22 = v11;
      CGFloat v23 = v9;
      CGFloat v24 = v7;
      if (!v20) {
        goto LABEL_14;
      }
      objc_msgSend(v20, "presentationLayoutFragmentFrameForTextLayoutFragment:proposedOrigin:", a2, *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v11);
    }
    CGFloat v24 = v25;
    CGFloat v23 = v26;
    double v21 = v27;
LABEL_14:
    CGFloat v28 = v24;
    CGFloat v29 = v23;
    double v30 = v21;
    v50.origin.CGFloat x = v7;
    v50.origin.double y = v9;
    v50.size.CGFloat width = v11;
    v50.size.double height = v13;
    if (!CGRectEqualToRect(*(CGRect *)(&v22 - 2), v50))
    {
      uint64_t v31 = *(void *)(*(void *)(a1 + 72) + 8);
      *(CGFloat *)(v31 + 32) = v24;
      *(CGFloat *)(v31 + 40) = v23;
      double v13 = v21;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    *(CGFloat *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) = v7;
    objc_msgSend(a2, "setLayoutPoint:", *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }
  uint64_t v32 = *(void *)(a1 + 32);
  if ((*(_WORD *)(v32 + 112) & 0x80) != 0)
  {
    uint64_t v33 = [objc_loadWeak((id *)(v32 + 24)) textViewportLayoutController:*(void *)(a1 + 32) renderingSurfaceForTextLayoutFragment:a2];
    if (v33) {
      [*(id *)(a1 + 32) setRenderingSurface:v33 forKey:a2];
    }
  }
  id v34 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (!v34
    || [v34 _hasRenderableComponentsForRange:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
  {
    BOOL v35 = *(void **)(a1 + 40);
    if ((*(_WORD *)(*(void *)(a1 + 32) + 112) & 0x20) != 0) {
      objc_msgSend(v35, "textViewportLayoutController:configureRenderingSurfaceForTextLayoutFragment:");
    }
    else {
      [v35 layoutElement:a2];
    }
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 40) textViewportLayoutController:*(void *)(a1 + 32) didLayoutTextViewportElement:a2];
    }
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v36 = *(void **)(*(void *)(a1 + 32) + 104);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * i) object];
        if (v41 != *(void **)(a1 + 40) && (objc_opt_respondsToSelector() & 1) != 0) {
          [v41 textViewportLayoutController:*(void *)(a1 + 32) configureRenderingSurfaceForTextLayoutFragment:a2];
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v38);
  }
  uint64_t result = [*(id *)(a1 + 48) addObject:a2];
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v13
                                                              + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 40);
  uint64_t v43 = *(void *)(*(void *)(a1 + 88) + 8);
  if (!*(void *)(v43 + 40)) {
    *(void *)(v43 + 40) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  if (*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) >= *(double *)(a1 + 104) + *(double *)(a1 + 120)) {
    *a3 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  return result;
}

- (void)setRenderingSurface:(id)a3 forKey:(id)a4
{
  objc_sync_enter(self);
  renderingSurfaces = self->_renderingSurfaces;
  if (!renderingSurfaces)
  {
    renderingSurfaces = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:0];
    self->_renderingSurfaces = renderingSurfaces;
  }
  [(NSMapTable *)renderingSurfaces setObject:a3 forKey:a4];

  objc_sync_exit(self);
}

- (NSTextViewportLayoutController)initWithTextContainer:(id)a3
{
  double v4 = -[NSTextViewportLayoutController initWithTextLayoutManager:](self, "initWithTextLayoutManager:", [a3 textLayoutManager]);
  double v5 = v4;
  if (v4) {
    objc_storeWeak((id *)&v4->_textContainer, a3);
  }
  return v5;
}

- (NSTextViewportLayoutController)initWithTextLayoutManager:(NSTextLayoutManager *)textLayoutManager
{
  v8.receiver = self;
  v8.super_class = (Class)NSTextViewportLayoutController;
  double v4 = [(NSTextViewportLayoutController *)&v8 init];
  double v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_viewportLayoutControllerFlags |= 1u;
    objc_storeWeak((id *)&v4->_textLayoutManager, textLayoutManager);
    v5->_viewportLayoutObservers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_loadWeak((id *)&v5->_textLayoutManager);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v6 = 16;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&v5->___int16 viewportLayoutControllerFlags = *(_WORD *)&v5->_viewportLayoutControllerFlags & 0xFFEF | v6;
  }
  return v5;
}

- (void)set_platformRenderingSurfaceUpdater:(id)a3
{
}

uint64_t __63__NSTextViewportLayoutController_flushesCachedViewportElements__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"_NSTextViewportLayoutControllerDisablesFlushingCachedViewportElements");
  flushesCachedViewportElements_flushesCachedViewportElements = result ^ 1;
  return result;
}

- (BOOL)addRenderingSurface:(id)a3 key:(id)a4 group:(int64_t)a5 placement:(int64_t)a6
{
  if ((~*(_WORD *)&self->_viewportLayoutControllerFlags & 0x108) != 0)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    int v9 = [objc_loadWeak((id *)&self->_delegate) textViewportLayoutController:self addRenderingSurface:a3 group:a5 placement:a6];
    if (v9)
    {
      [(NSTextViewportLayoutController *)self setRenderingSurface:a3 forKey:a4];
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

uint64_t __89__NSTextViewportLayoutController_enumerateTextViewportElementsInRect_options_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDelegate:(id)delegate
{
  p_delegate = &self->_delegate;
  if (objc_loadWeak((id *)&self->_delegate) != delegate)
  {
    objc_storeWeak((id *)p_delegate, delegate);
    int v6 = [objc_loadWeak((id *)p_delegate) conformsToProtocol:&unk_1EDD8BBA8];
    __int16 v7 = 0;
    if (v6) {
      __int16 v8 = 32;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->___int16 viewportLayoutControllerFlags = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xFFDF | v8;
    if (v6)
    {
      objc_loadWeak((id *)p_delegate);
      if (objc_opt_respondsToSelector())
      {
        objc_loadWeak((id *)p_delegate);
        if (objc_opt_respondsToSelector()) {
          __int16 v7 = 32;
        }
        else {
          __int16 v7 = 0;
        }
      }
      else
      {
        __int16 v7 = 0;
      }
    }
    *(_WORD *)&self->___int16 viewportLayoutControllerFlags = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xFFDF | v7;
    objc_loadWeak((id *)p_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 64;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->___int16 viewportLayoutControllerFlags = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xFFBF | v9;
    objc_loadWeak((id *)p_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 128;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->___int16 viewportLayoutControllerFlags = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xFF7F | v10;
    objc_loadWeak((id *)p_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 256;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->___int16 viewportLayoutControllerFlags = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xFEFF | v11;
    objc_loadWeak((id *)p_delegate);
    if (objc_opt_respondsToSelector())
    {
      __int16 v12 = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xF3FF | 0x400;
    }
    else
    {
      objc_loadWeak((id *)p_delegate);
      char v13 = objc_opt_respondsToSelector();
      __int16 v12 = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xF3FF;
      if (v13) {
        v12 |= 0x800u;
      }
    }
    *(_WORD *)&self->___int16 viewportLayoutControllerFlags = v12;
    objc_loadWeak((id *)p_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 512;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&self->___int16 viewportLayoutControllerFlags = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xFDFF | v14;
  }
}

- (void)setRenderingSurfaceUpdater:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_textContainer);

  objc_destroyWeak((id *)&self->_textLayoutManager);
}

uint64_t __48__NSTextViewportLayoutController_layoutViewport__block_invoke_2(uint64_t result, void *a2, unsigned char *a3)
{
  if (*(double *)(*(void *)(*(void *)(result + 32) + 8) + 40) <= *(double *)(result + 56))
  {
    *a3 = 1;
  }
  else
  {
    uint64_t v4 = result;
    [a2 layoutSize];
    *(double *)(*(void *)(*(void *)(v4 + 32) + 8) + 40) = *(double *)(*(void *)(*(void *)(v4 + 32) + 8)
                                                                            + 40)
                                                                - v5;
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "representedRange"), "location");
    *(void *)(*(void *)(*(void *)(v4 + 40) + 8) + 40) = result;
  }
  return result;
}

- (CGFloat)relocateViewportToTextLocation:(id)textLocation
{
  uint64_t v34 = 0;
  BOOL v35 = (double *)&v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v28 = 0;
  CGFloat v29 = &v28;
  uint64_t v30 = 0x3052000000;
  uint64_t v31 = __Block_byref_object_copy__15;
  uint64_t v32 = __Block_byref_object_dispose__15;
  uint64_t v33 = 0;
  if (-[NSTextRange containsLocation:](self->_viewportRange, "containsLocation:"))
  {
    id v5 = [(NSTextViewportLayoutController *)self textViewportElementForLocation:textLocation];
    id v6 = v5;
    v29[5] = (uint64_t)v6;
    [v5 layoutPoint];
    *((void *)v35 + 3) = v7;
  }
  else
  {
    if (objc_msgSend(-[NSTextRange location](self->_viewportRange, "location"), "compare:", textLocation) == 1)
    {
      uint64_t v24 = 0;
      double v25 = (double *)&v24;
      uint64_t v26 = 0x2020000000;
      uint64_t v27 = 0;
      v23[0] = 0;
      v23[1] = v23;
      void v23[2] = 0x2020000000;
      v23[3] = 0;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __65__NSTextViewportLayoutController_relocateViewportToTextLocation___block_invoke;
      v22[3] = &unk_1E55C7DC8;
      v22[4] = textLocation;
      v22[5] = v23;
      v22[6] = &v28;
      v22[7] = &v34;
      v22[8] = &v24;
      [(NSTextViewportLayoutController *)self enumerateViewportElementsFromLocation:0 options:2 usingBlock:v22];
      if (!v29[5])
      {
        v21[0] = 0;
        v21[1] = v21;
        v21[2] = 0x2020000000;
        v21[3] = 0;
        id v8 = [(NSTextRange *)self->_viewportRange location];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __65__NSTextViewportLayoutController_relocateViewportToTextLocation___block_invoke_2;
        v20[3] = &unk_1E55C7DF0;
        v20[6] = v21;
        v20[7] = &v28;
        v20[8] = &v34;
        v20[4] = textLocation;
        v20[5] = self;
        [(NSTextViewportLayoutController *)self enumerateViewportElementsFromLocation:v8 options:3 usingBlock:v20];
        _Block_object_dispose(v21, 8);
      }
      _Block_object_dispose(v23, 8);
    }
    else
    {
      uint64_t v24 = 0;
      double v25 = (double *)&v24;
      uint64_t v26 = 0x2020000000;
      uint64_t v27 = 0;
      id v9 = [(NSTextRange *)self->_viewportRange endLocation];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __65__NSTextViewportLayoutController_relocateViewportToTextLocation___block_invoke_3;
      v19[3] = &unk_1E55C7E18;
      v19[4] = textLocation;
      v19[5] = &v28;
      v19[6] = &v24;
      [(NSTextViewportLayoutController *)self enumerateViewportElementsFromLocation:v9 options:2 usingBlock:v19];
      if (v29[5]
        || !objc_msgSend(textLocation, "isEqual:", -[NSTextRange endLocation](self->_viewportRange, "endLocation")))
      {
        double v11 = CGRectGetMaxY(self->_viewportBounds) + self->_viewportOffset.y + v25[3];
      }
      else
      {
        id v10 = [(NSArray *)self->_viewportElements lastObject];
        v29[5] = (uint64_t)v10;
        [v10 layoutPoint];
      }
      v35[3] = v11;
    }
    _Block_object_dispose(&v24, 8);
  }
  __int16 v12 = (CGFloat *)MEMORY[0x1E4F1DAD8];
  char v13 = (void *)v29[5];
  if (v13)
  {
    [v13 verticalOffsetOfTextLocation:textLocation withAffinity:1];
    double v15 = v14;
  }
  else
  {
    double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  CGFloat v16 = *v12;
  CGFloat v17 = fmax(v15 + v35[3], 0.0);
  self->_viewportBounds.origin.double y = v17;
  self->_viewportOffset.CGFloat x = v16;
  self->_viewportOffset.double y = v15;

  self->_viewportRange = [[NSTextRange alloc] initWithLocation:textLocation];
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  return v17;
}

id __65__NSTextViewportLayoutController_relocateViewportToTextLocation___block_invoke(void *a1, void *a2, BOOL *a3)
{
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  if (objc_msgSend((id)objc_msgSend(a2, "representedRange"), "containsLocation:", a1[4]))
  {
    id result = a2;
    *(void *)(*(void *)(a1[6] + 8) + 40) = result;
    double v7 = *(double *)(*(void *)(a1[8] + 8) + 24);
    uint64_t v8 = *(void *)(a1[7] + 8);
  }
  else
  {
    id result = (id)[a2 layoutSize];
    uint64_t v8 = *(void *)(a1[8] + 8);
    double v7 = v9 + *(double *)(v8 + 24);
  }
  *(double *)(v8 + 24) = v7;
  if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = *(void *)(*(void *)(a1[5] + 8) + 24) > 99;
  }
  *a3 = v10;
  return result;
}

CGFloat __65__NSTextViewportLayoutController_relocateViewportToTextLocation___block_invoke_2(void *a1, void *a2)
{
  [a2 layoutSize];
  *(double *)(*(void *)(a1[6] + 8) + 24) = v4 + *(double *)(*(void *)(a1[6] + 8) + 24);
  if (objc_msgSend((id)objc_msgSend(a2, "representedRange"), "containsLocation:", a1[4]))
  {
    *(void *)(*(void *)(a1[7] + 8) + 40) = a2;
    id v6 = (CGRect *)a1[5];
    CGFloat result = CGRectGetMinY(v6[1]) + v6[2].origin.y - *(double *)(*(void *)(a1[6] + 8) + 24);
    *(CGFloat *)(*(void *)(a1[8] + 8) + 24) = result;
  }
  return result;
}

double __65__NSTextViewportLayoutController_relocateViewportToTextLocation___block_invoke_3(void *a1, void *a2, unsigned char *a3)
{
  if (objc_msgSend((id)objc_msgSend(a2, "representedRange"), "containsLocation:", a1[4]))
  {
    *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
    *a3 = 1;
  }
  else
  {
    [a2 layoutSize];
    uint64_t v7 = *(void *)(a1[6] + 8);
    double result = v8 + *(double *)(v7 + 24);
    *(double *)(v7 + 24) = result;
  }
  return result;
}

- (void)adjustViewportByVerticalOffset:(CGFloat)verticalOffset
{
  self->_viewportBounds.origin.double y = fmax(self->_viewportBounds.origin.y + verticalOffset, 0.0);
}

- (void)adjustViewport:(double)a3 atLocation:(id)a4 verticalOffsetFromLocation:(double)a5
{
  [(NSTextViewportLayoutController *)self adjustViewportByVerticalOffset:a3];
  if (a4)
  {
    double v8 = self->_viewportRange;
    self->_viewportRange = [[NSTextRange alloc] initWithLocation:a4];
  }
  self->_viewportOffset.double y = a5;
}

- (CGRect)viewportBounds
{
  __int16 viewportLayoutControllerFlags = (__int16)self->_viewportLayoutControllerFlags;
  p_viewportBounds = (CGRect *)MEMORY[0x1E4F28AD8];
  p_double height = (CGFloat *)(MEMORY[0x1E4F28AD8] + 24);
  p_size = (CGSize *)(MEMORY[0x1E4F28AD8] + 16);
  BOOL v6 = (viewportLayoutControllerFlags & 1) == 0;
  if (viewportLayoutControllerFlags) {
    p_double y = &self->_viewportBounds.origin.y;
  }
  else {
    p_double y = (CGFloat *)(MEMORY[0x1E4F28AD8] + 8);
  }
  if (!v6)
  {
    p_viewportBounds = &self->_viewportBounds;
    p_size = &self->_viewportBounds.size;
    p_double height = &self->_viewportBounds.size.height;
  }
  double v8 = *p_height;
  double width = p_size->width;
  double x = p_viewportBounds->origin.x;
  double v11 = *p_y;
  result.size.double height = v8;
  result.size.double width = width;
  result.origin.double y = v11;
  result.origin.double x = x;
  return result;
}

- (void)_resetLayout
{
  *(_WORD *)&self->_viewportLayoutControllerFlags |= 4u;
}

- (id)renderingSurfaceForKey:(id)a3
{
  objc_sync_enter(self);
  id v5 = [(NSMapTable *)self->_renderingSurfaces objectForKey:a3];
  objc_sync_exit(self);
  return v5;
}

- (id)textViewportElementAtPoint:(CGPoint)a3
{
  if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 1) == 0)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: %@ cannot be called during layout.", self, _NSFullMethodName() format];
    return 0;
  }
  double y = a3.y;
  viewportElements = self->_viewportElements;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  CGFloat v17 = __61__NSTextViewportLayoutController_textViewportElementAtPoint___block_invoke;
  uint64_t v18 = &__block_descriptor_48_e33_B16__0___NSTextViewportElement__8l;
  CGPoint v19 = a3;
  uint64_t v6 = [(NSArray *)viewportElements count];
  if (v6)
  {
    unint64_t v7 = v6;
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(NSArray *)viewportElements objectAtIndexedSubscript:v8 + (v7 >> 1)];
      if (((unsigned int (*)(void *, uint64_t))v17)(v16, v9))
      {
        v8 += (v7 >> 1) + 1;
        v7 += ~(v7 >> 1);
      }
      else
      {
        v7 >>= 1;
      }
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }
  if (v8 >= [(NSArray *)self->_viewportElements count]) {
    return 0;
  }
  id v10 = [(NSArray *)self->_viewportElements objectAtIndexedSubscript:v8];
  [v10 layoutPoint];
  if (y < v11) {
    return 0;
  }
  [v10 layoutPoint];
  double v13 = v12;
  [v10 layoutSize];
  if (y > v13 + v14) {
    return 0;
  }
  return v10;
}

BOOL __61__NSTextViewportLayoutController_textViewportElementAtPoint___block_invoke(uint64_t a1, void *a2)
{
  [a2 layoutPoint];
  double v5 = v4;
  [a2 layoutSize];
  return v5 + v6 <= *(double *)(a1 + 40);
}

- (id)locationAtPoint:(CGPoint)a3
{
  if (*(_WORD *)&self->_viewportLayoutControllerFlags)
  {
    double y = a3.y;
    double x = a3.x;
    id v6 = -[NSTextViewportLayoutController textViewportElementAtPoint:](self, "textViewportElementAtPoint:");
    [v6 layoutPoint];
    double v8 = x - v7;
    [v6 layoutPoint];
    double v10 = y - v9;
    return (id)objc_msgSend(v6, "representedRangeAtPoint:", v8, v10);
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: %@ cannot be called during layout.", self, _NSFullMethodName() format];
    return 0;
  }
}

- (id)textViewportElementForLocation:(id)a3
{
  if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 1) == 0)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: %@ cannot be called during layout.", self, _NSFullMethodName() format];
    return 0;
  }
  viewportElements = self->_viewportElements;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  double v13 = __65__NSTextViewportLayoutController_textViewportElementForLocation___block_invoke;
  double v14 = &unk_1E55C7EA8;
  id v15 = a3;
  uint64_t v6 = [(NSArray *)viewportElements count];
  if (v6)
  {
    unint64_t v7 = v6;
    NSUInteger v8 = 0;
    do
    {
      uint64_t v9 = [(NSArray *)viewportElements objectAtIndexedSubscript:v8 + (v7 >> 1)];
      if (((unsigned int (*)(void *, uint64_t))v13)(v12, v9))
      {
        v8 += (v7 >> 1) + 1;
        v7 += ~(v7 >> 1);
      }
      else
      {
        v7 >>= 1;
      }
    }
    while (v7);
  }
  else
  {
    NSUInteger v8 = 0;
  }
  if (v8 == [(NSArray *)self->_viewportElements count]
    && [(NSArray *)self->_viewportElements count]
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray lastObject](self->_viewportElements, "lastObject"), "representedRange"), "endLocation"), "isEqual:", a3))
  {
    NSUInteger v8 = [(NSArray *)self->_viewportElements count] - 1;
  }
  if (v8 >= [(NSArray *)self->_viewportElements count]) {
    return 0;
  }
  id v10 = [(NSArray *)self->_viewportElements objectAtIndexedSubscript:v8];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "representedRange"), "location"), "compare:", a3) == 1
    || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "representedRange"), "endLocation"), "compare:", a3) == -1)
  {
    return 0;
  }
  return v10;
}

BOOL __65__NSTextViewportLayoutController_textViewportElementForLocation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "representedRange"), "endLocation"), "compare:", *(void *)(a1 + 32)) != 1;
}

- (void)addViewportLayoutObserver:(id)a3
{
  double v4 = [[_NSTextViewportLayoutObserver alloc] initWithWeakObject:a3];
  if ((-[NSMutableArray containsObject:](self->_viewportLayoutObservers, "containsObject:") & 1) == 0) {
    [(NSMutableArray *)self->_viewportLayoutObservers addObject:v4];
  }
}

- (void)removeViewportLayoutObserver:(id)a3
{
  double v4 = [[_NSTextViewportLayoutObserver alloc] initWithWeakObject:a3];
  [(NSMutableArray *)self->_viewportLayoutObservers removeObject:v4];
}

@end
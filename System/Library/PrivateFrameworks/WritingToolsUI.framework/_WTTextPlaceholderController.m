@interface _WTTextPlaceholderController
+ (BOOL)_delegateImplementsInsertionMethods:(id)a3;
+ (BOOL)_delegateImplementsRemovalMethods:(id)a3;
+ (id)placeholderControllerForDelegate:(id)a3;
+ (void)removePlaceholderControllerForDelegate:(id)a3;
- (_WTTextPlaceholderController)initWithDelegate:(id)a3;
- (double)_widthRatioForIteration:(int)a3 isFinal:(BOOL)a4;
- (id)_visualRectsForRects:(id)a3 containerBounds:(CGRect)a4 caretRect:(CGRect)a5;
- (int64_t)pattern;
- (void)_beginShowingShimmerHighlightsWithCaretRect:(CGRect)a3;
- (void)_endShowingShimmerHighlightsWithCompletion:(id)a3;
- (void)_insertPlaceholderAndBeginShimmerWithCaretRect:(CGRect)a3 placeholderSize:(CGSize)a4;
- (void)beginPlaceholder;
- (void)endPlaceholderAndWillInsertText:(BOOL)a3 completion:(id)a4;
- (void)setPattern:(int64_t)a3;
- (void)textPreviewForRect:(CGRect)a3 completion:(id)a4;
- (void)textPreviewsForChunk:(id)a3 completion:(id)a4;
- (void)updateIsTextVisible:(BOOL)a3 forChunk:(id)a4 completion:(id)a5;
@end

@implementation _WTTextPlaceholderController

+ (id)placeholderControllerForDelegate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  objc_getAssociatedObject(v4, &_WTTextPlaceholderControllerIdentifier);
  v6 = (_WTTextPlaceholderController *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    goto LABEL_7;
  }
  if ([a1 _delegateImplementsInsertionMethods:v5]
    && [a1 _delegateImplementsRemovalMethods:v5])
  {
    v6 = [[_WTTextPlaceholderController alloc] initWithDelegate:v5];
    objc_setAssociatedObject(v5, &_WTTextPlaceholderControllerIdentifier, v6, (void *)0x301);
  }
  else
  {
LABEL_6:
    v6 = 0;
  }
LABEL_7:

  return v6;
}

+ (void)removePlaceholderControllerForDelegate:(id)a3
{
  if (a3) {
    objc_setAssociatedObject(a3, &_WTTextPlaceholderControllerIdentifier, 0, (void *)0x301);
  }
}

+ (BOOL)_delegateImplementsInsertionMethods:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = 1;
  }
  else {
    char v4 = objc_opt_respondsToSelector();
  }

  return v4 & 1;
}

+ (BOOL)_delegateImplementsRemovalMethods:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = 1;
  }
  else {
    char v4 = objc_opt_respondsToSelector();
  }

  return v4 & 1;
}

- (_WTTextPlaceholderController)initWithDelegate:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_WTTextPlaceholderController;
  v6 = [(_WTTextPlaceholderController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_delegate, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    completionHandlers = v7->_completionHandlers;
    v7->_completionHandlers = (NSMutableArray *)v8;

    v7->_completionLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)beginPlaceholder
{
  if ([(id)objc_opt_class() _delegateImplementsRemovalMethods:self->_delegate])
  {
    if (self->_delegate && self->_placeholder) {
      [(_WTTextPlaceholderController *)self endPlaceholderAndWillInsertText:0 completion:0];
    }
    double x = *MEMORY[0x263F001A0];
    double y = *(double *)(MEMORY[0x263F001A0] + 8);
    double width = *(double *)(MEMORY[0x263F001A0] + 16);
    double height = *(double *)(MEMORY[0x263F001A0] + 24);
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      v7 = [self->_delegate selectedTextRange];
      uint64_t v8 = [v7 start];

      if (v8)
      {
        [self->_delegate caretRectForPosition:v8];
        double x = v11.origin.x;
        double y = v11.origin.y;
        double width = v11.size.width;
        double height = v11.size.height;
        if (CGRectIsNull(v11)) {
          double v9 = 60.0;
        }
        else {
          double v9 = height + height;
        }
      }
      else
      {
        double v9 = 60.0;
      }
    }
    else
    {
      double v9 = 60.0;
    }
    -[_WTTextPlaceholderController _insertPlaceholderAndBeginShimmerWithCaretRect:placeholderSize:](self, "_insertPlaceholderAndBeginShimmerWithCaretRect:placeholderSize:", x, y, width, height, 0.0, v9);
  }
}

- (void)_insertPlaceholderAndBeginShimmerWithCaretRect:(CGRect)a3 placeholderSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.size.height;
  double v7 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(self->_delegate, "insertTextPlaceholderWithSize:", width, height);
    CGRect v11 = (UITextPlaceholder *)objc_claimAutoreleasedReturnValue();
    placeholder = self->_placeholder;
    self->_placeholder = v11;

    -[_WTTextPlaceholderController _beginShowingShimmerHighlightsWithCaretRect:](self, "_beginShowingShimmerHighlightsWithCaretRect:", x, y, v7, v6);
  }
  else if (objc_opt_respondsToSelector())
  {
    id delegate = self->_delegate;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __95___WTTextPlaceholderController__insertPlaceholderAndBeginShimmerWithCaretRect_placeholderSize___block_invoke;
    v15[3] = &unk_26558E7A8;
    v15[4] = self;
    *(double *)&v15[5] = x;
    *(double *)&v15[6] = y;
    *(double *)&v15[7] = v7;
    *(double *)&v15[8] = v6;
    objc_msgSend(delegate, "insertTextPlaceholderWithSize:completionHandler:", v15, width, height);
  }
  else
  {
    v14 = self->_placeholder;
    self->_placeholder = 0;
  }
}

- (double)_widthRatioForIteration:(int)a3 isFinal:(BOOL)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v7[0] = xmmword_261C14010;
  v7[1] = xmmword_261C14020;
  uint64_t v8 = 0x3FE999999999999ALL;
  int64_t pattern = self->_pattern;
  if (pattern == 1) {
    return *((double *)v7 + a3 % 5);
  }
  double result = 1.0;
  double v6 = 0.5;
  if (!a4) {
    double v6 = 1.0;
  }
  if (!pattern) {
    return v6;
  }
  return result;
}

- (id)_visualRectsForRects:(id)a3 containerBounds:(CGRect)a4 caretRect:(CGRect)a5
{
  double height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v9 = a4.size.height;
  double v10 = a4.size.width;
  CGFloat v11 = a4.origin.y;
  CGFloat v12 = a4.origin.x;
  id v14 = a3;
  if ([v14 count])
  {
    v15 = [v14 firstObject];
    uint64_t v16 = [v15 writingDirection];

    id v17 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
    if ([v14 count] == 1)
    {
      v18 = [v14 firstObject];
      v47.origin.CGFloat x = x;
      v47.origin.double y = y;
      v47.size.CGFloat width = width;
      v47.size.double height = height;
      if (CGRectIsNull(v47) || ([v18 rect], CGRectGetHeight(v48) < height))
      {
        [v18 rect];
        double height = CGRectGetHeight(v49);
      }
      [v18 rect];
      double MinY = CGRectGetMinY(v50);
      [v18 rect];
      double MaxY = CGRectGetMaxY(v51);
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      int v23 = [v22 isEqualToString:@"WKTextSelectionRect"];

      if (v23)
      {
        [v18 rect];
        double MaxY = y + v24;
        double MinY = y;
      }
      uint64_t v25 = 0;
      do
      {
        if (MinY > MaxY) {
          break;
        }
        double v26 = height + MinY;
        [(_WTTextPlaceholderController *)self _widthRatioForIteration:v25 isFinal:height + MinY > MaxY];
        double v28 = v10 * v27;
        [v18 rect];
        double MinX = CGRectGetMinX(v52);
        double v30 = MinY + 1.5;
        [v18 rect];
        double v31 = v10 - (v28 + CGRectGetMinX(v53) * -2.0);
        if (v16 != 1) {
          double v31 = MinX;
        }
        v32 = +[WTTextSelectionRect rectWithRect:](WTTextSelectionRect, "rectWithRect:", v31, v30);
        [v17 addObject:v32];

        uint64_t v25 = (v25 + 1);
        double MinY = v26;
      }
      while (v26 <= MaxY);
    }
    else
    {
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x2020000000;
      int v45 = 0;
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __79___WTTextPlaceholderController__visualRectsForRects_containerBounds_caretRect___block_invoke;
      v34[3] = &unk_26558E7D0;
      CGFloat v39 = v12;
      CGFloat v40 = v11;
      double v41 = v10;
      CGFloat v42 = v9;
      id v35 = v14;
      v36 = self;
      v38 = v44;
      uint64_t v43 = v16;
      id v17 = v17;
      id v37 = v17;
      [v35 enumerateObjectsUsingBlock:v34];

      _Block_object_dispose(v44, 8);
    }
  }
  else
  {
    id v17 = (id)MEMORY[0x263EFFA68];
  }

  return v17;
}

- (void)_beginShowingShimmerHighlightsWithCaretRect:(CGRect)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [self->_delegate textInputView];
LABEL_5:
    id v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = self->_delegate;
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:
  double v6 = [(UITextPlaceholder *)self->_placeholder rects];
  [v5 bounds];
  double v7 = -[_WTTextPlaceholderController _visualRectsForRects:containerBounds:caretRect:](self, "_visualRectsForRects:containerBounds:caretRect:", v6);

  Mutable = CGPathCreateMutable();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_msgSend(v14, "rect", (void)v38);
        if (!CGRectIsEmpty(v44))
        {
          [v14 rect];
          double v16 = v15 * 0.5;
          if (v15 * 0.5 < 0.0) {
            double v16 = -(v15 * 0.5);
          }
          if (v16 <= 4.0) {
            double v17 = v16;
          }
          else {
            double v17 = 4.0;
          }
          [v14 rect];
          double v19 = v18 * 0.5;
          if (v18 * 0.5 < 0.0) {
            double v19 = -(v18 * 0.5);
          }
          if (v19 <= 4.0) {
            double v20 = v19;
          }
          else {
            double v20 = 4.0;
          }
          [v14 rect];
          CGPathAddRoundedRect(Mutable, 0, v45, v17, v20);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v11);
  }

  v21 = [[_WTTextPreview alloc] initWithContentPath:Mutable];
  textPreview = self->_textPreview;
  self->_textPreview = v21;

  CGPathRelease(Mutable);
  int v23 = [[_WTTextEffectView alloc] initWithAsyncSource:self];
  [v5 bounds];
  -[_WTTextEffectView setFrame:](v23, "setFrame:");
  objc_storeStrong((id *)&self->_effectView, v23);
  [v5 addSubview:self->_effectView];
  double v24 = -[_WTTextRangeChunk initWithRange:]([_WTTextRangeChunk alloc], "initWithRange:", 0, 1);
  int v25 = [v5 _WTIsDarkMode];
  double v26 = 0.75;
  if (v25) {
    double v26 = 0.5;
  }
  double v27 = objc_msgSend(MEMORY[0x263F825C8], "colorWithWhite:alpha:", v26, 1.0, (void)v38);
  double v28 = [[_WTSweepTextEffect alloc] initWithChunk:v24 effectView:v23];
  ponderingEffect = self->_ponderingEffect;
  self->_ponderingEffect = v28;

  [(_WTTextEffect *)self->_ponderingEffect setHidesOriginal:0];
  double v30 = [v9 firstObject];
  [v30 rect];
  -[_WTSweepTextEffect setLineSize:](self->_ponderingEffect, "setLineSize:", v31, v32);

  v33 = [MEMORY[0x263F825C8] clearColor];
  [(_WTSweepTextEffect *)self->_ponderingEffect setAnimateFromColor:v33];

  [(_WTSweepTextEffect *)self->_ponderingEffect setBaseFillColor:v27];
  v34 = [[_WTReplaceTextEffect alloc] initWithChunk:v24 effectView:v23];
  replaceTextEffect = self->_replaceTextEffect;
  self->_replaceTextEffect = v34;

  [(_WTReplaceTextEffect *)self->_replaceTextEffect setAnimateRemovalWhenDone:0];
  [(_WTTextEffect *)self->_replaceTextEffect setHidesOriginal:0];
  [(_WTTextEffect *)self->_replaceTextEffect setInvalidationDelay:0.5];
  v36 = [(_WTTextEffectView *)self->_effectView addEffect:self->_ponderingEffect];
  ponderingEffectUUID = self->_ponderingEffectUUID;
  self->_ponderingEffectUUID = v36;
}

- (void)textPreviewsForChunk:(id)a3 completion:(id)a4
{
  v8[1] = *MEMORY[0x263EF8340];
  v8[0] = self->_textPreview;
  id v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a4;
  double v7 = [v5 arrayWithObjects:v8 count:1];
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
}

- (void)textPreviewForRect:(CGRect)a3 completion:(id)a4
{
}

- (void)updateIsTextVisible:(BOOL)a3 forChunk:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)endPlaceholderAndWillInsertText:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  if (objc_opt_respondsToSelector())
  {
    double v7 = v16;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke;
    v16[3] = &unk_26558E7F8;
    uint64_t v8 = &v17;
    objc_copyWeak(&v17, &location);
    v16[4] = v6;
    [(_WTTextPlaceholderController *)self _endShowingShimmerHighlightsWithCompletion:v16];
LABEL_6:
    id v9 = (id *)(v7 + 4);
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    double v7 = v10;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke_5;
    v10[3] = &unk_26558E7F8;
    uint64_t v8 = &v11;
    objc_copyWeak(&v11, &location);
    v10[4] = v6;
    [(_WTTextPlaceholderController *)self _endShowingShimmerHighlightsWithCompletion:v10];
    goto LABEL_6;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke_2;
  v12[3] = &unk_26558E820;
  uint64_t v8 = &v14;
  objc_copyWeak(&v14, &location);
  BOOL v15 = a3;
  id v13 = v6;
  [(_WTTextPlaceholderController *)self _endShowingShimmerHighlightsWithCompletion:v12];
  id v9 = &v13;
LABEL_7:

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)_endShowingShimmerHighlightsWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  effectView = self->_effectView;
  if (effectView && [(_WTTextEffectView *)effectView hasActiveEffects])
  {
    if (v4)
    {
      os_unfair_lock_lock(&self->_completionLock);
      completionHandlers = self->_completionHandlers;
      double v7 = (void *)MEMORY[0x263E4F630](v4);
      [(NSMutableArray *)completionHandlers addObject:v7];

      os_unfair_lock_unlock(&self->_completionLock);
    }
    if (!self->_replaceEffectUUID || !-[_WTTextEffectView hasActiveEffect:](self->_effectView, "hasActiveEffect:"))
    {
      id v8 = [(_WTTextEffectView *)self->_effectView removeEffect:self->_ponderingEffectUUID];
      id v9 = [(_WTTextEffectView *)self->_effectView addEffect:self->_replaceTextEffect];
      replaceEffectUUID = self->_replaceEffectUUID;
      self->_replaceEffectUUID = v9;

      ponderingEffectUUID = self->_ponderingEffectUUID;
      self->_ponderingEffectUUID = 0;

      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __75___WTTextPlaceholderController__endShowingShimmerHighlightsWithCompletion___block_invoke;
      v12[3] = &unk_26558E458;
      objc_copyWeak(&v13, &location);
      [(_WTReplaceTextEffect *)self->_replaceTextEffect setCompletion:v12];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

- (int64_t)pattern
{
  return self->_pattern;
}

- (void)setPattern:(int64_t)a3
{
  self->_int64_t pattern = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textPreview, 0);
  objc_storeStrong((id *)&self->_replaceEffectUUID, 0);
  objc_storeStrong((id *)&self->_ponderingEffectUUID, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_replaceTextEffect, 0);
  objc_storeStrong((id *)&self->_ponderingEffect, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);

  objc_storeStrong(&self->_delegate, 0);
}

@end
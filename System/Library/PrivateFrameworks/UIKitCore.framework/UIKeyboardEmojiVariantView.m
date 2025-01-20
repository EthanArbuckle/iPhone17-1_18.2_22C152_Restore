@interface UIKeyboardEmojiVariantView
+ (CGSize)preferredContentViewSizeForKey:(id)a3 withTraits:(id)a4;
- (BOOL)updateSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4;
- (UIKeyboardEmojiVariantView)initWithFrame:(CGRect)a3;
- (UIView)touchForwardingView;
- (id)nextResponder;
- (void)setTouchForwardingView:(id)a3;
- (void)updateForKeyplane:(id)a3 key:(id)a4;
- (void)updateHighlightForSelectedVariantIndex:(int64_t)a3;
- (void)updateRenderConfig:(id)a3;
@end

@implementation UIKeyboardEmojiVariantView

- (UIKeyboardEmojiVariantView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardEmojiVariantView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    cells = v3->_cells;
    v3->_cells = v4;
  }
  return v3;
}

+ (CGSize)preferredContentViewSizeForKey:(id)a3 withTraits:(id)a4
{
  v4 = [a3 subtrees];
  uint64_t v5 = [v4 count] - 1;

  double v6 = (double)(unint64_t)v5 * 44.0 + 13.0 + 24.0;
  double v7 = 56.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableArray *)self->_cells count])
  {
    -[UIKeyboardEmojiVariantView updateHighlightForSelectedVariantIndex:](self, "updateHighlightForSelectedVariantIndex:", [v7 selectedVariantIndex]);
  }
  else
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__71;
    v12[4] = __Block_byref_object_dispose__71;
    id v13 = [(UIView *)self leadingAnchor];
    v8 = [v7 subtrees];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__UIKeyboardEmojiVariantView_updateForKeyplane_key___block_invoke;
    v9[3] = &unk_1E52DE3F0;
    v9[4] = self;
    id v10 = v7;
    v11 = v12;
    [v8 enumerateObjectsUsingBlock:v9];

    _Block_object_dispose(v12, 8);
  }
}

void __52__UIKeyboardEmojiVariantView_updateForKeyplane_key___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v21 = a2;
  if ([v21 displayType] == 50)
  {
    uint64_t v5 = [UIKeyboardEmojiVariantDivider alloc];
    uint64_t v6 = -[UIKeyboardEmojiVariantDivider initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 408);
    *(void *)(v7 + 408) = v6;

    v9 = (UIKeyboardEmojiVariantViewCell *)*(id *)(*(void *)(a1 + 32) + 408);
  }
  else
  {
    id v10 = [UIKeyboardEmojiVariantViewCell alloc];
    v9 = -[UIKeyboardEmojiVariantViewCell initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v11 = [v21 representedString];
    [(UIKeyboardEmojiVariantViewCell *)v9 setEmoji:v11];

    if ([*(id *)(a1 + 40) selectedVariantIndex] == a3) {
      [(UIKeyboardEmojiVariantViewCell *)v9 setHighlighted:1];
    }
    [*(id *)(*(void *)(a1 + 32) + 416) addObject:v9];
  }
  [(UIView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 32) addSubview:v9];
  if (a3) {
    double v12 = 6.0;
  }
  else {
    double v12 = 9.0;
  }
  id v13 = [(UIView *)v9 leadingAnchor];
  v14 = [v13 constraintEqualToAnchor:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) constant:v12];
  [v14 setActive:1];

  v15 = [(UIView *)v9 topAnchor];
  v16 = [*(id *)(a1 + 32) topAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:3.0];
  [v17 setActive:1];

  uint64_t v18 = [(UIView *)v9 trailingAnchor];
  uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
  v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;
}

- (void)updateHighlightForSelectedVariantIndex:(int64_t)a3
{
  [(NSMutableArray *)self->_cells enumerateObjectsUsingBlock:&__block_literal_global_166];
  if (!a3 || (--a3, a3))
  {
    if (a3 < (unint64_t)[(NSMutableArray *)self->_cells count])
    {
      id v5 = [(NSMutableArray *)self->_cells objectAtIndexedSubscript:a3];
      [v5 setHighlighted:1];
    }
  }
}

uint64_t __69__UIKeyboardEmojiVariantView_updateHighlightForSelectedVariantIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHighlighted:0];
}

- (BOOL)updateSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v7 = a3;
  uint64_t v8 = [v7 selectedVariantIndex];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0x7FEFFFFFFFFFFFFFLL;
  cells = self->_cells;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__UIKeyboardEmojiVariantView_updateSelectedVariantIndexForKey_atPoint___block_invoke;
  v15[3] = &unk_1E52EBED0;
  *(CGFloat *)&v15[6] = x;
  *(CGFloat *)&v15[7] = y;
  v15[4] = v16;
  v15[5] = &v17;
  [(NSMutableArray *)cells enumerateObjectsUsingBlock:v15];
  if (v18[3] == 0x7FFFFFFFFFFFFFFFLL
    || ((-[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:"),
         id v10 = objc_claimAutoreleasedReturnValue(),
         [v10 setHighlighted:1],
         v10,
         uint64_t v11 = v18[3],
         v11 <= 0)
      ? (uint64_t v12 = v18[3])
      : (uint64_t v12 = v11 + 1),
        [v7 setSelectedVariantIndex:v12],
        v12 == v8))
  {
    BOOL v13 = 0;
  }
  else
  {
    [(UIKeyboardEmojiVariantView *)self updateHighlightForSelectedVariantIndex:v12];
    BOOL v13 = 1;
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);

  return v13;
}

uint64_t __71__UIKeyboardEmojiVariantView_updateSelectedVariantIndexForKey_atPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(double *)(a1 + 48);
  uint64_t result = [a2 center];
  double v8 = v5 - v7;
  if (v8 < 0.0) {
    double v8 = -v8;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v8 < *(double *)(v9 + 24))
  {
    *(double *)(v9 + 24) = v8;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

- (void)updateRenderConfig:(id)a3
{
  id v4 = a3;
  cells = self->_cells;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__UIKeyboardEmojiVariantView_updateRenderConfig___block_invoke;
  v7[3] = &unk_1E52EBEF8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)cells enumerateObjectsUsingBlock:v7];
  [(UIKeyboardEmojiVariantDivider *)self->_divider setRenderConfig:v6];
}

uint64_t __49__UIKeyboardEmojiVariantView_updateRenderConfig___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRenderConfig:*(void *)(a1 + 32)];
}

- (id)nextResponder
{
  v3 = [(UIKeyboardEmojiVariantView *)self touchForwardingView];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKeyboardEmojiVariantView;
    id v5 = [(UIView *)&v8 nextResponder];
  }
  id v6 = v5;

  return v6;
}

- (UIView)touchForwardingView
{
  return self->_touchForwardingView;
}

- (void)setTouchForwardingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchForwardingView, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_divider, 0);
}

@end
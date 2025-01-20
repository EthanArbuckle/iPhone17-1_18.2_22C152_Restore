@interface UIKeyboardAccentVariantView
+ (CGSize)preferredContentViewSizeForKey:(id)a3 withTraits:(id)a4;
- (BOOL)updateSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4;
- (UIKeyboardAccentVariantView)initWithFrame:(CGRect)a3;
- (UIView)touchForwardingView;
- (id)nextResponder;
- (void)setTouchForwardingView:(id)a3;
- (void)updateForKeyplane:(id)a3 key:(id)a4;
- (void)updateHighlightForSelectedVariantIndex:(int64_t)a3;
- (void)updateRenderConfig:(id)a3;
@end

@implementation UIKeyboardAccentVariantView

- (UIKeyboardAccentVariantView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardAccentVariantView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    cells = v3->_cells;
    v3->_cells = v4;

    id v6 = +[UIColor greenColor];
    uint64_t v7 = [v6 CGColor];
    v8 = [(UIView *)v3 layer];
    [v8 setBorderColor:v7];

    v9 = [(UIView *)v3 layer];
    [v9 setBorderWidth:1.0];
  }
  return v3;
}

+ (CGSize)preferredContentViewSizeForKey:(id)a3 withTraits:(id)a4
{
  v4 = [a3 subtrees];
  unint64_t v5 = [v4 count];

  double v6 = (double)v5 * 36.0 + 4.0;
  double v7 = 52.0;
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
    -[UIKeyboardAccentVariantView updateHighlightForSelectedVariantIndex:](self, "updateHighlightForSelectedVariantIndex:", [v7 selectedVariantIndex]);
  }
  else
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__16;
    v13[4] = __Block_byref_object_dispose__16;
    id v14 = [(UIView *)self leadingAnchor];
    v8 = [v7 subtrees];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__UIKeyboardAccentVariantView_updateForKeyplane_key___block_invoke;
    v9[3] = &unk_1E52DE3F0;
    id v10 = v7;
    objc_super v11 = self;
    v12 = v13;
    [v8 enumerateObjectsUsingBlock:v9];

    _Block_object_dispose(v13, 8);
  }
}

void __53__UIKeyboardAccentVariantView_updateForKeyplane_key___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [UIKeyboardAccentVariantViewCell alloc];
  id v7 = -[UIKeyboardAccentVariantViewCell initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = [v5 representedString];

  [(UIKeyboardAccentVariantViewCell *)v7 setAccentedChar:v8];
  if ([*(id *)(a1 + 32) selectedVariantIndex] == a3) {
    [(UIKeyboardAccentVariantViewCell *)v7 setHighlighted:1];
  }
  [*(id *)(*(void *)(a1 + 40) + 408) addObject:v7];
  v18 = v7;
  [(UIView *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 40) addSubview:v18];
  if (a3) {
    double v9 = 0.0;
  }
  else {
    double v9 = 8.0;
  }
  id v10 = [(UIView *)v18 leadingAnchor];
  objc_super v11 = [v10 constraintEqualToAnchor:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) constant:v9];
  [v11 setActive:1];

  v12 = [(UIView *)v18 topAnchor];
  v13 = [*(id *)(a1 + 40) topAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13 constant:4.0];
  [v14 setActive:1];

  uint64_t v15 = [(UIView *)v18 trailingAnchor];

  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

- (void)updateHighlightForSelectedVariantIndex:(int64_t)a3
{
  [(NSMutableArray *)self->_cells enumerateObjectsUsingBlock:&__block_literal_global_60];
  if ([(NSMutableArray *)self->_cells count] > (unint64_t)a3)
  {
    id v5 = [(NSMutableArray *)self->_cells objectAtIndexedSubscript:a3];
    [v5 setHighlighted:1];
  }
}

uint64_t __70__UIKeyboardAccentVariantView_updateHighlightForSelectedVariantIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHighlighted:0];
}

- (BOOL)updateSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v7 = a3;
  uint64_t v8 = [v7 selectedVariantIndex];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0x7FEFFFFFFFFFFFFFLL;
  cells = self->_cells;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__UIKeyboardAccentVariantView_updateSelectedVariantIndexForKey_atPoint___block_invoke;
  v14[3] = &unk_1E52DE438;
  *(CGFloat *)&v14[6] = x;
  *(CGFloat *)&v14[7] = y;
  v14[4] = v15;
  v14[5] = &v16;
  [(NSMutableArray *)cells enumerateObjectsUsingBlock:v14];
  if (v17[3] == 0x7FFFFFFFFFFFFFFFLL
    || (-[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:"),
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 setHighlighted:1],
        v10,
        uint64_t v11 = v17[3],
        [v7 setSelectedVariantIndex:v11],
        v11 == v8))
  {
    BOOL v12 = 0;
  }
  else
  {
    [(UIKeyboardAccentVariantView *)self updateHighlightForSelectedVariantIndex:v11];
    BOOL v12 = 1;
  }
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v16, 8);

  return v12;
}

uint64_t __72__UIKeyboardAccentVariantView_updateSelectedVariantIndexForKey_atPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  v7[2] = __50__UIKeyboardAccentVariantView_updateRenderConfig___block_invoke;
  v7[3] = &unk_1E52DE460;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)cells enumerateObjectsUsingBlock:v7];
}

uint64_t __50__UIKeyboardAccentVariantView_updateRenderConfig___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRenderConfig:*(void *)(a1 + 32)];
}

- (id)nextResponder
{
  v3 = [(UIKeyboardAccentVariantView *)self touchForwardingView];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKeyboardAccentVariantView;
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
}

@end
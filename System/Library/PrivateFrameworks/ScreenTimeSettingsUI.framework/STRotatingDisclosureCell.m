@interface STRotatingDisclosureCell
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (STRotatingDisclosureCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (void)_userPressed:(id)a3;
- (void)layoutSubviews;
- (void)setSpecifier:(id)a3;
@end

@implementation STRotatingDisclosureCell

- (STRotatingDisclosureCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)STRotatingDisclosureCell;
  v4 = [(STRotatingDisclosureCell *)&v18 initWithStyle:a3 reuseIdentifier:a4];
  v5 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
  v6 = [v5 fontDescriptorWithSymbolicTraits:2];

  v7 = [MEMORY[0x263F81708] fontWithDescriptor:v6 size:0.0];
  v8 = [MEMORY[0x263F82818] configurationWithFont:v7 scale:1];
  v9 = [MEMORY[0x263F827E8] systemImageNamed:@"chevron.forward"];
  v10 = [v9 imageWithConfiguration:v8];

  v11 = [MEMORY[0x263F825C8] tertiaryLabelColor];
  v12 = [v10 imageWithTintColor:v11];
  v13 = [v12 imageWithRenderingMode:1];

  v14 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v13];
  [v14 setContentMode:4];
  [(STRotatingDisclosureCell *)v4 setEditingAccessoryView:v14];
  uint64_t v15 = [objc_alloc(MEMORY[0x263F82938]) initWithTarget:v4 action:sel__userPressed_];
  longPressGestureRecognizer = v4->_longPressGestureRecognizer;
  v4->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v15;

  [(UILongPressGestureRecognizer *)v4->_longPressGestureRecognizer setDelegate:v4];
  [(UILongPressGestureRecognizer *)v4->_longPressGestureRecognizer setMinimumPressDuration:0.0];

  return v4;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)STRotatingDisclosureCell;
  [(PSTableCell *)&v9 layoutSubviews];
  v3 = [(STRotatingDisclosureCell *)self longPressGestureRecognizer];
  v4 = [(STRotatingDisclosureCell *)self gestureRecognizers];
  char v5 = [v4 containsObject:v3];

  if ((v5 & 1) == 0) {
    [(STRotatingDisclosureCell *)self addGestureRecognizer:v3];
  }
  v6 = [(PSTableCell *)self specifier];
  v7 = [v6 performGetter];
  v8 = [(STRotatingDisclosureCell *)self detailTextLabel];
  [v8 setText:v7];
}

- (void)setSpecifier:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)STRotatingDisclosureCell;
  id v4 = a3;
  [(PSTableCell *)&v21 setSpecifier:v4];
  char v5 = [v4 objectForKeyedSubscript:@"RotationDirection"];

  uint64_t v6 = [v5 integerValue];
  v7 = [(STRotatingDisclosureCell *)self editingAccessoryView];
  v8 = v7;
  if (v7) {
    [v7 transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v13 = *MEMORY[0x263F000D0];
  *(_OWORD *)&t2.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&t2.c = v9;
  long long v11 = v9;
  long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&t2.tx = v12;
  if (CGAffineTransformEqualToTransform(&t1, &t2))
  {
    if (v6 == 1)
    {
      CGAffineTransformMakeRotation(&v18, dbl_225C13AC0[[(STRotatingDisclosureCell *)self effectiveUserInterfaceLayoutDirection] == 1]);
      CGAffineTransform v17 = v18;
      v10 = &v17;
LABEL_9:
      objc_msgSend(v8, "setTransform:", v10, v11, v12, v13, v14, v15, v16, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
    }
  }
  else if (!v6)
  {
    long long v14 = v13;
    long long v15 = v11;
    v10 = (CGAffineTransform *)&v14;
    long long v16 = v12;
    goto LABEL_9;
  }
}

- (void)_userPressed:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    char v5 = [(PSTableCell *)self specifier];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"HidesEditControl"];
    int v7 = [v6 BOOLValue];

    uint64_t v8 = [(STRotatingDisclosureCell *)self effectiveUserInterfaceLayoutDirection];
    [v4 locationInView:self];
    double v10 = v9;
    long long v11 = [(STRotatingDisclosureCell *)self imageView];
    [v11 frame];
    if (v8 == 1) {
      BOOL v16 = v10 > CGRectGetMinX(*(CGRect *)&v12);
    }
    else {
      BOOL v16 = v10 < CGRectGetMaxX(*(CGRect *)&v12);
    }

    if ((v7 | !v16))
    {
      memset(&v30, 0, sizeof(v30));
      CGAffineTransform v17 = [v5 objectForKeyedSubscript:@"RotationDirection"];
      uint64_t v18 = [v17 integerValue];

      if (v18 == 1)
      {
        uint64_t v19 = 0;
        long long v21 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
        *(_OWORD *)&v30.a = *MEMORY[0x263F000D0];
        *(_OWORD *)&v30.c = v21;
        *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      }
      else if (v18)
      {
        uint64_t v19 = 0;
      }
      else
      {
        CGAffineTransformMakeRotation(&v30, dbl_225C13AC0[v8 == 1]);
        uint64_t v19 = 1;
      }
      v22 = [NSNumber numberWithInteger:v19];
      [v5 setObject:v22 forKeyedSubscript:@"RotationDirection"];

      v23 = (void *)MEMORY[0x263F82E00];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      CGAffineTransform v29 = v30;
      v28[2] = __41__STRotatingDisclosureCell__userPressed___block_invoke;
      v28[3] = &unk_2647683E8;
      v28[4] = self;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __41__STRotatingDisclosureCell__userPressed___block_invoke_2;
      v24[3] = &unk_264768410;
      v26 = self;
      uint64_t v27 = v19;
      id v25 = v5;
      [v23 animateWithDuration:v28 animations:v24 completion:0.1];
    }
    else
    {
      v20 = [v5 objectForKeyedSubscript:@"SelectionHandler"];
      if (v20) {
        v20[2](v20, [(STRotatingDisclosureCell *)self isSelected] ^ 1);
      }
    }
  }
}

void __41__STRotatingDisclosureCell__userPressed___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "editingAccessoryView", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
  [v1 setTransform:&v2];
}

void __41__STRotatingDisclosureCell__userPressed___block_invoke_2(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"RotationHandler"];
  if (v2) {
    v2[2](v2, *(void *)(a1 + 48), [*(id *)(a1 + 40) isSelected]);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 1;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return (UILongPressGestureRecognizer *)objc_getProperty(self, a2, 1192, 1);
}

- (void).cxx_destruct
{
}

@end
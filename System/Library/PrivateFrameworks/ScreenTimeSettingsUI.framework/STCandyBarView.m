@interface STCandyBarView
- (BOOL)useVibrancy;
- (CGSize)intrinsicContentSize;
- (NSArray)usageItems;
- (NSArray)viewItems;
- (STCandyBarView)initWithVibrancy:(BOOL)a3;
- (id)capImageWithHeight:(double)a3 leadingLineCap:(int)a4 trailingLineCap:(int)a5;
- (void)layoutSubviews;
- (void)setUsageItems:(id)a3;
- (void)setUsageItems:(id)a3 animated:(BOOL)a4;
- (void)setViewItems:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)updateSectionViewImages;
@end

@implementation STCandyBarView

- (STCandyBarView)initWithVibrancy:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STCandyBarView;
  result = -[STCandyBarView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  result->_useVibrancy = a3;
  return result;
}

- (id)capImageWithHeight:(double)a3 leadingLineCap:(int)a4 trailingLineCap:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  if (capImageWithHeight_leadingLineCap_trailingLineCap__onceToken != -1) {
    dispatch_once(&capImageWithHeight_leadingLineCap_trailingLineCap__onceToken, &__block_literal_global_2);
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[STCandyBarView semanticContentAttribute](self, "semanticContentAttribute"));
  v10 = NSString;
  v11 = [NSNumber numberWithDouble:a3];
  v12 = [NSNumber numberWithInt:v6];
  v13 = [NSNumber numberWithInt:v5];
  v14 = [v10 stringWithFormat:@"%@-%@-%@", v11, v12, v13];

  v15 = [(id)capImageWithHeight_leadingLineCap_trailingLineCap__capImages objectForKey:v14];
  if (v15)
  {
    id v16 = v15;
  }
  else
  {
    BOOL v17 = v9 == 1;
    v18 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", a3 + a3, a3);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __68__STCandyBarView_capImageWithHeight_leadingLineCap_trailingLineCap___block_invoke_2;
    v23[3] = &__block_descriptor_73_e40_v16__0__UIGraphicsImageRendererContext_8l;
    *(double *)&v23[4] = a3;
    *(double *)&v23[5] = a3 + a3;
    *(double *)&v23[6] = a3;
    *(double *)&v23[7] = a3 * 0.5;
    BOOL v26 = v17;
    int v24 = v5;
    int v25 = v6;
    v19 = [v18 imageWithActions:v23];
    v20 = [v19 imageWithRenderingMode:2];

    v21 = objc_msgSend(v20, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, a3 * 0.5, 0.0, a3 * 0.5);

    [(id)capImageWithHeight_leadingLineCap_trailingLineCap__capImages setObject:v21 forKey:v14];
    id v16 = v21;
  }

  return v16;
}

uint64_t __68__STCandyBarView_capImageWithHeight_leadingLineCap_trailingLineCap___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = capImageWithHeight_leadingLineCap_trailingLineCap__capImages;
  capImageWithHeight_leadingLineCap_trailingLineCap__capImages = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void __68__STCandyBarView_capImageWithHeight_leadingLineCap_trailingLineCap___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  CGContextSetLineWidth(v3, *(CGFloat *)(a1 + 32));
  id v4 = [MEMORY[0x263F825C8] blackColor];
  CGContextSetStrokeColorWithColor(v3, (CGColorRef)[v4 CGColor]);

  double v5 = *(double *)(a1 + 40) * 0.5;
  double v6 = *(double *)(a1 + 56);
  CGContextBeginPath(v3);
  if (*(unsigned char *)(a1 + 72)) {
    uint64_t v7 = 64;
  }
  else {
    uint64_t v7 = 68;
  }
  CGContextSetLineCap(v3, *(CGLineCap *)(a1 + v7));
  CGContextMoveToPoint(v3, v5 - v6, *(double *)(a1 + 48) * 0.5);
  CGContextAddLineToPoint(v3, v5, *(double *)(a1 + 48) * 0.5);
  CGContextStrokePath(v3);
  CGContextBeginPath(v3);
  if (*(unsigned char *)(a1 + 72)) {
    uint64_t v8 = 68;
  }
  else {
    uint64_t v8 = 64;
  }
  CGContextSetLineCap(v3, *(CGLineCap *)(a1 + v8));
  CGContextMoveToPoint(v3, v5, *(double *)(a1 + 48) * 0.5);
  CGContextAddLineToPoint(v3, v5 + v6, *(double *)(a1 + 48) * 0.5);

  CGContextStrokePath(v3);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)STCandyBarView;
  [(STCandyBarView *)&v3 layoutSubviews];
  [(STCandyBarView *)self updateSectionViewImages];
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  double v3 = 6.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)updateConstraints
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)STCandyBarView;
  [(STCandyBarView *)&v22 updateConstraints];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v3 = [(STCandyBarView *)self usageItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) totalUsage];
        [v9 doubleValue];
        double v7 = v7 + v10;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  if (v7 < 1.0) {
    double v7 = 1.0;
  }
  v11 = [(STCandyBarView *)self viewItems];
  v12 = [(STCandyBarView *)self usageItems];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __35__STCandyBarView_updateConstraints__block_invoke;
  v14[3] = &unk_264767428;
  id v15 = v11;
  id v16 = self;
  double v17 = v7;
  id v13 = v11;
  [v12 enumerateObjectsUsingBlock:v14];
}

void __35__STCandyBarView_updateConstraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v18 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v6 = [v5 widthConstraint];

  if (v6)
  {
    double v7 = [v5 widthConstraint];
    [v7 setActive:0];

    uint64_t v8 = [v5 sectionView];
    uint64_t v9 = [v8 widthAnchor];
    double v10 = [*(id *)(a1 + 40) widthAnchor];
    v11 = [v18 totalUsage];
    [v11 doubleValue];
    double v13 = *(double *)(a1 + 48);
    if (v13 < 1.0) {
      double v13 = 1.0;
    }
    v14 = [v9 constraintEqualToAnchor:v10 multiplier:v12 / v13];
    [v5 setWidthConstraint:v14];

    id v15 = [v5 widthConstraint];
    LODWORD(v16) = 1144750080;
    [v15 setPriority:v16];

    double v17 = [v5 widthConstraint];
    [v17 setActive:1];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STCandyBarView;
  [(STCandyBarView *)&v19 traitCollectionDidChange:v4];
  if ([(STCandyBarView *)self useVibrancy])
  {
    if (!v4
      || (uint64_t v5 = [v4 userInterfaceStyle],
          [(STCandyBarView *)self traitCollection],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 userInterfaceStyle],
          v6,
          v5 != v7))
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v8 = [(STCandyBarView *)self viewItems];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            double v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) sectionView];
            v14 = [v13 tintColor];
            +[STUsageColors updateVibrancyStylingForView:v13 withUsageColor:v14];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)updateSectionViewImages
{
  double v3 = [(STCandyBarView *)self usageItems];
  id v4 = [(STCandyBarView *)self viewItems];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__STCandyBarView_updateSectionViewImages__block_invoke;
  v7[3] = &unk_264767450;
  id v8 = v4;
  id v9 = v3;
  uint64_t v10 = self;
  id v5 = v3;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __41__STCandyBarView_updateSectionViewImages__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v16 sectionView];
  if ([*(id *)(a1 + 40) count] - 1 == a3)
  {
    uint64_t v6 = [*(id *)(a1 + 40) count];
    uint64_t v7 = *(void **)(a1 + 48);
    [v7 frame];
    id v8 = v7;
    double v10 = v9;
    if (v6 == 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v12 = *(void **)(a1 + 48);
    [v12 frame];
    double v10 = v13;
    id v8 = v12;
    if (a3) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    uint64_t v14 = 2;
  }
  long long v15 = [v8 capImageWithHeight:v11 leadingLineCap:v14 trailingLineCap:v10];
  [v5 setImage:v15];
}

- (NSArray)usageItems
{
  return self->_usageItems;
}

- (void)setUsageItems:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  NSUInteger v5 = [(NSArray *)self->_usageItems count];
  if (v5 == [v4 count])
  {
    uint64_t v6 = [(STCandyBarView *)self viewItems];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __32__STCandyBarView_setUsageItems___block_invoke;
    v25[3] = &unk_264767478;
    BOOL v26 = v6;
    v27 = self;
    id v7 = v6;
    [v4 enumerateObjectsUsingBlock:v25];
    [(STCandyBarView *)self setNeedsUpdateConstraints];
    id v8 = v26;
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v9 = [(STCandyBarView *)self viewItems];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v21 + 1) + 8 * v13) sectionView];
          [v14 removeFromSuperview];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
      }
      while (v11);
    }

    long long v15 = objc_opt_new();
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __32__STCandyBarView_setUsageItems___block_invoke_2;
    v18[3] = &unk_264767450;
    v18[4] = self;
    objc_super v19 = v15;
    id v20 = v4;
    id v7 = v15;
    [v20 enumerateObjectsUsingBlock:v18];
    [(STCandyBarView *)self updateSectionViewImages];
    [(STCandyBarView *)self setNeedsUpdateConstraints];
    [(STCandyBarView *)self setViewItems:v7];

    id v8 = v19;
  }

  id v16 = (NSArray *)[v4 copy];
  usageItems = self->_usageItems;
  self->_usageItems = v16;
}

void __32__STCandyBarView_setUsageItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSUInteger v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v9 = [v5 objectAtIndexedSubscript:a3];
  id v7 = [v6 color];

  id v8 = [v9 sectionView];
  [v8 setTintColor:v7];
  if ([*(id *)(a1 + 40) useVibrancy]) {
    +[STUsageColors updateVibrancyStylingForView:v8 withUsageColor:v7];
  }
}

void __32__STCandyBarView_setUsageItems___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v28 = (id)objc_opt_new();
  id v6 = [v5 color];

  id v7 = [v28 sectionView];
  [v7 setTintColor:v6];
  if ([a1[4] useVibrancy]) {
    +[STUsageColors updateVibrancyStylingForView:v7 withUsageColor:v6];
  }
  [a1[4] addSubview:v7];
  id v8 = [v7 centerYAnchor];
  id v9 = [a1[4] centerYAnchor];
  uint64_t v10 = [v8 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  uint64_t v11 = [v7 heightAnchor];
  uint64_t v12 = [a1[4] heightAnchor];
  uint64_t v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  uint64_t v14 = [a1[5] lastObject];
  long long v15 = [v7 leadingAnchor];
  if (v14)
  {
    id v16 = [v14 sectionView];
    long long v17 = [v16 trailingAnchor];
    long long v18 = [v15 constraintEqualToAnchor:v17 constant:2.0];
    [v18 setActive:1];
  }
  else
  {
    id v16 = [a1[4] leadingAnchor];
    long long v17 = [v15 constraintEqualToAnchor:v16];
    [v17 setActive:1];
  }

  if ([a1[6] count] - 1 == a3)
  {
    objc_super v19 = [v7 trailingAnchor];
    id v20 = [a1[4] trailingAnchor];
    long long v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];
  }
  else
  {
    long long v22 = [v28 sectionView];
    long long v23 = [v22 widthAnchor];
    long long v24 = [a1[4] widthAnchor];
    int v25 = [v23 constraintEqualToAnchor:v24];
    [v28 setWidthConstraint:v25];

    BOOL v26 = [v28 widthConstraint];
    LODWORD(v27) = 1144750080;
    [v26 setPriority:v27];

    objc_super v19 = [v28 widthConstraint];
    [v19 setActive:1];
  }

  [a1[5] addObject:v28];
}

- (void)setUsageItems:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v9 = v6;
  if (a4)
  {
    id v7 = [(STCandyBarView *)self usageItems];
    uint64_t v8 = [v7 count];

    [(STCandyBarView *)self setUsageItems:v9];
    if (v8)
    {
      [(STCandyBarView *)self layoutIfNeeded];
      [(STCandyBarView *)self updateConstraintsIfNeeded];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __41__STCandyBarView_setUsageItems_animated___block_invoke;
      v10[3] = &unk_264766F30;
      v10[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:0 delay:v10 usingSpringWithDamping:&__block_literal_global_41 initialSpringVelocity:0.6 options:0.0 animations:0.9 completion:0.0];
    }
  }
  else
  {
    [(STCandyBarView *)self setUsageItems:v6];
  }
}

uint64_t __41__STCandyBarView_setUsageItems_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (NSArray)viewItems
{
  return self->_viewItems;
}

- (void)setViewItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewItems, 0);

  objc_storeStrong((id *)&self->_usageItems, 0);
}

@end
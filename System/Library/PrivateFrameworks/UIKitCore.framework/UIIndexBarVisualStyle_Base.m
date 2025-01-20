@interface UIIndexBarVisualStyle_Base
+ (id)containerViewForIndexBar:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)overlay;
- (CGRect)_visibleBoundsForRect:(CGRect)a3 stride:(double *)a4;
- (UIIndexBarView)indexBarView;
- (UIIndexBarVisualStyle_Base)initWithView:(id)a3;
- (double)indexWidth;
- (double)lineSpacing;
- (double)minLineHeight;
- (double)renderingHeightForDisplayEntry:(id)a3;
- (id)displayEntryFromEntry:(id)a3;
- (int64_t)_indexForEntryAtPoint:(CGPoint)a3;
- (void)setIndexBarView:(id)a3;
@end

@implementation UIIndexBarVisualStyle_Base

- (UIIndexBarView)indexBarView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indexBarView);
  return (UIIndexBarView *)WeakRetained;
}

+ (id)containerViewForIndexBar:(id)a3
{
  return 0;
}

- (UIIndexBarVisualStyle_Base)initWithView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIIndexBarVisualStyle_Base;
  id v3 = a3;
  v4 = [(UIIndexBarVisualStyle_Base *)&v6 init];
  -[UIIndexBarVisualStyle_Base setIndexBarView:](v4, "setIndexBarView:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (void)setIndexBarView:(id)a3
{
}

- (BOOL)canBecomeFocused
{
  v2 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  char v3 = [v2 _defaultCanBecomeFocused];

  return v3;
}

- (BOOL)overlay
{
  return 0;
}

- (double)minLineHeight
{
  return 0.0;
}

- (id)displayEntryFromEntry:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(UIIndexBarDisplayEntry);
  [(UIIndexBarDisplayEntry *)v4 setEntry:v3];

  return v4;
}

- (CGRect)_visibleBoundsForRect:(CGRect)a3 stride:(double *)a4
{
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (int64_t)_indexForEntryAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double v5 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  [v5 effectiveBounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v22.origin.x = v7;
  v22.origin.double y = v9;
  v22.size.width = v11;
  v22.size.height = v13;
  if (y < CGRectGetMinY(v22)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v23.origin.x = v7;
  v23.origin.double y = v9;
  v23.size.width = v11;
  v23.size.height = v13;
  if (y > CGRectGetMaxY(v23)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v15 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  v16 = [v15 entries];

  uint64_t v17 = [v16 count];
  if (v17)
  {
    uint64_t v18 = v17;
    -[UIIndexBarVisualStyle_Base _visibleBoundsForRect:stride:](self, "_visibleBoundsForRect:stride:", 0, v7, v9, v11, v13);
    double v19 = v24.origin.y;
    double Height = CGRectGetHeight(v24);
    if (v18 - 1 >= ((uint64_t)((y - v19) / (Height / (double)v18)) & ~((uint64_t)((y - v19) / (Height / (double)v18)) >> 63))) {
      int64_t v14 = (uint64_t)((y - v19) / (Height / (double)v18)) & ~((uint64_t)((y - v19) / (Height / (double)v18)) >> 63);
    }
    else {
      int64_t v14 = v18 - 1;
    }
  }
  else
  {
    int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v14;
}

- (double)renderingHeightForDisplayEntry:(id)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"UIIndexBarVisualStyle.m" lineNumber:97 description:@"This method must be implemented by subclasses"];

  return 0.0;
}

- (double)indexWidth
{
  v2 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  id v3 = [v2 traitCollection];

  double v4 = _UIDefaultIndexBarWidthForTraitCollection(v3);
  return v4;
}

- (double)lineSpacing
{
  v2 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  id v3 = [v2 traitCollection];
  if (([v3 userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v4 = 16.0;
  }
  else {
    double v4 = 6.0;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end
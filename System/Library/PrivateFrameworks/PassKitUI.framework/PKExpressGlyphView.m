@interface PKExpressGlyphView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKExpressGlyphView)init;
- (PKExpressGlyphView)initWithCoder:(id)a3;
- (PKExpressGlyphView)initWithFrame:(CGRect)a3;
- (void)_updateGlyphViewAnimated:(uint64_t)a1;
- (void)glyphView:(id)a3 revealingCheckmark:(BOOL)a4;
- (void)layoutSubviews;
@end

@implementation PKExpressGlyphView

- (PKExpressGlyphView)init
{
  return 0;
}

- (PKExpressGlyphView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKExpressGlyphView)initWithCoder:(id)a3
{
  return 0;
}

- (void)_updateGlyphViewAnimated:(uint64_t)a1
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v4 = [(id)a1 traitCollection];
  int v5 = *(_DWORD *)(a1 + 408);
  if (v5 == 2)
  {
    [*(id *)(a1 + 432) setColorMode:3 animated:a2];
    v9 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
    v10 = (void *)MEMORY[0x1E4FB1E20];
    v23[0] = v4;
    v23[1] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v12 = [v10 traitCollectionWithTraitsFromCollections:v11];

    v13 = [MEMORY[0x1E4FB1830] configurationWithPointSize:7 weight:1 scale:11.0];
    v14 = [v13 configurationWithTraitCollection:v12];

    v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark" withConfiguration:v14];

    uint64_t v7 = 10;
  }
  else
  {
    uint64_t v6 = 7;
    if (v5) {
      uint64_t v6 = 0;
    }
    if (v5 == 1) {
      uint64_t v7 = 11;
    }
    else {
      uint64_t v7 = v6;
    }
    v8 = 0;
  }
  objc_initWeak(&location, (id)a1);
  v15 = *(void **)(a1 + 432);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__PKExpressGlyphView__updateGlyphViewAnimated___block_invoke;
  v20[3] = &unk_1E59CB100;
  objc_copyWeak(&v21, &location);
  [v15 setState:v7 animated:a2 completionHandler:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__PKExpressGlyphView__updateGlyphViewAnimated___block_invoke_2;
  v17[3] = &unk_1E59CA870;
  id v16 = v8;
  id v18 = v16;
  uint64_t v19 = a1;
  PKUIPerformWithEffectiveTraitCollection(v4, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (CGSize)intrinsicContentSize
{
  double maximumLength = self->_maximumLength;
  double v3 = maximumLength;
  result.height = v3;
  result.width = maximumLength;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = fmin(fmin(a3.width, a3.height), self->_maximumLength);
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PKExpressGlyphView;
  [(PKExpressGlyphView *)&v16 layoutSubviews];
  [(PKExpressGlyphView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v11 = fmin(v7 / self->_maximumLength, v9 / self->_maximumLength);
  glyphView = self->_glyphView;
  CATransform3DMakeScale(&v15, v11, v11, 1.0);
  [(PKGlyphView *)glyphView setTransform3D:&v15];
  v13 = self->_glyphView;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  double MidX = CGRectGetMidX(v17);
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  -[PKGlyphView setCenter:](v13, "setCenter:", MidX, CGRectGetMidY(v18));
}

void __47__PKExpressGlyphView__updateGlyphViewAnimated___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v9 = WeakRetained;
    id v2 = WeakRetained[52];
    id v3 = v9[52];
    v9[52] = 0;

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    WeakRetained = v9;
  }
}

void __47__PKExpressGlyphView__updateGlyphViewAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 40) + 432) primaryColor];
    id v2 = [v2 _flatImageWithColor:v3];
  }
  id v4 = *(void **)(*(void *)(a1 + 40) + 432);
  id v6 = v2;
  uint64_t v5 = [v6 CGImage];
  [v6 alignmentRectInsets];
  objc_msgSend(v4, "setCustomImage:withAlignmentEdgeInsets:", v5);
}

- (void)glyphView:(id)a3 revealingCheckmark:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained expressGlyphView:self revealingCheckmarkAnimated:v4];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_glyphView, 0);

  objc_storeStrong((id *)&self->_completions, 0);
}

@end
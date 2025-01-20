@interface PULoadingIndicatorTileViewController
+ (CGSize)loadingIndicatorTileSizeForStyle:(int64_t)a3;
+ (id)_createIndicatorViewForStyle:(int64_t)a3;
+ (void)_destroyIndicatorView:(id)a3;
- (PUProgressIndicatorView)indicatorView;
- (int64_t)style;
- (void)becomeReusable;
- (void)setIndicatorView:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setStyle:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation PULoadingIndicatorTileViewController

- (void).cxx_destruct
{
}

- (void)setIndicatorView:(id)a3
{
}

- (PUProgressIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_style != a3)
  {
    BOOL v4 = a4;
    v5 = (void *)a3;
    self->_style = a3;
    v7 = [(PULoadingIndicatorTileViewController *)self indicatorView];
    if (v5)
    {
      v5 = [(id)objc_opt_class() _createIndicatorViewForStyle:v5];
      [v5 setAlpha:0.0];
      [v5 setAutoresizingMask:45];
      v8 = [(PUTileViewController *)self view];
      [v8 bounds];
      CGFloat x = v28.origin.x;
      CGFloat y = v28.origin.y;
      CGFloat width = v28.size.width;
      CGFloat height = v28.size.height;
      double MidX = CGRectGetMidX(v28);
      v29.origin.CGFloat x = x;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      objc_msgSend(v5, "setCenter:", MidX, CGRectGetMidY(v29));
      [v8 addSubview:v5];
    }
    [(PULoadingIndicatorTileViewController *)self setIndicatorView:v5];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PULoadingIndicatorTileViewController_setStyle_animated___block_invoke;
    aBlock[3] = &unk_1E5F2ECC8;
    id v14 = v7;
    id v26 = v14;
    id v15 = v5;
    id v27 = v15;
    v16 = (void (**)(void))_Block_copy(aBlock);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__PULoadingIndicatorTileViewController_setStyle_animated___block_invoke_2;
    v23[3] = &unk_1E5F2E1C0;
    v23[4] = self;
    id v17 = v14;
    id v24 = v17;
    v18 = (void (**)(void *, uint64_t))_Block_copy(v23);
    if (v4)
    {
      double v19 = dbl_1AEFF7BD0[v15 == 0];
      v20 = (void *)MEMORY[0x1E4FB1EB0];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __58__PULoadingIndicatorTileViewController_setStyle_animated___block_invoke_3;
      v21[3] = &unk_1E5F2EBA0;
      v22 = v16;
      [v20 animateWithDuration:4 delay:v21 options:v18 animations:v19 completion:0.0];
    }
    else
    {
      v16[2](v16);
      v18[2](v18, 1);
    }
  }
}

uint64_t __58__PULoadingIndicatorTileViewController_setStyle_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

uint64_t __58__PULoadingIndicatorTileViewController_setStyle_animated___block_invoke_2(uint64_t a1)
{
  [(id)objc_opt_class() _destroyIndicatorView:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

uint64_t __58__PULoadingIndicatorTileViewController_setStyle_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setStyle:(int64_t)a3
{
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PULoadingIndicatorTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PULoadingIndicatorTileViewController *)self setStyle:0 animated:0];
}

+ (void)_destroyIndicatorView:(id)a3
{
}

+ (id)_createIndicatorViewForStyle:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      BOOL v4 = 0;
      uint64_t v5 = 0;
      uint64_t v6 = 2;
      goto LABEL_10;
    case 2:
      objc_super v3 = @"SAVING_PHOTO_INDICATOR_TITLE";
      break;
    case 1:
      objc_super v3 = @"LOADING_PHOTO_INDICATOR_TITLE";
      break;
    default:
      BOOL v4 = 0;
      goto LABEL_9;
  }
  BOOL v4 = PULocalizedString(v3);
LABEL_9:
  uint64_t v6 = 0;
  uint64_t v5 = 1;
LABEL_10:
  v7 = [[PUProgressIndicatorView alloc] initWithStyle:v6];
  [(PUProgressIndicatorView *)v7 setDeterminate:0];
  [(PUProgressIndicatorView *)v7 setShowsBackground:v5];
  [(PUProgressIndicatorView *)v7 setLocalizedMessage:v4];
  [(PUProgressIndicatorView *)v7 beginShowingProgressImmediately:1 animated:0];
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PUProgressIndicatorView *)v7 intrinsicContentSize];
  -[PUProgressIndicatorView setBounds:](v7, "setBounds:", v8, v9, v10, v11);

  return v7;
}

+ (CGSize)loadingIndicatorTileSizeForStyle:(int64_t)a3
{
  if (loadingIndicatorTileSizeForStyle__onceToken != -1) {
    dispatch_once(&loadingIndicatorTileSizeForStyle__onceToken, &__block_literal_global_42709);
  }
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [(id)loadingIndicatorTileSizeForStyle__cache objectForKey:v5];
  if (!v6)
  {
    v7 = [a1 _createIndicatorViewForStyle:a3];
    double v8 = (void *)MEMORY[0x1E4F29238];
    [v7 intrinsicContentSize];
    uint64_t v6 = objc_msgSend(v8, "valueWithCGSize:");
    [a1 _destroyIndicatorView:v7];
    [(id)loadingIndicatorTileSizeForStyle__cache setObject:v6 forKey:v5];
  }
  [v6 CGSizeValue];
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.CGFloat height = v14;
  result.CGFloat width = v13;
  return result;
}

void __73__PULoadingIndicatorTileViewController_loadingIndicatorTileSizeForStyle___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)loadingIndicatorTileSizeForStyle__cache;
  loadingIndicatorTileSizeForStyle__cache = (uint64_t)v0;
}

@end
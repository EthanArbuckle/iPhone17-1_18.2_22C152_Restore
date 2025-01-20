@interface PXRoundImageView
- (CALayer)imageLayer;
- (CGSize)currentRequestSize;
- (PHPerson)representedPerson;
- (PXRoundImageView)initWithFrame:(CGRect)a3;
- (int)currentRequestID;
- (void)_updateCorner;
- (void)_updateImageForFaceCropRequestID:(int)a3 image:(id)a4 contentsRect:(CGRect)a5 forceUpdate:(BOOL)a6 error:(id)a7;
- (void)_updateImageIfNeeded;
- (void)layoutSubviews;
- (void)setCurrentRequestID:(int)a3;
- (void)setCurrentRequestSize:(CGSize)a3;
- (void)setRepresentedPerson:(id)a3;
@end

@implementation PXRoundImageView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedPerson, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
}

- (PHPerson)representedPerson
{
  return self->_representedPerson;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setCurrentRequestSize:(CGSize)a3
{
  self->_currentRequestSize = a3;
}

- (CGSize)currentRequestSize
{
  double width = self->_currentRequestSize.width;
  double height = self->_currentRequestSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)currentRequestID
{
  return self->_currentRequestID;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXRoundImageView;
  [(PXRoundImageView *)&v3 layoutSubviews];
  [(PXRoundImageView *)self _updateCorner];
  [(PXRoundImageView *)self _updateImageIfNeeded];
}

- (void)setRepresentedPerson:(id)a3
{
  v8 = (PHPerson *)a3;
  v5 = self->_representedPerson;
  if (v5 == v8)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(PHPerson *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_representedPerson, a3);
      [(PXRoundImageView *)self setCurrentRequestID:0];
      -[PXRoundImageView setCurrentRequestSize:](self, "setCurrentRequestSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      [(PXRoundImageView *)self setImage:0];
      [(PXRoundImageView *)self setNeedsLayout];
    }
  }
}

- (void)setCurrentRequestID:(int)a3
{
  int currentRequestID = self->_currentRequestID;
  if (currentRequestID != a3)
  {
    if (currentRequestID)
    {
      v6 = +[PXPeopleFaceCropManager sharedManager];
      [v6 cancelRequestForRequestID:self->_currentRequestID];
    }
    self->_int currentRequestID = a3;
  }
}

- (void)_updateImageIfNeeded
{
}

void __40__PXRoundImageView__updateImageIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v5 objectForKeyedSubscript:@"PXPeopleErrorKey"];
  objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
  [(id)objc_claimAutoreleasedReturnValue() CGRectValue];
  PXRectIdenticalToRect();
}

void __40__PXRoundImageView__updateImageIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_updateImageForFaceCropRequestID:image:contentsRect:forceUpdate:error:", *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 96), *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

- (void)_updateImageForFaceCropRequestID:(int)a3 image:(id)a4 contentsRect:(CGRect)a5 forceUpdate:(BOOL)a6 error:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a7;
  if (a6 || [(PXRoundImageView *)self currentRequestID] == a3)
  {
    if (v15)
    {
      [(PXRoundImageView *)self setImage:v15];
      v17 = [(PXRoundImageView *)self layer];
      -[NSObject setContentsRect:](v17, "setContentsRect:", x, y, width, height);
    }
    else
    {
      if (!v16) {
        goto LABEL_6;
      }
      v17 = PLUIGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412290;
        id v19 = v16;
        _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_ERROR, "PXPeoplePickerCollectionViewItem: error requesting face crop: %@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
LABEL_6:
}

- (void)_updateCorner
{
  [(PXRoundImageView *)self bounds];
  if (v3 >= v4) {
    double v5 = v4;
  }
  else {
    double v5 = v3;
  }
  double v6 = v5 * 0.5;
  id v7 = [(PXRoundImageView *)self layer];
  [v7 setCornerRadius:v6];
}

- (PXRoundImageView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXRoundImageView;
  double v3 = -[PXRoundImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    double v5 = [(PXRoundImageView *)v3 layer];
    [v5 setMasksToBounds:1];
  }
  return v4;
}

@end
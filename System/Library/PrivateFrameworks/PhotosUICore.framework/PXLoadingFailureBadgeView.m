@interface PXLoadingFailureBadgeView
+ (CGSize)sizeForSizeClass:(int64_t)a3;
+ (id)_imageForSizeClass:(int64_t)a3;
+ (int64_t)_sizeClassForSize:(CGSize)a3;
- (NSError)error;
- (PXLoadingFailureBadgeView)initWithCoder:(id)a3;
- (PXLoadingFailureBadgeView)initWithFrame:(CGRect)a3;
- (PXLoadingFailureBadgeView)initWithFrame:(CGRect)a3 error:(id)a4;
- (UIImage)image;
- (UIImageView)imageView;
- (int64_t)sizeClass;
- (void)_handlePrimaryAction;
- (void)_handleTap:(id)a3;
- (void)_installGestureRecognizers;
- (void)layoutSubviews;
- (void)setError:(id)a3;
- (void)setImage:(id)a3;
- (void)setSizeClass:(int64_t)a3;
@end

@implementation PXLoadingFailureBadgeView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)sizeClass
{
  return self->_sizeClass;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)_handlePrimaryAction
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PXLoadingFailureBadgeView *)self error];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *(void *)off_1E5DAAF28;
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v7 = PXLocalizedStringFromTable(@"PXDisplayAssetViewGenericErrorMessage", @"PhotosUICore");
    v11[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v4 = [v5 errorWithDomain:v6 code:-1 userInfo:v8];
  }
  id v9 = +[PXAlert showForError:v4];
}

- (void)_handleTap:(id)a3
{
  if ([a3 state] == 3)
  {
    [(PXLoadingFailureBadgeView *)self _handlePrimaryAction];
  }
}

- (void)_installGestureRecognizers
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
  [(PXLoadingFailureBadgeView *)self addGestureRecognizer:v3];
}

- (UIImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    id v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    v5 = self->_imageView;
    self->_imageView = v4;

    [(PXLoadingFailureBadgeView *)self addSubview:self->_imageView];
    [(PXLoadingFailureBadgeView *)self _installGestureRecognizers];
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)setImage:(id)a3
{
  uint64_t v6 = (UIImage *)a3;
  if (self->_image != v6)
  {
    objc_storeStrong((id *)&self->_image, a3);
    v5 = [(PXLoadingFailureBadgeView *)self imageView];
    [v5 setImage:v6];
  }
}

- (void)setSizeClass:(int64_t)a3
{
  if (self->_sizeClass != a3)
  {
    self->_sizeClass = a3;
    id v4 = [(id)objc_opt_class() _imageForSizeClass:a3];
    [(PXLoadingFailureBadgeView *)self setImage:v4];
  }
}

- (void)layoutSubviews
{
  [(PXLoadingFailureBadgeView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[PXLoadingFailureBadgeView setSizeClass:](self, "setSizeClass:", objc_msgSend((id)objc_opt_class(), "_sizeClassForSize:", v7, v9));
  id v11 = [(PXLoadingFailureBadgeView *)self imageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (PXLoadingFailureBadgeView)initWithCoder:(id)a3
{
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXLoadingFailureBadgeView.m", 62, @"%s is not available as initializer", "-[PXLoadingFailureBadgeView initWithCoder:]");

  abort();
}

- (PXLoadingFailureBadgeView)initWithFrame:(CGRect)a3 error:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXLoadingFailureBadgeView;
  double v10 = -[PXLoadingFailureBadgeView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    error = v10->_error;
    v10->_error = (NSError *)v11;
  }
  return v10;
}

- (PXLoadingFailureBadgeView)initWithFrame:(CGRect)a3
{
  return -[PXLoadingFailureBadgeView initWithFrame:error:](self, "initWithFrame:error:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)_imageForSizeClass:(int64_t)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 2:
      double v3 = @"PXLoadingErrorRegular";
      break;
    case 1:
      double v3 = @"PXLoadingErrorCompact";
      break;
    case 0:
      PXAssertGetLog();
    default:
      double v3 = 0;
      break;
  }
  double v4 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", v3);
  return v4;
}

+ (int64_t)_sizeClassForSize:(CGSize)a3
{
  double width = a3.width;
  objc_msgSend(a1, "sizeForSizeClass:", 2, a3.width, a3.height);
  if (width < v4) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (CGSize)sizeForSizeClass:(int64_t)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    double v3 = 22.0;
    double v4 = 22.0;
  }
  else
  {
    if (a3 != 2) {
      PXAssertGetLog();
    }
    double v3 = 33.0;
    double v4 = 33.0;
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

@end
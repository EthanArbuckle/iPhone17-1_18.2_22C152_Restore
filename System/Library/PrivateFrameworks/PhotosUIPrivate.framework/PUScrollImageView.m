@interface PUScrollImageView
- (PUScrollImageView)initWithFrame:(CGRect)a3 image:(id)a4;
- (UIImageView)imageView;
- (void)setImageView:(id)a3;
@end

@implementation PUScrollImageView

- (void).cxx_destruct
{
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_getProperty(self, a2, 2064, 1);
}

- (PUScrollImageView)initWithFrame:(CGRect)a3 image:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PUScrollImageView;
  v10 = -[PUScrollImageView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v9];
    [(PUScrollImageView *)v10 setImageView:v11];

    v12 = [(PUScrollImageView *)v10 imageView];
    [v12 setContentMode:1];

    v13 = [MEMORY[0x1E4FB1618] whiteColor];
    v14 = [(PUScrollImageView *)v10 imageView];
    [v14 setBackgroundColor:v13];

    [(PUScrollImageView *)v10 setDelegate:v10];
    v15 = [(PUScrollImageView *)v10 imageView];
    [(PUScrollImageView *)v10 addSubview:v15];
  }
  return v10;
}

@end
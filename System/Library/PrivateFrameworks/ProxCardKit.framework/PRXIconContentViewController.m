@interface PRXIconContentViewController
+ (Class)contentViewClass;
- (NSArray)images;
- (NSString)bodyText;
- (PRXIconContentViewController)initWithContentView:(id)a3;
- (int64_t)imageStyle;
- (void)_updateBodyLabel;
- (void)_updateImageViews;
- (void)setBodyText:(id)a3;
- (void)setImageStyle:(int64_t)a3;
- (void)setImages:(id)a3;
- (void)viewDidLoad;
@end

@implementation PRXIconContentViewController

- (PRXIconContentViewController)initWithContentView:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PRXIconContentViewController;
  v3 = [(PRXCardContentViewController *)&v9 initWithContentView:a3];
  v4 = v3;
  if (v3)
  {
    images = v3->_images;
    v3->_images = (NSArray *)MEMORY[0x263EFFA68];

    bodyText = v4->_bodyText;
    v4->_bodyText = (NSString *)&stru_26CCF1BC8;

    v7 = v4;
  }

  return v4;
}

+ (Class)contentViewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PRXIconContentViewController;
  [(PRXCardContentViewController *)&v3 viewDidLoad];
  [(PRXIconContentViewController *)self _updateImageViews];
  [(PRXIconContentViewController *)self _updateBodyLabel];
}

- (void)setImages:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_images, "isEqualToArray:"))
  {
    v4 = (NSArray *)[v6 copy];
    images = self->_images;
    self->_images = v4;

    [(PRXIconContentViewController *)self _updateImageViews];
  }
}

- (void)setImageStyle:(int64_t)a3
{
  if (self->_imageStyle != a3)
  {
    self->_imageStyle = a3;
    [(PRXIconContentViewController *)self _updateImageViews];
  }
}

- (void)_updateImageViews
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(PRXIconContentViewController *)self isViewLoaded])
  {
    objc_super v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_images, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = self->_images;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
          v10 = +[PRXImageView imageViewWithStyle:](PRXImageView, "imageViewWithStyle:", self->_imageStyle, (void)v12);
          [v10 setImage:v9];
          [v3 addObject:v10];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    v11 = [(PRXCardContentViewController *)self contentView];
    [v11 setImageViews:v3];
  }
}

- (void)setBodyText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_bodyText, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    bodyText = self->_bodyText;
    self->_bodyText = v4;

    [(PRXIconContentViewController *)self _updateBodyLabel];
  }
}

- (void)_updateBodyLabel
{
  if ([(PRXIconContentViewController *)self isViewLoaded])
  {
    if ([(NSString *)self->_bodyText length])
    {
      id v4 = +[PRXLabel labelWithStyle:1];
      [v4 setText:self->_bodyText];
      objc_super v3 = [(PRXCardContentViewController *)self contentView];
      [v3 setBodyLabel:v4];
    }
    else
    {
      id v4 = [(PRXCardContentViewController *)self contentView];
      [v4 setBodyLabel:0];
    }
  }
}

- (int64_t)imageStyle
{
  return self->_imageStyle;
}

- (NSArray)images
{
  return self->_images;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

@end
@interface SearchUIAppClipImage
- (SearchUIAppClipImage)initWithSFImage:(id)a3;
- (id)loadImageWithImageData:(id)a3 scale:(double)a4 isDarkStyle:(BOOL)a5;
- (int)defaultCornerRoundingStyle;
@end

@implementation SearchUIAppClipImage

- (SearchUIAppClipImage)initWithSFImage:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUIAppClipImage;
  v3 = [(SearchUIImage *)&v9 initWithSFImage:a3];
  v4 = v3;
  if (v3)
  {
    [(SearchUIImage *)v3 size];
    if (v6 == *MEMORY[0x1E4F1DB30] && v5 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      +[SearchUIAppIconImage sizeForVariant:4];
      -[SearchUIAppClipImage setSize:](v4, "setSize:");
    }
  }
  return v4;
}

- (int)defaultCornerRoundingStyle
{
  return 3;
}

- (id)loadImageWithImageData:(id)a3 scale:(double)a4 isDarkStyle:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUIAppClipImage;
  double v6 = -[SearchUIImage loadImageWithImageData:scale:isDarkStyle:](&v9, sel_loadImageWithImageData_scale_isDarkStyle_, a3, a5);
  [(SearchUIImage *)self size];
  v7 = +[SearchUIWebClipIconImage convertImage:ofSize:withShape:scale:](SearchUIWebClipIconImage, "convertImage:ofSize:withShape:scale:", v6, 5);

  return v7;
}

@end
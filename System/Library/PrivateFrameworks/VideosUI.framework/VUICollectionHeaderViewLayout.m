@interface VUICollectionHeaderViewLayout
+ (id)maxImageContentSizeCategory;
- (TVImageLayout)imageViewLayout;
- (VUICollectionHeaderViewLayout)init;
- (VUITextLayout)subtitleTextLayout;
- (VUITextLayout)titleTextLayout;
- (void)setImageViewLayout:(id)a3;
@end

@implementation VUICollectionHeaderViewLayout

+ (id)maxImageContentSizeCategory
{
  return (id)*MEMORY[0x1E4FB2788];
}

- (VUICollectionHeaderViewLayout)init
{
  v14.receiver = self;
  v14.super_class = (Class)VUICollectionHeaderViewLayout;
  v2 = [(TVViewLayout *)&v14 init];
  if (v2)
  {
    v3 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v3 setTextStyle:2];
    [(VUITextLayout *)v3 setFontWeight:10];
    [(VUITextLayout *)v3 setNumberOfLines:2];
    [(VUITextLayout *)v3 setMinimumScaleFactor:0.67];
    v4 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
    [(VUITextLayout *)v3 setColor:v4];

    titleTextLayout = v2->_titleTextLayout;
    v2->_titleTextLayout = v3;
    v6 = v3;

    v7 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v7 setTextStyle:14];
    [(VUITextLayout *)v7 setNumberOfLines:2];
    [(VUITextLayout *)v7 setMinimumScaleFactor:0.67];
    v8 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(VUITextLayout *)v7 setColor:v8];

    subtitleTextLayout = v2->_subtitleTextLayout;
    v2->_subtitleTextLayout = v7;
    v10 = v7;

    v11 = objc_opt_new();
    [v11 setScaleMode:1];
    imageViewLayout = v2->_imageViewLayout;
    v2->_imageViewLayout = (TVImageLayout *)v11;
  }
  return v2;
}

- (VUITextLayout)titleTextLayout
{
  return self->_titleTextLayout;
}

- (VUITextLayout)subtitleTextLayout
{
  return self->_subtitleTextLayout;
}

- (TVImageLayout)imageViewLayout
{
  return self->_imageViewLayout;
}

- (void)setImageViewLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewLayout, 0);
  objc_storeStrong((id *)&self->_subtitleTextLayout, 0);
  objc_storeStrong((id *)&self->_titleTextLayout, 0);
}

@end
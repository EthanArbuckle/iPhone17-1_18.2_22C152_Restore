@interface VideosExtrasGridCellStyle
- (CGSize)imageSize;
- (NSDictionary)subtitleDefaultFontAttributes;
- (NSDictionary)titleDefaultFontAttributes;
- (NSString)subtitleTextStyle;
- (NSString)titleTextStyle;
- (UIColor)subtitleTextColor;
- (UIColor)titleTextColor;
- (double)subtitleFirstBaselineHeight;
- (double)textFirstBaselineToBottom;
- (double)textLastBaselineToBottom;
- (double)titleFirstBaselineHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)defaultTextAlignment;
- (void)setDefaultTextAlignment:(int64_t)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setSubtitleDefaultFontAttributes:(id)a3;
- (void)setSubtitleFirstBaselineHeight:(double)a3;
- (void)setSubtitleTextColor:(id)a3;
- (void)setSubtitleTextStyle:(id)a3;
- (void)setTextFirstBaselineToBottom:(double)a3;
- (void)setTextLastBaselineToBottom:(double)a3;
- (void)setTitleDefaultFontAttributes:(id)a3;
- (void)setTitleFirstBaselineHeight:(double)a3;
- (void)setTitleTextColor:(id)a3;
- (void)setTitleTextStyle:(id)a3;
@end

@implementation VideosExtrasGridCellStyle

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VideosExtrasGridCellStyle);
  [(VideosExtrasGridCellStyle *)self imageSize];
  -[VideosExtrasGridCellStyle setImageSize:](v4, "setImageSize:");
  [(VideosExtrasGridCellStyle *)self titleFirstBaselineHeight];
  -[VideosExtrasGridCellStyle setTitleFirstBaselineHeight:](v4, "setTitleFirstBaselineHeight:");
  [(VideosExtrasGridCellStyle *)self subtitleFirstBaselineHeight];
  -[VideosExtrasGridCellStyle setSubtitleFirstBaselineHeight:](v4, "setSubtitleFirstBaselineHeight:");
  v5 = [(VideosExtrasGridCellStyle *)self titleTextStyle];
  v6 = (void *)[v5 copy];
  [(VideosExtrasGridCellStyle *)v4 setTitleTextStyle:v6];

  v7 = [(VideosExtrasGridCellStyle *)self subtitleTextStyle];
  v8 = (void *)[v7 copy];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleTextStyle:v8];

  v9 = [(VideosExtrasGridCellStyle *)self titleDefaultFontAttributes];
  v10 = (void *)[v9 copy];
  [(VideosExtrasGridCellStyle *)v4 setTitleDefaultFontAttributes:v10];

  v11 = [(VideosExtrasGridCellStyle *)self subtitleDefaultFontAttributes];
  v12 = (void *)[v11 copy];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleDefaultFontAttributes:v12];

  v13 = [(VideosExtrasGridCellStyle *)self titleTextColor];
  v14 = (void *)[v13 copy];
  [(VideosExtrasGridCellStyle *)v4 setTitleTextColor:v14];

  v15 = [(VideosExtrasGridCellStyle *)self subtitleTextColor];
  v16 = (void *)[v15 copy];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleTextColor:v16];

  [(VideosExtrasGridCellStyle *)self textFirstBaselineToBottom];
  -[VideosExtrasGridCellStyle setTextFirstBaselineToBottom:](v4, "setTextFirstBaselineToBottom:");
  [(VideosExtrasGridCellStyle *)self textLastBaselineToBottom];
  -[VideosExtrasGridCellStyle setTextLastBaselineToBottom:](v4, "setTextLastBaselineToBottom:");
  [(VideosExtrasGridCellStyle *)v4 setDefaultTextAlignment:[(VideosExtrasGridCellStyle *)self defaultTextAlignment]];
  return v4;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (double)titleFirstBaselineHeight
{
  return self->_titleFirstBaselineHeight;
}

- (void)setTitleFirstBaselineHeight:(double)a3
{
  self->_titleFirstBaselineHeight = a3;
}

- (double)subtitleFirstBaselineHeight
{
  return self->_subtitleFirstBaselineHeight;
}

- (void)setSubtitleFirstBaselineHeight:(double)a3
{
  self->_subtitleFirstBaselineHeight = a3;
}

- (NSString)titleTextStyle
{
  return self->_titleTextStyle;
}

- (void)setTitleTextStyle:(id)a3
{
}

- (NSString)subtitleTextStyle
{
  return self->_subtitleTextStyle;
}

- (void)setSubtitleTextStyle:(id)a3
{
}

- (NSDictionary)titleDefaultFontAttributes
{
  return self->_titleDefaultFontAttributes;
}

- (void)setTitleDefaultFontAttributes:(id)a3
{
}

- (NSDictionary)subtitleDefaultFontAttributes
{
  return self->_subtitleDefaultFontAttributes;
}

- (void)setSubtitleDefaultFontAttributes:(id)a3
{
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (void)setSubtitleTextColor:(id)a3
{
}

- (double)textFirstBaselineToBottom
{
  return self->_textFirstBaselineToBottom;
}

- (void)setTextFirstBaselineToBottom:(double)a3
{
  self->_textFirstBaselineToBottom = a3;
}

- (double)textLastBaselineToBottom
{
  return self->_textLastBaselineToBottom;
}

- (void)setTextLastBaselineToBottom:(double)a3
{
  self->_textLastBaselineToBottom = a3;
}

- (int64_t)defaultTextAlignment
{
  return self->_defaultTextAlignment;
}

- (void)setDefaultTextAlignment:(int64_t)a3
{
  self->_defaultTextAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_subtitleDefaultFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleDefaultFontAttributes, 0);
  objc_storeStrong((id *)&self->_subtitleTextStyle, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);
}

@end
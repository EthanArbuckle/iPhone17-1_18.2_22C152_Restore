@interface SiriUIDisambiguationItem
+ (id)disambiguationItem;
- (BOOL)showsFavoriteStar;
- (NSString)extraDisambiguationSubText;
- (NSString)extraDisambiguationText;
- (NSString)headingText;
- (NSString)subtitle;
- (NSString)title;
- (UIImageView)imageView;
- (_NSRange)titleBoldedRange;
- (void)setExtraDisambiguationSubText:(id)a3;
- (void)setExtraDisambiguationText:(id)a3;
- (void)setHeadingText:(id)a3;
- (void)setImageView:(id)a3;
- (void)setShowsFavoriteStar:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleBoldedRange:(_NSRange)a3;
@end

@implementation SiriUIDisambiguationItem

+ (id)disambiguationItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)headingText
{
  return self->_headingText;
}

- (void)setHeadingText:(id)a3
{
}

- (NSString)extraDisambiguationText
{
  return self->_extraDisambiguationText;
}

- (void)setExtraDisambiguationText:(id)a3
{
}

- (NSString)extraDisambiguationSubText
{
  return self->_extraDisambiguationSubText;
}

- (void)setExtraDisambiguationSubText:(id)a3
{
}

- (_NSRange)titleBoldedRange
{
  NSUInteger length = self->_titleBoldedRange.length;
  NSUInteger location = self->_titleBoldedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTitleBoldedRange:(_NSRange)a3
{
  self->_titleBoldedRange = a3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (BOOL)showsFavoriteStar
{
  return self->_showsFavoriteStar;
}

- (void)setShowsFavoriteStar:(BOOL)a3
{
  self->_showsFavoriteStar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_extraDisambiguationSubText, 0);
  objc_storeStrong((id *)&self->_extraDisambiguationText, 0);
  objc_storeStrong((id *)&self->_headingText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
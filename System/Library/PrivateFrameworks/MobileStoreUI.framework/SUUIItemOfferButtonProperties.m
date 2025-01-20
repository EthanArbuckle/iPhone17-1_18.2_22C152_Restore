@interface SUUIItemOfferButtonProperties
- (BOOL)borderCornerRadiusMatchesHalfBoundingDimension;
- (BOOL)cancelRecognizer;
- (BOOL)hasBorderView;
- (BOOL)hasTitleLabel;
- (BOOL)progressIndeterminate;
- (BOOL)restores;
- (BOOL)universal;
- (CAFilter)borderCompositingFilter;
- (NSAttributedString)attributedText;
- (UIColor)borderBackgroundColor;
- (UIColor)borderColor;
- (UIColor)textColor;
- (UIImage)borderedImage;
- (UIImage)image;
- (double)alpha;
- (double)borderCornerRadius;
- (double)borderWidth;
- (double)progress;
- (int64_t)confirmationTitleStyle;
- (int64_t)progressType;
- (int64_t)titleStyle;
- (void)setAlpha:(double)a3;
- (void)setAttributedText:(id)a3;
- (void)setBorderBackgroundColor:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderCompositingFilter:(id)a3;
- (void)setBorderCornerRadius:(double)a3;
- (void)setBorderCornerRadiusMatchesHalfBoundingDimension:(BOOL)a3;
- (void)setBorderWidth:(double)a3;
- (void)setBorderedImage:(id)a3;
- (void)setCancelRecognizer:(BOOL)a3;
- (void)setConfirmationTitleStyle:(int64_t)a3;
- (void)setHasBorderView:(BOOL)a3;
- (void)setHasTitleLabel:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgressIndeterminate:(BOOL)a3;
- (void)setProgressType:(int64_t)a3;
- (void)setRestores:(BOOL)a3;
- (void)setTextColor:(id)a3;
- (void)setTitleStyle:(int64_t)a3;
- (void)setUniversal:(BOOL)a3;
@end

@implementation SUUIItemOfferButtonProperties

- (BOOL)hasBorderView
{
  return self->_hasBorderView;
}

- (void)setHasBorderView:(BOOL)a3
{
  self->_hasBorderView = a3;
}

- (UIColor)borderBackgroundColor
{
  return self->_borderBackgroundColor;
}

- (void)setBorderBackgroundColor:(id)a3
{
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (CAFilter)borderCompositingFilter
{
  return self->_borderCompositingFilter;
}

- (void)setBorderCompositingFilter:(id)a3
{
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (double)borderCornerRadius
{
  return self->_borderCornerRadius;
}

- (void)setBorderCornerRadius:(double)a3
{
  self->_borderCornerRadius = a3;
}

- (BOOL)borderCornerRadiusMatchesHalfBoundingDimension
{
  return self->_borderCornerRadiusMatchesHalfBoundingDimension;
}

- (void)setBorderCornerRadiusMatchesHalfBoundingDimension:(BOOL)a3
{
  self->_borderCornerRadiusMatchesHalfBoundingDimension = a3;
}

- (BOOL)hasTitleLabel
{
  return self->_hasTitleLabel;
}

- (void)setHasTitleLabel:(BOOL)a3
{
  self->_hasTitleLabel = a3;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (BOOL)universal
{
  return self->_universal;
}

- (void)setUniversal:(BOOL)a3
{
  self->_universal = a3;
}

- (int64_t)confirmationTitleStyle
{
  return self->_confirmationTitleStyle;
}

- (void)setConfirmationTitleStyle:(int64_t)a3
{
  self->_confirmationTitleStyle = a3;
}

- (int64_t)titleStyle
{
  return self->_titleStyle;
}

- (void)setTitleStyle:(int64_t)a3
{
  self->_titleStyle = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIImage)borderedImage
{
  return self->_borderedImage;
}

- (void)setBorderedImage:(id)a3
{
}

- (int64_t)progressType
{
  return self->_progressType;
}

- (void)setProgressType:(int64_t)a3
{
  self->_progressType = a3;
}

- (BOOL)progressIndeterminate
{
  return self->_progressIndeterminate;
}

- (void)setProgressIndeterminate:(BOOL)a3
{
  self->_progressIndeterminate = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (BOOL)cancelRecognizer
{
  return self->_cancelRecognizer;
}

- (void)setCancelRecognizer:(BOOL)a3
{
  self->_cancelRecognizer = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (BOOL)restores
{
  return self->_restores;
}

- (void)setRestores:(BOOL)a3
{
  self->_restores = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_borderCompositingFilter, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_borderBackgroundColor, 0);
}

@end
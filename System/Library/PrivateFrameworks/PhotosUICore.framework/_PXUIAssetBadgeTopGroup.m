@interface _PXUIAssetBadgeTopGroup
- (CGRect)buttonFrame;
- (CGRect)chevronImageFrame;
- (CGRect)frame;
- (CGRect)imageFrame;
- (CGRect)labelFrame;
- (PXAssetBadgeInfo)badgeInfo;
- (PXUIButton)button;
- (UIImageView)chevronImageView;
- (UIImageView)imageView;
- (UILabel)label;
- (UIView)backgroundView;
- (void)setBackgroundView:(id)a3;
- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3;
- (void)setButton:(id)a3;
- (void)setButtonFrame:(CGRect)a3;
- (void)setChevronImageFrame:(CGRect)a3;
- (void)setChevronImageView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImageFrame:(CGRect)a3;
- (void)setImageView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelFrame:(CGRect)a3;
@end

@implementation _PXUIAssetBadgeTopGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (void)setButtonFrame:(CGRect)a3
{
  self->_buttonFrame = a3;
}

- (CGRect)buttonFrame
{
  double x = self->_buttonFrame.origin.x;
  double y = self->_buttonFrame.origin.y;
  double width = self->_buttonFrame.size.width;
  double height = self->_buttonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLabelFrame:(CGRect)a3
{
  self->_labelFrame = a3;
}

- (CGRect)labelFrame
{
  double x = self->_labelFrame.origin.x;
  double y = self->_labelFrame.origin.y;
  double width = self->_labelFrame.size.width;
  double height = self->_labelFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setChevronImageFrame:(CGRect)a3
{
  self->_chevronImageFrame = a3;
}

- (CGRect)chevronImageFrame
{
  double x = self->_chevronImageFrame.origin.x;
  double y = self->_chevronImageFrame.origin.y;
  double width = self->_chevronImageFrame.size.width;
  double height = self->_chevronImageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setImageFrame:(CGRect)a3
{
  self->_imageFrame = a3;
}

- (CGRect)imageFrame
{
  double x = self->_imageFrame.origin.x;
  double y = self->_imageFrame.origin.y;
  double width = self->_imageFrame.size.width;
  double height = self->_imageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3
{
  long long v3 = *(_OWORD *)&a3->count;
  *(_OWORD *)&self->_badgeInfo.badges = *(_OWORD *)&a3->badges;
  *(_OWORD *)&self->_badgeInfo.count = v3;
}

- (PXAssetBadgeInfo)badgeInfo
{
  long long v3 = *(_OWORD *)&self[2].badges;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&self[1].count;
  *(_OWORD *)&retstr->count = v3;
  return self;
}

- (void)setButton:(id)a3
{
}

- (PXUIButton)button
{
  return self->_button;
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setChevronImageView:(id)a3
{
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

@end
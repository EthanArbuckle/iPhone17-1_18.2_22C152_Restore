@interface TVPBumperConfig
- (NSAttributedString)attributedAppleIDText;
- (NSAttributedString)attributedWarningText;
- (TVPBumperConfig)init;
- (TVPMediaItem)mediaItem;
- (UIImage)logoImage;
- (double)maxTextWidth;
- (double)textDwellTime;
- (void)setAttributedAppleIDText:(id)a3;
- (void)setAttributedWarningText:(id)a3;
- (void)setLogoImage:(id)a3;
- (void)setMaxTextWidth:(double)a3;
- (void)setMediaItem:(id)a3;
- (void)setTextDwellTime:(double)a3;
@end

@implementation TVPBumperConfig

- (TVPBumperConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)TVPBumperConfig;
  result = [(TVPBumperConfig *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_textDwellTime = xmmword_23702FC70;
  }
  return result;
}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (UIImage)logoImage
{
  return self->_logoImage;
}

- (void)setLogoImage:(id)a3
{
}

- (NSAttributedString)attributedWarningText
{
  return self->_attributedWarningText;
}

- (void)setAttributedWarningText:(id)a3
{
}

- (NSAttributedString)attributedAppleIDText
{
  return self->_attributedAppleIDText;
}

- (void)setAttributedAppleIDText:(id)a3
{
}

- (double)textDwellTime
{
  return self->_textDwellTime;
}

- (void)setTextDwellTime:(double)a3
{
  self->_textDwellTime = a3;
}

- (double)maxTextWidth
{
  return self->_maxTextWidth;
}

- (void)setMaxTextWidth:(double)a3
{
  self->_maxTextWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedAppleIDText, 0);
  objc_storeStrong((id *)&self->_attributedWarningText, 0);
  objc_storeStrong((id *)&self->_logoImage, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

@end
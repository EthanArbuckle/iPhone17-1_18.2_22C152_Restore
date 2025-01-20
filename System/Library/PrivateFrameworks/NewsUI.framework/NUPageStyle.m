@interface NUPageStyle
- (BOOL)hideToolbar;
- (BOOL)isEqual:(id)a3;
- (NSString)nextButtonTitle;
- (NSString)title;
- (NUPageStyle)init;
- (UIImage)titleImage;
- (void)setHideToolbar:(BOOL)a3;
- (void)setNextButtonTitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleImage:(id)a3;
@end

@implementation NUPageStyle

- (NUPageStyle)init
{
  v3.receiver = self;
  v3.super_class = (Class)NUPageStyle;
  result = [(NUPageStyle *)&v3 init];
  if (result) {
    result->_hideToolbar = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (void)setTitleImage:(id)a3
{
}

- (NSString)nextButtonTitle
{
  return self->_nextButtonTitle;
}

- (void)setNextButtonTitle:(id)a3
{
}

- (BOOL)hideToolbar
{
  return self->_hideToolbar;
}

- (void)setHideToolbar:(BOOL)a3
{
  self->_hideToolbar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButtonTitle, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end
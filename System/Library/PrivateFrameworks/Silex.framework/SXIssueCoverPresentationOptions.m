@interface SXIssueCoverPresentationOptions
- (BOOL)videoPlaybackEnabled;
- (CGSize)size;
- (SXIssueCoverPresentationOptions)initWithSize:(CGSize)a3 videoPlaybackEnabled:(BOOL)a4 parentBackgroundColor:(id)a5;
- (UIColor)parentBackgroundColor;
@end

@implementation SXIssueCoverPresentationOptions

- (SXIssueCoverPresentationOptions)initWithSize:(CGSize)a3 videoPlaybackEnabled:(BOOL)a4 parentBackgroundColor:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXIssueCoverPresentationOptions;
  v10 = [(SXIssueCoverPresentationOptions *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_size.CGFloat width = width;
    v10->_size.CGFloat height = height;
    v10->_videoPlaybackEnabled = a4;
    if (v9)
    {
      v12 = (UIColor *)v9;
    }
    else
    {
      v12 = [MEMORY[0x263F1C550] whiteColor];
    }
    parentBackgroundColor = v11->_parentBackgroundColor;
    v11->_parentBackgroundColor = v12;
  }
  return v11;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)videoPlaybackEnabled
{
  return self->_videoPlaybackEnabled;
}

- (UIColor)parentBackgroundColor
{
  return self->_parentBackgroundColor;
}

- (void).cxx_destruct
{
}

@end
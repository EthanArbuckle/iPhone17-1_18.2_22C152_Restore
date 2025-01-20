@interface VUIDownloadButtonProperties
- (BOOL)hasBorder;
- (BOOL)hasImage;
- (BOOL)hasTitle;
- (BOOL)isEnabled;
- (BOOL)isInderminate;
- (NSString)title;
- (UIImage)image;
- (double)progress;
- (unint64_t)downloadState;
- (void)setDownloadState:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHasBorder:(BOOL)a3;
- (void)setHasImage:(BOOL)a3;
- (void)setHasTitle:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setIndeterminate:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation VUIDownloadButtonProperties

- (BOOL)hasBorder
{
  return self->_hasBorder;
}

- (void)setHasBorder:(BOOL)a3
{
  self->_hasBorder = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (void)setHasImage:(BOOL)a3
{
  self->_hasImage = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (BOOL)hasTitle
{
  return self->_hasTitle;
}

- (void)setHasTitle:(BOOL)a3
{
  self->_hasTitle = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isInderminate
{
  return self->_indeterminate;
}

- (void)setIndeterminate:(BOOL)a3
{
  self->_indeterminate = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (unint64_t)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(unint64_t)a3
{
  self->_downloadState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
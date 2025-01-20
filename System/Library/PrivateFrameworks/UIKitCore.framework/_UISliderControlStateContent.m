@interface _UISliderControlStateContent
- (BOOL)isEmpty;
- (UIImage)maxTrack;
- (UIImage)minTrack;
- (UIImage)thumb;
- (void)setMaxTrack:(id)a3;
- (void)setMinTrack:(id)a3;
- (void)setThumb:(id)a3;
@end

@implementation _UISliderControlStateContent

- (BOOL)isEmpty
{
  return !self->_thumb && !self->_minTrack && self->_maxTrack == 0;
}

- (UIImage)thumb
{
  return self->_thumb;
}

- (void)setThumb:(id)a3
{
}

- (UIImage)minTrack
{
  return self->_minTrack;
}

- (void)setMinTrack:(id)a3
{
}

- (UIImage)maxTrack
{
  return self->_maxTrack;
}

- (void)setMaxTrack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxTrack, 0);
  objc_storeStrong((id *)&self->_minTrack, 0);
  objc_storeStrong((id *)&self->_thumb, 0);
}

@end
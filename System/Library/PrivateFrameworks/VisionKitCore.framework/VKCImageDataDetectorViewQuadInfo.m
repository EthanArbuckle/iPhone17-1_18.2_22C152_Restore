@interface VKCImageDataDetectorViewQuadInfo
- (UIBezierPath)combinedElementHighlightPath;
- (VKQuad)buttonQuad;
- (VKQuad)ddBottomQuad;
- (void)setButtonQuad:(id)a3;
- (void)setCombinedElementHighlightPath:(id)a3;
- (void)setDdBottomQuad:(id)a3;
@end

@implementation VKCImageDataDetectorViewQuadInfo

- (VKQuad)buttonQuad
{
  return self->_buttonQuad;
}

- (void)setButtonQuad:(id)a3
{
}

- (VKQuad)ddBottomQuad
{
  return self->_ddBottomQuad;
}

- (void)setDdBottomQuad:(id)a3
{
}

- (UIBezierPath)combinedElementHighlightPath
{
  return self->_combinedElementHighlightPath;
}

- (void)setCombinedElementHighlightPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedElementHighlightPath, 0);
  objc_storeStrong((id *)&self->_ddBottomQuad, 0);
  objc_storeStrong((id *)&self->_buttonQuad, 0);
}

@end
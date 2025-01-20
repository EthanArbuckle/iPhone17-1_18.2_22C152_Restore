@interface PUReviewAdjustmentOutput
- (NSURL)_baseImageURL;
- (NSURL)_baseVideoURL;
- (NSURL)renderedImageFileURL;
- (NSURL)renderedVideoFileURL;
- (int64_t)_adjustmentInputBaseVersion;
- (void)_setAdjustmentInputBaseVersion:(int64_t)a3;
- (void)_setBaseImageURL:(id)a3;
- (void)_setBaseVideoURL:(id)a3;
- (void)_setRenderedImageFileURL:(id)a3;
- (void)_setRenderedVideoFileURL:(id)a3;
@end

@implementation PUReviewAdjustmentOutput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__baseVideoURL, 0);
  objc_storeStrong((id *)&self->__baseImageURL, 0);
  objc_storeStrong((id *)&self->_renderedVideoFileURL, 0);
  objc_storeStrong((id *)&self->_renderedImageFileURL, 0);
}

- (void)_setBaseVideoURL:(id)a3
{
}

- (NSURL)_baseVideoURL
{
  return self->__baseVideoURL;
}

- (void)_setBaseImageURL:(id)a3
{
}

- (NSURL)_baseImageURL
{
  return self->__baseImageURL;
}

- (void)_setAdjustmentInputBaseVersion:(int64_t)a3
{
  self->__adjustmentInputBaseVersion = a3;
}

- (int64_t)_adjustmentInputBaseVersion
{
  return self->__adjustmentInputBaseVersion;
}

- (void)_setRenderedVideoFileURL:(id)a3
{
}

- (NSURL)renderedVideoFileURL
{
  return self->_renderedVideoFileURL;
}

- (void)_setRenderedImageFileURL:(id)a3
{
}

- (NSURL)renderedImageFileURL
{
  return self->_renderedImageFileURL;
}

@end